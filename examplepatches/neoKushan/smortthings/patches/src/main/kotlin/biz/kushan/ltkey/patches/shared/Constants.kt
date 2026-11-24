package biz.kushan.ltkey.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Samsung SmartThings (OneConnect).
     *
     * Not hard-locked to one build. The fingerprints and the reflective extraction chain are
     * version-specific, but every anchor fails closed — a missed fingerprint skips that patch and
     * the guarded extension never throws into the host — so it is safe to *attempt* a patch on an
     * untested build. So instead of refusing every version but one, we advertise the confirmed
     * builds as recommended and leave an experimental catch-all so new releases can be tested:
     *
     * - Concrete, non-experimental targets = versions whose anchors are confirmed working. Morphe
     *   Manager suggests these (and can fetch them).
     * - A `version = null`, `isExperimental = true` target = "any other version". It lets anyone
     *   patch whatever SmartThings they have installed (e.g. a brand-new release) to try it, flagged
     *   experimental so it is opt-in and clearly "unconfirmed — may not work, please report back".
     *   When a new build is verified, promote it to its own concrete target above.
     *
     * Anchors re-verified unchanged on 1.8.54.23: EditDeviceActivity.onCreate, the sk.b→f4.X()
     * CryptoManager accessor, CryptoManager.a, mm.e.g, connectionsupport/util/a.e, the SA SDK
     * isStandAloneSaAppInstalled, and native psiDecrypt.
     */
    val COMPATIBILITY_SMARTTHINGS = Compatibility(
        name = "SmartThings",
        packageName = "com.samsung.android.oneconnect",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1C8CF5, // SmartThings blue
        targets = listOf(
            // Confirmed working — recommended / suggested by Morphe Manager.
            AppTarget(version = "1.8.54.23"),
            AppTarget(version = "1.8.52.23"),
            // Any other build: opt-in, unconfirmed. Fail-closed fingerprints make this safe to try.
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Unconfirmed build — not verified to work. Try it and please report back.",
            ),
        ),
    )
}
