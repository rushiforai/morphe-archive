/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.infinity.api

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

internal val getDefaultUserAgentFingerprint = Fingerprint(
    definingClass = EXTENSION_CLASS_NAME,
    name = "getDefaultUserAgent"
)

internal val getDefaultRedirectUriFingerprint = Fingerprint(
    definingClass = EXTENSION_CLASS_NAME,
    name = "getDefaultRedirectUri"
)

internal val getDefaultClientIdFingerprint = Fingerprint(
    definingClass = EXTENSION_CLASS_NAME,
    name = "getDefaultClientId"
)

internal val clientIdFingerprint = Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lml/docilealligator/infinityforreddit/utils/APIUtils;",
            name = "getId",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;"
        )
    )
)

internal val userAgentFingerprint = Fingerprint(
    // Match all Infinity Reddit User-Agent literals regardless of whether a version bump
    // or the "android:" prefix was omitted (e.g. leftover 8.3.5 strings in 8.4.0).
    // Exclude the injected defaults, which must not call their own user-agent getter.
    strings = listOf("ml.docilealligator.infinityforreddit:"),
    custom = { _, classDef -> !classDef.type.startsWith("Lapp/morphe/extension/") }
)

internal val redirectUriFingerprint = Fingerprint(
    strings = listOf("infinity://localhost"),
    // 8.3.4 moved token exchanges into obfuscated WebView/coroutine classes outside
    // the application package. Patch those as well as the authorization activities.
    // Exclude the injected defaults, which must not call their own redirect getter.
    custom = { _, classDef -> !classDef.type.startsWith("Lapp/morphe/extension/") }
)

internal val moreChildrenEndpointFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
    returnType = "Ljava/lang/Object;",
    custom = { method, _ ->
        method.annotations.any { annotation ->
            annotation.elements.any { element ->
                (element.value as? StringEncodedValue)?.value == MORE_CHILDREN_ENDPOINT
            }
        }
    }
)

internal val settingsActivityOnBackStackChangedFingerprint = Fingerprint(
    definingClass = "Lml/docilealligator/infinityforreddit/activities/SettingsActivity;",
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.CONST,
        Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.INSTANCE_OF,
        Opcode.IF_EQZ,
        Opcode.CONST,
        Opcode.INVOKE_VIRTUAL,
        Opcode.GOTO
    )
)

internal val billingClientOnServiceConnectedFingerprint = Fingerprint(
    name = "onServiceConnected",
    parameters = listOf("Landroid/content/ComponentName;", "Landroid/os/IBinder;"),
    returnType = "V",
    strings = listOf("Billing service connected")
)

// All supported layouts must identify the same single lockout method.
// The first method-call filter identifies its subscription-state setter.

// Infinity+ 8.3.4+ moved SubscriptionActivityNew Intent creation into an obfuscated static
// helper (e.g. za3.X in 8.3.4, su7.Q in 8.4.0). R8 may retain or specialize away boolean
// extra parameters between Context and Integer, so match the static void call after
// 0x10008000 and validate its (Context, Z*, Integer)V signature in custom.
internal val infinityStartSubscriptionActivityHelperFingerprint = Fingerprint(
    definingClass = "Lml/docilealligator/infinityforreddit/Infinity;",
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("account_name"),
    filters = listOf(
        literal(8),
        methodCall(parameters = listOf("I"), returnType = "V", opcode = Opcode.INVOKE_VIRTUAL),
        literal(0x10008000),
        methodCall(returnType = "V", opcode = Opcode.INVOKE_STATIC)
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode == Opcode.INVOKE_STATIC &&
                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                    val params = ref.parameterTypes.map { it.toString() }
                    ref.returnType == "V" &&
                        params.size in 2..4 &&
                        params.first() == "Landroid/content/Context;" &&
                        params.last() == "Ljava/lang/Integer;" &&
                        params.subList(1, params.size - 1).all { it == "Z" }
                } == true
        } == true
    }
)

// Infinity+ 8.3.0 introduced this SubscriptionActivityNew companion layout.
// Based on Adiker's upstream PR: https://github.com/wchill/patcheddit/pull/108
internal val infinityStartSubscriptionActivityNewFingerprint = Fingerprint(
    definingClass = "Lml/docilealligator/infinityforreddit/Infinity;",
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("account_name"),
    filters = listOf(
        literal(8),
        methodCall(parameters = listOf("I"), returnType = "V", opcode = Opcode.INVOKE_VIRTUAL),
        literal(0x10008000),
        methodCall(
            definingClass = "Lml/docilealligator/infinityforreddit/activities/SubscriptionActivityNew\$",
            parameters = listOf(
                "Landroid/content/Context;",
                "Z",
                "Z",
                "Ljava/lang/Integer;"
            ),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL
        )
    )
)

// Resolve through the lockout method, without hardcoding the obfuscated class or method.
// Verify the observable update followed by the byte-field write before injecting a guard.
internal fun subscriptionStateSetterFingerprint(reference: MethodReference) = Fingerprint(
    definingClass = reference.definingClass,
    name = reference.name,
    parameters = listOf("I"),
    returnType = "V",
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.IGET_OBJECT,
        Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.INVOKE_VIRTUAL,
        Opcode.IPUT_BYTE,
        Opcode.RETURN_VOID
    ),
    custom = { method, _ ->
        val implementation = method.implementation
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            implementation != null && implementation.registerCount in 3..16 &&
            implementation.instructions.firstOrNull().let {
                // v0 is a local overwritten by the original first instruction.
                it?.opcode == Opcode.IGET_OBJECT && (it as OneRegisterInstruction).registerA == 0
            }
    }
)
