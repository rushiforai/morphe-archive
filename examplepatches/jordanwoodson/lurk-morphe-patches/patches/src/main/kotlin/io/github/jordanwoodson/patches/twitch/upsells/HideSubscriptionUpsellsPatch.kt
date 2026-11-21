package io.github.jordanwoodson.patches.twitch.upsells

import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.shared.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.shared.settings.isEnabled
import io.github.jordanwoodson.patches.twitch.clips.hideSubscriptionInterface
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.lowParameters
import io.github.jordanwoodson.patches.shared.invoke
import io.github.jordanwoodson.patches.twitch.shared.requireFreeRegister
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import io.github.jordanwoodson.patches.twitch.tipping.ChatHeaderButtonsStateFingerprint
import io.github.jordanwoodson.patches.twitch.tipping.INTERFACE_CLASS
import io.github.jordanwoodson.patches.twitch.tipping.filterUiFlag

private const val KEY = "hide_subscription_upsells"

@Suppress("unused")
val hideSubscriptionUpsellsPatch = bytecodePatch(
    name = "Hide subscription upsells",
    description = "Hides Subscribe, Gift a Sub and Upgrade prompts (in chat, under the stream title and on channel " +
        "pages), Turbo promotions such as Try Ad-Free on your channel page, and the native Turbo signup/startup " +
        "offer. Keeps the existing subscribed indicator and legitimate account entitlements.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        twitchHermes.hideSubscriptionInterface()
        hideNativeSubscribeButtons()
        hideChatHeaderSubscriptionButtons()
        hideAccountTurboPromotion()
        TurboSignupFingerprint.twitchMatch("Turbo signup upsell").method.addInstructionsIfEnabled(KEY, "return-void")
        hideTurboStartDialog()
        hideStreamInfoSubscriptionButtons()
        // The Subscribe, Gift a Sub or Upgrade button beside Follow and notifications on another channel's page: the
        // page shows it, whatever its text, only while its state's canSubscribe is true.
        filterUiFlag(ChannelPageStateFingerprint, ", canSubscribe=", "$INTERFACE_CLASS->subscriptionUpsellVisible(Z)Z")
        hideTurboIngress()
        twitchSettings.add(SwitchSetting(KEY, "Hide subscription upsells", "Subscribe, gifting and Turbo promotions. Keeps subscribed status.", Section.INTERFACE, restart = true))
    }
}

private fun BytecodePatchContext.hideAccountTurboPromotion() {
    val method = AccountSubscriptionsSectionFingerprint.twitchMatch("account subscriptions and Turbo section").method
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.firstOrNull().toString() != "Z") {
        throw PatchException("Twitch: account Turbo section lost its promotion flag")
    }
    val instructions = method.implementation!!.instructions.toList()
    val labelId = resourceId(ResourceType.STRING, "viewer_account_menu_turbo")
    val label = instructions.indices.single { (instructions[it] as? WideLiteralInstruction)?.wideLiteral == labelId }
    val row = (label + 1 until instructions.size).filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode == Opcode.INVOKE_STATIC_RANGE && reference?.definingClass == method.definingClass &&
            reference.returnType == "V" && reference.parameterTypes.size == 8 &&
            reference.parameterTypes.take(2).map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
    }.singleOrNull() ?: throw PatchException("Twitch: account Turbo row call is ambiguous")
    // The shifted Compose flags are dead once copied into the row-call argument. Reuse that
    // source register; the original callback captures the separate flags parameter instead.
    if (instructions[row - 5].opcode != Opcode.AND_INT_LIT16 || instructions[row - 6].opcode != Opcode.SHR_INT_LIT8) {
        throw PatchException("Twitch: unexpected account Turbo row argument setup")
    }
    val scratch = (instructions[row - 5] as TwoRegisterInstruction).registerB
    if (scratch > 255) throw PatchException("Twitch: account Turbo scratch register is too large")
    // With the switch off the row call runs as before, so prove the flags register is dead there.
    method.requireNotBranchTarget(row, "account Turbo row call")
    method.requireFreeRegister(row, scratch, "account Turbo row")
    method.addInstructionsWithLabels(row, """
        ${isEnabled(KEY, "v$scratch")}
        if-eqz v$scratch, :lurk_keep_turbo_account_row
        move/from16 v$scratch, p0
        if-nez v$scratch, :lurk_skip_turbo_account_row
    """, ExternalLabel("lurk_keep_turbo_account_row", method.getInstruction(row)),
        ExternalLabel("lurk_skip_turbo_account_row", method.getInstruction(row + 1)))
}

private fun BytecodePatchContext.hideNativeSubscribeButtons() {
    val subscribe = SubscribeStateFingerprint.twitchMatch("native Subscribe UI state").method.definingClass
    val gift = GiftStateFingerprint.twitchMatch("native Gift a Sub UI state").method.definingClass
    val state = classDefBy(subscribe).superclass ?: throw PatchException("Twitch: Subscribe state has no parent")
    if (classDefBy(gift).superclass != state) throw PatchException("Twitch: Subscribe and Gift state parents differ")
    val renderers = mutableListOf<Pair<String, String>>()
    classDefForEach { type ->
        type.methods.filter { it.parameterTypes.map { parameter -> parameter.toString() } == listOf(state) && it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) }
            .forEach { renderers += type.type to it.name }
    }
    val (type, name) = renderers.singleOrNull() ?: throw PatchException("Twitch: expected one native Subscribe renderer, found ${renderers.size}")
    val method = mutableClassDefBy(type).methods.single { it.name == name && it.parameterTypes.map { it.toString() } == listOf(state) }
    Locators.record("twitch.hide_subscription_upsells.subscribe_renderer", method)
    val view = method.implementation!!.instructions.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field -> field.definingClass == type && field.type == "Landroid/view/ViewGroup;" }
    }.distinctBy { it.toString() }.singleOrNull() ?: throw PatchException("Twitch: Subscribe renderer has no unique button ViewGroup")
    // v0 holds the switch; parameters above v15 are copied from v1 up first.
    val p = method.lowParameters(0, 1, firstLocal = 1)
    method.addInstructionsIfEnabled(KEY, """
        ${p.prologue}
        instance-of v0, v${p[1]}, $subscribe
        if-nez v0, :lurk_hide_subscription_button
        instance-of v0, v${p[1]}, $gift
        if-eqz v0, :lurk_off
        :lurk_hide_subscription_button
        iget-object v0, v${p[0]}, $view
        const/16 v${p[1]}, 0x8
        ${invoke("invoke-virtual", "Landroid/view/View;->setVisibility(I)V", 0, p[1])}
        return-void
    """)
}

/**
 * The chat header's Subscribe, Gift A Sub and Upgrade buttons (beside Get Bits, right of the extensions). Twitch
 * offers Subscribe and Gift A Sub from its buttons state's subscription state, an enum, and Upgrade from its
 * canShowUpgradeButton flag. The state's constructor passes both through TwitchInterface, which with the switch on
 * gives the enum value that offers neither (SUBSCRIBED for a subscriber, DISABLED otherwise) and false. The
 * remaining buttons (Follow, Get Bits) then take the free places, and with none left Twitch hides the strip.
 */
private fun BytecodePatchContext.hideChatHeaderSubscriptionButtons() {
    filterUiFlag(ChatHeaderButtonsStateFingerprint, ", canShowUpgradeButton=", "$INTERFACE_CLASS->subscriptionUpsellVisible(Z)Z")
    val printer = ChatHeaderButtonsStateFingerprint.twitchMatch("chat header buttons state").method
    val instructions = printer.implementation!!.instructions.toList()
    val label = instructions.indices.singleOrNull {
        ((instructions[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == ", subscriptionState="
    } ?: throw PatchException("Twitch: chat header buttons state no longer prints its subscription state")
    val field = instructions.drop(label + 1).firstOrNull { it.opcode == Opcode.IGET_OBJECT }
        ?.let { (it as ReferenceInstruction).reference as FieldReference }
        ?.takeIf { it.definingClass == printer.definingClass }
        ?: throw PatchException("Twitch: chat header subscription state is not a field")
    // The extension swaps the value by constant name (Enum.valueOf), so the names must be there.
    val names = classDefBy(field.type).methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions
        ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()
    listOf("DISABLED", "SUBSCRIBED", "GIFTING_ENABLED").forEach {
        if (it !in names) throw PatchException("Twitch: chat header subscription state has no $it")
    }
    Locators.record("twitch.hide_subscription_upsells.chat_header_subscription_state", field.toString())
    val writes = mutableClassDefBy(field.definingClass).methods.filter { it.name == "<init>" }.flatMap { method ->
        method.implementation!!.instructions.withIndex().filter {
            it.value.opcode == Opcode.IPUT_OBJECT && (it.value as ReferenceInstruction).reference.toString() == field.toString()
        }.map { method to it }
    }
    val (constructor, write) = writes.singleOrNull()
        ?: throw PatchException("Twitch: expected one chat header subscription state write, found ${writes.size}")
    val register = (write.value as TwoRegisterInstruction).registerA
    if (register > 255) throw PatchException("Twitch: chat header subscription state register exceeds move-result range")
    constructor.addInstructions(write.index, """
        invoke-static/range { v$register .. v$register }, $INTERFACE_CLASS->subscriptionButtons(Ljava/lang/Enum;)Ljava/lang/Enum;
        move-result-object v$register
        check-cast v$register, ${field.type}
    """)
}

private fun BytecodePatchContext.hideTurboStartDialog() {
    val action = TurboAppStartActionFingerprint.twitchMatch("Turbo app-start dialog action").method.definingClass
    val singleton = classDefBy(action).fields.single { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == action }
    val reference = "$action->${singleton.name}:$action"
    val callers = mutableListOf<Pair<String, String>>()
    classDefForEach { type ->
        type.methods.filter { method -> method.implementation?.instructions?.any {
            it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == reference
        } == true }.forEach { callers += type.type to it.name }
    }
    val (type, name) = callers.singleOrNull() ?: throw PatchException("Twitch: expected one Turbo start dialog caller, found ${callers.size}")
    val method = mutableClassDefBy(type).methods.single { it.name == name }
    Locators.record("twitch.hide_subscription_upsells.turbo_dialog_route", method)
    val instructions = method.implementation!!.instructions.toList()
    val start = instructions.indices.single { instructions[it].opcode == Opcode.SGET_OBJECT && (instructions[it] as ReferenceInstruction).reference.toString() == reference }
    if (instructions[start + 1].opcode != Opcode.IGET_OBJECT || instructions[start + 2].opcode != Opcode.INVOKE_VIRTUAL) {
        throw PatchException("Twitch: unexpected Turbo dialog routing code")
    }
    val register = (instructions[start] as OneRegisterInstruction).registerA
    method.addInstructionsWithLabels(start, """
        ${isEnabled(KEY, "v$register")}
        if-nez v$register, :lurk_skip_turbo_dialog
    """, ExternalLabel("lurk_skip_turbo_dialog", method.getInstruction(start + 3)))
}

/**
 * The row under the stream title: Follow (or Unfollow), notifications, Gift a Sub and Subscribe (issue 92), a Compose
 * row whose buttons one builder picks. It offers Subscribe from the subscription state's isSubscriptionEnabled(), Gift
 * a Sub from its isGiftingEnabled() and Upgrade from a flag; each goes through subscriptionUpsellVisible, which turns
 * it off while the switch is on. isSubscribed() is kept, so a subscriber still gets the subscription details button
 * (which Twitch shows when there's no Upgrade button).
 */
private fun BytecodePatchContext.hideStreamInfoSubscriptionButtons() {
    val state = StreamInfoButtonsStateFingerprint.twitchMatch("stream info buttons state").method.definingClass
    val method = singleMethod("stream info buttons builder") { instruction ->
        instruction.opcode == Opcode.INVOKE_DIRECT && (instruction as ReferenceInstruction).reference.let {
            it is MethodReference && it.definingClass == state && it.name == "<init>"
        }
    }
    Locators.record("twitch.hide_subscription_upsells.stream_info_buttons", method)
    val instructions = method.implementation!!.instructions.toList()
    val flags = listOf("isSubscriptionEnabled", "isGiftingEnabled").map { name ->
        val call = instructions.indices.singleOrNull { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_VIRTUAL && reference?.name == name &&
                reference.returnType == "Z" && reference.parameterTypes.isEmpty()
        } ?: throw PatchException("Twitch: stream info buttons don't ask $name once")
        if (instructions[call + 1].opcode != Opcode.MOVE_RESULT) throw PatchException("Twitch: $name result isn't kept")
        call + 1
    }.toMutableList()
    // `upgrade = flag ? UpgradeSubButton : null`: move-result, if-eqz, then the button's sget.
    val upgrade = instructions.indices.singleOrNull { index ->
        instructions[index].opcode == Opcode.SGET_OBJECT &&
            namedClass(((instructions[index] as ReferenceInstruction).reference as FieldReference).type, "UpgradeSubButton")
    } ?: throw PatchException("Twitch: stream info buttons have no single Upgrade button")
    val test = instructions[upgrade - 1]
    val result = instructions[upgrade - 2]
    if (test.opcode != Opcode.IF_EQZ || result.opcode != Opcode.MOVE_RESULT ||
        (test as OneRegisterInstruction).registerA != (result as OneRegisterInstruction).registerA) {
        throw PatchException("Twitch: unexpected stream info Upgrade flag")
    }
    flags += upgrade - 2
    flags.sortedDescending().forEach { at ->
        val register = (instructions[at] as OneRegisterInstruction).registerA
        method.requireNotBranchTarget(at + 1, "stream info buttons flag")
        method.addInstructions(at + 1, """
            invoke-static/range { v$register .. v$register }, $INTERFACE_CLASS->subscriptionUpsellVisible(Z)Z
            move-result v$register
        """)
    }
}

/**
 * "Try Ad-Free" and "Go Ad-Free" (your own channel page, issue 92) and any other screen that reads Twitch's Turbo offer.
 * One place makes the offer's Visible(ingressType) state; with the switch on, TwitchInterface.turboIngress swaps it
 * for the hidden state the same code hands out when there's no offer, a static instance of the same family.
 */
private fun BytecodePatchContext.hideTurboIngress() {
    val visible = TurboIngressVisibleFingerprint.twitchMatch("Turbo offer Visible state").method.definingClass
    val family = classDefBy(visible).superclass ?: throw PatchException("Twitch: Turbo offer state has no parent")
    val method = singleMethod("Turbo offer") { instruction ->
        instruction.opcode == Opcode.NEW_INSTANCE && (instruction as ReferenceInstruction).reference.toString() == visible
    }
    Locators.record("twitch.hide_subscription_upsells.turbo_offer", method)
    val instructions = method.implementation!!.instructions.toList()
    fun inFamily(type: String): Boolean {
        var current = classDefByOrNull(type)
        while (current != null) {
            if (current.superclass == family) return true
            current = current.superclass?.let { classDefByOrNull(it) }
        }
        return false
    }
    val hidden = instructions.filter { it.opcode == Opcode.SGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.type != visible && it.type == it.definingClass && inFamily(it.type) }
        .distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Twitch: Turbo offer has no single hidden state")
    val init = instructions.indices.singleOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
            reference?.definingClass == visible && reference.name == "<init>"
    } ?: throw PatchException("Twitch: Turbo offer isn't constructed once")
    val register = when (val call = instructions[init]) {
        is FiveRegisterInstruction -> call.registerC
        is RegisterRangeInstruction -> call.startRegister
        else -> throw PatchException("Twitch: unexpected Turbo offer constructor call")
    }
    if (register > 255) throw PatchException("Twitch: Turbo offer register exceeds move-result range")
    bridge(INTERFACE_CLASS, "turboIngressHidden", "sget-object v0, $hidden\nreturn-object v0", locals = 1)
    // The instruction after the constructor is where the method's other offer states join (a branch target): they
    // jump past this code, so only the Visible state goes through the swap.
    method.addInstructions(init + 1, """
        invoke-static/range { v$register .. v$register }, $INTERFACE_CLASS->turboIngress(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$register
        check-cast v$register, $family
    """)
}

/** The one app method with an instruction matching [matches]. */
private fun BytecodePatchContext.singleMethod(what: String, matches: (Instruction) -> Boolean): MutableMethod {
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { type ->
        type.methods.filter { method -> method.implementation?.instructions?.any(matches) == true }
            .forEach { found += type.type to it }
    }
    val (type, method) = found.singleOrNull() ?: throw PatchException("Twitch: expected one $what, found ${found.size}")
    return mutableClassDefBy(type).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }
}

/** Whether [type] is an app class whose toString() returns [name]. */
private fun BytecodePatchContext.namedClass(type: String, name: String) =
    classDefByOrNull(type)?.methods?.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
        ?.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == name } == true
