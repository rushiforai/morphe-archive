package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private const val SHORTCUTS_FUNCTION_INDEX = 97583
private const val EXPECTED_SHORTCUTS_CODE_OFFSET = 0x019ba337
private const val SHORTCUTS_CAPACITY = 57

private const val DONOR_FUNCTION_INDEX = 75517
private const val DONOR_CODE_OFFSET = 0x017d2ed7
private const val DONOR_CAPACITY = 152

private val EXPECTED_SHORTCUTS_FILTER_BYTES = byteArrayOf(
    0x89.toByte(), 0x01, 0x01, 0x94.toByte(), 0x00, 0xd3.toByte(), 0x30, 0x01,
    0x00, 0x34, 0x02, 0x00, 0x3b, 0x03, 0x02, 0x00, 0x44, 0x04, 0x03, 0x00,
    0x9e.toByte(), 0x44, 0x02, 0x01, 0x01, 0x8e.toByte(), 0x6e, 0x02, 0x04, 0x03,
    0x02, 0xb0.toByte(), 0x16, 0x02, 0x44, 0x02, 0x03, 0x02, 0x47, 0x44, 0x01,
    0x01, 0x01, 0x8e.toByte(), 0x6e, 0x01, 0x02, 0x03, 0x01, 0x95.toByte(), 0x00,
    0x76, 0x00, 0x96.toByte(), 0x00, 0x76, 0x00
)

private val EXPECTED_DONOR_PREFIX_BYTES = byteArrayOf(
    0x93.toByte(), 0x00, 0x93.toByte(), 0x04, 0x99.toByte(), 0x03, 0x34, 0x01
)

private val FILTERED_SHORTCUTS_PREFIX_BYTES = byteArrayOf(
    0x89.toByte(), 0x01, 0x01, 0x94.toByte(), 0x00
)
private data class ShortcutItemConfig(
    val name: String,
    val isLongIndex: Boolean,
    val stringId: Int
)

/**
 * Builds a Hermes shortcut filter excluding [items], padded to exactly [capacity]
 * bytes. String IDs must fit the width selected by isLongIndex.
 *
 * @throws IllegalArgumentException if the predicate exceeds capacity, a comparison
 * jump is outside 1..255 bytes, or the generated exit offset is inconsistent.
 */
private fun assembleShortcutPredicate(items: List<ShortcutItemConfig>, capacity: Int): ByteArray {
    val totalComparisonLength = items.sumOf { (if (it.isLongIndex) 6 else 4) + 4 }
    val preambleSize = 14
    val trueReturnOffset = preambleSize + totalComparisonLength
    val falseReturnOffset = trueReturnOffset + 4
    val totalLength = falseReturnOffset + 4

    require(totalLength <= capacity) {
        "Generated predicate size ($totalLength) exceeds capacity ($capacity)"
    }

    val buffer = ByteArray(capacity) { 0x7e.toByte() }
    val preamble = byteArrayOf(
        0x89.toByte(), 0x01, 0x01,
        0x94.toByte(), 0x00,
        0xd3.toByte(), (falseReturnOffset - 5).toByte(), 0x01, 0x00,
        0x44.toByte(), 0x02, 0x01, 0x00, 0x8e.toByte()
    )
    System.arraycopy(preamble, 0, buffer, 0, preamble.size)

    var cursor = preambleSize
    for (item in items) {
        if (item.isLongIndex) {
            buffer[cursor++] = 0x91.toByte()
            buffer[cursor++] = 0x03
            buffer[cursor++] = (item.stringId and 0xFF).toByte()
            buffer[cursor++] = ((item.stringId ushr 8) and 0xFF).toByte()
            buffer[cursor++] = ((item.stringId ushr 16) and 0xFF).toByte()
            buffer[cursor++] = ((item.stringId ushr 24) and 0xFF).toByte()
        } else {
            buffer[cursor++] = 0x90.toByte()
            buffer[cursor++] = 0x03
            buffer[cursor++] = (item.stringId and 0xFF).toByte()
            buffer[cursor++] = ((item.stringId ushr 8) and 0xFF).toByte()
        }

        val relOffset = falseReturnOffset - cursor
        require(relOffset in 1..0xFF) { "Relative jump offset out of 8-bit range: $relOffset" }
        buffer[cursor++] = 0xd3.toByte()
        buffer[cursor++] = relOffset.toByte()
        buffer[cursor++] = 0x02
        buffer[cursor++] = 0x03
    }

    require(cursor == trueReturnOffset) { "Cursor offset mismatch at success exit" }
    // Success exit: LoadConstTrue r0; Ret r0
    buffer[cursor++] = 0x95.toByte()
    buffer[cursor++] = 0x00
    buffer[cursor++] = 0x76
    buffer[cursor++] = 0x00

    // Failure exit: LoadConstFalse r0; Ret r0
    buffer[cursor++] = 0x96.toByte()
    buffer[cursor++] = 0x00
    buffer[cursor++] = 0x76
    buffer[cursor] = 0x00

    return buffer
}

@Suppress("unused")
val configureShortcutsPatch = rawResourcePatch(
    name = "Configure Shortcuts",
    description = "Customizes items displayed in the Your Shortcuts carousel.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    val hideReferAFriend = booleanOption(
        key = "hideReferAFriend",
        default = true,
        title = "Hide Refer a Friend",
        description = "Hides the Refer a Friend shortcut from the Your Shortcuts carousel."
    )

    val hideGiveaway = booleanOption(
        key = "hideGiveaway",
        default = true,
        title = "Hide Giveaway",
        description = "Hides the Giveaway shortcut from the Your Shortcuts carousel."
    )

    val hideOffers = booleanOption(
        key = "hideOffers",
        default = true,
        title = "Hide Offers",
        description = "Hides the Offers shortcut from the Your Shortcuts carousel."
    )

    val hideRewards = booleanOption(
        key = "hideRewards",
        default = true,
        title = "Hide Rewards",
        description = "Hides the Rewards shortcut from the Your Shortcuts carousel."
    )

    val hideSezzleMobile = booleanOption(
        key = "hideSezzleMobile",
        default = true,
        title = "Hide Sezzle Mobile",
        description = "Hides the Sezzle Mobile shortcut from the Your Shortcuts carousel."
    )

    val hideAmazonDeals = booleanOption(
        key = "hideAmazonDeals",
        default = true,
        title = "Hide Amazon Deals",
        description = "Hides the Amazon Deals shortcut from the Your Shortcuts carousel."
    )

    val hidePayLaterAnywhere = booleanOption(
        key = "hidePayLaterAnywhere",
        default = true,
        title = "Hide Pay Later Anywhere",
        description = "Hides the Pay Later Anywhere shortcut from the Your Shortcuts carousel."
    )

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        if (editor.functionCount <= maxOf(SHORTCUTS_FUNCTION_INDEX, DONOR_FUNCTION_INDEX)) {
            throw PatchException(
                "Bundle function count (${editor.functionCount}) insufficient for shortcut filter index"
            )
        }

        val header = editor.getFunctionHeader(SHORTCUTS_FUNCTION_INDEX)
        if (header.codeOffset != EXPECTED_SHORTCUTS_CODE_OFFSET || header.bytecodeSize != SHORTCUTS_CAPACITY) {
            throw PatchException("Function $SHORTCUTS_FUNCTION_INDEX header mismatch")
        }

        if (!editor.matchesBytes(EXPECTED_SHORTCUTS_CODE_OFFSET, EXPECTED_SHORTCUTS_FILTER_BYTES) &&
            !editor.matchesBytes(EXPECTED_SHORTCUTS_CODE_OFFSET, FILTERED_SHORTCUTS_PREFIX_BYTES)
        ) {
            throw PatchException("Unexpected shortcut filter bytecode at offset 0x${EXPECTED_SHORTCUTS_CODE_OFFSET.toString(16)}")
        }

        val donorHeader = editor.getFunctionHeader(DONOR_FUNCTION_INDEX)
        if (donorHeader.codeOffset != DONOR_CODE_OFFSET || donorHeader.bytecodeSize != DONOR_CAPACITY) {
            throw PatchException("Donor function $DONOR_FUNCTION_INDEX header mismatch")
        }

        if (!editor.matchesBytes(DONOR_CODE_OFFSET, EXPECTED_DONOR_PREFIX_BYTES) &&
            !editor.matchesBytes(DONOR_CODE_OFFSET, FILTERED_SHORTCUTS_PREFIX_BYTES)
        ) {
            throw PatchException("Unexpected donor bytecode at offset 0x${DONOR_CODE_OFFSET.toString(16)}")
        }

        // Build list of active shortcut exclusions
        val excludedItems = mutableListOf<ShortcutItemConfig>()

        /**
         * Adds a shortcut exclusion if its name exists in the bundle and fits the donor's
         * byte capacity. Duplicate names, missing strings, and entries that do not fit are skipped.
         * Malformed string-table errors from the editor propagate.
         */
        fun tryExclude(name: String) {
            if (excludedItems.any { it.name == name }) return
            val sid = editor.findStringId(name) ?: return
            val neededBytes = (if (sid > 0xFFFF) 6 else 4) + 4
            val currentBytes = 14 + excludedItems.sumOf { (if (it.isLongIndex) 6 else 4) + 4 } + 8
            if (currentBytes + neededBytes <= DONOR_CAPACITY) {
                excludedItems.add(ShortcutItemConfig(name, sid > 0xFFFF, sid))
            }
        }

        if (hideReferAFriend.value == true) {
            var sid = editor.findStringId("user_referrals")
            if (sid == null) {
                editor.replaceStringUsingDonor(
                    target = "STORYBOOK_ADDON_STATE",
                    replacement = "user_referrals",
                    donor = "STORYBOOK_ADDON_STATE"
                )
            }
            tryExclude("user_referrals")
        }

        // The promotional offer shortcut is identified as 'sezzle_mobile' or 'offers'
        if (hideOffers.value == true || hideSezzleMobile.value == true) {
            tryExclude("sezzle_mobile")
        }
        if (hideOffers.value == true) {
            tryExclude("offers")
            tryExclude("offer")
        }
        if (hideGiveaway.value == true) {
            tryExclude("giveaway")
        }
        if (hideRewards.value == true) {
            tryExclude("earn")
        }
        if (hideAmazonDeals.value == true) {
            var sidDeals = editor.findStringId("amazon_deals")
            if (sidDeals == null) {
                editor.replaceStringUsingDonor(
                    target = "__STORYBOOK_ADDONS",
                    replacement = "amazon_deals",
                    donor = "__STORYBOOK_ADDONS"
                )
            }
            tryExclude("amazon_deals")
            var sidCamel = editor.findStringId("amazonDeals")
            if (sidCamel == null) {
                editor.replaceStringUsingDonor(
                    target = "__STORYBOOK_ADDONS_PREVIEW",
                    replacement = "amazonDeals",
                    donor = "__STORYBOOK_ADDONS_PREVIEW"
                )
            }
            tryExclude("amazonDeals")
            tryExclude("amazon")
            tryExclude("amazonStore")
            tryExclude("deals")
            tryExclude("deal")
        }
        if (hidePayLaterAnywhere.value == true) {
            tryExclude("anywhere")
            tryExclude("sezzleAnywhere")
        }

        if (excludedItems.isNotEmpty()) {
            val predicateBytes = assembleShortcutPredicate(excludedItems, DONOR_CAPACITY)
            editor.patchBytes(DONOR_CODE_OFFSET, predicateBytes)
            editor.redirectFunctionHeader(SHORTCUTS_FUNCTION_INDEX, DONOR_CODE_OFFSET, DONOR_CAPACITY)
            editor.patchBytes(EXPECTED_SHORTCUTS_CODE_OFFSET, FILTERED_SHORTCUTS_PREFIX_BYTES)
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
