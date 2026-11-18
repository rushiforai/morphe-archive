/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.youtube.utils;

import static org.junit.Assert.*;

import android.content.pm.PackageInfo;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class GeminiGroundingTest {
    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, application);
        Settings.GEMINI_GOOGLE_SEARCH.save(false);
    }

    @Test
    public void cascadePreservesOrderAndIgnoresDuplicatesAndInvalidIds() throws Exception {
        assertEquals(List.of("gemini-2.5-flash", "gemini-2.5-pro"),
                parseModels(" models/gemini-2.5-flash\r\n,gemini-2.5-pro,gemini-2.5-flash\n../invalid\n?key=x"));
    }

    @Test
    public void emptyOrInvalidCascadeUsesUnchangedDefaults() throws Exception {
        List<String> defaults = parseModels(Settings.GEMINI_MODELS.defaultValue);
        assertEquals(List.of("gemini-3.8-flash", "gemini-3.6-flash", "gemini-3.5-flash",
                "gemini-3.5-flash-lite", "gemini-3.1-flash-lite", "gemini-3-flash-preview",
                "gemini-3.1-pro-preview", "gemini-2.5-flash", "gemini-2.5-flash-lite", "gemini-2.5-pro"), defaults);
        assertEquals(defaults, parseModels(" \r\n,"));
        assertEquals(defaults, parseModels("../invalid,https://example.org/model"));
    }

    @Test
    public void groundingIsDefaultOffAndOnlyAddsToolsToSummaryAndChat() throws Exception {
        assertFalse(Settings.GEMINI_GOOGLE_SEARCH.defaultValue);
        Object summary = promptRequest(true, false);
        assertFalse(body(summary).has("tools"));

        Settings.GEMINI_GOOGLE_SEARCH.save(true);
        assertTrue(body(summary).getJSONArray("tools").getJSONObject(0).has("google_search"));
        assertTrue(body(chatRequest("Summary", List.of())).has("tools"));
        assertFalse(body(promptRequest(false, false)).has("tools")); // Transcription.
        assertFalse(body(promptRequest(false, true)).has("tools")); // Translation/settings JSON.
        assertFalse(body(promptRequest(true, true)).has("tools"));
    }

    @Test
    public void metadataSurvivesCacheRoundTripButNeverEntersChatContext() throws Exception {
        JSONObject metadata = metadata(6, "https://example.org/source");
        String answer = GeminiGrounding.attach("Résumé", metadata);
        assertEquals("Résumé", GeminiGrounding.strip(answer));
        assertEquals(metadata.toString(), GeminiGrounding.metadata(answer).toString());
        assertEquals("Answer", GeminiGrounding.attach("Answer", new JSONObject()));

        JSONArray contents = body(chatRequest(answer,
                List.of(new GeminiUtils.ChatMessage("model", answer),
                        new GeminiUtils.ChatMessage("user", "Next question")))).getJSONArray("contents");
        assertTrue(contents.getJSONObject(0).getJSONArray("parts").getJSONObject(1)
                .getString("text").endsWith("Résumé"));
        assertEquals("Résumé", contents.getJSONObject(1).getJSONArray("parts").getJSONObject(0).getString("text"));
        assertFalse(contents.toString().contains("gemini-grounding"));
    }

    @Test
    public void citationsUseUtf8OffsetsAndInsertInReverseOrder() throws Exception {
        String first = "é🙂\r\n";
        String text = first + "Second";
        JSONObject metadata = metadata(first.getBytes(StandardCharsets.UTF_8).length, "https://example.org/a(b)");
        metadata.getJSONArray("groundingSupports").put(new JSONObject()
                .put("segment", new JSONObject().put("endIndex", text.getBytes(StandardCharsets.UTF_8).length))
                .put("groundingChunkIndices", new JSONArray().put(0)));
        assertEquals(first + " [1](https://example.org/a%28b%29)Second [1](https://example.org/a%28b%29)",
                GeminiGrounding.cite(text, metadata));
    }

    @Test
    public void invalidCitationOffsetsAndUnsafeSourceSchemesAreIgnored() throws Exception {
        assertEquals("Answer", GeminiGrounding.cite("Answer", metadata(99, "https://example.org")));
        assertEquals("Answer", GeminiGrounding.cite("Answer", metadata(6, "javascript:alert(1)")));
        assertEquals("Answer", GeminiGrounding.cite("Answer", new JSONObject()));
    }

    @Test
    public void searchAttributionIsPreservedAndSourceTitlesAreEscaped() throws Exception {
        JSONObject metadata = metadata(6, "https://example.org/?a=1&b=2");
        metadata.getJSONArray("groundingChunks").getJSONObject(0).getJSONObject("web")
                .put("title", "<Source>");
        String attribution = "<div class=\"search\">Google Search</div>";
        metadata.put("searchEntryPoint", new JSONObject().put("renderedContent", attribution));
        String html = GeminiGrounding.html(metadata);
        assertTrue(html.contains("&lt;Source&gt;"));
        assertTrue(html.contains("?a=1&amp;b=2"));
        assertTrue(html.endsWith(attribution));
        assertFalse(GeminiGrounding.html(metadata(6, "javascript:alert(1)")).contains("javascript:"));
        assertEquals("", GeminiGrounding.html(new JSONObject()));
    }

    @Test
    public void malformedCachedMetadataDoesNotBreakRendering() {
        assertEquals(0, GeminiGrounding.metadata("Answer\n<!-- gemini-grounding:! -->").length());
        assertEquals("Answer", GeminiGrounding.strip("Answer\n<!-- gemini-grounding:! -->"));
        assertEquals("Answer", GeminiGrounding.strip("Answer"));
    }

    private static JSONObject metadata(int endIndex, String uri) throws Exception {
        return new JSONObject()
                .put("groundingChunks", new JSONArray().put(new JSONObject()
                        .put("web", new JSONObject().put("uri", uri).put("title", "Source"))))
                .put("groundingSupports", new JSONArray().put(new JSONObject()
                        .put("segment", new JSONObject().put("endIndex", endIndex))
                        .put("groundingChunkIndices", new JSONArray().put(0))));
    }

    @SuppressWarnings("unchecked")
    private static List<String> parseModels(String rawValue) throws Exception {
        Method method = GeminiUtils.class.getDeclaredMethod("parseModels", String.class);
        method.setAccessible(true);
        return (List<String>) method.invoke(null, rawValue);
    }

    private static Class<?> requestType() throws Exception {
        return Class.forName(GeminiUtils.class.getName() + "$RequestSpec");
    }

    private static Object promptRequest(boolean streaming, boolean json) throws Exception {
        Method method = requestType().getDeclaredMethod("forPrompt", String.class, String.class,
                String.class, boolean.class, boolean.class);
        method.setAccessible(true);
        return method.invoke(null, "https://www.youtube.com/watch?v=test", "Summarize", null, streaming, json);
    }

    private static Object chatRequest(String summary, List<GeminiUtils.ChatMessage> history) throws Exception {
        Method method = requestType().getDeclaredMethod("forChat", String.class, String.class, List.class);
        method.setAccessible(true);
        return method.invoke(null, "https://www.youtube.com/watch?v=test", summary, history);
    }

    private static JSONObject body(Object request) throws Exception {
        Method method = GeminiUtils.class.getDeclaredMethod("buildRequestBody", requestType(), String.class,
                String.class);
        method.setAccessible(true);
        return (JSONObject) method.invoke(null, request, "Summarize", "gemini-2.5-flash");
    }
}
