package patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Observe the public CAL Session after its lifecycle registry has been initialized. */
context(context: BytecodePatchContext)
internal fun bindNavigationProviderLifecycle() {
    Fingerprint(definingClass = "Landroidx/lifecycle/LifecycleEventObserver;", name = "onStateChanged",
        returnType = "V", parameters = listOf("Landroidx/lifecycle/LifecycleOwner;", "Landroidx/lifecycle/Lifecycle\$Event;")).method
    Fingerprint(definingClass = "Landroidx/lifecycle/LifecycleRegistry;", name = "addObserver",
        returnType = "V", parameters = listOf("Landroidx/lifecycle/LifecycleObserver;")).method
    Fingerprint(definingClass = "Landroidx/car/app/Session;", name = "getLifecycle",
        returnType = "Landroidx/lifecycle/Lifecycle;", parameters = emptyList()).method
    Fingerprint(definingClass = "Lnl/johninnl/navigation/startup/ProviderLifecycle;", name = "observeCarSession",
        returnType = "V", parameters = listOf("Ljava/lang/Object;")).method
    val constructor = Fingerprint(definingClass = "Landroidx/car/app/Session;", name = "<init>",
        returnType = "V", parameters = emptyList()).method
    observeNavigationProviderSession(constructor)
}

internal fun observeNavigationProviderSession(constructor: MutableMethod) {
    val body = constructor.instructions
    check(constructor.definingClass == "Landroidx/car/app/Session;" && constructor.name == "<init>" &&
        constructor.parameterTypes.isEmpty() && constructor.returnType == "V" &&
        body.count { it.opcode == Opcode.RETURN_VOID } == 1 && body.last().opcode == Opcode.RETURN_VOID &&
        body.any { (it as? ReferenceInstruction)?.reference.toString() == "Landroidx/lifecycle/LifecycleRegistry;-><init>(Landroidx/lifecycle/LifecycleOwner;)V" }
        && body.none { (it as? ReferenceInstruction)?.reference.toString() == "Lnl/johninnl/navigation/startup/ProviderLifecycle;->observeCarSession(Ljava/lang/Object;)V" }
    ) { "Changed public car Session lifecycle initialization" }
    val index = body.lastIndex
    constructor.replaceInstruction(index,
        "invoke-static/range {p0 .. p0}, Lnl/johninnl/navigation/startup/ProviderLifecycle;->observeCarSession(Ljava/lang/Object;)V")
    constructor.addInstruction(index + 1, "return-void")
}
