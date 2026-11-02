// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.tables;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.text.Layout;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.text.style.ReplacementSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.URLSpan;
import android.view.View;
import android.widget.TextView;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import app.morphe.extension.shared.Logger;

import static app.morphe.extension.shared.StringRef.str;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Reddit tables, drawn as a grid inside the text instead of the app's "header: value" lines.
 * The table takes one character of the text. Wide tables can be expanded and scrolled sideways,
 * and links in cells can be tapped (see TableTouch).
 */
public final class TableSpan extends ReplacementSpan {
    private static final int PAD_H_DP = 6;
    private static final int PAD_V_DP = 4;
    private static final int MIN_COLUMN_DP = 40;
    private static final int MARGIN_BELOW_DP = 4;
    /** In expanded mode, cells wider than this (or 90% of the view) still wrap. */
    private static final int MAX_EXPANDED_COLUMN_DP = 320;

    /** A parsed table: header cells (may be empty), body rows, and the column alignments. */
    static final class Table {
        final List<CharSequence> header = new ArrayList<>();
        final List<List<CharSequence>> rows = new ArrayList<>();
        final List<Layout.Alignment> alignments = new ArrayList<>();

        int columns() {
            int n = header.size();
            for (List<CharSequence> row : rows) n = Math.max(n, row.size());
            return n;
        }

        Layout.Alignment alignment(int column) {
            return column < alignments.size() && alignments.get(column) != null
                    ? alignments.get(column) : Layout.Alignment.ALIGN_NORMAL;
        }
    }

    final Table table;
    private final float density;
    private int maxWidth;
    /** Set when the TextView handles table touches (expand button, horizontal scroll). */
    boolean interactive;
    private float scrollX;

    /** Tables expanded by the user, by content, so the state survives the list recycling views. */
    private static final Map<String, Boolean> EXPANDED = Collections.synchronizedMap(new HashMap<String, Boolean>());
    private final String key;

    // Layout cache, rebuilt when the width, text size, color or mode changes.
    private int cachedWidth = -1;
    private float cachedTextSize = -1;
    private int cachedColor;
    private boolean cachedExpanded;
    private boolean cachedInteractive;
    private StaticLayout[][] layouts;
    private int[] columnWidths;
    private int[] rowHeights;
    private boolean canExpand;
    private int gridWidth;
    private int gridHeight;
    private int visibleWidth;
    private int scrollbarHeight;
    private int totalHeight;
    private final RectF toggleRect = new RectF();
    private int padH;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint labelPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);

    TableSpan(Table table) {
        this.table = table;
        this.key = key(table);
        density = Resources.getSystem().getDisplayMetrics().density;
        // Until the text is laid out, assume nearly the whole screen width.
        maxWidth = Resources.getSystem().getDisplayMetrics().widthPixels - dp(40);
    }

    // region Hooks

    /**
     * Called at the start of RedditSpannerBase.appendTable(builder, element). Appends the table
     * as one character with a TableSpan and returns its start, or -1 to let the app flatten it.
     */
    static int appendTable(Object spanner, SpannableStringBuilder builder, Object element) {
        try {
            // Paragraph break before the table first: building the cells' links with the app's
            // spanner must not consume it. (If the table is dropped, the app's own flush is a no-op.)
            Method pending = findMethod(spanner.getClass(), "appendPendingParagraph", SpannableStringBuilder.class);
            pending.invoke(spanner, builder);
            Table table;
            SPANNER.set(spanner);
            try {
                table = parse(element);
            } finally {
                SPANNER.remove();
            }
            if (table.columns() == 0 || (table.rows.isEmpty() && table.header.isEmpty())) return -1;
            int start = builder.length();
            builder.append('￼');
            TableSpan span = new TableSpan(table);
            builder.setSpan(span, start, start + 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            return start;
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "Could not build the table, using the app's text", t);
            return -1;
        }
    }

    /**
     * Called when a comment or post text is set: sizes the tables to the TextView's real width
     * and lets the view handle table touches (expand button, horizontal scrolling).
     */
    static void fitToView(final TextView textView) {
        CharSequence text = textView.getText();
        if (!(text instanceof Spanned)) return;
        TableSpan[] spans = ((Spanned) text).getSpans(0, text.length(), TableSpan.class);
        if (spans.length == 0) return;
        TableTouch.install(textView, null);
        TableAccessibility.install(textView);
        for (TableSpan span : spans) span.interactive = true;
        Runnable fit = new Runnable() {
            @Override
            public void run() {
                int width = textView.getWidth() - textView.getTotalPaddingLeft() - textView.getTotalPaddingRight();
                if (width <= 0) return;
                CharSequence current = textView.getText();
                if (!(current instanceof Spanned)) return;
                for (TableSpan span : ((Spanned) current).getSpans(0, current.length(), TableSpan.class)) {
                    span.maxWidth = width;
                }
                relayout(textView);
            }
        };
        relayout(textView);
        textView.post(fit);
    }

    /** Makes the TextView measure the tables again (size or mode changed). */
    static void relayout(TextView textView) {
        CharSequence current = textView.getText();
        if (current instanceof android.text.Spannable) {
            // Setting the span again makes the TextView lay the line out again.
            android.text.Spannable spannable = (android.text.Spannable) current;
            for (TableSpan span : spannable.getSpans(0, spannable.length(), TableSpan.class)) {
                int start = spannable.getSpanStart(span);
                int end = spannable.getSpanEnd(span);
                int flags = spannable.getSpanFlags(span);
                spannable.removeSpan(span);
                spannable.setSpan(span, start, end, flags);
            }
            textView.requestLayout();
            textView.invalidate();
        } else if (current != null) {
            textView.setText(current);
        }
    }

    // endregion

    // region Parsing (RedditParser.Element / Text, through reflection)

    static Table parse(Object element) throws Exception {
        Table table = new Table();
        Object thead = call(element, "selectSingleNode", "thead");
        Object tbody = call(element, "selectSingleNode", "tbody");
        if (tbody == null) tbody = element;

        List<?> headerCells = null;
        if (thead != null) {
            Object headerRow = call(thead, "selectSingleNode", "tr");
            if (headerRow != null) headerCells = (List<?>) call(headerRow, "selectChildren", "th");
        }
        if (headerCells != null) {
            for (Object cell : headerCells) {
                table.header.add(cellText(cell));
                table.alignments.add(alignment((String) call(cell, "getAttribute", "align")));
            }
        }
        for (Object row : (List<?>) call(tbody, "selectChildren", "tr")) {
            List<?> cells = (List<?>) call(row, "selectChildren", "td");
            if (cells.isEmpty()) cells = (List<?>) call(row, "selectChildren", "th");
            List<CharSequence> texts = new ArrayList<>();
            for (int i = 0; i < cells.size(); i++) {
                Object cell = cells.get(i);
                texts.add(cellText(cell));
                if (i >= table.alignments.size()) table.alignments.add(alignment((String) call(cell, "getAttribute", "align")));
            }
            table.rows.add(texts);
        }
        return table;
    }

    static Layout.Alignment alignment(String align) {
        if (align == null) return Layout.Alignment.ALIGN_NORMAL;
        switch (align.trim().toLowerCase(Locale.ROOT)) {
            case "center":
                return Layout.Alignment.ALIGN_CENTER;
            case "right":
                return Layout.Alignment.ALIGN_OPPOSITE;
            default:
                return Layout.Alignment.ALIGN_NORMAL;
        }
    }

    /** The cell's text with its links, bold, italic, strikethrough and code. */
    private static CharSequence cellText(Object cell) throws Exception {
        SpannableStringBuilder out = new SpannableStringBuilder();
        appendNode(out, cell);
        return trim(out);
    }

    private static void appendNode(SpannableStringBuilder out, Object node) throws Exception {
        String name;
        try {
            name = (String) node.getClass().getField("name").get(node);
        } catch (NoSuchFieldException e) {
            // A text node.
            String text = (String) node.getClass().getMethod("getText").invoke(node);
            out.append(text.replaceAll("\\s+", " "));
            return;
        }
        String tag = name == null ? "" : name.toLowerCase(Locale.ROOT);
        if (tag.equals("br")) {
            out.append('\n');
            return;
        }
        int start = out.length();
        List<?> children = (List<?>) node.getClass().getField("children").get(node);
        if (children != null) {
            for (Object child : children) appendNode(out, child);
        }
        int end = out.length();
        if (end <= start) return;
        switch (tag) {
            case "a":
                Object link = appLink(node);
                if (link == null) {
                    String href = (String) call(node, "getAttribute", "href");
                    if (href != null) link = new URLSpan(absolute(href));
                }
                if (link != null) out.setSpan(link, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                break;
            case "strong":
            case "b":
                out.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                break;
            case "em":
            case "i":
                out.setSpan(new StyleSpan(Typeface.ITALIC), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                break;
            case "del":
            case "s":
            case "strike":
                out.setSpan(new StrikethroughSpan(), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                break;
            case "code":
                out.setSpan(new TypefaceSpan("monospace"), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                break;
            default:
                break;
        }
    }

    /** The app's spanner building this table, so cell links are made by the app itself. */
    private static final ThreadLocal<Object> SPANNER = new ThreadLocal<>();

    /**
     * The link span the app makes for an <a> (in-app browser, subreddit and user links,
     * spoilers...), so tapping a link in a table does what it does anywhere else. Null if unknown.
     */
    private static ClickableSpan appLink(Object anchor) {
        Object spanner = SPANNER.get();
        if (spanner == null) return null;
        try {
            Method append = findMethod(spanner.getClass(), "appendElementInternal",
                    SpannableStringBuilder.class, anchor.getClass());
            SpannableStringBuilder scratch = new SpannableStringBuilder();
            append.invoke(spanner, scratch, anchor);
            ClickableSpan[] spans = scratch.getSpans(0, scratch.length(), ClickableSpan.class);
            return spans.length > 0 ? spans[0] : null;
        } catch (Throwable t) {
            ErrorDialog.printException(() -> "App link failed, using the plain URL", t);
            return null;
        }
    }

    static String absolute(String href) {
        if (href.startsWith("/")) return "https://www.reddit.com" + href;
        return href;
    }

    private static CharSequence trim(SpannableStringBuilder text) {
        while (text.length() > 0 && Character.isWhitespace(text.charAt(text.length() - 1))) text.delete(text.length() - 1, text.length());
        while (text.length() > 0 && Character.isWhitespace(text.charAt(0))) text.delete(0, 1);
        return text;
    }

    private static Object call(Object target, String method, String argument) throws Exception {
        return target.getClass().getMethod(method, String.class).invoke(target, argument);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameters) throws NoSuchMethodException {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Method method = c.getDeclaredMethod(name, parameters);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            }
        }
        throw new NoSuchMethodException(name);
    }

    // endregion

    // region Layout and drawing

    boolean isExpanded() {
        Boolean expanded = EXPANDED.get(key);
        return expanded != null && expanded;
    }

    /** Switches between fitting the width and natural column widths (scrolled sideways). */
    void toggle() {
        EXPANDED.put(key, !isExpanded());
        scrollX = 0;
    }

    /** Scrolls an expanded table; returns whether it moved. */
    boolean scrollBy(float dx) {
        float max = Math.max(0, gridWidth - visibleWidth);
        float next = Math.max(0, Math.min(max, scrollX + dx));
        if (next == scrollX) return false;
        scrollX = next;
        return true;
    }

    boolean canScroll() {
        return isExpanded() && gridWidth > visibleWidth;
    }

    int height() {
        return totalHeight;
    }

    int gridHeight() {
        return gridHeight;
    }

    /**
     * The link under a point of the grid (relative to the table's top left, as drawn), or null.
     * Only the text of the link counts, not the empty space around it in the cell.
     */
    ClickableSpan linkAt(float x, float y) {
        if (layouts == null || y < 0 || y > gridHeight || x < 0 || x > visibleWidth) return null;
        int border = (int) Math.max(1f, density);
        float gridX = x + scrollX;
        float rowTop = 0;
        for (int r = 0; r < rowHeights.length; r++) {
            if (y < rowTop + rowHeights[r]) {
                float cellLeft = border;
                for (int c = 0; c < columnWidths.length; c++) {
                    float cellRight = cellLeft + columnWidths[c] + 2 * padH;
                    if (gridX < cellRight) {
                        return linkInCell(layouts[r][c], gridX - cellLeft - padH, y - rowTop - dp(PAD_V_DP) - border);
                    }
                    cellLeft = cellRight + border;
                }
                return null;
            }
            rowTop += rowHeights[r];
        }
        return null;
    }

    /**
     * What accessibility shows of the table: each cell, row by row, then the expand or fit button,
     * with where each shows, relative to the table's top left: a cell's text, where a tap opens its
     * link. A cell scrolled out of the table's width, or empty, has empty bounds.
     */
    List<TablePart> parts() {
        List<TablePart> parts = new ArrayList<>();
        if (layouts == null) return parts;
        float border = Math.max(1f, density);
        RectF shown = new RectF(0f, 0f, visibleWidth, gridHeight);
        float rowTop = 0;
        for (int r = 0; r < rowHeights.length; r++) {
            float cellLeft = border - scrollX;
            for (int c = 0; c < columnWidths.length; c++) {
                float cellRight = cellLeft + columnWidths[c] + 2 * padH;
                StaticLayout layout = layouts[r][c];
                RectF bounds = new RectF();
                if (layout != null) {
                    float left = Float.MAX_VALUE;
                    float right = 0f;
                    for (int line = 0; line < layout.getLineCount(); line++) {
                        left = Math.min(left, layout.getLineLeft(line));
                        right = Math.max(right, layout.getLineRight(line));
                    }
                    float textLeft = cellLeft + padH;
                    float textTop = rowTop + dp(PAD_V_DP) + border;
                    bounds.set(textLeft + left, textTop, textLeft + right, textTop + layout.getHeight());
                }
                if (bounds.isEmpty() || !bounds.intersect(shown)) bounds.setEmpty();
                CharSequence text = layout != null ? layout.getText() : "";
                ClickableSpan link = null;
                if (text instanceof Spanned) {
                    ClickableSpan[] links = ((Spanned) text).getSpans(0, text.length(), ClickableSpan.class);
                    if (links.length > 0) link = links[0];
                }
                parts.add(new TablePart(text, bounds, link, false));
                cellLeft = cellRight + border;
            }
            rowTop += rowHeights[r];
        }
        if (!toggleRect.isEmpty()) parts.add(new TablePart(label(), new RectF(toggleRect), null, true));
        return parts;
    }

    private ClickableSpan linkInCell(StaticLayout layout, float x, float y) {
        if (layout == null || !(layout.getText() instanceof Spanned)) return null;
        int slack = dp(6); // Fingers are wider than text.
        if (y < -slack || y > layout.getHeight() + slack) return null;
        int line = layout.getLineForVertical((int) Math.max(0, Math.min(y, layout.getHeight() - 1)));
        if (x < layout.getLineLeft(line) - slack || x > layout.getLineRight(line) + slack) return null;
        int offset = layout.getOffsetForHorizontal(line, x);
        Spanned text = (Spanned) layout.getText();
        ClickableSpan[] links = text.getSpans(Math.max(0, offset - 1), Math.min(text.length(), offset + 1), ClickableSpan.class);
        return links.length > 0 ? links[0] : null;
    }

    /** The expand/fit button, relative to the table's top left, or empty when there is none. */
    RectF toggleRect() {
        return toggleRect;
    }

    @Override
    public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
        ensureLayout(paint);
        if (fm != null) {
            fm.ascent = fm.top = -totalHeight;
            fm.descent = fm.bottom = dp(MARGIN_BELOW_DP);
        }
        return visibleWidth;
    }

    @Override
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom,
                     Paint paint) {
        ensureLayout(paint);
        int color = paint.getColor();
        float tableTop = y - totalHeight;

        canvas.save();
        canvas.clipRect(x, tableTop, x + visibleWidth, tableTop + gridHeight);
        drawGrid(canvas, x - scrollX, tableTop, color);
        canvas.restore();

        float footerTop = tableTop + gridHeight;
        if (scrollbarHeight > 0) {
            float barTop = footerTop + dp(3);
            float barHeight = dp(3);
            fill.setColor(withAlpha(color, 0x1A));
            canvas.drawRoundRect(x, barTop, x + visibleWidth, barTop + barHeight, barHeight, barHeight, fill);
            float thumb = Math.max(dp(24), (float) visibleWidth * visibleWidth / gridWidth);
            float offset = gridWidth > visibleWidth ? scrollX / (gridWidth - visibleWidth) * (visibleWidth - thumb) : 0;
            fill.setColor(withAlpha(color, 0x80));
            canvas.drawRoundRect(x + offset, barTop, x + offset + thumb, barTop + barHeight, barHeight, barHeight, fill);
        }
        if (!toggleRect.isEmpty()) {
            String label = isExpanded() ? str("revanced_tables_fit_to_screen") : str("revanced_tables_expand");
            labelPaint.set(paint);
            labelPaint.setTextSize(paint.getTextSize() * 0.8f);
            labelPaint.setColor(withAlpha(color, 0xCC));
            float pillLeft = x + toggleRect.left;
            float pillTop = tableTop + toggleRect.top;
            fill.setColor(withAlpha(color, 0x40));
            fill.setStyle(Paint.Style.STROKE);
            fill.setStrokeWidth(Math.max(1f, density));
            float radius = toggleRect.height() / 2f;
            canvas.drawRoundRect(pillLeft, pillTop, pillLeft + toggleRect.width(), pillTop + toggleRect.height(),
                    radius, radius, fill);
            fill.setStyle(Paint.Style.FILL);
            Paint.FontMetrics metrics = labelPaint.getFontMetrics();
            float baseline = pillTop + (toggleRect.height() - metrics.ascent - metrics.descent) / 2f;
            canvas.drawText(label, pillLeft + dp(10), baseline, labelPaint);
        }
    }

    private void drawGrid(Canvas canvas, float left, float tableTop, int color) {
        float border = Math.max(1f, density);
        boolean hasHeader = !table.header.isEmpty();

        // Header and striped rows.
        float rowTop = tableTop;
        for (int r = 0; r < rowHeights.length; r++) {
            int alpha = hasHeader && r == 0 ? 0x24 : (r % 2 == (hasHeader ? 0 : 1) ? 0x0E : 0);
            if (alpha > 0) {
                fill.setColor(withAlpha(color, alpha));
                canvas.drawRect(left, rowTop, left + gridWidth, rowTop + rowHeights[r], fill);
            }
            rowTop += rowHeights[r];
        }

        // Grid lines.
        fill.setColor(withAlpha(color, 0x40));
        float lineY = tableTop;
        for (int r = 0; r <= rowHeights.length; r++) {
            canvas.drawRect(left, lineY, left + gridWidth, lineY + border, fill);
            if (r < rowHeights.length) lineY += rowHeights[r];
        }
        float lineX = left;
        for (int c = 0; c <= columnWidths.length; c++) {
            canvas.drawRect(lineX, tableTop, lineX + border, tableTop + gridHeight, fill);
            if (c < columnWidths.length) lineX += columnWidths[c] + 2 * padH + border;
        }

        // Cells.
        rowTop = tableTop;
        for (int r = 0; r < layouts.length; r++) {
            float cellLeft = left + border;
            for (int c = 0; c < columnWidths.length; c++) {
                StaticLayout layout = layouts[r][c];
                if (layout != null) {
                    canvas.save();
                    canvas.translate(cellLeft + padH, rowTop + dp(PAD_V_DP) + border);
                    layout.draw(canvas);
                    canvas.restore();
                }
                cellLeft += columnWidths[c] + 2 * padH + border;
            }
            rowTop += rowHeights[r];
        }
    }

    private void ensureLayout(Paint paint) {
        boolean expanded = isExpanded();
        if (layouts != null && cachedWidth == maxWidth && cachedTextSize == paint.getTextSize()
                && cachedColor == paint.getColor() && cachedExpanded == expanded && cachedInteractive == interactive) {
            return;
        }
        cachedWidth = maxWidth;
        cachedTextSize = paint.getTextSize();
        cachedColor = paint.getColor();
        cachedExpanded = expanded;
        cachedInteractive = interactive;

        TextPaint textPaint = new TextPaint(paint);
        if (paint instanceof TextPaint) textPaint.linkColor = ((TextPaint) paint).linkColor;
        int columns = table.columns();
        List<CharSequence[]> cells = new ArrayList<>();
        if (!table.header.isEmpty()) cells.add(bold(table.header, columns));
        for (List<CharSequence> row : table.rows) cells.add(row.toArray(new CharSequence[columns]));

        int[] natural = new int[columns];
        int[] longestWord = new int[columns];
        for (CharSequence[] row : cells) {
            for (int c = 0; c < columns; c++) {
                CharSequence cell = row[c];
                if (cell == null) continue;
                // Widest line, with the cell's bold/monospace spans taken into account.
                int lineStart = 0;
                for (int i = 0; i <= cell.length(); i++) {
                    if (i == cell.length() || cell.charAt(i) == '\n') {
                        float width = Layout.getDesiredWidth(cell, lineStart, i, textPaint);
                        natural[c] = Math.max(natural[c], (int) Math.ceil(width) + 1);
                        lineStart = i + 1;
                    }
                }
                // Longest word, so narrow columns wrap between words, not inside them.
                int wordStart = 0;
                for (int i = 0; i <= cell.length(); i++) {
                    if (i == cell.length() || Character.isWhitespace(cell.charAt(i))) {
                        if (i > wordStart) {
                            float width = Layout.getDesiredWidth(cell, wordStart, i, textPaint);
                            longestWord[c] = Math.max(longestWord[c], (int) Math.ceil(width) + 1);
                        }
                        wordStart = i + 1;
                    }
                }
            }
        }
        int border = (int) Math.max(1f, density);
        // Many columns on a narrow screen: less padding, so the table still fits the width.
        padH = dp(PAD_H_DP);
        if (maxWidth / Math.max(1, columns) < dp(64)) padH = dp(3);
        int available = maxWidth - columns * 2 * padH - (columns + 1) * border;
        int naturalSum = 0;
        for (int w : natural) naturalSum += w;
        canExpand = naturalSum > available;
        if (expanded && canExpand) {
            // Natural widths, only very long cells wrap.
            int cap = Math.max(dp(MAX_EXPANDED_COLUMN_DP), (int) (maxWidth * 0.9f));
            columnWidths = new int[columns];
            for (int c = 0; c < columns; c++) columnWidths[c] = Math.max(1, Math.min(natural[c], cap));
        } else {
            // Never wider than the view when not expanded: the minimum shrinks with many columns.
            int minimum = Math.min(dp(MIN_COLUMN_DP), Math.max(1, available / Math.max(1, columns)));
            columnWidths = fillWidth(columnWidths(natural, longestWord, available, minimum), available);
        }

        layouts = new StaticLayout[cells.size()][columns];
        rowHeights = new int[cells.size()];
        for (int r = 0; r < cells.size(); r++) {
            int height = 0;
            for (int c = 0; c < columns; c++) {
                CharSequence cell = cells.get(r)[c];
                if (cell == null) cell = "";
                StaticLayout layout = cellLayout(cell, textPaint, Math.max(1, columnWidths[c]), table.alignment(c));
                layouts[r][c] = layout;
                height = Math.max(height, layout.getHeight());
            }
            rowHeights[r] = height + 2 * dp(PAD_V_DP) + border;
        }
        gridWidth = border;
        for (int width : columnWidths) gridWidth += width + 2 * padH + border;
        gridHeight = border;
        for (int height : rowHeights) gridHeight += height;
        visibleWidth = Math.min(gridWidth, maxWidth);
        scrollX = Math.max(0, Math.min(scrollX, gridWidth - visibleWidth));

        // Footer: scrollbar (expanded and wider than the view) and the expand/fit button.
        scrollbarHeight = expanded && canExpand && gridWidth > visibleWidth ? dp(9) : 0;
        toggleRect.setEmpty();
        int footer = scrollbarHeight;
        if (interactive && canExpand) {
            labelPaint.set(paint);
            labelPaint.setTextSize(paint.getTextSize() * 0.8f);
            String label = expanded ? str("revanced_tables_fit_to_screen") : str("revanced_tables_expand");
            float pillWidth = labelPaint.measureText(label) + dp(20);
            float pillHeight = dp(26);
            float pillTop = gridHeight + footer + dp(4);
            toggleRect.set(visibleWidth - pillWidth, pillTop, visibleWidth, pillTop + pillHeight);
            footer += dp(4) + (int) pillHeight;
        }
        totalHeight = gridHeight + footer;
    }

    /** StaticLayout.Builder needs Android 6; the constructor is deprecated but works everywhere. */
    @SuppressWarnings("deprecation")
    private static StaticLayout cellLayout(CharSequence text, TextPaint paint, int width, Layout.Alignment alignment) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return StaticLayout.Builder.obtain(text, 0, text.length(), paint, width)
                    .setAlignment(alignment)
                    .setIncludePad(false)
                    .build();
        }
        return new StaticLayout(text, 0, text.length(), paint, width, alignment, 1f, 0f, false);
    }

    private static String key(Table table) {
        StringBuilder sb = new StringBuilder();
        for (CharSequence cell : table.header) sb.append(cell).append('|');
        for (List<CharSequence> row : table.rows) {
            sb.append('\n');
            for (CharSequence cell : row) sb.append(cell).append('|');
        }
        return sb.toString();
    }

    /**
     * Column widths within the available width: columns that fit their fair share keep their
     * natural width, the space left is shared by the wider ones (which wrap their text).
     */
    /** Narrower tables are stretched to the full width, sharing the space in proportion to the columns. */
    static int[] fillWidth(int[] widths, int available) {
        int sum = 0;
        for (int w : widths) sum += w;
        if (sum <= 0 || sum >= available) return widths;
        int[] result = new int[widths.length];
        int given = 0;
        for (int c = 0; c < widths.length; c++) {
            result[c] = (int) ((long) widths[c] * available / sum);
            given += result[c];
        }
        result[widths.length - 1] += available - given; // Rounding leftovers.
        return result;
    }

    static int[] columnWidths(int[] natural, int[] longestWord, int available, int minimum) {
        int n = natural.length;
        int words = 0;
        for (int w : longestWord) words += w;
        if (words > available) return columnWidths(natural, available, minimum); // Words must break anyway.
        // Every column gets its longest word; the space left goes where the text is longer.
        int[] extra = new int[n];
        for (int c = 0; c < n; c++) extra[c] = Math.max(0, natural[c] - longestWord[c]);
        int[] extraWidths = columnWidths(extra, available - words, 0);
        int[] widths = new int[n];
        for (int c = 0; c < n; c++) widths[c] = longestWord[c] + extraWidths[c];
        return widths;
    }

    static int[] columnWidths(int[] natural, int available, int minimum) {
        int n = natural.length;
        int[] widths = new int[n];
        int sum = 0;
        for (int w : natural) sum += w;
        if (sum <= available) {
            System.arraycopy(natural, 0, widths, 0, n);
            return widths;
        }
        boolean[] fixed = new boolean[n];
        int remaining = available;
        int open = n;
        boolean changed = true;
        while (changed && open > 0) {
            changed = false;
            int share = remaining / open;
            for (int c = 0; c < n; c++) {
                if (!fixed[c] && natural[c] <= share) {
                    widths[c] = natural[c];
                    fixed[c] = true;
                    remaining -= natural[c];
                    open--;
                    changed = true;
                }
            }
        }
        int share = open > 0 ? remaining / open : 0;
        for (int c = 0; c < n; c++) {
            if (!fixed[c]) widths[c] = Math.max(share, minimum);
        }
        return widths;
    }

    private static CharSequence[] bold(List<CharSequence> header, int columns) {
        CharSequence[] result = new CharSequence[columns];
        for (int c = 0; c < header.size() && c < columns; c++) {
            SpannableString text = new SpannableString(header.get(c));
            text.setSpan(new StyleSpan(Typeface.BOLD), 0, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            result[c] = text;
        }
        return result;
    }

    private String label() {
        return isExpanded() ? str("revanced_tables_fit_to_screen") : str("revanced_tables_expand");
    }

    int dp(int value) {
        return Math.round(value * density);
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    // endregion
}
