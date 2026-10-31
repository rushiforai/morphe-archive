package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.returnEarly

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val phenotypeFlagManagerPatch = bytecodePatch(
    name = "Flag manager & Toolkit",
    description = "Enables an in-app flag manager and Morphe toolkit in Photos Settings to toggle experimental UI redesigns, video editor tools, and feature flags.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    val componentsOption = stringOption(
        key = "components",
        default = "flags",
        values = mapOf(
            "flags" to "Flag manager only",
            "both" to "Both (Flag manager & Toolkit)",
            "toolkit" to "Toolkit only",
        ),
        title = "Enabled components",
        description = "Choose which components to show: Flag Manager, Morphe Toolkit, or Both.",
    )

    execute {
        val selected = (componentsOption.value ?: componentsOption.default ?: "flags").lowercase()
        val injectMethod = when (selected) {
            "flags" -> "injectSettingsCardFlags"
            "toolkit" -> "injectSettingsCardToolkit"
            else -> "injectSettingsCardBoth"
        }
        SettingsActivityV2OnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, Lapp/morphe/extension/shared/patches/PhenotypeFlagManager;->$injectMethod(Landroid/app/Activity;)V"
        )

        // 1. Unconditionally enable the 7th item (below Privacy) in the Settings Compose list
        val menuBuilderMethod = SettingsMenuBuilderFingerprint.methodOrNull
        if (menuBuilderMethod != null) {
            val instructions = menuBuilderMethod.implementation?.instructions
            if (instructions != null) {
                val rAddIdx = instructions.indexOfFirst {
                    it is ReferenceInstruction && it.reference.toString().contains("->r:Lbgcj;")
                }
                if (rAddIdx > 0) {
                    for (i in (rAddIdx - 1) downTo 0) {
                        val op = instructions.elementAt(i).opcode
                        if (op == Opcode.IF_EQZ || op == Opcode.IF_NEZ) {
                            menuBuilderMethod.replaceInstruction(i, "nop")
                            break
                        }
                    }
                }
            }
        }

        // 2. Patch <clinit> of the menu builder class to set the icon to tune icon (0x7f080b2b)
        val clinitMethod = SettingsMenuBuilderClinitFingerprint.methodOrNull
        if (clinitMethod != null) {
            val clinitInstructions = clinitMethod.implementation?.instructions
            if (clinitInstructions != null) {
                val rInitIdx = clinitInstructions.indexOfFirst {
                    it is ReferenceInstruction && it.reference.toString().contains("->r:Lbgcj;")
                }
                if (rInitIdx > 0) {
                    for (i in (rInitIdx - 1) downTo 0) {
                        val ins = clinitInstructions.elementAt(i)
                        if (ins is NarrowLiteralInstruction &&
                            ins is OneRegisterInstruction &&
                            (ins.narrowLiteral.toLong() and 0xffff0000L) == 0x7f080000L) {
                            clinitMethod.replaceInstruction(i, "const v${ins.registerA}, 0x7f080b2b")
                            break
                        }
                    }
                }
            }
        }

        // 2. Intercept Compose stringResource to display "Morphe" for the 7th settings item
        val stringMethod = StringResourceResolverFingerprint.methodOrNull
        if (stringMethod != null) {
            stringMethod.addInstructions(
                0,
                """
                invoke-static {p0}, Lapp/morphe/extension/shared/patches/PhenotypeFlagManager;->resolveSettingsString(I)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :cond_morphe_str
                return-object v0
                :cond_morphe_str
                """.trimIndent()
            )
        }

        // 3. Hook InternalActivity.onCreate to host MorpheSettingsScreen immediately after super.onCreate
        val internalMethod = InternalActivityOnCreateFingerprint.methodOrNull
        if (internalMethod != null) {
            internalMethod.addInstructions(
                1,
                """
                invoke-static {p0}, Lapp/morphe/extension/shared/patches/PhenotypeFlagManager;->hookInternalActivity(Landroid/app/Activity;)V
                return-void
                """.trimIndent()
            )
        }

        // 4. Hook About activity
        if (PhotosAboutSettingsActivityV2OnCreateFingerprint.methodOrNull != null) {
            PhotosAboutSettingsActivityV2OnCreateFingerprint.method.addInstruction(
                0,
                "invoke-static {p0}, Lapp/morphe/extension/shared/patches/PhenotypeFlagManager;->hookAboutActivity(Landroid/app/Activity;)V"
            )
        }
    }
}
