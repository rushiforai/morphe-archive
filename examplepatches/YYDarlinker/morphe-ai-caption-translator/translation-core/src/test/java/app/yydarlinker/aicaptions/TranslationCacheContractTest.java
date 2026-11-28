package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class TranslationCacheContractTest extends TranslationPlaybackFixture {
    static final String LEGACY_KEY = "5c2fa5f37676169eeafc413afc98ec956cee15bb4e83b19c17d4223140cc3857";
    static final String LEGACY_PROMPT_SHA = "d3d1e2ac4f987e6f49ea91737919d76511abf9f5988f991746d564246506d603";
    static final String CURRENT_PROMPT_SHA = "58cc244a8c23f8d5859fae7dd412f3b660116cc70f3f1a145561509aae1fe78c";
    static final String FRESH = "世界，你好。";

    Path directory() { return context.getCacheDir().toPath().resolve("caption-events-r2.12"); }

    Path persisted() throws Exception {
        try (var files = Files.list(directory())) {
            return files.filter(file -> file.toString().endsWith(".json")).findFirst().orElseThrow();
        }
    }

    void restart() {
        RebuildController.stop();
        frames.clear();
        activate();
    }

    @Test public void currentCacheReplaysWithoutAnotherPost() throws Exception {
        activate();
        awaitText(TRANSLATION);
        assertTrue(Files.isRegularFile(persisted()));
        restart();
        awaitText(TRANSLATION);
        assertEquals(1, requests.size());
    }

    @Test public void changingOnlyCredentialsReusesItsExistingCacheEntry() throws Exception {
        activate();
        awaitText(TRANSLATION);
        key = "replacement-fixture-key";
        restart();
        awaitText(TRANSLATION);
        assertEquals(1, requests.size());
    }

    @Test public void changingDestinationLanguageCannotRestoreAnotherLanguage() throws Exception {
        activate();
        awaitText(TRANSLATION);
        target = "ja";
        reply = (http, payload) -> envelope(response(payload, "こんにちは、世界。"));
        restart();
        awaitText("こんにちは、世界。");
        assertEquals(2, requests.size());
        assertTrue(frames.stream().noneMatch(f -> f.text.equals(TRANSLATION)));
    }

    @Test public void corruptCacheIsReplacedWithFreshHttpReply() throws Exception {
        activate();
        awaitText(TRANSLATION);
        Path file = persisted();
        Files.write(file, "{".getBytes(StandardCharsets.UTF_8));
        reply = (http, payload) -> envelope(response(payload, FRESH));
        restart();
        awaitText(FRESH);
        assertEquals(2, requests.size());
        assertTrue(new String(Files.readAllBytes(file), StandardCharsets.UTF_8).contains(FRESH));
    }

    @Test public void legacyPromptCacheKeyIsPreservedWithoutServingItsOldTranslation() throws Exception {
        Files.createDirectories(directory());
        Path legacy = directory().resolve(LEGACY_KEY + "-b0_0_1.json");
        byte[] bytes = ("{\"block\":\"b0_0_1\",\"events\":[{\"from\":0,\"to\":1,"
                + "\"source\":\"Hello world.\",\"text\":\"旧提示词的翻译。\"}]}").getBytes(StandardCharsets.UTF_8);
        Files.write(legacy, bytes);
        activate();
        awaitText(TRANSLATION);
        assertEquals(1, requests.size());
        assertArrayEquals(bytes, Files.readAllBytes(legacy));
        assertTrue(diagnostics.stream().anyMatch(line ->
                line.startsWith("REBUILD_POLICY_REQUEST ") && line.endsWith("prompt_hash=" + CURRENT_PROMPT_SHA)));
        assertTrue(diagnostics.stream().noneMatch(line -> line.endsWith("prompt_hash=" + LEGACY_PROMPT_SHA)));
    }

    @Test public void retiredReplyCannotOverwriteTheNewOwnersPersistentCaption() throws Exception {
        var release = new CountDownLatch(1);
        var answered = new CountDownLatch(1);
        AtomicInteger calls = new AtomicInteger();
        reply = (http, payload) -> {
            if (calls.incrementAndGet() == 1) {
                assertTrue(release.await(5, TimeUnit.SECONDS));
                answered.countDown();
                return envelope(response(payload, TRANSLATION));
            }
            return envelope(response(payload, FRESH));
        };
        try {
            activate();
            await("retiring request", () -> requests.size() == 1);
            key = "replacement-fixture-key";
            activate();
            awaitText(FRESH);
            Path path = persisted();
            byte[] fresh = Files.readAllBytes(path);
            release.countDown();
            assertTrue(answered.await(3, TimeUnit.SECONDS));
            await("retired HTTP reply processed", () -> diagnostics.stream().filter(line ->
                    line.startsWith("REBUILD_HTTP_RESPONSE ")).count() == 2);
            assertArrayEquals(fresh, Files.readAllBytes(path));
            restart();
            awaitText(FRESH);
            assertEquals(2, requests.size());
        } finally {
            release.countDown();
        }
    }
}

