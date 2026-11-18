package app.revanced.extension.rif;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import androidx.core.util.c;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CommentMediaTest {

    private static Set<String> set(String... markers) {
        return new HashSet<>(Arrays.asList(markers));
    }

    @Test
    public void findsMarkersAndKeepsOnlyKnownOnes() {
        String text = "hi\n\n![img](a.png)\n\ntext ![gif](b.gif) ![img](not known.png) ![x](y) ![img]() ![img](a(b).png)";
        List<CommentMedia.Marker> all = CommentMedia.findMarkers(text);
        assertEquals(4, all.size());
        assertEquals("![img](a.png)", all.get(0).text);
        assertFalse(all.get(0).gif);
        assertTrue(all.get(1).gif);
        assertEquals(text.indexOf("![img](a.png)"), all.get(0).start);
        assertEquals(all.get(0).start + "![img](a.png)".length(), all.get(0).end);

        List<CommentMedia.Marker> known = CommentMedia.knownMarkers(text, set("![img](a.png)", "![gif](b.gif)"));
        assertEquals(2, known.size());
        assertTrue(CommentMedia.knownMarkers(text, Collections.<String>emptySet()).isEmpty());
        assertTrue(CommentMedia.knownMarkers("plain *text*", set("![img](a.png)")).isEmpty());
        assertTrue(CommentMedia.findMarkers(null).isEmpty());
    }

    @Test
    public void namesAreMadeSafeAndShort() {
        assertEquals("IMG_2024.jpg", CommentMedia.sanitizeName("IMG_2024.jpg", false));
        assertEquals("my_photo_1_.png", CommentMedia.sanitizeName("my photo (1).png", false));
        String evil = CommentMedia.sanitizeName("a)b](c\n d.png", false);
        assertFalse(evil.contains(")") || evil.contains("]") || evil.contains("[") || evil.contains("(") || evil.contains("\n"));
        assertEquals("c.png", CommentMedia.sanitizeName("/storage/emulated/0/c.png", false));
        assertEquals("image.jpg", CommentMedia.sanitizeName(null, false));
        assertEquals("image.gif", CommentMedia.sanitizeName("", true));
        assertEquals("image.gif", CommentMedia.sanitizeName("()[]", true));
        String longName = CommentMedia.sanitizeName("abcdefghijklmnopqrstuvwxyz0123456789abcdefghij.jpeg", false);
        assertEquals(32, longName.length());
        assertTrue(longName.endsWith(".jpeg"));
        // A sanitised name always makes a marker the finder recognises.
        String marker = "![img](" + CommentMedia.sanitizeName("we(ird) [name]\r\n.png", false) + ")";
        assertEquals(1, CommentMedia.findMarkers(marker).size());
    }

    @Test
    public void duplicateNamesGetANumber() {
        assertEquals("![img](a.png)", CommentMedia.markerFor("a.png", false, set()));
        assertEquals("![img](a-2.png)", CommentMedia.markerFor("a.png", false, set("![img](a.png)")));
        assertEquals("![img](a-3.png)", CommentMedia.markerFor("a.png", false, set("![img](a.png)", "![img](a-2.png)")));
        assertEquals("![gif](x-2)", CommentMedia.markerFor("x", true, set("![gif](x)")));
    }

    @Test
    public void markerGetsAParagraphOfItsOwn() {
        assertArrayEquals(new String[] {"", "\n\n"}, CommentMedia.spacing("", ""));
        assertArrayEquals(new String[] {"\n\n", "\n\n"}, CommentMedia.spacing("hello", ""));
        assertArrayEquals(new String[] {"\n", "\n"}, CommentMedia.spacing("hello\n", "\nworld"));
        assertArrayEquals(new String[] {"", ""}, CommentMedia.spacing("hello\n\n", "\n\nworld"));
        assertArrayEquals(new String[] {"\n\n", "\n\n"}, CommentMedia.spacing("a", "b"));
    }

    @Test
    public void isolatesTheTokenBetweenBlankLines() {
        String m = "![img](a.png)";
        String t = "![img](abc123)";
        assertEquals(t + "\n\n", CommentMedia.isolate(m, 0, m.length(), t));
        String text = "**bold** " + m + " after";
        int s = text.indexOf(m);
        assertEquals("**bold**\n\n" + t + "\n\nafter", CommentMedia.isolate(text, s, s + m.length(), t));
        // Already on its own paragraph: unchanged apart from the token.
        text = "top\n\n" + m + "\n\n- a\n- b";
        s = text.indexOf(m);
        assertEquals("top\n\n" + t + "\n\n- a\n- b", CommentMedia.isolate(text, s, s + m.length(), t));
        // A single newline on each side becomes a blank line.
        text = "top\n" + m + "\nbottom";
        s = text.indexOf(m);
        assertEquals("top\n\n" + t + "\n\nbottom", CommentMedia.isolate(text, s, s + m.length(), t));
        // A quote mark in front of it on its line is dropped; trailing blanks are too.
        text = "> quoted\n> " + m + "   \n> more";
        s = text.indexOf(m);
        assertEquals("> quoted\n\n" + t + "\n\n> more", CommentMedia.isolate(text, s, s + m.length(), t));
        // After text on the line: the text moves on.
        text = "a\n\n" + m + "caption";
        s = text.indexOf(m);
        assertEquals("a\n\n" + t + "\n\ncaption", CommentMedia.isolate(text, s, s + m.length(), t));
    }

    @Test
    public void tokensAndExtensions() {
        assertEquals("![img](id1)", CommentMedia.token("id1", false));
        assertEquals("![gif](id1)", CommentMedia.token("id1", true));
        assertEquals("gif", CommentMedia.urlExtension("image/gif"));
        assertEquals("png", CommentMedia.urlExtension("image/png"));
        assertNull(CommentMedia.urlExtension("image/jpeg"));
        assertNull(CommentMedia.urlExtension("image/webp"));
    }

    @Test
    public void countsMediaBlocksInAConvertedDocument() throws Exception {
        JSONObject doc = new JSONObject("{\"document\":[{\"e\":\"par\",\"c\":[{\"e\":\"text\",\"t\":\"hi\"}]},"
                + "{\"e\":\"img\",\"id\":\"abc\"},{\"e\":\"blockquote\",\"c\":[{\"e\":\"par\",\"c\":[{\"e\":\"text\",\"t\":\"q\"}]}]}]}");
        assertArrayEquals(new int[] {1, 1}, CommentMedia.countMedia(doc, "abc", false));
        // Wrong id or wrong type: counted, but not ours.
        assertArrayEquals(new int[] {1, 0}, CommentMedia.countMedia(doc, "other", false));
        assertArrayEquals(new int[] {1, 0}, CommentMedia.countMedia(doc, "abc", true));
        JSONObject two = new JSONObject("{\"document\":[{\"e\":\"img\",\"id\":\"abc\"},{\"e\":\"gif\",\"id\":\"abc\"}]}");
        assertEquals(2, CommentMedia.countMedia(two, "abc", false)[0]);
        JSONObject none = new JSONObject("{\"document\":[{\"e\":\"par\",\"c\":[{\"e\":\"text\",\"t\":\"![img](abc)\"}]}]}");
        assertEquals(0, CommentMedia.countMedia(none, "abc", false)[0]);
    }

    @Test
    public void readsTheConvertedDocument() {
        assertNotNull(CommentMedia.convertedDocument("{\"output\":{\"document\":[]},\"output_mode\":\"rtjson\",\"assets\":[]}"));
        assertNull(CommentMedia.convertedDocument("{\"output\":\"text\"}"));
        assertNull(CommentMedia.convertedDocument("{\"json\":{\"errors\":[]}}"));
        assertNull(CommentMedia.convertedDocument("not json"));
    }

    @Test
    public void richtextReplacesTextInPlace() {
        @SuppressWarnings("unchecked")
        c<String, String>[] pairs = new c[] {c.a("thing_id", "t3_x"), c.a("text", "hello"), c.a("r", "sub")};
        c<String, String>[] out = CommentMedia.withRichtext(pairs, "{\"document\":[]}");
        assertEquals(3, out.length);
        assertEquals("thing_id", out[0].a);
        assertEquals("richtext_json", out[1].a);
        assertEquals("{\"document\":[]}", out[1].b);
        assertEquals("r", out[2].a);
        // The input is untouched, and no pair has a null value.
        assertEquals("text", pairs[1].a);
        for (c<String, String> p : out) assertNotNull(p.b);
    }

    private static final String FLAT = "{\"name\":\"t1_abc\",\"id\":\"abc\",\"parent_id\":\"t3_x\",\"link_id\":\"t3_x\","
            + "\"body\":\"Some **text**\\n\\n*Processing img ID123...*\",\"body_html\":\"<p>Some <strong>text</strong></p>\\n<p><em>Processing img ID123...</em></p>\","
            + "\"author\":\"me\"}";

    @Test
    public void wrapsAFlatCommentAndRewritesThePlaceholder() throws Exception {
        String wrapped = CommentMedia.wrapComment(FLAT, "ID123", "png");
        assertNotNull(wrapped);
        JSONObject json = new JSONObject(wrapped).getJSONObject("json");
        assertEquals(0, json.getJSONArray("errors").length());
        JSONObject thing = json.getJSONObject("data").getJSONArray("things").getJSONObject(0);
        assertEquals("t1", thing.getString("kind"));
        JSONObject data = thing.getJSONObject("data");
        assertEquals("t1_abc", data.getString("name"));
        assertEquals("Some **text**\n\nhttps://i.redd.it/ID123.png", data.getString("body"));
        assertEquals("<p>Some <strong>text</strong></p>\n<p><a href=\"https://i.redd.it/ID123.png\">https://i.redd.it/ID123.png</a></p>",
                data.getString("body_html"));
    }

    @Test
    public void keepsThePlaceholderWithoutAnExtension() throws Exception {
        String wrapped = CommentMedia.wrapComment(FLAT, "ID123", null);
        JSONObject data = new JSONObject(wrapped).getJSONObject("json").getJSONObject("data")
                .getJSONArray("things").getJSONObject(0).getJSONObject("data");
        assertEquals("Some **text**\n\n*Processing img ID123...*", data.getString("body"));
    }

    @Test
    public void rewritesAnEntityEscapedPlaceholderToo() {
        String escaped = "&lt;p&gt;&lt;em&gt;Processing gif ID9...&lt;/em&gt;&lt;/p&gt;";
        assertEquals("&lt;p&gt;&lt;a href=&quot;https://i.redd.it/ID9.gif&quot;&gt;https://i.redd.it/ID9.gif&lt;/a&gt;&lt;/p&gt;",
                CommentMedia.rewritePlaceholder(escaped, "ID9", "https://i.redd.it/ID9.gif", true));
        // Another id's placeholder, and a body without one, stay as they are.
        assertEquals("*Processing img OTHER...*",
                CommentMedia.rewritePlaceholder("*Processing img OTHER...*", "ID9", "u", false));
        assertEquals("plain $1 \\ text", CommentMedia.rewritePlaceholder("plain $1 \\ text", "ID9", "u", false));
    }

    @Test
    public void detectsThePlaceholder() {
        assertTrue(CommentMedia.hasPlaceholder("Some **text**\n\n*Processing img ID123...*"));
        assertTrue(CommentMedia.hasPlaceholder("*Processing gif abc9...*"));
        assertFalse(CommentMedia.hasPlaceholder("Some text https://preview.redd.it/x.jpeg?width=1&s=2"));
        assertFalse(CommentMedia.hasPlaceholder("Processing img x..."));
        assertFalse(CommentMedia.hasPlaceholder(null));
    }

    @Test
    public void findsThePollTarget() {
        assertArrayEquals(new String[] {"1xpucoq", "abc"}, CommentMedia.pollTarget(FLAT.replace("t3_x", "t3_1xpucoq")));
        assertArrayEquals(new String[] {"x", "abc"}, CommentMedia.pollTarget("{\"name\":\"t1_abc\",\"link_id\":\"t3_x\"}"));
        // Comment ids are 13 characters long now.
        assertArrayEquals(new String[] {"1xpucoq", "19shn2b3a870h"},
                CommentMedia.pollTarget("{\"id\":\"19shn2b3a870h\",\"name\":\"t1_19shn2b3a870h\",\"link_id\":\"t3_1xpucoq\"}"));
        assertNull(CommentMedia.pollTarget("{\"id\":\"abc\"}"));
        assertNull(CommentMedia.pollTarget("{\"id\":\"a/../b\",\"link_id\":\"t3_x\"}"));
        assertNull(CommentMedia.pollTarget("{\"json\":{}}"));
        assertNull(CommentMedia.pollTarget("nope"));
    }

    private static final String LISTING = "[{\"kind\":\"Listing\",\"data\":{\"children\":[{\"kind\":\"t3\",\"data\":{\"id\":\"x\"}}]}},"
            + "{\"kind\":\"Listing\",\"data\":{\"children\":[{\"kind\":\"t1\",\"data\":{\"id\":\"other\",\"body\":\"no\"}},"
            + "{\"kind\":\"t1\",\"data\":{\"id\":\"abc\",\"body\":\"Some **text**\\n\\n[img](https://preview.redd.it/ID123.jpeg?width=640&format=pjpg&auto=webp&s=ff)\","
            + "\"body_html\":\"<div class=\\\"md\\\"><p>Some <strong>text</strong></p>\\n<p><a href=\\\"https://preview.redd.it/ID123.jpeg?width=640&amp;s=ff\\\">x</a></p></div>\"}}]}}]";

    @Test
    public void picksTheCommentOutOfTheListing() {
        JSONObject c = CommentMedia.commentFromListing(LISTING, "abc");
        assertNotNull(c);
        assertTrue(c.optString("body").startsWith("Some **text**"));
        assertNull(CommentMedia.commentFromListing(LISTING, "zzz"));
        assertNull(CommentMedia.commentFromListing("[{}]", "abc"));
        assertNull(CommentMedia.commentFromListing("{\"json\":1}", "abc"));
        assertNull(CommentMedia.commentFromListing("garbage", "abc"));
    }

    @Test
    public void mergesTheProcessedBodyIntoTheReply() throws Exception {
        JSONObject processed = CommentMedia.commentFromListing(LISTING, "abc");
        String merged = CommentMedia.mergeProcessed(FLAT, processed);
        JSONObject o = new JSONObject(merged);
        assertEquals(processed.getString("body"), o.getString("body"));
        assertEquals(processed.getString("body_html"), o.getString("body_html"));
        assertEquals("t1_abc", o.getString("name"));
        assertEquals("me", o.getString("author"));
        // The merged reply is wrapped and keeps its processed link (no placeholder left to rewrite).
        JSONObject data = new JSONObject(CommentMedia.wrapComment(merged, "ID123", null)).getJSONObject("json")
                .getJSONObject("data").getJSONArray("things").getJSONObject(0).getJSONObject("data");
        assertEquals(processed.getString("body"), data.getString("body"));
    }

    @Test
    public void keepsTheReplyWhenNothingIsProcessedYet() throws Exception {
        JSONObject still = new JSONObject(FLAT).put("id", "abc");
        assertEquals(FLAT, CommentMedia.mergeProcessed(FLAT, still));
        assertEquals(FLAT, CommentMedia.mergeProcessed(FLAT, new JSONObject("{\"id\":\"abc\"}")));
        assertEquals(FLAT, CommentMedia.mergeProcessed(FLAT, new JSONObject("{\"body\":\"x\"}")));
    }

    @Test
    public void leavesWrappedAndForeignRepliesAlone() {
        // Already wrapped (also with errors): rif shows Reddit's message itself.
        assertNull(CommentMedia.wrapComment("{\"json\":{\"errors\":[[\"RATELIMIT\",\"slow down\",\"ratelimit\"]]}}", "ID123", "png"));
        assertNull(CommentMedia.wrapComment("{\"json\":{\"errors\":[],\"data\":{\"things\":[]}}}", "ID123", "png"));
        assertNull(CommentMedia.wrapComment("not json", "ID123", "png"));
        assertNull(CommentMedia.wrapComment("{\"something\":1}", "ID123", "png"));
        assertEquals("RATELIMIT: slow down",
                CommentMedia.firstError("{\"json\":{\"errors\":[[\"RATELIMIT\",\"slow down\",\"ratelimit\"]]}}"));
        assertNull(CommentMedia.firstError("{\"json\":{\"errors\":[]}}"));
        assertNull(CommentMedia.firstError(FLAT));
    }

    @Test
    public void readsTheSubsMediaRules() {
        String about = "{\"data\":{\"comment_contribution_settings\":{\"allowed_media_types\":[\"static\",\"giphy\"]}}}";
        List<String> types = CommentMedia.allowedMediaTypes(about);
        assertEquals(Arrays.asList("static", "giphy"), types);
        assertTrue(CommentMedia.allows(types, false));
        assertFalse(CommentMedia.allows(types, true));
        assertTrue(CommentMedia.allowsAny(types));
        List<String> none = CommentMedia.allowedMediaTypes("{\"data\":{\"comment_contribution_settings\":{\"allowed_media_types\":[]}}}");
        assertEquals(0, none.size());
        assertFalse(CommentMedia.allowsAny(none));
        // Unknown (no setting, bad reply): allowed.
        assertNull(CommentMedia.allowedMediaTypes("{\"data\":{}}"));
        assertNull(CommentMedia.allowedMediaTypes("{\"data\":{\"comment_contribution_settings\":{}}}"));
        assertNull(CommentMedia.allowedMediaTypes("<html>"));
        assertTrue(CommentMedia.allows(null, true));
        assertTrue(CommentMedia.allowsAny(null));
        assertTrue(CommentMedia.isProfileSub("u_someone"));
        assertTrue(CommentMedia.isProfileSub("U_Someone"));
        assertFalse(CommentMedia.isProfileSub("mojitesting"));
        assertFalse(CommentMedia.isProfileSub(null));
    }

    @Test
    public void recordsSurviveAJsonRoundTripAndExpire() {
        long now = 10L * 24 * 3600 * 1000;
        java.util.ArrayList<CommentMedia.Rec> recs = new java.util.ArrayList<>();
        recs.add(new CommentMedia.Rec("![img](old.png)", "content://x/1", "image/png", now - 8L * 24 * 3600 * 1000));
        for (int i = 0; i < 55; i++) {
            recs.add(new CommentMedia.Rec("![img](f" + i + ".png)", "content://x/" + (i + 10), "image/png", now - 1000 + i));
        }
        List<CommentMedia.Rec> kept = CommentMedia.prune(recs, now);
        assertEquals(50, kept.size());
        assertEquals("![img](f5.png)", kept.get(0).marker);
        assertEquals("![img](f54.png)", kept.get(49).marker);
        List<CommentMedia.Rec> back = CommentMedia.recsFromJson(CommentMedia.recsToJson(kept));
        assertEquals(50, back.size());
        assertEquals("content://x/15", back.get(0).uri);
        assertEquals("image/png", back.get(0).mime);
        assertEquals(kept.get(3).at, back.get(3).at);
        assertTrue(CommentMedia.recsFromJson("garbage").isEmpty());
    }

    // ---------------------------------------------------------------- edits

    private static final String PNG_URL =
            "https://preview.redd.it/g96cjnoli30i1.png?width=64&format=png&auto=webp&s=559591e0aa460b2b55bca84c580ead62e3e39021";

    @Test
    public void ownMediaComesFromRtjsonThenMediaMetadata() throws Exception {
        JSONObject c = new JSONObject("{\"rtjson\":{\"document\":[{\"e\":\"par\",\"c\":[{\"e\":\"text\",\"t\":\"hi\"}]},"
                + "{\"e\":\"img\",\"id\":\"g96cjnoli30i1\"}]},\"media_metadata\":{\"g96cjnoli30i1\":"
                + "{\"status\":\"valid\",\"e\":\"Image\",\"m\":\"image/png\"}}}");
        CommentMedia.Own own = CommentMedia.ownMedia(c);
        assertEquals("g96cjnoli30i1", own.id);
        assertFalse(own.gif);
        assertEquals("image/png", own.mime);

        // rtjson as a string, a GIF block, nested in a quote.
        c = new JSONObject();
        c.put("rtjson", "{\"document\":[{\"e\":\"blockquote\",\"c\":[{\"e\":\"gif\",\"id\":\"abc\"}]}]}");
        own = CommentMedia.ownMedia(c);
        assertEquals("abc", own.id);
        assertTrue(own.gif);
        assertEquals("", own.mime);

        // rtjson without media: none, whatever media_metadata says.
        c = new JSONObject("{\"rtjson\":{\"document\":[{\"e\":\"par\",\"c\":[{\"e\":\"text\",\"t\":\"x\"}]}]},"
                + "\"media_metadata\":{\"zz\":{\"e\":\"Image\"}}}");
        assertNull(CommentMedia.ownMedia(c));

        // No rtjson: the single media_metadata entry.
        c = new JSONObject("{\"media_metadata\":{\"q1\":{\"e\":\"AnimatedImage\",\"m\":\"image/gif\"}}}");
        own = CommentMedia.ownMedia(c);
        assertEquals("q1", own.id);
        assertTrue(own.gif);
        assertNull(CommentMedia.ownMedia(new JSONObject("{\"media_metadata\":{\"a\":{\"e\":\"Image\"},\"b\":{\"e\":\"Image\"}}}")));
        assertNull(CommentMedia.ownMedia(new JSONObject("{\"body\":\"x\"}")));
        assertNull(CommentMedia.ownMedia(null));
    }

    @Test
    public void findsTheOwnReferenceInEveryForm() {
        String id = "g96cjnoli30i1";
        String text = "richtext test\n\n" + PNG_URL;
        int[] r = CommentMedia.findOwnRef(text, id);
        assertEquals(text.indexOf("https"), r[0]);
        assertEquals(text.length(), r[1]);

        assertNotNull(CommentMedia.findOwnRef("a\n\nhttps://i.redd.it/" + id + ".gif\n\nb", id));
        // Scheme and host in any case (a phone keyboard's "Https://"), but not the id.
        assertNotNull(CommentMedia.findOwnRef("Https://i.redd.it/" + id + ".png", id));
        assertNotNull(CommentMedia.findOwnRef("[x](HTTPS://I.REDD.IT/" + id + ".png)", id));
        assertNull(CommentMedia.findOwnRef("https://i.redd.it/" + id.toUpperCase() + ".png", id));
        assertTrue(CommentMedia.hasMediaCandidate("Https://i.redd.it/" + id + ".png"));
        assertNotNull(CommentMedia.findOwnRef("*Processing img " + id + "...*", id));
        assertNotNull(CommentMedia.findOwnRef("![gif](" + id + ")", id));
        String link = "[my pic](" + PNG_URL + ")";
        r = CommentMedia.findOwnRef("x " + link + " y", id);
        assertEquals(2, r[0]);
        assertEquals(2 + link.length(), r[1]);
        r = CommentMedia.findOwnRef("<" + PNG_URL + ">", id);
        assertEquals(0, r[0]);

        // Another id, another host, or the id alone are not the comment's image.
        assertNull(CommentMedia.findOwnRef("https://i.redd.it/other123.gif", id));
        assertNull(CommentMedia.findOwnRef("https://example.com/" + id + ".png", id));
        assertNull(CommentMedia.findOwnRef("just " + id, id));
        assertNull(CommentMedia.findOwnRef("https://i.redd.it/" + id + "x.png", id));
        assertNull(CommentMedia.findOwnRef(text, ""));
    }

    @Test
    public void spotsWhatCouldBeMedia() {
        assertTrue(CommentMedia.hasMediaCandidate("x\n\n" + PNG_URL));
        assertTrue(CommentMedia.hasMediaCandidate("https://i.redd.it/abc.gif"));
        assertTrue(CommentMedia.hasMediaCandidate("*Processing gif abc...*"));
        assertTrue(CommentMedia.hasMediaCandidate("![img](abc)"));
        assertFalse(CommentMedia.hasMediaCandidate("plain **text** with https://example.com/a.png"));
        assertFalse(CommentMedia.hasMediaCandidate("https://v.redd.it/abc"));
        assertFalse(CommentMedia.hasMediaCandidate(null));
    }

    @Test
    public void keepingRewritesTheReferenceAsATokenParagraph() {
        String id = "g96cjnoli30i1";
        String text = "**bold** intro\n\n" + PNG_URL + "\n\n> quote";
        int[] r = CommentMedia.findOwnRef(text, id);
        assertEquals("**bold** intro\n\n![img](" + id + ")\n\n> quote",
                CommentMedia.isolate(text, r[0], r[1], CommentMedia.token(id, false)));
        String inline = "see " + "https://i.redd.it/" + id + ".gif" + " here";
        r = CommentMedia.findOwnRef(inline, id);
        assertEquals("see\n\n![gif](" + id + ")\n\nhere", CommentMedia.isolate(inline, r[0], r[1], CommentMedia.token(id, true)));
    }

    @Test
    public void linkIdComesFromTheArgsOrAPostParent() {
        assertEquals("1xpucoq", CommentMedia.linkId36("t3_1xpucoq", "t1_abc"));
        assertEquals("1xpucoq", CommentMedia.linkId36(null, "t3_1xpucoq"));
        assertNull(CommentMedia.linkId36(null, "t1_abc"));
        assertNull(CommentMedia.linkId36("t3_BAD/../x", null));
        assertNull(CommentMedia.linkId36(null, null));
    }

    @Test
    public void editPlans() {
        assertEquals(CommentMedia.EditPlan.UNCHANGED, CommentMedia.editPlan(false, false));
        assertEquals(CommentMedia.EditPlan.KEEP, CommentMedia.editPlan(true, false));
        assertEquals(CommentMedia.EditPlan.NEW, CommentMedia.editPlan(false, true));
        assertEquals(CommentMedia.EditPlan.CONFLICT, CommentMedia.editPlan(true, true));
    }
}
