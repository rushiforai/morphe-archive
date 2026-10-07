package app.error404rt.patches.anixart

import app.error404rt.patches.shared.Constants.COMPATIBILITY_ANIXART
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// IMPORTANT: this file must not contain any dollar-sign characters.
// Smali strings are built with plain "+" concatenation on purpose: a previous build
// shipped the literal text of a string template into the smali compiler, which fails.

@Suppress("unused")
val anixartAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Смотрите аниме без отвлекающих баннеров рекламы.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIXART)

    val removeBannerAds by booleanOption(
        key = "removeBannerAds", default = true,
        title = "Баннерная реклама",
        description = "Убирает нижний рекламный баннер и надпись «Реклама»."
    )

    val removeInterstitialAds by booleanOption(
        key = "removeInterstitialAds", default = true,
        title = "Межстраничная реклама",
        description = "Блокирует рекламные interstitial-показы."
    )

    val removeKodikPreRoll by booleanOption(
        key = "removeKodikPreRoll", default = true,
        title = "Реклама перед Kodik",
        description = "Пропускает рекламный pre-roll перед началом воспроизведения Kodik."
    )

    execute {
        // 1) Banner strip + "Реклама" label: the app's own "ads suppressed" predicate returns true.
        if (removeBannerAds != false) {
            AdsSuppressedFingerprint.method.addInstructions(
                0,
                "const/4 v0, 0x1\n" +
                    "return v0"
            )
        }

        // 2) Kodik pre-roll: finish the ad activity the same way a completed ad does.
        if (removeKodikPreRoll != false) {
            KodikAdOnCreateFingerprint.method.let { method ->
                val index = method.implementation!!.instructions.indexOfFirst { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.name == "getLayoutInflater"
                }
                if (index < 0) {
                    throw PatchException("KodikAdActivity.onCreate: getLayoutInflater() call not found")
                }
                method.addInstructions(
                    index,
                    "invoke-virtual { p0 }, " + KODIK_AD_ACTIVITY + "->advertEnded()V\n" +
                        "return-void"
                )
            }

            // 3) Skip the one-time "ad information" dialog. Optional: any failure here is not fatal.
            try {
                KodikAdShowFingerprint.methodOrNull?.let { method ->
                    val instructions = method.implementation!!.instructions.toList()
                    val callIndex = instructions.indexOfFirst { instruction ->
                        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        reference?.name == "getBoolean" &&
                            reference.definingClass == "Landroid/content/SharedPreferences;"
                    }
                    val moveResult = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction
                    if (callIndex < 0 || moveResult == null) {
                        println("[Anixart] Kodik disclaimer: getBoolean/move-result not found")
                    } else {
                        val register = moveResult.registerA
                        method.addInstructions(
                            callIndex + 2,
                            "const/16 v" + register + ", 0x1"
                        )
                    }
                } ?: println("[Anixart] Kodik disclaimer: fingerprint not found")
            } catch (e: Exception) {
                println("[Anixart] Kodik disclaimer: " + e.message)
            }
        }

        // 4) Interstitials after the player closes.
        if (removeInterstitialAds != false) {
            fun disable(name: String, fingerprint: Fingerprint) {
                try {
                    fingerprint.methodOrNull?.addInstructions(0, "return-void")
                        ?: println("[Anixart] " + name + ": fingerprint not found")
                } catch (e: Exception) {
                    println("[Anixart] " + name + ": " + e.message)
                }
            }
            disable("interstitial load", InterstitialLoadFingerprint)
            disable("interstitial show", InterstitialShowFingerprint)
        }
    }
}
