import com.medium.android.graphql.FullPostQuery$Data;
import com.medium.android.graphql.fragment.*;
import com.medium.android.graphql.type.PostVisibilityType;
import nl.johninnl.medium.reader.*;
import nl.johninnl.medium.privacy.WebPrivacyRules;
import java.net.URI;
import java.time.Instant;
import java.util.*;

/** Export only public editorial fields. No viewer/account/share-key objects enter disk. */
public final class MediumReaderOfflineSnapshots {
    private MediumReaderOfflineSnapshots() {}
    public static void remember(FullPostQuery$Data data, ArticleLoader source) {
        if (!(source instanceof CachedArticleLoader)) return;
        long epoch = source.cacheEpoch();
        try { ReaderRuntime.workers().execute(() -> {
            try {
                ArticleBody body = publicBody(data);
                if (body != null) ((CachedArticleLoader)source).saveNative(body, data.getPost().getFullPostData().getPostMetaData().getLatestPublishedVersion(), epoch);
            } catch (ArticleException | java.io.IOException | RuntimeException ignored) { /* Optional cache export must not break the live reader. */ }
        }); } catch (java.util.concurrent.RejectedExecutionException busy) { }
    }
    public static ArticleBody publicBody(FullPostQuery$Data data) throws ArticleException {
        if (data == null || data.getPost() == null) return null;
        FullPostData full = data.getPost().getFullPostData(); PostMetaData meta = full.getPostMetaData();
        if (full.getContent().isLockedPreviewOnly() ||
            (meta.getVisibility() != PostVisibilityType.PUBLIC && meta.getVisibility() != PostVisibilityType.LOCKED) || meta.getLatestPublishedVersion() == null) return null;
        URI canonical = WebPrivacyRules.safe(meta.getMediumUrl());
        if (canonical == null) canonical = URI.create("https://medium.com/p/" + data.getPost().getId());
        else try { canonical = new URI(canonical.getScheme(), null, canonical.getHost(), canonical.getPort(), canonical.getPath(), null, null); }
        catch (java.net.URISyntaxException invalid) { return null; }
        List<ArticleBody.Block> blocks = new ArrayList<>();
        for (Object item : full.getContent().getBodyModel().getPostBodyData().getParagraphs()) {
            ParagraphData p = ((PostBodyData$Paragraph)item).getParagraphData(); String type = p.getType() == null ? "P" : ((Enum<?>)p.getType()).name();
            String text = p.getText() == null ? "" : p.getText(); List<ArticleBody.Markup> markups = new ArrayList<>();
            for (Object span : p.getMarkups()) {
                MarkupData m = ((ParagraphData$Markup)span).getMarkupData(); if (m.getType() == null) continue; String kind = ((Enum<?>)m.getType()).name();
                if (!Arrays.asList("STRONG","EM","CODE","A").contains(kind) || m.getStart() < 0 || m.getEnd() <= m.getStart() || m.getEnd() > text.length()) continue;
                if (kind.equals("A") && WebPrivacyRules.safe(m.getHref()) == null) continue;
                markups.add(new ArticleBody.Markup(kind, m.getStart(), m.getEnd(), m.getHref()));
            }
            ArticleBody.Image image = null;
            if (type.equals("IMG")) {
                ImageMetadataData m = p.getMetadata() == null ? null : p.getMetadata().getImageMetadataData();
                if (m == null || m.getId() == null) continue;
                URI url = ReaderImages.sourceUri(m.getId());
                if (url == null && m.getId().matches("[01]\\*[^/?#\\s]+")) url = URI.create("https://cdn-images-1.medium.com/v2/resize:fit:1400/format:webp/" + m.getId());
                if (url == null || WebPrivacyRules.blocked(url.toString())) continue;
                image = new ArticleBody.Image(m.getId(), url, m.getAlt(), m.getOriginalWidth() == null ? 0 : Math.max(0,m.getOriginalWidth()), m.getOriginalHeight() == null ? 0 : Math.max(0,m.getOriginalHeight()));
            } else if (!Arrays.asList("P","H1","H2","H3","H4","ULI","OLI","BQ","PQ","PRE","HR","SECTION_CAPTION").contains(type)) {
                type = "P"; URI link = WebPrivacyRules.embedTarget(p.getHref());
                if (link != null) { if (!text.isEmpty()) text += "\n"; int start = text.length(); text += "Open related content"; markups.add(new ArticleBody.Markup("A",start,text.length(),link.toString())); }
            }
            if (!text.isEmpty() || image != null || type.equals("HR")) blocks.add(new ArticleBody.Block(type,text,markups,image,p.getCodeBlockMetadata() == null ? null : p.getCodeBlockMetadata().getLang()));
        }
        if (blocks.isEmpty()) return null;
        String updated = meta.getUpdatedAt() == null ? null : Instant.ofEpochMilli(meta.getUpdatedAt()).toString();
        return new ArticleBody(data.getPost().getId(), meta.getTitle(), canonical, updated, blocks, Collections.singletonList("NATIVE_PUBLIC_SNAPSHOT"));
    }
}
