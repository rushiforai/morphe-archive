package app.aidan.patches.sezzle.dev

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private const val COHORT_CHECK_SCAN_LIMIT = 20_000
private const val COHORT_CHECK_PROPERTY = "checkIfUserIsInMobileEventAlertsCohort"

/**
 * Finds the `Call2` operand that consumes the mobile event-alerts cohort lookup in
 * [functionName]. The lookup is followed immediately by the call in every supported build.
 */
private fun HermesBundleEditor.findCohortCheckCall(functionName: String): Int {
    val functionOffset = findFunctionOffsetsByName(functionName).singleOrNull()
        ?: throw PatchException("Expected one $functionName renderer")
    val propertyId = findStringId(COHORT_CHECK_PROPERTY)
        ?: throw PatchException("String '$COHORT_CHECK_PROPERTY' not found")
    val low = (propertyId and 0xFF).toByte()
    val high = ((propertyId ushr 8) and 0xFF).toByte()
    val bytes = toByteArray()
    val limit = minOf(functionOffset + COHORT_CHECK_SCAN_LIMIT, bytes.size - 7)

    for (offset in functionOffset until limit) {
        if (bytes[offset] != 0x45.toByte() ||
            bytes[offset + 4] != low ||
            bytes[offset + 5] != high
        ) {
            continue
        }
        val callOffset = offset + 6
        if (bytes[callOffset] == 0x6e.toByte() || bytes[callOffset] == 0x95.toByte()) {
            return callOffset
        }
        throw PatchException("Unexpected cohort check call in $functionName")
    }
    throw PatchException("Could not find the event-alerts cohort check in $functionName")
}

/** Forces the boolean result of the cohort check to `true`. */
private fun HermesBundleEditor.forceCohortCheckTrue(functionName: String) {
    val callOffset = findCohortCheckCall(functionName)
    val bytes = toByteArray()
    if (bytes[callOffset] == 0x95.toByte()) return
    val destination = bytes[callOffset + 1]
    patchBytes(callOffset, byteArrayOf(0x95.toByte(), destination, 0x7e, 0x7e, 0x7e))
}

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
        editor.forceCohortCheckTrue("AccountView")
        editor.forceCohortCheckTrue("DevSettingsView")

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
