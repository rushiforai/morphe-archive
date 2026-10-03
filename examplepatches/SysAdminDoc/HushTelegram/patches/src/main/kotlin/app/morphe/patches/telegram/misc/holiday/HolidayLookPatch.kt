/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.holiday

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

private const val PATCH = "Holiday look all year"
internal const val HOLIDAY_LOOK = "$EXTENSION_PACKAGE/misc/HolidayLook;"
internal const val NEW_YEAR_HAT = "Lorg/telegram/messenger/R\$drawable;->newyear:I"
internal const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val APP_CONTEXT = "Lorg/telegram/messenger/ApplicationLoader;->applicationContext:Landroid/content/Context;"

@Suppress("unused")
val holidayLookPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch, off by default, that keeps Telegram's New Year snow falling all year over the chat list's top bar and chat backgrounds. Telegram's own holiday dates apply while it's off.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("holidayLook")
        val sites = resolveHolidayLookSites()
        sites.apply()
        enableStatus("holidayLook")
    }
}

/**
 * [check] is Telegram's holiday check, Theme.getCurrentHolidayDrawable: at most once a minute,
 * timed by [checked], it sets [snow] (snow may start by itself) for Jan 1 and loads [hat] for
 * Dec 31 and Jan 1. [load] starts the hat's load and [done] the method's one exit, which returns
 * [hat]. [readers] are the methods that read [snow]: the top bar's draw, which also draws the hat,
 * and the chat background's. The bar draws the hat only over a plain-text title, and 12.10.6's chat
 * list title is Telegram's logo, so only the snow shows there. The hat still loads Telegram's way.
 */
internal class HolidayLookSites(
    val check: MutableMethod,
    val load: Int,
    val done: Int,
    val hat: FieldReference,
    val snow: FieldReference,
    val checked: FieldReference,
    val readers: List<Method>,
)

internal fun BytecodePatchContext.resolveHolidayLookSites(): HolidayLookSites {
    requireRuntimeHook()

    // The holiday check: the one method that reads the New Year hat's drawable.
    val users = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(users) { method -> method.instructions().any { it.field()?.toString() == NEW_YEAR_HAT } }
    }
    val user = users.one("reader of the New Year hat")
    shape(AccessFlags.STATIC.isSet(user.accessFlags) && user.parameterTypes.isEmpty() && user.returnType == DRAWABLE,
        "the holiday check no longer takes nothing and returns the hat")
    val check = mutableClassDefBy(user.definingClass).methods.single { it.sameAs(user) }
    val body = check.instructions()
    val owner = check.definingClass

    // At most once a minute: the start reads the last check's time.
    shape(body.size > 3 && body[0].call()?.toString() == "Ljava/lang/System;->currentTimeMillis()J" &&
        body[1].opcode == Opcode.MOVE_RESULT_WIDE && body[2].opcode == Opcode.SGET_WIDE && body[2].field()!!.definingClass == owner,
        "the holiday check no longer starts by reading its last check's time")
    val checked = body[2].field()!!.immutable()
    shape(body.count { it.opcode == Opcode.SPUT_WIDE && it.field()?.immutable() == checked } == 1,
        "the holiday check no longer records its check's time once")
    shape(body.count { it.call()?.toString() == "Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;" } == 1 &&
        body.count { it.call()?.toString() == "Ljava/util/Calendar;->get(I)I" } >= 2, "the holiday check no longer reads the date")

    // Snow may start by itself: the one flag of its own the check sets, once each way.
    val snowWrites = body.filter { it.opcode == Opcode.SPUT_BOOLEAN }
    shape(snowWrites.size == 2 && snowWrites.map { it.field()!!.immutable() }.toSet().size == 1 && snowWrites[0].field()!!.definingClass == owner,
        "the holiday check no longer sets one snow flag")
    val snow = snowWrites[0].field()!!.immutable()

    // The hat's load: application resources, the hat's id, getDrawable, stored to the hat field.
    val read = body.indices.filter { body[it].field()?.toString() == NEW_YEAR_HAT }.one("read of the hat's id")
    val load = read - 3
    shape(load >= 0 && body[load].opcode == Opcode.SGET_OBJECT && body[load].field()?.toString() == APP_CONTEXT &&
        body[load + 1].call()?.name == "getResources" && body[load + 2].opcode == Opcode.MOVE_RESULT_OBJECT &&
        body[read + 1].call()?.let { it.name == "getDrawable" && it.parameterTypes.map(CharSequence::toString) == listOf("I") } == true &&
        body[read + 2].opcode == Opcode.MOVE_RESULT_OBJECT && body[read + 3].opcode == Opcode.SPUT_OBJECT,
        "the hat no longer loads from the app's resources into a field")
    val hat = body[read + 3].field()!!.immutable()
    shape(hat.definingClass == owner && hat.type == DRAWABLE, "the hat is no longer the holiday check's own drawable")

    // After the load, straight on to the one exit, which returns the hat.
    val exits = body.indices.filter { body[it].opcode.name.startsWith("return") }
    shape(exits.size == 1 && body[exits[0]].opcode == Opcode.RETURN_OBJECT, "the holiday check no longer has one exit")
    val done = exits[0] - 1
    shape(body[done].opcode == Opcode.SGET_OBJECT && body[done].field()?.immutable() == hat &&
        body[done].namedRegisters() == body[exits[0]].namedRegisters(), "the holiday check no longer returns the hat field")
    shape(done > read + 3 && (read + 4 until done).none { body[it] is OffsetInstruction } &&
        (read + 4 until done).all { body[it].field() == null || body[it].field()!!.definingClass == owner } &&
        ControlFlow.of(check).normal[done - 1] == listOf(done), "the hat's load no longer runs straight on to the exit")
    shape(check.implementation!!.tryBlocks.isEmpty(), "the holiday check gained a try block")

    // Who reads the snow flag: the top bar's draw, which also draws the hat, and the chat background.
    val readers = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(readers) { method -> method.instructions().any { it.opcode == Opcode.SGET_BOOLEAN && it.field()?.immutable() == snow } }
    }
    val bar = readers.filter { reader -> reader.name == "drawChild" && reader.instructions().any { it.call()?.let { call ->
        call.definingClass == owner && call.name == check.name && call.parameterTypes.isEmpty() && call.returnType == DRAWABLE } == true } }
    shape(bar.size == 1, "the top bar no longer reads the snow flag where it draws the hat")

    return HolidayLookSites(check, load, done, hat, snow, checked, readers)
}

private fun HolidayLookSites.apply() {
    val (mode, flag) = check.freeLocalsAt(PATCH, 0, 2, targets = listOf(load, done))
    shape(flag == mode + 1, "the holiday check has no free register pair at its start")
    check.addInstructionsAtControlFlowLabel(0, """
        invoke-static {}, $HOLIDAY_LOOK->mode()I
        move-result v$mode
        if-eqz v$mode, :hush_stock
        const/4 v$flag, 0x1
        if-ne v$mode, v$flag, :hush_restore
        sput-boolean v$flag, $snow
        sget-object v$mode, $hat
        if-nez v$mode, :hush_done
        goto :hush_load
        :hush_restore
        const/4 v$mode, 0x0
        sput-object v$mode, $hat
        sput-boolean v$mode, $snow
        const-wide/16 v$mode, 0x0
        sput-wide v$mode, $checked
        :hush_stock
        nop
    """.trimIndent(), ExternalLabel("hush_load", check.getInstruction(load)), ExternalLabel("hush_done", check.getInstruction(done)))
}

private fun BytecodePatchContext.requireRuntimeHook() {
    val owner = classDefByOrNull(HOLIDAY_LOOK)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public holiday look runtime")
    shape(owner!!.methods.count { it.name == "mode" && it.parameterTypes.isEmpty() && it.returnType == "I" &&
        AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
        it.implementation?.instructions?.any { instruction -> !instruction.opcode.format.isPayloadFormat } == true } == 1,
        "no callable public static runtime mode")
}

private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed holiday check geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun <T> List<T>.one(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun FieldReference.immutable() = ImmutableFieldReference(definingClass, name, type)
