/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * How Marketplace search's answers reach JavaScript, on the 577 and 580 builds.
 *
 * Marketplace search is React Native too, and its results query goes out through the same
 * sendRequest (MarketplaceRequestAnchors.kt), with no ads-only query beside it and no variable that
 * asks the server to skip the ads. The ads come back among the listings, so they're taken out of the
 * answer on its way back.
 *
 * The module's answers come back through Tigon to FBTigonRequest$FBTigonCallbacks, a kept class
 * holding a kept this$0 for the request (577 `LX/7X2;`, 580 `LX/7Uz;`). Each piece Tigon reads,
 * onBody decodes and, for a request that asked for its answer in pieces (Relay's do), turns into a
 * String with toString() and hands to React Native's static emitter of
 * "didReceiveNetworkIncrementalData" (577 `LX/6tm;->A03`, 580 `LX/6zu;->A03`). A request that
 * didn't gets the whole text at onEOM, from the StringBuilder the pieces went into, through the
 * emitter of "didReceiveNetworkData" (`A04`). Both emitters take the React context first, read off
 * the request's state object (577 `LX/7X1;`, 580 `LX/7Uy;`), and the text third.
 *
 * sendRequest builds that state with the value it read from the request data's "trackingName"
 * (or its default, "react_native"), and the constructor keeps it in one String field
 * (`A03` on both). Facebook reads the same field in the callbacks to pick the handlers of its own
 * that parse an answer by query, the Marketplace ads handler among them.
 *
 * So the hook goes in right after each text lands: it reads the tracking name off the state, hands
 * the text, the name and (for pieces) the state to the extension, and the answer replaces the text.
 * The state is the same object for every piece of one answer, which is how the extension keeps a
 * payload that's split across pieces together.
 *
 * The start of a payload waits in the extension for the piece that finishes it, so an answer in
 * pieces that ends before its last payload does would leave that text behind. onEOM reports every
 * answer complete through the emitter of "didCompleteNetworkResponse" (`A02`), with the same context
 * and request id off the state and the request's number (577 `LX/7X2;->A00`, 580 `LX/7Uz;->A00`).
 * Right before that call the extension is asked for what still waits, and anything it hands back
 * goes to the piece emitter as one last piece. None of the names above is used here.
 */

/** Kept name. The Tigon callbacks Facebook's Networking module gives each request it sends. */
internal const val CALLBACKS = "Lcom/facebook/fbreactmodules/network/FBTigonRequest\$FBTigonCallbacks;"

/** Kept literals. React Native's events for a piece of an answer's text and for all of it. */
internal const val PIECE_EVENT = "didReceiveNetworkIncrementalData"
internal const val WHOLE_EVENT = "didReceiveNetworkData"

/** Kept literal. React Native's event for the end of an answer. */
internal const val END_EVENT = "didCompleteNetworkResponse"

/** The extension's answers to a piece of text and to a whole one, and what still waits at the end. */
internal const val RESPONSE_PIECE = "$EXTENSION_PACKAGE/ads/MarketplaceAdFilter;->" +
    "responsePiece(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;"
internal const val RESPONSE_WHOLE = "$EXTENSION_PACKAGE/ads/MarketplaceAdFilter;->" +
    "responseWhole(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"
internal const val RESPONSE_END = "$EXTENSION_PACKAGE/ads/MarketplaceAdFilter;->" +
    "responseEnd(Ljava/lang/Object;)Ljava/lang/String;"

private const val TO_STRING = "Ljava/lang/Object;->toString()Ljava/lang/String;"

/**
 * The emitters' parameters after the React context: request id, text, then the rest. The piece
 * emitter's rest is the request's number and two lengths; the end emitter's is the number and one.
 */
private val PIECE_PARAMETERS = listOf(STRING, STRING, "I", "J", "J")
private val WHOLE_PARAMETERS = listOf(STRING, STRING, STRING, "I")
private val END_PARAMETERS = listOf(STRING, "I", "J")

/** The text's place among an emitter's parameters. Both put two one-register ones before it. */
private const val TEXT_PARAMETER = 2

/**
 * Where a callbacks method hands an answer's text to JavaScript: the move-result that lands the
 * text, its register, the register holding the request's state and that state's class, whether it's
 * the whole text or a piece of it, and the emitter it goes to.
 */
internal data class TextHandOff(
    val method: Method,
    val landed: Int,
    val text: Int,
    val state: Int,
    val stateType: String,
    val whole: Boolean,
    val emitter: MethodReference,
)

/**
 * Where a callbacks method reports an answer complete: the emitter call, the registers holding the
 * React context, the request id and the request's number it's given, and the register holding the
 * request's state.
 */
internal data class AnswerEnd(
    val method: Method,
    val call: Int,
    val context: Int,
    val id: Int,
    val number: Int,
    val state: Int,
    val emitter: MethodReference,
)

/**
 * Every place in [callbacks] where an answer's text goes to one of React Native's two text events,
 * held to the evidence the hook rests on. [emitter] finds a called method in the build. A place
 * counts when:
 *
 * - the call is static, to a method returning void that takes an object and then the piece or the
 *   whole emitter's parameters, and holds that emitter's event name;
 * - of the writes of the text's register that can reach the call, one is the move-result of a
 *   toString(), and only it leads to the instruction after it;
 * - the one write of the context's register that can reach the call reads a field of an object,
 *   the request's state, and every write of that object's register that can reach the hook reads a
 *   field of the state's type;
 * - the text and the state are in registers an invoke can name in four bits.
 */
internal fun textHandOffs(callbacks: ClassDef, emitter: (MethodReference) -> Method?): List<TextHandOff> {
    val found = mutableListOf<TextHandOff>()
    for (method in callbacks.methods) {
        if (method.implementation == null) continue
        val flow = ControlFlow.of(method)
        val code = flow.instructions
        for (call in code.indices) {
            val instruction = code[call]
            if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) continue
            val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
            val parameters = reference.parameterTypes.map { it.toString() }
            if (reference.returnType != "V" || parameters.isEmpty() || !parameters[0].startsWith("L")) continue
            val whole = when (parameters.drop(1)) {
                PIECE_PARAMETERS -> false
                WHOLE_PARAMETERS -> true
                else -> continue
            }
            val target = emitter(reference) ?: continue
            if (!holdsString(target, if (whole) WHOLE_EVENT else PIECE_EVENT)) continue

            val registers = instruction.namedRegisters()
            val context = registers[0]
            val text = registers[TEXT_PARAMETER]
            val landed = flow.writesReaching(call, text)?.filter { at ->
                at > 0 && code[at].opcode == Opcode.MOVE_RESULT_OBJECT &&
                    code[at - 1].opcode == Opcode.INVOKE_VIRTUAL && code[at - 1].referenceText == TO_STRING
            }?.singleOrNull() ?: continue
            val next = landed + 1
            if (next >= code.size) continue
            if (code.indices.filter { next in flow.normal[it] || next in flow.exceptional[it] } != listOf(landed)) continue

            val contextRead = flow.writesReaching(call, context)?.singleOrNull() ?: continue
            if (code[contextRead].opcode != Opcode.IGET_OBJECT) continue
            val stateType = ((code[contextRead] as ReferenceInstruction).reference as FieldReference).definingClass
            val state = (code[contextRead] as TwoRegisterInstruction).registerB
            val stateWrites = flow.writesReaching(next, state) ?: continue
            if (stateWrites.isEmpty() || !stateWrites.all { at ->
                    code[at].opcode == Opcode.IGET_OBJECT &&
                        ((code[at] as ReferenceInstruction).reference as FieldReference).type == stateType
                }
            ) {
                continue
            }
            if (text > 15 || state > 15 || text == state) continue
            found += TextHandOff(method, landed, text, state, stateType, whole, reference)
        }
    }
    return found
}

/**
 * Every place in [callbacks] where an answer is reported complete to JavaScript with a request's
 * state of [stateType] at hand. [emitter] finds a called method in the build. A place counts when:
 *
 * - the call is static, to a method returning void that takes an object and then a String, an int
 *   and a long, and holds [END_EVENT];
 * - the call is reached only from the instruction before it, so code put in front of it runs on
 *   every way there;
 * - the one write of the context's register that can reach the call reads a field of a
 *   [stateType], and every write of that object's register that can reach the call reads a field
 *   of that type.
 */
internal fun answerEnds(callbacks: ClassDef, stateType: String, emitter: (MethodReference) -> Method?): List<AnswerEnd> {
    val found = mutableListOf<AnswerEnd>()
    for (method in callbacks.methods) {
        if (method.implementation == null) continue
        val flow = ControlFlow.of(method)
        val code = flow.instructions
        for (call in code.indices) {
            val instruction = code[call]
            if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) continue
            val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
            val parameters = reference.parameterTypes.map { it.toString() }
            if (reference.returnType != "V" || parameters.isEmpty() || !parameters[0].startsWith("L")) continue
            if (parameters.drop(1) != END_PARAMETERS) continue
            val target = emitter(reference) ?: continue
            if (!holdsString(target, END_EVENT)) continue
            if (code.indices.filter { call in flow.normal[it] || call in flow.exceptional[it] } != listOf(call - 1)) continue

            val registers = instruction.namedRegisters()
            val contextRead = flow.writesReaching(call, registers[0])?.singleOrNull() ?: continue
            if (code[contextRead].opcode != Opcode.IGET_OBJECT) continue
            if (((code[contextRead] as ReferenceInstruction).reference as FieldReference).definingClass != stateType) continue
            val state = (code[contextRead] as TwoRegisterInstruction).registerB
            val stateWrites = flow.writesReaching(call, state) ?: continue
            if (stateWrites.isEmpty() || !stateWrites.all { at ->
                    code[at].opcode == Opcode.IGET_OBJECT &&
                        ((code[at] as ReferenceInstruction).reference as FieldReference).type == stateType
                }
            ) {
                continue
            }
            found += AnswerEnd(method, call, registers[0], registers[1], registers[2], state, reference)
        }
    }
    return found
}

/**
 * The field of [stateType] where the Networking module keeps a request's tracking name, or null.
 * [send], its sendRequest, reads the name with the one getString of "trackingName" and builds the
 * state with it: exactly one String argument of the one kind of constructor call on [stateType] can
 * come, through plain moves, from that read (the other way in is the module's default, a literal on
 * 580 and a lookup in Facebook's string table on 577). [constructor] finds that constructor in the
 * build, which must put the parameter in one String field of [stateType] and write its register
 * nowhere.
 */
internal fun trackingField(send: Method, stateType: String, constructor: (MethodReference) -> Method?): FieldReference? {
    val flow = ControlFlow.of(send)
    val code = flow.instructions
    val read = code.indices.filter { index ->
        getStringCall(code[index])?.let { (_, key) -> flow.loads(index, key, TRACKING_NAME) } == true
    }.singleOrNull() ?: return null
    val name = read + 1
    if (name >= code.size || code[name].opcode != Opcode.MOVE_RESULT_OBJECT) return null

    val passes = mutableSetOf<Pair<MethodReference, Int>>()
    for (call in code.indices) {
        val instruction = code[call]
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) continue
        val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
        if (reference.definingClass != stateType || reference.name != "<init>") continue
        val registers = instruction.namedRegisters()
        var position = 1
        reference.parameterTypes.forEachIndexed { parameter, type ->
            val register = registers.getOrNull(position)
            position += if (type.toString() == "J" || type.toString() == "D") 2 else 1
            if (register == null || type.toString() != STRING) return@forEachIndexed
            if (flow.origins(call, register)?.contains(name) == true) passes += reference to parameter
        }
    }
    val (init, parameter) = passes.singleOrNull() ?: return null
    val built = constructor(init) ?: return null
    val body = built.implementation?.instructions?.toList() ?: return null
    val register = built.parameterRegisterNumber(parameter)
    if (body.any { writes(it, register) }) return null
    val self = built.localRegisterCount()
    return body.filter { instruction ->
        instruction.opcode == Opcode.IPUT_OBJECT && (instruction as TwoRegisterInstruction).registerA == register &&
            instruction.registerB == self
    }.map { (it as ReferenceInstruction).reference as FieldReference }
        .filter { it.definingClass == stateType && it.type == STRING }
        .singleOrNull()
}

/**
 * The writes the value [register] holds at [at] comes from, followed back through plain object
 * moves. Null when a path reaches the method's start without one.
 */
private fun ControlFlow.origins(at: Int, register: Int, seen: MutableSet<Pair<Int, Int>> = mutableSetOf()): Set<Int>? {
    val found = mutableSetOf<Int>()
    for (write in writesReaching(at, register) ?: return null) {
        val instruction = instructions[write]
        if (instruction.opcode == Opcode.MOVE_OBJECT || instruction.opcode == Opcode.MOVE_OBJECT_FROM16 ||
            instruction.opcode == Opcode.MOVE_OBJECT_16
        ) {
            if (!seen.add(write to register)) continue
            found += origins(write, (instruction as TwoRegisterInstruction).registerB, seen) ?: return null
        } else {
            found += write
        }
    }
    return found
}
