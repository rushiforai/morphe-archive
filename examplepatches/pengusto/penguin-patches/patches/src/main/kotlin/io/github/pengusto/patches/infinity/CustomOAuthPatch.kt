/* Copyright 2026 Pengusto. GPL-3.0; see LICENSE and NOTICE. */
package io.github.pengusto.patches.infinity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.net.URI

private const val app = "Lml/docilealligator/infinityforreddit/"
private const val originalRedirect = "infinity://localhost"

// Smali literals are generated only from bounded, printable validated options.
private fun quoted(value: String) = "\"" + value.replace("\\", "\\\\").replace("\"", "\\\"") + "\""

internal fun validateRedirect(value: String): String {
    require(value.length in 1..512 && value.all { it.code in 33..126 }) { "Redirect URI must be printable ASCII without spaces" }
    val uri = URI(value)
    val authority = uri.host ?: uri.rawAuthority?.takeIf { it.matches(Regex("[A-Za-z0-9_.-]+")) }
    require(!uri.isOpaque && uri.scheme != null && authority != null &&
        uri.rawUserInfo == null && uri.rawQuery == null && uri.rawFragment == null &&
        uri.scheme !in listOf("http", "https")) {
        "Use the client's registered custom-scheme redirect, without credentials, query or fragment"
    }
    return value
}

@Suppress("unused")
val customOAuthPatch = bytecodePatch(
    name = "Configure custom OAuth for Infinity+",
    description = "Use a configured Reddit OAuth client consistently through login and token exchange in Infinity+ 8.3.4, without the app subscription gate.",
    default = false,
) {
    compatibleWith(Compatibility(name = "Infinity+", packageName = "ml.docilealligator.infinityforreddit.plus",
        targets = listOf(AppTarget(version = "8.3.4"))))
    val client = stringOption(key = "client-id", default = null, title = "OAuth client ID",
        description = "Public Reddit installed-app client ID you are authorized to use. Never enter a password, client secret or login token.", required = true)
    val redirect = stringOption(key = "redirect-uri", default = null, title = "Registered redirect URI",
        description = "Exact custom-scheme redirect registered for this OAuth client. No shared-client default.", required = true)
    val agent = stringOption(key = "user-agent", default = null, title = "API user agent",
        description = "Identifying user agent for the configured client; nonempty printable ASCII.", required = true)

    dependsOn(resourcePatch {
        execute {
            patchOAuthRedirectManifest(validateRedirect(requireNotNull(redirect.value) { "Set redirect-uri" }))
        }
    })
    execute {
        require(packageMetadata.packageName == "ml.docilealligator.infinityforreddit.plus" &&
            packageMetadata.versionName == "8.3.4") { "Only the original Infinity+ 8.3.4 APK is supported" }
        val clientId = requireNotNull(client.value) { "Set client-id" }
        require(clientId.matches(Regex("[A-Za-z0-9_-]{10,128}"))) { "Invalid public OAuth client ID" }
        val redirectUri = validateRedirect(requireNotNull(redirect.value) { "Set redirect-uri" })
        val userAgent = requireNotNull(agent.value) { "Set user-agent" }
        require(userAgent.length in 1..256 && userAgent.all { it.code in 32..126 } && userAgent.isNotBlank()) {
            "Invalid API user agent"
        }

        val api = mutableClassDefBy("${app}utils/APIUtils;")
        val getId = api.methods.single { it.name == "getId" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" }
        check(getId.accessFlags and AccessFlags.NATIVE.value != 0) { "Expected original native client ID getter; do not stack OAuth patches" }
        val replacement = MutableMethod(ImmutableMethod(getId.definingClass, getId.name, getId.parameters,
            getId.returnType, getId.accessFlags and AccessFlags.NATIVE.value.inv(), getId.annotations,
            getId.hiddenApiRestrictions, ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
        replacement.addInstructions(0, "const-string v0, ${quoted(clientId)}\nreturn-object v0")
        check(api.methods.remove(getId)); api.methods.add(replacement)

        fun replaceLiterals(original: String, value: String): Int {
            val matches = Fingerprint(strings = listOf(original)).matchAll()
                .filterNot { it.method.definingClass.startsWith("Lapp/morphe/") }
            var count = 0
            for (match in matches) {
                val method = match.method
                method.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
                    val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                    if (text == original) {
                        method.replaceInstruction(index, "const-string v${(instruction as OneRegisterInstruction).registerA}, ${quoted(value)}")
                        count++
                    }
                }
            }
            return count
        }
        // Both named activities and R8 root-package token-exchange helpers must change.
        check(replaceLiterals(originalRedirect, redirectUri) == 6) { "Infinity OAuth redirect contract changed" }
        check(replaceLiterals("android:ml.docilealligator.infinityforreddit:8.3.4 (by /u/Hostilenemy)", userAgent) > 0) {
            "Infinity user-agent contract changed"
        }
        patchAuthTabRedirectScheme(redirectUri)
        disableCustomClientBillingState()

        val infinity = mutableClassDefBy("${app}Infinity;")
        val launcher = infinity.methods.single { method ->
            method.returnType == "V" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == "${app}activities/SubscriptionActivityNew;"
                } == true
        }
        launcher.addInstructions(0, "return-void")
        Fingerprint(strings = listOf("Billing service connected")).methodOrNull?.addInstructions(0, "return-void")
    }
}
