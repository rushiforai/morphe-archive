package io.github.sabopura.morphe.patches.twitch.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.callRegisters
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private const val DROPS = "Lio/github/sabopura/morphe/extension/twitch/app/AutoDrops;"
private const val APP = "Lio/github/sabopura/morphe/extension/twitch/app/AppHooks;"
private const val EVENTS = "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;"
private const val RX_PRESENTER = "Ltv/twitch/android/core/mvp/presenter/RxPresenter;"

private fun Method.parameterList() = parameterTypes.map { it.toString() }

private fun BytecodePatchContext.printedClass(vararg anchors: String): ClassDef =
    classesWithStrings(*anchors).uniqueContract("class printing ${anchors.first()}")

/** The field a toString prints as argument [argument] of the builder call that starts with [first]. */
private fun printedField(code: List<Instruction>, first: String, argument: Int): String {
    val constant = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == first }
    if (constant < 0) throw PatchException("Twitch: no \"$first\"")
    val register = (code[constant] as OneRegisterInstruction).registerA
    val call = code.drop(constant + 1).firstOrNull {
        it.opcode == Opcode.INVOKE_STATIC && (it as FiveRegisterInstruction).registerC == register
    } as? FiveRegisterInstruction ?: throw PatchException("Twitch: \"$first\" is not built in one call")
    val target = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)[argument]
    val read = code.subList(constant, code.indexOf(call as Instruction))
        .lastOrNull { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == target }
        ?: throw PatchException("Twitch: argument $argument of \"$first\" is not a field")
    return (read as ReferenceInstruction).reference.toString()
}

/**
 * The `new T(presenter, case)` Function1s that [code] passes, in one call, with the stream of the view's
 * EventDispatcher: the handlers of the view's events. 32.0.0 types T's constructor with the presenter,
 * not Object.
 */
internal fun viewEventSubscriptions(code: List<Instruction>, presenter: String): List<Pair<MethodReference, Int>> {
    val streams = code.indices.filter { i ->
        val ref = (code[i] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == EVENTS && ref.parameterTypes.isEmpty() && ref.returnType != "V" &&
            code.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }.map { (code[it + 1] as OneRegisterInstruction).registerA }.toSet()
    return code.indices.mapNotNull { i ->
        val init = (code[i] as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        val call = code[i] as? FiveRegisterInstruction ?: return@mapNotNull null
        val case = code.getOrNull(i - 1) as? NarrowLiteralInstruction ?: return@mapNotNull null
        val made = code.getOrNull(i - 2)
        val handler = call.registerC
        if (code[i].opcode != Opcode.INVOKE_DIRECT || init.name != "<init>" || call.registerCount != 3 ||
            init.parameterTypes.map { it.toString() } !in listOf(listOf("Ljava/lang/Object;", "I"), listOf(presenter, "I")) ||
            (case as OneRegisterInstruction).registerA != call.registerE ||
            made?.opcode != Opcode.NEW_INSTANCE || (made as OneRegisterInstruction).registerA != handler ||
            ((made as ReferenceInstruction).reference as TypeReference).type != init.definingClass
        ) return@mapNotNull null
        val subscribe = code.drop(i + 1).firstOrNull { handler in it.callRegisters() } ?: return@mapNotNull null
        if (subscribe.callRegisters().none { it in streams }) null else init to case.narrowLiteral
    }
}

/**
 * The handler of the drops notification's view events: the one that tells the Claim event apart. R8 merged
 * the presenter with unrelated ones in 32.0.0, so the merged class subscribes several views' events.
 */
private fun BytecodePatchContext.viewEventHandler(presenter: ClassDef, claimEvent: String): Pair<MethodReference, Int> =
    presenter.methods.flatMap { viewEventSubscriptions(it.implementation?.instructions?.toList().orEmpty(), presenter.type) }
        .filter { (init, _) ->
            classDefBy(init.definingClass).methods.any { method ->
                method.name == "invoke" && method.implementation?.instructions?.any {
                    it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == claimEvent
                } == true
            }
        }.uniqueContract("drops notification view-event handler")

/** Presses the channel drops notification's Claim button for a claimable drop. Adapted from Lurk (GPLv3). */
internal val autoDropsHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val presenter = printedClass("translateChannelAvailableDropsResponse", "translateAvailableDrops")
        val claimable = printedClass("Claimable(dropObjectId=", ", dropInstanceId=")
        val instanceId = printedField(
            claimable.methods.single { it.name == "toString" }.implementation!!.instructions.toList(), "Claimable(dropObjectId=", 3,
        )
        val claimEvent = printedClass("Claim(claimingState=", ", secondsPassedUntilClaim=")
        val claimInit = claimEvent.methods.filter {
            it.name == "<init>" && it.parameterList() == listOf(claimable.type, "I")
        }.uniqueContract("drop claim event constructor")
        val presentation = printedClass("DropPresentation(change=", ", dropObject=")
        val dropBase = classDefBy(claimable.type).superclass
        val change = presentation.fields.filter { it.type == dropBase }.uniqueContract("drop presentation field")
        val (handlerInit, case) = viewEventHandler(presenter, claimEvent.type)
        val handler = handlerInit.definingClass
        val stateArguments = listOf(presentation.type, "Ljava/lang/String;", "Z")

        val state = Fingerprint(
            name = "invoke", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;"),
            custom = { method, _ ->
                val code = method.implementation?.instructions?.toList() ?: return@Fingerprint false
                code.any { it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == presenter.type } &&
                    code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r -> r.name == "<init>" && r.parameterTypes.map { p -> p.toString() } == stateArguments } == true }
            },
        ).method
        state.apply {
            val code = instructions.toList()
            val init = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r -> r.name == "<init>" && r.parameterTypes.map { p -> p.toString() } == stateArguments } == true }
            val made = code[init] as? FiveRegisterInstruction ?: throw PatchException("Twitch: drops state is not built with registers")
            val pushed = code.getOrNull(init + 1) as? FiveRegisterInstruction ?: throw PatchException("Twitch: drops state is not pushed next")
            val pushCall = (pushed as ReferenceInstruction).reference as MethodReference
            if (pushCall.definingClass != RX_PRESENTER || pushed.registerCount != 2 || made.registerCount != 4 || pushed.registerD != made.registerC)
                throw PatchException("Twitch: the drops notification no longer shows the state it just made")
            val self = pushed.registerC
            val shown = made.registerD
            if (self > 15 || shown > 15) throw PatchException("Twitch: drops state registers out of range")
            addInstructions(init + 2, "invoke-static {v$self, v$shown}, $DROPS->presented(Ljava/lang/Object;Ljava/lang/Object;)V")
        }

        val drops = mutableClassDefBy(DROPS)
        drops.methods.single { it.name == "claimableOf" }.addInstructionsWithLabels(0, """
            check-cast p0, ${presentation.type}
            iget-object p0, p0, ${presentation.type}->${change.name}:$dropBase
            instance-of p1, p0, ${claimable.type}
            if-nez p1, :claimable
            const/4 p0, 0x0
            :claimable
            return-object p0
        """)
        drops.methods.single { it.name == "dropInstanceId" }.addInstructions(0, """
            check-cast p0, ${claimable.type}
            iget-object p0, p0, $instanceId
            return-object p0
        """)
        drops.methods.single { it.name == "tapClaim" }.addInstructions(0, """
            check-cast p0, ${handlerInit.parameterTypes[0]}
            new-instance p2, $handler
            const p4, $case
            invoke-direct {p2, p0, p4}, $handlerInit
            new-instance p3, ${claimEvent.type}
            const/4 p4, 0x0
            check-cast p1, ${claimable.type}
            invoke-direct {p3, p1, p4}, $claimInit
            invoke-virtual {p2, p3}, $handler->invoke(Ljava/lang/Object;)Ljava/lang/Object;
            return-void
        """)
    }
}

/** Signed out with the switch on, Twitch's logged-out experiment decides for its signed-out mode. Adapted from Lurk (GPLv3). */
internal val watchSignedOutHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val experiment = classesWithStrings("variant1", "variant7", "no_nudges").uniqueContract("logged-out experiment")
        val found = experiment.methods.filter { method ->
            val code = method.implementation?.instructions?.toList() ?: return@filter false
            method.returnType == "Z" && method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                code.size > 3 && code[0].opcode == Opcode.IGET_OBJECT && code[1].opcode == Opcode.INVOKE_VIRTUAL && code[3].opcode == Opcode.IF_EQZ &&
                code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r -> r.definingClass == "Ljava/util/Map;" && r.name == "containsKey" } == true }
        }.uniqueContract("logged-out experiment getter")
        mutableClassDefBy(experiment).methods.first { it.name == found.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }.apply {
            requireLocal("logged-out experiment getter")
            val account = getInstruction<ReferenceInstruction>(0).reference as FieldReference
            val isSignedIn = getInstruction<ReferenceInstruction>(1).reference as MethodReference
            if (isSignedIn.returnType != "Z" || isSignedIn.parameterTypes.isNotEmpty())
                throw PatchException("Twitch: the logged-out experiment no longer checks the account first")
            addInstructionsWithLabels(0, """
                invoke-static {}, $APP->watchSignedOut()Z
                move-result v0
                if-eqz v0, :original
                iget-object v0, p0, $account
                invoke-virtual {v0}, $isSignedIn
                move-result v0
                if-nez v0, :original
                const/4 v0, 0x1
                return v0
            """, ExternalLabel("original", getInstruction(0)))
        }
    }
}
