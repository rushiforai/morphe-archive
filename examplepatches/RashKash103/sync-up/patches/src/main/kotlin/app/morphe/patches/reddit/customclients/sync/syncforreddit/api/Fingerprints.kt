/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.sync.syncforreddit.api

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal val getAuthorizationStringFingerprint = Fingerprint(
    // This is evaluated after replaceStringPatch, so the modified string is used for matching.
    strings = listOf("https://www.reddit.com/api/v1/authorize.compact?client_id=Q43fSpTe8LckEg&response_type=code&state=")
)

/**
 * Anchored on whole strings rather than on fragments of them. A newer bundle loaded beside this
 * one brings its patcher's behaviour with it, and from Morphe Patcher 2.0.0 a fingerprint string
 * has to equal one of the method's strings rather than merely be contained in one. Both of these
 * are exact: "OAuthLoginHelper" is the login helper's own log tag and appears nowhere else, and
 * the token is built from "Basic " with the space it joins on. The tag is used rather than the
 * authorization url because that url is rewritten by the replaceStringPatch this patch depends
 * on, so matching on it would mean matching on the rewritten form.
 */
internal val getBearerTokenFingerprint = Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("OAuthLoginHelper")
    ),
    strings = listOf("Basic ")
)

/**
 * The user agent names the package and the version in it, so neither the whole string nor any
 * fragment of it can be written down here: this bundle is offered for the Pro and Dev packages
 * at any version as well. What is constant is how it begins, so the method is found by looking
 * for a string that starts that way, which is not matched as a fingerprint string at all and so
 * reads the same under either patcher's behaviour.
 */
internal val getUserAgentFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            (reference as? StringReference)?.string?.startsWith(USER_AGENT_PREFIX) == true
        } == true
    }
)

private const val USER_AGENT_PREFIX = "android:com.laurencedawson.reddit_sync"

internal val imgurImageAPIFingerprint = Fingerprint(
    strings = listOf("https://imgur-apiv3.p.rapidapi.com/3/image")
)

/**
 * The headers the Imgur upload is sent with, which is where the Client-ID it identifies itself
 * as lives. Anchored on the RapidAPI header names rather than on the Client-ID itself, since
 * that is the string being replaced.
 */
internal val imgurUploadHeadersFingerprint = Fingerprint(
    strings = listOf("x-rapidapi-key", "x-rapidapi-host")
)

internal val getRedirectUriFingerprint = Fingerprint(
    strings = listOf("http://redditsync/auth")
)
