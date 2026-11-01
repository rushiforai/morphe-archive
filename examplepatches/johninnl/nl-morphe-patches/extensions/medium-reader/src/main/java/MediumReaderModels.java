import com.medium.android.graphql.FullPostQuery$Data;
import com.medium.android.graphql.FullPostQuery$Post;
import com.medium.android.graphql.fragment.*;
import com.medium.android.graphql.type.AnchorType;
import com.medium.android.graphql.type.MarkupType;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.android.graphql.type.SyntaxHighlightMode;
import nl.johninnl.medium.reader.ArticleBody;
import nl.johninnl.medium.reader.ArticleException;
import nl.johninnl.medium.reader.ReaderImages;
import nl.johninnl.medium.privacy.WebPrivacyRules;
import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** The sole model adapter for the pinned app ABI. App stubs are compile-only. */
public final class MediumReaderModels {
    private MediumReaderModels() {}
    /** Keep original text/images while replacing active iframe paragraphs one-for-one. */
    public static FullPostQuery$Data staticEmbeds(FullPostQuery$Data original) throws ArticleException {
        if (original == null || original.getPost() == null) return original;
        FullPostData full = original.getPost().getFullPostData();
        PostBodyData prior = full.getContent().getBodyModel().getPostBodyData();
        List<PostBodyData$Paragraph> paragraphs = new ArrayList<>(); boolean changed = false;
        for (Object item : prior.getParagraphs()) {
            PostBodyData$Paragraph wrapper = (PostBodyData$Paragraph) item;
            ParagraphData paragraph = wrapper.getParagraphData();
            if (paragraph.getType() != ParagraphType.IFRAME) { paragraphs.add(wrapper); continue; }
            changed = true;
            IframeData iframe = paragraph.getIframe() == null ? null : paragraph.getIframe().getIframeData();
            MediaResourceData media = iframe == null || iframe.getMediaResource() == null ? null : iframe.getMediaResource().getMediaResourceData();
            URI target = media == null ? null : WebPrivacyRules.embedTarget(media.getIframeSrc());
            URI thumbnail = media == null ? null : WebPrivacyRules.safe(media.getThumbnailUrl());
            String prefix = paragraph.getText() == null ? "" : paragraph.getText();
            String label = target == null ? "Embedded content unavailable" : "Open embedded content (" + target.getHost() + ")";
            String text = prefix.isEmpty() ? label : prefix + "\n" + label;
            List<ParagraphData$Markup> markups = new ArrayList<>(paragraph.getMarkups());
            if (target != null) {
                MarkupData link = new MarkupData("Markup", "a", MarkupType.A, text.length() - label.length(), text.length(),
                    target.toString(), null, null, AnchorType.LINK, null, Collections.emptyList());
                markups.add(new ParagraphData$Markup("Markup", link));
            }
            ParagraphData$Metadata metadata = null; ParagraphType type = ParagraphType.P;
            if (thumbnail != null && "https".equalsIgnoreCase(thumbnail.getScheme()) && thumbnail.getFragment() == null && !WebPrivacyRules.blocked(thumbnail.toString())) {
                int width = iframe.getIframeWidth() == null ? 0 : iframe.getIframeWidth();
                int height = iframe.getIframeHeight() == null ? 0 : iframe.getIframeHeight();
                String imageId = ReaderImages.register(new ArticleBody.Image(null, thumbnail, "Embedded content preview", width, height));
                ImageMetadataData image = new ImageMetadataData("ImageMetadata", imageId, width > 0 ? width : null, height > 0 ? height : null, null, null, "Embedded content preview");
                metadata = new ParagraphData$Metadata("ImageMetadata", imageId, image); type = ParagraphType.IMG;
            }
            String name = "mr_embed_" + full.getId() + "_" + paragraphs.size();
            ParagraphData replacement = new ParagraphData("Paragraph", name, name, null, text, null, paragraph.getLayout(),
                markups, metadata, null, type, false, null, null);
            paragraphs.add(new PostBodyData$Paragraph("Paragraph", name, replacement));
        }
        if (!changed) return original;
        // Keep paragraph cardinality and section indices; unrelated native items keep identity.
        return withBody(original, new PostBodyData(prior.get__typename(), prior.getSections(), paragraphs), full.getContent().isLockedPreviewOnly());
    }
    public static FullPostQuery$Data replace(FullPostQuery$Data original, ArticleBody body) throws ArticleException {
        FullPostQuery$Post post = original == null ? null : original.getPost();
        if (post == null || body == null || !body.postId.equals(post.getId())) {
            throw new ArticleException("IDENTITY", "Replacement does not belong to the active article");
        }
        FullPostData full = post.getFullPostData();
        FullPostData$Content content = full.getContent();
        PostBodyData prior = content.getBodyModel().getPostBodyData();
        if (!content.isLockedPreviewOnly() && !prior.getParagraphs().isEmpty()) return original;
        if (body.blocks.isEmpty()) throw new ArticleException("MISSING_BODY", "Replacement has no readable blocks");
        List<PostBodyData$Paragraph> paragraphs = new ArrayList<>();
        for (int index = 0; index < body.blocks.size(); index++) {
            ArticleBody.Block block = body.blocks.get(index);
            String name = "mr_" + body.postId + "_" + index;
            if (!Arrays.asList("P", "H1", "H2", "H3", "H4", "ULI", "OLI", "BQ", "PQ", "PRE", "IMG", "HR", "SECTION_CAPTION").contains(block.type)) {
                throw new ArticleException("UNSUPPORTED_CONTENT", "Block has no supported native presentation");
            }
            ParagraphType type;
            try { type = ParagraphType.valueOf(block.type); }
            catch (IllegalArgumentException unsupported) { throw new ArticleException("UNSUPPORTED_CONTENT", "Unsupported native block type", unsupported); }
            if (block.text == null) throw new ArticleException("INCOMPLETE_RESPONSE", "Block has no text value");
            List<ParagraphData$Markup> markups = new ArrayList<>();
            for (ArticleBody.Markup markup : block.markups) {
                if (markup.start < 0 || markup.end <= markup.start || markup.end > block.text.length()) {
                    throw new ArticleException("INCOMPLETE_RESPONSE", "Formatting range is outside the paragraph");
                }
                MarkupType markupType;
                if (!Arrays.asList("STRONG", "EM", "CODE", "A").contains(markup.type)) {
                    throw new ArticleException("UNSUPPORTED_CONTENT", "Inline formatting has no supported native presentation");
                }
                try { markupType = MarkupType.valueOf(markup.type); }
                catch (IllegalArgumentException unsupported) { throw new ArticleException("UNSUPPORTED_CONTENT", "Unsupported inline formatting", unsupported); }
                MarkupData data = new MarkupData("Markup", markup.type.toLowerCase(Locale.ROOT), markupType,
                        markup.start, markup.end, markup.href, null, null,
                        "A".equals(markup.type) ? AnchorType.LINK : null, null, Collections.emptyList());
                markups.add(new ParagraphData$Markup("Markup", data));
            }
            ParagraphData$Metadata metadata = null;
            if (type == ParagraphType.IMG) {
                ArticleBody.Image image = block.image;
                String imageId = ReaderImages.register(image);
                ImageMetadataData data = new ImageMetadataData("ImageMetadata", imageId,
                        image.width > 0 ? image.width : null, image.height > 0 ? image.height : null,
                        null, null, image.alt);
                metadata = new ParagraphData$Metadata("ImageMetadata", imageId, data);
            }
            ParagraphData$CodeBlockMetadata code = null;
            if (type == ParagraphType.PRE) {
                String language = block.language != null && block.language.matches("[A-Za-z0-9_+.-]{1,48}") ? block.language : null;
                code = new ParagraphData$CodeBlockMetadata("CodeBlockMetadata", language,
                        language == null ? SyntaxHighlightMode.AUTO : SyntaxHighlightMode.EXPLICIT);
            }
            ParagraphData paragraph = new ParagraphData("Paragraph", name, name, null, block.text, null, null,
                    Collections.unmodifiableList(markups), metadata, null, type, false, null, code);
            paragraphs.add(new PostBodyData$Paragraph("Paragraph", name, paragraph));
        }
        SectionData section = new SectionData("Section", "mr_" + body.postId + "_section", 0);
        PostBodyData rich = new PostBodyData(prior.get__typename(),
                Collections.singletonList(new PostBodyData$Section("Section", section)), Collections.unmodifiableList(paragraphs));
        return withBody(original, rich, false);
    }
    private static FullPostQuery$Data withBody(FullPostQuery$Data original, PostBodyData rich, boolean locked) {
        FullPostQuery$Post post = original.getPost(); FullPostData full = post.getFullPostData();
        FullPostData$Content content = full.getContent();
        FullPostData$BodyModel model = new FullPostData$BodyModel(content.getBodyModel().get__typename(), rich);
        FullPostData$Content replacement = new FullPostData$Content(content.get__typename(), model, locked,
                content.getValidatedShareKey(), content.getShareKeyCreator());
        FullPostData updated = new FullPostData(full.get__typename(), full.getTags(), replacement, full.getId(),
                full.getPostMetaData(), full.getLinkMetadataList(), full.getPostFooterCountData(), full.getCustomFooterData(),
                full.getPostFeaturingStatusData(), full.getPostPromotionBannerData(), full.getPostRepostStateData(), full.getPostRepostCountData());
        return new FullPostQuery$Data(new FullPostQuery$Post(post.get__typename(), post.getId(), updated));
    }
}
