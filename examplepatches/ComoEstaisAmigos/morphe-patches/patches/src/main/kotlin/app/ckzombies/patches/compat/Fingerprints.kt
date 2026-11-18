package app.ckzombies.patches.compat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `GluUtil.findResourceFile()` looks for `file.big` on internal storage, then on the SD card,
 * and returns null when neither exists. The game writes it on first launch, but on current
 * Android that write fails, so on a clean install it never exists and the native caller dies on
 * the null.
 * Matches up to the `const/4 vX, 0x0` that produces that null.
 */
internal object FindResourceFileFingerprint : Fingerprint(
    definingClass = "Lcom/glu/platform/android/resdl/GluUtil;",
    name = "findResourceFile",
    returnType = "Ljava/io/File;",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lcom/glu/platform/android/resdl/GluUtil;", name = "getPrimaryResSDCardFilename"),
        methodCall(definingClass = "Ljava/io/File;", name = "exists"),
        opcode(Opcode.IF_NEZ),
        opcode(Opcode.CONST_4, MatchAfterImmediately()),
    ),
)

/**
 * Starts the OpenFeint SDK, whose servers are gone. On the way it saves its preferences with
 * `openFileOutput(..., MODE_WORLD_READABLE)`, which throws from targetSdk 24.
 */
internal object GluOpenFeintInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/glu/android/tools/community/GluOpenFeint;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(),
)

internal object ZombSniperOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/glu/android/zombsniper/ZombSniper;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** The in-app billing bind. Filter 1 is the `Intent(String)` constructor. */
internal object BindMarketBillingServiceFingerprint : Fingerprint(
    definingClass = "Lcom/glu/android/iap/GluGoogleIAP;",
    name = "bindToMarketBillingService",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("com.android.vending.billing.MarketBillingService.BIND"),
        methodCall(definingClass = "Landroid/content/Intent;", name = "<init>", location = MatchAfterImmediately()),
        methodCall(name = "bindService"),
    ),
)

/** The licensing bind. Filter 1 is the `Intent(String)` constructor. */
internal object LicenseCheckAccessFingerprint : Fingerprint(
    definingClass = "Lcom/android/vending/licensing/LicenseChecker;",
    name = "checkAccess",
    returnType = "V",
    parameters = listOf("Lcom/android/vending/licensing/LicenseCheckerCallback;"),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Class;", name = "getName"),
        methodCall(definingClass = "Landroid/content/Intent;", name = "<init>"),
        methodCall(definingClass = "Landroid/content/Context;", name = "bindService"),
    ),
)
