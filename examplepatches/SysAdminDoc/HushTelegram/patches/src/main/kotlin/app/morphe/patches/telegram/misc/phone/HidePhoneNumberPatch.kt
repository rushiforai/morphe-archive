/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.phone

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

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
    description = "Adds a switch, off by default, that covers the digits of your own phone number wherever Telegram shows it, like the side menu, Settings and your profile.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveHidePhoneNumber()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.calls.forEach { (method, indices) -> site.replace(MutableMethod(ImmutableMethod.of(method)), indices) }
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
            invoke-static {}, $USER_CONFIG->getMaxAccountCount()I
            move-result v0
            return v0
        """)
        site.calls.forEach { (method, indices) -> site.replace(method, indices) }
        enableStatus("hidePhoneNumber")
    }
}

/** Telegram's phone [formatter] class, its [format] method, and every screen's call to it. */
internal class HidePhoneSite(val formatter: String, val format: String, val calls: List<Pair<MutableMethod, List<Int>>>) {
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
    classDefForEach { cls ->
        if (cls.methods.any { it.name == "<init>" && it.controlBody().any { i -> ((i as? ReferenceInstruction)?.reference as? StringReference)?.string == PHONE_FORMATS } }) {
            formatters += cls.type
        }
    }
    val formatter = formatters.controlSingle("phone formatter")
    val format = mutableClassDefBy(formatter).methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            it.returnType == "Ljava/lang/String;"
    }.controlSingle("phone format method").let { "${it.definingClass}->${it.name}(Ljava/lang/String;)Ljava/lang/String;" }

    val found = mutableListOf<Triple<String, String, List<Int>>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type in KEPT) return@classDefForEach
        cls.methods.forEach { method ->
            val body = method.controlBody()
            val indices = body.indices.filter { body[it].controlRef() == format }
            if (indices.isNotEmpty()) found += Triple(cls.type, signature(method), indices)
        }
    }
    controlShape(found.isNotEmpty(), "nothing formats a phone number for the screen")
    val calls = found.map { (type, wanted, indices) ->
        val method = mutableClassDefBy(type).methods.single { signature(it) == wanted }
        val body = method.controlBody()
        controlShape(indices.all { body[it].opcode == Opcode.INVOKE_VIRTUAL || body[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE },
            "$type calls the phone formatter in an unexpected way")
        method to indices
    }

    val config = classDefByOrNull(USER_CONFIG)
    controlShape(config != null && listOf("getInstance(I)$USER_CONFIG", "isClientActivated()Z", "getCurrentUser()$TL_USER", "getMaxAccountCount()I")
        .all { wanted -> config.methods.any { signature(it) == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) } },
        "Telegram's account list changed")
    controlShape(classDefByOrNull(TL_USER)?.fields?.any { it.name == "phone" && it.type == "Ljava/lang/String;" } == true,
        "a Telegram user no longer has a phone number")
    return HidePhoneSite(formatter, format, calls)
}

private fun signature(method: Method) = "${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}"
