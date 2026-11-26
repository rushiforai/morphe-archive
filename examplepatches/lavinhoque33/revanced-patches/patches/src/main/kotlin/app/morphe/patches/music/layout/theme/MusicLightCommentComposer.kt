/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.patches.music.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getReference
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val VIEW = "Landroid/view/View;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val COMMENTS_PANEL_ID = "music-comment-panel"

// Older releases have a different engagement panel host; don't attach to an unverified presenter.
private val CommentsPanelFingerprint = Fingerprint(
    strings = listOf(COMMENTS_PANEL_ID),
    parameters = emptyList(),
    returnType = "V",
    custom = { _, clazz -> clazz.fields.any { it.type == "Landroid/widget/FrameLayout;" } },
)

private val ClassStyleBinderFingerprint = Fingerprint(
    strings = listOf("Failed to get activeThemeKey from conversionContext."),
    returnType = "V",
)

private val ComponentStyleBinderFingerprint = Fingerprint(
    strings = listOf("deprecated_option_force_clip_bounds"),
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.getOrNull(3) == "Ljava/lang/Object;" },
)

private val ExpandedComposerFingerprint = Fingerprint(
    strings = listOf("Failed to merge HintRenderer proto", "enableTransparentBackground"),
    parameters = listOf("Landroid/view/LayoutInflater;", VIEW_GROUP, "Landroid/os/Bundle;"),
    returnType = VIEW,
    custom = { method, _ -> method.name == "onCreateView" },
)

/** Mark just the Comments panel’s footer presenter and adapt its stock monochrome style fills. */
internal fun BytecodePatchContext.installLightCommentComposer(contextType: String): MethodReference? = runCatching {
    val viewGetter = classDefBy(contextType).methods.single {
        it.returnType == VIEW && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    val classStyle = ClassStyleBinderFingerprint.method
    val componentStyle = ComponentStyleBinderFingerprint.method
    check(listOf(classStyle, componentStyle).all { it.parameterTypes[1] == contextType })

    val directPaint = classStyle.implementation!!.instructions.zipWithNext().withIndex().single { (_, pair) ->
        val (write, bind) = pair
        write.opcode == Opcode.IPUT && bind.opcode == Opcode.INVOKE_VIRTUAL &&
                bind.getReference<MethodReference>()?.parameterTypes == listOf(DRAWABLE) &&
                (write as TwoRegisterInstruction).registerB == (bind as FiveRegisterInstruction).registerD
    }
    val fillField = directPaint.value.first.getReference<FieldReference>()!!
    val componentPaintIndex = componentStyle.implementation!!.instructions.withIndex().single { (_, instruction) ->
        instruction.opcode == Opcode.IPUT && instruction.getReference<FieldReference>() == fillField
    }.index
    val paintSites = listOf(classStyle to directPaint.index, componentStyle to componentPaintIndex)
    val fillSites = paintSites.map { (method, index) ->
        val write = method.getInstruction<TwoRegisterInstruction>(index)
        val paint = write.registerA
        val presenter = method.findFreeRegister(index, paint, write.registerB)
        check(presenter < 16)
        val callback = "$MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->styleCommentComposerFill(${VIEW}I)I"
        Triple(method, index, """
            invoke-static {}, $MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->isEnabled()Z
            move-result v$presenter
            if-eqz v$presenter, :stock_fill

            invoke-virtual/range {p2 .. p2}, $viewGetter
            move-result-object v$presenter
            invoke-static {v$presenter, v$paint}, $callback
            move-result v$paint
            :stock_fill
            nop
        """)
    }

    val panel = CommentsPanelFingerprint.match()
    val identity = panel.method.implementation!!.instructions
    val idIndex = identity.indexOfFirst { it.getReference<StringReference>()?.string == COMMENTS_PANEL_ID }
    check(idIndex >= 2 && identity[idIndex - 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    val readPanelId = identity[idIndex - 2].getReference<MethodReference>()!!
    check(identity[idIndex - 2].opcode == Opcode.INVOKE_STATIC && readPanelId.returnType == "Ljava/lang/String;")
    val panelType = readPanelId.parameterTypes.single()
    val panelData = identity.first {
        it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.type == panelType
    }.getReference<FieldReference>()!!

    val footerBinds = panel.classDef.methods.filter { it.returnType == "V" && it.parameterTypes.lastOrNull() == "I" }
        .flatMap { method ->
            method.implementation?.instructions.orEmpty().withIndex().mapNotNull { (index, instruction) ->
                val bind = instruction.getReference<MethodReference>() ?: return@mapNotNull null
                if (instruction.opcode != Opcode.INVOKE_INTERFACE || bind.returnType != "V" ||
                    bind.parameterTypes.size != 3 || bind.parameterTypes.first() != "Ljava/lang/Object;"
                ) return@mapNotNull null

                val wrapper = classDefBy(bind.definingClass).methods.singleOrNull {
                    it.returnType == VIEW_GROUP && it.parameterTypes.isEmpty()
                } ?: return@mapNotNull null
                Triple(method, index, wrapper)
            }
        }
    val (footerBind, bindIndex, getWrapper) = footerBinds.single()
    val footerBindCall = footerBind.getInstruction(bindIndex).getReference<MethodReference>()!!
    val bindSites = panel.classDef.methods.mapNotNull { method ->
        val panelSource = when {
            method == footerBind -> "p0"
            method.parameterTypes.firstOrNull() == panelData.type -> "p1"
            else -> return@mapNotNull null
        }
        val index = method.implementation?.instructions?.indexOfFirst {
            it.opcode == Opcode.INVOKE_INTERFACE && it.getReference<MethodReference>() == footerBindCall
        } ?: return@mapNotNull null
        if (index < 0) return@mapNotNull null

        val bind = method.getInstruction<FiveRegisterInstruction>(index)
        val receiver = method.implementation!!.registerCount - method.parameterTypes.size - 1
        val source = if (panelSource == "p0") receiver else receiver + 1
        val used = intArrayOf(bind.registerC, bind.registerD, bind.registerE, bind.registerF, source)
        val panelId = method.findFreeRegister(index, *used)
        val wrapper = method.findFreeRegister(index, *used, panelId)
        check(maxOf(panelId, wrapper) < 16)

        // The update route already has the incoming panel proto; the simple bind reads the current one.
        val readPanel = if (panelSource == "p0") "iget-object v$wrapper, v$wrapper, $panelData" else ""
        // Keep the ID register null/String on both paths; ART does not narrow the tested proto to null.
        val callback = "$MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->markCommentComposer(${VIEW_GROUP}Ljava/lang/String;)V"
        Triple(method, index, """
            invoke-static {}, $MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->isEnabled()Z
            move-result v$panelId
            if-eqz v$panelId, :footer_ready

            move-object/from16 v$wrapper, $panelSource
            $readPanel
            const/4 v$panelId, 0x0
            if-eqz v$wrapper, :footer_panel_id
            invoke-static {v$wrapper}, $readPanelId
            move-result-object v$panelId
            :footer_panel_id
            invoke-interface {v${bind.registerC}}, $getWrapper
            move-result-object v$wrapper
            invoke-static {v$wrapper, v$panelId}, $callback
            :footer_ready
            nop
        """)
    }
    check(bindSites.isNotEmpty())
    bindSites.forEach { (method, index, instructions) -> method.addInstructionsAtControlFlowLabel(index, instructions) }
    fillSites.forEach { (method, index, instructions) -> method.addInstructionsAtControlFlowLabel(index, instructions) }
    viewGetter
}.onFailure {
    printWarn("Music light theme: inline Comments composer styling is unavailable (${it.message}).")
}.getOrNull()

/** The composer_fragment renders its own Element, separate from both the panel footer and native dialogs. */
internal fun BytecodePatchContext.installLightExpandedCommentComposer() {
    runCatching {
        val method = ExpandedComposerFingerprint.method
        val instructions = method.implementation!!.instructions
        val bindIndex = instructions.indices.single { index ->
            val bind = instructions[index]
            val target = bind.getReference<MethodReference>()
            if (index < 2 || bind.opcode != Opcode.INVOKE_VIRTUAL || target == null || target.returnType != "V" ||
                target.parameterTypes.size != 2 || target.parameterTypes.first() != "[B" ||
                !target.parameterTypes[1].startsWith("L")
            ) return@single false

            val serialize = instructions[index - 2].getReference<MethodReference>()
            val bytes = instructions[index - 1]
            serialize?.name == "toByteArray" && serialize.returnType == "[B" &&
                    bytes.opcode == Opcode.MOVE_RESULT_OBJECT &&
                    (bytes as OneRegisterInstruction).registerA == (bind as FiveRegisterInstruction).registerD
        }
        val bind = method.getInstruction<FiveRegisterInstruction>(bindIndex)
        val wrapper = bind.getReference<MethodReference>()!!.definingClass
        check(classDefBy(wrapper).superclass == "Landroid/widget/FrameLayout;")

        // The wrapper's only child supplies the conversion context View. Mark it before the bind can convert styles.
        val callback = "$MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->markExpandedCommentComposer($VIEW_GROUP)V"
        method.addInstructionsAtControlFlowLabel(bindIndex, "invoke-static {v${bind.registerC}}, $callback")
    }.onFailure {
        printWarn("Music light theme: expanded Comments styling is unavailable (${it.message}).")
    }
}
