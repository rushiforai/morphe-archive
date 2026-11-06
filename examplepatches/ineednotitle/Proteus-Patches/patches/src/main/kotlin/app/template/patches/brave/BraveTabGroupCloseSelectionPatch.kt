// Target ideas and implementation adapted from kveld9/kveld-morphe-patches (GPL-3.0),
// revision 8afd78f0b57964b9ae9a0a387bdd4ae157345707 (Brave 1.98.63).
// Ported for this bundle's patcher 1.3.3. Experimental: default off, unverified on device.
package app.template.patches.brave

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.BRAVE_COMPATIBILITY

private const val BRAVE_EXTENSION_CLASS = "Lapp/template/extension/brave/BraveExtension;"

@Suppress("unused")
val braveTabGroupCloseSelectionPatch = bytecodePatch(
    name = "Close Tab In Group Order",
    description = "Selects the previous tab in the tab group when closing a tab.",
    default = false,
) {
    compatibleWith(BRAVE_COMPATIBILITY)
    dependsOn(braveNativeExtractionDependency())
    extendWith("extensions/extension.mpe")

    execute {
        var patched = 0

        // Target: TabCollectionTabModelImpl.Z(List tabsToClose, Tab suggestedNextTab, int selectionType, boolean uponExit, int tabCloseType, int closingOrigin)V
        // This is the core convergence method for all tab closures and removals in TabCollectionTabModelImpl
        // (called by B(TabClosureParams) and l(Tab) / removeTabWithoutDestroy).
        //
        // By injecting preselectPreviousTabInGroup at index 0:
        // If and only if the closing tab is currently selected and has a live predecessor in the same tab group,
        // the predecessor tab is pre-selected (via model.setIndex).
        // When stock NextTabSelectionUtil.getNextTabIfClosed evaluates the active tab, it finds the newly selected
        // predecessor is not closing, so it preserves it and stays inside the group.
        // All other flows (bulk close, single-tab groups, non-selected tab close, session restore) fall back to stock.
        val closeSelectionFp = try {
            val fp = Fingerprint(
                definingClass = "Lorg/chromium/chrome/browser/tabmodel/TabCollectionTabModelImpl;",
                parameters = listOf(
                    "Ljava/util/List;",
                    "Lorg/chromium/chrome/browser/tab/Tab;",
                    "I",
                    "Z",
                    "I",
                    "I",
                ),
                returnType = "V",
            )

            fp.method.addInstructions(
                0,
                """
                    invoke-static/range {p0 .. p1}, $BRAVE_EXTENSION_CLASS->preselectPreviousTabInGroup(Ljava/lang/Object;Ljava/util/List;)V
                """.trimIndent(),
            )
            patched++
            fp
        } catch (_: PatchException) {
            throw PatchException(BRAVE_UNSUPPORTED_VARIANT_MESSAGE)
        }

        if (patched == 0) {
            println("[Close Tab In Group Order] WARNING: applied 0 hook(s) -> this feature is NOT active on this APK; its targets moved upstream.")
        } else {
            println("[Close Tab In Group Order] Applied $patched hook in TabCollectionTabModelImpl.${closeSelectionFp.method.name} -> previous tab selection in tab group enabled.")
        }
    }
}
