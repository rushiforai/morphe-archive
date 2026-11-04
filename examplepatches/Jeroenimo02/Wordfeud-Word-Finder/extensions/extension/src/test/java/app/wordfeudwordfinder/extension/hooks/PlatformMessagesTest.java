package app.wordfeudwordfinder.extension.hooks;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class PlatformMessagesTest {
    @Test
    public void navigationToGame() {
        String json = "{\"method\":\"routeInformationUpdated\",\"args\":{\"uri\":\"/game/4391319402\",\"state\":null,\"replace\":false}}";
        assertEquals(Long.valueOf(4391319402L), PlatformMessages.gameIdFromNavigation(json));
    }

    @Test
    public void navigationHome() {
        String json = "{\"method\":\"routeInformationUpdated\",\"args\":{\"uri\":\"/\",\"state\":null,\"replace\":false}}";
        assertNull(PlatformMessages.gameIdFromNavigation(json));
        assertNull(PlatformMessages.gameIdFromNavigation("not json"));
        assertNull(PlatformMessages.gameIdFromNavigation(null));
    }

    @Test
    public void overlayStyleDark() {
        String json = "{\"method\":\"SystemChrome.setSystemUIOverlayStyle\",\"args\":{\"statusBarIconBrightness\":\"Brightness.light\"}}";
        assertEquals(Boolean.TRUE, PlatformMessages.darkFromOverlayStyle(json));
        String lightJson = "{\"method\":\"SystemChrome.setSystemUIOverlayStyle\",\"args\":{\"statusBarIconBrightness\":\"Brightness.dark\"}}";
        assertEquals(Boolean.FALSE, PlatformMessages.darkFromOverlayStyle(lightJson));
        assertNull(PlatformMessages.darkFromOverlayStyle("{\"method\":\"x\",\"args\":{}}"));
    }

    @Test
    public void jsonNullValues() {
        assertNull(PlatformMessages.darkFromOverlayStyle("{\"method\":\"x\",\"args\":{\"statusBarIconBrightness\":null}}"));
        assertNull(PlatformMessages.gameIdFromNavigation("{\"method\":\"x\",\"args\":{\"uri\":null}}"));
    }

    @Test
    public void bannerTrueFalse() {
        assertEquals(Boolean.TRUE, PlatformMessages.bannerVisible(new byte[]{0x0C, 0x01, 0x01}));
        assertEquals(Boolean.FALSE, PlatformMessages.bannerVisible(new byte[]{0x0C, 0x01, 0x02}));
        assertNull(PlatformMessages.bannerVisible(new byte[]{}));
        assertNull(PlatformMessages.bannerVisible(null));
        assertNull(PlatformMessages.bannerVisible(new byte[]{0x0C, 0x01, 0x00}));
    }

    private static String nav(String uri) {
        return "{\"method\":\"routeInformationUpdated\",\"args\":{\"uri\":\"" + uri + "\",\"state\":null}}";
    }

    @Test
    public void gameRouteToleratesExtraSegmentsQueryAndHost() {
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromNavigation(nav("/game/123")));
        assertNull(PlatformMessages.gameIdFromNavigation(nav("/game/123/chat")));
        assertNull(PlatformMessages.gameIdFromNavigation(nav("/game/123/history")));
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromNavigation(nav("/game/123/")));
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromNavigation(nav("/game/123?x=1")));
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromNavigation(nav("/game/123#top")));
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromNavigation(nav("game/123")));
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromNavigation(nav("wordfeud://app/game/123")));
        assertEquals(Long.valueOf(123L), PlatformMessages.gameIdFromRoute(" /game/123 "));
        // older Flutter: "location" instead of "uri"
        assertEquals(Long.valueOf(5L), PlatformMessages.gameIdFromNavigation(
                "{\"method\":\"routeInformationUpdated\",\"args\":{\"location\":\"/game/5\"}}"));
    }

    @Test
    public void nonGameRoutesAreRejected() {
        for (String r : new String[] {"/", "/games/123", "/game/", "/game", "/game/abc", "/gameover/1",
                "/game/12x", "/chat/game/123", "/settings?game/1", "/game/1234567890123456789"}) {
            assertNull(r, PlatformMessages.gameIdFromNavigation(nav(r)));
        }
        assertNull(PlatformMessages.gameIdFromRoute(null));
    }

    @Test
    public void routeForDiagnosticsMasksQueryAndIsCapped() {
        assertEquals("/game/123", PlatformMessages.routeFromNavigation(nav("/game/123")));
        assertEquals("/game/123/chat?...", PlatformMessages.routeFromNavigation(nav("/game/123/chat?user=x#y")));
        assertEquals("/?...", PlatformMessages.routeFromNavigation(nav("/#frag")));
        StringBuilder b = new StringBuilder("/");
        for (int i = 0; i < 300; i++) b.append('a');
        assertEquals(PlatformMessages.MAX_ROUTE, PlatformMessages.routeFromNavigation(nav(b.toString())).length());
        assertNull(PlatformMessages.routeFromNavigation("{\"method\":\"x\",\"args\":{}}"));
        assertNull(PlatformMessages.routeFromNavigation(null));
    }
}
