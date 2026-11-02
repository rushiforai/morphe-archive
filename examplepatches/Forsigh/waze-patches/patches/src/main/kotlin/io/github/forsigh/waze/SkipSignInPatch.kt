package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Boot straight into the map in guest mode.
 *
 * Waze's first run is a state machine (com/waze/uid/state_impl). Each screen is a state whose h()
 * method decides whether it runs: return false and the machine skips it silently. The welcome
 * carousel, the AADC age request and the two consent screens (ND4C and the privacy flow select)
 * are gated off that way, and the "default result" state - which normally reads whatever the
 * install-services controller hands it - is pinned to GUEST so the machine routes into
 * GuestLoginState without ever showing the account options.
 *
 * What stays intact: the machine itself, so every value the guest branch normally sets is still
 * set, and the settings entry point that opens this flow on demand for signing in later.
 *
 * 5.25.90.900 re-lettered several of these classes (g/w -> g/v, g/q -> g/p, bg/b -> bi/b,
 * az/a -> ba/a, b/k -> b/l). Each moved anchor carries a V2 fingerprint and resolution goes
 * through [resolveAnchor] with the older shape first, so any supported build binds precisely one
 * candidate - see AnchorOps.kt for the ordering rule.
 */

private const val INSTALL_PARAMETERS = "Lcom/waze/uid/state_impl/util/InstallParameters;"
private const val INSTALL_RESULT = "Lcom/waze/uid/state_impl/util/InstallParameters\$Result;"
private const val STATE_EVENT = "Lcom/waze/uid/e/e;"
private const val TIMESTAMP = "Lcom/waze/shared_infra/q/i;"
private const val AGE_MODE = "Lcom/waze/sharedui/profile/AgeRestrictionMode;"
private const val AGE_STATE = "Lcom/waze/b/a;"

/** 01/01/2000 00:00:00 UTC in milliseconds - what the age gate will believe. */
private const val BIRTH_DATE_MILLIS = 946_684_800_000L
private const val TRUE_SNIPPET = "const/4 p0, 0x1\n\nreturn p0\n"
private const val FALSE_SNIPPET = "const/4 p0, 0x0\n\nreturn p0\n"

/** WelcomeState.h - return false and the welcome carousel never shows. */
internal val WelcomeStateFingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/g/w;",
    name = "h",
    parameters = listOf(STATE_EVENT),
    returnType = "Z",
)

/** 5.25.90.900: WelcomeState re-lettered g/w -> g/v (same body, same constructor). */
internal val WelcomeStateV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/g/v;",
    name = "h",
    parameters = listOf(STATE_EVENT),
    returnType = "Z",
)

/** RequestUserAgeState.h - return false and the age request is skipped. */
internal val RequestUserAgeFingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/a/e;",
    name = "h",
    parameters = listOf(STATE_EVENT),
    returnType = "Z",
)

/** ND4CConsent.h - return false and the ND4C consent screen is skipped. */
internal val Nd4cConsentFingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/g/m;",
    name = "h",
    parameters = listOf(STATE_EVENT),
    returnType = "Z",
)

/** StatePrivacyFlowSelect's child state (g/q).h - return false and the privacy select is skipped. */
internal val PrivacyFlowSelectFingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/g/q;",
    name = "h",
    parameters = listOf(STATE_EVENT),
    returnType = "Z",
)

/** 5.25.90.900: the privacy select re-lettered g/q -> g/p (identical body). */
internal val PrivacyFlowSelectV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/g/p;",
    name = "h",
    parameters = listOf(STATE_EVENT),
    returnType = "Z",
)

/** CheckDefaultResultState.f - pins InstallParameters.result to GUEST right after the default write. */
internal val CheckDefaultResultFingerprint = Fingerprint(
    definingClass = "Lcom/waze/uid/state_impl/d/a;",
    name = "f",
    parameters = listOf(STATE_EVENT),
    returnType = "V",
)

/** b/k.g - the age-restriction state factory; forced to a known adult birth date. */
internal val AadcStateFactoryFingerprint = Fingerprint(
    definingClass = "Lcom/waze/b/k;",
    name = "g",
    parameters = listOf("Z", "Z", "Lcom/waze/sharedui/profile/UserProfile;", "Lcom/waze/a/ag;"),
    returnType = "Lcom/waze/b/e;",
)

/** 5.25.90.900: the factory re-lettered b/k -> b/l (4th parameter a/ag -> b/j). */
internal val AadcStateFactoryV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/b/l;",
    name = "g",
    parameters = listOf("Z", "Z", "Lcom/waze/sharedui/profile/UserProfile;", "Lcom/waze/b/j;"),
    returnType = "Lcom/waze/b/e;",
)

/** bg/b (privacy consent impl): i() = consent already approved. */
internal val ConsentApprovedFingerprint = Fingerprint(
    definingClass = "Lcom/waze/bg/b;",
    name = "i",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.25.90.900: the consent impl moved bg/b -> bi/b (same i()/j() pair). */
internal val ConsentApprovedV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/bi/b;",
    name = "i",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.26.90.901: the same impl again, bi/b -> bl/b (i() still calls isPrivacyConsentApprovedNTV). */
internal val ConsentApprovedV3Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/bl/b;",
    name = "i",
    parameters = listOf(),
    returnType = "Z",
)

/** bg/b (privacy consent impl): j() = consent bump (policy update) applies. */
internal val ConsentBumpFingerprint = Fingerprint(
    definingClass = "Lcom/waze/bg/b;",
    name = "j",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.25.90.900: consent bump moved with the impl, bg/b -> bi/b. */
internal val ConsentBumpV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/bi/b;",
    name = "j",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.26.90.901: consent bump moved with the impl, bi/b -> bl/b (j() reads GDPR_CONSENT_BUMP). */
internal val ConsentBumpV3Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/bl/b;",
    name = "j",
    parameters = listOf(),
    returnType = "Z",
)

/** az/a (ND4C consent impl): i() = feature enabled. */
internal val Nd4cEnabledFingerprint = Fingerprint(
    definingClass = "Lcom/waze/az/a;",
    name = "i",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.25.90.900: the ND4C impl moved az/a -> ba/a (the only class implementing s/a). */
internal val Nd4cEnabledV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/ba/a;",
    name = "i",
    parameters = listOf(),
    returnType = "Z",
)

/** az/a (ND4C consent impl): j() = approval still needed. */
internal val Nd4cNeedsApprovalFingerprint = Fingerprint(
    definingClass = "Lcom/waze/az/a;",
    name = "j",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.25.90.900: approval gate moved with the impl, az/a -> ba/a. */
internal val Nd4cNeedsApprovalV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/ba/a;",
    name = "j",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.26.90.901: the ND4C impl again, ba/a -> bc/a (i() reads SIGNUP_ND4C_ENABLED). */
internal val Nd4cEnabledV3Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/bc/a;",
    name = "i",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.26.90.901: j() reads ND4C_APPROVED_VER - approval still pending. */
internal val Nd4cNeedsApprovalV3Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/bc/a;",
    name = "j",
    parameters = listOf(),
    returnType = "Z",
)

/** ProfileStatus.isAgeConfirmed - the age-block controller consults it; treat as confirmed. */
internal val AgeConfirmedFingerprint = Fingerprint(
    definingClass = "Lcom/waze/sharedui/profile/ProfileStatus;",
    name = "isAgeConfirmed",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val skipSignInPatch = bytecodePatch(
    name = "Skip sign-in",
    description = "Starts as a guest, straight to the map.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    execute {
        val screensToSkip = listOf(
            "welcome carousel" to resolveAnchor(
                "welcome carousel", WelcomeStateFingerprint, WelcomeStateV2Fingerprint,
            ),
            "age request" to RequestUserAgeFingerprint.method,
            "ND4C consent" to Nd4cConsentFingerprint.method,
            "privacy flow select" to resolveAnchor(
                "privacy flow select", PrivacyFlowSelectFingerprint, PrivacyFlowSelectV2Fingerprint,
            ),
        )
        for ((label, method) in screensToSkip) {
            method.addInstructions(0, "const/4 p0, 0x0\n\nreturn p0\n")
        }
        println("skipSignInPatch: gated off ${screensToSkip.size} screens")

        val checkDefault = CheckDefaultResultFingerprint.method
        val instructions = checkDefault.implementation?.instructions?.toList()
            ?: throw PatchException("skipSignInPatch: CheckDefaultResultState.f() has no implementation")
        val sites = instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                instruction is ReferenceInstruction &&
                (instruction.reference as? FieldReference)?.let { ref ->
                    ref.definingClass == INSTALL_PARAMETERS && ref.name == "result"
                } == true
        }.map { it.index }
        if (sites.size != 1) {
            throw PatchException(
                "skipSignInPatch: expected one write of InstallParameters.result in " +
                    "CheckDefaultResultState.f(), found ${sites.size} - refusing to report the " +
                    "flow as bypassed"
            )
        }
        // Descending order not needed (single site); insert right after the original write so the
        // default value is overwritten before k() advances the machine.
        checkDefault.addInstructions(
            sites[0] + 1,
            "sget-object v0, $INSTALL_RESULT->GUEST:$INSTALL_RESULT\n\n" +
                "iput-object v0, p1, $INSTALL_PARAMETERS->result:$INSTALL_RESULT\n",
        )
        println("skipSignInPatch: default result pinned to GUEST")

        // The age gate: every consumer reads the restriction state built by the b/k.g() factory
        // (b/l.g() on 5.25.90.900). Pin that state to a known adult birth date (01/01/2000) with
        // no restriction, so neither the ask screen nor the age-block controller ever has a
        // reason to appear.
        val stateFactory = resolveAnchor(
            "age-state factory", AadcStateFactoryFingerprint, AadcStateFactoryV2Fingerprint,
        )
        val factoryInstructions = stateFactory.implementation?.instructions?.toList()
            ?: throw PatchException("skipSignInPatch: age-state factory has no implementation")
        val profileRead = factoryInstructions.withIndex().firstOrNull { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { ref ->
                    ref.definingClass == "Lcom/waze/sharedui/profile/UserProfile;" &&
                        ref.name == "getBasicInfo"
                } == true
        }?.index
            ?: throw PatchException("skipSignInPatch: age-state factory shape changed - refusing to guess")
        stateFactory.addInstructions(
            profileRead,
            "const-wide v0, 0x${BIRTH_DATE_MILLIS.toString(16).uppercase()}L\n\n" +
                "new-instance v2, $TIMESTAMP\n\n" +
                "invoke-direct {v2, v0, v1}, $TIMESTAMP-><init>(J)V\n\n" +
                "sget-object v0, $AGE_MODE->UNRESTRICTED:$AGE_MODE\n\n" +
                "new-instance v1, $AGE_STATE\n\n" +
                "invoke-direct {v1, v2, v0}, $AGE_STATE-><init>($TIMESTAMP$AGE_MODE)V\n\n" +
                "return-object v1\n",
        )

        // Consents: report approved, and never a pending bump or screen.
        resolveAnchor(
            "privacy consent approved", ConsentApprovedFingerprint, ConsentApprovedV2Fingerprint,
            ConsentApprovedV3Fingerprint,
        ).addInstructions(0, TRUE_SNIPPET)
        resolveAnchor(
            "privacy consent bump", ConsentBumpFingerprint, ConsentBumpV2Fingerprint,
            ConsentBumpV3Fingerprint,
        ).addInstructions(0, FALSE_SNIPPET)
        resolveAnchor(
            "ND4C enabled", Nd4cEnabledFingerprint, Nd4cEnabledV2Fingerprint, Nd4cEnabledV3Fingerprint,
        ).addInstructions(0, FALSE_SNIPPET)
        resolveAnchor(
            "ND4C needs approval", Nd4cNeedsApprovalFingerprint, Nd4cNeedsApprovalV2Fingerprint,
            Nd4cNeedsApprovalV3Fingerprint,
        ).addInstructions(0, FALSE_SNIPPET)
        AgeConfirmedFingerprint.method.addInstructions(0, TRUE_SNIPPET)
        println("skipSignInPatch: birth date pinned to 01/01/2000, consents auto-accepted")
    }
}
