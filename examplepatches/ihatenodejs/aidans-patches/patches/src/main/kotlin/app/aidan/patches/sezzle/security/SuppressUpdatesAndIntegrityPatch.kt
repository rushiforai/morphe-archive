package app.aidan.patches.sezzle.security

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.sezzle.shared.HermesBundleEditor
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MAIN_APPLICATION = "Lcom/sezzle/sezzlemobile/MainApplication;"
private const val CODE_PUSH = "Lcom/microsoft/codepush/react/CodePush;"
private const val ROOT_BEER = "Lcom/scottyab/rootbeer/RootBeer;"
private const val JAIL_MONKEY_ROOTED_CHECK = "Lcom/gantix/JailMonkey/Rooted/RootedCheck;"

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
    0x91.toByte(), 0x00, 0x69, 0x36, 0x01, 0x00, 0x76.toByte(), 0x00
)
private val EXPECTED_GET_FULL_STORE_URL_BYTES = byteArrayOf(
    0x91.toByte(), 0x00, 0xed.toByte(), 0x84.toByte(), 0x01, 0x00, 0x76.toByte(), 0x00
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

@Suppress("unused")
val suppressHermesUpdatesAndIntegrityPatch = rawResourcePatch(
    name = "Suppress In-App Updates and Rating Prompts",
    description = "Neutralizes Hermes Redux update sagas, UpdateAppModal dialogs, Play Store URL redirects, trustFall tamper detection, and in-app rating prompts.",
    default = true
) {
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
            editor.patchBytesIfMatches(
                selectShouldForceUpdateOffset,
                EXPECTED_SELECT_SHOULD_FORCE_UPDATE_BYTES,
                FORCED_FALSE_SELECT_SHOULD_FORCE_UPDATE_BYTES
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
            editor.patchBytesIfMatches(
                updateAppModalOffset,
                EXPECTED_UPDATE_APP_MODAL_BYTES,
                STUBBED_NULL_RETURN_BYTES
            )

            // 5. Neutralize getStoreUrl and getFullStoreUrl
            val getStoreUrlOffset = editor.findFunctionOffsetByName("getStoreUrl")
                ?: throw PatchException("getStoreUrl function not found")
            editor.patchBytesIfMatches(
                getStoreUrlOffset,
                EXPECTED_GET_STORE_URL_BYTES,
                STUBBED_STORE_URL_BYTES
            )

            val getFullStoreUrlOffset = editor.findFunctionOffsetByName("getFullStoreUrl")
                ?: throw PatchException("getFullStoreUrl function not found")
            editor.patchBytesIfMatches(
                getFullStoreUrlOffset,
                EXPECTED_GET_FULL_STORE_URL_BYTES,
                STUBBED_STORE_URL_BYTES
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

@Suppress("unused")
val suppressUpdatesAndIntegrityPatch = bytecodePatch(
    name = "Suppress Updates and Integrity Checks",
    description = "Disables Microsoft CodePush OTA updates and neutralizes Dalvik root and tamper detection SDKs (RootBeer and JailMonkey).",
    default = true
) {
    compatibleWith(COMPATIBILITY_SEZZLE)
    dependsOn(suppressHermesUpdatesAndIntegrityPatch)

    val disableCodePush = booleanOption(
        key = "disableCodePush",
        default = true,
        title = "Disable CodePush OTA",
        description = "Prevents Microsoft CodePush from downloading remote JavaScript bundles that override local patches."
    )

    val bypassRootAndTamperDetection = booleanOption(
        key = "bypassRootAndTamperDetection",
        default = true,
        title = "Bypass Root & Tamper Detection",
        description = "Bypasses RootBeer and JailMonkey checks in Dalvik bytecode so modified or rooted devices are never flagged."
    )

    execute {
        if (disableCodePush.value != false) {
            val application = mutableClassDefByOrNull(MAIN_APPLICATION)
                ?: throw PatchException("Sezzle MainApplication not found")
            val bundleHostMethod = application.methods.singleOrNull { method ->
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == CODE_PUSH &&
                        reference.name == "getJSBundleFile" &&
                        reference.parameterTypes.isEmpty() &&
                        reference.returnType == "Ljava/lang/String;"
                } == true
            } ?: throw PatchException("Could not find MainApplication's CodePush bundle selector")
            val instructions = bundleHostMethod.implementation?.instructions
                ?: throw PatchException("MainApplication's CodePush bundle selector has no implementation")
            val getBundleIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == CODE_PUSH && reference.name == "getJSBundleFile"
            }
            check(getBundleIndex >= 0) { "CodePush bundle selector disappeared during patching" }

            val result = instructions.getOrNull(getBundleIndex + 1) as? OneRegisterInstruction
                ?: throw PatchException("CodePush bundle selector has no move-result instruction")
            if (result.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Unexpected CodePush bundle selector result instruction: ${result.opcode}")
            }

            // DefaultReactHost treats a null bundle path as a request for assets/index.android.bundle.
            // The CodePush package remains registered so the embedded bundle can still resolve it.
            bundleHostMethod.addInstructions(getBundleIndex + 2, "const/4 v${result.registerA}, 0x0")
        }

        if (bypassRootAndTamperDetection.value != false) {
            returnBoolean(
                ROOT_BEER,
                "isRooted",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "isRootedWithBusyBoxCheck",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "isRootedWithoutBusyBoxCheck",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "detectRootManagementApps",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "detectPotentiallyDangerousApps",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "detectTestKeys",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "checkForBusyBoxBinary",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "checkForSuBinary",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "checkSuExists",
                false
            )
            returnBoolean(
                ROOT_BEER,
                "checkForRWPaths",
                false
            )

            returnBoolean(
                JAIL_MONKEY_ROOTED_CHECK,
                "isJailBroken",
                false
            )
        }
    }
}

/**
 * Makes every eligible boolean method named [methodName] return [value].
 *
 * Eligible methods return primitive `Z`, have an implementation, and reserve at least one
 * register for the injected `v0`. Fails when the target class or no eligible method is found.
 */
private fun BytecodePatchContext.returnBoolean(classDescriptor: String, methodName: String, value: Boolean) {
    val classDef = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Target class not found: $classDescriptor")
    val methods = classDef.methods.filter { method ->
        val implementation = method.implementation
        method.name == methodName &&
            method.returnType == "Z" &&
            implementation != null &&
            implementation.registerCount >= 1
    }
    if (methods.isEmpty()) {
        throw PatchException("No patchable boolean method named $methodName in $classDescriptor")
    }

    val constInstruction = if (value) "const/4 v0, 0x1" else "const/4 v0, 0x0"
    methods.forEach { method ->
        method.addInstructions(0, "$constInstruction\nreturn v0")
    }
}
