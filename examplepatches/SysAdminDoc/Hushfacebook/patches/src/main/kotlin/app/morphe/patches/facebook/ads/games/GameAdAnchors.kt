/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.games

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where an Instant Game asks Facebook for an ad, on the 577, 580 and 581 builds.
 *
 * A game runs in a WebView and reaches Facebook through one JavaScript bridge. Its
 * postMessage(String, String) keeps that name, since the WebView calls it by name, and it takes each
 * message the game's SDK sends as JSON, reads its "type" and hands it to a handler by comparing the
 * type with string constants, among them the five ad messages below. Each handler passes the
 * message on to Facebook's game service, which fetches and shows the ad and later answers the
 * game's promise.
 *
 * The same bridge has Facebook's own way to reject a promise: a method taking the promise id, a
 * message and a code, which hands them to the call that builds the "rejectPromise" answer for the
 * game ("Unexpected exception while constructing JSONObject to be dispatched to Javascript:
 * rejectPromise" is the one string that call holds). The hook goes first in postMessage: for an ad
 * message the extension answers the promise to reject, and the bridge rejects it there and returns,
 * so the message never reaches the service.
 */
internal const val PATCH = "Block Instant Games ads"

internal const val POST_MESSAGE = "postMessage"
internal const val STRING = "Ljava/lang/String;"

/** The ad messages postMessage hands on, as GameAds.AD_MESSAGES holds them. */
internal val AD_MESSAGES = listOf(
    "getinterstitialadasync",
    "getrewardedvideoasync",
    "loadadasync",
    "loadbanneradasync",
    "showadasync",
)

/** The one string of the call that builds a rejected promise's answer for the game. */
internal const val REJECT_LOG = "Unexpected exception while constructing JSONObject to be dispatched to Javascript: rejectPromise"

/** What the rejected game reads beside the code, as GameAds.NO_AD holds it. */
internal const val NO_AD = "No ad is available."

private const val GAME_ADS = "$EXTENSION_PACKAGE/ads/GameAds;"
internal const val HELD_PROMISE = "$GAME_ADS->heldPromise(Ljava/lang/String;)Ljava/lang/String;"
internal const val REJECTION = "$GAME_ADS->rejection(Ljava/lang/String;)Ljava/lang/String;"

private fun Method.parameters() = parameterTypes.map { it.toString() }

/** Whether [method] is the bridge's postMessage: (String, String)V, holding every ad message. */
internal fun isPostMessage(method: Method): Boolean =
    method.name == POST_MESSAGE && method.returnType == "V" && method.parameters() == listOf(STRING, STRING) &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && AD_MESSAGES.all { holdsString(method, it) }

/** Whether [method] builds the game's rejected-promise answer: (String, String, String)V holding [REJECT_LOG]. */
internal fun isRejectPromise(method: Method): Boolean =
    method.returnType == "V" && method.parameters() == listOf(STRING, STRING, STRING) && holdsString(method, REJECT_LOG)

/**
 * The method of [bridge] that rejects a promise: an instance (String, String, String)V calling one of
 * [rejects], the methods that build the answer.
 */
internal fun rejectOn(bridge: ClassDef, rejects: List<Method>): List<Method> = bridge.methods.filter { method ->
    method.returnType == "V" && method.parameters() == listOf(STRING, STRING, STRING) &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.implementation?.instructions?.any { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
            rejects.any { it.definingClass == call.definingClass && it.name == call.name && it.parameters() == call.parameterTypes.map(CharSequence::toString) }
        } == true
}

/**
 * Asks [HELD_PROMISE] first thing in postMessage and, on an answer, rejects that promise through
 * [reject] with [REJECTION]'s code and returns. Uses three locals, which nothing has written yet,
 * and `this` and the message, which are still in their registers.
 */
internal fun MutableMethod.answerAdsWithNoAd(reject: Method) {
    val locals = localRegisterCount()
    // p1 goes in a four-bit register field, so it has to sit at v15 or below.
    if (locals < 3 || locals + 1 > 15) {
        throw PatchException("$PATCH: $definingClass->$name has $locals locals, the hook needs 3 to 14")
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { p1 }, $HELD_PROMISE
            move-result-object v0
            if-eqz v0, :post
            invoke-static { p1 }, $REJECTION
            move-result-object v2
            const-string v1, "$NO_AD"
            invoke-virtual { p0, v0, v1, v2 }, ${reject.definingClass}->${reject.name}($STRING$STRING$STRING)V
            return-void
        """,
        ExternalLabel("post", getInstruction(0)),
    )
}
