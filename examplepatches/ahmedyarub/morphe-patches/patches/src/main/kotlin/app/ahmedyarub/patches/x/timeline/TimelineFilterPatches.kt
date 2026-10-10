package app.ahmedyarub.patches.x.timeline

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.settings.settingsPatch
import app.ahmedyarub.patches.x.settings.showSettingsSection
import app.ahmedyarub.patches.x.sharemenu.addPostAction
import app.ahmedyarub.patches.x.sharemenu.postMenuPatch
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val TIMELINE_FILTER_CLASS = "$EXTENSION_PACKAGE/TimelineFilter;"

/**
 * Turns a cached timeline row into a timeline item. Timelines are shown from the database, and
 * both places that read them skip a row this returns null for.
 */
private object CachedTimelineItemFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Ljava/util/LinkedHashMap;", "Ljava/util/LinkedHashMap;", "L"),
    custom = { method, _ ->
        method.returnType.startsWith("Lcom/x/models/timelines/items/") &&
            method.parameterTypes.first().startsWith("Lcom/x/database/")
    },
)

/**
 * Stores a timeline item the server sent into the database the timelines are shown from. Posts,
 * accounts, trends and ads all come through here, module children too, and the promoted metadata
 * of accounts and trends is not stored, so an item has to be dropped before it is.
 */
private object StoreTimelineItemFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        parameters.size == 9 && parameters.first().startsWith("Lcom/x/models/timelines/items/") &&
            parameters.takeLast(6).all { it == "Ljava/util/ArrayList;" }
    },
)

/** Leaves out the timeline items the extension's filter hides. The patches using it set what it hides. */
internal val timelineFilterPatch = bytecodePatch(
    description = "Leaves filtered items out of timelines.",
) {
    dependsOn(xExtensionPatch)

    execute {
        StoreTimelineItemFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static/range { p1 .. p1 }, $TIMELINE_FILTER_CLASS->hide(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :store
                return-void
                """,
                ExternalLabel("store", getInstruction(0)),
            )
        }

        // Rows cached before the app was patched, or before a filter changed, are dropped as
        // they are read back.
        CachedTimelineItemFingerprint.method.apply {
            // Every return, last first so the indices still to patch do not move. Some are branch
            // targets, which a plain insert would not reach.
            instructions.filter { it.opcode == Opcode.RETURN_OBJECT }.map { it.location.index }.sortedDescending().forEach { index ->
                val item = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructionsAtControlFlowLabel(
                    index,
                    """
                    invoke-static/range { v$item .. v$item }, $TIMELINE_FILTER_CLASS->filter(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$item
                    check-cast v$item, $returnType
                    """,
                )
            }
        }
    }
}

private object InitialKeywordsExtensionFingerprint : Fingerprint(
    definingClass = TIMELINE_FILTER_CLASS,
    name = "initialKeywords",
)

@Suppress("unused")
val filterPostsByKeywordPatch = bytecodePatch(
    name = "Filter posts by keyword",
    description = "Hides posts whose text contains any of your keywords, ignoring case. " +
        "Edit the keywords from \"Filtered keywords\" in any post's menu, or in the Morphe settings.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(timelineFilterPatch, postMenuPatch, settingsPatch)

    val keywords by stringsOption(
        key = "keywords",
        default = emptyList(),
        title = "Initial keywords",
        description = "Words or phrases filtered until you edit the list in the app.",
    )

    execute {
        val filtered = keywords.orEmpty().map { it.trim().lowercase() }.filter { it.isNotEmpty() }
        filtered.firstOrNull { keyword -> keyword.any { it == '|' || it == '"' || it == '\\' || it.isISOControl() } }?.let {
            throw PatchException("Keywords cannot contain |, quotes or backslashes: $it")
        }

        InitialKeywordsExtensionFingerprint.method.returnEarly(filtered.joinToString("|"))
        addPostAction("keywords")
        showSettingsSection("keywordsEnabled")
    }
}

// region Feed filters

private object FeedFiltersEnabledFingerprint : Fingerprint(
    definingClass = TIMELINE_FILTER_CLASS,
    name = "feedFiltersEnabled",
)

private object InitialIncludeKeywordsFingerprint : Fingerprint(
    definingClass = TIMELINE_FILTER_CLASS,
    name = "initialIncludeKeywords",
)

@Suppress("unused")
val feedFiltersPatch = bytecodePatch(
    name = "Feed filters",
    description = "Adds feed filters to timelines: media only (images, videos, GIFs), hide followed profiles, " +
        "and include/exclude keyword filtering. Toggle each filter from the Morphe settings.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(timelineFilterPatch, postMenuPatch, settingsPatch)

    val includeKeywords by stringsOption(
        key = "includeKeywords",
        default = emptyList(),
        title = "Initial include keywords",
        description = "When set, only posts containing at least one of these are shown. Edit in the app.",
    )

    execute {
        FeedFiltersEnabledFingerprint.method.returnEarly(true)

        val filtered = includeKeywords.orEmpty().map { it.trim().lowercase() }.filter { it.isNotEmpty() }
        filtered.firstOrNull { keyword -> keyword.any { it == '|' || it == '"' || it == '\\' || it.isISOControl() } }?.let {
            throw PatchException("Include keywords cannot contain |, quotes or backslashes: $it")
        }
        InitialIncludeKeywordsFingerprint.method.returnEarly(filtered.joinToString("|"))

        addPostAction("settings")
        showSettingsSection("feedFiltersEnabled")
    }
}

// endregion
