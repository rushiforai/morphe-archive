package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Saved filter profiles as they round-trip through preferences. */
public class FiltersTest {
    @Test
    public void unreadableOrForeignJsonIsRejectedPerEntry() {
        assertNull(Filters.parse("not json"));
        Filters.State s = Filters.parse("{\"profiles\":["
                + "{\"id\":\"default\",\"name\":\"\",\"rules\":{\"locations\":[\"Germany\"]}},"
                + "{\"id\":\"work\",\"name\":\"Work\",\"rules\":{\"highlight\":false}},"
                + "{\"id\":\"work\",\"name\":\"Duplicate id\",\"rules\":{}},"
                + "{\"id\":\"bad id!\",\"name\":\"Bad\",\"rules\":{}},"
                + "{\"id\":\"same\",\"name\":\"work\",\"rules\":{}},"
                + "{\"id\":\"norules\",\"name\":\"No rules\"}],"
                + "\"accounts\":{\"12\":\"work\",\"13\":\"gone\",\"x\":\"work\",\"-4\":\"work\"},"
                + "\"editor\":\"gone\"}");
        assertNotNull(s);
        assertEquals("Default", s.name("default"));
        assertTrue(s.rules("default").locationKeys.contains("germany"));
        assertFalse(s.rules("work").highlight);
        assertEquals(2, s.size());
        assertEquals("work", s.profileFor(12));
        assertEquals("default", s.profileFor(13));
        assertEquals("default", s.editor());
    }

    @Test
    public void aMissingDefaultProfileIsRecreatedFirst() {
        Filters.State s = Filters.parse("{\"profiles\":[{\"id\":\"work\",\"name\":\"Work\",\"rules\":{}}]}");
        assertNotNull(s);
        assertEquals(2, s.size());
        assertTrue(s.rules("default").isEmpty());
        assertEquals("Work", s.name("work"));
    }

    @Test
    public void accountsWithoutAChoiceUseTheLastSelectedProfile() {
        Filters.State s = Filters.parse("{\"profiles\":["
                + "{\"id\":\"default\",\"name\":\"Default\",\"rules\":{}},"
                + "{\"id\":\"us\",\"name\":\"US\",\"rules\":{\"locations\":[\"United States\"]}}],"
                + "\"accounts\":{\"12\":\"default\"},\"editor\":\"us\"}");
        assertEquals("default", s.profileFor(12));
        // Selected while X-Posed didn't know the account yet: it still applies once it does.
        assertEquals("us", s.profileFor(99));
        assertEquals("us", s.profileFor(0));
    }

    @Test
    public void savedProfilesRoundTrip() {
        Filters.State s = Filters.parse("{\"profiles\":["
                + "{\"id\":\"default\",\"name\":\"Default\",\"rules\":{}},"
                + "{\"id\":\"p1\",\"name\":\"News \uD83D\uDCF0\",\"rules\":{\"names\":[\"bot\"],\"highlight\":false}}],"
                + "\"accounts\":{\"99\":\"p1\"},\"editor\":\"p1\"}");
        Filters.State copy = Filters.parse(s.toJson());
        assertEquals(s.toJson(), copy.toJson());
        assertEquals("News \uD83D\uDCF0", copy.name("p1"));
        assertEquals("p1", copy.profileFor(99));
        assertEquals("p1", copy.editor());
    }
}
