package dev.rikunode.hatenabookmark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val BOOKMARK_HOLDER =
    "Lcom/hatena/android/bookmark/viewholders/BookmarkPageViewHolder;"
private const val SET_ENTRY =
    "Lcom/hatena/android/bookmark/view/BookmarkEntryItemView;->setEntry(Lcom/hatena/android/bookmark/model/BookmarkEntry;Z)V"
private const val CARD_HELPER = "Ldev/rikunode/cardclick/BookmarkCardClickHelper;"

/** Target only Hatena Bookmark 5.80's bookmark comment detail card. */
@Suppress("unused")
val openArticleFromBookmarkCardPatch = bytecodePatch(
    name = "Open article from bookmark card",
    description = "Tap the article card in bookmark details to open the article in the in-app browser.",
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
    val openArticleFromBookmarkCard by booleanOption(
        key = "openArticleFromBookmarkCard",
        default = true,
        title = "Open article from bookmark card",
        description = "Tap an article card in bookmark details to open it in the in-app browser.",
    )

    extendWith("extensions/cardclick.mpe")

    execute {
        if (openArticleFromBookmarkCard == false) return@execute

        val holder = classDefBy(BOOKMARK_HOLDER)
        val method = holder.methods.singleOrNull {
            it.name == "updateBookmarkView" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Lcom/hatena/android/bookmark/model/BookmarkEntry;", "Z", "Z") &&
                it.returnType == "V"
        } ?: throw PatchException("Hatena 5.80 bookmark card method signature guard failed")
        val implementation = method.implementation
            ?: throw PatchException("Hatena 5.80 bookmark card has no code")
        val original = implementation.instructions.toList()
        if (implementation.registerCount != 11 || original.sumOf { it.codeUnits } != 207) {
            throw PatchException("Hatena 5.80 bookmark card DEX register/size guard failed")
        }

        var offset = 0
        val matches = original.mapIndexedNotNull { index, instruction ->
            val at = offset
            offset += instruction.codeUnits
            if (at == 0x77 &&
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == SET_ENTRY &&
                (instruction as? FiveRegisterInstruction)?.let {
                    it.registerCount == 3 && it.registerC == 1 &&
                        it.registerD == 8 && it.registerE == 5
                } == true
            ) index else null
        }
        if (matches.size != 1 || original.count {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    (it as? ReferenceInstruction)?.reference?.toString() == SET_ENTRY
            } != 1
        ) throw PatchException("Hatena 5.80 bookmark card setEntry call-site guard failed")

        // At this exact site v1 is BookmarkEntryItemView, p1 (v8) is BookmarkEntry.
        // The old date-format scratch registers v3/v6 are dead after setEntry.
        // Children keep their own click handlers (notably the users-count view).
        mutableClassDefBy(BOOKMARK_HOLDER).methods.single {
            it.name == "updateBookmarkView" && it.parameterTypes.size == 3
        }.addInstructions(
            matches.single() + 1,
            """
                invoke-virtual { p1 }, Lcom/hatena/android/bookmark/model/BookmarkEntry;->getUrlToBrowse()Landroid/net/Uri;
                move-result-object v3
                invoke-virtual { p1 }, Lcom/hatena/android/bookmark/model/BookmarkEntry;->getOriginalUri()Landroid/net/Uri;
                move-result-object v6
                invoke-static { v1, v3, v6 }, ${CARD_HELPER}->attach(Landroid/view/View;Landroid/net/Uri;Landroid/net/Uri;)V
            """.trimIndent(),
        )
    }
}
