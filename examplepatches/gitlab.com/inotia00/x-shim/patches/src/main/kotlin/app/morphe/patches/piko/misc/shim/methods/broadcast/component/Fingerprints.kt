package app.morphe.patches.piko.misc.shim.methods.broadcast.component

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val COMPONENT_FACTORY_PREFIX = "Lcom/twitter/app/di/ComponentFactory"
internal const val COMPONENT_FACTORY_CLASS = "$COMPONENT_FACTORY_PREFIX;"

internal object ComponentFactoryBroadcastReceiverFingerprint : Fingerprint(
    definingClass = COMPONENT_FACTORY_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/content/BroadcastReceiver;",
    filters = listOf(
        newInstance(COMPONENT_FACTORY_PREFIX),
    )
)

internal object ComponentFactoryConstructorFingerprint : Fingerprint(
    definingClass = COMPONENT_FACTORY_CLASS,
    name = "<clinit>",
    filters = listOf(
        opcode(Opcode.CONST_CLASS),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Ljava/lang/Class;->getName()Ljava/lang/String;",
            location = MatchAfterImmediately()
        ),
        opcode(
            opcode = Opcode.MOVE_RESULT_OBJECT,
            location = MatchAfterImmediately()
        ),
        fieldAccess(
            opcode = Opcode.SPUT_OBJECT,
            definingClass = "this",
            type = "Ljava/lang/String;",
            location = MatchAfterImmediately()
        )
    )
)

