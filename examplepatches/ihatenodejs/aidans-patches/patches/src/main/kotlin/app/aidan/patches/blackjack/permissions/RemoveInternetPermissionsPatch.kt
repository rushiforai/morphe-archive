package app.aidan.patches.blackjack.permissions

import app.aidan.patches.blackjack.shared.COMPATIBILITY_BLACKJACK
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val INTERNET_PERMISSION = "android.permission.INTERNET"
private const val SHARED_ASSETS_SPLIT = "assets/bin/Data/sharedassets0.assets.split71"
private const val HELP_CENTER_BUTTON_PRIMARY_OFFSET = 0x301ae
private const val HELP_CENTER_BUTTON_DAILY_CHALLENGE_OFFSET = 0x3627e

@Suppress("unused")
val removeInternetPermissionsPatch = resourcePatch(
    name = "Remove Internet Permissions",
    description = "Removes Internet permissions from AndroidManifest.xml to prevent network access.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BLACKJACK)

    val removeBrokenScreens = booleanOption(
        key = "removeBrokenScreens",
        default = true,
        title = "Remove Broken Screens",
        description = "Removes Help Center buttons whose network-only content is unavailable without Internet access."
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissionsToRemove = buildList {
                for (tagName in listOf("uses-permission", "uses-permission-sdk-23")) {
                    val permissionNodes = document.getElementsByTagName(tagName)
                    for (index in 0 until permissionNodes.length) {
                        val element = permissionNodes.item(index) as? Element ?: continue
                        val permissionName = element.getAttributeNS(ANDROID_NAMESPACE, "name")
                            .ifEmpty { element.getAttribute("android:name") }
                            .trim()
                        if (permissionName == INTERNET_PERMISSION) {
                            add(element)
                        }
                    }
                }
            }

            var removedCount = 0
            permissionsToRemove.forEach { element ->
                if (element.parentNode?.removeChild(element) != null) {
                    removedCount++
                }
            }
            if (removedCount == 0) {
                throw PatchException("Internet permission '$INTERNET_PERMISSION' not found in AndroidManifest.xml")
            }
        }

        if (removeBrokenScreens.value ?: true) {
            val asset = get(SHARED_ASSETS_SPLIT)
            if (!asset.exists()) throw PatchException("Missing Blackjack shared Unity asset split")
            val bytes = asset.readBytes()

            fun deactivateGameObject(offset: Int, target: String) {
                if (offset !in bytes.indices) throw PatchException("$target is outside $SHARED_ASSETS_SPLIT")
                when (bytes[offset]) {
                    0.toByte() -> return
                    1.toByte() -> bytes[offset] = 0
                    else -> throw PatchException("$target active-state mismatch at 0x${offset.toString(16)}")
                }
            }

            deactivateGameObject(HELP_CENTER_BUTTON_PRIMARY_OFFSET, "Settings Help Center button")
            deactivateGameObject(HELP_CENTER_BUTTON_DAILY_CHALLENGE_OFFSET, "Daily Challenge Help Center button")
            asset.writeBytes(bytes)
        }
    }
}
