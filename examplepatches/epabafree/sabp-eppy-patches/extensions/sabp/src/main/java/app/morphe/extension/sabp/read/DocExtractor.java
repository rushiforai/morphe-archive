package app.morphe.extension.sabp.read;

import android.content.Context;
import android.graphics.pdf.PdfRenderer;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Pulls readable text out of EPUB and PDF files without third-party libraries.
 *
 * <p>EPUB: reads the spine in order and converts XHTML to paragraphs with a tolerant scanner (no
 * strict XML parsing, so sloppy books still work). If the EPUB has EPUB 3 Media Overlays (for
 * example a "readaloud" book made by Storyteller), their text/audio pairs are kept so read-along
 * can be exact instead of estimated.
 *
 * <p>PDF: Android 15+ can extract text (PdfRenderer.Page#getTextContents). On older Android the PDF
 * is shown as page images that follow the audio by page.
 */
public final class DocExtractor {
    private DocExtractor() {
    }

    public static BookText extract(Context c, Uri uri, String displayName) throws Exception {
        String name = displayName != null ? displayName.toLowerCase(Locale.ROOT) : "";
        String type = c.getContentResolver().getType(uri);
        boolean pdf = name.endsWith(".pdf") || "application/pdf".equals(type);
        BookText t = pdf ? pdf(c, uri) : epub(c, uri);
        if (t.title == null || t.title.isEmpty()) t.title = displayName != null ? displayName : "";
        return t;
    }

    // ---- EPUB -----------------------------------------------------------------------------------

    private static BookText epub(Context c, Uri uri) throws Exception {
        Map<String, byte[]> files = new HashMap<>();
        try (InputStream in = c.getContentResolver().openInputStream(uri);
             ZipInputStream zip = new ZipInputStream(in)) {
            ZipEntry e;
            byte[] buf = new byte[16384];
            while ((e = zip.getNextEntry()) != null) {
                String n = e.getName();
                String lower = n.toLowerCase(Locale.ROOT);
                if (!(lower.endsWith(".xml") || lower.endsWith(".opf") || lower.endsWith(".xhtml") || lower.endsWith(".html")
                        || lower.endsWith(".htm") || lower.endsWith(".smil") || lower.endsWith(".ncx"))) continue;
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                int r;
                while ((r = zip.read(buf)) > 0) out.write(buf, 0, r);
                files.put(n, out.toByteArray());
            }
        }
        byte[] container = files.get("META-INF/container.xml");
        if (container == null) throw new IllegalArgumentException("Not an EPUB (no META-INF/container.xml)");
        String opfPath = attr(firstTag(str(container), "rootfile"), "full-path");
        if (opfPath == null) throw new IllegalArgumentException("EPUB has no package file");
        byte[] opfBytes = files.get(opfPath);
        if (opfBytes == null) throw new IllegalArgumentException("EPUB package file missing: " + opfPath);
        String opf = str(opfBytes);
        String base = opfPath.contains("/") ? opfPath.substring(0, opfPath.lastIndexOf('/') + 1) : "";

        BookText t = new BookText();
        t.title = decode(innerText(opf, "dc:title"));
        t.language = innerText(opf, "dc:language");
        t.author = decode(innerText(opf, "dc:creator"));
        t.description = decode(innerText(opf, "dc:description").replaceAll("&lt;[^&]*&gt;", " ")).replaceAll("<[^>]+>", " ").replaceAll("\\s+", " ").trim();

        // manifest: id -> [href, media-type, media-overlay]
        Map<String, String[]> manifest = new HashMap<>();
        Matcher items = Pattern.compile("<(?:\\w+:)?item\\b[^>]*>", Pattern.CASE_INSENSITIVE).matcher(opf);
        while (items.find()) {
            String tag = items.group();
            String id = attr(tag, "id");
            if (id != null) manifest.put(id, new String[]{attr(tag, "href"), attr(tag, "media-type"), attr(tag, "media-overlay")});
        }
        List<String> spine = new ArrayList<>();
        Matcher refs = Pattern.compile("<(?:\\w+:)?itemref\\b[^>]*>", Pattern.CASE_INSENSITIVE).matcher(opf);
        while (refs.find()) {
            String tag = refs.group();
            String linear = attr(tag, "linear");
            if ("no".equalsIgnoreCase(linear)) continue;
            String idref = attr(tag, "idref");
            if (idref != null) spine.add(idref);
        }

        // ids of anchors in each document -> (para, char offset)
        Map<String, int[]> anchors = new HashMap<>();
        List<String[]> overlayDocs = new ArrayList<>(); // [docPath, smilPath]
        for (String id : spine) {
            String[] item = manifest.get(id);
            if (item == null || item[0] == null) continue;
            String path = resolve(base, item[0]);
            byte[] html = files.get(path);
            if (html == null) continue;
            String nav = item[1] != null ? item[1] : "";
            if (!nav.contains("html") && !nav.contains("xml")) continue;
            Xhtml.toParagraphs(str(html), t, path, anchors);
            if (item[2] != null && manifest.get(item[2]) != null) {
                overlayDocs.add(new String[]{path, resolve(base, manifest.get(item[2])[0])});
            }
        }
        t.index();
        if (!overlayDocs.isEmpty()) readOverlays(t, files, overlayDocs, anchors);
        return t;
    }

    /** EPUB 3 Media Overlays: <par><text src="doc#id"/><audio src=".." clipBegin=".." clipEnd=".."/></par>. */
    private static void readOverlays(BookText t, Map<String, byte[]> files, List<String[]> docs, Map<String, int[]> anchors) {
        LinkedHashMap<String, Double> audioLength = new LinkedHashMap<>();
        List<Object[]> clips = new ArrayList<>(); // [audio, begin, wordIndex]
        Pattern par = Pattern.compile("<(?:\\w+:)?par\\b.*?</(?:\\w+:)?par>", Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
        for (String[] d : docs) {
            byte[] smilBytes = files.get(d[1]);
            if (smilBytes == null) continue;
            String smil = str(smilBytes);
            String smilBase = d[1].contains("/") ? d[1].substring(0, d[1].lastIndexOf('/') + 1) : "";
            Matcher m = par.matcher(smil);
            while (m.find()) {
                String block = m.group();
                String text = attr(firstTag(block, "text"), "src");
                String audioTag = firstTag(block, "audio");
                String audio = attr(audioTag, "src");
                if (text == null || audio == null) continue;
                double begin = clock(attr(audioTag, "clipBegin"));
                double end = clock(attr(audioTag, "clipEnd"));
                String docPath = resolve(smilBase, text.contains("#") ? text.substring(0, text.indexOf('#')) : text);
                String frag = text.contains("#") ? text.substring(text.indexOf('#') + 1) : "";
                int[] pos = anchors.get(docPath + "#" + frag);
                if (pos == null) continue;
                int word = wordAt(t, pos[0], pos[1]);
                String audioPath = resolve(smilBase, audio);
                Double len = audioLength.get(audioPath);
                audioLength.put(audioPath, Math.max(len != null ? len : 0, end));
                clips.add(new Object[]{audioPath, begin, word});
            }
        }
        // Audio files play back to back: global time = sum of earlier files + clip begin.
        Map<String, Double> offset = new HashMap<>();
        double acc = 0;
        for (Map.Entry<String, Double> e : audioLength.entrySet()) {
            offset.put(e.getKey(), acc);
            acc += e.getValue();
        }
        for (Object[] clip : clips) {
            Double off = offset.get((String) clip[0]);
            if (off == null) continue;
            t.overlays.add(new BookText.Overlay((Integer) clip[2], off + (Double) clip[1]));
        }
    }

    private static int wordAt(BookText t, int para, int offset) {
        if (para >= t.paras.size()) return Math.max(0, t.wordCount() - 1);
        BookText.Para p = t.paras.get(para);
        for (int w = p.firstWord; w < p.firstWord + p.wordCount; w++) {
            if (t.wordStart[w] >= offset) return w;
        }
        return Math.min(t.wordCount() - 1, p.firstWord + Math.max(0, p.wordCount - 1));
    }

    static double clock(String v) {
        if (v == null) return 0;
        v = v.trim();
        try {
            if (v.endsWith("ms")) return Double.parseDouble(v.substring(0, v.length() - 2)) / 1000.0;
            if (v.endsWith("s")) return Double.parseDouble(v.substring(0, v.length() - 1));
            if (v.endsWith("min")) return Double.parseDouble(v.substring(0, v.length() - 3)) * 60;
            if (v.endsWith("h")) return Double.parseDouble(v.substring(0, v.length() - 1)) * 3600;
            String[] parts = v.split(":");
            double s = 0;
            for (String p : parts) s = s * 60 + Double.parseDouble(p);
            return s;
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // ---- PDF ------------------------------------------------------------------------------------

    private static BookText pdf(Context c, Uri uri) throws Exception {
        BookText t = new BookText();
        try (ParcelFileDescriptor pfd = c.getContentResolver().openFileDescriptor(uri, "r");
             PdfRenderer r = new PdfRenderer(pfd)) {
            t.pageCount = r.getPageCount();
            boolean text = Build.VERSION.SDK_INT >= 35;
            int textChars = 0;
            for (int i = 0; i < t.pageCount; i++) {
                if (text) {
                    try (PdfRenderer.Page page = r.openPage(i)) {
                        String pageText = pageText(page);
                        textChars += pageText.trim().length();
                        // Lines ending without punctuation continue the paragraph.
                        String[] blocks = pageText.split("\\n\\s*\\n|(?<=[.!?”\"])\\s*\\n");
                        for (String b : blocks) t.addPara(b.replace('\n', ' '), false, i);
                    }
                }
            }
            if (!text || textChars < t.pageCount * 20) {
                // No text layer (scanned PDF) or Android < 15: follow along by page instead.
                t.paras.clear();
                t.pagesOnly = true;
                for (int i = 0; i < t.pageCount; i++) t.paras.add(new BookText.Para("Page " + (i + 1), true, i));
            }
        }
        t.index();
        return t;
    }

    @android.annotation.TargetApi(35)
    private static String pageText(PdfRenderer.Page page) {
        StringBuilder sb = new StringBuilder();
        for (android.graphics.pdf.content.PdfPageTextContent tc : page.getTextContents()) {
            sb.append(tc.getText()).append('\n');
        }
        return sb.toString();
    }

    // ---- small helpers ------------------------------------------------------------------------

    static String str(byte[] b) {
        return new String(b, StandardCharsets.UTF_8);
    }

    static String firstTag(String s, String name) {
        if (s == null) return null;
        Matcher m = Pattern.compile("<(?:\\w+:)?" + name + "\\b[^>]*>", Pattern.CASE_INSENSITIVE).matcher(s);
        return m.find() ? m.group() : null;
    }

    static String attr(String tag, String name) {
        if (tag == null) return null;
        Matcher m = Pattern.compile("(?:^|\\s)(?:\\w+:)?" + Pattern.quote(name) + "\\s*=\\s*(\"([^\"]*)\"|'([^']*)')", Pattern.CASE_INSENSITIVE).matcher(tag);
        if (!m.find()) return null;
        return m.group(2) != null ? m.group(2) : m.group(3);
    }

    static String innerText(String s, String tag) {
        Matcher m = Pattern.compile("<" + Pattern.quote(tag) + "\\b[^>]*>(.*?)</" + Pattern.quote(tag) + ">", Pattern.DOTALL | Pattern.CASE_INSENSITIVE).matcher(s);
        return m.find() ? m.group(1).replaceAll("<[^>]+>", "").trim() : "";
    }

    static String resolve(String base, String href) {
        try {
            href = java.net.URLDecoder.decode(href, "UTF-8");
        } catch (Exception ignored) {
        }
        String path = href.startsWith("/") ? href.substring(1) : base + href;
        ArrayList<String> out = new ArrayList<>();
        for (String part : path.split("/")) {
            if (part.isEmpty() || part.equals(".")) continue;
            if (part.equals("..")) {
                if (!out.isEmpty()) out.remove(out.size() - 1);
            } else out.add(part);
        }
        return String.join("/", out);
    }

    static String decode(String s) {
        return Xhtml.entities(s);
    }
}
