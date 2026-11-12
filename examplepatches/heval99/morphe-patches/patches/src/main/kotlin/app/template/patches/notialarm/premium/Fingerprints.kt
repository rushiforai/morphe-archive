package app.template.patches.notialarm.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The local premium getter. AppPreference is not R8-renamed (the whole data.local package keeps
 * its names) and the method is public: it reads the "is_premium_user" boolean from the
 * "app_preference" SharedPreferences. Every premium gate calls it, including the billing wrapper
 * (which seeds its cached premium flow from it) and the billing UI state.
 */
internal object IsPremiumUserFingerprint : Fingerprint(
    definingClass = "Lcom/soosu/notialarm/data/local/AppPreference;",
    name = "isPremiumUser",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)
