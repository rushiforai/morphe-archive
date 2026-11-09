package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val COMSCORE_INITIALIZER = "Lcom/bloomberg/comscore/ComScoreInitializer;"
private const val COMSCORE_MODULE = "Lcom/bloomberg/comscore/ComscoreModule;"
private const val STREAMSENSE_MODULE = "Lcom/bloomberg/comscore/StreamSenseModule;"
private const val APPSFLYER_MODULE = "Lcom/appsflyer/reactnative/RNAppsFlyerModule;"

private fun MutableMethod.indexOfInstruction(predicate: (Instruction) -> Boolean): Int =
    implementation!!.instructions.indexOfFirst(predicate)

private fun Instruction.isCallTo(name: String) =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.name == name

private fun Instruction.isSgetOf(name: String) =
    ((this as? ReferenceInstruction)?.reference as? FieldReference)?.name == name

@Suppress("unused")
val disableAppsFlyerComscorePatch = bytecodePatch(
    name = "Disable analytics SDKs",
    description = "Turns off AppsFlyer (install tracking and event logging) and Comscore (audience measurement). " +
        "AppsFlyer does not start, and events it logs report success without being sent. " +
        "Comscore sends no startup, foreground, view, or stream pings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        fun method(descriptor: String, name: String) =
            mutableClassDefBy(descriptor).methods.first { it.name == name }

        method(COMSCORE_INITIALIZER, "initialize").let { initialize ->
            val index = initialize.indexOfInstruction {
                it.opcode == Opcode.SGET_BOOLEAN && it.isSgetOf("isInitialized")
            }
            initialize.replaceInstruction(index, "const/4 v0, 0x1")
        }
        method(COMSCORE_INITIALIZER, "notifyEnterForeground").returnEarly()
        method(COMSCORE_INITIALIZER, "notifyExitForeground").returnEarly()

        method(COMSCORE_MODULE, "logComScoreViewEvent").let { logView ->
            val index = logView.indexOfInstruction { it.isCallTo("checkNotNullParameter") }
            logView.addInstructions(index + 1, "return-void")
        }

        method(STREAMSENSE_MODULE, "notify").let { notify ->
            notify.addInstructions(notify.indexOfInstruction { it.opcode == Opcode.DOUBLE_TO_LONG }, "return-void")
        }

        method(APPSFLYER_MODULE, "callSdkInternal").addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
        method(APPSFLYER_MODULE, "startSdk").returnEarly()
        method(APPSFLYER_MODULE, "logAdRevenue").returnEarly()
        method(APPSFLYER_MODULE, "logEvent").addInstructions(
            0,
            """
                const-string p1, "Success"
                filled-new-array {p1}, [Ljava/lang/Object;
                move-result-object p1
                invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Callback;->invoke([Ljava/lang/Object;)V
                return-void
            """,
        )
        method(APPSFLYER_MODULE, "logEventWithPromise").addInstructions(
            0,
            """
                const-string p1, "Success"
                invoke-interface {p3, p1}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """,
        )
    }
}
