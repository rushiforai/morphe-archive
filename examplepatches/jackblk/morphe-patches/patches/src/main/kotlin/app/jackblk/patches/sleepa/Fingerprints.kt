package app.jackblk.patches.sleepa

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * si.h0.n(): the app's single premium gate.
 *
 *   public static boolean n() {
 *       return ((Boolean) r(f80022f)).booleanValue() || h();  // f80022f = "IS_PRO_VERSION_PURCHASED"
 *   }
 *
 * Checked at 17 sites app-wide (content locks, upsell icon, ad suppression).
 * See docs/sleepa-premium.md. Names are obfuscated and pinned to 4.3.0 (135).
 */
object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lsi/h0;",
    name = "n",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)
