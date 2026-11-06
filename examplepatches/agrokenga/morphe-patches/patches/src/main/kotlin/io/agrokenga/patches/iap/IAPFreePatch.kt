package io.agrokenga.patches.iap

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import io.agrokenga.patches.native.patchMethod
import java.util.logging.Logger

private val log = Logger.getLogger("IAPFreePatch")

/**
 * KoPP2 2.21.4 IAP bypass — makes all in-game store purchases free.
 *
 * Based on Ghidra reverse engineering of the actual call stack:
 *
 * Premium bundle IAP path:
 *   IAPButton.PurchaseClicked → ScreenHelper.ShowPurchaseConfirmation →
 *   IAPButton.PurchaseCallback → IAPService.PurchaseBundle → Unity IAP →
 *   GooglePlayIAP.ProcessPurchase → PlayFabApiCall<object,object>.Execute (0x2CA7DF0)
 *
 * In-game store path (gold/items):
 *   StoreService.PurchaseItem (0x251EDBC) → CloudScriptFunction.Execute →
 *   CloudScriptFunctionBase.SendRequest → PlayFabCloudScriptAPI.ExecuteFunction
 *
 * This patch intercepts both paths at the initiation point:
 * 1. IAPService.PurchaseBundle at 0x2515B64 — replaces the call to
 *    IStoreController.InitiatePurchase with an immediate return, bypassing
 *    the Play Store UI entirely for premium bundles.
 * 2. StoreService.PurchaseItem at 0x251EDBC — intercepts in-game store purchases
 *    before they reach the CloudScript path.
 *
 * Note: The purchase is registered but not automatically granted. The grant/callback
 * chain (GrantPurchase → CompletePurchase → PurchaseCallback.Invoke) is not triggered.
 * A separate patch would be needed to automatically grant purchases.
 *
 * RVA and file offset come from Ghidra analysis of libil2cpp.so:
 * - IAPService.PurchaseBundle (InitiatePurchase call site): RVA 0x2515B64, file offset 0x2511B64
 * - StoreService.PurchaseItem: RVA 0x251EDBC, file offset 0x251ADBC
 *
 * These offsets are version-specific. Re-dump both ABIs before reusing them on a
 * different app version.
 */
private const val ARM64_PURCHASE_BUNDLE_INITIATE_RVA = 0x2515B64L
private const val ARM64_PURCHASE_BUNDLE_INITIATE_FILE_OFFSET = 0x2511B64L
private const val ARM64_STORE_PURCHASE_RVA = 0x251EDBCL
private const val ARM64_STORE_PURCHASE_FILE_OFFSET = 0x251ADBCL

private const val ARMV7_PURCHASE_BUNDLE_INITIATE_RVA = 0x14A05B0L
private const val ARMV7_PURCHASE_BUNDLE_INITIATE_FILE_OFFSET = 0x14A05B0L
private const val ARMV7_STORE_PURCHASE_RVA = 0x14A05B0L
private const val ARMV7_STORE_PURCHASE_FILE_OFFSET = 0x14A05B0L

// ARM64 `ret`
private val ARM64_RET = byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())

// ARMv7 ARM-mode `bx lr`
private val ARMV7_BX_LR = byteArrayOf(0x1E.toByte(), 0xFF.toByte(), 0x2F.toByte(), 0xE1.toByte())

val iapFreePatch = resourcePatch(
    name = "IAP Free (All Items)",
    description = "Makes all in-game store purchases free by bypassing the PlayFab server and " +
        "Play Store UI. Patches IAPService.PurchaseBundle to return immediately without " +
        "calling IStoreController.InitiatePurchase, and patches StoreService.PurchaseItem " +
        "for in-game store purchases.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(AppTarget(version = "2.21.4")),
        ),
    )

    val enableFreeIAP = booleanOption(
        key = "iapFreeEnable",
        default = false,
        title = "Make all store items free",
        description = "Patch IAPService.PurchaseBundle and StoreService.PurchaseItem to bypass " +
            "the PlayFab server and Play Store UI. Purchases are registered but not automatically " +
            "granted. Disabled by default.",
    )

    execute {
        log.info("=== IAP Free patch ===")

        if (enableFreeIAP.value != true) {
            log.info("Disabled; set iapFreeEnable=true to make all store items free.")
        } else {
            val arm64 = get("lib/arm64-v8a/libil2cpp.so")
            if (arm64.exists()) {
                // Patch IAPService.PurchaseBundle — replace InitiatePurchase call with ret
                patchMethod(
                    file = arm64,
                    abi = "arm64-v8a",
                    methodName = "IAPService.PurchaseBundle (InitiatePurchase call site)",
                    rva = ARM64_PURCHASE_BUNDLE_INITIATE_RVA,
                    expectedOffset = ARM64_PURCHASE_BUNDLE_INITIATE_FILE_OFFSET,
                    patch = ARM64_RET,
                )

                // Patch StoreService.PurchaseItem — in-game store purchases
                patchMethod(
                    file = arm64,
                    abi = "arm64-v8a",
                    methodName = "StoreService.PurchaseItem",
                    rva = ARM64_STORE_PURCHASE_RVA,
                    expectedOffset = ARM64_STORE_PURCHASE_FILE_OFFSET,
                    patch = ARM64_RET,
                )
            } else {
                log.warning(
                    "MISSING lib/arm64-v8a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }

            val armv7 = get("lib/armeabi-v7a/libil2cpp.so")
            if (armv7.exists()) {
                // Patch IAPService.PurchaseBundle — replace InitiatePurchase call with bx lr
                patchMethod(
                    file = armv7,
                    abi = "armeabi-v7a",
                    methodName = "IAPService.PurchaseBundle (InitiatePurchase call site)",
                    rva = ARMV7_PURCHASE_BUNDLE_INITIATE_RVA,
                    expectedOffset = ARMV7_PURCHASE_BUNDLE_INITIATE_FILE_OFFSET,
                    patch = ARMV7_BX_LR,
                )

                // Patch StoreService.PurchaseItem — in-game store purchases
                patchMethod(
                    file = armv7,
                    abi = "armeabi-v7a",
                    methodName = "StoreService.PurchaseItem",
                    rva = ARMV7_STORE_PURCHASE_RVA,
                    expectedOffset = ARMV7_STORE_PURCHASE_FILE_OFFSET,
                    patch = ARMV7_BX_LR,
                )
            } else {
                log.warning(
                    "MISSING lib/armeabi-v7a/libil2cpp.so. The APKM must be merged before patching; " +
                        "base.apk alone has no lib/ directory.",
                )
            }
        }
    }
}
