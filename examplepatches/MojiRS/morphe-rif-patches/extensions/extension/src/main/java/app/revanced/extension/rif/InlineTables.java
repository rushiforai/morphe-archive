package app.revanced.extension.rif;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Looper;
import android.text.Editable;
import android.text.Html;
import android.text.Layout;
import android.text.Selection;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.ClickableSpan;
import android.text.style.ImageSpan;
import android.text.style.ReplacementSpan;
import android.text.style.StyleSpan;
import android.text.style.URLSpan;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import org.xml.sax.XMLReader;

import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/**
 * Markdown tables drawn inline. rif shows a table as its cells' text with a "[View formatted
 * table]" link to a popup; this replaces that link and text with one {@link TableSpan} that
 * draws the table (borders, header, alignment, wrapped cells, tappable links). A tap on the
 * table, off its links, opens rif's popup as the link did.
 *
 * <p>{@link #embed} runs on rif's background render thread, before {@link InlineImages#embed}
 * (which therefore never sees the table's links). The pure parts are in {@link TableModel}.
 */
public final class InlineTables {
    private InlineTables() {}

    private static final String TAG = "RifInlineTables";
    private static final String POPOUT_SPAN = "com.andrewshu.android.reddit.comments.spans.TablePopoutSpan";
    private static final String SPOILER_TAG = "spoilerx";
    /** Width of the fade at the right edge of a table that runs off it. */
    private static final float FADE_DP = 24f;

    // ---- background: embed ----------------------------------------------------

    /**
     * Replaces each "[View formatted table]" link and its flattened cells in [body] with an
     * inline table. [callback] is the Thing being rendered (its raw HTML gives the table's
     * cells). A table whose flattened text isn't found as expected is left alone.
     */
    public static void embed(Object callback, SpannableStringBuilder body) {
        try {
            if (callback == null || body == null || body.length() == 0) return;
            if (!Settings.inlineTables()) return;
            if (Looper.myLooper() == Looper.getMainLooper()) return;

            List<URLSpan> popouts = new ArrayList<>();
            for (URLSpan s : body.getSpans(0, body.length(), URLSpan.class)) {
                if (s.getClass().getName().equals(POPOUT_SPAN)) popouts.add(s);
            }
            if (popouts.isEmpty()) return;

            Object[] raw = rawBody(callback);
            if (raw == null) return;
            final String html = (String) raw[0];
            final boolean escaped = (Boolean) raw[1];
            // Last table first, so a replacement doesn't shift the ranges still to do.
            Collections.sort(popouts, (a, b) -> Integer.compare(body.getSpanStart(b), body.getSpanStart(a)));
            for (URLSpan popout : popouts) {
                try {
                    embedOne(body, popout, html, escaped);
                } catch (Throwable t) {
                    Log.w(TAG, "table left as it was", t);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "inline tables failed", t);
        }
    }

    private static void embedOne(SpannableStringBuilder body, URLSpan popout, String html, boolean escaped) {
        int start = body.getSpanStart(popout);
        int end = body.getSpanEnd(popout);
        int n = TableModel.popoutIndex(popout.getURL());
        if (start < 0 || n < 0) return;
        String cut = TableModel.cutTable(html, n, escaped);
        TableModel.Table table = cut == null ? null : TableModel.parse(cut);
        if (table == null) {
            Log.w(TAG, "table " + n + ": can't read it from the body HTML; left as it was");
            return;
        }
        List<List<CellData>> rows = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        for (List<TableModel.Cell> row : table.rows) {
            List<CellData> out = new ArrayList<>();
            for (TableModel.Cell cell : row) {
                CellData data = buildCell(cell);
                out.add(data);
                texts.add(data.text.toString());
            }
            rows.add(out);
        }
        int[] range = TableModel.flattenedRange(body, start, end, texts);
        if (range == null) {
            Log.w(TAG, "table " + n + ": the body's text doesn't match its cells; left as it was");
            return;
        }

        // Everything in the range goes: the link lines and the cells' spans. The cells' links
        // are kept to open on a tap.
        List<URLSpan> links = new ArrayList<>();
        Object[] inside = body.getSpans(range[0], range[1], Object.class);
        List<Object> sorted = new ArrayList<>(java.util.Arrays.asList(inside));
        Collections.sort(sorted, (a, b) -> Integer.compare(body.getSpanStart(a), body.getSpanStart(b)));
        for (Object o : sorted) {
            if (body.getSpanStart(o) < range[0] || body.getSpanEnd(o) > range[1]) continue; // reaches outside
            if (o instanceof URLSpan && o != popout) links.add((URLSpan) o);
            body.removeSpan(o);
        }
        TableSpan span = new TableSpan(rows, table.columns, links);
        body.replace(range[0], range[1], "￼");
        body.setSpan(span, range[0], range[0] + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        // Top priority so rif's movement method (which takes the first ClickableSpan under the
        // tap) picks this one.
        body.setSpan(new TableClickSpan(span, popout), range[0], range[0] + 1,
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE | Spanned.SPAN_PRIORITY);
    }

    /**
     * Stub the patch rewrites to return the callback's raw body HTML (rif's
     * {@code BodyRenderTask.Callback} String getter, named per build). Never called unpatched.
     */
    public static String bodyHtml(Object callback) {
        return null;
    }

    /** Stub the patch rewrites: whether that HTML is itself HTML-escaped (the callback's boolean getter). */
    public static boolean bodyEscaped(Object callback) {
        return false;
    }

    /** The body's HTML and whether it's escaped, or null if there's no HTML. */
    private static Object[] rawBody(Object callback) {
        try {
            String html = bodyHtml(callback);
            if (html == null) return null;
            return new Object[]{html, bodyEscaped(callback)};
        } catch (Throwable t) {
            Log.w(TAG, "can't read the body HTML", t);
            return null;
        }
    }

    // ---- cells ------------------------------------------------------------------

    /** A cell: its styled text (links, bold, ...), header flag and alignment. */
    static final class CellData {
        final SpannableStringBuilder text;
        final int align;

        CellData(SpannableStringBuilder text, int align) {
            this.text = text;
            this.align = align;
        }
    }

    /** Hides its text behind a block of the text colour (a Reddit spoiler); the popup shows it. */
    private static final class SpoilerSpan extends CharacterStyle {
        @Override
        public void updateDrawState(TextPaint ds) {
            ds.bgColor = ds.getColor();
        }
    }

    private static final class Mark {}

    private static final Html.TagHandler SPOILERS = new Html.TagHandler() {
        @Override
        public void handleTag(boolean opening, String tag, Editable out, XMLReader reader) {
            if (!SPOILER_TAG.equalsIgnoreCase(tag)) return;
            int len = out.length();
            if (opening) {
                out.setSpan(new Mark(), len, len, Spanned.SPAN_MARK_MARK);
                return;
            }
            Mark[] marks = out.getSpans(0, len, Mark.class);
            if (marks.length == 0) return;
            Mark mark = marks[marks.length - 1];
            int from = out.getSpanStart(mark);
            out.removeSpan(mark);
            if (from >= 0 && from < len) out.setSpan(new SpoilerSpan(), from, len, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
    };

    private static CellData buildCell(TableModel.Cell cell) {
        // Html.fromHtml knows <tt> (monospace) but not <code>, and <s> but not <del>.
        String html = cell.html.replace("<del>", "<s>").replace("</del>", "</s>")
                .replace("<code>", "<tt>").replace("</code>", "</tt>");
        if (html.contains("md-spoiler-text")) {
            html = html.replaceAll("(?i)<span[^>]*md-spoiler-text[^>]*>", "<" + SPOILER_TAG + ">")
                    .replaceAll("(?i)</span>", "</" + SPOILER_TAG + ">");
        }
        Spanned parsed = fromHtml(html);
        SpannableStringBuilder text = new SpannableStringBuilder(parsed);
        // No pictures in cells: Html would draw its broken-image icon.
        for (ImageSpan img : text.getSpans(0, text.length(), ImageSpan.class)) text.removeSpan(img);
        if (cell.header && text.length() > 0) {
            text.setSpan(new StyleSpan(Typeface.BOLD), 0, text.length(), Spanned.SPAN_INCLUSIVE_INCLUSIVE);
        }
        return new CellData(text, cell.align);
    }

    private static Spanned fromHtml(String html) {
        if (Build.VERSION.SDK_INT >= 24) return fromHtmlN(html);
        return Html.fromHtml(html, null, SPOILERS);
    }

    @android.annotation.TargetApi(24)
    private static Spanned fromHtmlN(String html) {
        return Html.fromHtml(html, Html.FROM_HTML_MODE_LEGACY, null, SPOILERS);
    }

    // ---- main thread: attach, fit, taps -------------------------------------------

    /** True if [text] holds an inline table. */
    static boolean has(Spanned text) {
        return text.getSpans(0, text.length(), TableSpan.class).length > 0;
    }

    /**
     * Gives [text]'s tables [avail] px to lay out in; true if any changed size (their range is
     * re-set, so the TextView re-flows it).
     */
    static boolean fit(Spannable text, int avail) {
        boolean changed = false;
        for (TableSpan span : text.getSpans(0, text.length(), TableSpan.class)) {
            if (!span.setAvailable(avail)) continue;
            changed = true;
            text.setSpan(span, text.getSpanStart(span), text.getSpanEnd(span), text.getSpanFlags(span));
        }
        return changed;
    }

    /** Where the last touch on [tv] fell in [span]'s table (x, y from its top left), or null. */
    static float[] hit(TextView tv, TableSpan span) {
        float[] touch = InlineImages.lastTouch(tv);
        if (touch == null || !span.drawn) return null;
        float rx = touch[0] - tv.getTotalPaddingLeft() + tv.getScrollX() - span.drawX;
        float ry = touch[1] - tv.getTotalPaddingTop() + tv.getScrollY() - span.drawY;
        if (rx < 0 || ry < 0 || rx > span.drawW || ry > span.drawH) return null;
        return new float[]{rx, ry};
    }

    /** True if the last touch on [tv] landed on one of its inline tables. */
    static boolean onTable(TextView tv) {
        CharSequence text = tv.getText();
        if (!(text instanceof Spanned)) return false;
        for (TableSpan span : ((Spanned) text).getSpans(0, text.length(), TableSpan.class)) {
            if (hit(tv, span) != null) return true;
        }
        return false;
    }

    /**
     * The tap handler over a table: a link in a cell opens like a body link; anywhere else on
     * the table opens rif's popup (the original link's own click).
     */
    private static final class TableClickSpan extends ClickableSpan {
        private final TableSpan table;
        private final URLSpan popout;

        TableClickSpan(TableSpan table, URLSpan popout) {
            this.table = table;
            this.popout = popout;
        }

        @Override
        public void updateDrawState(TextPaint ds) {
            // No link styling: the table draws itself.
        }

        @Override
        public void onClick(View widget) {
            try {
                if (!(widget instanceof TextView)) return;
                TextView tv = (TextView) widget;
                // rif's movement method highlighted this span's range on touch-down; clear it,
                // as the image taps do.
                CharSequence text = tv.getText();
                if (text instanceof Spannable) Selection.removeSelection((Spannable) text);
                float[] at = hit(tv, table);
                // A tap on text next to the table that resolved to this span: not ours.
                if (at == null) return;
                tv.cancelPendingInputEvents(); // drop the queued comment-select click
                URLSpan link = table.linkAt(at[0], at[1]);
                (link != null ? link : popout).onClick(tv);
            } catch (Throwable t) {
                Log.w(TAG, "table tap failed", t);
            }
        }
    }

    // ---- the table span ----------------------------------------------------------

    /**
     * Draws a table in place of one character. Sized for [avail] px (set by {@link #fit}); its
     * cells are laid out lazily, on the main thread, for the text paint it's measured with.
     */
    static final class TableSpan extends ReplacementSpan {
        private final List<List<CellData>> rows;
        private final int columns;
        // The cell's link (as rif's body renders it) for each link span in the cell texts.
        private final Map<URLSpan, URLSpan> linkOf = new IdentityHashMap<>();

        private int avail;
        private Built built;
        private int builtAvail;
        private float builtSize;
        private int builtColor;
        private int builtLink;
        private Typeface builtFace;
        // Where it was last drawn, in the TextView's text coordinates (for tap hit-testing).
        volatile boolean drawn;
        volatile float drawX;
        volatile float drawY;
        volatile int drawW;
        volatile int drawH;

        TableSpan(List<List<CellData>> rows, int columns, List<URLSpan> bodyLinks) {
            this.rows = rows;
            this.columns = columns;
            this.avail = defaultWidth();
            List<URLSpan> inCells = new ArrayList<>();
            for (List<CellData> row : rows) {
                for (CellData cell : row) {
                    URLSpan[] ls = cell.text.getSpans(0, cell.text.length(), URLSpan.class);
                    List<URLSpan> sorted = new ArrayList<>(java.util.Arrays.asList(ls));
                    Collections.sort(sorted, (a, b) -> Integer.compare(
                            cell.text.getSpanStart(a), cell.text.getSpanStart(b)));
                    inCells.addAll(sorted);
                }
            }
            if (inCells.size() == bodyLinks.size()) { // same links in the same order
                for (int i = 0; i < inCells.size(); i++) linkOf.put(inCells.get(i), bodyLinks.get(i));
            } else { // by URL, each body link once
                List<URLSpan> free = new ArrayList<>(bodyLinks);
                for (URLSpan c : inCells) {
                    for (URLSpan b : free) {
                        if (b.getURL() != null && c.getURL() != null && b.getURL().endsWith(c.getURL())) {
                            linkOf.put(c, b);
                            free.remove(b);
                            break;
                        }
                    }
                }
            }
        }

        /** Before its TextView is laid out: the screen less the usual margins, as inline images. */
        private static int defaultWidth() {
            float d = Resources.getSystem().getDisplayMetrics().density;
            return Math.max(100, Resources.getSystem().getDisplayMetrics().widthPixels - Math.round(24 * d));
        }

        synchronized boolean setAvailable(int px) {
            if (px <= 0 || px == avail) return false;
            avail = px;
            return true;
        }

        /** The body link under (x, y) of the table, or null if that isn't on a link. */
        synchronized URLSpan linkAt(float x, float y) {
            Built b = built;
            if (b == null) return null;
            int r = indexOf(b.rowY, y);
            int c = indexOf(b.colX, x);
            if (r < 0 || c < 0 || r >= b.layouts.length || c >= b.layouts[r].length) return null;
            StaticLayout layout = b.layouts[r][c];
            float lx = x - (b.colX[c] + b.bw + b.padX);
            float ly = y - (b.rowY[r] + b.bw + b.padY);
            if (ly < 0 || ly > layout.getHeight()) return null;
            int line = layout.getLineForVertical((int) ly);
            if (lx < layout.getLineLeft(line) || lx > layout.getLineRight(line)) return null;
            int off = layout.getOffsetForHorizontal(line, lx);
            if (lx < layout.getPrimaryHorizontal(off) && off > 0) off--; // the character left of that edge
            Spanned text = (Spanned) layout.getText();
            for (URLSpan s : text.getSpans(off, off + 1, URLSpan.class)) {
                if (text.getSpanStart(s) <= off && off < text.getSpanEnd(s)) return linkOf.get(s);
            }
            return null;
        }

        /** Index i with edges[i] <= v < edges[i + 1], or -1. */
        private static int indexOf(int[] edges, float v) {
            for (int i = 0; i + 1 < edges.length; i++) if (v >= edges[i] && v < edges[i + 1]) return i;
            return -1;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            Built b = build(paint);
            if (fm != null) {
                // The table sits on the baseline and reaches up (like an inline image); the break
                // before it gives the gap above.
                float d = Resources.getSystem().getDisplayMetrics().density;
                fm.ascent = -b.height - Math.round(2 * d);
                fm.top = fm.ascent;
                fm.descent = 0;
                fm.bottom = 0;
            }
            return b.visible;
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y,
                         int bottom, Paint paint) {
            Built b = build(paint);
            float oy = y - b.height;
            drawX = x;
            drawY = oy;
            drawW = b.visible; // taps count on the visible part; cell positions stay the real ones
            drawH = b.height;
            drawn = true;
            boolean over = b.width > b.visible;
            if (over) {
                // Own layer, so the fade can erase to whatever the background is (light, dark, AMOLED).
                canvas.saveLayer(x, oy, x + b.visible, oy + b.height, null);
            } else {
                canvas.save();
            }
            canvas.translate(x, oy);
            if (over) canvas.clipRect(0, 0, b.visible, b.height);
            for (int r = 0; r <= b.layouts.length; r++) {
                canvas.drawRect(0, b.rowY[r], b.width, b.rowY[r] + b.bw, b.border);
            }
            for (int c = 0; c <= columns; c++) {
                canvas.drawRect(b.colX[c], 0, b.colX[c] + b.bw, b.height, b.border);
            }
            for (int r = 0; r < b.layouts.length; r++) {
                for (int c = 0; c < columns; c++) {
                    canvas.save();
                    canvas.translate(b.colX[c] + b.bw + b.padX, b.rowY[r] + b.bw + b.padY);
                    b.layouts[r][c].draw(canvas);
                    canvas.restore();
                }
            }
            if (over) {
                float fade = Math.min(FADE_DP * Resources.getSystem().getDisplayMetrics().density, b.visible);
                Paint p = new Paint();
                p.setShader(new LinearGradient(b.visible - fade, 0, b.visible, 0, 0x00000000, 0xFF000000,
                        Shader.TileMode.CLAMP));
                p.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
                canvas.drawRect(b.visible - fade, 0, b.visible, b.height, p);
            }
            canvas.restore();
        }

        private static int linkColor(Paint paint) {
            if (paint instanceof TextPaint && ((TextPaint) paint).linkColor != 0) {
                return ((TextPaint) paint).linkColor;
            }
            return 0xFF66CCDD; // rif's dark theme link colour, as in its table popup
        }

        /** The laid-out table for [paint]'s text size, colours and the current width. */
        private synchronized Built build(Paint paint) {
            float size = paint.getTextSize();
            int color = paint.getColor();
            int link = linkColor(paint);
            Typeface face = paint.getTypeface();
            if (built != null && builtAvail == avail && builtSize == size && builtColor == color
                    && builtLink == link && builtFace == face) {
                return built;
            }
            TextPaint tp = new TextPaint(paint);
            tp.linkColor = link;
            float d = Resources.getSystem().getDisplayMetrics().density;
            int bw = Math.max(1, Math.round(d));
            int padX = Math.round(5 * d);
            int padY = Math.round(3 * d);
            int[] natural = new int[columns];
            int[] whole = new int[columns]; // longest whole word
            int[] once = new int[columns]; // longest word broken at most once
            for (List<CellData> row : rows) {
                for (int c = 0; c < columns; c++) {
                    CharSequence t = row.get(c).text;
                    natural[c] = Math.max(natural[c], (int) Math.ceil(Layout.getDesiredWidth(t, 0, t.length(), tp)));
                    whole[c] = Math.max(whole[c], wordWidth(t, tp, false));
                    once[c] = Math.max(once[c], wordWidth(t, tp, true));
                }
            }
            for (int c = 0; c < columns; c++) {
                natural[c] += 2 * padX;
                whole[c] += 2 * padX;
                once[c] += 2 * padX;
            }
            int target = avail - (columns + 1) * bw;
            int[] widths = TableModel.columnWidths(natural, whole, once, target);

            int[] colX = new int[columns + 1];
            for (int c = 0; c < columns; c++) colX[c + 1] = colX[c] + bw + widths[c];
            int width = colX[columns] + bw;
            StaticLayout[][] layouts = new StaticLayout[rows.size()][columns];
            int[] rowY = new int[rows.size() + 1];
            for (int r = 0; r < rows.size(); r++) {
                int h = 0;
                for (int c = 0; c < columns; c++) {
                    CellData cell = rows.get(r).get(c);
                    Layout.Alignment align = cell.align == TableModel.CENTER ? Layout.Alignment.ALIGN_CENTER
                            : cell.align == TableModel.RIGHT ? Layout.Alignment.ALIGN_OPPOSITE
                            : Layout.Alignment.ALIGN_NORMAL;
                    layouts[r][c] = new StaticLayout(cell.text, tp, Math.max(1, widths[c] - 2 * padX),
                            align, 1f, 0f, false);
                    h = Math.max(h, layouts[r][c].getHeight());
                }
                rowY[r + 1] = rowY[r] + bw + h + 2 * padY;
            }
            Paint border = new Paint();
            border.setColor(Color.argb(0x66, Color.red(color), Color.green(color), Color.blue(color)));
            // Wider than the comment: report (and show) only the available width, so rif's own
            // layout isn't disturbed; the rest runs off the right edge, faded out.
            built = new Built(width, Math.min(width, avail), rowY[rows.size()] + bw, colX, rowY, layouts, bw,
                    padX, padY, border);
            builtAvail = avail;
            builtSize = size;
            builtColor = color;
            builtLink = link;
            builtFace = face;
            return built;
        }

        /**
         * The widest word of [t]: whole, or with [once] its word minimum
         * ({@link TableModel#wordMinimum}: broken at most once). Words split on whitespace only.
         * Measured with [tp] over the cell's own spans, so bold and the like count.
         */
        private static int wordWidth(CharSequence t, TextPaint tp, boolean once) {
            int widest = 0;
            int i = 0;
            int n = t.length();
            while (i < n) {
                while (i < n && Character.isWhitespace(t.charAt(i))) i++;
                int from = i;
                while (i < n && !Character.isWhitespace(t.charAt(i))) i++;
                if (i == from) continue;
                int whole = (int) Math.ceil(Layout.getDesiredWidth(t, from, i, tp));
                int mid = once ? TableModel.splitPoint(t, from, i) : -1;
                int word = whole;
                if (mid >= 0) {
                    word = TableModel.wordMinimum(Character.codePointCount(t, from, i), whole,
                            (int) Math.ceil(Layout.getDesiredWidth(t, from, mid, tp)),
                            (int) Math.ceil(Layout.getDesiredWidth(t, mid, i, tp)));
                }
                widest = Math.max(widest, word);
            }
            return widest;
        }
    }

    /** A table laid out for one width and text style. Row i spans rowY[i]..rowY[i+1]. */
    private static final class Built {
        final int width; // the table's real width; may exceed the available width
        final int visible; // min(width, available): what's reported to the layout and shown
        final int height;
        final int[] colX;
        final int[] rowY;
        final StaticLayout[][] layouts;
        final int bw;
        final int padX;
        final int padY;
        final Paint border;

        Built(int width, int visible, int height, int[] colX, int[] rowY, StaticLayout[][] layouts, int bw,
              int padX, int padY, Paint border) {
            this.width = width;
            this.visible = visible;
            this.height = height;
            this.colX = colX;
            this.rowY = rowY;
            this.layouts = layouts;
            this.bw = bw;
            this.padX = padX;
            this.padY = padY;
            this.border = border;
        }
    }
}
