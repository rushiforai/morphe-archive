/*
 * Standalone port of Morphe's "Disable Shorts repeat" patch.
 * Original: https://github.com/MorpheApp/morphe-patches
 *
 * Licensed under the GNU General Public License v3.0, with the additional GPL section 7
 * requirements that apply to Morphe contributions (see the upstream NOTICE file).
 *
 * This standalone version drops the in-tree dependencies (imported fingerprints,
 * versionCheckPatch / is_21_* flags, and the shared COMPATIBILITY_YOUTUBE constant) so it can
 * be built as an independent .mpp bundle. Everything it needs is contained in this file.
 */

package dev.nosini.patches.youtube

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.findInstructionIndicesReversed
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// region Fingerprints (copied verbatim from the upstream shortsautoplay/Fingerprints.kt).

internal object ReelEnumConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("REEL_LOOP_BEHAVIOR_UNKNOWN"),
        string("REEL_LOOP_BEHAVIOR_SINGLE_PLAY"),
        string("REEL_LOOP_BEHAVIOR_REPEAT"),
        string("REEL_LOOP_BEHAVIOR_END_SCREEN"),
        opcode(Opcode.RETURN_VOID)
    )
)

private object ReelPlaybackRepeatParentFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall($$"Lj$/time/Instant;->toEpochMilli()J"),
        string("r_tr")
    )
)

internal object ReelPlaybackRepeatFingerprint : Fingerprint(
    classFingerprint = ReelPlaybackRepeatParentFingerprint,
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        anyInstruction(
            methodCall(smali = "Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z"),
            methodCall(smali = $$"Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;") // 21.17+
        )
    )
)

// endregion

// region Compatibility (copied verbatim from the upstream shared/Constants.kt COMPATIBILITY_YOUTUBE).

private val COMPATIBILITY_YOUTUBE = Compatibility(
    name = "YouTube",
    packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = setOf(
        // Android 13+
        "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
        // Android 7+
        "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"
    ),
    // Upstream targets below 21.17 are omitted: this patch requires 21.17+ and would
    // always fail on them (the app code handling the end screen behavior is missing).
    targets = listOf(
        AppTarget(
            version = "21.26.360",
            minSdk = 29,
            isExperimental = true
        ),
        AppTarget(
            version = "21.25.523",
            minSdk = 29,
            isExperimental = true
        ),
        AppTarget(
            version = "21.24.360",
            minSdk = 29,
            isExperimental = true
        )
    )
)

// endregion

/**
 * Stops YouTube Shorts from auto-repeating.
 *
 * When a Short would repeat (REEL_LOOP_BEHAVIOR_REPEAT), the behavior is rewritten to
 * REEL_LOOP_BEHAVIOR_END_SCREEN (play once, then stop at the end screen). Any other loop
 * behavior passes through unchanged.
 *
 * Requires YouTube 21.17 or greater: from 20.09 until 21.17 the app code handling the
 * end screen behavior was removed, so the rewrite would have no effect.
 *
 * This patch has no settings toggle: the behavior is baked in at patch time, so applying the
 * patch is the switch. It can be combined with the "Shorts autoplay" patch, but note that when
 * autoplay is disabled, Shorts will stop at the end screen instead of repeating — for the
 * REPEAT case this patch's rewrite wins depending on the injection order of the two patches.
 */
val disableShortsRepeatPatch = bytecodePatch(
    name = "Disable Shorts repeat",
    description = "Stops Shorts from automatically repeating. There is no setting for this; " +
            "the patch itself is the switch.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val reelEnumClass = ReelEnumConstructorFingerprint.originalClassDef.type

        // From YouTube 20.09 until 21.17 the app code handling the end screen ('Pause')
        // behavior was removed, so rewriting the enum would silently do nothing.
        // Same version comparison upstream's versionCheckPatch uses.
        val versionName = packageMetadata.versionName
        if (versionName < "21.17.000") {
            throw PatchException(
                "This patch requires YouTube 21.17 or greater (patching $versionName). " +
                        "YouTube 20.09-21.16 lacks the app code that stops playback at the " +
                        "end screen, so the patch cannot work there."
            )
        }

        // Locate the static enum fields for the two loop behaviors by scanning the enum's static
        // constructor: find the const-string with the exact behavior name, then the first
        // sput-object after it whose field type is the enum class.
        val (repeatField, endScreenField) = with(ReelEnumConstructorFingerprint.method) {
            fun enumFieldFor(name: String): FieldReference {
                val stringIndex = indexOfFirstInstructionOrThrow {
                    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
                            getReference<StringReference>()?.string == name
                }
                val fieldIndex = indexOfFirstInstructionOrThrow(stringIndex) {
                    opcode == Opcode.SPUT_OBJECT &&
                            getReference<FieldReference>()?.type == reelEnumClass
                }
                return getInstruction<ReferenceInstruction>(fieldIndex).reference as FieldReference
            }

            enumFieldFor("REEL_LOOP_BEHAVIOR_REPEAT") to enumFieldFor("REEL_LOOP_BEHAVIOR_END_SCREEN")
        }

        val repeatFieldSmali =
            "${repeatField.definingClass}->${repeatField.name}:${repeatField.type}"
        val endScreenFieldSmali =
            "${endScreenField.definingClass}->${endScreenField.name}:${endScreenField.type}"

        // Add a private static helper method to avoid finding multiple free registers at each
        // call site. If the enum is REPEAT it returns END_SCREEN, otherwise the enum is unchanged.
        // Register count 3 (static, single param) means p0 maps to v2, leaving v0/v1 free.
        val helperClass = ReelPlaybackRepeatFingerprint.method.definingClass
        val helperName = "patch_disableShortsRepeat"
        val helperMethod = ImmutableMethod(
            helperClass,
            helperName,
            listOf(ImmutableMethodParameter("Ljava/lang/Enum;", null, null)),
            "Ljava/lang/Enum;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $repeatFieldSmali
                    if-ne p0, v0, :original
                    sget-object v1, $endScreenFieldSmali
                    return-object v1
                    :original
                    return-object p0
                """
            )
        }
        ReelPlaybackRepeatFingerprint.classDef.methods.add(helperMethod)

        ReelPlaybackRepeatFingerprint.method.apply {
            // The behavior enums are looked up from an ordinal value to an enum type. The exact
            // helper signature varies by app version ((I), (L) and (L, L) have all been used),
            // so match on the stable property instead of hardcoding signatures: every call in
            // this method that returns the enum type and stores its result is a lookup site.
            val indices = findInstructionIndicesReversed(
                methodCall(returnType = reelEnumClass)
            ).filter { index ->
                getInstruction(index + 1).opcode == Opcode.MOVE_RESULT_OBJECT
            }
            if (indices.isEmpty()) {
                throw PatchException(
                    "Could not find any Shorts loop behavior lookup calls. " +
                            "This YouTube version may not be supported."
                )
            }

            indices.forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index + 1).registerA

                addInstructions(
                    index + 2,
                    """
                        invoke-static {v$register}, $helperClass->$helperName(Ljava/lang/Enum;)Ljava/lang/Enum;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}
