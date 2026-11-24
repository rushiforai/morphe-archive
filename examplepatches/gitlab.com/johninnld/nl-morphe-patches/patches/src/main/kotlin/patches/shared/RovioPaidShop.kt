package patches.shared

import java.io.File
import java.io.RandomAccessFile
import java.nio.file.Files
import java.nio.file.StandardCopyOption
import java.security.MessageDigest

internal data class PaidShopEdit(val name: String, val offset: Long, val expected: String, val replacement: String)
internal data class PaidShopPlan(val sha256: String, val insertion: Long, val stubAddress: Long,
    val payload: String, val edits: List<PaidShopEdit>)

private fun String.bytes() = chunked(2).map { it.toInt(16).toByte() }.toByteArray()
private fun RandomAccessFile.u16(at: Long): Int { seek(at); return readUnsignedByte() or (readUnsignedByte() shl 8) }
private fun RandomAccessFile.u32(at: Long): Long { seek(at); return Integer.toUnsignedLong(Integer.reverseBytes(readInt())) }
private fun RandomAccessFile.u64(at: Long): Long { seek(at); return java.lang.Long.reverseBytes(readLong()) }
private fun RandomAccessFile.put64(at: Long, value: Long) { seek(at); writeLong(java.lang.Long.reverseBytes(value)) }

/** Add the app-specific UI stubs without relocating any existing virtual address or data object. */
internal fun applyPaidShopPlan(file: File, plan: PaidShopPlan) {
    val digest = MessageDigest.getInstance("SHA-256")
    file.inputStream().buffered().use { input ->
        val buffer = ByteArray(65536)
        while (true) { val n = input.read(buffer); if (n < 0) break; digest.update(buffer, 0, n) }
    }
    check(digest.digest().joinToString("") { "%02x".format(it.toInt() and 0xff) } == plan.sha256) {
        "Rovio shop library changed; paid-tab patch refused"
    }
    val payload = plan.payload.bytes()
    val pad = 0x4000L // Preserve both 4 KiB and 16 KiB PT_LOAD file-offset congruence.
    data class Segment(val index: Int, val type: Long, val flags: Long, val offset: Long,
        val address: Long, val size: Long, val memory: Long)
    val segments: List<Segment>
    val sectionOffsets: List<Long>
    val ph: Long; val sh: Long; val pe: Int; val se: Int; val rx: Segment
    RandomAccessFile(file, "r").use { input ->
        check(input.u32(0) == 0x464c457fL && input.u16(4) == 0x0102 && input.u16(18) == 183) { "Expected little-endian ARM64 ELF" }
        ph = input.u64(32); sh = input.u64(40); pe = input.u16(54); se = input.u16(58)
        val pn = input.u16(56); val sn = input.u16(60)
        check(pe == 56 && se == 64 && ph + pn * pe < plan.insertion && sh >= plan.insertion)
        segments = (0 until pn).map { i -> val a = ph + i * pe
            Segment(i, input.u32(a), input.u32(a + 4), input.u64(a + 8), input.u64(a + 16), input.u64(a + 32), input.u64(a + 40)) }
        rx = segments.single { it.type == 1L && it.flags == 5L }
        check(rx.offset + rx.size == plan.insertion && rx.size == rx.memory &&
            rx.address + rx.size == plan.stubAddress && payload.isNotEmpty() && payload.size <= pad)
        val next = segments.filter { it.type == 1L && it.address > rx.address }.minBy { it.address }
        check(next.offset == plan.insertion &&
            plan.stubAddress + payload.size <= next.address / pad * pad) { "No isolated executable padding for shop stubs" }
        check(plan.edits.map { it.offset }.distinct().size == plan.edits.size)
        for (edit in plan.edits) {
            val expected = edit.expected.bytes(); val changed = edit.replacement.bytes()
            check(expected.size >= changed.size && changed.size == 4 && edit.offset % 4 == 0L &&
                edit.offset >= rx.offset && edit.offset + expected.size <= plan.insertion)
            val actual = ByteArray(expected.size); input.seek(edit.offset); input.readFully(actual)
            check(actual.contentEquals(expected)) { "Changed shop entry: ${edit.name}" }
        }
        sectionOffsets = (0 until sn).map { input.u64(sh + it * se + 24) }
    }
    val temp = Files.createTempFile(file.parentFile.toPath(), "morphe-paid-shop-", ".so").toFile()
    try {
        file.inputStream().buffered().use { input -> temp.outputStream().buffered().use { output ->
            val buffer = ByteArray(65536); var remaining = plan.insertion
            while (remaining > 0) { val n = input.read(buffer, 0, minOf(buffer.size.toLong(), remaining).toInt()); check(n > 0); output.write(buffer, 0, n); remaining -= n }
            output.write(payload); output.write(ByteArray((pad - payload.size).toInt())); input.copyTo(output)
        } }
        RandomAccessFile(temp, "rw").use { output ->
            output.put64(40, sh + pad)
            for (segment in segments) {
                val a = ph + segment.index * pe
                if (segment.offset >= plan.insertion) output.put64(a + 8, segment.offset + pad)
                if (segment.index == rx.index) { output.put64(a + 32, rx.size + payload.size); output.put64(a + 40, rx.memory + payload.size) }
            }
            sectionOffsets.forEachIndexed { i, offset ->
                if (offset >= plan.insertion) output.put64(sh + pad + i * se + 24, offset + pad)
            }
            for (edit in plan.edits) { output.seek(edit.offset); output.write(edit.replacement.bytes()) }
        }
        Files.move(temp.toPath(), file.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING)
    } finally { temp.delete() }
}

private val paidShopPlans = mapOf(
    "Angry Birds 2" to PaidShopPlan("fbe919fe3e7845b3b3acb296c29c58f89979fa52555be459911131bde0ed9a0c", 0xa2f9530L, 0xa2fd530L,
        "3f0000712114811afe5fbda95c9d95163f0000712114811afe5fbda9ad9d95163f0000712114811a01ec01b9fe0f1ef8779e9516fd7bbca9fd030091e00701a9e21300f9001840f9e00000b4e1031faa8c22f297800000b4e1031f2ae2031faad935f297e00741a9e21340f9fd7bc4a83f0000712114811afe0f1ef86e059616fd7bbca9fd030091e00701a9e21300f9002040f9e00000b4e1031faa7922f297800000b4e1031f2ae2031faac635f297e00741a9e21340f9fd7bc4a83f0000712114811afe0f1ef8b40696163000805270ee01b960b640f9589a9516f37bbfa9f30300aa602a40f907000094603240f905000094f37bc1a8c0035fd6001840f901000014400100b4fd7bbfa9fd030091e1031faa5b22f297800000b4e1031f2ae2031faaa835f297fd7bc1a8c0035fd6", listOf(
        PaidShopEdit(".GUIShopScreen.OnTabButtonClicked", 0x4860aa8L, "fe5fbda9f65701a9f44f02a9144303f0", "a2626a15"),
        PaidShopEdit(".GUIShopScreen.SwitchTabs", 0x4860bfcL, "fe5fbda9f65701a9f44f02a9164303f0", "51626a15"),
        PaidShopEdit(".GUIShopScreen.SetVisibleTab", 0x4860f38L, "fe0f1ef8f44f01a9f30300aa00b040f9", "86616a15"),
        PaidShopEdit(".ShopScreenFullscreenWithTabsVariant.RefreshTabButtonsIfCompatible", 0x487ab60L, "fe0f1ef8f44f01a9f30300aa005040f9", "81fa6915"),
        PaidShopEdit(".ShopScreenPopupWithTabsVariant.RefreshTabButtonsIfCompatible", 0x487b0c4L, "fe0f1ef8f44f01a9f40300aa002c40f9", "3bf96915"),
        PaidShopEdit("GUIShopScreen.Init default Bonus", 0x485ff64L, "60b640f9800b00b4e1031f2ae2031faa", "a6656a15"),
        PaidShopEdit("GUIShopScreen.Init show Bonus", 0x485ff6cL, "e1031f2ae2031faa609b5c9560b240f9", "21008052"),
        PaidShopEdit("GUIShopScreen.Init hide paid content", 0x485ffacL, "21008052e2031faa509b5c9561ea41b9", "e1031f2a"),
        PaidShopEdit("Rovio.Abba.SeasonPass.Client.UI.MainScreen.RewardsTab.RewardsTabView.SetTicketButton", 0x92e63d8L, "fe0f1ef8f44f01a9f30300aa002840f9", "8d4c4014"),
        PaidShopEdit("Rovio.Abba.SeasonPass.Rewards.UI.Widgets.MilestoneRewards.MilestoneRewardGroupWidget.SetPaidTrackReward", 0x9321accL, "ff0301d1fe1300f9f44f03a9f40300aa", "d85e3f14"),
        PaidShopEdit("Rovio.Abba.SeasonPass.Rewards.UI.Widgets.MilestoneRewards.MilestoneRewardGroupWidget.SetPaidTrackRewardState", 0x9321b20L, "001840f9400000b403000014fe0f1ff8", "c35e3f14"),
    )),
    "Angry Birds Friends" to PaidShopPlan("fbde51b904b6075448beec73621a0d8f9f093897136b2401013a91cd46697ad3", 0x577ded0L, 0x5781ed0L,
        "3f0000712114811afe0f1df86c8d4217102040b970010035fd7bbfa9fd030091e1031faa82e7ef97800000b4e1031f2ae2031faaf6f3ef97fd7bc1a8c0035fd6fe0f1df884914217", listOf(
        PaidShopEdit("Rovio.ABFriends.Shop.UI.ShopTabController.ChangeTab", 0x2821488L, "fe0f1df8f65701a9f44f02a996b201d0", "9272bd14"),
        PaidShopEdit("Rovio.ABFriends.Shop.UI.ShopTabButton.OnEnable", 0x2822520L, "fe0f1df8f65701a9f44f02a995b201b0", "706ebd14"),
    )),
)

internal fun hideRovioPaidShop(file: File, game: String) = applyPaidShopPlan(file, paidShopPlans.getValue(game))
