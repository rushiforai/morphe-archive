/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.patches.threads.misc.sharelinks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SANITIZE =
    "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;"

/**
 * The parser of the server's answer to `media/<id>/permalink/`, the one request behind every link
 * Threads hands out for a post: Copy link, Share to another app, Send and the share sheet's own
 * rows. It reads the `permalink` field and stores it in a fresh response object. The method's name
 * comes from the JSON parser interface it implements, so Redex keeps it, and the two strings say
 * which of the app's many parsers this is.
 */
internal object PermalinkResponseParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("permalink"),
        string("XDTPermalinkResponse"),
    ),
)

/**
 * Takes Threads' tracking tags off the links you share.
 *
 * Threads asks its server for a post's link each time you share it, and the server answers with
 * `xmt`, a code that ties the link to you, and `slof` added to it. The link goes through the
 * extension as the app reads it from that answer, before anything stores it, so every place that
 * shares the link gets the clean one. With the switch off, paused, or before the settings are
 * ready, the extension hands the link back as it came.
 *
 * Found by reading 449 (2026-09-29): the parser stores the string into the response object's one
 * String field right after it creates the object.
 */
@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Takes Threads' tracking tags, such as xmt, off the links you share or copy. " +
        "The post a link opens stays the same.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        val method = PermalinkResponseParserFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // Tie the response to its type-name constructor argument and follow its registers until
        // an owned String store. A different allocation, owner or receiver isn't the response.
        val typeName = PermalinkResponseParserFingerprint.instructionMatches[1].index
        val typeRegister = (instructions[typeName] as OneRegisterInstruction).registerA
        val stores = mutableSetOf<Int>()
        for (created in typeName + 1 until instructions.size) {
            val allocation = instructions[created]
            if (allocation.opcode != Opcode.NEW_INSTANCE) continue
            val owner = allocation.getReference<TypeReference>()!!.type
            val constructorOwners = superclassChain(owner).toSet()
            val aliases = mutableSetOf((allocation as OneRegisterInstruction).registerA)
            val typeUnchanged = instructions.subList(typeName + 1, created + 1).none {
                val register = (it as? OneRegisterInstruction)?.registerA
                it.opcode.setsRegister() && (register == typeRegister || it.opcode.setsWideRegister() && register == typeRegister - 1)
            }
            if (!typeUnchanged) continue
            var namedResponse = false
            for (index in created + 1 until instructions.size) {
                val instruction = instructions[index]
                if (instruction is OffsetInstruction || !instruction.opcode.canContinue()) break
                if (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) {
                    val call = instruction.getReference<MethodReference>()!!
                    val registers = when (instruction) {
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                        else -> emptyList()
                    }
                    var word = 1
                    val takesTypeName = call.parameterTypes.any { parameter ->
                        val register = registers.getOrNull(word)
                        word += if (parameter == "J" || parameter == "D") 2 else 1
                        parameter == "Ljava/lang/String;" && register == typeRegister &&
                            instructions.subList(typeName + 1, index).none {
                                val register = (it as? OneRegisterInstruction)?.registerA
                                it.opcode.setsRegister() && (register == typeRegister || it.opcode.setsWideRegister() && register == typeRegister - 1)
                            }
                    }
                    if (call.name == "<init>" && call.returnType == "V" && call.definingClass in constructorOwners &&
                        registers.firstOrNull() in aliases && takesTypeName) {
                        namedResponse = true
                    }
                }
                if (namedResponse && instruction.opcode == Opcode.IPUT_OBJECT) {
                    val field = instruction.getReference<FieldReference>()!!
                    if (field.definingClass == owner && field.type == "Ljava/lang/String;" &&
                        (instruction as TwoRegisterInstruction).registerB in aliases) stores += index
                }
                if (instruction.opcode.setsRegister()) {
                    val target = (instruction as OneRegisterInstruction).registerA
                    val carriesResponse = when (instruction.opcode) {
                        Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                            (instruction as TwoRegisterInstruction).registerB in aliases
                        Opcode.CHECK_CAST -> target in aliases
                        else -> false
                    }
                    aliases.remove(target)
                    if (instruction.opcode.setsWideRegister()) aliases.remove(target + 1)
                    if (carriesResponse) aliases += target
                    if (aliases.isEmpty()) break
                }
            }
        }
        val store = stores.singleOrPatchException(
            "Sanitize sharing links: owned response String store in ${method.definingClass}->${method.name}; candidates: " +
                stores.joinToString { "$it:${instructions[it].getReference<FieldReference>()}" },
        )
        val link = (instructions[store] as TwoRegisterInstruction).registerA

        // At the store's own label, so a branch that jumped to the store runs the call too.
        method.addInstructionsAtControlFlowLabel(
            store,
            """
                invoke-static/range { v$link .. v$link }, $SANITIZE
                move-result-object v$link
            """,
        )

        enableStatus("sanitizeSharingLinks")
    }
}
