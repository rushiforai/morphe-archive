package app.template.patches.zensms

import app.morphe.patcher.patch.bytecodePatch

const val ZEN_SMS_EXTENSION = "extensions/extension.mpe"
const val RTL_EXTENSION_CLASS = "Lapp/patchlab/extension/rtl/RtlSmsLayout;"

private val sharedZenSmsExtensionPatchInstance = bytecodePatch(default = false) {
    extendWith(ZEN_SMS_EXTENSION)

    execute {
        classDefBy(RTL_EXTENSION_CLASS)
    }
}

/**
 * One unnamed dependency merges the extension exactly once when either public
 * ZenSMS extension patch is selected.
 */
fun sharedZenSmsExtensionPatch() = sharedZenSmsExtensionPatchInstance
