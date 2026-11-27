package app.jimaku.patches

import app.jimaku.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

/** Registration method of the Jimaku extension, called by Morphe's add-on manager. */
private const val REGISTER_METHOD = "Lapp/jimaku/extension/JimakuAddOn;->register()V"

/**
 * Morphe Patches declares this method for add-ons and never changes it
 * (patches/.../youtube/misc/addon/AddOnSupport.kt, morphe-patches f3acc10e).
 */
private const val ADD_ON_MANAGER_CLASS = "Lapp/morphe/extension/youtube/addon/AddOnManager;"
private const val ADD_ON_MANAGER_REGISTER = "registerAddOns"

@Suppress("unused")
val jimakuPatch = patch(
    name = "Jimaku",
    description = "Shows Jimaku subtitles over the player. Apply together with Morphe's YouTube patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/jimaku.mpe")

    // Morphe's extension, and with it the add-on manager, is merged while Morphe's patches
    // execute. Finalize runs after every patch of both bundles, whatever their order.
    finalize {
        registerWithMorphe()
    }
}

private fun registerWithMorphe() {
    val manager = mutableClassDefByOrNull(ADD_ON_MANAGER_CLASS)
        ?: throw PatchException(hostIncompatibleMessage(listOf("app.morphe.extension.youtube.addon.AddOnManager")))

    val missing = missingHostMethods(REQUIRED_HOST_METHODS) { descriptor ->
        classDefByOrNull(descriptor)?.methods?.map {
            HostMethod(
                name = it.name,
                parameterTypes = it.parameterTypes.map(CharSequence::toString),
                returnType = it.returnType,
                isPublicStatic = AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags),
            )
        }
    }
    if (missing.isNotEmpty()) throw PatchException(hostIncompatibleMessage(missing))

    val register = manager.methods.firstOrNull {
        it.name == ADD_ON_MANAGER_REGISTER &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "V" &&
            AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: throw PatchException(
        hostIncompatibleMessage(listOf("app.morphe.extension.youtube.addon.AddOnManager.registerAddOns()V")),
    )

    register.addInstruction(0, "invoke-static { }, $REGISTER_METHOD")
}
