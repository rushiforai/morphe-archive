package dev.hyzor.patches.snorelab.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `vp.h.q()Z` — `getRemotePremiumActive()` in `UserDataSharedPreferences`.
 *
 * The class is matched by the three string literals it passes to
 * `Intrinsics.checkNotNullParameter` in its constructor (`sharedPrefs`, `jsonBridge`) and
 * to the delegated property initialiser (`remotePremiumActive`). Only one class in the
 * APK references `remotePremiumActive`, so the class fingerprint is unambiguous.
 *
 * The getter itself has no string of its own: in 2.33.5.7814 it is the obfuscated method
 * `q()`. The class also has two other no-argument boolean getters (`s()`/`t()` for the
 * onboarding flags), so the reference patch's "any `()Z` method" fingerprint would match
 * three methods here. The exact DEX name is therefore pinned to this target; re-resolve
 * it (see `tools/verify_fingerprints.py`) when bumping the supported version.
 */
object IsRemotePremiumActiveFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("sharedPrefs", "jsonBridge", "remotePremiumActive"),
    ),
    name = "q",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `mp.d.p(Lh80/g;)Z` — `isPremiumDateValid(expirationDate)`.
 *
 * `mp.d` is the local premium source (`SnoreLabCrossPlatformPremiumSource`) that reads the
 * persisted `remotePremiumActive` flag and `remotePremiumExpirationDate`. The class is found
 * through its public `(Lvp/h;)V` constructor, which checks the `userDataSharedPrefs` parameter
 * name, plus the `pl.a0` premium-source interface that distinguishes it from the other
 * `(Lvp/h;)V` holders (e.g. `pr.a`).
 *
 * Its single boolean method taking one object is the expiry check, which the patch forces to
 * `true`.
 */
object IsPremiumDateValidFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
        strings = listOf("userDataSharedPrefs"),
        parameters = listOf("L"),
        interfaces = listOf("Lpl/a0;"),
    ),
    returnType = "Z",
    parameters = listOf("L"),
)
