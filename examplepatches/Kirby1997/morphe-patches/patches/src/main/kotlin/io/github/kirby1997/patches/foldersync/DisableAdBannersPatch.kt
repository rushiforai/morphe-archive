package io.github.kirby1997.patches.foldersync

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// AppAdmobBannerLoader implements the kmp-ui Lzq/a; "BannerLoader" interface
// for the lite flavor. Its only virtual method, a(String, Composer, Int)V,
// is the @Composable that every screen embeds wherever a banner ad slot
// belongs (file-list footer, transfers, etc). Returning at offset 0 skips
// all Compose machinery — the parent's startRestartGroup tolerates a
// composable that renders nothing, so the banner area collapses everywhere.
object AppAdmobBannerLoaderRenderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lw1/u;", "I"),
    definingClass = "Ldk/tacit/android/foldersync/ads/AppAdmobBannerLoader;",
    name = "a",
)

@Suppress("unused")
val disableAdBannersPatch = bytecodePatch(
    name = "Disable AdMob banners",
    description = "Turns the AppAdmobBannerLoader composable into a no-op so the lite-version banner ad never renders.",
) {
    compatibleWith(Constants.FOLDERSYNC)

    execute {
        AppAdmobBannerLoaderRenderFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
