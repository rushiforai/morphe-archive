package app.linkedin.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Selects text in place: a native selectable TextView is laid exactly over the Compose text that was long pressed,
 * with the same line breaks, a matching size and the colors sampled from the screen, and the word under the finger
 * is selected with Android's handles and Copy / Select all / Share toolbar.
 * <p>
 * The positions of the characters come from Compose's accessibility support for
 * {@link AccessibilityNodeInfo#EXTRA_DATA_TEXT_CHARACTER_LOCATION_KEY}. Characters cut off by "...more" have no
 * position; they are left out of the overlay and "Copy full text" copies them too.
 */
final class TextSelectionOverlay {
    private static final int MENU_COPY_FULL = 0x46414B48;
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());

    private TextSelectionOverlay() {
    }

    /** What the overlay shows: the visible lines of the text, with a line break wherever Compose wrapped a line. */
    private static final class Layout {
        final String fullText;
        final StringBuilder display = new StringBuilder();
        /** Original index of each display character, -1 for inserted line breaks. */
        final List<Integer> originalIndex = new ArrayList<>();
        final List<Float> lineTops = new ArrayList<>();
        final List<Float> lineWidths = new ArrayList<>();
        final List<String> lineTexts = new ArrayList<>();
        float left = Float.MAX_VALUE;
        float right;
        float top;
        float lineHeight;
        boolean truncated;
        RectF[] rects;

        Layout(String fullText) {
            this.fullText = fullText;
        }
    }

    /**
     * Shows the overlay for the text of a semantics node.
     *
     * @return false if the node has no text layout (then the caller shows the text in a sheet instead).
     */
    static boolean show(View composeView, AccessibilityNodeProvider provider, int id, AccessibilityNodeInfo info,
                        String text, int rawX, int rawY) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return false;
        Activity activity = activity(composeView.getContext());
        if (activity == null || activity.isFinishing()) return false;
        Layout layout = layout(provider, id, info, text);
        if (layout == null) return false;
        int start = layout.display.length() == 0 ? -1 : displayIndexAt(layout, rawX, rawY);
        if (start < 0) return false;
        sampleColors(activity, layout, colors -> open(activity, layout, colors, start));
        return true;
    }

    // region Layout

    private static Layout layout(AccessibilityNodeProvider provider, int id, AccessibilityNodeInfo info, String text) {
        String key = AccessibilityNodeInfo.EXTRA_DATA_TEXT_CHARACTER_LOCATION_KEY;
        Bundle arguments = new Bundle();
        arguments.putInt(AccessibilityNodeInfo.EXTRA_DATA_TEXT_CHARACTER_LOCATION_ARG_START_INDEX, 0);
        arguments.putInt(AccessibilityNodeInfo.EXTRA_DATA_TEXT_CHARACTER_LOCATION_ARG_LENGTH, text.length());
        provider.addExtraDataToAccessibilityNodeInfo(id, info, key, arguments);
        Parcelable[] locations = info.getExtras().getParcelableArray(key);
        if (locations == null || locations.length != text.length()) return null;

        Layout layout = new Layout(text);
        layout.rects = new RectF[locations.length];
        List<Float> heights = new ArrayList<>();
        float lineTop = Float.NaN;
        float lineBottom = 0;
        int lineStart = -1;
        int lineLast = -1;
        for (int i = 0; i < locations.length; i++) {
            RectF r = (RectF) locations[i];
            layout.rects[i] = r;
            if (r == null) {
                layout.truncated = true;
                continue;
            }
            // Compose reports every character with the top and bottom of its line.
            boolean newLine = Float.isNaN(lineTop) || r.top >= lineBottom - 1;
            if (newLine) {
                if (lineStart >= 0) endLine(layout, lineStart, lineLast);
                if (layout.display.length() > 0 && layout.display.charAt(layout.display.length() - 1) != '\n') {
                    layout.display.append('\n');
                    layout.originalIndex.add(-1);
                }
                lineTop = r.top;
                lineBottom = r.bottom;
                layout.lineTops.add(r.top);
                heights.add(r.bottom - r.top);
                lineStart = i;
            }
            layout.display.append(text.charAt(i));
            layout.originalIndex.add(i);
            lineLast = i;
            if (text.charAt(i) != '\n' && !Character.isWhitespace(text.charAt(i))) {
                layout.left = Math.min(layout.left, r.left);
                layout.right = Math.max(layout.right, r.right);
            }
        }
        if (lineStart < 0 || layout.right <= layout.left) return null;
        endLine(layout, lineStart, lineLast);

        layout.top = layout.lineTops.get(0);
        if (layout.lineTops.size() > 1) {
            float[] gaps = new float[layout.lineTops.size() - 1];
            for (int i = 0; i < gaps.length; i++) gaps[i] = layout.lineTops.get(i + 1) - layout.lineTops.get(i);
            layout.lineHeight = median(gaps);
        } else {
            float[] h = new float[heights.size()];
            for (int i = 0; i < h.length; i++) h[i] = heights.get(i);
            layout.lineHeight = median(h);
        }
        return layout.lineHeight > 0 ? layout : null;
    }

    /** Remembers the text and the drawn width of a line, without its trailing spaces. */
    private static void endLine(Layout layout, int first, int last) {
        int end = last;
        while (end > first && Character.isWhitespace(layout.fullText.charAt(end))) end--;
        RectF a = layout.rects[first];
        RectF b = layout.rects[end];
        layout.lineTexts.add(layout.fullText.substring(first, end + 1));
        layout.lineWidths.add(b == null || a == null ? 0f : b.right - a.left);
    }

    private static float median(float[] values) {
        if (values.length == 0) return 0;
        Arrays.sort(values);
        return values[values.length / 2];
    }

    /** The display index of the character under the finger, or of the nearest character on that line. */
    private static int displayIndexAt(Layout layout, int rawX, int rawY) {
        int best = -1;
        float bestDistance = Float.MAX_VALUE;
        for (int d = 0; d < layout.originalIndex.size(); d++) {
            int i = layout.originalIndex.get(d);
            if (i < 0) continue;
            RectF r = layout.rects[i];
            float dy = rawY < r.top ? r.top - rawY : Math.max(0, rawY - r.bottom);
            float dx = rawX < r.left ? r.left - rawX : Math.max(0, rawX - r.right);
            float distance = dy * 1000 + dx; // Same line first, then closest horizontally.
            if (distance < bestDistance) {
                bestDistance = distance;
                best = d;
            }
        }
        return best;
    }

    /** Text size, in pixels, that makes the system font as wide as LinkedIn's widest line. */
    private static float textSize(Layout layout) {
        TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        paint.setTypeface(Typeface.DEFAULT);
        paint.setTextSize(100);
        float size = 0;
        float widest = 0;
        for (int i = 0; i < layout.lineTexts.size(); i++) {
            float width = layout.lineWidths.get(i);
            float measured = paint.measureText(layout.lineTexts.get(i));
            if (width > widest && measured > 0) {
                widest = width;
                size = 100 * width / measured;
            }
        }
        // A short line says little about the size; keep the result near what the line height suggests.
        float min = layout.lineHeight * 0.5f;
        float max = layout.lineHeight * 0.9f;
        if (size <= 0) size = layout.lineHeight / 1.4f;
        return Math.max(min, Math.min(max, size));
    }

    // endregion

    // region Colors

    private interface ColorsCallback {
        void onColors(int[] backgroundAndText);
    }

    /** Samples the background and text colors of the first line, so the overlay looks like the original text. */
    private static void sampleColors(Activity activity, Layout layout, ColorsCallback callback) {
        int[] fallback = defaultColors(activity);
        try {
            Window window = activity.getWindow();
            View decor = window.getDecorView();
            int[] origin = new int[2];
            decor.getLocationOnScreen(origin);
            Rect region = new Rect(Math.round(layout.left) - origin[0], Math.round(layout.top) - origin[1],
                    Math.round(layout.right) - origin[0], Math.round(layout.top + layout.lineHeight) - origin[1]);
            region.intersect(0, 0, decor.getWidth(), decor.getHeight());
            if (region.width() <= 0 || region.height() <= 0) {
                callback.onColors(fallback);
                return;
            }
            Bitmap bitmap = Bitmap.createBitmap(region.width(), region.height(), Bitmap.Config.ARGB_8888);
            PixelCopy.request(window, region, bitmap, result -> {
                int[] colors = result == PixelCopy.SUCCESS ? colorsOf(bitmap, fallback) : fallback;
                bitmap.recycle();
                callback.onColors(colors);
            }, HANDLER);
        } catch (Throwable t) {
            Diagnostics.error("copy text color sampling failed", t);
            callback.onColors(fallback);
        }
    }

    /** The most common color is the background; the color furthest from it is the text. */
    private static int[] colorsOf(Bitmap bitmap, int[] fallback) {
        int[] pixels = new int[bitmap.getWidth() * bitmap.getHeight()];
        bitmap.getPixels(pixels, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
        Map<Integer, Integer> counts = new HashMap<>();
        int background = fallback[0];
        int most = 0;
        for (int pixel : pixels) {
            Integer count = counts.get(pixel);
            int next = count == null ? 1 : count + 1;
            counts.put(pixel, next);
            if (next > most) {
                most = next;
                background = pixel;
            }
        }
        int text = fallback[1];
        int furthest = 0;
        for (int pixel : counts.keySet()) {
            int distance = Math.abs(Color.red(pixel) - Color.red(background))
                    + Math.abs(Color.green(pixel) - Color.green(background))
                    + Math.abs(Color.blue(pixel) - Color.blue(background));
            if (distance > furthest) {
                furthest = distance;
                text = pixel;
            }
        }
        if (furthest < 120) text = fallback[1];
        return new int[]{background | 0xFF000000, text | 0xFF000000};
    }

    private static int[] defaultColors(Context context) {
        return night(context) ? new int[]{0xFF1B1F23, 0xFFE9E9E9} : new int[]{0xFFFFFFFF, 0xFF191919};
    }

    private static boolean night(Context context) {
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    // endregion

    // region Overlay

    private static void open(Activity activity, Layout layout, int[] colors, int start) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        Dialog dialog = new Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
            window.setWindowAnimations(0);
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }

        FrameLayout root = new FrameLayout(activity);
        // A touch outside the text closes the overlay, like a tap clears a selection.
        root.setOnTouchListener((v, event) -> {
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) dialog.dismiss();
            return true;
        });

        float size = textSize(layout);
        TextView textView = new TextView(activity);
        textView.setText(layout.display.toString());
        textView.setTypeface(Typeface.DEFAULT);
        textView.setTextSize(TypedValue.COMPLEX_UNIT_PX, size);
        textView.setIncludeFontPadding(false);
        textView.setTextColor(colors[1]);
        textView.setBackgroundColor(colors[0]);
        textView.setGravity(Gravity.START | Gravity.TOP);
        textView.setHorizontallyScrolling(false);
        Paint.FontMetricsInt metrics = textView.getPaint().getFontMetricsInt();
        int fontHeight = metrics.descent - metrics.ascent;
        int lineHeight = Math.round(layout.lineHeight);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && lineHeight > 0) {
            textView.setLineHeight(lineHeight);
        }
        // Compose centers the glyphs in the line height, TextView puts the extra space below them.
        int topOffset = Math.max(0, (lineHeight - fontHeight) / 2);
        textView.setPadding(0, topOffset, 0, 0);
        textView.setTextIsSelectable(true);

        // Wide enough that the lines never wrap again: the line breaks are already in the text.
        float widest = layout.right - layout.left;
        for (String line : layout.lineTexts) widest = Math.max(widest, textView.getPaint().measureText(line));
        int width = Math.round(widest + size);
        int height = Math.round(layout.lineHeight * layout.lineTops.size()) + topOffset;
        root.addView(textView, new FrameLayout.LayoutParams(width, height));

        textView.setCustomSelectionActionModeCallback(new ActionMode.Callback() {
            @Override
            public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                if (layout.truncated) menu.add(Menu.NONE, MENU_COPY_FULL, 200, I18n.tr("Copy full text"));
                return true;
            }

            @Override
            public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                return false;
            }

            @Override
            public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                int id = item.getItemId();
                if (id == android.R.id.copy) {
                    copy(activity, selectedText(layout, textView));
                } else if (id == MENU_COPY_FULL) {
                    copy(activity, layout.fullText);
                } else if (id == android.R.id.shareText) {
                    Intent send = new Intent(Intent.ACTION_SEND).setType("text/plain")
                            .putExtra(Intent.EXTRA_TEXT, selectedText(layout, textView));
                    activity.startActivity(Intent.createChooser(send, null));
                } else {
                    return false;
                }
                mode.finish();
                dialog.dismiss();
                return true;
            }

            @Override
            public void onDestroyActionMode(ActionMode mode) {
                // Tapping the text clears the selection, which ends the overlay too.
                HANDLER.post(() -> {
                    if (textView.getSelectionStart() == textView.getSelectionEnd()) dialog.dismiss();
                });
            }
        });

        dialog.setContentView(root);
        dialog.show();

        // Place the text over the original once the window knows where it is on screen.
        root.post(() -> {
            int[] origin = new int[2];
            root.getLocationOnScreen(origin);
            textView.setX(layout.left - origin[0]);
            textView.setY(layout.top - origin[1]);
            textView.post(() -> selectWord(textView, start));
        });
    }

    /** Selects the word at a display index, which also shows the selection handles and toolbar. */
    private static void selectWord(TextView textView, int index) {
        CharSequence text = textView.getText();
        BreakIterator words = BreakIterator.getWordInstance();
        words.setText(text.toString());
        int end = words.following(Math.min(index, text.length() - 1));
        int start = words.previous();
        if (start == BreakIterator.DONE || end == BreakIterator.DONE || start >= end
                || !Character.isLetterOrDigit(text.charAt(start))) {
            start = index;
            end = Math.min(index + 1, text.length());
        }
        textView.requestFocus();
        Bundle arguments = new Bundle();
        arguments.putInt(AccessibilityNodeInfo.ACTION_ARGUMENT_SELECTION_START_INT, start);
        arguments.putInt(AccessibilityNodeInfo.ACTION_ARGUMENT_SELECTION_END_INT, end);
        textView.performAccessibilityAction(AccessibilityNodeInfo.ACTION_SET_SELECTION, arguments);
    }

    /** The original text of the selection, without the line breaks the overlay added. */
    private static String selectedText(Layout layout, TextView textView) {
        int start = Math.max(0, Math.min(textView.getSelectionStart(), textView.getSelectionEnd()));
        int end = Math.min(layout.originalIndex.size(), Math.max(textView.getSelectionStart(), textView.getSelectionEnd()));
        int from = -1;
        int to = -1;
        for (int d = start; d < end; d++) {
            int i = layout.originalIndex.get(d);
            if (i < 0) continue;
            if (from < 0) from = i;
            to = i;
        }
        return from < 0 ? "" : layout.fullText.substring(from, to + 1);
    }

    static void copy(Context context, String text) {
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return;
        clipboard.setPrimaryClip(ClipData.newPlainText("LinkedIn", text));
        // Android 13 and newer show their own confirmation.
        if (Build.VERSION.SDK_INT < 33) {
            Toast.makeText(context, I18n.tr("Copied"), Toast.LENGTH_SHORT).show();
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    // endregion
}
