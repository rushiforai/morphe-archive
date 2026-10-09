package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val renameShopToHomePatch = rawResourcePatch(
    name = "Replace Shop with Home",
    description = "Replaces the Shop bottom navigation tab with Home, a custom screen to replace the overly-commercial Shop screen.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        // 1. Rename tab title: replace string operand "navigation.Shop" with "navigation.Home" in ProtectedStack
        val protectedStackOffset = editor.findFunctionOffsetByName("ProtectedStack")
            ?: throw PatchException("ProtectedStack function not found")

        val oldTitleId = editor.findStringId("navigation.Shop")
            ?: throw PatchException("String 'navigation.Shop' not found")
        val newTitleId = editor.findStringId("navigation.Home")
            ?: throw PatchException("String 'navigation.Home' not found")

        val bytes = editor.toByteArray()

        val oldTitleBytes = byteArrayOf(
            (oldTitleId and 0xFF).toByte(),
            ((oldTitleId ushr 8) and 0xFF).toByte()
        )
        val newTitleBytes = byteArrayOf(
            (newTitleId and 0xFF).toByte(),
            ((newTitleId ushr 8) and 0xFF).toByte()
        )

        // Locate LoadConstString for navigation.Shop within ProtectedStack bytecode
        var titlePatched = false
        for (i in protectedStackOffset until minOf(protectedStackOffset + 15_000, bytes.size - 3)) {
            // LoadConstString opcode is 0x90, format: [0x90, reg, id_low, id_high].
            if ((bytes[i].toInt() and 0xFF) == 0x90 &&
                bytes[i + 2] == oldTitleBytes[0] &&
                bytes[i + 3] == oldTitleBytes[1]
            ) {
                bytes[i + 2] = newTitleBytes[0]
                bytes[i + 3] = newTitleBytes[1]
                titlePatched = true
                break
            }
        }
        if (!titlePatched) {
            throw PatchException("Could not find LoadConstString instruction for navigation.Shop in ProtectedStack")
        }

        // 2. StoreRoot (Module 11877) dependency table redirection:
        // - dep[17] (was 11878 ScrollListView) -> 10517 (OrdersListHeader)
        // - dep[18] (was 11881 StoreHeaderList) -> 8489 (PaymentStreakBanner)
        // - dep[19] (was 11892) -> 11882 (ShopTabShortcutsRow)
        val storeRootDepExpected = byteArrayOf(
            0xe6.toByte(), 0x05, 0x00, 0x00, // dep[15] = 1510
            0x56, 0x0d, 0x00, 0x00,           // dep[16] = 3414
            0x66, 0x2e, 0x00, 0x00,           // dep[17] = 11878 (ScrollListView)
            0x69, 0x2e, 0x00, 0x00,           // dep[18] = 11881 (ShopTabShortcutsRow)
            0x74, 0x2e, 0x00, 0x00            // dep[19] = 11892
        )
        val storeRootDepReplacement = byteArrayOf(
            0xe6.toByte(), 0x05, 0x00, 0x00, // dep[15] = 1510
            0x56, 0x0d, 0x00, 0x00,           // dep[16] = 3414
            0x15, 0x29, 0x00, 0x00,           // dep[17] = 10517 (OrdersListHeader)
            0x29, 0x21, 0x00, 0x00,           // dep[18] = 8489 (PaymentStreakBanner)
            0x6a, 0x2e, 0x00, 0x00            // dep[19] = 11882 (ShopTabShortcutsRow)
        )
        require(storeRootDepExpected.size == storeRootDepReplacement.size) {
            "StoreRoot dependency replacement size mismatch"
        }
        var storeRootDepOffset = -1
        for (i in 0..(bytes.size - storeRootDepExpected.size)) {
            if (bytes[i] == storeRootDepExpected[0] &&
                bytes[i + 1] == storeRootDepExpected[1] &&
                storeRootDepExpected.indices.all { j -> bytes[i + j] == storeRootDepExpected[j] }
            ) {
                storeRootDepOffset = i
                break
            }
        }
        if (storeRootDepOffset == -1) {
            throw PatchException("Could not find StoreRoot dependency pattern")
        }
        editor.patchBytesIfMatches(storeRootDepOffset, storeRootDepExpected, storeRootDepReplacement)

        // 3. StoreRoot custom layout composition:
        // Constructs direct 4-child array:
        // [0] Header/Search (HeaderView)
        // [1] ShopTabShortcutsRow (Your Shortcuts carousel)
        // [2] OrdersListHeader (Total you owe balance & upcoming payments)
        // [3] PaymentStreakBanner (Spending Power & payment streak progress)
        val storeRootOffset = editor.findFunctionOffsetByName("StoreRoot")
            ?: throw PatchException("StoreRoot function not found")

        val feedPropsOffset = storeRootOffset + 16_193 // Offset 0x3f41 within StoreRoot
        val expectedSpan = byteArrayOf(
            0x08, 0x54, 0x02, 0x00,                                         // NewArray r84, 2
            0x5a, 0x54, 0x55, 0x00,                                         // DefineOwnInDenseArray r84, r85, 0
            0x44, 0x57, 0x16, 0xff.toByte(), 0xae.toByte(),                 // GetByIdShort r87, r22, 255, stringId174 (jsx)
            0x3b, 0x55, 0x10, 0x10,                                         // LoadFromEnvironment r85, r16, 16
            0x44, 0x56, 0x55, 0x1e, 0x70,                                   // GetByIdShort r86, r85, 30, stringId112 (default)
            0x02, 0x55, 0xe3.toByte(), 0x48, 0x00, 0x00, 0x7f, 0x9a.toByte(), 0x09, 0x00, // NewObjectWithBufferLong r85, ...
            0x52, 0x55, 0x65, 0x00, 0x52, 0x55, 0x64, 0x01, 0x52, 0x55, 0x63, 0x02, 0x52, 0x55, 0x62, 0x03,
            0xb0.toByte(), 0x07, 0x61, 0x3b, 0x60, 0x10, 0x45, 0x52, 0x55, 0x60, 0x04, 0x52, 0x55, 0x5f, 0x05,
            0x52, 0x55, 0x5e, 0x06, 0x52, 0x55, 0x5d, 0x07, 0x52, 0x55, 0x5c, 0x08, 0x52, 0x55, 0x5b, 0x09,
            0x52, 0x55, 0x5a, 0x0b, 0x52, 0x55, 0x59, 0x0c, 0x52, 0x55, 0x58, 0x0d,
            0x6f, 0x55, 0x57, 0x02, 0x56, 0x55,                             // Call3 r85, r87, r2, r86, r85
            0x5a, 0x54, 0x55, 0x01                                          // DefineOwnInDenseArray r84, r85, 1
        )

        val customHomeSpan = byteArrayOf(
            // 1. Initialize children array in r84 (size 4) and insert [0] Header/Search (already in r85)
            0x08, 0x54, 0x04, 0x00,                                         // NewArray r84, 4
            0x5a, 0x54, 0x55, 0x00,                                         // DefineOwnInDenseArray r84, r85, 0

            // 2. Load jsx callee into r87
            0x44, 0x57, 0x16, 0xff.toByte(), 0xae.toByte(),                 // GetByIdShort r87, r22, 255, stringId174 (jsx)

            // 3. Shared fresh empty props in r88
            0x04, 0x58,                                                     // NewObject r88

            // 4. Construct [3] ShopTabShortcutsRow (env[18] = dep[19] = Module 11882)
            0x3b, 0x55, 0x10, 0x12,                                         // LoadFromEnvironment r85, r16, 18
            0x44, 0x56, 0x55, 0x1e, 0x70,                                   // GetByIdShort r86, r85, 30, stringId112 (.default)
            0x6f, 0x55, 0x57, 0x02, 0x56, 0x58,                             // Call3 r85, r87, r2, r86, r88
            0x5a, 0x54, 0x55, 0x03,                                         // DefineOwnInDenseArray r84, r85, 3 (Your Shortcuts at index 3)

            // 5. Construct [1] OrdersListHeader (env[16] = dep[17] = Module 10517)
            0x04, 0x58,                                                     // NewObject r88 (FRESH empty props for OrdersListHeader!)
            0x3b, 0x55, 0x10, 0x10,                                         // LoadFromEnvironment r85, r16, 16
            0x44, 0x56, 0x55, 0x1e, 0x70,                                   // GetByIdShort r86, r85, 30, stringId112 (.default)
            0x6f, 0x55, 0x57, 0x02, 0x56, 0x58,                             // Call3 r85, r87, r2, r86, r88
            0x5a, 0x54, 0x55, 0x01,                                         // DefineOwnInDenseArray r84, r85, 1 (Total you owe at index 1)

            // 6. Construct props for [2] PaymentStreakBanner in r88: { sezzleUpCreditLimit: sezzleUp.credit_limit }
            0x04, 0x58,                                                     // NewObject r88
            0x3b, 0x55, 0x1e, 0x08,                                         // LoadFromEnvironment r85, r30, 8 (sezzleUp)
            0x45, 0x55, 0x55, 0x68, 0xad.toByte(), 0x90.toByte(),           // GetById r85, r85, cache104, stringId37037 (credit_limit)
            0x4a, 0x58, 0x55, 0x00, 0x53, 0xef.toByte(),                   // PutByIdLoose r88, r85, cache0, stringId61267 (sezzleUpCreditLimit)

            // 7. Construct [2] PaymentStreakBanner (env[17] = dep[18] = Module 8489)
            0x3b, 0x55, 0x10, 0x11,                                         // LoadFromEnvironment r85, r16, 17
            0x44, 0x56, 0x55, 0x1e, 0x70,                                   // GetByIdShort r86, r85, 30, stringId112 (.default)
            0x6f, 0x55, 0x57, 0x02, 0x56, 0x58,                             // Call3 r85, r87, r2, r86, r88
            0x5a, 0x54, 0x55, 0x02,                                         // DefineOwnInDenseArray r84, r85, 2 (Spending Power / Streak at index 2)

            // Exactly 9 AsyncBreakCheck (0x7e) padding bytes (92 + 9 = 101 bytes)
            0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e
        )
        require(expectedSpan.size == customHomeSpan.size) {
            "StoreRoot custom layout span size mismatch: expected ${expectedSpan.size}, got ${customHomeSpan.size}"
        }
        require(expectedSpan.size == 101) {
            "StoreRoot expected span size must be 101 bytes"
        }
        require(customHomeSpan.size == 101) {
            "StoreRoot custom span size must be 101 bytes"
        }

        if (!editor.matchesBytes(feedPropsOffset, expectedSpan)) {
            throw PatchException("Unexpected StoreRoot bytecode instructions")
        }
        editor.patchBytesIfMatches(feedPropsOffset, expectedSpan, customHomeSpan)

        // 4. OrdersListHeader: Adapt for Home vs Orders screens
        // - On Home screen: props.status (r17) is undefined.
        // - On Orders screen: props.status (r17) is a string ("upcoming-payments" or "orders").
        val ordersListHeaderOffset = editor.findFunctionOffsetByName("OrdersListHeader")
            ?: throw PatchException("OrdersListHeader function not found")

        // 4a. Preserve the original nullish total_in_cents fallback, then conditionally pass navigation:
        // - total_in_cents nullish: pass zero to TotalOwedSectionV2.
        // - Home (status r17 falsy): pass undefined navigation to TotalOwedSectionV2.
        // - Orders (status r17 truthy): preserve the original navigation.
        val ordersListHeaderNavOffset = ordersListHeaderOffset + 0x05d6
        val ordersListHeaderNavExpected = byteArrayOf(
            0x94.toByte(), 0x04, 0x16, 0x05, 0x13, 0x04, 0x93.toByte(), 0x17, 0xb0.toByte(), 0x09, 0x05, 0x45, 0x17, 0x13, 0x18, 0xe3.toByte(),
            0x6f, 0xd1.toByte(), 0x06, 0x17, 0x04, 0x97.toByte(), 0x17, 0x01, 0x13, 0x06, 0x45, 0xe7.toByte(), 0xfe.toByte(), 0x52, 0x13, 0x17,
            0x00, 0x52, 0x13, 0x16, 0x01, 0x6f, 0x13, 0x15, 0x03, 0x14, 0x13, 0x52, 0x09, 0x13, 0x01, 0x6f,
            0x0c, 0x12, 0x03, 0x0f, 0x09
        )
        val ordersListHeaderNavReplacement = byteArrayOf(
            0x94.toByte(), 0x04,                                            // 05d6: LoadConstNull r4
            0xcf.toByte(), 0x0e, 0x13, 0x04,                                // 05d8: JEqual +14, r19, r4 -> 05e6
            0x45, 0x17, 0x13, 0x18, 0xe3.toByte(), 0x6f,                    // 05dc: GetById r23, r19, 24, stringId 28643 (total_in_cents)
            0xd1.toByte(), 0x06, 0x17, 0x04,                                // 05e2: JNotEqual +6, r23, r4 -> 05e8
            0x97.toByte(), 0x17,                                            // 05e6: LoadConstZero r23
            0xb0.toByte(), 0x05, 0x11,                                      // 05e8: JmpTrue +5, r17 -> 05ed (Orders: preserve navigation)
            0x93.toByte(), 0x16,                                            // 05eb: LoadConstUndefined r22 (Home navigation)
            0x01, 0x13, 0x06, 0x45, 0xe7.toByte(), 0xfe.toByte(),           // 05ed: NewObjectWithBuffer r19
            0x52, 0x13, 0x17, 0x00,                                         // 05f3: PutOwnBySlotIdx r19, r23, 0
            0x52, 0x13, 0x16, 0x01,                                         // 05f7: PutOwnBySlotIdx r19, r22, 1 (Home undefined; Orders navigation)
            0x6f, 0x13, 0x15, 0x03, 0x14, 0x13,                             // 05fb: Call3 r19, r21, r3, r20, r19
            0x52, 0x09, 0x13, 0x01,                                         // 0601: PutOwnBySlotIdx r9, r19, 1
            0x6f, 0x0c, 0x12, 0x03, 0x0f, 0x09                              // 0605: Call3 r12, r18, r3, r15, r9
        )
        require(ordersListHeaderNavExpected.size == ordersListHeaderNavReplacement.size) {
            "OrdersListHeader navigation patch size mismatch"
        }
        if (!editor.matchesBytes(ordersListHeaderNavOffset, ordersListHeaderNavExpected)) {
            throw PatchException("Unexpected OrdersListHeader navigation bytecode instructions")
        }
        editor.patchBytesIfMatches(ordersListHeaderNavOffset, ordersListHeaderNavExpected, ordersListHeaderNavReplacement)

        // 4b. Early return r12 on Home screen: skips OrderFilterView ("Upcoming Payments" & "Orders" buttons) and BrazeBanner
        val ordersListHeaderEarlyReturnOffset = ordersListHeaderOffset + 0x0613
        val ordersListHeaderEarlyReturnExpected = byteArrayOf(
            0x6c, 0x0b, 0x0b, 0x03, 0x5a, 0x09, 0x0b, 0x01, 0x44, 0x0f, 0x0e, 0x15, 0xae.toByte(), 0x3b, 0x0b, 0x0d,
            0x0b, 0x44, 0x0c, 0x0b, 0x11, 0x70, 0x02, 0x0b, 0x0a, 0x3e, 0x00, 0x00, 0x4f, 0x4f, 0x0a, 0x00,
            0x3b, 0x12, 0x0d, 0x0a, 0x44, 0x12, 0x12, 0x11, 0x70, 0x45, 0x12, 0x12, 0x22, 0x4a, 0x30, 0x52,
            0x0b, 0x12, 0x00, 0x3b, 0x12, 0x0d, 0x0c, 0x44, 0x13, 0x12, 0x11, 0x70, 0x44, 0x13, 0x13, 0x23,
            0x15, 0x52, 0x0b, 0x13, 0x02, 0x6f, 0x0b, 0x0f, 0x03, 0x0c, 0x0b, 0x5a, 0x09, 0x0b, 0x02, 0x44,
            0x0c, 0x0e, 0x15, 0xae.toByte(), 0x44, 0x0b, 0x0a, 0x0f, 0x37, 0x93.toByte(), 0x0f
        )
        val ordersListHeaderEarlyReturnReplacement = byteArrayOf(
            0xb2.toByte(), 0x05, 0x11,                                      // 0613: JmpFalse +5, r17 -> 0618 (Home: r17=falsy -> jump to Ret r12!)
            0xae.toByte(), 0x04,                                            // 0616: Jmp +4 -> 061a (Orders: skip Ret r12!)
            0x76, 0x0c,                                                     // 0618: Ret r12 (Home: return lilac TotalOwed View directly)
            0x6c, 0x0b, 0x0b, 0x03,                                         // 061a: Call1 r11, r11, r3
            0x5a, 0x09, 0x0b, 0x01,                                         // 061e: DefineOwnInDenseArray r9, r11, 1
            0x44, 0x0f, 0x0e, 0x15, 0xae.toByte(),                          // 0622: GetByIdShort r15, r14, 21, 174
            0x3b, 0x0b, 0x0d, 0x0b,                                         // 0627: LoadFromEnvironment r11, r13, 11
            0x44, 0x0c, 0x0b, 0x11, 0x70,                                   // 062b: GetByIdShort r12, r11, 17, 112
            0x02, 0x0b, 0x0a, 0x3e, 0x00, 0x00, 0x4f, 0x4f, 0x0a, 0x00,    // 0630: NewObjectWithBufferLong
            0x90.toByte(), 0x12, 0x4a, 0x30,                                // 063a: LoadConstString r18, stringId 12362 (ORDERS_TAB_TOP)
            0x7e, 0x7e, 0x7e, 0x7e,                                         // 063e: AsyncBreakCheck * 4 (padding)
            0x52, 0x0b, 0x12, 0x00,                                         // 0642: PutOwnBySlotIdx r11, r18, 0
            0x3b, 0x12, 0x0d, 0x0c,                                         // 0646: LoadFromEnvironment r18, r13, 12
            0x44, 0x13, 0x12, 0x11, 0x70,                                   // 064a: GetByIdShort r19, r18, 17, 112
            0x44, 0x13, 0x13, 0x23, 0x15,                                   // 064f: GetByIdShort r19, r19, 35, 21
            0x52, 0x0b, 0x13, 0x02,                                         // 0654: PutOwnBySlotIdx r11, r19, 2
            0x6f, 0x0b, 0x0f, 0x03, 0x0c, 0x0b,                             // 0658: Call3 r11, r15, r3, r12, r11
            0x5a, 0x09, 0x0b, 0x02,                                         // 065e: DefineOwnInDenseArray r9, r11, 2
            0x44, 0x0c, 0x0e, 0x15, 0xae.toByte(),                          // 0662: GetByIdShort r12, r14, 21, 174
            0x44, 0x0b, 0x0a, 0x0f, 0x37,                                   // 0667: GetByIdShort r11, r10, 15, 55
            0x93.toByte(), 0x0f                                             // 066c: LoadConstUndefined r15
        )
        require(ordersListHeaderEarlyReturnExpected.size == ordersListHeaderEarlyReturnReplacement.size) {
            "OrdersListHeader early return patch size mismatch"
        }
        if (!editor.matchesBytes(ordersListHeaderEarlyReturnOffset, ordersListHeaderEarlyReturnExpected)) {
            throw PatchException("Unexpected OrdersListHeader early return bytecode instructions")
        }
        editor.patchBytesIfMatches(ordersListHeaderEarlyReturnOffset, ordersListHeaderEarlyReturnExpected, ordersListHeaderEarlyReturnReplacement)

        // 5. TotalOwedSectionV2: Remove "Shop now" button and spending power badge when navigation is falsy (Home)
        val totalOwedOffset = editor.findFunctionOffsetByName("TotalOwedSectionV2")
            ?: throw PatchException("TotalOwedSectionV2 function not found")

        // 5a. Cache navigation in unused register r35 (reg 35 = 0x23) so it survives environment and closure overrides
        val totalOwedNavCacheOffset = totalOwedOffset + 0x0012
        val totalOwedNavCacheExpected = byteArrayOf(
            0x45, 0x09, 0x06, 0x01, 0x75, 0x21,                             // 0012: GetById r9, r6, 1, stringId 8565 (navigation)
            0x37, 0x05, 0x00, 0x09                                          // 0018: StoreToEnvironment r5, 0, r9
        )
        val totalOwedNavCacheReplacement = byteArrayOf(
            0x45, 0x22, 0x06, 0x01, 0x75, 0x21,                             // 0012: GetById r34, r6, 1, stringId 8565 (navigation)
            0x37, 0x05, 0x00, 0x22                                          // 0018: StoreToEnvironment r5, 0, r34
        )
        require(totalOwedNavCacheExpected.size == totalOwedNavCacheReplacement.size) {
            "TotalOwedSectionV2 navigation cache patch size mismatch"
        }
        if (!editor.matchesBytes(totalOwedNavCacheOffset, totalOwedNavCacheExpected)) {
            throw PatchException("Unexpected TotalOwedSectionV2 navigation cache bytecode instructions")
        }
        editor.patchBytesIfMatches(totalOwedNavCacheOffset, totalOwedNavCacheExpected, totalOwedNavCacheReplacement)

        // 5b. Omit "Shop now" button from totalOwedAmountRow children array when navigation (r35) is falsy
        val totalOwedShopNowOffset = totalOwedOffset + 0x024b
        val totalOwedShopNowExpected = byteArrayOf(
            0x44, 0x1e, 0x0f, 0x11, 0xae.toByte(), 0x3b, 0x1c, 0x0e, 0x06, 0x44, 0x1d, 0x1c, 0x06, 0x70, 0x02, 0x1c,
            0x03, 0x2c, 0x00, 0x00, 0x93.toByte(), 0x23, 0x10, 0x00, 0x44, 0x22, 0x14, 0x06, 0x70, 0x44, 0x21, 0x22,
            0x12, 0x02, 0x90.toByte(), 0x20, 0x73, 0xd3.toByte(), 0x6e, 0x20, 0x21, 0x22, 0x20, 0x52, 0x1c, 0x20, 0x00, 0x52,
            0x1c, 0x1f, 0x01, 0x44, 0x1f, 0x12, 0x06, 0x70, 0x45, 0x20, 0x1f, 0x15, 0xc9.toByte(), 0xa0.toByte(), 0x08, 0x1f,
            0x02, 0x00, 0x5a, 0x1f, 0x20, 0x00, 0x01, 0x20, 0xdc.toByte(), 0x00, 0x4c, 0xce.toByte(), 0x44, 0x21, 0x11, 0x0e,
            0x5a, 0x45, 0x21, 0x21, 0x16, 0x2f, 0x56, 0x52, 0x20, 0x21, 0x00, 0x5a, 0x1f, 0x20, 0x01, 0x52,
            0x1c, 0x1f, 0x03, 0x44, 0x1f, 0x12, 0x06, 0x70, 0x45, 0x20, 0x1f, 0x17, 0xca.toByte(), 0xa0.toByte(), 0x08, 0x1f,
            0x02, 0x00, 0x5a, 0x1f, 0x20, 0x00, 0x01, 0x20, 0x87.toByte(), 0x00, 0x4c, 0xce.toByte(), 0x44, 0x21, 0x11, 0x0e,
            0x5a, 0x45, 0x21, 0x21, 0x18, 0x5f, 0x4a, 0x52, 0x20, 0x21, 0x00, 0x5a, 0x1f, 0x20, 0x01, 0x52,
            0x1c, 0x1f, 0x04, 0x6f, 0x1c, 0x1e, 0x02, 0x1d, 0x1c, 0x5a, 0x1b, 0x1c, 0x01
        )
        val totalOwedShopNowReplacement = byteArrayOf(
            0xb4.toByte(), 0x0f, 0x22,                                      // 024b: JmpUndefined +15, r34 -> 025a (Home: jump to LoadConstNull r28!)
            0xae.toByte(), 0x17,                                            // 024e: Jmp +23 -> 0265 (Orders: skip Home null block to Orders code!)
            0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e,                 // 0250: AsyncBreakCheck * 10 (padding)
            0x7e, 0x7e,
            0x94.toByte(), 0x1c,                                            // 025a: LoadConstNull r28 (Home: r28 = null)
            0x5a, 0x1b, 0x1c, 0x01,                                         // 025c: DefineOwnInDenseArray r27, r28, 1
            0xaf.toByte(), 0x88.toByte(), 0x00, 0x00, 0x00,                 // 0260: JmpLong +136 -> 02e8 (Home: skip entire SezzleButtonV3!)
            0x44, 0x1e, 0x0f, 0x11, 0xae.toByte(),                          // 0265: GetByIdShort r30, r15, 17, 174 (jsx)
            0x3b, 0x1c, 0x0e, 0x06, 0x44, 0x1d, 0x1c, 0x06, 0x70, 0x02, 0x1c, 0x03, 0x2c, 0x00, 0x00, 0x93.toByte(),
            0x23, 0x10, 0x00, 0x44, 0x22, 0x14, 0x06, 0x70, 0x44, 0x21, 0x22, 0x12, 0x02, 0x90.toByte(), 0x20, 0x73,
            0xd3.toByte(), 0x6e, 0x20, 0x21, 0x22, 0x20, 0x52, 0x1c, 0x20, 0x00, 0x52, 0x1c, 0x1f, 0x01, 0x44, 0x1f,
            0x12, 0x06, 0x70, 0x45, 0x20, 0x1f, 0x15, 0xc9.toByte(), 0xa0.toByte(),
            0x52, 0x1c, 0x20, 0x03,                                         // 02a3: PutOwnBySlotIdx r28, r32, 3 (containerStyle = styles.shopNowButton)
            0x44, 0x1f, 0x12, 0x06, 0x70, 0x45, 0x20, 0x1f, 0x17, 0xca.toByte(), 0xa0.toByte(), 0x08, 0x1f, 0x02, 0x00,
            0x5a, 0x1f, 0x20, 0x00, 0x01, 0x20, 0x87.toByte(), 0x00, 0x4c, 0xce.toByte(), 0x44, 0x21, 0x11, 0x0e, 0x5a,
            0x45, 0x21, 0x21, 0x18, 0x5f, 0x4a, 0x52, 0x20, 0x21, 0x00, 0x5a, 0x1f, 0x20, 0x01, 0x52, 0x1c, 0x1f, 0x04,
            0x6f, 0x1c, 0x1e, 0x02, 0x1d, 0x1c,                             // 02d7: Call3 r28, r30, r2, r29, r28 (jsx SezzleButtonV3)
            0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e,                       // 02dd: AsyncBreakCheck * 7 (padding)
            0x5a, 0x1b, 0x1c, 0x01                                          // 02e4: DefineOwnInDenseArray r27, r28, 1
        )
        require(totalOwedShopNowExpected.size == totalOwedShopNowReplacement.size) {
            "TotalOwedSectionV2 Shop now patch size mismatch"
        }
        if (!editor.matchesBytes(totalOwedShopNowOffset, totalOwedShopNowExpected)) {
            throw PatchException("Unexpected TotalOwedSectionV2 Shop now bytecode instructions")
        }
        editor.patchBytesIfMatches(totalOwedShopNowOffset, totalOwedShopNowExpected, totalOwedShopNowReplacement)

        // 5c. Omit spending power badge when navigation (r35) is falsy
        val totalOwedSpendingPowerBadgeOffset = totalOwedOffset + 0x0308
        val totalOwedSpendingPowerBadgeExpected = byteArrayOf(
            0x13, 0x04, 0x17, 0x13, 0x09, 0x04, 0xb2.toByte(), 0x09, 0x09, 0x97.toByte(), 0x01, 0x1c, 0x09, 0x17, 0x01
        )
        val totalOwedSpendingPowerBadgeReplacement = byteArrayOf(
            0x94.toByte(), 0x09,                                            // 0308: LoadConstNull r9 (r9 = null)
            0xb4.toByte(), 0x2e, 0x22,                                      // 030a: JmpUndefined +46, r34 -> 0338 (Home: jumps to 0338!)
            0x97.toByte(), 0x01,                                            // 030d: LoadConstZero r1
            0x1c, 0x09, 0x17, 0x01,                                         // 030f: Greater r9, r23, r1 (r9 = r23 > 0)
            0x7e, 0x7e, 0x7e, 0x7e                                          // 0313: AsyncBreakCheck * 4 (padding)
        )
        require(totalOwedSpendingPowerBadgeExpected.size == totalOwedSpendingPowerBadgeReplacement.size) {
            "TotalOwedSectionV2 spending power badge patch size mismatch"
        }
        if (!editor.matchesBytes(totalOwedSpendingPowerBadgeOffset, totalOwedSpendingPowerBadgeExpected)) {
            throw PatchException("Unexpected TotalOwedSectionV2 spending power badge bytecode instructions")
        }
        editor.patchBytesIfMatches(totalOwedSpendingPowerBadgeOffset, totalOwedSpendingPowerBadgeExpected, totalOwedSpendingPowerBadgeReplacement)

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
