/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.composer

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * How Facebook suggests people to tag while you write, on the 577 and 580 builds.
 *
 * Every box that can tag people, the post composer's text (a subclass that only adds its own
 * bookkeeping before calling up), the comment composer's (CommentComposerEditTextView holds one),
 * captions and a story's text tool, is one AutoCompleteTextView subclass, the one whose
 * performFiltering(CharSequence, int) logs "ImplicitMentionsCommonWordsFilter: JSON Parsing
 * Exception" and whose other methods open ReqContexts named "MentionsAutoCompleteTextView". Android
 * calls performFiltering after each edit. It asks its token helper where the word at the cursor
 * starts and what the word is, then looks at the word's first character:
 *
 * - `#` asks for hashtags and `/` asks for nothing.
 * - `@` asks for people. That's the explicit mention.
 * - Anything else is what Facebook's code calls an implicit mention. The token helper hands back
 *   such a word only when it's three characters or more and starts with a capital or a digit, or
 *   four or more otherwise, and a MobileConfig list of common words (the one whose parse failure
 *   the log line above reports) is checked first. Every other word of that length asks for people
 *   too, which is the list that pops up over ordinary words.
 *
 * Right after the `@` test, before any lookup starts, the method reads one boolean of the box's
 * behaviour object (a class whose Redex original name is "MentionsAutoCompleteBehavior") and
 * returns when it's set:
 *
 *     invoke-virtual {text, start}, charAt(I)C
 *     move-result c
 *     const/16 at, 0x40
 *     if-eq c, at, :lookup
 *     iget-boolean flag, behaviour, <no lookup without @>:Z
 *     if-eqz flag, :lookup
 *     return-void
 *
 * That flag is Facebook's own switch for implicit mentions: it starts off, only the Litho text
 * input builders set it (from a prop), and nothing else reads it. The post composer's box is a
 * plain view that never sets it. The patch
 * hands its value to the extension right after the read, with the box itself (the behaviour's one
 * field typed as the box's class, filled from the box when the behaviour is built), and keeps the
 * answer in the flag's register. Words starting with `@` or `#` jump past the read and are never
 * seen, and neither is the text. Tagging people in a photo or in "Tag people" is a separate search
 * screen that never reaches this method.
 */
internal const val PATCH = "Tag suggestions only after @"

/** The log line only the mention box's performFiltering writes. */
internal const val COMMON_WORDS_FAILURE = "ImplicitMentionsCommonWordsFilter: JSON Parsing Exception"

/** The extension's answer at the gate: the flag and the box in, whether to skip the lookup out. */
internal const val SKIPS_WORD =
    "$EXTENSION_PACKAGE/composer/TagSuggestions;->skipsWordWithoutAt(ZLjava/lang/Object;)Z"

/** The code point Facebook's gate compares the word's first character with. */
private const val AT_SIGN = 0x40

/** Where the mention box turns down a word without `@`, and the registers the hook works with. */
internal data class WordGate(
    /** The `iget-boolean` reading the behaviour's flag. The hook goes right after it. */
    val flagRead: Int,
    /** The register the flag is read into, which the `if-eqz` after it tests. */
    val flag: Int,
    /** The register holding the behaviour object the flag belongs to. */
    val behaviour: Int,
    /** The flag's field. Its defining class is the behaviour's. */
    val flagField: FieldReference,
)

private val Instruction.call: MethodReference?
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The mention box's performFiltering: the framework override that holds the common-words log line. */
internal fun isMentionFiltering(method: Method): Boolean =
    method.name == "performFiltering" && method.returnType == "V" &&
        method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;", "I") &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && holdsString(method, COMMON_WORDS_FAILURE)

private fun isCharAt(instruction: Instruction): Boolean {
    val call = instruction.call ?: return false
    return instruction.opcode == Opcode.INVOKE_VIRTUAL && call.name == "charAt" && call.returnType == "C" &&
        call.parameterTypes.map { it.toString() } == listOf("I")
}

/**
 * The gate of [method], or null when it hasn't exactly one: a `charAt` whose character is compared
 * with `@` by an `if-eq`, then an `iget-boolean` whose `if-eqz` jumps where the `if-eq` jumps, and a
 * `return-void` in between. Nothing else in the method may jump to that `if-eqz`, since code arriving
 * there would pass the hook by.
 */
internal fun wordGate(method: Method): WordGate? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val flow = ControlFlow.of(method)
    val gates = code.indices.mapNotNull { gateAt(code, flow, it) }
    return gates.singleOrNull()
}

private fun gateAt(code: List<Instruction>, flow: ControlFlow, at: Int): WordGate? {
    if (at + 6 >= code.size || !isCharAt(code[at])) return null
    val result = code[at + 1]
    if (result.opcode != Opcode.MOVE_RESULT) return null
    val character = (result as OneRegisterInstruction).registerA

    val literal = code[at + 2]
    if (literal.opcode !in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)) return null
    if ((literal as NarrowLiteralInstruction).narrowLiteral != AT_SIGN) return null
    val atSign = (literal as OneRegisterInstruction).registerA

    val compare = code[at + 3]
    if (compare.opcode != Opcode.IF_EQ) return null
    val compared = setOf((compare as TwoRegisterInstruction).registerA, compare.registerB)
    if (compared != setOf(character, atSign)) return null

    val read = code[at + 4]
    if (read.opcode != Opcode.IGET_BOOLEAN) return null
    val flag = (read as TwoRegisterInstruction).registerA
    val behaviour = read.registerB
    val field = (read as ReferenceInstruction).reference as FieldReference

    val skip = code[at + 5]
    if (skip.opcode != Opcode.IF_EQZ || (skip as OneRegisterInstruction).registerA != flag) return null
    if (code[at + 6].opcode != Opcode.RETURN_VOID) return null

    // Both branches land on the same lookup, so the flag only matters for a word without `@`.
    val lookup = flow.normal[at + 3].firstOrNull { it != at + 4 } ?: return null
    if (flow.normal[at + 5].firstOrNull { it != at + 6 } != lookup) return null

    // Only the flag's read leads into its test.
    val skipIndex = at + 5
    val arrivals = flow.normal.indices.filter { skipIndex in flow.normal[it] || skipIndex in flow.exceptional[it] }
    if (arrivals != listOf(at + 4)) return null
    return WordGate(at + 4, flag, behaviour, field)
}

/**
 * The field of [behaviour] that holds the box itself: its one instance field typed as [box], the
 * mention box's class. Null when there isn't exactly one.
 */
internal fun boxField(behaviour: ClassDef, box: String): Field? =
    behaviour.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == box }.singleOrNull()
