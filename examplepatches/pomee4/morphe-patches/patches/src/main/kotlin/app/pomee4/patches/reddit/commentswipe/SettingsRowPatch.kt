/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val ROW_EXTENSION_CLASS = "Lapp/pomee4/extension/commentswipe/SettingsRow;"

private const val ICON_DRAWABLE = "pomee4_comment_swipe_settings_icon.xml"

/**
 * Order of the row in the General section: right after the Morphe row (-1000), before the rows
 * of the app (0 and up).
 */
private const val SETTING_ROW_ORDER = -999

/**
 * Packed size of a 20dp icon, the size of the Reddit settings icons (width shl 32 or height).
 */
private const val SETTING_ICON_SIZE = "0x1400000014L"

private val settingsIconPatch = resourcePatch {
    execute {
        val drawable = get("res/drawable/$ICON_DRAWABLE")
        drawable.parentFile.mkdirs()
        val source = SettingsRowResource::class.java.classLoader
            .getResourceAsStream("commentswipe/drawable/$ICON_DRAWABLE")
            ?: throw PatchException("Missing resource $ICON_DRAWABLE")
        source.use { input -> drawable.outputStream().use { input.copyTo(it) } }
    }
}

private object SettingsRowResource

/**
 * Adds a "Comment swipe" row to the Reddit settings, in the General section after the Morphe row,
 * that opens the comment swipe settings. Made like the Morphe row of the Morphe settings patch, and
 * uses the row methods that patch adds (Reddit 2026.30.0+).
 */
internal val settingsRowPatch = bytecodePatch {
    dependsOn(settingsIconPatch)

    // The comment swipe actions patch depends on this patch, so the extension is added here.
    extendWith("extensions/commentswipe.mpe")

    execute {
        val keyField = SettingRowConstructorFingerprint.let {
            it.method.getInstruction<ReferenceInstruction>(it.instructionMatches[1].index).reference
        } as FieldReference

        // Add the row to the rows of the app.
        SettingsRegistryConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $ROW_EXTENSION_CLASS->addSettingRow(Ljava/util/Set;)Ljava/util/Set;
                move-result-object p1
            """
        )

        // Title, click action and icon.
        SettingRowContentFingerprint.method.apply {
            // Looked up again instead of using the match index: the Morphe settings patch may
            // already have added instructions before the call.
            val callIndex = instructions.indexOfLast { it.isSettingRowCall() }
            if (callIndex < 0) throw PatchException("Settings row composable call not found")

            val call = getInstruction<RegisterRangeInstruction>(callIndex)
            val titleRegister = call.startRegister
            val onClickRegister = call.startRegister + 1
            val iconRegister = call.startRegister + 5

            implementSettingIconComposable()

            // The class is shared by several rows. Only change this row.
            val free = findFreeRegister(callIndex, titleRegister, onClickRegister, iconRegister)
            // iget-object only takes registers v0-v15, and p0 is a high register here.
            if (free > 15) throw PatchException("No free low register in $this")
            addInstructionsWithLabels(
                callIndex,
                """
                    move-object/from16 v$free, p0
                    iget-object v$free, v$free, $keyField
                    invoke-static/range { v$free .. v$free }, $ROW_EXTENSION_CLASS->isSettingRow(Ljava/lang/String;)Z
                    move-result v$free
                    if-eqz v$free, :original
                    invoke-static { }, $ROW_EXTENSION_CLASS->getSettingLabel()Ljava/lang/String;
                    move-result-object v$titleRegister
                    invoke-static/range { v$onClickRegister .. v$onClickRegister }, $ROW_EXTENSION_CLASS->getSettingOnClick(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                    move-result-object v$onClickRegister
                    invoke-static { }, $ROW_EXTENSION_CLASS->getSettingIconComposable()Lkotlin/jvm/functions/Function2;
                    move-result-object v$iconRegister
                    :original
                    nop
                """
            )
        }

        // Position. Rows are sorted by the order of the section, then by the order of the row.
        SettingRowSectionFingerprint.method.overrideForRow(
            keyField,
            """
                sget-object v0, $USER_SETTINGS_SECTION_CLASS->General:$USER_SETTINGS_SECTION_CLASS
                return-object v0
            """
        )

        SettingRowOrderFingerprint.method.overrideForRow(
            keyField,
            """
                const/16 v0, $SETTING_ROW_ORDER
                return v0
            """
        )
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isSettingRowCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return reference.returnType == "V" &&
        reference.parameterTypes.map { it.toString() } .let { types ->
            types.size == SETTING_ROW_PARAMETERS.size &&
                types.zip(SETTING_ROW_PARAMETERS).all { (type, expected) ->
                    if (expected == "L") type.startsWith("L") else type == expected
                }
        }
}

/**
 * Returns a different value from a getter of a settings row class, if the row is this row.
 */
private fun MutableMethod.overrideForRow(keyField: FieldReference, returnInstructions: String) {
    // The register v0 is used before the original code assigns it.
    if (implementation!!.registerCount <= MethodUtil.getParameterRegisterCount(this)) {
        throw PatchException("No free register in $this")
    }
    // iget-object only takes registers v0-v15.
    if (implementation!!.registerCount - MethodUtil.getParameterRegisterCount(this) > 15) {
        throw PatchException("p0 is not a low register in $this")
    }

    addInstructionsWithLabels(
        0,
        """
            iget-object v0, p0, $keyField
            invoke-static { v0 }, $ROW_EXTENSION_CLASS->isSettingRow(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :original
            $returnInstructions
            :original
            nop
        """
    )
}

/**
 * Implements the extension placeholder that draws the row icon with the icon composable of the
 * Reddit icon set, which loads a vector drawable resource.
 */
private fun BytecodePatchContext.implementSettingIconComposable() {
    val iconDataType = IconDataToStringFingerprint.originalClassDef.type
    val iconComposable = IconComposableFingerprint(iconDataType).originalMethod
    val composerType = iconComposable.parameterTypes[5]

    mutableClassDefBy(ROW_EXTENSION_CLASS).apply {
        val placeholder = methods.single { it.name == "drawSettingIcon" }
        methods.remove(placeholder)

        // Parameters: composer, drawable resource id.
        ImmutableMethod(
            type,
            placeholder.name,
            listOf(
                ImmutableMethodParameter("Ljava/lang/Object;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            placeholder.accessFlags,
            null,
            null,
            MutableMethodImplementation(11),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    new-instance v0, $iconDataType
                    const-wide v1, $SETTING_ICON_SIZE
                    const/4 v3, 0x0
                    invoke-direct { v0, v1, v2, p1, v3 }, $iconDataType-><init>(JIZ)V

                    # Icon, content description, modifier, tint, unknown, composer, changed, defaults.
                    # Same arguments as the settings icons of the app, with the default modifier and tint.
                    const/4 v1, 0x0
                    const/4 v2, 0x0
                    const-wide/16 v3, 0x0
                    const/4 v5, 0x0
                    move-object v6, p0
                    check-cast v6, $composerType
                    const/16 v7, 0x30
                    const/16 v8, 0x1c
                    invoke-static/range { v0 .. v8 }, ${iconComposable.definingClass}->${iconComposable.name}(${iconComposable.parameterTypes.joinToString("")})V
                    return-void
                """
            )
        }.let(methods::add)
    }
}
