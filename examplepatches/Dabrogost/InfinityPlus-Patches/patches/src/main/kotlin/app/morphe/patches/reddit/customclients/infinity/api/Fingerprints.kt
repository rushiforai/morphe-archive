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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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

internal fun userAgentFingerprint(versionName: String) = Fingerprint(
    strings = listOf("android:ml.docilealligator.infinityforreddit:$versionName (by /u/Hostilenemy)")
)

internal val redirectUriFingerprint = Fingerprint(
    strings = listOf("infinity://localhost"),
    // 8.3.4 moved token exchanges into obfuscated WebView/coroutine classes outside
    // the application package. Patch those as well as the authorization activities.
    // Exclude the injected defaults, which must not call their own redirect getter.
    custom = { _, classDef -> !classDef.type.startsWith("Lapp/morphe/extension/") }
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

// Both supported 8.3.x layouts must identify the same single lockout method.
// The first method-call filter identifies its subscription-state setter.

// Infinity+ 8.3.4: Infinity.f() no longer builds the subscription Intent itself. It checks a
// flag and then hands the Context, a boolean and the Intent flags (0x10008000) to a static
// helper that creates and starts SubscriptionActivityNew. The helper's name is obfuscated
// (za3.X in 8.3.4), so match on its signature, built only from framework types, rather than
// on its name.
internal val infinityStartSubscriptionActivityHelperFingerprint = Fingerprint(
    definingClass = "Lml/docilealligator/infinityforreddit/Infinity;",
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("account_name"),
    filters = listOf(
        literal(8),
        methodCall(parameters = listOf("I"), returnType = "V", opcode = Opcode.INVOKE_VIRTUAL),
        literal(0x10008000),
        methodCall(
            parameters = listOf(
                "Landroid/content/Context;",
                "Z",
                "Ljava/lang/Integer;"
            ),
            returnType = "V",
            opcode = Opcode.INVOKE_STATIC
        )
    )
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
