/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_WEAR
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private fun disableAppsFlyer(allowMissingPurchaseClient: Boolean) {
    var appsFlyerStarts = 0
    var purchaseObservers = 0
    classDefForEach { classDef ->
        when {
            classDef.superclass == "Lcom/appsflyer/AppsFlyerLib;" -> {
                mutableClassDefBy(classDef).methods
                    .filter { it.name == "start" && it.returnType == "V" && it.implementation != null }
                    .forEach {
                        it.addInstructions(0, "return-void")
                        appsFlyerStarts++
                    }
            }
            classDef.type == "Lcom/appsflyer/api/PurchaseClientImpl;" -> {
                mutableClassDefBy(classDef).methods
                    .filter { it.name == "startObservingTransactions" && it.returnType == "V" && it.implementation != null }
                    .forEach {
                        it.addInstructions(0, "return-void")
                        purchaseObservers++
                    }
            }
        }
    }
    if (appsFlyerStarts == 0) throw PatchException("AppsFlyerLib.start implementation not found")
    if (!allowMissingPurchaseClient && purchaseObservers == 0) {
        throw PatchException("PurchaseClientImpl.startObservingTransactions not found")
    }
    if (purchaseObservers > 1) {
        throw PatchException("Expected at most 1 PurchaseClientImpl.startObservingTransactions, found $purchaseObservers")
    }
}

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off Firebase Analytics, Crashlytics, Performance and Sessions, plus AppsFlyer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        disableAppsFlyer(allowMissingPurchaseClient = false)
    }
}

@Suppress("unused")
val disableAnalyticsWearPatch = patch(
    name = "Disable analytics (Wear OS)",
    description = "Turns off Firebase Analytics, Crashlytics, Performance and Sessions, plus AppsFlyer on the Wear OS companion app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_WEAR)
    category("Wear OS")
    dependsOn(firebaseManifestPatch())

    execute {
        disableAppsFlyer(allowMissingPurchaseClient = true)
    }
}
