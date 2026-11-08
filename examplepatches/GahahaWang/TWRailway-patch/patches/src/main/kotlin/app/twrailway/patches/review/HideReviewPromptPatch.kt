package app.twrailway.patches.review

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.twrailway.patches.settings.PATCH_SETTINGS_CLASS
import app.twrailway.patches.settings.libappCopyPatch
import app.twrailway.patches.settings.markPatchApplied
import app.twrailway.patches.settings.patchSettingsPatch
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.util.logging.Logger

/** Makes `AppController.canShowReview` in libapp.so always return false. */
private val reviewPromptLibraryPatch = rawResourcePatch {
    execute {
        val libraries = listApkEntries("lib/").filter { it.endsWith("/libapp.so") }
        if (libraries.isEmpty()) throw PatchException("Could not find libapp.so")

        var patchedCount = 0
        libraries.forEach { path ->
            if (!path.startsWith("lib/arm64-v8a/")) {
                patchLogger.warning("The review dialog is only hidden for arm64-v8a, skipping $path")
                return@forEach
            }

            val file = get(path)
            val bytes = file.readBytes()
            val offsets = bytes.canShowReviewChecks()
            if (offsets.size != 1) {
                throw PatchException("Expected one canShowReview check in $path, found ${offsets.size}")
            }

            B_RETURN_FALSE.toBytes().copyInto(bytes, offsets.single() + CBNZ_INDEX * 4)
            file.writeBytes(bytes)
            patchedCount++
        }

        if (patchedCount == 0) throw PatchException("Could not find an arm64-v8a libapp.so to patch")
    }
}

/**
 * The "喜歡這個App嗎？" (rate this app) dialog is the app's own `AppReviewView`, drawn by Flutter.
 * The search page shows it after a search when `AppController.canShowReview()` is true:
 *
 * ```dart
 * bool canShowReview() =>
 *     successUsageCount.value % 5 == 0 &&
 *     successUsageCount.value >= 5 &&
 *     shouldShowReview.value &&   // GetStorage "shouldShowReviewKey-<version>"
 *     remindReview.value < DateTime.now().millisecondsSinceEpoch; // GetStorage "remindReviewKey"
 * ```
 *
 * These values are stored with get_storage, a pure Dart file, so they cannot be changed from the
 * native side. The patch changes the AOT compiled `canShowReview` in `libapp.so` (arm64): the
 * first check
 *
 * ```
 * mov   x0, #5
 * sdiv  x3, x1, x0
 * msub  x2, x3, x0, x1     ; successUsageCount % 5
 * cmp   x2, xzr
 * b.lt  fix_negative
 * cbnz  x2, return_false
 * ldur  x1, [fp, #-8]
 * ```
 *
 * gets an unconditional `b return_false` in place of the `cbnz`, so the dialog is never shown.
 *
 * The rate_my_app package dialog reads its state with the shared_preferences plugin
 * (`SharedPreferencesAsync.getBool`, `rateMyApp_doNotOpenAgain`), as did older versions of the
 * app's own dialog (`shouldShowReviewKey-<version>`). The native `getBool` implementations are
 * hooked so these keys always read as "do not show the dialog", whatever is stored.
 *
 * It can be turned off in the patch settings. The `getBool` hook reads the setting itself; for
 * `canShowReview` the extension then loads a copy of libapp.so with the `cbnz` put back, see
 * `LibappCopy` in the extension.
 */
@Suppress("unused")
val hideReviewPromptPatch = bytecodePatch(
    name = "Hide review prompt",
    description = "Stops the \"喜歡這個App嗎？\" dialog asking to rate the app from showing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)

    dependsOn(patchSettingsPatch, libappCopyPatch, reviewPromptLibraryPatch)

    execute {
        markPatchApplied("hide_review_prompt")

        val setUpMethod = SharedPreferencesAsyncApiSetUpFingerprint.method
        val apiInterface = setUpMethod.parameterTypes[1].toString()

        val implementations = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (apiInterface in classDef.interfaces) implementations += classDef
        }
        if (implementations.isEmpty()) {
            throw PatchException("Could not find implementations of $apiInterface")
        }

        var patchedCount = 0
        implementations.forEach { classDef ->
            mutableClassDefBy(classDef).methods.filter { method ->
                // Boolean getBool(String key, SharedPreferencesPigeonOptions options)
                method.returnType == "Ljava/lang/Boolean;" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                    method.implementation != null
            }.forEach { method ->
                val registerCount = method.implementation!!.registerCount
                // p0 (this), p1 (key) and p2 (options) are the last 3 registers.
                if (registerCount - 3 < 1 || registerCount > 16) {
                    throw PatchException("Unexpected register layout in ${classDef.type}->${method.name}")
                }

                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, $PATCH_SETTINGS_CLASS->hideReviewPrompt()Z
                        move-result v0
                        if-eqz v0, :original
                        const-string v0, "shouldShowReviewKey"
                        invoke-virtual { p1, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :check_rate_my_app
                        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                        return-object v0
                        :check_rate_my_app
                        const-string v0, "rateMyApp_doNotOpenAgain"
                        invoke-virtual { p1, v0 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :original
                        sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                        return-object v0
                    """,
                    ExternalLabel("original", method.getInstruction(0)),
                )
                patchedCount++
            }
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find SharedPreferencesAsyncApi.getBool implementations")
        }
    }
}

private val patchLogger = Logger.getLogger("HideReviewPromptPatch")

/** The first check of `canShowReview`, without the `bl` (index 8) whose offset differs. */
private val CAN_SHOW_REVIEW_CHECK = intArrayOf(
    0xd28000a0.toInt(), // mov x0, #5
    0x9ac00c23.toInt(), // sdiv x3, x1, x0
    0x9b008462.toInt(), // msub x2, x3, x0, x1
    0xeb1f005f.toInt(), // cmp x2, xzr
    0x540005cb, // b.lt +0xb8
    0xb50004e2.toInt(), // cbnz x2, +0x9c (return false)
    0xf85f83a1.toInt(), // ldur x1, [fp, #-8]
    0, // bl RxObjectMixin.value
    0x93417c01.toInt(), // sbfx x1, x0, #1, #0x1f
    0x36000040, // tbz w0, #0, +8
    0xf8407001.toInt(), // ldur x1, [x0, #7]
    0xf100143f.toInt(), // cmp x1, #5
    0x5400040b, // b.lt +0x80 (return false)
)
private const val CBNZ_INDEX = 5
private const val BL_INDEX = 7

/** `b +0x9c`, the same target as the `cbnz`. */
private const val B_RETURN_FALSE = 0x14000027

/** `add x0, x22, #0x30`: false, at the target of the `cbnz`. */
private const val RETURN_FALSE = 0x9100c2c0.toInt()

private fun ByteArray.canShowReviewChecks(): List<Int> {
    val result = mutableListOf<Int>()
    var offset = 0
    while (offset <= size - CAN_SHOW_REVIEW_CHECK.size * 4) {
        val matches = CAN_SHOW_REVIEW_CHECK.indices.all { i ->
            val word = readInt(offset + i * 4)
            if (i == BL_INDEX) word ushr 26 == 0x25 else word == CAN_SHOW_REVIEW_CHECK[i]
        }
        if (matches && readInt(offset + CBNZ_INDEX * 4 + 0x9c) == RETURN_FALSE) result += offset
        offset += 4
    }
    return result
}

private fun Int.toBytes() = byteArrayOf(toByte(), (this shr 8).toByte(), (this shr 16).toByte(), (this shr 24).toByte())

private fun ByteArray.readInt(offset: Int) =
    (this[offset].toInt() and 0xff) or
        ((this[offset + 1].toInt() and 0xff) shl 8) or
        ((this[offset + 2].toInt() and 0xff) shl 16) or
        ((this[offset + 3].toInt() and 0xff) shl 24)
