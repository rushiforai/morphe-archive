/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.infinity.api

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.reddit.customclients.infinity.InfinityCompatible
import app.morphe.patches.reddit.customclients.infinity.misc.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.spoofClientPatch
import app.morphe.util.replaceStringMatchesWithFunc
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

internal const val EXTENSION_CLASS_NAME = "Lapp/morphe/extension/infinity/APIUtils;"
internal const val FRAGMENT_CLASS_NAME = "app.morphe.extension.infinity.APIKeysPreferenceFragment"
internal const val GET_CLIENT_ID_METHOD = "$EXTENSION_CLASS_NAME->getClientId"
internal const val GET_USER_AGENT_METHOD = "$EXTENSION_CLASS_NAME->getUserAgent"
internal const val GET_REDIRECT_URI_METHOD = "$EXTENSION_CLASS_NAME->getRedirectUri"

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val ATTRIBUTION_KEY = "morphe_patcheddit_attribution"
private const val ATTRIBUTION_TEXT =
    "This app uses code from Patcheddit. To learn more, visit https://reddit.com/r/patcheddit"
private const val ATTRIBUTION_URL = "https://reddit.com/r/patcheddit"

private val disableBillingPatch = bytecodePatch(
    default = false
) {
    execute {
        if (!packageMetadata.versionName.matches(Regex("8\\.3\\.\\d+"))) {
            throw PatchException("The Spoof client patch supports Infinity+ 8.3.x only.")
        }

        // Resolve every critical method before modifying any of them. Missing or ambiguous
        // matches must fail even when the patcher is not running with --validate.
        val billingCallback = billingClientOnServiceConnectedFingerprint.matchAllOrNull()
            ?.singleOrNull()?.method
            ?: throw PatchException("Expected exactly one Infinity+ billing connection callback.")

        val subscriptionLaunchers = listOf(
            infinityStartSubscriptionActivityHelperFingerprint,
            infinityStartSubscriptionActivityNewFingerprint
        ).flatMap { it.matchAllOrNull().orEmpty() }
            .distinctBy { it.originalMethod.toString() }
        val subscriptionLauncher = subscriptionLaunchers.singleOrNull()
            ?: throw PatchException(
                "Expected exactly one supported Infinity+ subscription lockout method."
            )

        val stateSetterReference = (subscriptionLauncher.instructionMatches[1].instruction
            as ReferenceInstruction).reference as MethodReference
        val stateSetter = subscriptionStateSetterFingerprint(stateSetterReference)
            .matchAllOrNull()?.singleOrNull()?.method
            ?: throw PatchException("Unable to validate the Infinity+ subscription-state setter.")

        // Purchase-query callbacks can still request state 4 even with billing setup disabled.
        // Normalize both restrictive states to the app's startup state before the original
        // setter updates its observers AND byte field. Preserve all other state transitions.
        stateSetter.addInstructions(0, """
            const/4 v0, 0x4
            if-eq p1, v0, :subscription_unrestricted
            const/16 v0, 0x8
            if-ne p1, v0, :subscription_state_original
            :subscription_unrestricted
            const/4 p1, 0x5
            :subscription_state_original
            nop
        """)

        billingCallback.returnEarly()
        // Also suppress the forced navigation and activity-finishing event, not just state 8.
        subscriptionLauncher.method.returnEarly()
    }
}

val spoofClientPatch = spoofClientPatch { clientIdOption, redirectUriOption, userAgentOption ->
    val clientId by clientIdOption
    val redirectUri by redirectUriOption
    val userAgent by userAgentOption

    dependsOn(
        disableBillingPatch,
        sharedExtensionPatch,
        resourcePatch(default = false) {
            execute {
                document("res/xml/main_preferences.xml").use { document ->
                    val root = document.documentElement
                        ?: error("Missing root element in res/xml/main_preferences.xml")

                    require(root.tagName == "androidx.preference.PreferenceScreen" ||
                            root.tagName == "PreferenceScreen") {
                        "Unexpected settings root element: ${root.tagName}"
                    }

                    // Avoid inserting the same notice more than once.
                    val elements = document.getElementsByTagName("*")
                    for (i in 0 until elements.length) {
                        val element = elements.item(i) as? Element ?: continue
                        if (element.getAttributeNS(ANDROID_NAMESPACE, "key") == ATTRIBUTION_KEY ||
                            element.getAttribute("android:key") == ATTRIBUTION_KEY) {
                            return@use
                        }
                    }

                    val attribution = document.createElement("androidx.preference.Preference").apply {
                        setAttributeNS(ANDROID_NAMESPACE, "android:key", ATTRIBUTION_KEY)
                        setAttributeNS(ANDROID_NAMESPACE, "android:title", "Patcheddit Attribution")
                        setAttributeNS(ANDROID_NAMESPACE, "android:summary", ATTRIBUTION_TEXT)
                        setAttributeNS(ANDROID_NAMESPACE, "android:persistent", "false")
                    }

                    val intent = document.createElement("intent").apply {
                        setAttributeNS(ANDROID_NAMESPACE, "android:action", "android.intent.action.VIEW")
                        setAttributeNS(ANDROID_NAMESPACE, "android:data", ATTRIBUTION_URL)
                    }

                    attribution.appendChild(intent)
                    root.appendChild(attribution)
                }
            }
        }
    )
    compatibleWith(*InfinityCompatible)
    execute {
        getDefaultClientIdFingerprint.method.returnEarly(clientId!!)
        getDefaultRedirectUriFingerprint.method.returnEarly(redirectUri!!)
        getDefaultUserAgentFingerprint.method.returnEarly(userAgent!!)

        clientIdFingerprint.matchAll().forEach { match ->
            match.method.apply {
                replaceInstruction(
                    match.instructionMatches[0].index,
                    """
                        invoke-static {}, $GET_CLIENT_ID_METHOD()Ljava/lang/String;
                    """
                )
            }
        }

        userAgentFingerprint(packageMetadata.versionName).matchAll().forEach { match ->
            match.replaceStringMatchesWithFunc(GET_USER_AGENT_METHOD)
        }

        redirectUriFingerprint.matchAll().forEach { match ->
            match.replaceStringMatchesWithFunc(GET_REDIRECT_URI_METHOD)
        }
    }
}
