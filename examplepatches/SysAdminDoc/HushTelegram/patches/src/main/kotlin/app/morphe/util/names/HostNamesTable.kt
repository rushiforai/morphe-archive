/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.util.names

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/** The extension class that answers the build's names at run time. */
const val HOST_NAMES = "Lapp/hushtelegram/extension/telegram/misc/HostNames;"

private const val EXTENSION = "Lapp/hushtelegram/extension/"

/** A class name as `Class.forName` takes it, in the package R8 renames. */
private val MESSENGER_CLASS = Regex("""org\.telegram\.messenger\.[A-Za-z_$][\w$]*""")

/**
 * Hands the extension the build's names for what it reaches by reflection. Each class name the
 * extension spells out ("org.telegram.messenger.UserConfig") becomes the build's, and
 * `HostNames.table()` answers with the build's name of every renamed member and every inlined
 * resource whose source name the extension spells out. A build that kept its names keeps the
 * extension as it is.
 *
 * @return the rows given to `HostNames.table()`, empty for a build that kept its names
 */
fun BytecodePatchContext.giveExtensionHostNames(): String {
    val table = TelegramNames.of(this)
    if (table.isIdentity) return ""

    val strings = HashSet<String>()
    val renaming = ArrayList<String>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith(EXTENSION)) return@classDefForEach
        var renames = false
        for (method in classDef.methods) {
            for (instruction in method.implementation?.instructions?.toList() ?: emptyList()) {
                val text = instruction.constString() ?: continue
                strings += text
                if (renamedClass(table, text) != null) renames = true
            }
        }
        if (renames) renaming += classDef.type
    }

    for (type in renaming) {
        for (method in tgMutableClassDefBy(type).methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for ((index, instruction) in instructions.withIndex()) {
                val renamed = instruction.constString()?.let { renamedClass(table, it) } ?: continue
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, ImmutableStringReference(renamed)))
            }
        }
    }

    val rows = hostRows(table, strings)
    val host = tgMutableClassDefByOrNull(HOST_NAMES)
        ?: throw PatchException("The extension has no $HOST_NAMES to hand Telegram ${table.version}'s names to")
    val answer = host.methods.singleOrNull {
        it.name == "table" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("$HOST_NAMES has no table() to answer with Telegram ${table.version}'s names")
    val instructions = answer.implementation?.instructions?.toList() ?: emptyList()
    val load = instructions.indexOfFirst { it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO }
    if (load < 0 || instructions.getOrNull(load + 1)?.opcode != Opcode.RETURN_OBJECT) {
        throw PatchException("$HOST_NAMES.table() no longer just answers a string")
    }
    val register = (instructions[load] as OneRegisterInstruction).registerA
    answer.replaceInstruction(load, BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, ImmutableStringReference(rows)))
    return rows
}

/** The build's rows for every renamed member and inlined resource named by one of [strings]. */
internal fun hostRows(table: TelegramNames.Table, strings: Set<String>): String {
    val out = StringBuilder()
    for ((key, overloads) in table.methodsByName.toSortedMap()) {
        val name = key.substringAfter("->")
        if (name !in strings) continue
        for ((_, member) in overloads) {
            if (member.name == name) continue
            out.append("m ").append(dotted(member.owner)).append(' ').append(name).append(' ')
                .append(member.descriptor.substringBefore(')')).append(") ").append(member.name).append('\n')
        }
    }
    for ((key, member) in table.fieldFwd.toSortedMap()) {
        val name = key.substringAfter("->")
        if (name !in strings || member.name == name) continue
        out.append("f ").append(dotted(member.owner)).append(' ').append(name).append(' ').append(member.name).append('\n')
    }
    for ((key, id) in table.resourceIds.toSortedMap()) {
        if (key.substringAfter('/') !in strings) continue
        out.append("r ").append(key.substringBefore('/')).append(' ').append(key.substringAfter('/')).append(' ')
            .append(Integer.toHexString(id)).append('\n')
    }
    return out.toString()
}

/** The build's name for a source class name the extension spells out, or null when it kept it. */
private fun renamedClass(table: TelegramNames.Table, text: String): String? {
    if (!MESSENGER_CLASS.matches(text)) return null
    val source = "L" + text.replace('.', '/') + ";"
    val build = table.type(source)
    return if (build == source) null else dotted(build)
}

private fun dotted(descriptor: String) = descriptor.removePrefix("L").removeSuffix(";").replace('/', '.')

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.constString(): String? =
    if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) {
        ((this as ReferenceInstruction).reference as? StringReference)?.string
    } else {
        null
    }
