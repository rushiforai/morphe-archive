/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * How Marketplace's feed asks for its ads, on the 577 and 580 builds.
 *
 * Marketplace is drawn by React Native. Its feed is a Relay query, and Relay's network layer in
 * Facebook's JavaScript ("RelayFBNetwork") posts every query to the graph endpoint that
 * RelayAPIConfig (FbRelayConfigModule, a kept class) hands it, through React Native's Networking
 * module. Facebook replaces that module with its own, which sends over Tigon. Its sendRequest is
 * the one method holding "FBNetworkingModule_React_Native", and it takes what JavaScript passed:
 * the method, the URL, the request id, the headers, the request data (a ReadableMap, a kept
 * interface) and the rest. For a POST it reads the text body out of the data's "string" entry and
 * builds a StringEntity from it, and further down it reads the data's "trackingName", which
 * RelayFBNetwork sets to "RelayFBNetwork_" and the query's name.
 *
 * That the body is a form with the query's variables as JSON in its "variables" field, and that the
 * tracking name names the query, is Facebook's own reading too. Its Tigon callbacks for this module
 * (FBTigonRequest$FBTigonCallbacks, kept) hand each answer to a small list of handlers that pick a
 * request by tracking name, one of them matching exactly the four Marketplace feed queries
 * RelayFBNetwork_MarketplaceHomeFeedAdsQueryRendererQuery, ...AdsPaginationQuery,
 * ...BoostedListingAdsQuery and ...BoostedListingAdsPaginationQuery, and read the request's
 * variables with Uri.getQueryParameter("variables") on the body.
 *
 * The feed's own query, MarketplaceHomeFeedQueryRendererQuery, declares shouldSkipAdRequest and
 * shouldSkipBoostedListingAdRequest among its variables on both builds (its QueryConfigs.json in
 * the APK's assets lists them, doc id 29362048826717980 on 580 and 28783574587914663 on 577). No
 * Java code names either variable, so Facebook sets them in JavaScript and they reach Java only in
 * that body. The ads-only queries are the other half: whatever the feed skips, they fetch.
 *
 * So the patch goes in right after sendRequest reads the POST body: the extension sees the body and
 * the request data, and answers the body to send. A null answer takes the module's own path for a
 * body it can't use ("Unsupported POST data type"), which ends in its catch that reports the
 * request to JavaScript as failed ("Error while preparing request"). Nothing has been built or sent
 * at that point.
 *
 * Read from 577 and 580 (2026-09-27): the module is `LX/7Wz;` on 577 and `LX/7Uw;` on 580, the
 * body lands in v3 and v6 and the data sits in v7 and v1, copied there from its parameter at the
 * start. The ads handler is `LX/Ole;` and `LX/Opy;`. None of those names is used here.
 */
internal const val PATCH = "Hide sponsored Marketplace listings"

/** Kept literal. The request context Facebook's Networking module opens for every request it sends. */
internal const val NETWORKING_TAG = "FBNetworkingModule_React_Native"

/** Kept literals. The request data's entries sendRequest reads: the text body and the tracking name. */
internal const val BODY_KEY = "string"
internal const val TRACKING_NAME = "trackingName"

internal const val SEND_REQUEST = "sendRequest"
internal const val READABLE_MAP = "Lcom/facebook/react/bridge/ReadableMap;"
internal const val READABLE_ARRAY = "Lcom/facebook/react/bridge/ReadableArray;"
internal const val STRING = "Ljava/lang/String;"

/** React Native's Networking spec: method, url, request id, headers, data, response type, incremental, timeout, credentials. */
internal val SEND_REQUEST_PARAMETERS = listOf(STRING, STRING, "D", READABLE_ARRAY, READABLE_MAP, STRING, "Z", "D", "Z")

/** The request data's position among sendRequest's parameters. */
internal const val DATA_PARAMETER = 4

internal const val GET_STRING = "$READABLE_MAP->getString(Ljava/lang/String;)Ljava/lang/String;"
internal const val STRING_ENTITY_INIT = "Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V"

/** The extension's answer to a request's body. */
internal const val REQUEST_BODY = "$EXTENSION_PACKAGE/ads/MarketplaceAdFilter;->" +
    "requestBody(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;"

/** Where sendRequest reads the POST body: the move-result it lands with, its register, and the data's. */
internal data class BodyRead(val index: Int, val body: Int, val data: Int)

private val Instruction.string: String?
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

internal val Instruction.referenceText: String?
    get() = (this as? ReferenceInstruction)?.reference?.toString()

/** Whether [instruction] can write [register], a wide write counting for both halves. */
internal fun writes(instruction: Instruction, register: Int): Boolean {
    val opcode = instruction.opcode
    if (!opcode.setsRegister() || instruction !is OneRegisterInstruction) return false
    val first = instruction.registerA
    return first == register || (opcode.setsWideRegister() && first + 1 == register)
}

/**
 * The instructions whose write of [register] can be what instruction [at] reads: walking back along
 * every path into [at], branches, switches and exception handlers included, each path stops at its
 * first write. Null when a path reaches the method's start with no write.
 */
internal fun ControlFlow.writesReaching(at: Int, register: Int): Set<Int>? {
    val into = Array(instructions.size) { mutableListOf<Int>() }
    for (from in instructions.indices) {
        normal[from].forEach { into[it] += from }
        exceptional[from].forEach { into[it] += from }
    }
    val found = mutableSetOf<Int>()
    val seen = BooleanArray(instructions.size)
    val pending = ArrayDeque(into[at])
    if (at == 0) return null
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (seen[index]) continue
        seen[index] = true
        if (writes(instructions[index], register)) {
            found += index
            continue
        }
        if (index == 0) return null
        pending += into[index]
    }
    return found
}

/** Whether every write of [register] that can reach [at] loads exactly [literal]. */
internal fun ControlFlow.loads(at: Int, register: Int, literal: String): Boolean {
    val found = writesReaching(at, register) ?: return false
    return found.isNotEmpty() && found.all { index ->
        val opcode = instructions[index].opcode
        (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) && instructions[index].string == literal
    }
}

/** The registers of a two-register ReadableMap.getString call, receiver first, or null for anything else. */
internal fun getStringCall(instruction: Instruction): Pair<Int, Int>? {
    if (instruction.opcode != Opcode.INVOKE_INTERFACE || instruction.referenceText != GET_STRING) return null
    val call = instruction as? FiveRegisterInstruction ?: return null
    return if (call.registerCount == 2) call.registerC to call.registerD else null
}

/**
 * Whether [method] is Facebook's Networking module's sendRequest: an instance method with a body,
 * named and shaped as React Native's spec has it, holding the module's request context tag and the
 * tracking name key.
 */
internal fun isSendRequest(method: Method): Boolean =
    method.name == SEND_REQUEST && method.returnType == "V" && method.implementation != null &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
        method.parameterTypes.map { it.toString() } == SEND_REQUEST_PARAMETERS &&
        holdsString(method, NETWORKING_TAG) && holdsString(method, TRACKING_NAME)

/**
 * Where [send], a sendRequest, reads the POST text body, held to the evidence the hook rests on.
 * Null when any of it is missing:
 *
 * - it builds one StringEntity from a String and its charset, and the one write of the String's
 *   register that can reach it is the result of ReadableMap.getString, right after the call, with
 *   the key "string" on every path into the call;
 * - the map it reads from is the request data: every write of that register that can reach the
 *   call copies the data parameter, and the one read of "trackingName" reads the same register;
 * - only the move-result leads to the instruction after it, so code put there runs on every path
 *   that reads the body;
 * - the body and the map are in registers an invoke can name in four bits, and not the same one.
 */
internal fun bodyRead(send: Method): BodyRead? {
    val flow = ControlFlow.of(send)
    val code = flow.instructions
    val entities = code.indices.filter { code[it].opcode == Opcode.INVOKE_DIRECT && code[it].referenceText == STRING_ENTITY_INIT }
    val entity = entities.singleOrNull() ?: return null
    val init = code[entity] as? FiveRegisterInstruction ?: return null
    if (init.registerCount != 3) return null
    val body = init.registerD

    val landed = flow.writesReaching(entity, body)?.singleOrNull() ?: return null
    if (landed == 0 || code[landed].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val (data, key) = getStringCall(code[landed - 1]) ?: return null
    if (!flow.loads(landed - 1, key, BODY_KEY)) return null
    if (body == data || body > 15 || data > 15) return null

    val parameter = send.parameterRegisterNumber(DATA_PARAMETER)
    val copies = flow.writesReaching(landed - 1, data) ?: return null
    if (copies.isEmpty() || !copies.all { index ->
            val copy = code[index]
            (copy.opcode == Opcode.MOVE_OBJECT || copy.opcode == Opcode.MOVE_OBJECT_FROM16 ||
                copy.opcode == Opcode.MOVE_OBJECT_16) && (copy as TwoRegisterInstruction).registerB == parameter
        }
    ) {
        return null
    }

    val trackingReads = code.indices.mapNotNull { index ->
        getStringCall(code[index])?.takeIf { (_, name) -> flow.loads(index, name, TRACKING_NAME) }
    }
    if (trackingReads.singleOrNull()?.first != data) return null

    val next = landed + 1
    if (next >= code.size) return null
    val into = code.indices.filter { next in flow.normal[it] || next in flow.exceptional[it] }
    if (into != listOf(landed)) return null
    return BodyRead(landed, body, data)
}
