package app.aidan.patches.sezzle.security

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

// Hermes bytecode replacement constants
private val EXPECTED_SELECT_SHOULD_FORCE_UPDATE_BYTES = byteArrayOf(
    0x89.toByte(), 0x00, 0x01, 0x44
)
private val FORCED_FALSE_SELECT_SHOULD_FORCE_UPDATE_BYTES = byteArrayOf(
    0x96.toByte(), 0x00, 0x76.toByte(), 0x00
)

private val EXPECTED_SAGA_BYTES_1 = byteArrayOf(0x40, 0x01, 0x07, 0x89.toByte())
private val EXPECTED_SAGA_WATCHER_BYTES_1 = byteArrayOf(0x40, 0x01, 0x02, 0x97.toByte())
private val EXPECTED_SAGA_BYTES_2 = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val EXPECTED_SAGA_WATCHER_BYTES_2 = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val STUBBED_UNDEFINED_RETURN_BYTES = byteArrayOf(
    0x93.toByte(), 0x00, 0x76.toByte(), 0x00
)

private val EXPECTED_UPDATE_APP_MODAL_BYTES = byteArrayOf(0x34, 0x12, 0x00, 0x40)
private val STUBBED_NULL_RETURN_BYTES = byteArrayOf(
    0x94.toByte(), 0x00, 0x76.toByte(), 0x00
)

private val EXPECTED_GET_STORE_URL_BYTES = byteArrayOf(
    0x91.toByte(), 0x00, 0x14, 0x64, 0x01, 0x00, 0x76.toByte(), 0x00
)
private val EXPECTED_GET_FULL_STORE_URL_BYTES = byteArrayOf(
    0x91.toByte(), 0x00, 0xb2.toByte(), 0x88.toByte(), 0x01, 0x00, 0x76.toByte(), 0x00
)
private val STUBBED_STORE_URL_BYTES = byteArrayOf(
    0x93.toByte(), 0x00, 0x76.toByte(), 0x00,
    0x93.toByte(), 0x00, 0x76.toByte(), 0x00
)

private val EXPECTED_TAMPER_CHECK_BYTES = byteArrayOf(0x34, 0x01, 0x00, 0x3b)
private val STUBBED_FALSE_RETURN_BYTES = byteArrayOf(
    0x96.toByte(), 0x00, 0x76.toByte(), 0x00
)

private val EXPECTED_RATE_BYTES = byteArrayOf(
    0x89.toByte(), 0x07, 0x02, 0x93.toByte()
)

/**
 * Applies [replacement] when [expected] is present, accepts an already-patched
 * bundle, and fails on any other bytecode.
 */
private fun HermesBundleEditor.patchIdempotently(
    offset: Int,
    expected: ByteArray,
    replacement: ByteArray,
    description: String
) {
    when {
        matchesBytes(offset, expected) -> patchBytes(offset, replacement)
        matchesBytes(offset, replacement) -> return
        else -> throw PatchException("Unexpected bytecode at $description")
    }
}

@Suppress("unused")
val suppressHermesUpdatesAndIntegrityPatch = rawResourcePatch(
    name = "Suppress In-App Updates and Rating Prompts",
    description = "Neutralizes Hermes Redux update sagas, UpdateAppModal dialogs, Play Store URL redirects, trustFall tamper detection, and in-app rating prompts.",
    default = true
) {
    category("Security")
    compatibleWith(COMPATIBILITY_SEZZLE)

    val suppressForceUpdates = booleanOption(
        key = "suppressForceUpdates",
        default = true,
        title = "Suppress Force Updates",
        description = "Neutralizes Redux force update sagas, version verification selectors, and UpdateAppModal."
    )

    val bypassTrustFall = booleanOption(
        key = "bypassTrustFall",
        default = true,
        title = "Bypass Hermes Tamper Checks",
        description = "Forces trustFall, isJailBroken, hookDetected, and canMockLocation to always return false in Hermes JS."
    )

    val suppressRatingPrompts = booleanOption(
        key = "suppressRatingPrompts",
        default = true,
        title = "Suppress Store Rating Prompts",
        description = "Suppresses in-app review requests and milestone rating dialogs that redirect to Google Play."
    )

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        if (suppressForceUpdates.value != false) {
            // 1. Force selectShouldForceUpdate to return false
            val selectShouldForceUpdateOffset = editor.findFunctionOffsetByName("selectShouldForceUpdate")
                ?: throw PatchException("selectShouldForceUpdate function not found")
            editor.patchIdempotently(
                selectShouldForceUpdateOffset,
                EXPECTED_SELECT_SHOULD_FORCE_UPDATE_BYTES,
                FORCED_FALSE_SELECT_SHOULD_FORCE_UPDATE_BYTES,
                "selectShouldForceUpdate"
            )

            // 2. Neutralize shouldForceUpdateAppSaga functions
            val sagaOffsets = editor.findFunctionOffsetsByName("shouldForceUpdateAppSaga")
            if (sagaOffsets.isEmpty()) {
                throw PatchException("shouldForceUpdateAppSaga functions not found")
            }
            for (offset in sagaOffsets) {
                if (editor.matchesBytes(offset, EXPECTED_SAGA_BYTES_1)) {
                    editor.patchBytes(offset, STUBBED_UNDEFINED_RETURN_BYTES)
                } else if (editor.matchesBytes(offset, EXPECTED_SAGA_BYTES_2)) {
                    editor.patchBytes(offset, STUBBED_UNDEFINED_RETURN_BYTES)
                }
            }

            // 3. Neutralize shouldForceUpdateAppSagaWatcher functions
            val watcherOffsets = editor.findFunctionOffsetsByName("shouldForceUpdateAppSagaWatcher")
            if (watcherOffsets.isEmpty()) {
                throw PatchException("shouldForceUpdateAppSagaWatcher functions not found")
            }
            for (offset in watcherOffsets) {
                if (editor.matchesBytes(offset, EXPECTED_SAGA_WATCHER_BYTES_1)) {
                    editor.patchBytes(offset, STUBBED_UNDEFINED_RETURN_BYTES)
                } else if (editor.matchesBytes(offset, EXPECTED_SAGA_WATCHER_BYTES_2)) {
                    editor.patchBytes(offset, STUBBED_UNDEFINED_RETURN_BYTES)
                }
            }

            // 4. Neutralize UpdateAppModal component
            val updateAppModalOffset = editor.findFunctionOffsetByName("UpdateAppModal")
                ?: throw PatchException("UpdateAppModal function not found")
            editor.patchIdempotently(
                updateAppModalOffset,
                EXPECTED_UPDATE_APP_MODAL_BYTES,
                STUBBED_NULL_RETURN_BYTES,
                "UpdateAppModal"
            )

            // 5. Neutralize getStoreUrl and getFullStoreUrl
            val getStoreUrlOffset = editor.findFunctionOffsetByName("getStoreUrl")
                ?: throw PatchException("getStoreUrl function not found")
            editor.patchIdempotently(
                getStoreUrlOffset,
                EXPECTED_GET_STORE_URL_BYTES,
                STUBBED_STORE_URL_BYTES,
                "getStoreUrl"
            )

            val getFullStoreUrlOffset = editor.findFunctionOffsetByName("getFullStoreUrl")
                ?: throw PatchException("getFullStoreUrl function not found")
            editor.patchIdempotently(
                getFullStoreUrlOffset,
                EXPECTED_GET_FULL_STORE_URL_BYTES,
                STUBBED_STORE_URL_BYTES,
                "getFullStoreUrl"
            )
        }

        if (bypassTrustFall.value != false) {
            val tamperFunctions = listOf("trustFall", "isJailBroken", "hookDetected", "canMockLocation")
            for (fnName in tamperFunctions) {
                val fnOffset = editor.findFunctionOffsetByName(fnName)
                if (fnOffset != null && editor.matchesBytes(fnOffset, EXPECTED_TAMPER_CHECK_BYTES)) {
                    editor.patchBytes(fnOffset, STUBBED_FALSE_RETURN_BYTES)
                }
            }
        }

        if (suppressRatingPrompts.value != false) {
            val rateOffset = editor.findFunctionOffsetByName("rate") { offset ->
                editor.matchesBytes(offset, EXPECTED_RATE_BYTES)
            }
            if (rateOffset != null) {
                editor.patchBytesIfMatches(
                    rateOffset,
                    EXPECTED_RATE_BYTES,
                    STUBBED_UNDEFINED_RETURN_BYTES
                )
            }
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
