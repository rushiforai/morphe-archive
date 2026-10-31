package dev.karmapatches.patches.nowtv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.karmapatches.debugLogSmali
import dev.karmapatches.patches.nowtv.NOW_TV_COMPATIBILITY

/**
 * Canlı yayında reklam başlayınca uygulama oynatıcı kontrol çubuğunu (ileri/geri sarma,
 * zaman çizelgesi) GONE yapıyor. Bu yama o gizlemeyi iptal eder; reklam sırasında da
 * ileri sarma tuşları kullanılabilir. Reklamlar yayına gömülü olduğu için atlama, ancak
 * canlı kenardan geride (DVR penceresinde) izlerken mümkündür.
 */
@Suppress("unused")
val keepControlsDuringAdsPatch = bytecodePatch(
    name = "Keep player controls during live ads",
    description = "Stops the app from hiding the player controls when a live ad starts, so you can seek past it.",
    default = true,
) {
    compatibleWith(NOW_TV_COMPATIBILITY)

    execute {
        // isDaionAdVisible alanı başka yerde okunmuyor (doğrulandı); gizleme komple atlanır.
        daionAdInFingerprint.method.addInstructions(
            0,
            """
                ${debugLogSmali("p0", "p1", "live ad started, controls kept")}
                return-void
            """,
        )
    }
}
