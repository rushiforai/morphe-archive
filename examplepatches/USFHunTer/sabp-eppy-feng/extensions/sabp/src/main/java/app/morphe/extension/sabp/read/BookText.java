package app.morphe.extension.sabp.read;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * The text of an attached EPUB/PDF as paragraphs, plus a word index used for alignment.
 * Words are normalised (lower case, letters/digits only) for matching; the original text is kept
 * for display.
 */
public final class BookText {
    public static final class Para {
        public final String text;
        public final boolean heading;
        public final int page; // PDF page (0-based) or -1
        public int firstWord;  // index into words
        public int wordCount;

        Para(String text, boolean heading, int page) {
            this.text = text;
            this.heading = heading;
            this.page = page;
        }
    }

    /** A media-overlay clip from the EPUB (exact text/time pairs), in global book seconds. */
    public static final class Overlay {
        public final int word;
        public final double seconds;

        public Overlay(int word, double seconds) {
            this.word = word;
            this.seconds = seconds;
        }
    }

    public final List<Para> paras = new ArrayList<>();
    public final List<Overlay> overlays = new ArrayList<>();
    public String title = "";
    public String language = "";
    public String author = "";
    public String description = "";
    public int pageCount; // PDF only
    public boolean pagesOnly; // PDF without extractable text

    // Word index.
    public String[] words = new String[0];
    public int[] wordPara = new int[0];   // which paragraph a word is in
    public int[] wordStart = new int[0];  // char offset in that paragraph
    public int[] wordEnd = new int[0];


    public int wordCount() {
        return words.length;
    }

    public void addPara(String text, boolean heading, int page) {
        String t = text.replaceAll("\\s+", " ").trim();
        if (t.isEmpty()) return;
        paras.add(new Para(t, heading, page));
    }

    /** Builds the word index after all paragraphs were added. */
    public void index() {
        ArrayList<String> w = new ArrayList<>();
        ArrayList<int[]> meta = new ArrayList<>();
        for (int p = 0; p < paras.size(); p++) {
            Para para = paras.get(p);
            para.firstWord = w.size();
            String s = para.text;
            int i = 0, n = s.length();
            while (i < n) {
                while (i < n && !Character.isLetterOrDigit(s.charAt(i))) i++;
                int start = i;
                while (i < n && (Character.isLetterOrDigit(s.charAt(i)) || s.charAt(i) == '\'' || s.charAt(i) == '’')) i++;
                if (i > start) {
                    String norm = normalize(s.substring(start, i));
                    if (!norm.isEmpty()) {
                        w.add(norm);
                        meta.add(new int[]{p, start, i});
                    }
                }
            }
            para.wordCount = w.size() - para.firstWord;
        }
        words = w.toArray(new String[0]);
        wordPara = new int[words.length];
        wordStart = new int[words.length];
        wordEnd = new int[words.length];
        for (int k = 0; k < words.length; k++) {
            int[] m = meta.get(k);
            wordPara[k] = m[0];
            wordStart[k] = m[1];
            wordEnd[k] = m[2];
        }
        sections = null;
    }

    public static String normalize(String s) {
        StringBuilder b = new StringBuilder(s.length());
        String lower = s.toLowerCase(Locale.ROOT);
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if (Character.isLetterOrDigit(c)) b.append(c);
        }
        return b.toString();
    }

    /** A document chapter/section: heading text and the first word it covers. */
    public static final class Section {
        public final String title;
        public final int para;
        public final int firstWord;

        Section(String title, int para, int firstWord) {
            this.title = title;
            this.para = para;
            this.firstWord = firstWord;
        }
    }

    private List<Section> sections;

    private static final java.util.regex.Pattern HEADING_LIKE = java.util.regex.Pattern.compile(
            "(?i)^(chapter|part|book|prologue|epilogue|interlude|section|act)\\b.{0,60}$|^[0-9]{1,3}\\.?$|^[ivxlcdm]{1,8}\\.?$");

    /**
     * Sections from headings (EPUB h1–h6) or, failing that, short heading-like paragraphs
     * ("Chapter 12", "XII", "Part Two"). Used to align audio chapters coarsely and to keep each
     * search window inside one part of the book.
     */
    public List<Section> sections() {
        if (sections != null) return sections;
        ArrayList<Section> out = new ArrayList<>();
        boolean anyHeading = false;
        for (Para p : paras) if (p.heading) { anyHeading = true; break; }
        for (int i = 0; i < paras.size(); i++) {
            Para p = paras.get(i);
            boolean h = anyHeading ? p.heading : (p.text.length() <= 60 && HEADING_LIKE.matcher(p.text.trim()).matches());
            if (h && p.wordCount > 0) out.add(new Section(p.text, i, p.firstWord));
        }
        sections = out;
        return out;
    }

    /** Index of the paragraph containing a word (clamped). */
    public int paraOfWord(int word) {
        if (words.length == 0) return 0;
        return wordPara[Math.max(0, Math.min(words.length - 1, word))];
    }

    /** Start/end word of the sentence containing word w. */
    public int[] sentence(int w) {
        if (words.length == 0) return new int[]{0, 0};
        w = Math.max(0, Math.min(words.length - 1, w));
        int p = wordPara[w];
        String s = paras.get(p).text;
        int start = w;
        while (start > paras.get(p).firstWord) {
            int prevEnd = wordEnd[start - 1];
            if (endsSentence(s, prevEnd, wordStart[start])) break;
            start--;
        }
        int end = w;
        int last = paras.get(p).firstWord + paras.get(p).wordCount - 1;
        while (end < last) {
            if (endsSentence(s, wordEnd[end], wordStart[end + 1])) break;
            end++;
        }
        return new int[]{start, end};
    }

    private static boolean endsSentence(String s, int from, int to) {
        for (int i = from; i < to && i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '.' || c == '!' || c == '?' || c == '…' || c == ';' || c == ':') return true;
        }
        return false;
    }

    // ---- cache ----------------------------------------------------------------------------

    public JSONObject toJson() throws Exception {
        JSONObject o = new JSONObject();
        o.put("v", 3);
        o.put("title", title);
        o.put("language", language);
        o.put("author", author);
        o.put("description", description);
        o.put("pageCount", pageCount);
        o.put("pagesOnly", pagesOnly);
        JSONArray ps = new JSONArray();
        for (Para p : paras) {
            JSONArray a = new JSONArray();
            a.put(p.text);
            a.put(p.heading ? 1 : 0);
            a.put(p.page);
            ps.put(a);
        }
        o.put("paras", ps);
        JSONArray ov = new JSONArray();
        for (Overlay x : overlays) {
            ov.put(x.word);
            ov.put(x.seconds);
        }
        o.put("overlays", ov);
        return o;
    }

    public static BookText fromJson(JSONObject o) throws Exception {
        if (o.optInt("v") != 3 && o.optInt("v") != 2) return null;
        BookText t = new BookText();
        t.title = o.optString("title");
        t.language = o.optString("language");
        t.author = o.optString("author");
        t.description = o.optString("description");
        t.pageCount = o.optInt("pageCount");
        t.pagesOnly = o.optBoolean("pagesOnly");
        JSONArray ps = o.getJSONArray("paras");
        for (int i = 0; i < ps.length(); i++) {
            JSONArray a = ps.getJSONArray(i);
            t.paras.add(new Para(a.getString(0), a.getInt(1) == 1, a.getInt(2)));
        }
        t.index();
        JSONArray ov = o.optJSONArray("overlays");
        if (ov != null) {
            for (int i = 0; i + 1 < ov.length(); i += 2) t.overlays.add(new Overlay(ov.getInt(i), ov.getDouble(i + 1)));
        }
        return t;
    }
}
