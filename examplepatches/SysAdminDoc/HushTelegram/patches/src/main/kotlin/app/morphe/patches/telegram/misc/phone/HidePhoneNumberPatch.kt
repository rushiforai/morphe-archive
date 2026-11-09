/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.phone

import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origString
import app.morphe.util.names.origParameterTypes
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val HIDE_PHONE = "$EXTENSION_PACKAGE/misc/HidePhone;"
internal const val SHOWN = "$HIDE_PHONE->shown(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;"
internal const val PHONE_FORMATS = "PhoneFormats.dat"
internal const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
internal const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"

/** The contact cards Telegram exports and the links it opens keep the real number. */
internal val KEPT = setOf("Lorg/telegram/messenger/AndroidUtilities\$VcardItem;", "Lorg/telegram/ui/LaunchActivity;")

@Suppress("unused")
val hidePhoneNumberPatch = bytecodePatch(
    name = "Hide phone number",
    description = "Covers your own phone number with dots in Settings and your profile, which helps when you share" +
        " your screen. A second switch, Don't share my number by default, leaves the share-my-number box clear when" +
        " you add someone as a contact from their chat. Both start off. Turn them on in HushTelegram settings >" +
        " Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveHidePhoneNumber()
        requireStatusMethod("shareNumberUnticked")
        val share = resolveContactShare()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.calls.forEach { (method, indices) -> site.replace(MutableMethod(ImmutableMethod.of(method)), indices) }
        share.rehearse()
        writeStub(HIDE_PHONE, "stockFormat", 2, """
            check-cast p0, ${site.formatter}
            invoke-virtual {p0, p1}, ${site.format}
            move-result-object p0
            return-object p0
        """)
        writeStub(HIDE_PHONE, "ownPhone", 3, """
            invoke-static {p0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
            move-result-object v0
            invoke-virtual {v0}, $USER_CONFIG->isClientActivated()Z
            move-result v1
            if-eqz v1, :hush_none
            invoke-virtual {v0}, $USER_CONFIG->getCurrentUser()$TL_USER
            move-result-object v0
            if-eqz v0, :hush_none
            iget-object v0, v0, $TL_USER->phone:Ljava/lang/String;
            return-object v0
            :hush_none
            const/4 v0, 0x0
            return-object v0
        """)
        writeStub(HIDE_PHONE, "accounts", 1, """
            ${site.accounts}
            return v0
        """)
        site.calls.forEach { (method, indices) -> site.replace(method, indices) }
        share.apply(share.view)
        enableCapability("shareNumberUnticked")
        enableStatus("hidePhoneNumber")
    }
}

/**
 * Telegram's phone [formatter] class, its [format] method, every screen's call to it, and the
 * smali that leaves how many accounts to check in v0.
 */
internal class HidePhoneSite(val formatter: String, val format: String, val calls: List<Pair<MutableMethod, List<Int>>>,
                             val accounts: String) {
    /** The formatter and the number go to the extension instead, in the same registers. */
    fun replace(target: MutableMethod, indices: List<Int>) {
        for (index in indices) {
            val call = target.getInstruction(index)
            val registers = call.namedRegisters()
            target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
                "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $SHOWN"
            } else {
                "invoke-static {${registers.joinToString { "v$it" }}}, $SHOWN"
            })
        }
    }
}

/**
 * The phone formatter reads its country rules from PhoneFormats.dat when it's built, and its one
 * instance method that takes and returns a string formats a number for the screen.
 */
internal fun BytecodePatchContext.resolveHidePhoneNumber(): HidePhoneSite {
    requireStatusMethod("hidePhoneNumber")
    controlHook(HIDE_PHONE, "shown", listOf("Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/String;")
    controlHook(HIDE_PHONE, "stockFormat", listOf("Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/String;")
    controlHook(HIDE_PHONE, "ownPhone", listOf("I"), "Ljava/lang/String;")
    controlHook(HIDE_PHONE, "accounts", listOf(), "I")

    val formatters = mutableListOf<String>()
    forEachClassMentioning(Mention.string(PHONE_FORMATS)) { cls ->
        if (cls.methods.any { it.origName == "<init>" && it.controlBody().any { i -> ((i as? ReferenceInstruction)?.reference as? StringReference)?.string == PHONE_FORMATS } }) {
            formatters += cls.type
        }
    }
    val formatter = formatters.controlSingle("phone formatter")
    val format = tgMutableClassDefBy(formatter).methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.origParameterTypes == listOf("Ljava/lang/String;") &&
            it.origReturnType == "Ljava/lang/String;"
    }.controlSingle("phone format method").origString()

    val found = mutableListOf<Triple<String, String, List<Int>>>()
    forEachClassMentioning(Mention.reference(format)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origType in KEPT) return@forEachClassMentioning
        cls.methods.forEach { method ->
            val body = method.controlBody()
            val indices = body.indices.filter { body[it].controlRef() == format }
            if (indices.isNotEmpty()) found += Triple(cls.type, signature(method), indices)
        }
    }
    controlShape(found.isNotEmpty(), "nothing formats a phone number for the screen")
    val calls = found.map { (type, wanted, indices) ->
        val method = tgMutableClassDefBy(type).methods.single { signature(it) == wanted }
        val body = method.controlBody()
        controlShape(indices.all { body[it].opcode == Opcode.INVOKE_VIRTUAL || body[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE },
            "$type calls the phone formatter in an unexpected way")
        method to indices
    }

    val config = tgClassDefByOrNull(USER_CONFIG)
    fun public(wanted: String) = config?.methods?.any { signature(it) == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) } == true
    // 13.2 inlines getMaxAccountCount, so the per-account table, as long as the slot count, stands in for it.
    val slots = config?.fields?.any { it.origName == "Instance" && it.origType == "[$USER_CONFIG" &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) } == true
    val accounts = when {
        public("getMaxAccountCount()I") -> "invoke-static {}, $USER_CONFIG->getMaxAccountCount()I\nmove-result v0"
        slots -> "sget-object v0, $USER_CONFIG->Instance:[$USER_CONFIG\narray-length v0, v0"
        else -> null
    }
    controlShape(accounts != null && listOf("getInstance(I)$USER_CONFIG", "isClientActivated()Z", "getCurrentUser()$TL_USER").all(::public),
        "Telegram's account list changed")
    controlShape(tgClassDefByOrNull(TL_USER)?.fields?.any { it.origName == "phone" && it.origType == "Ljava/lang/String;" } == true,
        "a Telegram user no longer has a phone number")
    return HidePhoneSite(formatter, format, calls, accounts!!)
}

private fun signature(method: Method) = "${method.origName}${method.origDescriptor}"
