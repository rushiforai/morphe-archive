package patches.gboard.features.customtheme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.generated.GboardVersionBindings
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.gboardStructuralFingerprint
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomThemeOfficialImportPatch = bytecodePatch(
    description = "Add a ZIP theme import option to Gboard's own theme plus button.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val (plusHandler, resultHandler) = validateCustomThemeTargetContract()
        plusHandler.applyCustomThemeGuard(
            RuntimeCallId.CUSTOM_THEME_RUNTIME_INTERCEPT_PLUS,
            "p0 .. p3",
            "custom_theme_plus_continue",
            CUSTOM_THEME_PLUS_STOCK_REGISTERS,
        )
        resultHandler.applyCustomThemeGuard(
            RuntimeCallId.CUSTOM_THEME_RUNTIME_HANDLE_ACTIVITY_RESULT,
            "p0 .. p3",
            "custom_theme_result_continue",
            CUSTOM_THEME_RESULT_STOCK_REGISTERS,
        )
    }
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun validateCustomThemeTargetContract(): Pair<MutableMethod, MutableMethod> = with(context) {
    check(GboardVersionBindings.targetVersion in setOf("18.6.3", "18.8.0-beta")) {
        "Unsupported Custom Theme stock contract for ${GboardVersionBindings.targetVersion}"
    }
    val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
    val publicStatic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
    val plusHandler = findMutableMethodOrThrow(GboardVersionBindings.customThemePlusHandler)
    val resultHandler = findMutableMethodOrThrow(GboardVersionBindings.customThemeResultHandler)
    listOf(
        plusHandler,
        resultHandler,
        findMutableMethodOrThrow(GboardVersionBindings.customThemePeerResultHandler),
        findMutableMethodOrThrow(GboardVersionBindings.customThemeLauncherLaunch),
    ).forEach { method ->
        check(method.accessFlags == publicFinal && method.implementation != null) {
            "Unexpected Custom Theme method shape for ${method.definingClass}->${method.name}"
        }
    }
    plusHandler.requireStockFingerprintUnlessPatched(
        RuntimeCallId.CUSTOM_THEME_RUNTIME_INTERCEPT_PLUS,
        when (GboardVersionBindings.targetVersion) {
            "18.8.0-beta" -> CUSTOM_THEME_PLUS_188_FINGERPRINT
            else -> CUSTOM_THEME_PLUS_1863_FINGERPRINT
        },
    )
    resultHandler.requireStockFingerprintUnlessPatched(
        RuntimeCallId.CUSTOM_THEME_RUNTIME_HANDLE_ACTIVITY_RESULT,
        when (GboardVersionBindings.targetVersion) {
            "18.8.0-beta" -> CUSTOM_THEME_RESULT_188_FINGERPRINT
            else -> CUSTOM_THEME_RESULT_1863_FINGERPRINT
        },
    )
    findMutableMethodOrThrow(GboardVersionBindings.customThemeValidator).let { method ->
        check(method.accessFlags == publicStatic && method.implementation != null) {
            "Unexpected Custom Theme validator shape for ${method.definingClass}->${method.name}"
        }
    }
    check(GboardVersionBindings.customThemeFragmentPeerField.resolve(this).accessFlags ==
        AccessFlags.PUBLIC.value) {
        "Unexpected Custom Theme fragment peer field shape"
    }
    listOf(
        GboardVersionBindings.customThemePeerContextField,
        GboardVersionBindings.customThemePeerLauncherField,
    ).forEach { binding ->
        check(binding.resolve(this).accessFlags == publicFinal) {
            "Unexpected Custom Theme peer field shape for ${binding.reference}"
        }
    }
    plusHandler to resultHandler
}

internal fun MutableMethod.requireStockFingerprintUnlessPatched(
    call: RuntimeCallId,
    expected: String,
) {
    val runtimeReference = RuntimeAbiCatalog.abi(call).reference
    if (implementation!!.instructions.any { it.isMethodReference(runtimeReference) }) return
    val actual = gboardStructuralFingerprint()
    check(actual == expected) {
        "Unexpected 18.6.3 Custom Theme fingerprint for $definingClass->$name: " +
            "$actual != $expected"
    }
}

// Stock 18.6.3 structure: Lkbl;->f(Lkbf;Lkbo;I)V and the fragment's activity result handler.
internal const val CUSTOM_THEME_PLUS_1863_FINGERPRINT =
    "847c767ae8a96d901f25a912eb42071221255933fee93b12fa3487f6a868e910"
internal const val CUSTOM_THEME_RESULT_1863_FINGERPRINT =
    "0686622b70cde1e986f10d2bb83162eccd3d52fa0e5abcfe5b644432d984df11"

// Stock 18.8.0-beta structure: Lvmj;->c(Lvmh;Lvmn;I)V and ThemeListingFragment;->X(IILandroid/content/Intent;)V.
internal const val CUSTOM_THEME_PLUS_188_FINGERPRINT =
    "4a43629ebfda38c5d74e14116833f177c261c890b3231a4f56192f87eb557739"
internal const val CUSTOM_THEME_RESULT_188_FINGERPRINT =
    "113d1137ff039d25b4e1a925a3513a8ef8fe7d588f45243c9a6317884e3b9324"

// Register files the stock bodies are compiled with; the guard only needs v0 as scratch,
// and the entry copies keep those values readable after the adapter is prepended.
internal const val CUSTOM_THEME_PLUS_STOCK_REGISTERS = 6
internal const val CUSTOM_THEME_RESULT_STOCK_REGISTERS = 5

private fun MutableMethod.applyCustomThemeGuard(
    call: RuntimeCallId,
    registers: String,
    labelName: String,
    expectedRegisters: Int,
) {
    check(accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)) {
        "Unexpected access flags for $definingClass->$name"
    }
    val implementation = implementation ?: error("No implementation in $definingClass->$name")
    check(implementation.registerCount == expectedRegisters) {
        "Unexpected register count in $definingClass->$name: ${implementation.registerCount}"
    }
    val abi = RuntimeAbiCatalog.abi(call)
    val existing = implementation.instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1 && implementation.instructions.first().isMethodReference(abi.reference)) {
            "Malformed Custom Theme adapter in $definingClass->$name"
        }
        return
    }
    addInstructions(0, "nop")
    val continuation = implementation.instructions[0]
    addInstructionsWithLabels(
        0,
        """
            ${RuntimeCallEmitter.invoke(call, registers)}

            move-result v0

            if-eqz v0, :$labelName

            return-void
        """.trimIndent(),
        ExternalLabel(labelName, continuation),
    )
}
