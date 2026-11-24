package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private const val SHORTCUTS_FUNCTION_INDEX = 90129
private const val EXPECTED_SHORTCUTS_CODE_OFFSET = 0x01b6cd83
private const val SHORTCUTS_CAPACITY = 57

private const val DONOR_FUNCTION_INDEX = 85895
private const val DONOR_CODE_OFFSET = 0x01b1aa98
private const val DONOR_CAPACITY = 154

private val EXPECTED_SHORTCUTS_FILTER_BYTES = byteArrayOf(
    0x89.toByte(), 0x01, 0x01, 0x94.toByte(), 0x00, 0xd3.toByte(), 0x30, 0x01,
    0x00, 0x34, 0x02, 0x00, 0x3b, 0x03, 0x02, 0x01, 0x44, 0x04, 0x03, 0x00,
    0x8c.toByte(), 0x44, 0x02, 0x01, 0x01, 0x7c, 0x6e, 0x02, 0x04, 0x03,
    0x02, 0xb0.toByte(), 0x16, 0x02, 0x44, 0x02, 0x03, 0x02, 0x42, 0x44, 0x01,
    0x01, 0x01, 0x7c, 0x6e, 0x01, 0x02, 0x03, 0x01, 0x95.toByte(), 0x00,
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
 * [nameStringId] is the bundle's `name` identifier, read with `GetByIdShort`; it
 * must fit in the opcode's single-byte string operand.
 *
 * @throws IllegalArgumentException if the predicate exceeds capacity, a comparison
 * jump is outside 1..255 bytes, the name ID exceeds 8 bits, or the generated exit
 * offset is inconsistent.
 */
private fun assembleShortcutPredicate(
    items: List<ShortcutItemConfig>,
    capacity: Int,
    nameStringId: Int
): ByteArray {
    require(nameStringId in 0..0xFF) {
        "Shortcut item name string ID ($nameStringId) exceeds GetByIdShort range"
    }
    val totalComparisonLength = items.sumOf { (if (it.isLongIndex) 6 else 4) + 4 }
    // The filter callback receives null entries, so keep the null check. Use the
    // long jump variant: the short form overflows when many names are excluded.
    val preambleSize = 17
    val trueReturnOffset = preambleSize + totalComparisonLength
    val falseReturnOffset = trueReturnOffset + 4
    val totalLength = falseReturnOffset + 4

    require(totalLength <= capacity) {
        "Generated predicate size ($totalLength) exceeds capacity ($capacity)"
    }

    val buffer = ByteArray(capacity) { 0x7e.toByte() }
    buffer[0] = 0x89.toByte()   // LoadParam r1, 1
    buffer[1] = 0x01
    buffer[2] = 0x01
    buffer[3] = 0x94.toByte()   // LoadConstNull r0
    buffer[4] = 0x00
    val nullJumpOffset = falseReturnOffset - 5
    buffer[5] = 0xd4.toByte()   // JStrictEqualLong r1, r0, falseReturn
    buffer[6] = (nullJumpOffset and 0xFF).toByte()
    buffer[7] = ((nullJumpOffset ushr 8) and 0xFF).toByte()
    buffer[8] = ((nullJumpOffset ushr 16) and 0xFF).toByte()
    buffer[9] = ((nullJumpOffset ushr 24) and 0xFF).toByte()
    buffer[10] = 0x01
    buffer[11] = 0x00
    buffer[12] = 0x44.toByte()  // GetByIdShort r2, r1, 0, "name"
    buffer[13] = 0x02
    buffer[14] = 0x01
    buffer[15] = 0x00
    buffer[16] = nameStringId.toByte()

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

    val hideSezzlePoints = booleanOption(
        key = "hideSezzlePoints",
        default = false,
        title = "Hide Sezzle Points",
        description = "Hides the Sezzle Points shortcut from the Your Shortcuts carousel."
    )

    val hideSezzleSpend = booleanOption(
        key = "hideSezzleSpend",
        default = false,
        title = "Hide Sezzle Spend",
        description = "Hides the Sezzle Spend shortcut from the Your Shortcuts carousel."
    )

    val hideSezzleUp = booleanOption(
        key = "hideSezzleUp",
        default = false,
        title = "Hide Sezzle Up",
        description = "Hides the Sezzle Up shortcut from the Your Shortcuts carousel."
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
            val currentBytes = 17 + excludedItems.sumOf { (if (it.isLongIndex) 6 else 4) + 4 } + 8
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

        if (hideSezzleMobile.value == true) {
            tryExclude("sezzle_mobile")
        }
        if (hideOffers.value == true) {
            tryExclude("offers")
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
        }
        if (hidePayLaterAnywhere.value == true) {
            tryExclude("anywhere")
            // Pay Later Anywhere is served under cohort-specific discount names.
            for ((name, donor) in listOf(
                "anywhere_50_pct_off" to "__STORYBOOK_PREVIEW__",
                "anywhere_75_pct_off" to "__STORYBOOK_CLIENT_API__",
                "anywhere_90_pct_off" to "__STORYBOOK_ADDONS_CHANNEL__",
                "anywhere_95_pct_off" to "__STORYBOOK_STORY_STORE__"
            )) {
                if (editor.findStringId(name) == null) {
                    editor.replaceStringUsingDonor(target = donor, replacement = name, donor = donor)
                }
                tryExclude(name)
            }
        }
        if (hideSezzlePoints.value == true) {
            if (editor.findStringId("sezzle_points") == null) {
                editor.replaceStringUsingDonor(
                    target = "__STORYBOOK_ADDONS_MANAGER",
                    replacement = "sezzle_points",
                    donor = "__STORYBOOK_ADDONS_MANAGER"
                )
            }
            tryExclude("sezzle_points")
        }
        if (hideSezzleSpend.value == true) {
            tryExclude("sezzle_spend")
        }
        if (hideSezzleUp.value == true) {
            tryExclude("sezzle_up")
        }

        if (excludedItems.isNotEmpty()) {
            val nameStringId = editor.findStringId("name")
                ?: throw PatchException("String 'name' not found")
            val predicateBytes = assembleShortcutPredicate(excludedItems, DONOR_CAPACITY, nameStringId)
            editor.patchBytes(DONOR_CODE_OFFSET, predicateBytes)
            editor.redirectFunctionHeader(SHORTCUTS_FUNCTION_INDEX, DONOR_CODE_OFFSET, DONOR_CAPACITY)
            editor.patchBytes(EXPECTED_SHORTCUTS_CODE_OFFSET, FILTERED_SHORTCUTS_PREFIX_BYTES)
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
