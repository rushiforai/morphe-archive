package io.github.jordanwoodson.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val DROPS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchDrops;"
private const val EVENTS = "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;"
private const val PRESENTER_BASE = "Ltv/twitch/android/core/mvp/presenter/RxPresenter;"

@Suppress("unused")
val autoClaimDropsPatch = bytecodePatch(
    name = "Auto-claim Drops",
    description = "Adds a switch that claims a Drop for your account as soon as Twitch's drops notification in a " +
        "channel shows it as claimable, by pressing that notification's Claim button for you: the same claim " +
        "request and the same \"claim\" analytics event a tap sends (Disable analytics blocks the event). Each " +
        "drop is claimed once per app start. Needs a signed-in account and the notification, which shows while " +
        "you watch a channel with Drops; drops earned elsewhere stay in your inventory. Time-based Drops " +
        "progress from the watch-time event Disable analytics blocks, so while this is on that one event still " +
        "goes; every other analytics event stays blocked. Checked against " +
        "Twitch's code on Android's runtime, not yet with a real account. Starts off. Turn it on in Lurk " +
        "settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        autoClaimDrops()
        twitchSettings.add(SwitchSetting("drops_auto_claim", "Auto-claim Drops",
            "Claim a Drop for your account as soon as the channel's drops notification shows it as claimable. " +
                "Needs a signed-in account. Also sends the watch-time event that progresses Drops, which Disable " +
                "analytics otherwise blocks.", Section.CHAT, default = false))
    }
}

private fun BytecodePatchContext.autoClaimDrops() {
    // The drops notification presenter of a channel, which loads the channel's available drops.
    val presenter = Fingerprint(
        strings = listOf("translateChannelAvailableDropsResponse", "translateAvailableDrops"),
    ).twitchMatch("drops notification presenter").classDef
    // A claimable drop: Claimable(dropObjectId=, dropInstanceId=, ...). Its instance ID is what the claim takes.
    val claimable = Fingerprint(
        name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
        strings = listOf("Claimable(dropObjectId=", ", dropInstanceId="),
    ).twitchMatch("claimable drop").method
    val instanceId = printedArgument(claimable.implementation!!.instructions.toList(), "Claimable(dropObjectId=", 3)
    // The notification's Claim button event, made from the claimable drop and the seconds it took.
    val claimEvent = Fingerprint(
        name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
        strings = listOf("Claim(claimingState=", ", secondsPassedUntilClaim="),
    ).twitchMatch("drop claim event").classDef
    val claimEventInit = claimEvent.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(claimable.definingClass, "I")
    } ?: throw PatchException("Twitch: the drop claim event no longer takes the claimable drop")
    // What the notification shows: a drop presentation, whose change is the drop (a field; its getter is inlined).
    val presentation = Fingerprint(
        name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
        strings = listOf("DropPresentation(change=", ", dropObject="),
    ).twitchMatch("drop presentation").classDef
    val dropBase = classDefBy(claimable.definingClass).superclass
    val change = presentation.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == dropBase }
        ?: throw PatchException("Twitch: the drop presentation has no single drop")

    // The presenter's handler of its view's events (the Claim button among them): a Function1 lambda made with
    // (presenter, case) and handed the view's event stream.
    val handler = viewEventHandler(presenter, claimEvent.type)
    val (handlerType, handlerCase) = handler
    Locators.record("twitch.auto_claim_drops.handler", handlerType)
    Locators.record("twitch.auto_claim_drops.handler_case", handlerCase.toString())

    // The presenter's state lambda: it shows the first drop presentation of the list, then reads its drop.
    val state = Fingerprint(
        name = "invoke", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;"),
        filters = listOf(
            checkCast(presenter.type),
            methodCall(name = "<init>", parameters = listOf(presentation.type, "Ljava/lang/String;", "Z")),
            methodCall(definingClass = PRESENTER_BASE, returnType = "V"),
        ),
    ).twitchMatch("drops notification state")
    state.method.apply {
        val init = state.instructionMatches[1].instruction as FiveRegisterInstruction
        val push = state.instructionMatches[2]
        val pushed = push.instruction as FiveRegisterInstruction
        if (push.index != state.instructionMatches[1].index + 1 || pushed.registerCount != 2 || init.registerCount != 4 ||
            pushed.registerD != init.registerC) {
            throw PatchException("Twitch: the drops notification no longer shows the state it just made")
        }
        val presenterRegister = pushed.registerC
        val presentationRegister = init.registerD
        val insert = push.index + 1
        requireNotBranchTarget(insert, "drops notification state")
        addInstructions(insert, invokeStatic("$DROPS->presented(Ljava/lang/Object;Ljava/lang/Object;)V",
            presenterRegister, presentationRegister))
    }

    bridge(DROPS, "claimableOf", """
        check-cast p0, ${presentation.type}
        iget-object p0, p0, ${presentation.type}->${change.name}:$dropBase
        instance-of v0, p0, ${claimable.definingClass}
        if-nez v0, :lurk_claimable
        const/4 p0, 0x0
        :lurk_claimable
        return-object p0
    """, locals = 1)
    bridge(DROPS, "dropInstanceId", """
        check-cast p0, ${claimable.definingClass}
        iget-object p0, p0, $instanceId
        return-object p0
    """)
    bridge(DROPS, "tapClaim", """
        new-instance v0, $handlerType
        const v1, $handlerCase
        check-cast p0, ${handler.owner}
        invoke-direct { v0, p0, v1 }, $handlerType-><init>(${handler.owner}I)V
        new-instance v1, ${claimEvent.type}
        const/4 v2, 0x0
        check-cast p1, ${claimable.definingClass}
        invoke-direct { v1, p1, v2 }, $claimEventInit
        invoke-virtual { v0, v1 }, $handlerType->invoke(Ljava/lang/Object;)Ljava/lang/Object;
        return-void
    """, locals = 3)
}

/**
 * The field a toString passes to its string builder as argument [argument] of the call whose first argument is
 * the constant [first]: `glc.y("Claimable(dropObjectId=", c, ", dropInstanceId=", d, ...)` gives d for 3.
 */
private fun printedArgument(code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>, first: String, argument: Int): String {
    val constant = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == first }
    if (constant < 0) throw PatchException("Twitch: no \"$first\"")
    val register = (code[constant] as OneRegisterInstruction).registerA
    val call = code.drop(constant + 1).firstOrNull {
        it.opcode == Opcode.INVOKE_STATIC && (it as FiveRegisterInstruction).registerC == register
    } as? FiveRegisterInstruction ?: throw PatchException("Twitch: \"$first\" isn't built in one call")
    val target = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)[argument]
    val read = code.subList(constant, code.indexOf(call as com.android.tools.smali.dexlib2.iface.instruction.Instruction))
        .lastOrNull { it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == target }
        ?: throw PatchException("Twitch: argument $argument of \"$first\" isn't a field")
    return (read as ReferenceInstruction).reference.toString()
}

/** A view-event handler lambda: its class, its case, and the owner type its constructor takes with the case. */
private data class EventHandler(val type: String, val case: Int, val owner: String)

/**
 * The presenter's view-event handler: in the method that subscribes to its view's EventDispatcher, the Function1
 * made with `new T(this, case)`. R8 merges presenters into one class (since 32.1.0 the drops one shares it), so
 * where several do that, the handler is the one whose lambda tests for the Claim event.
 */
private fun BytecodePatchContext.viewEventHandler(presenter: ClassDef, claimEvent: String): EventHandler {
    val found = presenter.methods.flatMap { method ->
        val code = method.implementation?.instructions?.toList() ?: return@flatMap emptyList()
        if (code.none { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref -> ref.definingClass == EVENTS && ref.parameterTypes.isEmpty() } == true }) {
            return@flatMap emptyList()
        }
        code.indices.mapNotNull { i ->
            val init = code[i]
            val ref = (init as? ReferenceInstruction)?.reference as? MethodReference
            val parameters = ref?.parameterTypes?.map(CharSequence::toString)
            if (init.opcode != Opcode.INVOKE_DIRECT || ref?.name != "<init>" || parameters?.size != 2 || parameters[1] != "I" ||
                parameters[0] !in listOf("Ljava/lang/Object;", presenter.type)) return@mapNotNull null
            val made = code.getOrNull(i - 2)
            val case = code.getOrNull(i - 1)
            if (made?.opcode != Opcode.NEW_INSTANCE || ((made as ReferenceInstruction).reference as TypeReference).type != ref.definingClass ||
                case !is NarrowLiteralInstruction) return@mapNotNull null
            EventHandler(ref.definingClass, case.narrowLiteral, parameters[0])
        }
    }.distinct()
    val claims = { handler: EventHandler ->
        classDefBy(handler.type).methods.any { method ->
            method.name == "invoke" && method.implementation?.instructions?.any {
                it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == claimEvent
            } == true
        }
    }
    return (found.singleOrNull() ?: found.filter(claims).singleOrNull())
        ?: throw PatchException("Twitch: no single view-event handler in the drops notification presenter")
}
