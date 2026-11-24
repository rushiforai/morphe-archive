/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.misc.crashlytics

import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.baridimob.shared.BaridimobConstants
import app.morphe.patches.shared.removeElements
import app.morphe.patches.shared.returnEarlyVoidAll

@Suppress("unused")
val removeCrashlyticsPatch = patch(
    name = "Disable analytics and crash reporting",
    description = "Disables analytics and crash reporting while keeping push notifications.",
    default = true,
) {
    category("Privacy")
    compatibleWith(BaridimobConstants.COMPATIBILITY_BARIDIMOB)

    execute {
        mutableClassDefByOrNull("Lcom/bpcbt/android/app/application/MobileBankApp;")
            ?.returnEarlyVoidAll { it.name == "initFabric" }

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements(listOf("meta-data")) { el ->
                val name = el.attribute("android:name").orEmpty()
                name == "io.fabric.ApiKey" || (
                    name.startsWith("com.google.firebase.components:") &&
                        listOf("crashlytics", "sessions", "analytics").any { name.contains(it, ignoreCase = true) }
                    )
            }
            manifest.removeElements(listOf("provider")) {
                it.attribute("android:name") == "com.crashlytics.android.CrashlyticsInitProvider"
            }
        }
    }
}
