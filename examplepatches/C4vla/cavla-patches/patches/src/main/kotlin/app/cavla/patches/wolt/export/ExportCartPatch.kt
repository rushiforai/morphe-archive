package app.cavla.patches.wolt.export

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.cavla.patches.shared.Constants.COMPATIBILITY_WOLT

private const val EXTENSION_CLASS = "Lapp/cavla/extension/wolt/CartExporter;"

@Suppress("unused")
val exportCartPatch = bytecodePatch(
    name = "Export cart",
    description = "Adds an Export action to the Wolt cart that saves the current cart " +
        "(item, quantity, price) to a CSV file in Downloads.",
) {
    compatibleWith(COMPATIBILITY_WOLT)

    extendWith("extensions/extension.mpe")

    execute {
        // Pass the CartController (this) to the extension, which installs the toolbar button
        // and reads the live cart via the controller's public RecyclerView accessor.
        CartToolbarSetupFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->installExportButton(Ljava/lang/Object;)V",
        )
    }
}
