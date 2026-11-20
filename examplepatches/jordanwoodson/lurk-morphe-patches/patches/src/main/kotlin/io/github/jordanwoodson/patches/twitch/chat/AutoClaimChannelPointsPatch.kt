package io.github.jordanwoodson.patches.twitch.chat

import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.neverDereferenced
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "chat_auto_claim"
private const val CHAT_MODE = "Ltv/twitch/android/shared/one/chat/pub/ChatModeMetadata;"

@Suppress("unused")
val autoClaimChannelPointsPatch = bytecodePatch(
    name = "Auto-claim channel points",
    description = "Adds a switch that claims the channel points bonus for your account as soon as its chest " +
        "appears in a channel's chat, with the same request as tapping the chest. Each bonus is claimed once. " +
        "Needs a signed-in account. Twitch only offers points and the chest for watch time it is told about, so " +
        "while Disable analytics is on, this also lets its minute-watched event through; every other analytics " +
        "event stays blocked. The claim leaves out the chat mode a tap sends, which Twitch only adds to its " +
        "analytics event. Starts off. Turn it on in Lurk settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        autoClaimBonus()
        twitchSettings.add(SwitchSetting(KEY, "Auto-claim channel points",
            "Claim the bonus chest for your account as soon as it appears in chat. Also sends the watch-time event that earns points, which Disable analytics otherwise blocks.", Section.CHAT, default = false))
    }
}

private fun BytecodePatchContext.autoClaimBonus() {
    val presenter = PointsButtonPresenterFingerprint.twitchMatch("channel points button presenter").method.definingClass
    val presenterClass = mutableClassDefBy(presenter)
    // The claim action, which the chest's tap handlers call with (claim ID, chat mode): an interface field
    // of the presenter with one (String, ChatModeMetadata) method.
    val actions = presenterClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.mapNotNull { field ->
        val type = classDefByOrNull(field.type)?.takeIf { AccessFlags.INTERFACE.isSet(it.accessFlags) } ?: return@mapNotNull null
        val claim = type.methods.singleOrNull { method ->
            method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", CHAT_MODE)
        } ?: return@mapNotNull null
        field to claim
    }
    val (actionField, claim) = actions.singleOrNull() ?: throw PatchException("Twitch: no unique channel points claim action")
    requireNullableChatMode(actionField.type, claim.name)
    Locators.record("twitch.auto_claim.action", "$presenter->${actionField.name}:${actionField.type}")
    // The bonus on offer: CommunityPointsModel.getClaim(), whose only String field is the claim ID.
    val getClaim = classDefBy(POINTS_MODEL).methods.singleOrNull { it.name == "getClaim" && it.parameterTypes.isEmpty() }
        ?: throw PatchException("Twitch: no channel points claim getter")
    val claimType = getClaim.returnType
    val claimId = classDefBy(claimType).fields.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/lang/String;"
    } ?: throw PatchException("Twitch: no unique channel points claim ID")

    // A helper on the presenter, so the action is called from Twitch's own types without reflection:
    // claim(model.getClaim().id, null) when there is a bonus and the extension says to claim it.
    val helper = "lurkAutoClaim"
    if (presenterClass.methods.any { it.name == helper }) throw PatchException("Twitch: presenter already patched")
    presenterClass.methods.add(
        ImmutableMethod(
            presenter, helper,
            listOf(ImmutableMethodParameter(presenter, null, null), ImmutableMethodParameter(POINTS_MODEL, null, null)),
            "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(4),
        ).toMutable().apply {
            addInstructions(0, """
                invoke-virtual { p1 }, $POINTS_MODEL->getClaim()$claimType
                move-result-object v0
                if-eqz v0, :lurk_done
                iget-object v0, v0, $claimType->${claimId.name}:Ljava/lang/String;
                invoke-static { v0 }, $CHAT->autoClaim(Ljava/lang/String;)Z
                move-result v1
                if-eqz v1, :lurk_done
                iget-object v1, p0, $presenter->${actionField.name}:${actionField.type}
                const/4 p1, 0x0
                invoke-interface { v1, v0, p1 }, ${actionField.type}->${claim.name}(Ljava/lang/String;$CHAT_MODE)V
                :lurk_done
                return-void
            """)
        },
    )

    // The presenter's subscriber to the points store gets every model update, including a new bonus.
    // Call the helper as the update arrives, before it goes on to the button's state machine.
    val update = pointsUpdateFingerprint(presenter).twitchMatch("channel points update").method
    val instructions = update.instructionList()
    val cast = instructions.indices.single { instructions[it].opcode == Opcode.CHECK_CAST && instructions[it].typeRef == POINTS_MODEL }
    val model = (instructions[cast] as OneRegisterInstruction).registerA
    var at = cast + 1
    if (instructions[at].methodRef?.name == "getClass") at++
    val read = instructions[at]
    if (read.opcode != Opcode.IGET_OBJECT || read.fieldRef?.definingClass != presenter) {
        throw PatchException("Twitch: unexpected channel points update")
    }
    val presenterRegister = (read as TwoRegisterInstruction).registerB
    if (model > 15 || presenterRegister > 15) throw PatchException("Twitch: channel points update registers out of range")
    update.requireNotBranchTarget(at, "channel points update")
    update.addInstructions(at,
        "invoke-static { v$presenterRegister, v$model }, $presenter->$helper($presenter$POINTS_MODEL)V")
}

/**
 * The helper claims with a null chat mode: only the chest's tap handlers know the chat's mode, and Twitch
 * uses it only for the analytics event after a successful claim, behind a null check. Fails when an
 * implementation of the claim action no longer lets it be null: R8 turns Kotlin's parameter null check
 * into a call on the parameter (getClass), and any field read or call on it would throw as well.
 */
private fun BytecodePatchContext.requireNullableChatMode(action: String, claim: String) {
    val implementations = mutableListOf<String>()
    classDefForEach { type ->
        if (action in type.interfaces) implementations += type.type
    }
    if (implementations.isEmpty()) throw PatchException("Twitch: no channel points claim implementation")
    implementations.forEach { type ->
        val method = mutableClassDefBy(type).methods.singleOrNull { it.name == claim &&
            it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", CHAT_MODE) }
            ?: throw PatchException("Twitch: $type doesn't implement the channel points claim")
        if (method.implementation == null) return@forEach
        val chatMode = method.parameterRegister(2)
        val nullable = method.neverDereferenced(chatMode) { instruction ->
            val name = instruction.opcode.name
            when (instruction) {
                is FiveRegisterInstruction -> instruction.registerCount > 0 && instruction.registerC == chatMode &&
                    instruction.opcode != Opcode.INVOKE_STATIC
                is RegisterRangeInstruction -> instruction.registerCount > 0 && instruction.startRegister == chatMode &&
                    instruction.opcode != Opcode.INVOKE_STATIC_RANGE
                is TwoRegisterInstruction -> instruction.registerB == chatMode && (name.startsWith("IGET") || name.startsWith("IPUT"))
                else -> false
            }
        }
        if (!nullable) throw PatchException("Twitch: $type requires a chat mode for channel points claims")
    }
}
