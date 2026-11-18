package app.revanced.extension.rif;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import androidx.core.util.c;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SelfPostMediaTest {

    private static final String TEXT =
            "Intro with **bold**\n\n![img](a.png)\n\nmiddle ![gif](b.gif) tail\n\n> quoted\n> ![img](c.jpg)\n\nend";

    private static List<CommentMedia.Marker> markers(String text) {
        Set<String> known = new HashSet<>(Arrays.asList("![img](a.png)", "![gif](b.gif)", "![img](c.jpg)"));
        return CommentMedia.knownMarkers(text, known);
    }

    @Test
    public void severalMarkersBecomeAssetTokensOnTheirOwnParagraphs() {
        List<CommentMedia.Marker> found = markers(TEXT);
        assertEquals(3, found.size());
        String swapped = SelfPostMedia.swapMarkers(TEXT, found, Arrays.asList(
                CommentMedia.token("idA", false), CommentMedia.token("idB", true), CommentMedia.token("idC", false)));
        assertEquals(
                "Intro with **bold**\n\n![img](idA)\n\nmiddle\n\n![gif](idB)\n\ntail\n\n> quoted\n\n![img](idC)\n\nend",
                swapped);
        // No marker text is left, and the other text is kept in order.
        assertFalse(swapped.contains("a.png") || swapped.contains("b.gif") || swapped.contains("c.jpg"));
    }

    @Test
    public void flattenedTextHasBareLinksOnTheirOwnLines() {
        List<CommentMedia.Marker> found = markers(TEXT);
        List<String> urls = Arrays.asList(
                SelfPostMedia.imageUrl("idA", "image/png"),
                SelfPostMedia.imageUrl("idB", "image/gif"),
                SelfPostMedia.imageUrl("idC", "image/jpeg"));
        String flat = SelfPostMedia.swapMarkers(TEXT, found, urls);
        assertEquals("Intro with **bold**\n\nhttps://i.redd.it/idA.png\n\nmiddle\n\nhttps://i.redd.it/idB.gif\n\ntail\n\n"
                + "> quoted\n\nhttps://i.redd.it/idC." + SelfPostMedia.JPEG_EXT + "\n\nend", flat);
    }

    @Test
    public void adjacentMarkersStaySeparate() {
        String text = "![img](a.png)![gif](b.gif)";
        List<CommentMedia.Marker> found = markers(text);
        assertEquals(2, found.size());
        String swapped = SelfPostMedia.swapMarkers(text, found, Arrays.asList("![img](x)", "![gif](y)"));
        assertEquals("![img](x)\n\n![gif](y)", swapped);
    }

    @Test
    public void aSingleMarkerAloneIsJustTheToken() {
        String text = "![img](a.png)";
        assertEquals("![img](x)", SelfPostMedia.swapMarkers(text, markers(text), Arrays.asList("![img](x)")));
        assertEquals("a\n\n![img](x)", SelfPostMedia.swapMarkers("a ![img](a.png)", markers("a ![img](a.png)"), Arrays.asList("![img](x)")));
    }

    @Test(expected = IllegalArgumentException.class)
    public void swapNeedsOneReplacementPerMarker() {
        SelfPostMedia.swapMarkers(TEXT, markers(TEXT), new ArrayList<String>());
    }

    @Test
    public void markersGoInTextLinkAndImagePosts() {
        // Video posts too (emulator check 2026-11-15: the body's image attaches and flattens on a v.redd.it post).
        for (String kind : new String[] {"self", "link", "image", "video", "videogif"}) {
            assertTrue(kind, SelfPostMedia.takesImages(kind));
            assertNull(kind, SelfPostMedia.refusal(kind, true));
            assertNull(kind, SelfPostMedia.refusal(kind, false));
        }
        assertEquals(SelfPostMedia.SEND_REFUSED, SelfPostMedia.refusal(null, true));
        assertEquals(SelfPostMedia.SEND_REFUSED, SelfPostMedia.refusal("crosspost", true));
    }

    @Test
    public void everyKindSendsTheSameMarkdownBody() {
        // One path for all kinds: the text parameter holds the markers as media tokens, nothing else changes.
        List<CommentMedia.Marker> found = markers(TEXT);
        List<String> ids = Arrays.asList("idA", "idB", "idC");
        List<Boolean> gifs = Arrays.asList(false, true, false);
        String body = SelfPostMedia.attachBody(TEXT, found, ids, gifs);
        assertEquals("Intro with **bold**\n\n![img](idA)\n\nmiddle\n\n![gif](idB)\n\ntail\n\n> quoted\n\n![img](idC)\n\nend", body);
        @SuppressWarnings("unchecked")
        c<String, String>[] pairs = new c[] {c.a("kind", "link"), c.a("sr", "MojiTesting"), c.a("text", TEXT),
                c.a("title", "t"), c.a("url", "https://example.com/")};
        for (String kind : new String[] {"self", "link", "image"}) {
            pairs[0] = c.a("kind", kind);
            c<String, String>[] out = SelfPostMedia.withText(pairs, body);
            assertEquals(pairs.length, out.length);
            assertEquals(kind, out[0].b);
            assertEquals("text", out[2].a);
            assertEquals(body, out[2].b);
            assertEquals("https://example.com/", out[4].b);
            for (c<String, String> p : out) assertFalse(p.a.equals("richtext_json"));
        }
        assertEquals(TEXT, pairs[2].b);
        assertTrue(SelfPostMedia.withText(new c[] {c.a("kind", "link")}, "x").length == 1);
    }

    @Test
    public void linkExtensionFollowsTheUploadedType() {
        assertEquals("png", SelfPostMedia.flattenExtension("image/png"));
        assertEquals("gif", SelfPostMedia.flattenExtension("image/gif"));
        assertEquals(SelfPostMedia.JPEG_EXT, SelfPostMedia.flattenExtension("image/jpeg"));
        // WebP is transcoded to JPEG by Reddit; a shrunk still is a JPEG; unknown falls back to JPEG.
        assertEquals(SelfPostMedia.JPEG_EXT, SelfPostMedia.flattenExtension("image/webp"));
        assertEquals(SelfPostMedia.JPEG_EXT, SelfPostMedia.flattenExtension(null));
        assertEquals("https://i.redd.it/abc123.png", SelfPostMedia.imageUrl("abc123", "image/png"));
    }

    @Test
    public void flattenFormCarriesThePostAndTheEncodedText() {
        String form = SelfPostMedia.flattenForm("t3_abc", "a & b\nhttps://i.redd.it/x.png");
        assertEquals("api_type=json&thing_id=t3_abc&text=a+%26+b%0Ahttps%3A%2F%2Fi.redd.it%2Fx.png", form);
    }

    @Test
    public void postNameFromTheSubmitReply() {
        assertEquals("t3_abc12", SelfPostMedia.postName(
                "{\"json\":{\"errors\":[],\"data\":{\"url\":\"https://x/\",\"id\":\"abc12\",\"name\":\"t3_abc12\"}}}"));
        assertEquals("t3_abc12", SelfPostMedia.postName("{\"json\":{\"errors\":[],\"data\":{\"id\":\"abc12\"}}}"));
        String refused = "{\"json\":{\"errors\":[[\"SUBREDDIT_NOEXIST\",\"that subreddit doesn't exist\",\"sr\"]]}}";
        assertNull(SelfPostMedia.postName(refused));
        assertTrue(SelfPostMedia.hasErrors(refused));
        assertNull(SelfPostMedia.postName("{\"json\":{\"errors\":[],\"data\":{\"name\":\"../evil\"}}}"));
        assertNull(SelfPostMedia.postName("garbage"));
        assertFalse(SelfPostMedia.hasErrors("{\"json\":{\"errors\":[]}}"));
    }

    @Test
    public void editResultIsNullOnlyOnSuccess() {
        assertNull(SelfPostMedia.editResult(200, "{\"json\":{\"errors\":[],\"data\":{\"things\":[]}}}"));
        assertNotNull(SelfPostMedia.editResult(500, ""));
        String limited = SelfPostMedia.editResult(200, "{\"json\":{\"errors\":[[\"RATELIMIT\",\"slow down\",\"ratelimit\"]]}}");
        assertNotNull(limited);
        assertTrue(limited.startsWith("RATELIMIT"));
    }

    private static final class Script implements SelfPostMedia.Attempt {
        final String[] results;
        int calls;

        Script(String... results) {
            this.results = results;
        }

        @Override
        public String run() {
            return results[Math.min(calls++, results.length - 1)];
        }
    }

    private static final class Clock implements SelfPostMedia.Sleeper {
        final List<Long> waited = new ArrayList<>();

        @Override
        public void sleep(long ms) {
            waited.add(ms);
        }
    }

    @Test
    public void flattenRetriesWithBackoffUntilItWorks() {
        Script script = new Script("RATELIMIT: wait", "RATELIMIT: wait", null);
        Clock clock = new Clock();
        assertTrue(SelfPostMedia.retry(script, new long[] {3, 4, 6}, clock));
        assertEquals(3, script.calls);
        assertEquals(Arrays.asList(3L, 4L), clock.waited);
    }

    @Test
    public void flattenGivesUpAfterTheBackoffRunsOut() {
        Script script = new Script("HTTP 500");
        Clock clock = new Clock();
        assertFalse(SelfPostMedia.retry(script, SelfPostMedia.FLATTEN_BACKOFF_MS, clock));
        assertEquals(SelfPostMedia.FLATTEN_BACKOFF_MS.length + 1, script.calls);
        assertEquals(SelfPostMedia.FLATTEN_BACKOFF_MS.length, clock.waited.size());
    }

    @Test
    public void imagesWaitForRedditToServeThem() {
        assertEquals(8000, SelfPostMedia.SETTLE_MS);
        assertEquals(8000, SelfPostMedia.settleWait(1000, 1000));
        assertEquals(5000, SelfPostMedia.settleWait(1000, 4000));
        assertEquals(0, SelfPostMedia.settleWait(1000, 9000));
        assertEquals(0, SelfPostMedia.settleWait(1000, 20000));
    }

    @Test
    public void webpAndShrunkStillsLinkAsJpeg() {
        assertEquals("jpeg", SelfPostMedia.flattenExtension("image/webp"));
        assertEquals("https://i.redd.it/w1.jpeg", SelfPostMedia.imageUrl("w1", "image/webp"));
        assertEquals("https://i.redd.it/g1.gif", SelfPostMedia.imageUrl("g1", "image/gif"));
    }

    private static final String LISTING = "[{\"data\":{\"children\":[{\"data\":{\"id\":\"abc12\",\"name\":\"t3_abc12\","
            + "\"is_self\":true,\"media_metadata\":{\"id1\":{\"status\":\"failed\"},\"id2\":{\"e\":\"AnimatedImage\"},"
            + "\"id3\":{\"e\":\"Image\"}}}}]}},{\"data\":{\"children\":[]}}]";

    @Test
    public void ownImagesComeFromTheListedPostOnly() throws Exception {
        org.json.JSONObject post = SelfPostMedia.postFromListing(LISTING, "abc12");
        assertNotNull(post);
        assertNull(SelfPostMedia.postFromListing(LISTING, "zzz"));
        assertNull(SelfPostMedia.postFromListing("garbage", "abc12"));
        List<SelfPostMedia.OwnImg> own = SelfPostMedia.ownImages(post);
        assertEquals(3, own.size());
        java.util.Map<String, Boolean> byId = new java.util.HashMap<>();
        for (SelfPostMedia.OwnImg o : own) byId.put(o.id, o.gif);
        assertTrue(byId.containsKey("id1"));
        assertNull(byId.get("id1"));
        assertEquals(Boolean.TRUE, byId.get("id2"));
        assertEquals(Boolean.FALSE, byId.get("id3"));
        // rtjson blocks count too, with their type; the metadata then adds only what it has more.
        org.json.JSONObject rich = new org.json.JSONObject("{\"rtjson\":{\"document\":[{\"e\":\"par\",\"c\":[]},"
                + "{\"e\":\"gif\",\"id\":\"g1\"},{\"e\":\"img\",\"id\":\"i1\"}]},\"media_metadata\":{\"i1\":{\"status\":\"valid\"}}}");
        List<SelfPostMedia.OwnImg> fromBlocks = SelfPostMedia.ownImages(rich);
        assertEquals(2, fromBlocks.size());
        assertEquals(Boolean.TRUE, fromBlocks.get(0).gif);
        assertEquals(Boolean.FALSE, fromBlocks.get(1).gif);
        assertTrue(SelfPostMedia.ownImages(null).isEmpty());
        assertTrue(SelfPostMedia.ownImages(new org.json.JSONObject("{}")).isEmpty());
    }

    private static final Set<String> NONE = new HashSet<>();

    @Test
    public void onlyTheOwnIdsAreFoundInTheText() {
        List<SelfPostMedia.OwnImg> own = Arrays.asList(new SelfPostMedia.OwnImg("id1", null, true), new SelfPostMedia.OwnImg("id2", null, true));
        String text = "a\n\nhttps://i.redd.it/id2.gif\n\nb https://i.redd.it/id1.jpeg c\n\nhttps://i.redd.it/foreign.png";
        List<SelfPostMedia.Ref> refs = SelfPostMedia.ownRefs(text, own, NONE);
        assertEquals(2, refs.size());
        assertEquals("id2", refs.get(0).id);
        assertTrue(refs.get(0).gif);
        assertEquals("id1", refs.get(1).id);
        assertFalse(refs.get(1).gif);
        assertEquals(text.indexOf("https://i.redd.it/id2.gif"), refs.get(0).start);
        assertTrue(SelfPostMedia.ownRefs("https://i.redd.it/foreign.png", own, NONE).isEmpty());
        assertTrue(SelfPostMedia.refIsGif("![gif](x)"));
        assertTrue(SelfPostMedia.refIsGif("*Processing gif x...*"));
        assertFalse(SelfPostMedia.refIsGif("https://preview.redd.it/x.png?width=1"));
    }

    @Test
    public void bodyLinksAreOwnIdsToo() {
        // A flattened post lists nothing for an image that came by an edit: only its link names it.
        List<SelfPostMedia.OwnImg> listed = Arrays.asList(new SelfPostMedia.OwnImg("id1", Boolean.FALSE, true));
        String text = "a https://i.redd.it/id1.png\n\nhttps://i.redd.it/lnk2.gif\n\n[pic](https://i.redd.it/lnk3.jpeg)\n\n"
                + "https://i.redd.it/lnk2.gif again\n\nhttps://example.com/x.png https://preview.redd.it/web.png?width=1";
        List<SelfPostMedia.OwnImg> all = SelfPostMedia.withBodyLinks(listed, text);
        assertEquals(3, all.size());
        assertEquals("id1", all.get(0).id);
        assertTrue(all.get(0).listed);
        assertEquals("lnk2", all.get(1).id);
        assertFalse(all.get(1).listed);
        assertEquals(Boolean.TRUE, all.get(1).gif);
        assertEquals("lnk3", all.get(2).id);
        assertEquals(Boolean.FALSE, all.get(2).gif);
        assertEquals(1, SelfPostMedia.withBodyLinks(listed, null).size());
        assertEquals(1, SelfPostMedia.withBodyLinks(listed, "https://i.redd.it/id1.png").size());
        // All three are found in the text (the [pic](..) form too), in text order.
        List<SelfPostMedia.Ref> refs = SelfPostMedia.ownRefs(text, all, NONE);
        assertEquals(3, refs.size());
        assertEquals("id1", refs.get(0).id);
        assertEquals("lnk2", refs.get(1).id);
        assertEquals("lnk3", refs.get(2).id);
        assertTrue(refs.get(0).sure);
        assertFalse(refs.get(1).sure);
        assertTrue(refs.get(1).gif);
        // One of our own uploads counts as sure though Reddit lists nothing for it.
        assertTrue(SelfPostMedia.ownRefs(text, all, new HashSet<>(Arrays.asList("lnk3"))).get(2).sure);
    }

    @Test
    public void bodyLinksMatchSchemeAndHostInAnyCase() {
        // A phone keyboard capitalises the first letter of a line: "Https://".
        String text = "Https://i.redd.it/AbC1.png\n\nHTTPS://I.REDD.IT/dEf2.GIF\n\n[pic](HTTP://i.Redd.It/Gh3.jpeg)";
        List<SelfPostMedia.OwnImg> all = SelfPostMedia.withBodyLinks(new ArrayList<SelfPostMedia.OwnImg>(), text);
        assertEquals(3, all.size());
        assertEquals("AbC1", all.get(0).id); // the id keeps its case
        assertEquals("dEf2", all.get(1).id);
        assertEquals(Boolean.TRUE, all.get(1).gif);
        assertEquals("Gh3", all.get(2).id);
        List<SelfPostMedia.Ref> refs = SelfPostMedia.ownRefs(text, all, NONE);
        assertEquals(3, refs.size());
        assertTrue(refs.get(1).gif);
        // The id itself stays case-sensitive.
        assertTrue(SelfPostMedia.ownRefs("https://i.redd.it/abc1.png", all, NONE).isEmpty());
    }

    private static final String EDIT_TEXT =
            "Intro\n\nhttps://i.redd.it/own1.png\n\nmid\n\n![img](new.png)\n\nhttps://i.redd.it/lnk.gif\n\nend ![gif](g.gif)";

    private static List<SelfPostMedia.Item> editItems(String text, Set<String> uploaded) {
        Set<String> known = new HashSet<>(Arrays.asList("![img](new.png)", "![gif](g.gif)"));
        List<CommentMedia.Marker> markers = CommentMedia.knownMarkers(text, known);
        List<SelfPostMedia.OwnImg> own = SelfPostMedia.withBodyLinks(
                Arrays.asList(new SelfPostMedia.OwnImg("own1", Boolean.FALSE, true)), text);
        List<SelfPostMedia.Ref> refs = SelfPostMedia.ownRefs(text, own, uploaded);
        return SelfPostMedia.mergeItems(refs, markers, Arrays.asList("N1", "N2"), Arrays.asList(false, true));
    }

    @Test
    public void editMixesOwnLinksAndNewMarkersInTextOrder() {
        List<SelfPostMedia.Item> items = editItems(EDIT_TEXT, NONE);
        assertEquals(4, items.size());
        assertEquals("own1", items.get(0).id);
        assertNull(items.get(0).fresh);
        assertTrue(items.get(0).sure);
        assertEquals("N1", items.get(1).id);
        assertEquals(Integer.valueOf(0), items.get(1).fresh);
        assertEquals("lnk", items.get(2).id);
        assertFalse(items.get(2).sure);
        assertEquals("N2", items.get(3).id);
        assertTrue(items.get(3).sure);

        // Every image the post has goes out again, as a media token on its own paragraph.
        assertEquals("Intro\n\n![img](own1)\n\nmid\n\n![img](N1)\n\n![gif](lnk)\n\nend\n\n![gif](N2)",
                SelfPostMedia.attachEditBody(EDIT_TEXT, items, false));
        // The text edit only replaces the new markers; the post's own links stay where they were.
        Set<String> known = new HashSet<>(Arrays.asList("![img](new.png)", "![gif](g.gif)"));
        assertEquals("Intro\n\nhttps://i.redd.it/own1.png\n\nmid\n\nhttps://i.redd.it/N1.png\n\nhttps://i.redd.it/lnk.gif\n\n"
                        + "end\n\nhttps://i.redd.it/N2.gif",
                SelfPostMedia.swapMarkers(EDIT_TEXT, CommentMedia.knownMarkers(EDIT_TEXT, known),
                        Arrays.asList("https://i.redd.it/N1.png", "https://i.redd.it/N2.gif")));
    }

    @Test
    public void refusedForAForeignLinkSendsAgainWithoutTheGuessedIds() {
        List<SelfPostMedia.Item> items = editItems(EDIT_TEXT, NONE);
        assertTrue(SelfPostMedia.hasUnsure(items));
        // The retry keeps what Reddit lists and what we uploaded; the guessed link stays a plain link.
        assertEquals("Intro\n\n![img](own1)\n\nmid\n\n![img](N1)\n\nhttps://i.redd.it/lnk.gif\n\nend\n\n![gif](N2)",
                SelfPostMedia.attachEditBody(EDIT_TEXT, items, true));
        // A link we uploaded ourselves is as sure as a listed one: nothing to retry.
        List<SelfPostMedia.Item> ours = editItems(EDIT_TEXT, new HashSet<>(Arrays.asList("lnk")));
        assertFalse(SelfPostMedia.hasUnsure(ours));
        assertEquals(SelfPostMedia.attachEditBody(EDIT_TEXT, ours, false), SelfPostMedia.attachEditBody(EDIT_TEXT, ours, true));
        // No own link at all: nothing to retry either.
        assertFalse(SelfPostMedia.hasUnsure(editItems("![img](new.png)\n\n![gif](g.gif)", NONE)));
    }

    @Test
    public void invalidMediaReplyIsRecognised() {
        String refused = "{\"json\":{\"errors\":[[\"INVALID_MEDIA_ASSETS\","
                + "\"All media assets must be owned by the submitter of this post\",\"\"]]}}";
        assertTrue(SelfPostMedia.isInvalidMedia(refused));
        assertTrue(SelfPostMedia.hasErrors(refused));
        assertFalse(SelfPostMedia.isInvalidMedia("{\"json\":{\"errors\":[[\"RATELIMIT\",\"slow\",\"\"]]}}"));
        assertFalse(SelfPostMedia.isInvalidMedia("{\"json\":{\"errors\":[],\"data\":{\"things\":[]}}}"));
        assertFalse(SelfPostMedia.isInvalidMedia("<html>502</html>"));
        assertTrue(SelfPostMedia.isJson("{\"json\":{}}"));
        assertFalse(SelfPostMedia.isJson("<html>502</html>"));
        assertFalse(SelfPostMedia.isJson(""));
    }

    @Test
    public void uploadRecordKeepsTheNewestIdsOnce() {
        List<String> log = new ArrayList<>();
        log = SelfPostMedia.logAdd(log, "a");
        log = SelfPostMedia.logAdd(log, "b");
        log = SelfPostMedia.logAdd(log, "a");
        assertEquals(Arrays.asList("b", "a"), log);
        for (int i = 0; i < SelfPostMedia.MAX_LOGGED + 10; i++) log = SelfPostMedia.logAdd(log, "id" + i);
        assertEquals(SelfPostMedia.MAX_LOGGED, log.size());
        assertEquals("id" + (SelfPostMedia.MAX_LOGGED + 9), log.get(log.size() - 1));
        assertEquals(log, SelfPostMedia.logFromJson(SelfPostMedia.logToJson(log)));
        assertTrue(SelfPostMedia.logFromJson("garbage").isEmpty());
        assertEquals(Arrays.asList("ok1"), SelfPostMedia.logFromJson("[\"ok1\",\"../bad\"]"));
    }

    // ---- a post left with "Processing" placeholders (its flatten failed)

    private static final String STUCK = "Intro\n\n*Processing img pic1...*\n\nmid\n\n*Processing gif anim2...*\n\nend";

    /** The items of an edit of {@code text}; the post lists pic1 (png) and anim2, the record has up1. */
    private static List<SelfPostMedia.Item> stuckItems(String text, List<String> freshIds, List<Boolean> freshGifs) {
        Set<String> known = new HashSet<>(Arrays.asList("![img](new.png)"));
        List<CommentMedia.Marker> markers = CommentMedia.knownMarkers(text, known);
        List<SelfPostMedia.OwnImg> own = Arrays.asList(new SelfPostMedia.OwnImg("pic1", Boolean.FALSE, true, "png"),
                new SelfPostMedia.OwnImg("anim2", null, true, "gif"));
        Set<String> uploaded = new HashSet<>(Arrays.asList("up1"));
        List<SelfPostMedia.Ref> refs = SelfPostMedia.ownRefs(text,
                SelfPostMedia.withBodyLinks(SelfPostMedia.withPlaceholders(own, text, uploaded), text), uploaded);
        return SelfPostMedia.mergeItems(refs, markers, freshIds, freshGifs);
    }

    private static final List<String> NO_IDS = new ArrayList<>();
    private static final List<Boolean> NO_GIFS = new ArrayList<>();

    @Test
    public void placeholderOfOwnImageAttachesAndFlattensToItsLink() {
        List<SelfPostMedia.Item> items = stuckItems(STUCK, NO_IDS, NO_GIFS);
        assertEquals(2, items.size());
        assertTrue(SelfPostMedia.hasRepairable(STUCK, ownRefsOf(STUCK)));
        assertEquals("Intro\n\n![img](pic1)\n\nmid\n\n![gif](anim2)\n\nend", SelfPostMedia.attachEditBody(STUCK, items, false));
        // pic1: the metadata says png; anim2: gif.
        assertEquals("Intro\n\nhttps://i.redd.it/pic1.png\n\nmid\n\nhttps://i.redd.it/anim2.gif\n\nend",
                SelfPostMedia.flattenEditText(STUCK, items, NO_IDS));
        assertFalse(SelfPostMedia.hasUnsure(items));
    }

    private static List<SelfPostMedia.Ref> ownRefsOf(String text) {
        Set<String> uploaded = new HashSet<>(Arrays.asList("up1"));
        return SelfPostMedia.ownRefs(text, SelfPostMedia.withPlaceholders(Arrays.asList(
                new SelfPostMedia.OwnImg("pic1", Boolean.FALSE, true, "png"), new SelfPostMedia.OwnImg("anim2", null, true, "gif")),
                text, uploaded), uploaded);
    }

    @Test
    public void placeholderLinkExtensionComesFromMetadata() {
        assertEquals("png", SelfPostMedia.mediaExtension(json("{\"e\":\"Image\",\"m\":\"image/png\"}")));
        assertEquals("gif", SelfPostMedia.mediaExtension(json("{\"e\":\"AnimatedImage\",\"m\":\"image/gif\"}")));
        assertEquals("gif", SelfPostMedia.mediaExtension(json("{\"e\":\"AnimatedImage\"}")));
        assertEquals(SelfPostMedia.JPEG_EXT, SelfPostMedia.mediaExtension(json("{\"e\":\"Image\",\"m\":\"image/jpg\"}")));
        assertEquals(SelfPostMedia.JPEG_EXT, SelfPostMedia.mediaExtension(json("{\"m\":\"image/webp\"}")));
        assertNull(SelfPostMedia.mediaExtension(json("{\"status\":\"failed\"}")));
        assertNull(SelfPostMedia.mediaExtension(null));
        // The listing's metadata reaches the own image.
        org.json.JSONObject post = json("{\"media_metadata\":{\"a1\":{\"e\":\"Image\",\"m\":\"image/png\"},\"b2\":{\"status\":\"failed\"}}}");
        List<SelfPostMedia.OwnImg> own = SelfPostMedia.ownImages(post);
        assertEquals("png", own.get(0).ext);
        assertNull(own.get(1).ext);
    }

    private static org.json.JSONObject json(String s) {
        try {
            return new org.json.JSONObject(s);
        } catch (org.json.JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    @Test
    public void placeholderWithoutKnownExtensionIsNotGuessed() {
        String text = "*Processing img x1...*\n\n*Processing gif x2...*";
        Set<String> uploaded = new HashSet<>(Arrays.asList("x1", "x2"));
        // Neither is listed; both are ours from the record, so both are sure and still attach.
        List<SelfPostMedia.OwnImg> own = SelfPostMedia.withPlaceholders(new ArrayList<SelfPostMedia.OwnImg>(), text, uploaded);
        assertEquals(2, own.size());
        List<SelfPostMedia.Ref> refs = SelfPostMedia.ownRefs(text, own, uploaded);
        assertFalse(SelfPostMedia.hasRepairable(text, refs));
        List<SelfPostMedia.Item> items = SelfPostMedia.mergeItems(refs, NO_MARKERS, NO_IDS, NO_GIFS);
        assertFalse(SelfPostMedia.hasUnsure(items));
        assertEquals("![img](x1)\n\n![gif](x2)", SelfPostMedia.attachEditBody(text, items, false));
        // No extension: the placeholder stays text in the flatten edit.
        assertEquals(text, SelfPostMedia.flattenEditText(text, items, NO_IDS));
    }

    @Test
    public void filesAreProbedOnlyOnceTheyAreOldEnough() {
        assertTrue(SelfPostMedia.assetsSettled(json("{\"created_utc\":1000.0,\"edited\":false}"), 1010));
        assertFalse(SelfPostMedia.assetsSettled(json("{\"created_utc\":1000.0,\"edited\":false}"), 1009));
        // The last edit counts too (an edit attaches its images anew).
        assertFalse(SelfPostMedia.assetsSettled(json("{\"created_utc\":1000.0,\"edited\":1500.0}"), 1505));
        assertTrue(SelfPostMedia.assetsSettled(json("{\"created_utc\":1000.0,\"edited\":1500.0}"), 1510));
        assertFalse(SelfPostMedia.assetsSettled(json("{}"), 5000));
        assertFalse(SelfPostMedia.assetsSettled(null, 5000));
        // Not settled: nothing is asked for, the placeholder stays.
        final List<String> asked = new ArrayList<>();
        SelfPostMedia.Prober any = new SelfPostMedia.Prober() {
            @Override
            public boolean served(String url) {
                asked.add(url);
                return true;
            }
        };
        String text = "*Processing img a1...*";
        List<SelfPostMedia.Ref> refs = Arrays.asList(new SelfPostMedia.Ref(0, 22, "a1", false, true));
        assertNull(SelfPostMedia.withProbedExtensions(text, refs, any, false).get(0).ext);
        assertTrue(asked.isEmpty());
    }

    private static final List<CommentMedia.Marker> NO_MARKERS = new ArrayList<>();

    @Test
    public void placeholderLinkExtensionIsProbedWhenMetadataHasNone() {
        // A stuck post's metadata is {"status":"failed"}: the file is served under its real extension only.
        final List<String> asked = new ArrayList<>();
        SelfPostMedia.Prober serves = new SelfPostMedia.Prober() {
            @Override
            public boolean served(String url) {
                asked.add(url);
                return url.equals("https://i.redd.it/pic1.png") || url.equals("https://i.redd.it/jp2.jpeg")
                        || url.equals("https://i.redd.it/g3.gif");
            }
        };
        String text = "*Processing img pic1...*\n\n*Processing img jp2...*\n\n*Processing gif g3...*\n\n"
                + "*Processing img nope4...*\n\n*Processing gif nope6...*\n\nhttps://i.redd.it/lnk5.png";
        Set<String> uploaded = new HashSet<>(Arrays.asList("pic1", "jp2", "g3", "nope4", "nope6"));
        List<SelfPostMedia.OwnImg> own = SelfPostMedia.withBodyLinks(
                SelfPostMedia.withPlaceholders(new ArrayList<SelfPostMedia.OwnImg>(), text, uploaded), text);
        List<SelfPostMedia.Ref> refs = SelfPostMedia.withProbedExtensions(text, SelfPostMedia.ownRefs(text, own, uploaded), serves, true);
        assertEquals("png", refs.get(0).ext);
        assertEquals("jpeg", refs.get(1).ext);
        assertEquals("gif", refs.get(2).ext);
        assertNull(refs.get(3).ext);   // nothing served: not guessed
        assertNull(refs.get(4).ext);
        assertNull(refs.get(5).ext);   // a link is no placeholder
        assertFalse(asked.contains("https://i.redd.it/g3.png"));
        assertFalse(asked.contains("https://i.redd.it/lnk5.png"));
        List<SelfPostMedia.Item> items = SelfPostMedia.mergeItems(refs, NO_MARKERS, NO_IDS, NO_GIFS);
        // The ones nothing served for stay as the text they are.
        assertEquals("https://i.redd.it/pic1.png\n\nhttps://i.redd.it/jp2.jpeg\n\nhttps://i.redd.it/g3.gif\n\n"
                        + "*Processing img nope4...*\n\n*Processing gif nope6...*\n\nhttps://i.redd.it/lnk5.png",
                SelfPostMedia.flattenEditText(text, items, NO_IDS));
        // Metadata that gives the type is not probed.
        asked.clear();
        List<SelfPostMedia.Ref> known = SelfPostMedia.withProbedExtensions("*Processing img a1...*",
                Arrays.asList(new SelfPostMedia.Ref(0, 22, "a1", false, true, "png")), serves, true);
        assertEquals("png", known.get(0).ext);
        assertTrue(asked.isEmpty());
    }

    @Test
    public void foreignPlaceholderStaysPlainText() {
        String text = "*Processing img other9...*\n\n*Processing img pic1...*";
        List<SelfPostMedia.Item> items = stuckItems(text, NO_IDS, NO_GIFS);
        // Only pic1 (listed) is found; other9 is neither listed nor ours.
        assertEquals(1, items.size());
        assertEquals("pic1", items.get(0).id);
        assertEquals("*Processing img other9...*\n\n![img](pic1)", SelfPostMedia.attachEditBody(text, items, false));
        assertEquals("*Processing img other9...*\n\nhttps://i.redd.it/pic1.png", SelfPostMedia.flattenEditText(text, items, NO_IDS));
        // A text with only a foreign placeholder has nothing to repair.
        String only = "*Processing img other9...*";
        assertFalse(SelfPostMedia.hasRepairable(only, ownRefsOf(only)));
        assertTrue(SelfPostMedia.withPlaceholders(new ArrayList<SelfPostMedia.OwnImg>(), only, new HashSet<String>()).isEmpty());
    }

    @Test
    public void textWithoutPlaceholderOrMarkerNeedsNoRepair() {
        String text = "Just words and https://i.redd.it/pic1.png here";
        assertFalse(CommentMedia.hasPlaceholder(text));
        assertFalse(SelfPostMedia.hasRepairable(text, ownRefsOf(text)));
        // A flat link of an own image is an own ref but no placeholder, and it stays a link when flattened.
        List<SelfPostMedia.Item> items = stuckItems(text, NO_IDS, NO_GIFS);
        assertEquals(1, items.size());
        assertEquals(text, SelfPostMedia.flattenEditText(text, items, NO_IDS));
    }

    @Test
    public void placeholderAndNewMarkerFlattenTogether() {
        String text = "*Processing img pic1...*\n\nnew ![img](new.png)\n\nhttps://i.redd.it/keep.png";
        List<SelfPostMedia.Item> items = stuckItems(text, Arrays.asList("N1"), Arrays.asList(false));
        assertEquals(3, items.size());
        assertEquals("![img](pic1)\n\nnew\n\n![img](N1)\n\n![img](keep)",
                SelfPostMedia.attachEditBody(text, items, false));
        // The new marker takes its upload's link, the placeholder its own; the other link stays.
        assertEquals("https://i.redd.it/pic1.png\n\nnew\n\nhttps://i.redd.it/N1.png\n\nhttps://i.redd.it/keep.png",
                SelfPostMedia.flattenEditText(text, items, Arrays.asList("https://i.redd.it/N1.png")));
        // A new marker alone flattens as it always did.
        String plain = "a ![img](new.png)";
        assertEquals("a\n\nhttps://i.redd.it/N1.png",
                SelfPostMedia.flattenEditText(plain, stuckItems(plain, Arrays.asList("N1"), Arrays.asList(false)),
                        Arrays.asList("https://i.redd.it/N1.png")));
    }

    @Test
    public void firstTryNeedsNoWait() {
        Script script = new Script((String) null);
        Clock clock = new Clock();
        assertTrue(SelfPostMedia.retry(script, new long[] {1, 2}, clock));
        assertEquals(1, script.calls);
        assertTrue(clock.waited.isEmpty());
    }
}
