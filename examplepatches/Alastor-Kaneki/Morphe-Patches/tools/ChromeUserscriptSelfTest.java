import dev.alastorkaneki.morphe.extension.chromeuserscripts.ScriptInjector;
import dev.alastorkaneki.morphe.extension.chromeuserscripts.UrlPatternMatcher;
import dev.alastorkaneki.morphe.extension.chromeuserscripts.Userscript;
import dev.alastorkaneki.morphe.extension.chromeuserscripts.UserscriptMetadataParser;
import dev.alastorkaneki.morphe.extension.chromeuserscripts.ViolentmonkeyCompat;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public final class ChromeUserscriptSelfTest {
    public static void main(String[] args) throws Exception {
        String source =
                "// ==UserScript==\n" +
                "// @name Example Script\n" +
                "// @namespace dev.alastor\n" +
                "// @version 2.4.1\n" +
                "// @match https://*.example.com/*\n" +
                "// @exclude https://private.example.com/*\n" +
                "// @grant GM_getValue\n" +
                "// @grant GM_setValue\n" +
                "// @run-at document-idle\n" +
                "// ==/UserScript==\n" +
                "document.body.dataset.monkey = 'yes';";

        Userscript script = UserscriptMetadataParser.parse(
                source,
                "example.user.js",
                "https://example.com/example.user.js"
        );
        assertEquals("Example Script", script.name);
        assertEquals("2.4.1", script.version);
        assertEquals("document-idle", script.runAt);
        assertTrue(script.enabled);
        assertTrue(ViolentmonkeyCompat.looksLikeUserscript(source));
        assertTrue(UrlPatternMatcher.matches(script, "https://sub.example.com/page"));
        assertFalse(UrlPatternMatcher.matches(script, "https://private.example.com/page"));
        assertFalse(UrlPatternMatcher.matches(script, "chrome://settings"));

        String payload = ScriptInjector.buildPayload(script, "https://sub.example.com/page", false);
        assertContains(payload, "GM_getValue");
        assertContains(payload, "GM_registerMenuCommand");
        assertContains(payload, "document.body.dataset.monkey");
        assertContains(payload, "document-idle");

        String styleSource =
                "/* ==UserStyle==\n" +
                " * @name Example Style\n" +
                " * @match https://example.org/*\n" +
                " ==/UserStyle== */\n" +
                "body { background: #000; }";
        Userscript style = UserscriptMetadataParser.parse(
                styleSource,
                "example.user.css",
                ""
        );
        assertEquals(Userscript.KIND_CSS, style.kind);
        assertTrue(ViolentmonkeyCompat.looksLikeUserscript(styleSource));
        assertTrue(UrlPatternMatcher.matches(style, "https://example.org/"));
        assertContains(
                ScriptInjector.buildPayload(style, "https://example.org/", false),
                "monkey-style"
        );

        String localized =
                "// ==UserScript==\n" +
                "// @name:en Localized Name\n" +
                "// @namespace test.localized\n" +
                "// @match https://example.net/*\n" +
                "// ==/UserScript==\n";
        Userscript localizedScript = UserscriptMetadataParser.parse(
                localized,
                "localized.user.js",
                ""
        );
        assertEquals("Localized Name", localizedScript.name);

        String forkPage = "https://greasyfork.org/en/scripts/12345-example-script";
        assertTrue(ViolentmonkeyCompat.isForkScriptPage(forkPage));
        assertEquals(
                "https://update.greasyfork.org/scripts/12345/example-script.user.js",
                ViolentmonkeyCompat.fallbackForkInstallUrl(forkPage)
        );
        assertTrue(ViolentmonkeyCompat.isTrustedInstallUrl(
                "https://update.greasyfork.org/scripts/12345/example-script.user.js"
        ));

        String direct = "https://update.sleazyfork.org/scripts/88/example.user.js";
        String marker = "https://sleazyfork.org/en/scripts/88-example#monkeyscript-install="
                + URLEncoder.encode(direct, StandardCharsets.UTF_8.name());
        assertEquals(direct, ViolentmonkeyCompat.installUrlFromMarker(marker));

        Userscript raw = UserscriptMetadataParser.parse("console.log('raw');", "raw.js", "");
        assertFalse(raw.enabled);
        assertFalse(ViolentmonkeyCompat.looksLikeUserscript("<html>not a script</html>"));

        System.out.println("Chrome userscript and Violentmonkey compatibility self-test passed.");
    }

    private static void assertEquals(String expected, String actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError("Expected: " + expected + "\nActual: " + actual);
        }
    }

    private static void assertContains(String value, String expected) {
        if (!value.contains(expected)) {
            throw new AssertionError("Expected payload to contain: " + expected);
        }
    }

    private static void assertTrue(boolean value) {
        if (!value) throw new AssertionError("Expected true");
    }

    private static void assertFalse(boolean value) {
        if (value) throw new AssertionError("Expected false");
    }
}
