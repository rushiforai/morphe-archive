package app.jofslash.patches.wikipedia.permissions

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.editManifest
import app.jofslash.patches.wikipedia.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeUnneededPermissionsPatch = resourcePatch(
    name = "Remove unneeded permissions",
    description = "Removes the Google Play install referrer, used only for install tracking, and the " +
            "phone state permission, which a library adds and the app never asks for.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf(
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                    "android.permission.READ_PHONE_STATE",
                )
            )
        }
    }
}
