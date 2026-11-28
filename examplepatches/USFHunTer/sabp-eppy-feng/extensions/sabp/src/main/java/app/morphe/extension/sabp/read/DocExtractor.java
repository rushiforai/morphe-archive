package app.morphe.extension.sabp.read;

import android.content.Context;
import android.graphics.pdf.PdfRenderer;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;

import java.io.InputStream;
import java.util.Locale;

/**
 * Pulls readable text out of EPUB and PDF files without third-party libraries.
 *
 * <p>EPUB: see {@link Epub} (plain Java, shared with the PC read-along helper).
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
        try (InputStream in = c.getContentResolver().openInputStream(uri)) {
            if (in == null) throw new IllegalArgumentException("Can't open the EPUB");
            return Epub.read(in);
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
}
