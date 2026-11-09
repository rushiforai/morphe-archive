/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.util.names

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction as rawAddInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions as rawAddInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels as rawAddInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction as rawReplaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions as rawReplaceInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import kotlin.properties.ReadOnlyProperty
import kotlin.reflect.KProperty

// The patcher's instruction editors, with every smali snippet put into the names of the build
// being patched first. The patches import these in place of InstructionExtensions' own; the
// overloads taking built instructions pass through, as those carry references a patch builds itself.

fun MutableMethod.addInstruction(smali: String) = rawAddInstruction(TelegramNames.tg(smali))

fun MutableMethod.addInstruction(index: Int, smali: String) = rawAddInstruction(index, TelegramNames.tg(smali))

fun MutableMethod.addInstruction(instruction: BuilderInstruction) = rawAddInstruction(instruction)

fun MutableMethod.addInstruction(index: Int, instruction: BuilderInstruction) = rawAddInstruction(index, instruction)

// Patcher 2.3.0 hides the index-less String overload; it appended, so this appends too.
fun MutableMethod.addInstructions(smali: String) = rawAddInstructions(implementation!!.instructions.size, TelegramNames.tg(smali))

fun MutableMethod.addInstructions(index: Int, smali: String) = rawAddInstructions(index, TelegramNames.tg(smali))

fun MutableMethod.addInstructions(instructions: List<BuilderInstruction>) = rawAddInstructions(instructions)

fun MutableMethod.addInstructions(index: Int, instructions: List<BuilderInstruction>) = rawAddInstructions(index, instructions)

fun MutableMethodImplementation.addInstructions(instructions: List<BuilderInstruction>) = rawAddInstructions(instructions)

fun MutableMethodImplementation.addInstructions(index: Int, instructions: List<BuilderInstruction>) =
    rawAddInstructions(index, instructions)

fun MutableMethod.addInstructionsWithLabels(index: Int, smali: String, vararg labels: ExternalLabel) =
    rawAddInstructionsWithLabels(index, TelegramNames.tg(smali), *labels)

fun MutableMethod.replaceInstruction(index: Int, smali: String) = rawReplaceInstruction(index, TelegramNames.tg(smali))

fun MutableMethod.replaceInstruction(index: Int, instruction: BuilderInstruction) = rawReplaceInstruction(index, instruction)

fun MutableMethod.replaceInstructions(index: Int, smali: String) = rawReplaceInstructions(index, TelegramNames.tg(smali))

fun MutableMethod.replaceInstructions(index: Int, instructions: List<BuilderInstruction>) =
    rawReplaceInstructions(index, instructions)

fun MutableMethodImplementation.replaceInstructions(index: Int, instructions: List<BuilderInstruction>) =
    rawReplaceInstructions(index, instructions)

// Class lookups by source name. A class passed in is already the build's and goes through as it is.

fun tgClassDefBy(type: String): ClassDef =
    app.morphe.patcher.patch.classDefBy(TelegramNames.current().type(type))

fun tgClassDefByOrNull(type: String): ClassDef? =
    app.morphe.patcher.patch.classDefByOrNull(TelegramNames.current().type(type))

fun tgMutableClassDefBy(type: String): MutableClass =
    app.morphe.patcher.patch.mutableClassDefBy(TelegramNames.current().type(type))

fun tgMutableClassDefBy(classDef: ClassDef): MutableClass = app.morphe.patcher.patch.mutableClassDefBy(classDef)

fun tgMutableClassDefByOrNull(type: String): MutableClass? =
    app.morphe.patcher.patch.mutableClassDefByOrNull(TelegramNames.current().type(type))

@Suppress("DEPRECATION", "UnusedReceiverParameter")
fun BytecodePatchContext.tgClassDefBy(type: String): ClassDef = classDefBy(TelegramNames.of(this).type(type))

@Suppress("DEPRECATION", "UnusedReceiverParameter")
fun BytecodePatchContext.tgClassDefByOrNull(type: String): ClassDef? = classDefByOrNull(TelegramNames.of(this).type(type))

@Suppress("DEPRECATION")
fun BytecodePatchContext.tgMutableClassDefBy(type: String): MutableClass = mutableClassDefBy(TelegramNames.of(this).type(type))

@Suppress("DEPRECATION")
fun BytecodePatchContext.tgMutableClassDefBy(classDef: ClassDef): MutableClass = mutableClassDefBy(classDef)

@Suppress("DEPRECATION")
fun BytecodePatchContext.tgMutableClassDefByOrNull(type: String): MutableClass? =
    mutableClassDefByOrNull(TelegramNames.of(this).type(type))

/**
 * A fingerprint built once per Telegram build, from a block that names the build's classes and
 * members through the table it receives (`type(...)`, `methodName(...)`, `field(...)`).
 */
class BuildFingerprint(private val factory: TelegramNames.Table.() -> Fingerprint) : ReadOnlyProperty<Any?, Fingerprint> {
    private val built = HashMap<String, Fingerprint>()

    override fun getValue(thisRef: Any?, property: KProperty<*>): Fingerprint {
        val table = TelegramNames.current()
        return synchronized(built) { built.getOrPut(table.build) { factory(table) } }
    }
}

fun tgFingerprint(build: TelegramNames.Table.() -> Fingerprint) = BuildFingerprint(build)
