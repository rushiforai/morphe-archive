package app.ffn.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * The network request wrapper's failure handler (m4.k.G in 66.5). It also calls the app's
 * stripped logger (E5.w.a in 66.5), which is how the debug logging patch locates that class.
 */
object RequestFailureFingerprint : Fingerprint(
    returnType = "Lkotlin/Unit;",
    parameters = listOf("L", "Ljava/lang/Throwable;"),
    filters = listOf(
        string("onFailure: request canceled"),
        methodCall(
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/String;"),
            returnType = "V",
        ),
    ),
)

/** The request wrapper's execute method (m4.k.E in 66.5): launches the request coroutine. */
object RequestExecuteFingerprint : Fingerprint(
    classFingerprint = RequestFailureFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.DECLARED_SYNCHRONIZED),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            parameters = listOf("L", "J", "L", "Lkotlin/jvm/functions/Function2;", "I"),
        ),
    ),
)

/** The request wrapper's constructor (m4.k.<init> in 66.5): sets the default timeout of 30 seconds. */
object RequestConstructorFingerprint : Fingerprint(
    classFingerprint = RequestFailureFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(30L),
        fieldAccess(opcode = Opcode.IPUT_WIDE, definingClass = "this", type = "J", location = MatchAfterImmediately()),
    ),
)


/** The HTTP/2 client's frame parser (D7.a0.a in 66.5): one instance per frame type, switched on an int field. */
object FrameParserFingerprint : Fingerprint(
    parameters = listOf("L", "[B"),
    returnType = "L",
    filters = listOf(
        string("payload"),
        string("p"),
        literal(2147483647L),
    ),
)

/**
 * The part of the response handler (m4.k.H in 66.5) that stores the decoded result in the base
 * request class (f4.N.o0) and then runs the base class callback pipeline (invoke-super f4.N.j).
 */
object RequestResultFingerprint : Fingerprint(
    classFingerprint = RequestFailureFingerprint,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/Object;"),
        methodCall(opcode = Opcode.INVOKE_SUPER),
    ),
)
