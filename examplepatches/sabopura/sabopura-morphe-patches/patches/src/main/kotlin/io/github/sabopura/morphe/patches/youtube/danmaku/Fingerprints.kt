package io.github.sabopura.morphe.patches.youtube.danmaku

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.checkCast
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object ConversionContextToStringFingerprint : Fingerprint(
    name = "toString",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
    strings = listOf(
        "ConversionContext{",
        ", widthConstraint=",
        ", templateLoggerFactory=",
        ", rootDisposableContainer=",
        ", identifierProperty=",
    ),
)

internal object SpannableStringBuilderFingerprint : Fingerprint(
    returnType = "Ljava/lang/CharSequence;",
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            smali = "Landroid/text/SpannableString;->valueOf(Ljava/lang/CharSequence;)Landroid/text/SpannableString;",
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "V",
            parameters = listOf(
                "Landroid/text/SpannableString;",
                "Ljava/lang/Object;",
                "I",
                "Z",
                "I",
            ),
        ),
        string(
            "Failed to set PB Style Run Extension in TextComponentSpec.",
            comparison = StringComparisonType.STARTS_WITH,
        ),
    ),
)

internal object PlayerInitFingerprint : Fingerprint(
    filters = listOf(
        string("playVideo called on player response with no videoStreamingData."),
    ),
)

internal object VideoIdParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "[L",
    parameters = listOf("L"),
    filters = listOf(literal(524288L)),
)

/**
 * Stable visible-player video id hook used by Morphe's own video information patch. The map write
 * has no distance limit because Morphe's patches insert one id hook per feature before it.
 */
internal object VideoIdFingerprint : Fingerprint(
    classFingerprint = VideoIdParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, returnType = "Ljava/lang/String;"),
        app.morphe.patcher.opcode(
            Opcode.MOVE_RESULT_OBJECT,
            location = app.morphe.patcher.InstructionLocation.MatchAfterImmediately(),
        ),
        methodCall(
            smali = "Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        ),
        app.morphe.patcher.opcode(
            Opcode.RETURN_VOID,
            location = app.morphe.patcher.InstructionLocation.MatchAfterImmediately(),
        ),
    ),
)

/** The same visible-player event now delegates its map write to a helper. */
internal object DelegatingVideoIdFingerprint : Fingerprint(
    classFingerprint = VideoIdParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, returnType = "Ljava/lang/String;"),
        app.morphe.patcher.opcode(
            Opcode.MOVE_RESULT_OBJECT,
            location = app.morphe.patcher.InstructionLocation.MatchAfterImmediately(),
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("Ljava/lang/String;", "L"),
            returnType = "V",
        ),
        app.morphe.patcher.opcode(
            Opcode.RETURN_VOID,
            location = app.morphe.patcher.InstructionLocation.MatchAfterImmediately(),
        ),
    ),
)

/** YouTube's central Cronet request builder, used to copy current account headers in memory. */
internal object BuildRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    // Fingerprint return types intentionally omit the trailing ';' in Morphe's
    // descriptor matcher (the concrete method reference below remains a full descriptor).
    returnType = "Lorg/chromium/net/UrlRequest",
    custom = { method, _ ->
        val parameters = method.parameterTypes
        parameters.size in 6..8 &&
            parameters[1] == "Ljava/util/Map;" &&
            method.implementation != null &&
            !method.definingClass.startsWith("Lorg/") &&
            indexOfNewUrlRequestBuilder(method) >= 0
    },
)

internal fun indexOfNewUrlRequestBuilder(method: Method) =
    method.implementation!!.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.toString() ==
            "Lorg/chromium/net/CronetEngine;->newUrlRequestBuilder(Ljava/lang/String;" +
            "Lorg/chromium/net/UrlRequest\$Callback;Ljava/util/concurrent/Executor;)" +
            "Lorg/chromium/net/UrlRequest\$Builder;"
    }

private object CreateVideoPlayerSeekbarFingerprint : Fingerprint(
    name = "onDraw",
    returnType = "V",
    filters = listOf(
        string("timed_markers_width"),
    ),
)

internal object VideoLengthFingerprint : Fingerprint(
    classFingerprint = CreateVideoPlayerSeekbarFingerprint,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall("Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V"),
        methodCall(returnType = "J"),
        methodCall(returnType = "J", location = MatchAfterWithin(5)),
        methodCall(returnType = "J", location = MatchAfterWithin(10)),
        methodCall(returnType = "J", location = MatchAfterWithin(10)),
        methodCall(returnType = "Z", parameters = listOf()),
        app.morphe.patcher.opcode(Opcode.CMP_LONG, location = MatchAfterWithin(8)),
    ),
)

