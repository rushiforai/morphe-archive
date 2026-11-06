package app.lopikss.patches.xphero

import java.security.MessageDigest

/**
 * XP Hero 26.2.0 ARM64 IL2CPP native edits.
 *
 * Independent stackable patches touch this library:
 * - zero-coin trait rerolls (user verified in v1.3.2)
 * - Heroes' Tomb refill price fallback (v1.3.5, experimental)
 * - free Return daily reset (v1.3.7, experimental)
 * - hero star upgrades (v1.3.8, experimental)
 * - zero-piece hero unlock confirmation (v1.3.9, experimental)
 *
 * Normalize ONLY these exact known changes before checking the complete
 * original library SHA-256. This permits either patch order and prevents
 * writing into a different game build.
 */
internal object XP135NativeEditor {
    const val ARM64 = "lib/arm64-v8a/libil2cpp.so"
    private const val ORIGINAL_SHA =
        "88b591e6099c55b1147b865847a14651b108f9bd6837707371766a054c8df443"
    private const val EXPECTED_SIZE = 83_724_712


    /**
     * XP Hero 27.0.0 zero-shard CostumeController.TryGradeUpCostume flow.
     * Verified against original libil2cpp.so SHA-256 and disassembly:
     *   VA 0x2BC9368: read Cost1_Amount into x23 -> MOV X23,#1
     *   VA 0x2BC9380: HasEnoughPieces call -> AddCostumePiece(int,long)
     *   VA 0x2BC9384: affordability TBZ -> NOP (credit returns void)
     *   VA 0x2BC938C: read Cost1_Amount into x19 -> MOV X19,#1
     * The original TryConsumeCostumePiece call at VA 0x2BC93A4 is unchanged.
     * AddCostumePiece at VA 0x2BD6324 validates positive quantity and adds
     * to the per-costume counter via VA 0x2BD66DC.
     *
     * These offsets are FILE offsets (instruction VAs minus 0x4000).
     * Unlike the 26.2.0 normalized verifier, this port requires the exact
     * original 27.0.0 library before ANY edits; no other v27 native module
     * is claimed compatible by this change.
     */
    private const val ORIGINAL_SHA_27 =
        "c732bc0957569db6ba7856e181a37706893a4332bca48bebc90be21ef5cada5a"
    private const val EXPECTED_SIZE_27 = 90_037_632
    private val STAR_TEMPORARY_SHARD_PATCHES_27 = listOf(
        Triple(0x2BC5368,
            byteArrayOf(0xD7.toByte(), 0x12, 0x40, 0xF9.toByte()),
            byteArrayOf(0x37, 0x00, 0x80.toByte(), 0xD2.toByte())),
        Triple(0x2BC5380,
            byteArrayOf(0xE0.toByte(), 0x18, 0x00, 0x94.toByte()), // BL HasEnoughPieces
            byteArrayOf(0xE9.toByte(), 0x33, 0x00, 0x94.toByte())), // BL AddCostumePiece
        Triple(0x2BC5384,
            byteArrayOf(0x60, 0x1E, 0x00, 0x36), // TBZ W0,#0,fail
            byteArrayOf(0x1F, 0x20, 0x03, 0xD5.toByte())), // NOP
        Triple(0x2BC538C,
            byteArrayOf(0xD3.toByte(), 0x12, 0x40, 0xF9.toByte()),
            byteArrayOf(0x33, 0x00, 0x80.toByte(), 0xD2.toByte())),
    )


    // Verified against the original XP Hero 27.0.0 libil2cpp.so:
    // - Heroes' Tomb GetChargeCost: VA 0x2C945B8
    // - ResetDailyTickets quantity / item: VA 0x2828A7C / 0x2828A94
    // - Daily-reset no-pass guards: VA 0x282898C / 0x2828998
    // - GetFreeTicketCount: VA 0x2826028 (item 7002)
    // - Field Return consumption guard: VA 0x282A12C (item 7002)
    // The offsets below are *file* offsets (VA - 0x4000).
    // TraitContext.CalculateRollCost() no-argument overload (token 0x06000CB8).
    // Verified by the 27.0.0 metadata method-pointer table and entry bytes.
    private const val TRAIT_OFFSET_27 = 0x29FD86C
    // CostumeManagement.AddCostumePiece 0-quantity guard: B.LE -> B.LT.
    // Same guard as 26.2.0, relocated with its surrounding method.
    private const val HERO_UNLOCK_CONSUME_OFFSET_27 = 0x2BD065C
    private val ORIGINAL_HERO_UNLOCK_27 = byteArrayOf(0x0D, 0x0A, 0x00, 0x54)
    private val ZERO_HERO_UNLOCK_27 = byteArrayOf(0x0B, 0x0A, 0x00, 0x54)
    private const val TOMB_OFFSET_27 = 0x2C905B8
    private const val RETURN_QUANTITY_OFFSET_27 = 0x2824A7C
    private const val RETURN_ITEM_OFFSET_27 = 0x2824A94
    private const val RETURN_NO_PASS_OFFSET_27 = 0x282498C
    private const val RETURN_INACTIVE_PASS_OFFSET_27 = 0x2824998
    private const val INSTANT_RETURN_COUNT_OFFSET_27 = 0x2822028
    private const val RETURN_FREE_CONSUME_GUARD_OFFSET_27 = 0x282612C

    private fun knownFreeReturnQuantity27(bytes: ByteArray): Boolean {
        val code = instruction(bytes, RETURN_QUANTITY_OFFSET_27)
        return (code and 0xFFE0001F.toInt()) == 0xD2800013.toInt() &&
            ((code ushr 5) and 0xFFFF) in 10..5000
    }

    private fun knownInstantReturnCount27(bytes: ByteArray): Boolean {
        val code = instruction(bytes, INSTANT_RETURN_COUNT_OFFSET_27)
        return (code and 0xFFE0001F.toInt()) == 0x52800000 &&
            ((code ushr 5) and 0xFFFF) in 10..5000 &&
            equalAt(bytes, INSTANT_RETURN_COUNT_OFFSET_27 + 4, INSTANT_RETURN_COUNT_RET)
    }

    /**
     * Normalize ONLY our recognized 27.0.0 changes to compare the complete
     * original library hash. This allows the Return and 0-shard patches in
     * either order, without accepting arbitrary updated ARM64 code.
     */
    private fun verify27Native(input: ByteArray) {
        require(input.size == EXPECTED_SIZE_27) {
            "Unsupported XP Hero 27.0.0 ARM64 library length"
        }
        require(equalAt(input, TOMB_OFFSET_27 - 8, TOMB_NEIGHBORS)) {
            "Unexpected XP Hero 27.0.0 Heroes' Tomb instructions"
        }
        val normalized = input.copyOf()
        require(equalAt(input, HERO_UNLOCK_CONSUME_OFFSET_27 - 4, HERO_UNLOCK_COMPARE)) {
            "Unexpected XP Hero 27.0.0 zero-piece guard comparison"
        }
        val choices = listOf(
            Triple(TRAIT_OFFSET_27, ORIGINAL_TRAIT, FREE_TRAIT),
            Triple(HERO_UNLOCK_CONSUME_OFFSET_27, ORIGINAL_HERO_UNLOCK_27, ZERO_HERO_UNLOCK_27),
            Triple(TOMB_OFFSET_27, ORIGINAL_TOMB, FREE_TOMB),
            Triple(RETURN_ITEM_OFFSET_27, ORIGINAL_RETURN_ITEM, FREE_RETURN_ITEM),
            Triple(RETURN_NO_PASS_OFFSET_27, ORIGINAL_RETURN_NO_PASS, FREE_RETURN_NO_PASS),
            Triple(RETURN_INACTIVE_PASS_OFFSET_27, ORIGINAL_RETURN_INACTIVE_PASS, FREE_RETURN_INACTIVE_PASS),
            Triple(RETURN_FREE_CONSUME_GUARD_OFFSET_27,
                ORIGINAL_RETURN_FREE_CONSUME_GUARD, INSTANT_RETURN_FREE_CONSUME_GUARD)
        ) + STAR_TEMPORARY_SHARD_PATCHES_27
        for ((offset, original, changed) in choices) {
            require(equalAt(input, offset, original) || equalAt(input, offset, changed)) {
                "Unsupported XP Hero 27.0.0 native instruction at 0x" + offset.toString(16)
            }
            original.copyInto(normalized, offset)
        }
        require(equalAt(input, RETURN_QUANTITY_OFFSET_27, ORIGINAL_RETURN_QUANTITY) ||
            knownFreeReturnQuantity27(input)) {
            "Unsupported XP Hero 27.0.0 Return daily quantity instruction"
        }
        ORIGINAL_RETURN_QUANTITY.copyInto(normalized, RETURN_QUANTITY_OFFSET_27)
        require(equalAt(input, INSTANT_RETURN_COUNT_OFFSET_27, ORIGINAL_RETURN_COUNT_ENTRY) ||
            knownInstantReturnCount27(input)) {
            "Unsupported XP Hero 27.0.0 free Return count function"
        }
        ORIGINAL_RETURN_COUNT_ENTRY.copyInto(normalized, INSTANT_RETURN_COUNT_OFFSET_27)
        val sha = MessageDigest.getInstance("SHA-256").digest(normalized)
            .joinToString("") { "%02x".format(it) }
        require(sha == ORIGINAL_SHA_27) {
            "Unexpected XP Hero 27.0.0 ARM64 code; refusing native edits"
        }
    }

    private fun freeHeroesTombRefills27(input: ByteArray, freeReturnDaily: Int): ByteArray {
        verify27Native(input)
        return input.copyOf().also { result ->
            FREE_TOMB.copyInto(result, TOMB_OFFSET_27)
            replaceInstruction(result, RETURN_QUANTITY_OFFSET_27,
                0xD2800013.toInt() or (freeReturnDaily shl 5))
            FREE_RETURN_ITEM.copyInto(result, RETURN_ITEM_OFFSET_27)
            FREE_RETURN_NO_PASS.copyInto(result, RETURN_NO_PASS_OFFSET_27)
            FREE_RETURN_INACTIVE_PASS.copyInto(result, RETURN_INACTIVE_PASS_OFFSET_27)
            replaceInstruction(result, INSTANT_RETURN_COUNT_OFFSET_27,
                0x52800000 or (freeReturnDaily shl 5))
            INSTANT_RETURN_COUNT_RET.copyInto(result, INSTANT_RETURN_COUNT_OFFSET_27 + 4)
            INSTANT_RETURN_FREE_CONSUME_GUARD.copyInto(result, RETURN_FREE_CONSUME_GUARD_OFFSET_27)
        }
    }

    private fun freeHeroStarUpgrades27(input: ByteArray): ByteArray {
        verify27Native(input)
        for ((offset, original, _) in STAR_TEMPORARY_SHARD_PATCHES_27) {
            require(equalAt(input, offset, original)) {
                "XP Hero 27.0.0 upgrade instruction mismatch at 0x" + offset.toString(16)
            }
        }
        return input.copyOf().also { out ->
            for ((offset, _, modified) in STAR_TEMPORARY_SHARD_PATCHES_27) {
                modified.copyInto(out, offset)
            }
        }
    }

    // CalculateRollCost ARM64 method entry, user-tested free trait rerolls.
    private const val TRAIT_OFFSET = 0x2686684
    private val ORIGINAL_TRAIT = byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(), 0xF6.toByte(), 0x57, 0x01, 0xA9.toByte()
    )
    private val FREE_TRAIT = byteArrayOf(
        0x00, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte()
    )

    // HeroTombTicketController.GetChargeCost at VA 0x024CD2CC.
    // Original: cmp w8,#0; mov w9,#100; csel w0,w8,w9,gt
    // Patched:  cmp w8,#0; mov w9,#100; mov w0,w8
    // Returns the configured zero instead of substituting 100 gems.
    private const val TOMB_OFFSET = 0x24C92CC
    private val ORIGINAL_TOMB = byteArrayOf(0x00, 0xC1.toByte(), 0x89.toByte(), 0x1A)
    private val FREE_TOMB = byteArrayOf(0xE0.toByte(), 0x03, 0x08, 0x2A)
    private val TOMB_NEIGHBORS = byteArrayOf(
        0x1F, 0x01, 0x00, 0x71, // cmp w8,#0
        0x89.toByte(), 0x0C, 0x80.toByte(), 0x52 // mov w9,#100
    )
    // CostumeManager.TryGradeUp: the unmodified HasEnough(cost) check accepts
    // zero (inventory balance >= zero). The prior v1.3.8-1.3.10 changes
    // incorrectly bypassed that check, while leaving the next B.LT guard in
    // place; the zero-cost operation then SKIPPED TryConsume and its normal
    // transaction/notification path. The user's upgrade persisted but the
    // upgrade UI stayed locked until restarting the game.
    //
    // Keep the original HasEnough result branch at VA 0x02847EA0; NOP ONLY
    // the B.LT skip of the zero-quantity consumer at VA 0x02847EA8. Thus the
    // real TryConsume(0) call at 0x02847EBC runs and continues through the
    // ordinary grade-up notifications. This does not deduct shards.
    private const val STAR_UPGRADE_OFFSET = 0x2843EA0
    private val ORIGINAL_STAR_UPGRADE = byteArrayOf(0xA0.toByte(), 0x1A, 0x00, 0x36)
    private val LEGACY_MOV_STAR_UPGRADE = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52) // v1.3.10
    private val LEGACY_NOP_STAR_UPGRADE = byteArrayOf(0x1F, 0x20, 0x03, 0xD5.toByte()) // v1.3.8-9
    private val STAR_UPGRADE_SPEND_CMP = byteArrayOf(0xDF.toByte(), 0x06, 0x00, 0xF1.toByte())
    private const val STAR_ZERO_SPEND_GUARD_OFFSET = STAR_UPGRADE_OFFSET + 8
    private val ORIGINAL_STAR_ZERO_SPEND_GUARD = byteArrayOf(0x2B, 0x01, 0x00, 0x54)
    private val FREE_STAR_ZERO_SPEND_GUARD = byteArrayOf(0x1F, 0x20, 0x03, 0xD5.toByte()) // NOP
    // CostumeController.TryGradeUpCostume (VA 0x028482FC) uses the actual
    // character-detail upgrade path, unlike CostumeManager.TryGradeUp.
    //
    // In the working 1-shard flow, VA 0x02848460 loads the 64-bit Cost1_Amount
    // into x23, VA 0x02848478 calls HasEnoughPieces(int,long), and VA
    // 0x02848484 reloads the cost into x19 before consuming it.
    //
    // For this star-upgrade callsite ONLY:
    // - display data remains Cost1_Amount=0, so the screen shows free
    // - pass a positive virtual cost of 1 to the native grade-up operation
    // - replace the HasEnoughPieces call with AddCostumePiece(id, 1)
    // - skip the old boolean affordability branch (AddCostumePiece is void)
    // - pass amount 1 to the ORIGINAL TryConsumeCostumePiece, which deducts
    //   the temporary one and fires its ordinary upgrade/UI callbacks.
    //
    // Both functions accept the same (int costumeID, long amount) arguments.
    // Positive-cost hero upgrades are preserved; unrelated piece transactions
    // are not intercepted. In a successful operation, net shards = +1 -1 = 0.
    // A crash between these calls could leave a temporary +1 shard saved.
    private val STAR_TEMPORARY_SHARD_PATCHES = listOf(
        Triple(0x2848460 - 0x4000,
            byteArrayOf(0xD7.toByte(), 0x12, 0x40, 0xF9.toByte()), // LDR X23,[X22,#0x20]
            byteArrayOf(0x37, 0x00, 0x80.toByte(), 0xD2.toByte())), // MOV X23,#1
        Triple(0x2848478 - 0x4000,
            byteArrayOf(0x11, 0x18, 0x00, 0x94.toByte()), // BL HasEnoughPieces
            byteArrayOf(0x9F.toByte(), 0x31, 0x00, 0x94.toByte())), // BL AddCostumePiece
        Triple(0x284847C - 0x4000,
            byteArrayOf(0x20, 0x1A, 0x00, 0x36), // TBZ W0,#0,fail
            byteArrayOf(0x1F, 0x20, 0x03, 0xD5.toByte())), // NOP
        Triple(0x2848484 - 0x4000,
            byteArrayOf(0xD3.toByte(), 0x12, 0x40, 0xF9.toByte()), // LDR X19,[X22,#0x20]
            byteArrayOf(0x33, 0x00, 0x80.toByte(), 0xD2.toByte())), // MOV X19,#1
    )

    // CostumeController.TryGradeUpCostume calls TryConsumeCostumePiece.
    // The original <= 0 guard at VA 0x02852E64 diverts zero-amount spend
    // away from its inventory transaction and change notifications. The old
    // v1.3.9-v1.3.11 shortcut forced success without those notifications.
    // New B.LT condition rejects only negative amounts and passes 0 into
    // the lower consumer at VA 0x02854ED4. Disassembly confirms that
    // lower consumer accepts zero (balance - 0 >= 0) and emits the normal
    // update/notification, without deducting a shard.
    private const val HERO_UNLOCK_CONSUME_OFFSET = 0x2852e64 - 0x4000
    private val ORIGINAL_HERO_UNLOCK = byteArrayOf(0x4D, 0x09, 0x00, 0x54)
    private val LEGACY_ZERO_HERO_UNLOCK = byteArrayOf(0x0D, 0x09, 0x00, 0x54) // v1.3.9-1.3.11: skip notification path
    // B.LE -> B.LT: allow zero amount through ordinary consume/notification
    // code, but still reject invalid negative amounts.
    private val ZERO_HERO_UNLOCK = byteArrayOf(0x4B, 0x09, 0x00, 0x54)
    private val HERO_UNLOCK_COMPARE = byteArrayOf(0x7F, 0x02, 0x00, 0xF1.toByte())
    private val HERO_UNLOCK_SUCCESS = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52)


    // HomeReturnPortalPassController.ResetDailyTickets originally sets
    // Stackable_HomeReturnPortalTicket (paid, item 7001) to the advertised
    // 30-day pass quantity. The Return-use path accepts item 7002, the
    // independent Stackable_HomeReturnPortalFreeTicket. The fix directs this
    // daily reset to 7002, with a configurable quantity, without changing
    // or activating any paid in-app purchase.
    private const val RETURN_QUANTITY_OFFSET = 0x24C0DC0
    private const val RETURN_ITEM_OFFSET = 0x24C0DD8
    private val ORIGINAL_RETURN_QUANTITY = byteArrayOf(0x73, 0x42, 0x80.toByte(), 0xB9.toByte())
    private val ORIGINAL_RETURN_ITEM = byteArrayOf(0x20, 0x6B, 0x83.toByte(), 0x52)
    private val FREE_RETURN_ITEM = byteArrayOf(0x40, 0x6B, 0x83.toByte(), 0x52)

    // HomeReturnPortalPassController daily-reset handler (VA 0x024C4C48).
    // Before v1.3.11, the new free-ticket ResetDailyTickets call only ran
    // when a PAID pass existed AND was active. For accounts without a pass,
    // these two branches skipped free ticket delivery entirely. Redirect
    // only the null/inactive-pass exits to the EXISTING ResetDailyTickets
    // invocation at VA 0x024C4CF0. Active paid-pass handling stays intact.
    // Original "cbz x0, 0x24C4D64" -> "cbz x0, 0x24C4CF0".
    private const val RETURN_NO_PASS_OFFSET = 0x24C4CD0 - 0x4000
    private val ORIGINAL_RETURN_NO_PASS = byteArrayOf(0xA0.toByte(), 0x04, 0x00, 0xB4.toByte())
    private val FREE_RETURN_NO_PASS = byteArrayOf(0x00, 0x01, 0x00, 0xB4.toByte())
    // Original "tbz w0,#0, 0x24C4D64" -> "tbz w0,#0, 0x24C4CF0".
    private const val RETURN_INACTIVE_PASS_OFFSET = 0x24C4CDC - 0x4000
    private val ORIGINAL_RETURN_INACTIVE_PASS = byteArrayOf(0x40, 0x04, 0x00, 0x36)
    private val FREE_RETURN_INACTIVE_PASS = byteArrayOf(0xA0.toByte(), 0x00, 0x00, 0x36)

    // GetFreeTicketCount (VA 0x024C237C) is used by the actual field Return
    // action. Daily resets cannot be relied on to give the user tickets NOW.
    // Return a configured virtual free-ticket allowance immediately instead
    // of waiting for the daily-reset callback. No paid item 7001 is touched.
    // At the free-ticket consumption call, allow the Return completion path
    // when the underlying item 7002 inventory is still zero.
    // These do NOT grant 5000 persisted items or change paid purchase offers.
    private const val INSTANT_RETURN_COUNT_OFFSET = 0x24C237C - 0x4000
    private val ORIGINAL_RETURN_COUNT_ENTRY = byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(),
        0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte())
    private val INSTANT_RETURN_COUNT_RET = byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    private const val RETURN_FREE_CONSUME_GUARD_OFFSET = 0x24C6458 - 0x4000
    private val ORIGINAL_RETURN_FREE_CONSUME_GUARD = byteArrayOf(
        0xE0.toByte(), 0x06, 0x00, 0x36)
    private val INSTANT_RETURN_FREE_CONSUME_GUARD = byteArrayOf(
        0x1F, 0x20, 0x03, 0xD5.toByte()) // ARM64 NOP


    private fun instruction(bytes: ByteArray, offset: Int): Int =
        (bytes[offset].toInt() and 255) or
            ((bytes[offset + 1].toInt() and 255) shl 8) or
            ((bytes[offset + 2].toInt() and 255) shl 16) or
            ((bytes[offset + 3].toInt() and 255) shl 24)

    private fun replaceInstruction(bytes: ByteArray, offset: Int, code: Int) {
        for (i in 0..3) bytes[offset + i] = (code ushr (i * 8)).toByte()
    }

    private fun knownInstantReturnCount(bytes: ByteArray): Boolean {
        val word = instruction(bytes, INSTANT_RETURN_COUNT_OFFSET)
        return (word and 0xFFE0001F.toInt()) == 0x52800000 &&
            ((word ushr 5) and 0xFFFF) in 10..5000 &&
            equalAt(bytes, INSTANT_RETURN_COUNT_OFFSET + 4, INSTANT_RETURN_COUNT_RET)
    }

    private fun knownFreeReturnQuantity(bytes: ByteArray): Boolean {
        val code = instruction(bytes, RETURN_QUANTITY_OFFSET)
        // ARM64 MOVZ x19,#imm16, no shift; only accept 10..5000.
        return (code and 0xFFE0001F.toInt()) == 0xD2800013.toInt() &&
            ((code ushr 5) and 0xffff) in 10..5000
    }

    private fun equalAt(bytes: ByteArray, offset: Int, pattern: ByteArray): Boolean =
        bytes.copyOfRange(offset, offset + pattern.size).contentEquals(pattern)

    private fun verify(input: ByteArray) {
        require(input.size == EXPECTED_SIZE) { "Unexpected XP Hero IL2CPP binary size" }
        require(equalAt(input, TOMB_OFFSET - 8, TOMB_NEIGHBORS)) {
            "Different Heroes' Tomb price calculation; refusing patch"
        }
        require(equalAt(input, STAR_UPGRADE_OFFSET + 4, STAR_UPGRADE_SPEND_CMP)) {
            "The zero-shard spending comparison differs; refusing hero upgrade edit"
        }
        require(equalAt(input, HERO_UNLOCK_CONSUME_OFFSET - 4, HERO_UNLOCK_COMPARE) &&
                equalAt(input, HERO_UNLOCK_CONSUME_OFFSET + 0x120, HERO_UNLOCK_SUCCESS)) {
            "Different XP Hero zero-piece unlock function; refusing patch"
        }
        val normalized = input.copyOf()
        require(equalAt(input, RETURN_QUANTITY_OFFSET, ORIGINAL_RETURN_QUANTITY) ||
            knownFreeReturnQuantity(input)) {
            "Unexpected Return ticket daily-reset quantity instruction"
        }
        require(equalAt(input, RETURN_ITEM_OFFSET, ORIGINAL_RETURN_ITEM) ||
            equalAt(input, RETURN_ITEM_OFFSET, FREE_RETURN_ITEM)) {
            "Unexpected Return ticket daily-reset item identifier"
        }
        ORIGINAL_RETURN_QUANTITY.copyInto(normalized, RETURN_QUANTITY_OFFSET)
        ORIGINAL_RETURN_ITEM.copyInto(normalized, RETURN_ITEM_OFFSET)
        require(equalAt(input, INSTANT_RETURN_COUNT_OFFSET, ORIGINAL_RETURN_COUNT_ENTRY) ||
            knownInstantReturnCount(input)) {
            "Unexpected XP Hero free Return count reader"
        }
        ORIGINAL_RETURN_COUNT_ENTRY.copyInto(normalized, INSTANT_RETURN_COUNT_OFFSET)
        require(equalAt(input, RETURN_FREE_CONSUME_GUARD_OFFSET, ORIGINAL_RETURN_FREE_CONSUME_GUARD) ||
            equalAt(input, RETURN_FREE_CONSUME_GUARD_OFFSET, INSTANT_RETURN_FREE_CONSUME_GUARD)) {
            "Unexpected XP Hero free Return consume result branch"
        }
        ORIGINAL_RETURN_FREE_CONSUME_GUARD.copyInto(normalized, RETURN_FREE_CONSUME_GUARD_OFFSET)
        for ((offset, original, changed) in listOf(
            Triple(RETURN_NO_PASS_OFFSET, ORIGINAL_RETURN_NO_PASS, FREE_RETURN_NO_PASS),
            Triple(RETURN_INACTIVE_PASS_OFFSET, ORIGINAL_RETURN_INACTIVE_PASS, FREE_RETURN_INACTIVE_PASS)
        )) {
            require(equalAt(input, offset, original) || equalAt(input, offset, changed)) {
                "Unexpected Return daily-reset pass gate"
            }
            original.copyInto(normalized, offset)
        }

        for ((offset, original, changed) in listOf(
            Triple(TRAIT_OFFSET, ORIGINAL_TRAIT, FREE_TRAIT),
            Triple(TOMB_OFFSET, ORIGINAL_TOMB, FREE_TOMB)
        )) {
            require(equalAt(input, offset, original) || equalAt(input, offset, changed)) {
                "Unknown XP Hero native instructions"
            }
            original.copyInto(normalized, offset)
        }
        // Both the old shortcut to success and the newer B.LT fall-through
        // must be accepted and restored for the exact original SHA check.
        require(equalAt(input, HERO_UNLOCK_CONSUME_OFFSET, ORIGINAL_HERO_UNLOCK) ||
            equalAt(input, HERO_UNLOCK_CONSUME_OFFSET, LEGACY_ZERO_HERO_UNLOCK) ||
            equalAt(input, HERO_UNLOCK_CONSUME_OFFSET, ZERO_HERO_UNLOCK)) {
            "Unknown XP Hero zero-piece consume instruction"
        }
        ORIGINAL_HERO_UNLOCK.copyInto(normalized, HERO_UNLOCK_CONSUME_OFFSET)

        // Normalize all previous released star-upgrade byte patterns, plus
        // the new zero-cost Spend guard, before the original-library SHA check.
        require(equalAt(input, STAR_UPGRADE_OFFSET, ORIGINAL_STAR_UPGRADE) ||
            equalAt(input, STAR_UPGRADE_OFFSET, LEGACY_MOV_STAR_UPGRADE) ||
            equalAt(input, STAR_UPGRADE_OFFSET, LEGACY_NOP_STAR_UPGRADE)) {
            "Unknown XP Hero star upgrade approval branch"
        }
        require(equalAt(input, STAR_ZERO_SPEND_GUARD_OFFSET, ORIGINAL_STAR_ZERO_SPEND_GUARD) ||
            equalAt(input, STAR_ZERO_SPEND_GUARD_OFFSET, FREE_STAR_ZERO_SPEND_GUARD)) {
            "Unknown XP Hero star upgrade spend branch"
        }
        ORIGINAL_STAR_UPGRADE.copyInto(normalized, STAR_UPGRADE_OFFSET)
        ORIGINAL_STAR_ZERO_SPEND_GUARD.copyInto(normalized, STAR_ZERO_SPEND_GUARD_OFFSET)
        for ((offset, original, virtualOne) in STAR_TEMPORARY_SHARD_PATCHES) {
            require(equalAt(input, offset, original) || equalAt(input, offset, virtualOne)) {
                "Unexpected XP Hero star-upgrade credit instruction"
            }
            original.copyInto(normalized, offset)
        }
        val sha = MessageDigest.getInstance("SHA-256").digest(normalized)
            .joinToString("") { "%02x".format(it) }
        require(sha == ORIGINAL_SHA) { "Unexpected XP Hero ARM64 code; refusing patch" }
    }

    /**
     * Let the normal hero-unlock purchase flow treat a zero-piece
     * consumption as success, without changing positive piece spending.
     */
    fun allowZeroPieceHeroUnlock(input: ByteArray): ByteArray {
        if (input.size == EXPECTED_SIZE_27) {
            verify27Native(input)
            return input.copyOf().also {
                ZERO_HERO_UNLOCK_27.copyInto(it, HERO_UNLOCK_CONSUME_OFFSET_27)
            }
        }
        verify(input)
        return input.copyOf().also {
            ZERO_HERO_UNLOCK.copyInto(it, HERO_UNLOCK_CONSUME_OFFSET)
        }
    }

    /**
     * Zero-cost presentation with the ordinary positive-quantity star-upgrade
     * transaction. Credit one shard *only* inside the character grade-up
     * callsite and consume it through the original successful one-shard path.
     */
    fun freeHeroStarUpgrades(input: ByteArray): ByteArray {
        if (input.size == EXPECTED_SIZE_27) return freeHeroStarUpgrades27(input)
        verify(input)
        return input.copyOf().also { result ->
            // Reverse earlier patches to the unrelated static grade-up route.
            ORIGINAL_STAR_UPGRADE.copyInto(result, STAR_UPGRADE_OFFSET)
            ORIGINAL_STAR_ZERO_SPEND_GUARD.copyInto(result, STAR_ZERO_SPEND_GUARD_OFFSET)
            // Do not touch HERO_UNLOCK_CONSUME_OFFSET: the optional Blaster/Hana
            // free-unlock patch owns that shared instruction independently.
            for ((offset, _, virtualOne) in STAR_TEMPORARY_SHARD_PATCHES) {
                virtualOne.copyInto(result, offset)
            }
        }
    }

    fun freeTraitRerolls(input: ByteArray): ByteArray {
        if (input.size == EXPECTED_SIZE_27) {
            verify27Native(input)
            return input.copyOf().also { FREE_TRAIT.copyInto(it, TRAIT_OFFSET_27) }
        }
        verify(input)
        return input.copyOf().also { FREE_TRAIT.copyInto(it, TRAIT_OFFSET) }
    }

    fun freeHeroesTombRefills(input: ByteArray, freeReturnDaily: Int): ByteArray {
        require(freeReturnDaily in 10..5000) { "Invalid daily free Return ticket count" }
        if (input.size == EXPECTED_SIZE_27) return freeHeroesTombRefills27(input, freeReturnDaily)
        verify(input)
        return input.copyOf().also {
            FREE_TOMB.copyInto(it, TOMB_OFFSET)
            // MOVZ x19,#freeReturnDaily — count passed to stackable setter.
            replaceInstruction(it, RETURN_QUANTITY_OFFSET,
                0xD2800013.toInt() or (freeReturnDaily shl 5))
            FREE_RETURN_ITEM.copyInto(it, RETURN_ITEM_OFFSET)
            FREE_RETURN_NO_PASS.copyInto(it, RETURN_NO_PASS_OFFSET)
            FREE_RETURN_INACTIVE_PASS.copyInto(it, RETURN_INACTIVE_PASS_OFFSET)
            replaceInstruction(it, INSTANT_RETURN_COUNT_OFFSET,
                0x52800000 or (freeReturnDaily shl 5)) // MOV W0,#N
            INSTANT_RETURN_COUNT_RET.copyInto(it, INSTANT_RETURN_COUNT_OFFSET + 4)
            INSTANT_RETURN_FREE_CONSUME_GUARD.copyInto(it, RETURN_FREE_CONSUME_GUARD_OFFSET)
        }
    }
}
