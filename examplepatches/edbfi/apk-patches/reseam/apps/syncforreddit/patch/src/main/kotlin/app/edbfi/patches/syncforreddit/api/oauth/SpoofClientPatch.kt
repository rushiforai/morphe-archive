// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.api.oauth

import app.edbfi.extension.shared.oauth.bindings.OAuthRedirect
import app.edbfi.patches.shared.oauth.OAuthConfig
import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.alwaysReturn
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.stringValue
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.methods
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.replace

// Send token POSTs directly to www because following the stock host's 301 redirect can turn them into GETs.
private const val STOCK_API = "https://ssl.reddit.com/api/v1"
private const val REDDIT_API = "https://www.reddit.com/api/v1"
private const val AUTHORIZE = "/authorize.compact?"
private const val TOKEN = "/access_token"
private const val AUTHORIZE_PREFIX = STOCK_API + AUTHORIZE + "client_id="
private const val STOCK_REDIRECT = "http://redditsync/auth"
private const val WEB_SETTINGS = "android.webkit.WebSettings"

private val loginHelper = klass("Sync OAuth login helper") { sourceFile("OAuthLoginHelper.java") }

private val authorize = method("Sync Reddit authorization URL") {
    inClass(loginHelper)
    flags(AccessFlags.STATIC)
    params("android.content.Context")
    returns(Type.String)
    strings("&redirect_uri=")
}

private val authorizeClient = authorize.points("authorization client ID prefix") {
    stringContains(AUTHORIZE_PREFIX)
}.single().captureAs("prefix", Type.String)

private val loginProgress = method("Sync OAuth authorization page progress") {
    inClass(klass("Sync OAuth WebChromeClient") {
        sourceFile("OAuthLoginFragment.java")
        extends("android.webkit.WebChromeClient")
    })
    name("onProgressChanged")
    params("android.webkit.WebView", Type.Int)
    returns(Type.Void)
    strings(STOCK_API + AUTHORIZE)
}

private val loginPagePrefix = loginProgress.points("authorization page checked by the WebView") {
    string(STOCK_API + AUTHORIZE)
}.single().captureAs("prefix", Type.String)

private val redirect = method("Sync Reddit redirect URI") {
    inClass(loginHelper)
    flags(AccessFlags.STATIC)
    params()
    returns(Type.String)
    strings(STOCK_REDIRECT)
}

private val callback = method("Sync OAuth redirect predicate") {
    inClass(loginHelper)
    flags(AccessFlags.STATIC)
    params(Type.String)
    returns(Type.Boolean)
    calls(redirect)
    calls { owner("java.lang.String"); name("startsWith"); params(Type.String) }
}

private val webCallback = method("Sync login WebView callback") {
    inClass(klass("Sync OAuth WebViewClient") {
        sourceFile("OAuthLoginFragment.java")
        extends("android.webkit.WebViewClient")
    })
    name("shouldOverrideUrlLoading")
    params("android.webkit.WebView", Type.String)
    returns(Type.Boolean)
    calls(callback)
    strings("state", "code", "error")
}

private val callbackEndpoint = webCallback.points("Sync callback endpoint check") {
    calls(callback)
}.single().next { resultOf(Type.Boolean) }.captureAs("atEndpoint", Type.Boolean)

private val callbackState = webCallback.points("Sync native OAuth state comparison") {
    invokeStatic { owner(loginHelper.descriptor); params("android.content.Context", Type.String); returns(Type.Boolean) }
}.single().next { resultOf(Type.Boolean) }.captureAs("validState", Type.Boolean)

private val authHeader = method("Sync Reddit token Authorization header") {
    inClass(loginHelper)
    flags(AccessFlags.STATIC)
    params()
    returns(Type.String)
    strings("Basic ")
}

private val tokenHeaders = methods("Sync code exchange, guest token and both refresh headers") {
    name("getHeaders")
    params()
    returns("java.util.Map")
    strings("Authorization")
    calls(authHeader)
}

private val tokenBodies = methods("Sync Reddit token request forms") {
    name("getBody")
    params()
    returns("[B")
    stringsStartingWith("grant_type=")
}

private val authorizeRedirect = authorize.points("raw redirect in authorization URL") {
    calls(redirect)
}.single().next { resultOf(Type.String) }.captureAs("redirect", Type.String)

private val codeExchange = method("Sync authorization code form") {
    inClass(klass("Sync OAuth access-token request") { sourceFile("OAuthAccessTokenRequest.java") })
    name("getBody")
    params()
    returns("[B")
    strings("grant_type=authorization_code&code=", "&redirect_uri=")
    calls(redirect)
    calls { owner("java.net.URLEncoder"); name("encode"); params(Type.String) }
}

private val exchangeCode = codeExchange.points("code appended to the OAuth form") {
    invokeVirtual { owner("java.lang.StringBuilder"); name("append"); params(Type.String) }
    argument(1) { field { type(Type.String) } }
}.single().captureArgumentAs("code", 1)

private val userAgent = method("Sync Reddit User-Agent") {
    inClass(klass("Sync account singleton") {
        sourceFile("AccountSingleton.java")
        strings("Logged out")
    })
    flags(AccessFlags.STATIC)
    params()
    returns(Type.String)
    stringsStartingWith("android:com.laurencedawson.reddit_sync:")
}

private val loginWebView = method("Sync OAuth WebView setup") {
    strings("CustomInterface")
    params("android.view.View", "android.os.Bundle")
    returns(Type.Void)
    calls(authorize)
    calls { owner("android.webkit.WebView"); name("setWebViewClient") }
}

private val webSettings = loginWebView.points("OAuth WebView settings") {
    invokeVirtual { owner("android.webkit.WebView"); name("getSettings"); returns(WEB_SETTINGS) }
    then { resultOf(WEB_SETTINGS) }
}.single().captureAs("settings")

val spoofClient = patch(SyncPatchStrings.spoofClient) {
    description(SyncPatchStrings.spoofClientDescription)
    compatibleWith(syncForReddit)

    val clientId = stringOption("clientId", SyncPatchStrings.oauthClientId, SyncPatchStrings.oauthClientIdDescription)
    val redirectUri = stringOption("redirectUri", SyncPatchStrings.oauthRedirectUri, SyncPatchStrings.oauthRedirectUriDescription)
    val agent = stringOption("userAgent", SyncPatchStrings.oauthUserAgent, SyncPatchStrings.oauthUserAgentDescription)

    execute {
        val config = OAuthConfig.read(options.getOrNull(clientId), options.getOrNull(redirectUri),
            options.getOrNull(agent)) ?: return@execute

        val prefix = checkNotNull(authorizeClient.instruction.stringValue)
        check(prefix.startsWith(AUTHORIZE_PREFIX) && prefix.endsWith("&response_type=code&state=")) {
            "Unexpected Sync authorization URL prefix."
        }
        authHeader.method
        redirect.method
        callbackEndpoint.instruction
        callbackState.instruction
        authorizeRedirect.instruction
        exchangeCode.instruction
        val headers = tokenHeaders.all
        val forms = tokenBodies.all.filter { target ->
            target.method.instructions.any { instruction ->
                instruction.stringValue?.startsWith("grant_type=refresh_token&") == true ||
                    instruction.stringValue?.startsWith("grant_type=https://oauth.reddit.com/grants/installed_client&") == true
            }
        } + codeExchange
        check(headers.size == 4 && forms.size == 4 && headers.map { it.owner }.toSet() == forms.map { it.owner }.toSet()) {
            "Expected shared Sync OAuth headers for code exchange, guest and both refresh forms."
        }
        val tokenUrls = forms.map { form ->
            val constructor = method("Sync token request constructor for ${form.owner}") {
                inClass(klass(form.owner))
                name("<init>")
                strings(STOCK_API + TOKEN)
            }
            constructor.points("token endpoint in ${form.owner}") {
                string(STOCK_API + TOKEN)
            }.single().captureAs("url", Type.String).also { it.instruction }
        }
        loginPagePrefix.instruction
        userAgent.method
        webSettings.instruction

        val configuredPrefix = REDDIT_API + AUTHORIZE + "client_id=" + config.clientId + "&response_type=code&state="
        authorizeClient.after { capture("prefix").assign(string(configuredPrefix)) }
        loginPagePrefix.after { capture("prefix").assign(string(REDDIT_API + AUTHORIZE)) }
        tokenUrls.forEach { point -> point.after { capture("url").assign(string(REDDIT_API + TOKEN)) } }
        authorizeRedirect.after { capture("redirect").assign(string(config.encodedRedirect)) }
        exchangeCode.before {
            val encoded = callStatic("java.net.URLEncoder", "encode", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
                capture("code"), string("UTF-8"))
            capture("code").assign(encoded)
        }
        redirect.alwaysReturn(config.redirect)
        callback.replace { returnValue(OAuthRedirect.matchesEndpoint(param(0), string(config.redirect))) }
        callbackEndpoint.after {
            whenTrue(capture("atEndpoint")) {
                whenFalse(OAuthRedirect.validResponse(param(1), string(config.redirect))) { returnTrue() }
            }
        }
        callbackState.after {
            whenFalse(capture("validState")) { returnTrue() }
        }
        authHeader.alwaysReturn(config.basicAuthorization)
        userAgent.alwaysReturn(config.userAgent)
        webSettings.after {
            capture("settings").callVirtual(WEB_SETTINGS, "setUserAgentString", "(Ljava/lang/String;)V",
                string(config.userAgent))
        }
    }
}
