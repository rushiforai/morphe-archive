package app.stayfree.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import app.stayfree.patches.telemetry.disableAllTelemetryPatch

@Suppress("unused")
val removeDataCollectionOptOutPatch = bytecodePatch(
    name = "Remove data collection opt-out",
    description = "Removes the \"Opt-Out of Data Collection\" switch from Settings > Data " +
        "Privacy and locks data collection off: the opt-out can no longer be undone (the " +
        "\"Opt-In\" buttons do nothing) and the opt-out status is never reported to StayFree. " +
        "Includes \"Disable All Telemetry\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    // The switch only mirrors `usage-sdk-opt-out`; "Disable All Telemetry" pins that flag to
    // true (`kmb.a()`), which is what every SensorTower uploader checks before sending usage,
    // browsing, shopping, IAP and AI data. Without it, removing the switch would freeze
    // whatever state the user last chose.
    dependsOn(disableAllTelemetryPatch)

    execute {
        // 1. The switch row: the first wt9.b call after "Opt-Out of Data Collection". The
        //    "Privacy Policy" row below it stays.
        DataPrivacyScreenFingerprint.method.removeSettingsRow("data_privacy_opt_out")

        // 2. Opt-in becomes a no-op. It would write `opt_out_data_collection = false` and
        //    `usage-sdk-opt-out = false`; the reads stay pinned by the telemetry patch, but the
        //    write would still trigger the server report below and log an Amplitude event.
        //    The opt-in dialogs (Global Usage Stats, Inbox Control) just close, nothing changes.
        DataCollectionOptInFingerprint.method.addInstruction(0, "return-void")

        // 3. `GET analytics/optout?install_id=…&opt_out=…` to api.stayfreeapps.com, sent by
        //    the usage SDK preference listener (`dp9` case 13) whenever `qr7.c(Boolean)` writes
        //    the opt-out flag, from any caller. "Local device sync" already routes that host to
        //    127.0.0.1 and drops the call, but this request must not depend on that patch.
        AnalyticsOptOutRequestFingerprint.method.addInstruction(0, "return-void")
    }
}
