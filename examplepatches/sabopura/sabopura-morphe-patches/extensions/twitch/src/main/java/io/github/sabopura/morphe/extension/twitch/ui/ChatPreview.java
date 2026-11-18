package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.style.ForegroundColorSpan;
import android.text.style.ReplacementSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.chat.ChatEnhancements;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * The chat settings' live sample: a few lines decorated by the same code as real chat rows, so each
 * switch shows what it does. The image sizes and the row spacing are Twitch's own work on a real row;
 * here they are drawn to Twitch's stock sizes and scaled the same way.
 */
final class ChatPreview extends LinearLayout {
    private static final float TEXT_SP = 14, EMOTE_DP = 28, BADGE_DP = 18, ROW_PADDING_DP = 4;
    private static final String[] LOGINS = {"mika_ch", "sakura_77", "new_viewer", "taro"};
    private static final int[] COLOURS = {0xFF1E90FF, 0xFFFF69B4, 0xFF2EB67D, 0xFFFF7F50};
    private static final int BADGED = 0, NAMED = 1, FIRST = 2, EMOTED = 1;
    private static final String EMOTE_CODE = "LUL";

    private final Ui ui;
    private final TextView[] lines = new TextView[LOGINS.length];
    private final FrameLayout[] rows = new FrameLayout[LOGINS.length];
    private final String[] names, messages;
    private final long now = System.currentTimeMillis();
    /** A slider's value while it is still being dragged; -1 once it is saved. */
    private int font = -1, emote = -1, badge = -1, spacing = -1;

    ChatPreview(Context context, Ui ui) {
        super(context);
        this.ui = ui;
        names = new String[]{LOGINS[0], label("さくら", "Sakura"), LOGINS[2], LOGINS[3]};
        messages = label("こんにちは！,ナイス,初見です,それは草", "hello!,nice one,first time here,no way").split(",");
        setOrientation(VERTICAL);
        setBackground(Ui.rounded(context, ui.card, 16));
        setClipToOutline(true);
        setPadding(0, Ui.dp(context, 6), 0, Ui.dp(context, 6));
        setContentDescription(label("チャットの見本", "Chat preview"));
        for (int i = 0; i < lines.length; i++) {
            lines[i] = ui.text(context, "", TEXT_SP, ui.text, false);
            rows[i] = new FrameLayout(context);
            rows[i].addView(lines[i], new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            addView(rows[i], Ui.matchWidth());
        }
        reload();
    }

    /** Takes the settings as saved. */
    void reload() {
        font = emote = badge = spacing = -1;
        bind();
    }

    /** Takes a value the slider is still being dragged through. */
    void preview(String key, int value) {
        switch (key) {
            case "font_percent":
                font = value;
                break;
            case "emote_percent":
                emote = value;
                break;
            case "badge_percent":
                badge = value;
                break;
            case "spacing_percent":
                spacing = value;
                break;
            default:
                return;
        }
        bind();
    }

    private void bind() {
        Context context = getContext();
        ChatSettings settings = ChatSettings.get(context);
        boolean sizes = settings.enabled && Features.has(Feature.CHAT_APPEARANCE);
        boolean compact = settings.enabled && Features.has(Feature.COMPACT_CHAT);
        float density = context.getResources().getDisplayMetrics().density;
        float emotePx = EMOTE_DP * density * (sizes ? pick(emote, settings.emotePercent) / 100f : 1);
        float badgePx = BADGE_DP * density * (sizes ? pick(badge, settings.badgePercent) / 100f : 1);
        int padding = Math.round(ROW_PADDING_DP * density * (sizes ? pick(spacing, settings.spacingPercent) / 100f : 1));
        int side = Ui.dp(context, 14);
        for (int i = 0; i < lines.length; i++) {
            TextView line = lines[i];
            // Back to the stock size first: a bound row remembers the size it was given.
            line.setTextSize(TypedValue.COMPLEX_UNIT_SP, TEXT_SP);
            float stock = line.getTextSize();
            line.setText(sample(i, emotePx, badgePx, compact && settings.compactBadges, compact && settings.compactEmotes));
            rows[i].setPadding(side, padding, side, padding);
            ChatEnhancements.bindPreview(line, rows[i], LOGINS[i], now - (lines.length - i) * 17_000L, i, i == FIRST);
            if (sizes && font >= 0) line.setTextSize(TypedValue.COMPLEX_UNIT_PX, stock * font / 100f);
        }
    }

    private static int pick(int dragged, int saved) {
        return dragged >= 0 ? dragged : saved;
    }

    private CharSequence sample(int index, float emotePx, float badgePx, boolean hideBadges, boolean emotesAsText) {
        SpannableStringBuilder out = new SpannableStringBuilder();
        if (index == BADGED && !hideBadges) {
            out.append("￼ ");
            out.setSpan(new Glyph(badgePx, false), 0, 1, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        int start = out.length();
        out.append(index == NAMED ? names[index] : LOGINS[index]);
        out.setSpan(new ForegroundColorSpan(COLOURS[index]), start, out.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        out.setSpan(new StyleSpan(Typeface.BOLD), start, out.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        out.append(": ").append(messages[index]);
        if (index == EMOTED) {
            out.append(' ');
            if (emotesAsText) {
                out.append(EMOTE_CODE);
            } else {
                out.append('￼');
                out.setSpan(new Glyph(emotePx, true), out.length() - 1, out.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
        }
        return new SpannedString(out);
    }

    /** Stands in for an emote or a badge image: drawn, so the preview needs no network and no assets. */
    private static final class Glyph extends ReplacementSpan {
        private final float size;
        private final boolean emote;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private final Path star = new Path();

        Glyph(float size, boolean emote) {
            this.size = size;
            this.emote = emote;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            if (fm != null) {
                Paint.FontMetricsInt line = paint.getFontMetricsInt();
                int centre = (line.ascent + line.descent) / 2, half = Math.round(size / 2);
                fm.ascent = Math.min(line.ascent, centre - half);
                fm.descent = Math.max(line.descent, centre + half);
                fm.top = Math.min(line.top, fm.ascent);
                fm.bottom = Math.max(line.bottom, fm.descent);
            }
            return Math.round(size);
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y,
                         int bottom, Paint paint) {
            float cy = y + (paint.ascent() + paint.descent()) / 2, cx = x + size / 2, r = size / 2;
            fill.setStyle(Paint.Style.FILL);
            if (emote) {
                fill.setColor(0xFFFFC83D);
                canvas.drawCircle(cx, cy, r, fill);
                fill.setColor(0xFF3B2A0A);
                canvas.drawCircle(cx - r * .36f, cy - r * .2f, r * .12f, fill);
                canvas.drawCircle(cx + r * .36f, cy - r * .2f, r * .12f, fill);
                fill.setStyle(Paint.Style.STROKE);
                fill.setStrokeWidth(r * .14f);
                fill.setStrokeCap(Paint.Cap.ROUND);
                box.set(cx - r * .5f, cy - r * .35f, cx + r * .5f, cy + r * .55f);
                canvas.drawArc(box, 25, 130, false, fill);
                return;
            }
            fill.setColor(0xFF9146FF);
            box.set(x, cy - r, x + size, cy + r);
            canvas.drawRoundRect(box, r * .35f, r * .35f, fill);
            fill.setColor(0xFFFFFFFF);
            star.rewind();
            for (int i = 0; i < 10; i++) {
                double angle = Math.PI / 5 * i - Math.PI / 2;
                float reach = r * (i % 2 == 0 ? .62f : .27f);
                float px = cx + (float) Math.cos(angle) * reach, py = cy + (float) Math.sin(angle) * reach;
                if (i == 0) star.moveTo(px, py);
                else star.lineTo(px, py);
            }
            star.close();
            canvas.drawPath(star, fill);
        }
    }
}
