import dev.alastorkaneki.morphe.extension.operagx.GxModUrlResolver;

public final class ParserSelfTest {
    public static void main(String[] args) {
        assertEquals(
                "https://store.gx.me/mods/hma4i0/fundy/",
                GxModUrlResolver.extractStorePageUrl(
                        "Fundy mod: https://store.gx.me/mods/hma4i0/fundy/"
                )
        );

        assertEquals(
                "https://store.gx.me/mods/hma4i0/fundy/",
                GxModUrlResolver.extractStorePageUrl(
                        "store.gx.me/mods/hma4i0/fundy/"
                )
        );

        String direct = "{\"url\":\"https:\\/\\/mods.store.gx.me\\/mods\\/" +
                "a\\/b\\/c\\/d\\/mod.crx?cache=1\"}";
        assertEquals(
                "https://mods.store.gx.me/mods/a/b/c/d/mod.crx?cache=1",
                GxModUrlResolver.resolveCrxUrlFromHtml(direct)
        );

        String asset = "<img src=\"https://play.gxc.gg/mods/a/b/c/d/contents/preview.png\">";
        assertEquals(
                "https://play.gxc.gg/mods/a/b/c/d/mod.crx",
                GxModUrlResolver.resolveCrxUrlFromHtml(asset)
        );

        assertTrue(GxModUrlResolver.isAllowedCrxUrl(
                "https://mods.store.gx.me/mods/a/b/c/d/mod.crx"
        ));
        assertFalse(GxModUrlResolver.isAllowedCrxUrl(
                "https://example.com/mod.crx"
        ));

        System.out.println("Parser self-test passed.");
    }

    private static void assertEquals(String expected, String actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError("Expected: " + expected + "\nActual:   " + actual);
        }
    }

    private static void assertTrue(boolean value) {
        if (!value) throw new AssertionError("Expected true");
    }

    private static void assertFalse(boolean value) {
        if (value) throw new AssertionError("Expected false");
    }
}
