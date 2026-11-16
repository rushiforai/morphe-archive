package app.morphe.patches.googlephotos.misc.flags

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.returnEarly

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.hasResourceId
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val phenotypeFlagManagerPatch = bytecodePatch(
    name = "Flag manager & Toolkit",
    description = "Enables an in-app flag manager and Morphe toolkit in Photos Settings to toggle experimental UI redesigns, video editor tools, and feature flags.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)

    execute {
        SettingsActivityV2OnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, Lapp/morphe/extension/shared/patches/PhenotypeFlagManager;->injectSettingsCardBoth(Landroid/app/Activity;)V"
        )


        // 1. Unconditionally enable the 7th item (below Privacy) in the Settings Compose list
        val menuBuilderMethod = SettingsMenuBuilderFingerprint.methodOrNull
        if (menuBuilderMethod != null) {
            val instructions = menuBuilderMethod.implementation?.instructions
            if (instructions != null) {
                val rAddIdx = instructions.indexOfFirst {
                    it is ReferenceInstruction && it.reference.toString().contains("->r:L")
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

        // 2. Patch <clinit> of the menu builder class to set the icon to tune icon
        val clinitMethod = SettingsMenuBuilderClinitFingerprint.methodOrNull
        if (clinitMethod != null) {
            val clinitInstructions = clinitMethod.implementation?.instructions
            if (clinitInstructions != null) {
                val rInitIdx = clinitInstructions.indexOfFirst {
                    it is ReferenceInstruction && it.reference.toString().contains("->r:L")
                }
                if (rInitIdx > 0) {
                    val tuneIconId = when {
                        hasResourceId(ResourceType.DRAWABLE, "quantum_gm_ic_tune_vd_theme_24") ->
                            resourceId(ResourceType.DRAWABLE, "quantum_gm_ic_tune_vd_theme_24")
                        hasResourceId(ResourceType.DRAWABLE, "gs_discover_tune_vd_theme_24") ->
                            resourceId(ResourceType.DRAWABLE, "gs_discover_tune_vd_theme_24")
                        else -> null
                    }
                    if (tuneIconId != null) {
                        for (i in (rInitIdx - 1) downTo 0) {
                            val ins = clinitInstructions.elementAt(i)
                            if (ins is NarrowLiteralInstruction &&
                                ins is OneRegisterInstruction &&
                                (ins.narrowLiteral.toLong() and 0xffff0000L) == 0x7f080000L) {
                                clinitMethod.replaceInstruction(i, "const v${ins.registerA}, 0x${tuneIconId.toString(16)}")
                                break
                            }
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

        // 5. Hook FloatingTabBarLayout.onMeasure to enable dynamic Floating Menu Bar style switching
        val layoutClassDef = mutableClassDefBy("Lcom/google/android/apps/photos/tabbar/FloatingTabBarLayout;")
        val onMeasureMethod = layoutClassDef.methods.firstOrNull { it.name == "onMeasure" }
        if (onMeasureMethod != null) {
            val instructions = onMeasureMethod.instructions.toList()
            var hookIndex = -1
            var enumType: String? = null
            var reg: Int? = null

            for (i in instructions.indices) {
                val instr = instructions[i]
                if (instr.opcode == Opcode.INVOKE_VIRTUAL || instr.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
                    val methodRef = (instr as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (methodRef.definingClass == "Lcom/google/android/apps/photos/tabbar/FloatingTabBarLayout;" &&
                        methodRef.parameterTypes.size == 1 &&
                        methodRef.returnType == "V"
                    ) {
                        enumType = methodRef.parameterTypes[0].toString()
                        for (j in (i - 1) downTo maxOf(0, i - 4)) {
                            val prevInstr = instructions[j]
                            if (prevInstr.opcode == Opcode.SGET_OBJECT) {
                                reg = (prevInstr as OneRegisterInstruction).registerA
                                hookIndex = i
                                break
                            }
                        }
                        break
                    }
                }
            }

            if (hookIndex != -1 && enumType != null && reg != null) {
                onMeasureMethod.addInstructions(
                    hookIndex,
                    """
                        invoke-static { v$reg, p0 }, Lapp/morphe/extension/shared/patches/FloatingTabBarHelper;->getInitialMode(Ljava/lang/Enum;Landroid/view/View;)Ljava/lang/Enum;
                        move-result-object v$reg
                        check-cast v$reg, $enumType
                    """.trimIndent(),
                )
            }
        }
    }
}
