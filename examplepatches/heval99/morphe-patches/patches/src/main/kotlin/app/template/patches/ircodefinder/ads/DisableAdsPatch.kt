package app.template.patches.ircodefinder.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IR_CODE_FINDER
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LINEAR_LAYOUT = "Landroid/widget/LinearLayout;"

/**
 * IrCode Finder shows Yandex Mobile Ads (Google only through Yandex mediation): four banners built
 * by one helper and one interstitial on MainActivity. The Yandex SDK initialization, the premium
 * and billing logic and Play Integrity are not touched.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_IR_CODE_FINDER)

    execute {
        // 1. The banner helper's constructor hides the container and returns right after it
        // stores it, so no BannerAdView is built or loaded and the refresh coroutine never starts.
        // Its destroy method null-checks the banner and the coroutine job.
        BannerHelperConstructorFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            // p0 sits below the four single-word parameters (String, LinearLayout, boolean, int).
            val thisRegister = implementation!!.registerCount - 5
            val superCall = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT &&
                    ((it as ReferenceInstruction).reference as MethodReference).name == "<init>" &&
                    (it as FiveRegisterInstruction).registerC == thisRegister
            }
            val containerStore = instructions.withIndex().firstOrNull { (index, instruction) ->
                index > superCall && instruction.opcode == Opcode.IPUT_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).type == LINEAR_LAYOUT
            }?.index
            if (superCall < 0 || containerStore == null) {
                throw PatchException("Disable ads: no container store after the super call in $definingClass.<init>")
            }
            addInstructionsChecked(
                containerStore + 1,
                """
                    const/16 v0, 0x8
                    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """,
            )
        }

        // 2. The interstitial loader returns kotlin.Unit at once, as its own load-failure path
        // does, so no InterstitialAdLoader is built and nothing is shown. Unit is R8-renamed, so
        // it is found by its toString; null is an equally safe answer here (both callers ignore
        // the result), so it is the fallback.
        val unitClass = KotlinUnitToStringFingerprint.originalClassDefOrNull
        val unitField = unitClass?.fields?.singleOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.type == unitClass.type
        }
        InterstitialLoadFingerprint.method.addInstructionsChecked(
            0,
            if (unitField != null) {
                """
                    sget-object v0, ${unitClass.type}->${unitField.name}:${unitClass.type}
                    return-object v0
                """
            } else {
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            },
        )
    }
}
