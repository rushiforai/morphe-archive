// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.spoofclient

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.shared.Edit
import app.edbfi.patches.shared.returnString
import app.edbfi.patches.shared.rewriteStrings
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.extensions.string
import app.revanced.patcher.firstMethod
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import app.revanced.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.Base64

private const val SPOOF = "$EXTENSION/SpoofClient;"

// The app sent old.reddit.com's compact page, which now redirects to the full one; www.reddit.com serves Reddit's
// current login on the same page.
private const val AUTHORIZE_URL = "https://www.reddit.com/api/v1/authorize"

// The defaults are RedReader's public OAuth client, its registered redirect URI and the User-Agent it sends.
private const val DEFAULT_CLIENT_ID = "yH0aTnJEt6qUgGn835B4vg"
private const val DEFAULT_REDIRECT_URI = "redreader://rr_oauth_redir"
private const val DEFAULT_USER_AGENT = "org.quantumbadger.redreader/1.27"

@Suppress("unused")
val spoofClientPatch =
    bytecodePatch(
        name = "Spoof client",
        description = "Restores login and browsing by using another app's Reddit OAuth client.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(extensionPatch)

        val clientId by stringOption(
            name = "OAuth client ID",
            default = DEFAULT_CLIENT_ID,
            description =
            "The Reddit OAuth client ID of an installed app. The default is RedReader's. " +
                "Change the redirect URI and User-Agent with it.",
            required = true,
        ) { it?.matches(Regex("[A-Za-z0-9_-]+")) == true }

        val redirectUri by stringOption(
            name = "Redirect URI",
            default = DEFAULT_REDIRECT_URI,
            description = "The redirect URI registered for the client ID, without characters that need URL encoding.",
            required = true,
        ) { it?.matches(Regex("[A-Za-z][A-Za-z0-9.-]*:[A-Za-z0-9._~/:-]+")) == true }

        val userAgent by stringOption(
            name = "User-Agent",
            default = DEFAULT_USER_AGENT,
            description = "The User-Agent sent to Reddit: that of the app the client ID belongs to.",
            required = true,
        ) { it?.matches(Regex("[ -~]+")) == true && it.isNotBlank() }

        apply {
            val id = clientId!!
            val redirect = redirectUri!!

            // The authorize URL: its host and, after the app decodes its own, the client ID.
            val authorize = authorizeUrlMethod()
            val toAuthorizeUrl = authorize.rewriteStrings { if (it == APP_AUTHORIZE_URL) AUTHORIZE_URL else null }.expect(1, "authorize URL")
            val setClientId = authorize.setQueryParameter("client_id", id)

            // The redirect URI: in the authorize URL, where the login WebView catches the redirect, and in the code
            // exchange, which Reddit checks against the authorize request.
            val redirectMethods = classDefs.methodsByString[APP_REDIRECT_URI].orEmpty().toList().map { firstMethod(it) }
            val redirectEdits = redirectMethods.map { method -> method.rewriteStrings { if (it == APP_REDIRECT_URI) redirect else null } }
            val catches = redirectMethods.count { it.name == "shouldOverrideUrlLoading" }
            val exchanges = redirectMethods.count { method -> method.instructions.any { it.string == "authorization_code" } }
            // Count the literals, not the edits: a redirect URI equal to the app's own changes none of them.
            val literals = redirectMethods.sumOf { method -> method.instructions.count { it.string == APP_REDIRECT_URI } }
            if (literals != 3 || catches != 1 || exchanges != 1 || redirectMethods.none { it.definingClass == authorize.definingClass && it.name == authorize.name }) {
                throw PatchException(
                    "Expected the redirect URI once each in the authorize URL, the WebView's redirect catch and the code exchange, " +
                        "found it in ${redirectMethods.map { "${it.definingClass}->${it.name}" }}",
                )
            }

            // An installed app's client has no secret: Basic "<id>:".
            val basic = basicAuthMethod().setBasicCredentials(Base64.getEncoder().encodeToString("$id:".toByteArray()))

            // Logged out, every Reddit API request goes to oauth.reddit.com with the app-only token; see usesAppToken.
            val appTokenCheck = appTokenCheckMethod()
            if ((appTokenCheck.implementation?.registerCount ?: 0) < 1) throw PatchException("${appTokenCheck.name} has no register")
            val keepAppToken = appTokenMethod(authorize.definingClass).keepAppTokenOfThisClient()

            val returns =
                listOf(
                    userAgentMethod().returnString(userAgent!!),
                    optionMethod("clientId").returnString(id),
                    optionMethod("userAgent").returnString(userAgent!!),
                )
            val enable = extensionSwitch("SpoofClient")

            // String rewrites first: they hold indices that the inserts after them would move.
            (listOf(toAuthorizeUrl) + redirectEdits + setClientId + basic + keepAppToken + returns + enable).forEach { it.apply() }
            appTokenCheck.addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $SPOOF->usesAppToken(Landroid/net/Uri;)Z
                    move-result p0
                    return p0
                """,
            )
        }
    }

private fun Edit.expect(
    count: Int,
    what: String,
): Edit = if (this.count == count) this else throw PatchException("Expected $count $what, found ${this.count}")

/**
 * Sends [value] as the query parameter [name] of the URL the method builds: the value register of its
 * `appendQueryParameter(name, value)` call gets [value] just before the call.
 */
private fun MutableMethod.setQueryParameter(
    name: String,
    value: String,
): Edit {
    val calls =
        instructions.withIndex().filter { (index, instruction) ->
            instruction.isCall("Landroid/net/Uri\$Builder;", "appendQueryParameter") && index > 0 &&
                getInstruction<Instruction>(index - 1).let { it.string == name && (it as OneRegisterInstruction).registerA == (instruction as FiveRegisterInstruction).registerD }
        }
    val index = calls.singleOrNull()?.index ?: throw PatchException("Expected one $name parameter in ${this.name}, found ${calls.size}")
    val register = getInstruction<FiveRegisterInstruction>(index).registerE
    checkNoBranchTo(index)
    return Edit(1) { addInstructions(index, "const-string v$register, \"$value\"") }
}

/** Makes the Basic authorization the method builds, `"Basic " + base64(id:secret)`, `"Basic " + [credentials]`. */
private fun MutableMethod.setBasicCredentials(credentials: String): Edit {
    val prefix = instructions.indexOfFirst { it.string == "Basic " }
    if (prefix < 0) throw PatchException("$name holds no \"Basic \"")
    val appendPrefix = prefix + 1
    val appendCredentials = prefix + 2
    val prefixRegister = getInstruction<OneRegisterInstruction>(prefix).registerA
    if (
        !getInstruction<Instruction>(appendPrefix).isCall("Ljava/lang/StringBuilder;", "append") ||
        getInstruction<FiveRegisterInstruction>(appendPrefix).registerD != prefixRegister ||
        !getInstruction<Instruction>(appendCredentials).isCall("Ljava/lang/StringBuilder;", "append")
    ) {
        throw PatchException("$name doesn't append the credentials right after \"Basic \"")
    }
    val register = getInstruction<FiveRegisterInstruction>(appendCredentials).registerD
    checkNoBranchTo(appendCredentials)
    return Edit(1) { addInstructions(appendCredentials, "const-string v$register, \"$credentials\"") }
}

/**
 * Makes the app-only token getter get a new token when the cached one wasn't issued to this client ID, and note each
 * token it hands out; see SpoofClient.appTokenExpiry.
 */
private fun MutableMethod.keepAppTokenOfThisClient(): Edit {
    // The first long it reads is the expiry; the time comes after.
    val expiry = instructions.indexOfFirst { it.opcode == Opcode.MOVE_RESULT_WIDE }
    val readToken = expiry - 2
    if (readToken < 0 ||
        getInstruction<Instruction>(expiry - 1).let { it.opcode != Opcode.INVOKE_VIRTUAL || it.methodReference?.returnType != "J" } ||
        getInstruction<Instruction>(readToken).opcode != Opcode.MOVE_RESULT_OBJECT
    ) {
        throw PatchException("$name doesn't read the token right before its expiry")
    }
    val token = getInstruction<OneRegisterInstruction>(readToken).registerA
    val expiryRegister = getInstruction<OneRegisterInstruction>(expiry).registerA
    val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    val returnIndex = returns.singleOrNull() ?: throw PatchException("Expected one return in $name, found ${returns.size}")
    val returned = getInstruction<OneRegisterInstruction>(returnIndex).registerA
    if (listOf(token, expiryRegister + 1, returned).any { it > 15 }) throw PatchException("$name uses registers above v15")
    // The expiry's move-result-wide writes both halves of the pair; the token must survive it to reach the hook.
    if (token == expiryRegister || token == expiryRegister + 1) throw PatchException("$name reads its expiry into the token's register")
    checkNoBranchTo(expiry + 1)
    checkNoBranchTo(returnIndex)
    return Edit(2) {
        addInstructions(returnIndex, "invoke-static { v$returned }, $SPOOF->appTokenIssued(Ljava/lang/String;)V")
        addInstructions(
            expiry + 1,
            """
                invoke-static { v$token, v$expiryRegister, v${expiryRegister + 1} }, $SPOOF->appTokenExpiry(Ljava/lang/String;J)J
                move-result-wide v$expiryRegister
            """,
        )
    }
}

private fun Instruction.isCall(
    definingClass: String,
    name: String,
): Boolean {
    val reference = methodReference ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL && reference.definingClass == definingClass && reference.name == name &&
        reference.parameterTypes.all { it == "Ljava/lang/String;" }
}

/** Inserting before an instruction a branch lands on would leave the branch skipping the insert. */
private fun MutableMethod.checkNoBranchTo(index: Int) {
    if (getInstruction<BuilderInstruction>(index).location.labels.isNotEmpty()) throw PatchException("A branch lands on instruction $index of $name")
}
