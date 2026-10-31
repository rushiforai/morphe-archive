/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.externalbrowser

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

internal const val PAGE_EVENTS_LINK =
    "Lapp/morphe/extension/facebook/misc/PageEventsLink;->route(Ljava/lang/String;)Ljava/lang/String;"

/** The log line Facebook's link mapper writes as it starts on an address. */
internal const val URI_MAPPER_LOG = "Fb4aUriIntentMapper.getIntentForUri: %s"

private const val EVENTS_LINKS = "Page events links"

/**
 * Facebook's link mapper (585: `LX/091k;->A04(Context, Intent, FbUserSession, LX/091k, String, Z, Z, Z)Intent`),
 * the one method every getIntentForUri of Fb4aUriIntentMapper ends in, for a link tapped in the app,
 * one another app hands Facebook and the fb:// address Facebook's web view gets back from the server.
 * Its log line is a literal Facebook keeps; the class and method names are Redex names.
 */
internal object UriIntentMapperFingerprint : Fingerprint(
    returnType = "Landroid/content/Intent;",
    filters = listOf(
        string(URI_MAPPER_LOG),
    ),
)

/**
 * The mapper hands its address to the extension before anything reads it, and works on the answer
 * instead (#319). The address is the mapper's one String parameter; it's renamed in place, so the
 * register keeps a String the whole way.
 */
internal fun MutableMethod.routePageEventsLinks() {
    val address = addressRegister()
    val call = if (address > 15) "invoke-static/range { v$address .. v$address }" else "invoke-static { v$address }"
    addInstructions(
        0,
        """
            $call, $PAGE_EVENTS_LINK
            move-result-object v$address
        """,
    )
}

/** The register holding the mapper's address: its one String parameter. */
internal fun Method.addressRegister(): Int {
    val types = parameterTypes.map(CharSequence::toString)
    val address = types.indices.singleOrNull { types[it] == "Ljava/lang/String;" }
        ?: throw PatchException("$EVENTS_LINKS: $definingClass->$name takes ${types.count { it == "Ljava/lang/String;" }} String parameters, not one address.")
    val width = { type: String -> if (type == "J" || type == "D") 2 else 1 }
    val instance = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val parameterBase = implementation!!.registerCount - (types.sumOf(width) + instance)
    return parameterBase + instance + types.take(address).sumOf(width)
}
