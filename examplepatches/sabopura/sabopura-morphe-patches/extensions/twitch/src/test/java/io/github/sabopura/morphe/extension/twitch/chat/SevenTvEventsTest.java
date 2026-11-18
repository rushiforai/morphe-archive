package io.github.sabopura.morphe.extension.twitch.chat;

import org.json.JSONObject;
import org.junit.Test;

import static org.junit.Assert.*;

public class SevenTvEventsTest {
    private static String cosmetic(String id, String file) {
        return "{\"op\":0,\"d\":{\"type\":\"cosmetic.create\",\"body\":{\"object\":{\"kind\":\"BADGE\",\"data\":{\"id\":\"" + id
                + "\",\"tooltip\":\"Ace\",\"host\":{\"url\":\"//cdn.7tv.app/badge/" + id + "\",\"files\":[" + file + "]}}}}}}";
    }

    private static String entitlement(String type, String badge, String twitchId) {
        return "{\"op\":0,\"d\":{\"type\":\"" + type + "\",\"body\":{\"object\":{\"kind\":\"BADGE\",\"ref_id\":\"" + badge
                + "\",\"user\":{\"connections\":[{\"platform\":\"YOUTUBE\",\"id\":\"x\"},{\"platform\":\"TWITCH\",\"id\":\"" + twitchId + "\"}]}}}}}";
    }

    private static String paint(String id, String function) {
        return "{\"op\":0,\"d\":{\"type\":\"cosmetic.create\",\"body\":{\"object\":{\"kind\":\"PAINT\",\"data\":{\"id\":\"" + id
                + "\",\"name\":\"Candy\",\"color\":null,\"function\":\"" + function + "\",\"angle\":45,\"repeat\":false,"
                + "\"stops\":[{\"at\":0,\"color\":-16776961},{\"at\":1,\"color\":65535}],\"shadows\":[]}}}}}";
    }

    private static final String FILES = "{\"name\":\"1x.webp\",\"width\":18},{\"name\":\"2x.webp\",\"width\":36},{\"name\":\"3x.webp\",\"width\":54},{\"name\":\"4x.webp\",\"width\":72}";

    @Test public void aHolderGetsTheBadgeDefinedByACosmeticEvent() {
        SevenTvEvents events = new SevenTvEvents();
        assertEquals(SevenTvEvents.CHANGED, events.handle(cosmetic("b1", FILES)));
        assertEquals(SevenTvEvents.CHANGED, events.handle(entitlement("entitlement.create", "b1", "123")));
        ChatMetadata.Badge badge = events.badgeOf("123");
        assertEquals("Ace", badge.title);
        assertEquals("https://cdn.7tv.app/badge/b1/3x.webp", badge.url);
    }

    @Test public void entitlementDeleteRemovesTheHolder() {
        SevenTvEvents events = new SevenTvEvents();
        events.handle(cosmetic("b1", FILES));
        events.handle(entitlement("entitlement.create", "b1", "123"));
        assertEquals(SevenTvEvents.CHANGED, events.handle(entitlement("entitlement.delete", "b1", "123")));
        assertNull(events.badgeOf("123"));
    }

    @Test public void aHolderGetsThePaintDefinedByACosmeticEvent() {
        SevenTvEvents events = new SevenTvEvents();
        assertEquals(SevenTvEvents.PAINTS_CHANGED, events.handle(paint("p1", "LINEAR_GRADIENT")));
        assertNull("the paint has no holder yet", events.paintOf("123"));
        String entitlement = entitlement("entitlement.create", "p1", "123").replace("BADGE", "PAINT");
        assertEquals(SevenTvEvents.PAINTS_CHANGED, events.handle(entitlement));
        assertEquals(SevenTvEvents.KEEP, events.handle(entitlement));
        assertEquals(NamePaint.LINEAR, events.paintOf("123").function);
        assertNull(events.badgeOf("123"));
    }

    @Test public void entitlementDeleteTakesThePaintAway() {
        SevenTvEvents events = new SevenTvEvents();
        events.handle(paint("p1", "LINEAR_GRADIENT"));
        events.handle(entitlement("entitlement.create", "p1", "123").replace("BADGE", "PAINT"));
        assertEquals(SevenTvEvents.PAINTS_CHANGED,
                events.handle(entitlement("entitlement.delete", "p1", "123").replace("BADGE", "PAINT")));
        assertNull(events.paintOf("123"));
    }

    @Test public void aBadgeAndAPaintOfOneChatterAreKeptApart() {
        SevenTvEvents events = new SevenTvEvents();
        events.handle(cosmetic("b1", FILES));
        events.handle(paint("p1", "RADIAL_GRADIENT"));
        events.handle(entitlement("entitlement.create", "b1", "123"));
        events.handle(entitlement("entitlement.create", "p1", "123").replace("BADGE", "PAINT"));
        assertEquals("Ace", events.badgeOf("123").title);
        assertEquals(NamePaint.RADIAL, events.paintOf("123").function);
        // Taking the badge away leaves the paint, and a paint is not found under a badge's ID.
        events.handle(entitlement("entitlement.delete", "b1", "123"));
        assertNull(events.badgeOf("123"));
        assertNotNull(events.paintOf("123"));
        events.handle(entitlement("entitlement.create", "b1", "456").replace("BADGE", "PAINT"));
        assertNull(events.paintOf("456"));
    }

    @Test public void aPaintSentAgainChangesTheRowsOnlyWhenItsLookChanged() {
        SevenTvEvents events = new SevenTvEvents();
        events.handle(paint("p1", "LINEAR_GRADIENT"));
        events.handle(entitlement("entitlement.create", "p1", "123").replace("BADGE", "PAINT"));
        assertEquals(SevenTvEvents.KEEP, events.handle(paint("p1", "LINEAR_GRADIENT")));
        assertEquals(SevenTvEvents.PAINTS_CHANGED, events.handle(paint("p1", "LINEAR_GRADIENT").replace("\"angle\":45", "\"angle\":90")));
        assertEquals(90, events.paintOf("123").angle, 0);
    }

    @Test public void aPaintThatCannotBeDrawnLeavesTheNameAsItWas() {
        SevenTvEvents events = new SevenTvEvents();
        assertEquals(SevenTvEvents.KEEP, events.handle(paint("p1", "CONIC_GRADIENT")));
        events.handle(entitlement("entitlement.create", "p1", "123").replace("BADGE", "PAINT"));
        assertNull(events.paintOf("123"));
        // A drawable paint that 7TV changes into one that is not is taken off its holders.
        events.handle(paint("p1", "LINEAR_GRADIENT"));
        assertNotNull(events.paintOf("123"));
        assertEquals(SevenTvEvents.PAINTS_CHANGED, events.handle(paint("p1", "CONIC_GRADIENT")));
        assertNull(events.paintOf("123"));
    }

    @Test public void chattersWithoutATwitchConnectionAreIgnored() {
        SevenTvEvents events = new SevenTvEvents();
        events.handle(cosmetic("b1", FILES));
        assertEquals(SevenTvEvents.KEEP, events.handle("{\"op\":0,\"d\":{\"type\":\"entitlement.create\",\"body\":{\"object\":"
                + "{\"kind\":\"BADGE\",\"ref_id\":\"b1\",\"user\":{\"connections\":[{\"platform\":\"YOUTUBE\",\"id\":\"9\"}]}}}}}"));
        assertNull(events.badgeOf("9"));
    }

    @Test public void reconnectAndEndOpcodesEndTheSession() {
        SevenTvEvents events = new SevenTvEvents();
        assertEquals(SevenTvEvents.RECONNECT, events.handle("{\"op\":4}"));
        assertEquals(SevenTvEvents.RECONNECT, events.handle("{\"op\":7}"));
        assertEquals(SevenTvEvents.KEEP, events.handle("{\"op\":2}"));
        assertEquals(SevenTvEvents.KEEP, events.handle("not json"));
    }

    @Test public void otherCosmeticsAreIgnoredAndNonCdnHostsRejected() {
        SevenTvEvents events = new SevenTvEvents();
        assertEquals(SevenTvEvents.KEEP, events.handle("{\"op\":0,\"d\":{\"type\":\"cosmetic.create\",\"body\":{\"object\":{\"kind\":\"AVATAR\",\"data\":{\"id\":\"a1\"}}}}}"));
        assertEquals(SevenTvEvents.KEEP, events.handle("{\"op\":0,\"d\":{\"type\":\"cosmetic.create\",\"body\":{\"object\":{\"kind\":\"PAINT\"}}}}"));
        assertEquals(SevenTvEvents.KEEP, events.handle(cosmetic("b2", FILES).replace("//cdn.7tv.app/", "//evil.example/")));
    }

    @Test public void subscriptionNamesTheChannelNotAChatter() throws Exception {
        JSONObject message = new JSONObject(SevenTvEvents.subscribe("entitlement.*", "4242"));
        assertEquals(35, message.getInt("op"));
        JSONObject condition = message.getJSONObject("d").getJSONObject("condition");
        assertEquals("4242", condition.getString("id"));
        assertEquals("channel", condition.getString("ctx"));
        assertEquals("TWITCH", condition.getString("platform"));
    }
}
