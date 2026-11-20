/*
 * Add-on support for the Channel blocker bundle.
 *
 * Ported (simplified) from MarcaDian/morphe-patches-yavot AddOn.kt, which
 * documents the add-on contract of Morphe Patches:
 * https://github.com/MarcaDian/morphe-patches-yavot
 *
 * An add-on bundle is loaded by the patcher in its own class loader, so it
 * cannot reference anything of the Morphe Patches bundle at patch time.
 * Everything talks to the base bundle through the patched app only:
 *
 * - Bytecode: a call to this bundle's registration method is added to
 *   `AddOnManager.registerAddOns()`, which the Morphe Patches extension provides.
 */
package app.kitan.patches.youtube.addon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Class of the add-on manager of Morphe Patches, which declares the registration injection point.
 */
private const val ADD_ON_MANAGER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/youtube/addon/AddOnManager;"

private const val ADD_ON_MANAGER_REGISTER_METHOD_NAME = "registerAddOns"

/**
 * Base bundle classes this bundle injects into at patch time.
 *
 * The add-on is compiled against the base bundle but shipped separately, so a
 * base bundle that moved or renamed these still patches cleanly and then
 * breaks on the device. Failing the patch here turns that into a clear
 * patch time error instead.
 */
private val REQUIRED_HOST_CLASSES = listOf(
    // The runtime Litho filter of the base bundle. Channel blocking for
    // search results and recommendations is injected into `isFiltered`.
    "Lapp/morphe/extension/shared/patches/components/LithoFilterPatch;",
)

/**
 * Fails the patch unless the base bundle is present.
 */
private fun checkHostCompatibility() {
    val missing = REQUIRED_HOST_CLASSES.filter { classDefByOrNull(it) == null }
    if (missing.isNotEmpty()) throw PatchException(
        """
            ##########################

            Could not find Morphe Patches extension classes.

            This patch bundle is an add-on that requires the official Morphe patches.
            Patch again with the Morphe official patch bundle (Morphe Patches source)
            included, with at least one patch using the Litho filter enabled.

            Missing: ${missing.joinToString()}

            ##########################
        """.trimIndent()
    )
}

/**
 * Adds a call to the registration method of this add-on to the add-on manager
 * of Morphe Patches.
 *
 * Must be called from a finalize block, since the extension of the base
 * bundle is merged while its patches execute.
 *
 * @param registrationMethodDescriptor Descriptor of the static registration
 * method of this add-on.
 */
internal fun registerAddOn(registrationMethodDescriptor: String) {
    val addOnManagerClass = mutableClassDefByOrNull(ADD_ON_MANAGER_CLASS_DESCRIPTOR)
        ?: throw PatchException(
            """
                ##########################

                Could not find Morphe Add-on support files.

                This patch bundle is an add-on that requires the official Morphe patches.
                Patch again with the Morphe official patch bundle (Morphe Patches source)
                included.

                ##########################
            """.trimIndent()
        )

    checkHostCompatibility()

    val registerMethod = addOnManagerClass.methods.firstOrNull {
        it.name == ADD_ON_MANAGER_REGISTER_METHOD_NAME &&
                it.returnType == "V" &&
                it.parameters.isEmpty() &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: throw PatchException(
        "Could not find $ADD_ON_MANAGER_REGISTER_METHOD_NAME(). " +
                "The installed Morphe Patches version is not compatible with this add-on."
    )

    registerMethod.addInstruction(0, "invoke-static { }, $registrationMethodDescriptor")
}
