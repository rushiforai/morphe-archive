package app.template.patches.wemuslim.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch

internal const val HOME_STREAM_LIST_VIEW = "Lcom/fyxtech/muslim/worship/home/view/HomeStreamListView;"
internal const val SHORTCUT_FILTER = "Lapp/template/extension/wemuslim/ShortcutFilter;"

// Every Home/Prayer shortcut grid list reaches the view through HomeStreamListView.setDiscoverData
// (app class and method names are kept in the release build), from HomeTabFragment and from the
// stream coroutine alike. Its elements are DiscoverResourceUiModelWithFolder(folderResource,
// resourceList), and the folder dialog (the "Rebates" folder with Trip. and Rebates) reads the same
// models, so filtering here covers the dialog too.
internal object SetDiscoverDataFingerprint : Fingerprint(
    definingClass = HOME_STREAM_LIST_VIEW,
    name = "setDiscoverData",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

// #135 (2026-11-11, 3.5.5): the server pushes promotion shortcuts into the grid ("Egg", the lucky
// egg smash campaign, and the "Rebates" folder). The extension drops entries whose link points at
// those pages (see ShortcutLinks), empties out folders left without children and collapses a
// one-child folder the way the app does; any other shortcut is kept as it is. If the models ever
// change shape the extension returns the list untouched.
@Suppress("unused")
val hideShortcutPromotionsPatch = bytecodePatch(
    name = "Hide shortcut promotions",
    description = "Hides the Egg and Rebates shortcuts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(bypassNativeEncryptionPatch)

    extendWith("extensions/wemuslim.mpe")

    execute {
        // A /range invoke and move-result-object (8-bit) keep working if p1 ever moves above v15.
        SetDiscoverDataFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static/range { p1 .. p1 }, $SHORTCUT_FILTER->filterDiscover(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """,
        )
    }
}
