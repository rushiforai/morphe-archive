package app.template.patches.mailcom.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.template.patches.mailcom.shared.toStringFingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// The Tracking2 event pipeline switch (9.18.3: remoteconfig.models.Tracking2Config), read by
// tracking2's EventCollector before it stores an event.
internal val Tracking2ConfigToStringFingerprint = toStringFingerprint("Tracking2Config(batchSize=")

// The per-tracker consent result (9.18.3: mail.tracking.TrackingPermissions), built only by
// TrackingModulePlugin.getTrackingPermissions.
internal val TrackingPermissionsToStringFingerprint =
    toStringFingerprint("TrackingPermissions(isBrainTrackingAllowed=")

// The app-monitoring switch (9.18.3: remoteconfig.models.AppMonConfig), read by MailAppMonProxy.
internal val AppMonConfigToStringFingerprint = toStringFingerprint("AppMonConfig(isAppMonEnabled=")

// The Sentry crash-tracking config (9.18.3: trackingcrashes.sentry.CrashTrackingConfig, the data
// class SentryApi.start received). Since 9.21.2 R8 inlined SentryApi.start into
// MailApplication.onCreate, which calls SentryAndroid.init only when the config says
// crashTrackingType == SENTRY and isCrashTrackingAllowedByUser; the manifest sets
// io.sentry.auto-init=false, so that is the only way Sentry starts. The remote-config model of the
// same simple name starts with a different property, so the prefix is unique.
internal val CrashTrackingConfigToStringFingerprint =
    toStringFingerprint("CrashTrackingConfig(isCrashTrackingAllowedByUser=")
