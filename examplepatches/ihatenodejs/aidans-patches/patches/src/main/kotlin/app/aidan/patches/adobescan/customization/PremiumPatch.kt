/*
 * Reverse-engineering reference:
 * Doom's Morphe Patches — AdobeScanPremiumPatch.kt
 * https://github.com/rushiranpise/morphe-patches/blob/main/patches/src/main/kotlin/app/template/patches/adobescan/premium/AdobeScanPremiumPatch.kt
 *
 * The referenced implementation is licensed under GPL-3.0.
 * This implementation was independently written and substantially
 * redesigned for different entitlement behavior and feature scope.
 */

package app.aidan.patches.adobescan.customization

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val UNAUTHENTICATED_USER_ENTITLEMENTS = "Lcr/d0${'$'}a${'$'}a;"
private const val AUTHENTICATED_USER_ENTITLEMENTS = "Lcr/y0;"
private const val SERVICE_ENTITLEMENTS = "Lwm/s;"
private const val COMPRESSION_LEVEL = "Loe/a;"
private const val FILE_OPTIONS_MENU_HELPER = "Lqt/u;"
private const val RES_GENAI_SUMMARY_TITLE = 0x7f142405

private val LOCAL_ENTITLEMENTS = listOf("d", "e", "j", "n")
private val CLOUD_TOOL_ENTITLEMENTS = listOf("r", "s", "u")

@Suppress("unused")
val premiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Enables locally executable premium OCR, editing, compression, and page-organization tools without cloud or GenAI access.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)
    val removeBrokenFeatures = booleanOption(
        key = "removeBrokenFeatures",
        default = true,
        title = "Remove Broken Features",
        description = "Removes broken cloud-dependent actions like Generative summary."
    )
    val unlockCloudTools = booleanOption(
        key = "unlockCloudTools",
        default = false,
        title = "Enable Cloud Tools (Experimental)",
        description = "Enables Combine, Export, and Protect PDF for signed-in accounts with compatible Adobe Document Cloud access."
    )

    execute {
        unlockEntitlements(UNAUTHENTICATED_USER_ENTITLEMENTS, LOCAL_ENTITLEMENTS)
        unlockEntitlements(AUTHENTICATED_USER_ENTITLEMENTS, LOCAL_ENTITLEMENTS)
        unlockLocalServices()
        if (unlockCloudTools.value == true) {
            unlockEntitlements(UNAUTHENTICATED_USER_ENTITLEMENTS, CLOUD_TOOL_ENTITLEMENTS)
            unlockEntitlements(AUTHENTICATED_USER_ENTITLEMENTS, CLOUD_TOOL_ENTITLEMENTS)
        }
        allowAllCompressionLevels()
        if (removeBrokenFeatures.value != false) {
            removeGenerativeSummary()
        }
    }
}

/**
 * Enables the app's local premium predicates at both entitlement implementations. The
 * unauthenticated implementation is used with Remove Login; y0 preserves the same behavior for
 * an active user session without changing unrelated account, billing, or GenAI predicates.
 */
private fun BytecodePatchContext.unlockEntitlements(
    classDescriptor: String,
    methodNames: List<String>
) {
    val entitlements = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing required Premium entitlement class $classDescriptor")
    methodNames.forEach { methodName ->
        val method = entitlements.methods.singleOrNull {
            it.name == methodName &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "Z" &&
                it.implementation != null
        } ?: throw PatchException("Missing required Premium entitlement $classDescriptor->$methodName()Z")
        method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

/**
 * Allows direct service checks for the local compression, editing, and Scan Premium gates without
 * enabling Document Cloud-only services.
 */
private fun BytecodePatchContext.unlockLocalServices() {
    val serviceEntitlements = mutableClassDefByOrNull(SERVICE_ENTITLEMENTS)
        ?: throw PatchException("Missing required Premium service class $SERVICE_ENTITLEMENTS")
    val serviceCheck = serviceEntitlements.methods.singleOrNull {
        it.name == "y" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lln/e${'$'}g;") &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Missing required Premium service entitlement check")
    serviceCheck.addInstructions(
        0,
        """
        sget-object v0, Lln/e${'$'}g;->COMPRESSPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        sget-object v0, Lln/e${'$'}g;->EDITPDF_SERVICE:Lln/e${'$'}g;
        if-eq p0, v0, :local_premium_service
        sget-object v0, Lln/e${'$'}g;->SCAN_PREMIUM_SERVICE:Lln/e${'$'}g;
        if-ne p0, v0, :continue_service_check
        :local_premium_service
        const/4 v0, 0x1
        return v0
        :continue_service_check
        """.trimIndent()
    )
}

/**
 * CompressionLevel.isPremiumLocked has exactly two direct callers, both in the local Save options
 * composable. Unlike the service-level checks, it has no cloud, account, billing, or GenAI callers.
 */
private fun BytecodePatchContext.allowAllCompressionLevels() {
    val compressionLevel = mutableClassDefByOrNull(COMPRESSION_LEVEL)
        ?: throw PatchException("Missing required local Premium class $COMPRESSION_LEVEL")
    val isPremiumLocked = compressionLevel.methods.singleOrNull {
        it.name == "isPremiumLocked" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Missing required local compression lock predicate")
    isPremiumLocked.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

/**
 * Neutralizes the Generative summary item in File Options bottom sheet.
 * Generative summary requires Adobe cloud and GenAI subscription infrastructure which is broken
 * in the offline/local Premium patch.
 */
private fun BytecodePatchContext.removeGenerativeSummary() {
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    // Find the first GenAI entitlement check (Lfu/b;->g()Z) which guards Generative summary.
    val genAiIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE &&
            reference?.definingClass == "Lfu/b;" &&
            reference.name == "g" &&
            reference.parameterTypes.isEmpty() &&
            reference.returnType == "Z"
    }
    if (genAiIndex < 0) {
        throw PatchException("Could not find GenAI entitlement call in FileOptionsMenuBottomSheet")
    }

    val moveResult = instructions.getOrNull(genAiIndex + 1) as? OneRegisterInstruction
        ?: throw PatchException("Missing move-result for GenAI entitlement call")
    if (moveResult.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Unexpected instruction following GenAI call: ${moveResult.opcode}")
    }

    // Verify that RES_GENAI_SUMMARY_TITLE (0x7f142405) is loaded shortly after.
    val hasSummaryString = (genAiIndex + 2..minOf(instructions.size - 1, genAiIndex + 20)).any { idx ->
        val inst = instructions[idx]
        inst is NarrowLiteralInstruction && inst.narrowLiteral == RES_GENAI_SUMMARY_TITLE
    }
    if (!hasSummaryString) {
        throw PatchException("Did not find Generative summary resource id following GenAI check")
    }

    optionsMethod.addInstructions(genAiIndex + 2, "const/4 v${moveResult.registerA}, 0x0")
}
