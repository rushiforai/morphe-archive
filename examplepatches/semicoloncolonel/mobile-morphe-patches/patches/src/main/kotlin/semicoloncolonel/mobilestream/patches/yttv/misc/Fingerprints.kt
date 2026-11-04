/*
 * Ported from Morphe's "GmsCore support" patch (GPL-3.0):
 * https://github.com/MorpheApp/morphe-patches/tree/main/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms
 * Copyright 2026 Morphe. Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 * See the NOTICE file for the GPLv3 Section 7 terms that apply to Morphe contributions.
 * ALL CREDIT FOR THE GMSCORE SUPPORT DESIGN AND FINGERPRINTS GOES TO MORPHE AND REVANCED.
 */

package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// Every fingerprint below was checked against YouTube TV 10.44.0. The names
// after each one are what it matched there.

// The Primes allowlist of first-party packages (aalg.a()Z). It reads the
// app's own package name and checks it against a list that holds
// "com.google.android.apps.youtube.unplugged". The renamed app must be on
// that list too.
internal object PrimeMethodFingerprint : Fingerprint(
    filters = listOf(
        string("com.android.vending"),
        string("com.google.android.GoogleCamera"),
    )
)

// The launcher is SplashActivity, but MainActivity is where the app lives and
// where the GmsCore dialogs stay on screen.
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/unplugged/features/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// The Cast SDK client's CastContext callback (akrv.a(Lsin;)V). GmsCore has no
// Cast service, so the app stops before it fetches a CastContext.
internal object CastContextFetchFingerprint : Fingerprint(
    filters = listOf(
        string("Error fetching CastContext."),
    )
)

// Google Notifications Platform registration (zfw.b(Object)Object). The
// second filter is the move-result of Context.getPackageName().
internal object GnpRegistrationTargetFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            smali = "Landroid/content/Context;->getPackageName()Ljava/lang/String;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        string("Failed to get android ID."),
        string("Exception reading GServices key."),
    )
)

