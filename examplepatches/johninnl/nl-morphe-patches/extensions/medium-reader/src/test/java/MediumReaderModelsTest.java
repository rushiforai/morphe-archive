import com.medium.android.graphql.FullPostQuery$Data;
import com.medium.android.graphql.FullPostQuery$Post;
import com.medium.android.graphql.fragment.*;
import com.medium.android.graphql.type.ParagraphType;
import nl.johninnl.medium.reader.ArticleBody;
import nl.johninnl.medium.reader.ArticleException;
import org.junit.Test;
import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import static org.junit.Assert.*;

/** Exercises our copying/mapping logic against generated constructor/getter ABI fixtures. */
public class MediumReaderModelsTest {
    private static final String ID = "dc7f60d860e4";

    // Opaque metadata is a sentinel: constructor internals/account behavior are not simulated.
    private static <T> T metadata(Class<T> type) {
        try {
            Class<?> unsafeType = Class.forName("sun.misc.Unsafe");
            java.lang.reflect.Field field = unsafeType.getDeclaredField("theUnsafe"); field.setAccessible(true);
            Object unsafe = field.get(null);
            return type.cast(unsafeType.getMethod("allocateInstance", Class.class).invoke(unsafe, type));
        } catch (ReflectiveOperationException failure) { throw new AssertionError(failure); }
    }

    static FullPostQuery$Data original(boolean preview) {
        ParagraphData paragraph = new ParagraphData("Paragraph", "old-id", "old-name", null, "Preview", null, null,
                Collections.emptyList(), null, null, ParagraphType.P, false, null, null);
        PostBodyData rich = new PostBodyData("RichText", Collections.singletonList(new PostBodyData$Section("Section",
                new SectionData("Section", "old-section", 0))), Collections.singletonList(new PostBodyData$Paragraph("Paragraph", "old-id", paragraph)));
        FullPostData$Content content = new FullPostData$Content("PostContent", new FullPostData$BodyModel("RichText", rich),
                preview, "original-share-key", metadata(FullPostData$ShareKeyCreator.class));
        FullPostData full = new FullPostData("Post", Collections.emptyList(), content, ID, metadata(PostMetaData.class),
                metadata(LinkMetadataList.class), metadata(PostFooterCountData.class), metadata(CustomFooterData.class),
                metadata(PostFeaturingStatusData.class), metadata(PostPromotionBannerData.class), metadata(PostRepostStateData.class), metadata(PostRepostCountData.class));
        return new FullPostQuery$Data(new FullPostQuery$Post("Post", ID, full));
    }

    private ArticleBody body(String postId, ArticleBody.Block... blocks) {
        return new ArticleBody(postId, "Mirror title", URI.create("https://medium.com/p/" + postId), null, Arrays.asList(blocks));
    }
    private ArticleBody.Block text(String type, String text) {
        return new ArticleBody.Block(type, text, Collections.emptyList(), null, null);
    }
    private FullPostData convert(FullPostQuery$Data original, ArticleBody body) {
        try { return MediumReaderModels.replace(original, body).getPost().getFullPostData(); }
        catch (ArticleException failure) { throw new AssertionError("Expected native body: " + failure.code, failure); }
    }
    private ParagraphData paragraph(FullPostData full, int index) {
        return ((PostBodyData$Paragraph) full.getContent().getBodyModel().getPostBodyData().getParagraphs().get(index)).getParagraphData();
    }

    @Test public void copiesOnlyBodyPresentationAndPreservesMetadataIdentity() {
        FullPostQuery$Data data = original(true);
        FullPostData before = data.getPost().getFullPostData();
        FullPostData after = convert(data, body(ID, text("P", "Full text.")));
        assertEquals("Full text.", paragraph(after, 0).getText());
        assertFalse(after.getContent().isLockedPreviewOnly());
        assertTrue(before.getContent().isLockedPreviewOnly());
        assertSame(before.getPostMetaData(), after.getPostMetaData());
        assertEquals(ID, after.getId());
        assertEquals("Post", after.get__typename());
        assertSame(before.getTags(), after.getTags());
        assertSame(before.getLinkMetadataList(), after.getLinkMetadataList());
        assertSame(before.getPostFeaturingStatusData(), after.getPostFeaturingStatusData());
        assertSame(before.getPostRepostStateData(), after.getPostRepostStateData());
        assertSame(before.getPostRepostCountData(), after.getPostRepostCountData());
        assertSame(before.getPostFooterCountData(), after.getPostFooterCountData());
        assertSame(before.getPostPromotionBannerData(), after.getPostPromotionBannerData());
        assertSame(before.getCustomFooterData(), after.getCustomFooterData());
        assertSame(before.getContent().getShareKeyCreator(), after.getContent().getShareKeyCreator());
        assertEquals("original-share-key", after.getContent().getValidatedShareKey());
    }

    @Test public void mapsNativeTypesAndPreservesRepeatedTextWithDistinctLocalIds() {
        FullPostData after = convert(original(true), body(ID, text("H3", "Heading"), text("P", "Repeated"), text("P", "Repeated"), text("ULI", "Item")));
        assertEquals(4, after.getContent().getBodyModel().getPostBodyData().getParagraphs().size());
        assertEquals(ParagraphType.H3, paragraph(after, 0).getType());
        assertEquals(ParagraphType.ULI, paragraph(after, 3).getType());
        assertEquals(paragraph(after, 1).getText(), paragraph(after, 2).getText());
        assertNotEquals(paragraph(after, 1).getName(), paragraph(after, 2).getName());
        assertNotEquals("old-name", paragraph(after, 0).getName());
    }

    @Test public void carriesUtf16SpansAndImageCaptionMetadata() {
        ArticleBody.Block formatted = new ArticleBody.Block("P", "😀 bold", Collections.singletonList(new ArticleBody.Markup("STRONG", 3, 7, null)), null, null);
        ArticleBody.Image image = new ArticleBody.Image("1*image.png", URI.create("https://freedium-mirror.cfd/img/medium/700/1*image.png"), "Alt", 1200, 800);
        ArticleBody.Block photo = new ArticleBody.Block("IMG", "Caption", Collections.emptyList(), image, null);
        FullPostData after = convert(original(true), body(ID, formatted, photo));
        MarkupData markup = ((ParagraphData$Markup) paragraph(after, 0).getMarkups().get(0)).getMarkupData();
        assertEquals(3, markup.getStart()); assertEquals(7, markup.getEnd());
        ImageMetadataData nativeImage = paragraph(after, 1).getMetadata().getImageMetadataData();
        assertTrue(nativeImage.getId().startsWith("mrimg_")); assertNotNull(nl.johninnl.medium.reader.ReaderImages.resolve(nativeImage.getId())); assertEquals(Integer.valueOf(1200), nativeImage.getOriginalWidth());
        assertEquals("Alt", nativeImage.getAlt()); assertEquals("Caption", paragraph(after, 1).getText());
    }

    @Test public void keepsAlreadyCompleteOriginalData() throws Exception {
        FullPostQuery$Data data = original(false);
        assertSame(data, MediumReaderModels.replace(data, body(ID, text("P", "Mirror snapshot"))));
    }

    @Test public void exportsOnlyPublishedEditorialDataForIndependentOfflineReading() throws Exception {
        FullPostQuery$Data data = original(false); PostMetaData meta = data.getPost().getFullPostData().getPostMetaData();
        for (String[] field : new String[][] {{"title","Saved title"},{"latestPublishedVersion","version-1"},{"mediumUrl","https://medium.com/p/"+ID+"?sk=secret&source=tracking"}}) {
            java.lang.reflect.Field value = meta.getClass().getDeclaredField(field[0]); value.setAccessible(true); value.set(meta,field[1]);
        }
        java.lang.reflect.Field visibility=meta.getClass().getDeclaredField("visibility");visibility.setAccessible(true);visibility.set(meta,com.medium.android.graphql.type.PostVisibilityType.PUBLIC);
        ArticleBody body=MediumReaderOfflineSnapshots.publicBody(data);
        assertEquals("Saved title",body.title);assertNull(body.canonicalUrl.getQuery());assertEquals("Preview",body.blocks.get(0).text);
        org.junit.rules.TemporaryFolder folder=new org.junit.rules.TemporaryFolder();folder.create();
        try {
            java.io.File directory=folder.newFolder();nl.johninnl.medium.reader.BodyCache cache=new nl.johninnl.medium.reader.BodyCache(directory,1024*1024,10,1000,()->1000);
            cache.put(nl.johninnl.medium.reader.BodyCache.key(ID,"v1",java.net.URI.create("https://medium.com/")),body);
            byte[] stored=java.nio.file.Files.readAllBytes(directory.listFiles()[0].toPath());
            assertFalse(new String(stored,java.nio.charset.StandardCharsets.ISO_8859_1).contains("original-share-key"));
            assertEquals("Saved title",cache.saved().get(0).body.title);
        } finally { folder.delete(); }
        visibility.set(meta,com.medium.android.graphql.type.PostVisibilityType.UNLISTED);
        assertNull(MediumReaderOfflineSnapshots.publicBody(data));
    }

    @Test public void originalCompleteArticleEmbedsBecomeStaticWithoutChangingSectionsOrAccountMetadata() throws Exception {
        FullPostQuery$Data before = original(false); FullPostData full = before.getPost().getFullPostData();
        PostBodyData prior = full.getContent().getBodyModel().getPostBodyData();
        MediaResourceData media = new MediaResourceData("MediaResource", "embed-id",
            "https://cdn.embedly.com/widgets/media.html?url=https%3A%2F%2Fx.com%2Fuser%2Fstatus%2F123", "https://pbs.twimg.com/media/photo.jpg");
        IframeData iframe = new IframeData("Iframe", 400, 600, new IframeData$MediaResource("MediaResource", "embed-id", media));
        ParagraphData embed = new ParagraphData("Paragraph", "iframe-id", "iframe-id", null, null,
            new ParagraphData$Iframe("Iframe", iframe), null, Collections.emptyList(), null, null, ParagraphType.IFRAME, false, null, null);
        PostBodyData rich = new PostBodyData(prior.get__typename(), prior.getSections(), Arrays.asList(prior.getParagraphs().get(0), new PostBodyData$Paragraph("Paragraph", "iframe-id", embed)));
        FullPostData$Content content = full.getContent();
        FullPostData withEmbed = new FullPostData(full.get__typename(), full.getTags(),
            new FullPostData$Content(content.get__typename(), new FullPostData$BodyModel(content.getBodyModel().get__typename(), rich), false, content.getValidatedShareKey(), content.getShareKeyCreator()),
            full.getId(), full.getPostMetaData(), full.getLinkMetadataList(), full.getPostFooterCountData(), full.getCustomFooterData(),
            full.getPostFeaturingStatusData(), full.getPostPromotionBannerData(), full.getPostRepostStateData(), full.getPostRepostCountData());
        FullPostQuery$Data result = MediumReaderModels.staticEmbeds(new FullPostQuery$Data(new FullPostQuery$Post("Post", ID, withEmbed)));
        FullPostData after = result.getPost().getFullPostData();
        assertEquals(2, after.getContent().getBodyModel().getPostBodyData().getParagraphs().size());
        assertSame(prior.getSections(), after.getContent().getBodyModel().getPostBodyData().getSections());
        assertSame(prior.getParagraphs().get(0), after.getContent().getBodyModel().getPostBodyData().getParagraphs().get(0));
        assertSame(full.getPostMetaData(), after.getPostMetaData()); assertEquals("original-share-key", after.getContent().getValidatedShareKey());
        ParagraphData staticEmbed = paragraph(after, 1);
        assertEquals(ParagraphType.IMG, staticEmbed.getType()); assertNull(staticEmbed.getIframe());
        assertNotEquals("iframe-id", staticEmbed.getId());
        assertEquals("https://x.com/user/status/123", ((ParagraphData$Markup) staticEmbed.getMarkups().get(0)).getMarkupData().getHref());
    }

    @Test public void rejectsAnotherPostBeforeCreatingNativeModels() throws Exception {
        try { MediumReaderModels.replace(original(true), body("bf716433d4a6", text("P", "Other post"))); fail("Different article was applied"); }
        catch (ArticleException failure) { assertEquals("IDENTITY", failure.code); }
    }

    @Test public void rejectsNativeUnknownEnumInsteadOfClaimingAReadableBody() throws Exception {
        try { MediumReaderModels.replace(original(true), body(ID, text("UNKNOWN__", "Unreadable"))); fail("Unknown native block was accepted"); }
        catch (ArticleException failure) { assertEquals("UNSUPPORTED_CONTENT", failure.code); }
    }

    @Test public void rejectsOutOfRangeFormattingBeforeNativeRendering() throws Exception {
        ArticleBody.Block invalid = new ArticleBody.Block("P", "Short", Collections.singletonList(new ArticleBody.Markup("STRONG", 1, 99, null)), null, null);
        try { MediumReaderModels.replace(original(true), body(ID, invalid)); fail("Invalid native range was accepted"); }
        catch (ArticleException failure) { assertEquals("INCOMPLETE_RESPONSE", failure.code); }
    }

    @Test public void rejectsMissingImageSourceBeforeNativeConstruction() throws Exception {
        ArticleBody.Block invalid = new ArticleBody.Block("IMG", "Caption", Collections.emptyList(),
                new ArticleBody.Image(null, null, "Alt", 100, 100), null);
        try { MediumReaderModels.replace(original(true), body(ID, invalid)); fail("Unregistered image was accepted"); }
        catch (ArticleException failure) { assertEquals("BAD_IMAGE", failure.code); }
    }

    @Test public void preservesCodeLanguageAndWhitespaceInNativeMetadata() {
        ArticleBody.Block code = new ArticleBody.Block("PRE", "x\n  y\n", Collections.emptyList(), null, "javascript");
        ParagraphData paragraph = paragraph(convert(original(true), body(ID, code)), 0);
        assertEquals(ParagraphType.PRE, paragraph.getType());
        assertEquals("x\n  y\n", paragraph.getText());
        assertEquals("javascript", paragraph.getCodeBlockMetadata().getLang());
        assertEquals(com.medium.android.graphql.type.SyntaxHighlightMode.EXPLICIT, paragraph.getCodeBlockMetadata().getMode());
    }

    @Test public void mapsEverySupportedTextAndSeparatorTypeToItsNativeEnum() {
        String[] kinds = {"P", "H1", "H2", "H3", "H4", "ULI", "OLI", "BQ", "PQ", "HR", "SECTION_CAPTION"};
        ParagraphType[] expected = {ParagraphType.P, ParagraphType.H1, ParagraphType.H2, ParagraphType.H3, ParagraphType.H4,
                ParagraphType.ULI, ParagraphType.OLI, ParagraphType.BQ, ParagraphType.PQ, ParagraphType.HR, ParagraphType.SECTION_CAPTION};
        ArticleBody.Block[] blocks = new ArticleBody.Block[kinds.length];
        for (int i = 0; i < kinds.length; i++) blocks[i] = text(kinds[i], kinds[i].equals("HR") ? "" : "Content");
        FullPostData nativeBody = convert(original(true), body(ID, blocks));
        for (int i = 0; i < expected.length; i++) assertEquals(expected[i], paragraph(nativeBody, i).getType());
    }
}
