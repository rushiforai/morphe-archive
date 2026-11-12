/*
 * Copyright (C) 2026 hoo-dles
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.template.patches.shared.misc.pairip

import app.morphe.patcher.Fingerprint

internal const val LICENSE_CLIENT_CLASS = "Lcom/pairip/licensecheck/LicenseClient;"

internal object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList(),
)

internal object CheckLicenseFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object ProcessResponseFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
)

internal object HandleErrorFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "handleError",
    returnType = "V",
    parameters = listOf("Lcom/pairip/licensecheck/LicenseCheckException;"),
)

internal object StartPaywallActivityFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "startPaywallActivity",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
)

/** Schedules exitAction (System.exit) after 30s — the delayed clone close. */
internal object ScheduleAppShutdownFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = emptyList(),
)

/** Re-runs license check later; can eventually fail and shut down. */
internal object ScheduleRepeatedLicenseCheckFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "scheduleRepeatedLicenseCheck",
    returnType = "V",
    parameters = listOf("Lcom/pairip/licensecheck/RepeatedCheckMetadata;"),
)

internal object StartErrorDialogActivityFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = emptyList(),
)

internal object BindToLicensingServiceFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "bindToLicensingService",
    returnType = "V",
    parameters = listOf("Z"),
)

internal object InitiateFreshLicensingServiceConnectionFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "initiateFreshLicensingServiceConnection",
    returnType = "V",
    parameters = listOf("Z"),
)

internal object IsLocalCheckPassedFingerprint : Fingerprint(
    definingClass = LICENSE_CLIENT_CLASS,
    name = "isLocalCheckPassed",
    returnType = "Z",
    parameters = emptyList(),
)

internal object VMRunnerStaticInitializerFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "<clinit>",
)

internal object VMRunnerInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
)
