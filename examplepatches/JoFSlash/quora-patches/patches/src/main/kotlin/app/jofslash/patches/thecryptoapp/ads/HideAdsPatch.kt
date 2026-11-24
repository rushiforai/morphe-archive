package app.jofslash.patches.thecryptoapp.ads

import app.jofslash.patches.thecryptoapp.shared.Constants.COMPATIBILITY_THECRYPTOAPP
import app.jofslash.patches.thecryptoapp.shared.returnBoolean
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

// The new-user "ad-free grace window" gate (zs6.a() in 4.0.5). It returns true for a configurable
// number of hours after first install; the ad code gates banners and native news ads behind
// `gd7.c() || zs6.a()` (seen in vf.java), where gd7.c() is the paid Pro entitlement. Pinning it to
// true forces the app's OWN ad-free path for everyone, WITHOUT touching Pro (cz8.j() / h02 /
// gd7.c()). Found by its remote-config key rather than the obfuscated class name, so it survives
// R8 renames between versions. The sibling b(Boolean) logger reads the same key but returns void.
internal object AdGraceWindowFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("new_user_banner_grace_hours"),
)

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides the banners and the ads between the news, using the app's own ad-free mode for new " +
            "users, kept on for good. Pro isn't unlocked.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_THECRYPTOAPP)

    execute {
        AdGraceWindowFingerprint.method.returnBoolean(true)
    }
}
