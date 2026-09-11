/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class YandexVotDiagnosticsTest {
    @Test
    public void requiredPhasesUseSanitizedStableMarkers() {
        String markers = String.join("\n",
                YandexVotDiagnostics.buttonPressedMessage(),
                YandexVotDiagnostics.attemptStartedMessage(false),
                YandexVotDiagnostics.apiResultMessage(
                        "initial", false, 6, true, true, false, false),
                YandexVotDiagnostics.apiFailureMessage(
                        "client-request-exception", "dns", true),
                YandexVotDiagnostics.audioRequestMessage(
                        "exit", YandexVotAudioResult.SOURCE_UNAVAILABLE),
                YandexVotDiagnostics.sourceMessage("selected", 251, 4),
                YandexVotDiagnostics.sourceEnvironmentMessage(true, false, true, 4),
                YandexVotDiagnostics.transportSummaryMessage(
                        new YandexVotPlayerMediaTransport.DiagnosticSummary(
                                1, true, 9, 11, 5, 2,
                                0, 0, 8, 1, 4, 4, 0, 4, 1, 3, 3, 5)),
                YandexVotDiagnostics.uploadPartMessage("result", 2, 3, true),
                YandexVotDiagnostics.playbackMessage("error", "direct", 1, -1004));

        assertTrue(markers.contains("build=yandex-audio-direct-v7"));
        assertTrue(markers.contains("phase=button event=pressed"));
        assertTrue(markers.contains("phase=api request=initial"));
        assertTrue(markers.contains("resultNull=false status=6"));
        assertTrue(markers.contains("translationIdPresent=true"));
        assertTrue(markers.contains("audioUrlPresent=false"));
        assertTrue(markers.contains("phase=api event=client-request-exception"
                + " category=dns proxy=true"));
        assertTrue(markers.contains("phase=audio-request event=exit"));
        assertTrue(markers.contains("phase=source event=selected selectedItag=251 snapshots=4"));
        assertTrue(markers.contains("phase=source event=environment spoofIncluded=true"
                + " spoofSetting=false spoofEffective=false externalPoTokenSetting=true"
                + " snapshots=4"));
        assertTrue(markers.contains("phase=transport event=summary engineHooks=1"
                + " engineReady=true requestHooks=9"));
        assertTrue(markers.contains("playerRequestHooks=11 playerContextsRetained=5"
                + " directStreamRequests=2"));
        assertTrue(markers.contains("bodyful=4 missingItag=1 retained=3 snapshots=3"));
        assertTrue(markers.contains("playerContexts=5"));
        assertTrue(markers.contains("phase=upload event=result part=2/3 accepted=true"));
        assertTrue(markers.contains("phase=playback event=error source=direct what=1 extra=-1004"));

        assertFalse(markers.contains("https://"));
        assertFalse(markers.contains("videoId="));
        assertFalse(markers.contains("translationId="));
        assertFalse(markers.contains("oauth"));
        assertFalse(markers.contains("cookie"));
        assertFalse(markers.contains("header="));
        assertFalse(markers.contains("body="));
        assertFalse(markers.contains("path="));
    }

    @Test
    public void internalTransportPatchIsHiddenDependency() throws IOException {
        Path root = findRepositoryRoot();
        String transportPatch = readUtf8(root.resolve(
                "patches/src/main/kotlin/app/morphe/patches/youtube/video/voiceovertranslation/"
                        + "YandexVotPlayerMediaTransportPatch.kt"));
        String yandexPatch = readUtf8(root.resolve(
                "patches/src/main/kotlin/app/morphe/patches/youtube/video/voiceovertranslation/"
                        + "YandexVoiceOverTranslationPatch.kt"));
        String transportClass = readUtf8(root.resolve(
                "extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/"
                        + "voiceovertranslation/yandex/YandexVotPlayerMediaTransport.java"));
        String voicePatch = readUtf8(root.resolve(
                "extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/"
                        + "voiceovertranslation/yandex/YandexVoiceOverTranslationPatch.java"));
        String russianStrings = readUtf8(root.resolve(
                "patches/src/main/resources/addresources/values-ru-rRU/youtube/strings.xml"));

        assertTrue(transportPatch.contains(
                "internal val yandexVotPlayerMediaTransportPatch = bytecodePatch {"));
        assertFalse(transportPatch.contains("name = \"Yandex VoT player media transport\""));
        assertFalse(transportPatch.contains("default = false"));
        assertTrue(transportPatch.contains("hookBuildRequest"));
        assertTrue(transportPatch.contains("recordPlayerRequest"));
        assertTrue(transportPatch.contains(
                "invoke-static/range { v$register .. v$register }"));
        assertFalse(transportPatch.contains("invoke-static { v$register }"));
        assertTrue(yandexPatch.contains("yandexVotPlayerMediaTransportPatch"));
        assertTrue(transportClass.contains("public final class YandexVotPlayerMediaTransport"));
        assertTrue(voicePatch.contains("private static void beginTranslationRequestState()"));
        assertTrue(russianStrings.contains(
                "<string name=\"dualvot_yandex_unavailable_live\">"
                        + "Перевод недоступен для прямых трансляций</string>"));
        int clearCacheIndex = voicePatch.indexOf("YandexVotApiClient.clearTranslationCache();");
        int restartStateIndex = voicePatch.indexOf(
                "beginTranslationRequestState();",
                clearCacheIndex
        );
        assertTrue(clearCacheIndex >= 0
                && restartStateIndex > clearCacheIndex
                && restartStateIndex - clearCacheIndex < 256);
    }

    private static String readUtf8(Path path) throws IOException {
        return new String(Files.readAllBytes(path), StandardCharsets.UTF_8)
                .replace("\r\n", "\n");
    }

    private static Path findRepositoryRoot() {
        Path candidate = Paths.get(System.getProperty("user.dir")).toAbsolutePath();
        while (candidate != null) {
            if (Files.isRegularFile(candidate.resolve("settings.gradle.kts"))
                    && Files.isDirectory(candidate.resolve("extensions/youtube"))) {
                return candidate;
            }
            candidate = candidate.getParent();
        }
        throw new AssertionError("Repository root not found from test working directory");
    }
}
