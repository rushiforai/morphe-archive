/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;

/** Sanitized, stable markers for one Yandex translation attempt. */
final class YandexVotDiagnostics {
    static final String BUILD_ID = "yandex-audio-direct-v6";
    private static final String PREFIX = "Yandex VOT diagnostics build=" + BUILD_ID + " ";

    private YandexVotDiagnostics() {
    }

    static void buttonPressed() {
        log(buttonPressedMessage());
    }

    static String buttonPressedMessage() {
        return PREFIX + "phase=button event=pressed";
    }

    static void attemptStarted(boolean liveMode) {
        log(attemptStartedMessage(liveMode));
    }

    static String attemptStartedMessage(boolean liveMode) {
        return PREFIX + "phase=attempt event=start mode=" + mode(liveMode);
    }

    static void apiResult(String requestPhase, @Nullable YandexVotApiClient.TranslationResult result,
                          boolean liveMode) {
        log(apiResultMessage(
                requestPhase,
                result == null,
                result == null ? -1 : result.status(),
                result != null && result.remainingTime() > 0,
                result != null && present(result.translationId()),
                result != null && present(result.audioUrl()),
                liveMode));
    }

    static String apiResultMessage(String requestPhase, boolean resultNull, int status,
                                   boolean etaPresent, boolean translationIdPresent,
                                   boolean audioUrlPresent, boolean liveMode) {
        return PREFIX + "phase=api request=" + requestPhase
                + " resultNull=" + resultNull
                + " status=" + (resultNull ? "none" : status)
                + " etaPresent=" + etaPresent
                + " translationIdPresent=" + translationIdPresent
                + " audioUrlPresent=" + audioUrlPresent
                + " mode=" + mode(liveMode);
    }

    static void audioRequest(String event, @Nullable YandexVotAudioResult result) {
        log(audioRequestMessage(event, result));
    }

    static String audioRequestMessage(String event, @Nullable YandexVotAudioResult result) {
        return PREFIX + "phase=audio-request event=" + event
                + " result=" + (result == null ? "none" : result.name());
    }

    static void source(String event, int selectedItag, int snapshotCount) {
        log(sourceMessage(event, selectedItag, snapshotCount));
    }

    static String sourceMessage(String event, int selectedItag, int snapshotCount) {
        return PREFIX + "phase=source event=" + event
                + " selectedItag=" + selectedItag
                + " snapshots=" + Math.max(0, snapshotCount);
    }

    static void sourceEnvironment(boolean spoofIncluded, boolean spoofSetting,
                                  int snapshotCount) {
        log(sourceEnvironmentMessage(spoofIncluded, spoofSetting, snapshotCount));
    }

    static String sourceEnvironmentMessage(boolean spoofIncluded, boolean spoofSetting,
                                           int snapshotCount) {
        return PREFIX + "phase=source event=environment"
                + " spoofIncluded=" + spoofIncluded
                + " spoofSetting=" + spoofSetting
                + " spoofEffective=" + (spoofIncluded && spoofSetting)
                + " snapshots=" + Math.max(0, snapshotCount);
    }

    static void transport(String event, int itag, int bodyBytes, int snapshotCount) {
        log(PREFIX + "phase=transport event=" + event
                + " itag=" + itag
                + " bodyBytes=" + Math.max(0, bodyBytes)
                + " snapshots=" + Math.max(0, snapshotCount));
    }

    static void transportSummary(YandexVotPlayerMediaTransport.DiagnosticSummary summary) {
        log(transportSummaryMessage(summary));
    }

    static String transportSummaryMessage(
            YandexVotPlayerMediaTransport.DiagnosticSummary summary
    ) {
        return PREFIX + "phase=transport event=summary"
                + " engineHooks=" + summary.engineHooks()
                + " engineReady=" + summary.engineReady()
                + " requestHooks=" + summary.requestHooks()
                + " playerRequestHooks=" + summary.playerRequestHooks()
                + " playerContextsRetained=" + summary.playerContextsRetained()
                + " directStreamRequests=" + summary.directStreamRequests()
                + " nullUri=" + summary.nullUri()
                + " invalidUri=" + summary.invalidUri()
                + " playbackRoute=" + summary.playbackRoute()
                + " otherRoute=" + summary.otherRoute()
                + " methodGet=" + summary.methodGet()
                + " methodPost=" + summary.methodPost()
                + " methodOther=" + summary.methodOther()
                + " bodyful=" + summary.bodyful()
                + " missingItag=" + summary.missingItag()
                + " retained=" + summary.retained()
                + " snapshots=" + summary.snapshots()
                + " playerContexts=" + summary.playerContexts();
    }

    static void uploadPart(String event, int part, int totalParts, @Nullable Boolean accepted) {
        log(uploadPartMessage(event, part, totalParts, accepted));
    }

    static String uploadPartMessage(String event, int part, int totalParts,
                                    @Nullable Boolean accepted) {
        return PREFIX + "phase=upload event=" + event
                + " part=" + part + "/" + totalParts
                + " accepted=" + (accepted == null ? "unknown" : accepted);
    }

    static void playback(String event, String source, int what, int extra) {
        log(playbackMessage(event, source, what, extra));
    }

    static String playbackMessage(String event, String source, int what, int extra) {
        return PREFIX + "phase=playback event=" + event
                + " source=" + source + " what=" + what + " extra=" + extra;
    }

    static void lifecycle(String event) {
        log(PREFIX + "phase=lifecycle event=" + event);
    }

    static void failure(String phase, String event) {
        log(PREFIX + "phase=" + phase + " event=" + event);
    }

    private static String mode(boolean liveMode) {
        return liveMode ? "live" : "standard";
    }

    private static boolean present(@Nullable String value) {
        return value != null && !value.isEmpty();
    }

    private static void log(String message) {
        try {
            Class.forName("app.morphe.extension.shared.Logger");
            Logger.printDebug(() -> message);
        } catch (ClassNotFoundException ignored) {
            // Unit tests intentionally run without the Android logging backend.
        }
    }
}
