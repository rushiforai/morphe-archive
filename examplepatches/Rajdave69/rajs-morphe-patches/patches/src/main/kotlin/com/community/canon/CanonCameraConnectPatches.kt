/*
 * Copyright (c) 2026 Canon Camera Connect community patch contributors.
 * SPDX-License-Identifier: GPL-3.0-only
 * Unofficial personal interoperability patch; not affiliated with Canon or Morphe.
 * Target: jp.co.canon.ic.cameraconnect 3.6.11.7 (versionCode 94).
 * This implementation requires on-device verification.
 */
package com.community.canon

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val WALKTHROUGH =
    "Ljp/co/canon/ic/cameraconnect/walkThrough/CCWalkThroughActivity;"
private const val TOP_ACTIVITY =
    "Ljp/co/canon/ic/cameraconnect/top/CCTopActivity;"
private const val LOGIN_STATUS = "Lk9/e;"
private const val CANON_RESULT = "Ljp/co/canon/ic/cameraconnect/common/n;"
private const val EXTENSION = "Lcom/community/canon/extension/OptionalCanonId;"

private val CANON_COMPATIBILITY = Compatibility(
    name = "Canon Camera Connect",
    packageName = "jp.co.canon.ic.cameraconnect",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xC8340C,
    targets = listOf(AppTarget(version = "3.6.11.7"))
)

// x(...) determines the *next walkthrough page*.
// Canon's z() closes the walkthrough only when x(...) returns 1.
// The v7 method of replacing the local account status with 2 did not
// guarantee exit: x(...) could still return a consent/onboarding state.
// Inject a separate offline-exit decision AFTER Canon has verified its EULA.
private val walkthroughDecision = Fingerprint(
    definingClass = WALKTHROUGH,
    name = "x",
    isStatic = true,
    returnType = "I",
    parameters = listOf("L", "L")
)

// CCTopActivity.O() invokes the same x(...) *before* the walkthrough
// Activity exists. Saving context only in walkthrough onCreate cannot make
// the offline preference persistent across a cold app process restart.
private val topWalkthroughDecision = Fingerprint(
    definingClass = TOP_ACTIVITY,
    name = "O",
    isStatic = false,
    returnType = "V",
    parameters = emptyList()
)

// onCreate captures a *real* Android Context before x(...) makes its decision.
// x(...) parameters are Laa/k; and Lj/g; — neither is declared Context.
private val walkthroughCreate = Fingerprint(
    definingClass = WALKTHROUGH,
    name = "onCreate",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// v(int) selects onboarding page: input state 5 inflates walkthrough_paging_view.xml.
// z/e.d(I) subtracts one before the switch: state 5 maps to case 4.
// Hook the *actual return* of v(int), after Canon has inflated the page,
// attached it and assigned original click listeners. Do not post later.
private val walkthroughRender = Fingerprint(
    definingClass = WALKTHROUGH,
    name = "v",
    isStatic = false,
    returnType = "V",
    parameters = listOf("I")
)

// Canon's original explicit sign-in handler y(Z). It sends the user to
// CC Canon ID Auth Activity unless k9/e.k() == 2, in which case it calls z()
// (the walkthrough continuation) instead. On some existing installs this
// produces a loop back to the same login screen when "Continue with Login"
// is pressed. We override only this local branch during an explicit tap,
// never the globally stored login state or token information.
private val startCanonAuthentication = Fingerprint(
    definingClass = WALKTHROUGH,
    name = "y",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(definingClass = LOGIN_STATUS, name = "k"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately())
    )
)

@Suppress("unused")
val canonOfflineCameraAccessPatch = patch(
    name = "Optional Canon ID Login",
    description = "Add Continue without login, remember an explicit offline choice, and preserve genuine Canon ID login.",
    default = true
) {
    compatibleWith(CANON_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // CCTopActivity.O() calls the static x(...) before constructing the
        // walkthrough activity. Capture its app Context first, so a saved
        // offline choice is honored even after a full process restart.
        // This method has 24 registers with p0=v23: use invoke-static/range
        // because the ordinary invoke-static format can't address v23.
        val topMethod = topWalkthroughDecision.method
        check(topMethod.implementation!!.registerCount == 24) {
            "Unexpected Top Activity walkthrough decision register count"
        }
        topMethod.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onTopActivityEntry(Landroid/app/Activity;)V"
        )

        // Cache a real Activity Context after super.onCreate and BEFORE
        // Canon evaluates x(...). This hook uses no additional registers.
        walkthroughCreate.method.addInstructions(
            1,
            "invoke-static { p0 }, $EXTENSION->onWalkthroughCreated(Landroid/app/Activity;)V"
        )

        // The original x(...) has a dedicated early return (state 2) if the
        // Canon EULA has not been accepted/currently acknowledged. Preserve
        // that. At original instruction index 32 (DEX code-unit 53) the EULA
        // check has completed and Canon starts its next-stage decision.
        //
        // Use addInstructionsAtControlFlowLabel: the original branch ending
        // the EULA check targets this instruction, so a normal insertion
        // could be skipped. x(...) has 11 registers, with p0=v9/p1=v10;
        // local v0 is safe because the original instruction overwrites it.
        // Returning 1 is Canon's normal "walkthrough complete" result,
        // consumed by CCWalkThroughActivity.z() to call finish().
        val decisionMethod = walkthroughDecision.method
        val eulaExitIndex = 32
        check(decisionMethod.implementation!!.registerCount == 11) {
            "Unexpected walkthrough decision register count"
        }
        check(decisionMethod.implementation!!.instructions.elementAt(eulaExitIndex).opcode
                == Opcode.IGET_OBJECT) {
            "Canon's original post-EULA gate has moved; refusing to patch"
        }
        decisionMethod.addInstructionsAtControlFlowLabel(
            eulaExitIndex,
            """
                invoke-static {}, $EXTENSION->shouldSkipWalkthrough()Z
                move-result v0
                if-eqz v0, :canon_original_walkthrough
                const/4 v0, 0x1
                return v0
                :canon_original_walkthrough
                nop
            """
        )

        // Install the offline control only AFTER Canon's page-rendering logic
        // finishes. v(int) has one RETURN_VOID in the supported APK.
        //
        // WARNING: Canon overwrites p0 (register v9) near the method tail:
        //   sget-object v9, Ljp/co/canon/ic/cameraconnect/common/q0;->e:...
        // The v5 hook passed {p0,p1} as (Activity,int), which produced an
        // Android VerifyError. Pass ONLY the untouched int argument p1 here.
        // The extension retrieves the real Activity from the WeakReference
        // previously saved by onWalkthroughCreated(Activity).
        //
        // Use instruction index rather than DEX code-unit offset and preserve
        // all original branch targets with addInstructionsAtControlFlowLabel.
        walkthroughRender.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            check(returnIndices.size == 1) {
                "Expected a single walkthrough renderer return, found ${returnIndices.size}"
            }
            addInstructionsAtControlFlowLabel(
                returnIndices.single(),
                "invoke-static { p1 }, $EXTENSION->onWalkthroughNavigation(I)V"
            )
        }

        // IMPORTANT: obtain the fingerprint match before modifying y(Z),
        // because method instruction indices are based on its original DEX.
        // Canon's y(Z) checks its real cached account status and calls z()
        // instead of launching Canon ID auth when k() == 2. In the observed
        // scenario this takes "Continue with Login" back to the same screen.
        // Force the launch branch *only* for an explicit login selection.
        // The hook targets the move-result immediately after k() and does
        // NOT alter k() itself, login tokens, or the other walkthrough gate.
        val loginStatusResult = startCanonAuthentication.instructionMatches.last()
        val loginStatusRegister =
            loginStatusResult.getInstruction<OneRegisterInstruction>().registerA
        check(loginStatusRegister in 0..15) {
            "Unexpected Canon ID status register: v$loginStatusRegister"
        }
        startCanonAuthentication.method.addInstructions(
            loginStatusResult.index + 1,
            """
                invoke-static { v$loginStatusRegister }, $EXTENSION->getCanonLoginLaunchStatus(I)I
                move-result v$loginStatusRegister
            """
        )

        // Insert the entry hook *after* the status hook so insertion at 0
        // cannot invalidate the original fingerprint's target index.
        // This callback runs before the getCanonLoginLaunchStatus check.
        startCanonAuthentication.method.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION->onLoginSelected(Landroid/app/Activity;)V"
        )
    }
}

// Independent optional browser patch. The service bind AND subsequent
// Custom Tabs intent launch must use the same browser package.
private val chromePackageName = Fingerprint(
    definingClass = LOGIN_STATUS,
    name = "p",
    isStatic = false,
    returnType = CANON_RESULT,
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(string("com.android.chrome"))
)

// A separate callback uses the exact same Chrome string as p(), and then
// explicitly sets Intent.setPackage(...) before opening the authorization URL.
// Patching only the service-binding literal leaves this callback launching
// Chrome and causes ActivityNotFoundException if Chrome is not installed.
private val chromeLaunchPackageName = Fingerprint(
    definingClass = "Lja/a;",
    name = "a",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Landroid/content/ComponentName;", "Lib/i;"),
    filters = listOf(string("com.android.chrome"))
)

@Suppress("unused")
val canonCustomTabsBrowserPatch = patch(
    name = "Choose Canon ID sign-in browser",
    description = "Use the selected Custom Tabs browser for both service binding and browser launch.",
    default = false
) {
    compatibleWith(CANON_COMPATIBILITY)

    val browserPackage = stringOption(
        key = "canonCustomTabsBrowserPackage",
        default = "org.mozilla.firefox",
        values = mapOf(
            "Firefox" to "org.mozilla.firefox",
            "Firefox Beta" to "org.mozilla.firefox_beta",
            "Brave" to "com.brave.browser",
            "Microsoft Edge" to "com.microsoft.emmx",
            "Vivaldi" to "com.vivaldi.browser",
            "Samsung Internet" to "com.sec.android.app.sbrowser",
            "Chrome" to "com.android.chrome"
        ),
        title = "Custom Tabs browser package"
    )

    execute {
        val packageName = browserPackage.value!!
        // Update both distinct method-level references to the Chrome literal.
        // The same DEX string-pool item is referenced by both methods; we
        // must replace both *const-string instructions*, not the pool value.
        for (fingerprint in listOf(chromePackageName, chromeLaunchPackageName)) {
            val match = fingerprint.instructionMatches.single()
            val register = match.getInstruction<OneRegisterInstruction>().registerA
            check(register in 0..255) { "Unexpected const-string register v$register" }
            fingerprint.method.replaceInstruction(
                match.index,
                "const-string v$register, \"$packageName\""
            )
        }
    }
}
