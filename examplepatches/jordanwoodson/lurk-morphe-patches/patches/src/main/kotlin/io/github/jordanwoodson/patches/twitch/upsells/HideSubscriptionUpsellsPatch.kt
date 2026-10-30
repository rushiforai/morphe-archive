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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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
    description = "Hides Subscribe and Gift a Sub prompts, Turbo promotions and the native Turbo signup/startup offer. " +
        "Keeps the existing subscribed indicator and legitimate account entitlements.",
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
