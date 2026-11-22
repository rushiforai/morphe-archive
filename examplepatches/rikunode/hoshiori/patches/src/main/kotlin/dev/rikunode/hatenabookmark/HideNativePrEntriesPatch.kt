package dev.rikunode.hatenabookmark

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Verified against Hatena Bookmark 5.80 / versionCode 58000 DEX (static extraction):
 *
 * MuteHelperKt.filteredWithMuteWords(BookmarkEntry, List): Boolean
 * calls BookmarkEntry.isPrEntry() at DEX code-unit offset 21.
 * If that is true it unconditionally returns true ("keep item"),
 * bypassing the normal mute filter.
 *
 * For PR entries only, return false at the top. For every other entry,
 * fall through to the original filtering method without modification.
 *
 * NOTE: This affects feeds that call filterByMuteWords. Actual device
 * confirmation and coverage of all feed types remain pending.
 */
/**
 * Category hot feeds build their PagingData through withDate() even when the
 * user is logged out or has zero mute words. Those branches SKIP the regular
 * mute filter entirely. Filter its raw BookmarkEntry list before converting
 * to dated list items, using the existing PR-aware filter with no mute words.
 */
private object UnconditionalHotFeedFingerprint : Fingerprint(
    definingClass = "Lcom/hatena/android/bookmark/paging/CategoryHotEntryPagingSource;",
    name = "withDate",
    parameters = listOf("Ljava/util/List;", "Ljava/time/ZonedDateTime;"),
    returnType = "Ljava/util/List;",
)

private object NativeAdFilterFingerprint : Fingerprint(
    definingClass = "Lcom/hatena/android/bookmark/interactor/MuteHelperKt;",
    name = "filteredWithMuteWords",
    parameters = listOf(
        "Lcom/hatena/android/bookmark/model/BookmarkEntry;",
        "Ljava/util/List;",
    ),
    returnType = "Z",
)

@Suppress("unused")
val hideNativePrEntriesPatch = bytecodePatch(
    name = "Hide native PR entries from article feeds",
    description = "Exclude PR entries even for logged-out or no-mute hot feeds; keep ordinary articles and existing mute behavior.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Hatena Bookmark",
            packageName = "com.hatena.android.bookmark",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x2A9BD6,
            targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
        )
    )

    execute {
        val method = NativeAdFilterFingerprint.method
        val impl = requireNotNull(method.implementation) { "Mute filter has no bytecode" }
        val instructions = impl.instructions
        require(impl.registerCount == 8) {
            "Unexpected register layout in Hatena 5.80 mute filter"
        }
        require(instructions.sumOf { it.codeUnits } == 105) {
            "Unexpected Hatena 5.80 mute filter code size"
        }
        require(instructions.first().opcode == Opcode.INVOKE_VIRTUAL) {
            "Unexpected first instruction in Hatena mute filter"
        }
        val prCalls = instructions.withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                (insn as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/hatena/android/bookmark/model/BookmarkEntry;->isPrEntry()Z"
        }
        require(prCalls.size == 1) {
            "Expected exactly one pre-existing PR classification call"
        }
        require(instructions.take(prCalls.single().index).sumOf { it.codeUnits } == 21) {
            "Hatena 5.80 PR classification moved; refusing unsafe patch"
        }

        // p0 is the BookmarkEntry. v0 is a scratch local register;
        // 5.80's original method overwrites v0 before it is read.
        method.addInstructionsWithLabels(
            0,
            """
                invoke-virtual { p0 }, Lcom/hatena/android/bookmark/model/BookmarkEntry;->isPrEntry()Z
                move-result v0
                if-eqz v0, :normal_article
                const/4 v0, 0x0
                return v0
                :normal_article
                nop
            """.trimIndent(),
        )

        // For logged-out users and accounts with no mute words, the hot-feed
        // PagingSource never calls filteredWithMuteWords(). All page results,
        // however, pass through withDate(List<BookmarkEntry>, ZonedDateTime).
        // v0 and v1 are scratch registers before the original method starts;
        // p1 is the list argument. Empty mute list means ordinary articles
        // remain untouched while the updated PR guard rejects PR entries.
        val withDate = UnconditionalHotFeedFingerprint.method
        val dateImpl = requireNotNull(withDate.implementation) { "withDate has no bytecode" }
        require(dateImpl.registerCount == 6 && dateImpl.instructions.sumOf { it.codeUnits } == 37) {
            "Hatena 5.80 hot-feed date conversion layout changed"
        }
        require(dateImpl.instructions.first().opcode == Opcode.NEW_INSTANCE) {
            "Unexpected first instruction in hot-feed date conversion"
        }
        withDate.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;
                move-result-object v0
                const/4 v1, 0x0
                invoke-static { p1, v0, v1 }, Lcom/hatena/android/bookmark/interactor/MuteHelperKt;->filterByMuteWords(Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;)Ljava/util/List;
                move-result-object p1
            """.trimIndent(),
        )
    }
}
