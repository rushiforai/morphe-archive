package fr.josselinonduty.snapchat.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import fr.josselinonduty.shared.prepend
import fr.josselinonduty.snapchat.SNAPCHAT
import fr.josselinonduty.snapchat.core.spoofSignaturePatch
import fr.josselinonduty.snapchat.snapBytecodePatch

private const val UI_TABS = "Lfr/josselinonduty/snapchat/UiTabs;"

// Anchor (14.33.1.0: Ly6v;->f()Ljava/util/List;): the tab-bar model getter; the bar adapts to its
// size. The class must own the tab-spec factories m()/o() (-> Lzge0;), which makes it unique.
// Elements are Lzge0; specs whose int field `b` is the tab's icon container id (see UiTabs).
// Obfuscated names: pinned to this build.
object TabListFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lxg11;", name = "getValue"),
    ),
    custom = { _, classDef ->
        val returnsTabSpec = { name: String ->
            classDef.methods.any { it.name == name && it.returnType == "Lzge0;" }
        }
        returnsTabSpec("m") && returnsTabSpec("o")
    },
)

// Shared hook (hidden dependency): filters the returned list through UiTabs.
val tabListHookPatch = bytecodePatch {
    compatibleWith(SNAPCHAT)
    dependsOn(spoofSignaturePatch)
    extendWith("extensions/snapchat.mpe")

    execute {
        val method = TabListFingerprint.method
        // Last instruction is `return-object v0` (v0 holds the list).
        val last = method.implementation!!.instructions.count() - 1
        method.addInstructions(
            last,
            """
                invoke-static {v0}, $UI_TABS->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object v0
            """,
        )
    }
}

// Runs before the hook (prepended => earlier in the method).
private fun hideTabs(mask: Int) = TabListFingerprint.method.prepend(
    """
        const/4 v0, 0x$mask
        invoke-static {v0}, $UI_TABS->hide(I)V
    """,
)

val removeMapTabPatch = snapBytecodePatch(
    name = "Remove Map tab",
    description = "Removes the Map tab from the tab bar.",
) {
    dependsOn(tabListHookPatch)
    execute { hideTabs(1) }
}

val removeStoriesTabPatch = snapBytecodePatch(
    name = "Remove Stories tab",
    description = "Removes the Stories tab from the tab bar.",
) {
    dependsOn(tabListHookPatch)
    execute { hideTabs(2) }
}

val removeSpotlightTabPatch = snapBytecodePatch(
    name = "Remove Spotlight tab",
    description = "Removes the Spotlight tab from the tab bar.",
) {
    dependsOn(tabListHookPatch)
    execute { hideTabs(4) }
}
