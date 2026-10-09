package app.aidan.patches.sezzle.dev

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private const val ACCOUNT_EVENT_ALERTS_COHORT_CHECK_OFFSET = 0x62d
private const val DEV_SETTINGS_EVENT_ALERTS_COHORT_CHECK_OFFSET = 0xef
private val EXPECTED_ACCOUNT_EVENT_ALERTS_COHORT_CHECK_BYTES = byteArrayOf(
    0x6e,
    0x25,
    0x07,
    0x02,
    0x2a
)
private val FORCED_ACCOUNT_EVENT_ALERTS_COHORT_BYTES = byteArrayOf(
    0x95.toByte(),
    0x25,
    0x7e,
    0x7e,
    0x7e
)
private val EXPECTED_DEV_SETTINGS_EVENT_ALERTS_COHORT_CHECK_BYTES = byteArrayOf(
    0x6e,
    0x02,
    0x02,
    0x00,
    0x03
)
private val FORCED_DEV_SETTINGS_EVENT_ALERTS_COHORT_BYTES = byteArrayOf(
    0x95.toByte(),
    0x02,
    0x7e,
    0x7e,
    0x7e
)

@Suppress("unused")
val unlockDevSettingsPatch = rawResourcePatch(
    name = "Unlock Developer Settings",
    description = "Makes the internal Development Settings menu visible to every signed-in account.",
    default = false
) {
    category("Developer")
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        val accountViewOffset = editor.findFunctionOffsetsByName("AccountView").singleOrNull()
            ?: throw PatchException("Expected one AccountView renderer")
        val accountCohortCheckOffset = accountViewOffset + ACCOUNT_EVENT_ALERTS_COHORT_CHECK_OFFSET

        if (editor.matchesBytes(accountCohortCheckOffset, EXPECTED_ACCOUNT_EVENT_ALERTS_COHORT_CHECK_BYTES)) {
            editor.patchBytes(accountCohortCheckOffset, FORCED_ACCOUNT_EVENT_ALERTS_COHORT_BYTES)
        } else if (!editor.matchesBytes(accountCohortCheckOffset, FORCED_ACCOUNT_EVENT_ALERTS_COHORT_BYTES)) {
            throw PatchException("Unexpected event-alerts cohort check in AccountView")
        }

        val devSettingsViewOffset = editor.findFunctionOffsetsByName("DevSettingsView").singleOrNull()
            ?: throw PatchException("Expected one DevSettingsView renderer")
        val devSettingsCohortCheckOffset =
            devSettingsViewOffset + DEV_SETTINGS_EVENT_ALERTS_COHORT_CHECK_OFFSET

        if (editor.matchesBytes(devSettingsCohortCheckOffset, EXPECTED_DEV_SETTINGS_EVENT_ALERTS_COHORT_CHECK_BYTES)) {
            editor.patchBytes(devSettingsCohortCheckOffset, FORCED_DEV_SETTINGS_EVENT_ALERTS_COHORT_BYTES)
        } else if (!editor.matchesBytes(devSettingsCohortCheckOffset, FORCED_DEV_SETTINGS_EVENT_ALERTS_COHORT_BYTES)) {
            throw PatchException("Unexpected event-alerts cohort check in DevSettingsView")
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
