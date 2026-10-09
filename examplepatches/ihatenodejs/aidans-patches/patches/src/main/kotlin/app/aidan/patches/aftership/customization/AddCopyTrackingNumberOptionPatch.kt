package app.aidan.patches.aftership.customization

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val HOME_ACTIVITY = "Lcom/aftership/shopper/views/home/HomeActivity;"
private const val COPY_TRACKING_BRIDGE = "Lapp/aidan/extension/aftership/CopyTrackingBridge;"

@Suppress("unused")
val addCopyTrackingNumberOptionPatch = bytecodePatch(
    name = "Add Copy Tracking Number Option",
    description = "Adds an option to copy tracking numbers in the multi-shipment selection menu.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    extendWith("extensions/extension.mpe")
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        patchHomeActivity()
    }
}

/**
 * In `HomeActivity` (`Lcom/aftership/shopper/views/home/HomeActivity;`), hooks `S2(ZZZZ)V`
 * to invoke `CopyTrackingBridge.onUpdateButtons(this, isDeleteVisible, isDeleteEnabled)`.
 *
 * @throws PatchException if the HomeActivity class or implemented four-parameter S2 method is missing.
 */
private fun BytecodePatchContext.patchHomeActivity() {
    val classDef = classDefByOrNull(HOME_ACTIVITY)
        ?: throw PatchException("Class $HOME_ACTIVITY not found")
    val mutableClass = mutableClassDefBy(classDef)
    val s2Method = mutableClass.methods.firstOrNull {
        it.name == "S2" && it.parameterTypes.size == 4 && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method S2(ZZZZ)V not found in $HOME_ACTIVITY")

    val instructions = s2Method.implementation!!.instructions
    val lastIndex = instructions.size - 1

    s2Method.addInstructions(
        lastIndex,
        """
            invoke-static {p0, p3, p4}, $COPY_TRACKING_BRIDGE->onUpdateButtons(Landroid/app/Activity;ZZ)V
        """.trimIndent()
    )
}
