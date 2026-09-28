/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.marketplaceonly

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.facebook.menu.hushfacebookInTheMenuPatch
import app.morphe.patches.facebook.notifications.blockPromotionalNotificationsPatch
import app.morphe.patches.facebook.navigation.starttab.openOnChosenTabPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Leaves Marketplace, Notifications and the profile or Menu tab in Facebook's tab bar, and opens
 * Facebook on Marketplace. See MarketplaceOnlyAnchors.kt for how the tab bar is built, and the
 * extension's MarketplaceOnly for which tabs go and when it leaves the bar alone.
 *
 * It brings Open on a chosen tab with it: the start from the launcher icon goes to Marketplace
 * through that patch's route, which also gets Facebook's own start-up to use the tab.
 *
 * Included in the default selection, with its runtime switch off until the person opts in.
 */
@Suppress("unused")
val marketplaceOnlyPatch = bytecodePatch(
    name = "Marketplace only",
    description = "Leaves only Marketplace, Notifications and your profile or Menu in the tab bar, and opens " +
        "Facebook on Marketplace. Home with the news feed, Video, Friends, Feeds, Groups, Gaming and Events " +
        "go. Notifications and links still open where they lead.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, openOnChosenTabPatch, hushfacebookInTheMenuPatch,
        blockPromotionalNotificationsPatch, marketplaceFeedPrefetchPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val filters = mutableListOf<Pair<Method, TabFilter>>()
        classDefForEach { classDef ->
            if (classDef.fields.none { it.type == NAVIGATION_CONFIG }) return@classDefForEach
            classDef.methods.forEach { method -> shownTabFilter(method)?.let { filters += method to it } }
        }
        val (builder, filter) = filters.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one method that builds the tab bar's shown tabs from NavigationConfig's list, " +
                "asking the hidden-tab set about each, found ${filters.size}.",
        )
        mutableClassDefBy(builder.definingClass).methods.single {
            it.name == builder.name && it.returnType == builder.returnType &&
                it.parameterTypes.map(CharSequence::toString) == builder.parameterTypes.map(CharSequence::toString)
        }.askExtensionAfterHiddenSet(filter)
        enableStatus("marketplaceOnly")
    }
}

/**
 * Hands the hidden set's answer, kept at [filter]'s `move-result`, to the extension with the tab,
 * the configured list and the set, and keeps the extension's answer in the same register before
 * the branch that skips the tab reads it. Nothing may jump to that branch, since code arriving
 * there would skip the call.
 */
internal fun MutableMethod.askExtensionAfterHiddenSet(filter: TabFilter) {
    val branch = implementation!!.instructions[filter.result + 1] as BuilderInstruction
    if (branch.location.labels.isNotEmpty()) {
        throw PatchException("$PATCH: $definingClass->$name has a jump to the branch that skips a hidden tab.")
    }
    // invoke-static names four registers in four bits each; the patched builds use v0 to v7.
    val registers = listOf(filter.answer, filter.tab, filter.configured, filter.hidden)
    if (registers.any { it > 15 }) {
        throw PatchException("$PATCH: $definingClass->$name keeps the tab, the list or the set past v15: $registers.")
    }
    addInstructions(
        filter.result + 1,
        """
            invoke-static { ${registers.joinToString { "v$it" }} }, $HIDES_TAB
            move-result v${filter.answer}
        """,
    )
}
