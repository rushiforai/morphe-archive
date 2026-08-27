package app.morphe.patches.discord.bunny

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val STOCK_PACKAGE_ID = "com.discord"
internal const val BUNNY_PACKAGE_ID = "io.github.seobject.bunny"

private const val DYNAMIC_RECEIVER_PERMISSION_SUFFIX =
    ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"

private fun androidAttribute(
    element: Element,
    name: String,
): String =
    element.getAttribute("android:$name")

private fun setAndroidAttribute(
    element: Element,
    name: String,
    value: String,
) {
    element.setAttribute(
        "android:$name",
        value,
    )
}

private fun rewriteProviderAuthorities(
    authorities: String,
): String =
    authorities
        .split(';')
        .joinToString(";") { authority ->
            when {
                authority == STOCK_PACKAGE_ID ->
                    BUNNY_PACKAGE_ID

                authority.startsWith("$STOCK_PACKAGE_ID.") ->
                    BUNNY_PACKAGE_ID +
                        authority.substring(
                            STOCK_PACKAGE_ID.length,
                        )

                else ->
                    authority
            }
        }

internal val bunnyPackageIdentityResourcePatch = resourcePatch(
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest =
                document.documentElement

            check(manifest.tagName == "manifest") {
                "AndroidManifest.xml has an unexpected root element"
            }

            val originalPackage =
                manifest.getAttribute("package")

            check(originalPackage == STOCK_PACKAGE_ID) {
                "Expected stock package $STOCK_PACKAGE_ID, " +
                    "found $originalPackage"
            }

            check(BUNNY_PACKAGE_ID != STOCK_PACKAGE_ID)

            /*
             * The application ID changes, but Discord's Java/Kotlin
             * namespace does not. Absolute component class names such as
             * com.discord.MainApplication, activities, services,
             * receivers, aliases, and targetActivity values therefore
             * remain untouched.
             */
            manifest.setAttribute(
                "package",
                BUNNY_PACKAGE_ID,
            )

            val oldDynamicReceiverPermission =
                STOCK_PACKAGE_ID +
                    DYNAMIC_RECEIVER_PERMISSION_SUFFIX

            val newDynamicReceiverPermission =
                BUNNY_PACKAGE_ID +
                    DYNAMIC_RECEIVER_PERMISSION_SUFFIX

            var permissionDeclarationRewrites = 0
            var permissionUseRewrites = 0

            val permissionNodes =
                document.getElementsByTagName(
                    "permission",
                )

            for (
                index in
                0 until permissionNodes.length
            ) {
                val permission =
                    permissionNodes.item(index)
                        as? Element
                        ?: continue

                if (
                    androidAttribute(
                        permission,
                        "name",
                    ) ==
                    oldDynamicReceiverPermission
                ) {
                    setAndroidAttribute(
                        permission,
                        "name",
                        newDynamicReceiverPermission,
                    )

                    permissionDeclarationRewrites++
                }
            }

            val usesPermissionNodes =
                document.getElementsByTagName(
                    "uses-permission",
                )

            for (
                index in
                0 until usesPermissionNodes.length
            ) {
                val permission =
                    usesPermissionNodes.item(index)
                        as? Element
                        ?: continue

                if (
                    androidAttribute(
                        permission,
                        "name",
                    ) ==
                    oldDynamicReceiverPermission
                ) {
                    setAndroidAttribute(
                        permission,
                        "name",
                        newDynamicReceiverPermission,
                    )

                    permissionUseRewrites++
                }
            }

            check(
                permissionDeclarationRewrites ==
                    permissionUseRewrites
            ) {
                "Dynamic receiver permission declaration/use mismatch: " +
                    "$permissionDeclarationRewrites/" +
                    "$permissionUseRewrites"
            }

            check(permissionDeclarationRewrites <= 1) {
                "Unexpected duplicate dynamic receiver permission"
            }

            /*
             * Provider authorities are global Android identities.
             * Leaving com.discord.* authorities behind would collide
             * with stock Discord during side-by-side installation.
             *
             * Only authorities are rewritten here. Provider class names
             * remain in the original com.discord Java namespace.
             */
            var providerAuthorityRewrites = 0

            val providerNodes =
                document.getElementsByTagName(
                    "provider",
                )

            for (
                index in
                0 until providerNodes.length
            ) {
                val provider =
                    providerNodes.item(index)
                        as? Element
                        ?: continue

                val before =
                    androidAttribute(
                        provider,
                        "authorities",
                    )

                if (before.isBlank()) {
                    continue
                }

                val after =
                    rewriteProviderAuthorities(
                        before,
                    )

                if (after != before) {
                    setAndroidAttribute(
                        provider,
                        "authorities",
                        after,
                    )

                    providerAuthorityRewrites++
                }
            }

            /*
             * Fail closed if any provider authority still uses the stock
             * application identity.
             */
            var remainingStockAuthorities = 0

            for (
                index in
                0 until providerNodes.length
            ) {
                val provider =
                    providerNodes.item(index)
                        as? Element
                        ?: continue

                val authorities =
                    androidAttribute(
                        provider,
                        "authorities",
                    )

                authorities
                    .split(';')
                    .forEach { authority ->
                        if (
                            authority ==
                                STOCK_PACKAGE_ID ||
                            authority.startsWith(
                                "$STOCK_PACKAGE_ID.",
                            )
                        ) {
                            remainingStockAuthorities++
                        }
                    }
            }

            check(remainingStockAuthorities == 0) {
                "Stock provider authorities remain: " +
                    remainingStockAuthorities
            }

            check(
                manifest.getAttribute("package") ==
                    BUNNY_PACKAGE_ID
            ) {
                "Bunny package identity was not written"
            }

            /*
             * Intentionally preserved:
             *
             * - com.discord.* component class names
             * - activity-alias names and targetActivity values
             * - com.discord.intent.action.* actions
             * - Discord metadata keys/values
             * - taskAffinity values
             *
             * Those are runtime namespaces/contracts, not global Android
             * package identities that block side-by-side installation.
             */
        }
    }
}