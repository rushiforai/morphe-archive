package app.morphe.patches.music.layout.overlayfilter

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.music.utils.patch.PatchList.HIDE_OVERLAY_FILTER
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_CLASS = "$GENERAL_PATH/OverlayFilterPatch;"
private const val DIALOG = "Landroid/app/Dialog;"

private val playerDialogTags = mapOf(
    "Playback speed" to "PLAYBACK_RATE_MENU_BOTTOM_SHEET_FRAGMENT",
    "Quality" to "VIDEO_QUALITIES_MENU_BOTTOM_SHEET_FRAGMENT",
    "Sleep timer" to "SLEEP_TIMER_MENU_BOTTOM_SHEET_FRAGMENT",
    "Sleep timer status" to "SLEEP_TIMER_STATUS_BOTTOM_SHEET_FRAGMENT",
)

private fun BytecodePatchContext.hookPlayerDialog(tag: String): Boolean {
    val lookup = playerDialogLookupFingerprint(tag).matchAllOrNull()?.singleOrNull() ?: return false
    val type = lookup.instructionMatches.last().instruction.getReference<TypeReference>()?.type ?: return false
    val fragment = mutableClassDefByOrNull(type) ?: return false
    val parent = fragment.superclass ?: return false

    val lifecycle = generateSequence(classDefByOrNull(parent)) { classDef ->
        classDef.superclass?.let(::classDefByOrNull)
    }.firstNotNullOfOrNull { PlayerDialogShowFingerprint.matchOrNull(it) } ?: return false
    val instructions = lifecycle.originalMethod.implementation?.instructions ?: return false
    val dialog = instructions.asSequence()
        .filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }
        .filter { it.type == DIALOG }
        .distinct()
        .singleOrNull() ?: return false

    val updateDim = """
        iget-object v0, p0, ${dialog.definingClass}->${dialog.name}:$DIALOG
        invoke-static {v0}, $EXTENSION_CLASS->updateDialogDim($DIALOG)V
    """

    // The stock DialogFragment shows a regular Dialog. Run after onStart has applied its
    // window attributes, without changing the panel layout, dim amount, or animation.
    val onStart = fragment.methods.firstOrNull {
        it.name == "onStart" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    if (onStart != null) {
        val implementation = onStart.implementation ?: return false
        val first = implementation.instructions.firstOrNull() ?: return false
        val superCall = first.getReference<MethodReference>()
        if (first.opcode != Opcode.INVOKE_SUPER || superCall?.name != "onStart" ||
            implementation.registerCount !in 2..16
        ) return false

        onStart.addInstructions(1, updateDim)
    } else {
        fragment.methods.add(ImmutableMethod(
            type, "onStart", emptyList(), "V", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(0, """
                invoke-super {p0}, $parent->onStart()V
                $updateDim
                return-void
            """)
        })
    }

    return true
}

@Suppress("unused")
val overlayFilterPatch = bytecodePatch(
    HIDE_OVERLAY_FILTER.title,
    HIDE_OVERLAY_FILTER.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(settingsPatch, resourceMappingPatch)

    execute {
        val bottomSheet = BottomSheetDialogFingerprint.classDefOrNull?.let {
            BottomSheetDialogOnStartFingerprint.matchOrNull(it)
        }
        bottomSheet?.let { match ->
            // The layout is cached but onStart is called again when the same dialog is shown.
            match.method.addInstruction(
                match.instructionMatches.single().index + 1,
                "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->updateDialogDim(Landroid/app/Dialog;)V"
            )
        }

        if (bottomSheet == null) {
            printWarn("Hide overlay filter: bottom sheet window hook unavailable.")
        }

        // The same scrim color is used by unrelated views. Hook only the contextual menu's drawing.
        val scrim = ContextualMenuScrimConstructorFingerprint.classDefOrNull?.let {
            ContextualMenuScrimDrawFingerprint.matchOrNull(it)
        }
        if (scrim != null) {
            val index = scrim.instructionMatches.single().index
            val call = scrim.method.getInstruction<FiveRegisterInstruction>(index)
            scrim.method.replaceInstruction(
                index,
                "invoke-static {v${call.registerC}, v${call.registerD}}, " +
                        "$EXTENSION_CLASS->drawMenuScrim(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V"
            )
        } else {
            printWarn("Hide overlay filter: contextual menu scrim hook unavailable.")
        }
        val playerDialogs = playerDialogTags.count { (role, tag) ->
            hookPlayerDialog(tag).also { hooked ->
                if (!hooked) printWarn("Hide overlay filter: $role dialog window hook unavailable.")
            }
        }

        if (bottomSheet == null && scrim == null && playerDialogs == 0) return@execute

        addSwitchPreference(CategoryType.PLAYER, "revanced_hide_overlay_filter", "false")
        updatePatchStatus(HIDE_OVERLAY_FILTER)
    }
}
