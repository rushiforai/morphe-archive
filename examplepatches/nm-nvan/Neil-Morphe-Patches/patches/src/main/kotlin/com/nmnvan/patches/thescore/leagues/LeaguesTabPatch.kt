package com.nmnvan.patches.thescore.leagues

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import com.nmnvan.patches.thescore.settings.settingsPatch
import com.nmnvan.patches.thescore.shared.Constants.COMPATIBILITY_THESCORE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.isFrom
import com.nmnvan.patches.thescore.shared.resourceReference
import com.nmnvan.patches.thescore.shared.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/patches/LeaguesScreenPatch;"

/**
 * LeaguesMenuTransformer: builds the recent-league chip row (an empty list or a single chips item).
 */
internal object RecentLeagueChipsFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/thescore/repositories/data/meta/LeaguesMeta;", "L"),
    strings = listOf("RECENT_LEAGUES"),
    custom = { _, classDef -> classDef.isFrom("LeaguesMenuTransformer.kt") }
)

/**
 * LeaguesMenuTransformer: builds the "Spotlight" header plus one row per spotlight,
 * or an empty list when there are none.
 */
internal object SpotlightSectionFingerprint : Fingerprint(
    returnType = "Ljava/io/Serializable;",
    parameters = listOf("Ljava/util/ArrayList;", "L"),
    filters = listOf(resourceReference(ResourceType.STRING, "spotlight_text_redesign")),
    custom = { _, classDef -> classDef.isFrom("LeaguesMenuTransformer.kt") }
)

@Suppress("unused")
val leaguesTabPatch = bytecodePatch(
    name = "Hide Leagues tab sections",
    description = "Adds options in Morphe Settings to hide the league chips and the Spotlight section on the Leagues tab.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)

    dependsOn(settingsPatch)

    execute {
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        // An empty list is the app's own "nothing to show" result for both sections.
        RecentLeagueChipsFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->hideLeagueChips()Z
                move-result v0
                if-eqz v0, :show
                invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
                :show
                nop
            """
        )

        SpotlightSectionFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->hideSpotlight()Z
                move-result v0
                if-eqz v0, :show
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                return-object v0
                :show
                nop
            """
        )
    }
}
