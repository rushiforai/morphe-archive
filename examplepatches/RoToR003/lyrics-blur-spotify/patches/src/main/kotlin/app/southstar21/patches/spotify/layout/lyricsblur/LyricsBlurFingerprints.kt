package app.southstar21.patches.spotify.layout.lyricsblur

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The composable that draws one lyric line (obfuscated as p.ksh0.a in 9.2.4.2644). Spotify's
 * Compose code is minified, so the patch is tied to this one version.
 *
 * Parameters: line model, Z (p2), Z (p3), F, I, Z, Modifier, Z, Z, Z, Boolean, Z, loc1,
 * Function1, Composer, I changed, I changed, I default.
 */
internal object LyricsLineFingerprint : Fingerprint(
    definingClass = "Lp/ksh0;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lp/psh0;", "Z", "Z", "F", "I", "Z", "Lp/xzo0;", "Z", "Z", "Z",
        "Ljava/lang/Boolean;", "Z", "Lp/loc1;", "Lp/en50;", "Lp/nvk;", "I", "I", "I",
    ),
)

/**
 * The translate-mode wrapper around a lyric line (obfuscated as p.ksh0.b in 9.2.4.2644):
 * wraps the plain line body in a crossfade between original and translated text. Also holds a
 * call of p.mtc1.f (its own line-width Modifier) and is used on the full-screen lyrics view.
 * Parameters: line model, Boolean?, Z (p3), F, Function0, Z (p6), Z (p7), Composer, I.
 *
 * Used only by this diagnostic build to find out which of the two line composables actually
 * renders the visible lyrics surface; the final fix will hook the one that draws.
 */
internal object LyricsLineWrapperFingerprint : Fingerprint(
    definingClass = "Lp/ksh0;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lp/psh0;", "Ljava/lang/Boolean;", "Z", "F",
        "Lkotlin/jvm/functions/Function0;", "Z", "Z", "Lp/nvk;", "I",
    ),
)
