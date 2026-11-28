package app.xposed.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * X-Posed's post card as views, for the image: the author, the post's text and photos, when it
 * was posted and its counts, what X reports about the account, the post's link and when the
 * card was made. Pictures must be loaded beforehand ({@link RemoteImages#cached}).
 */
final class PostCardView {
    /** The card's content width: CardImage's 400dp less its 20dp padding on each side. */
    private static final int CONTENT_DP = 360;
    private static final int AVATAR_DP = 48;
    private static final int GAP_DP = 4;
    // X-Posed's "support rose" for the account context, in X's dark and light themes.
    private static final int CONTEXT_FILL_DARK = 0xFF2A2328, CONTEXT_FILL_LIGHT = 0xFFFAF2F4;
    private static final int CONTEXT_LINE_DARK = 0xFF4A3A42, CONTEXT_LINE_LIGHT = 0xFFEBD6DC;
    private static final int CONTEXT_LABEL_DARK = 0xFFDF9BA8, CONTEXT_LABEL_LIGHT = 0xFF99475C;

    private final Ui ui;
    private final Context context;
    private final PostCard card;
    private final LinearLayout root;

    private PostCardView(Ui ui, PostCard card) {
        this.ui = ui;
        this.context = ui.context;
        this.card = card;
        root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
    }

    /** version is X-Posed's version for the footer, or null. */
    static View build(Ui ui, PostCard card, String version) {
        PostCardView v = new PostCardView(ui, card);
        v.addHeader();
        v.addText();
        v.addPhotos();
        v.addMeta();
        v.addContext();
        v.addLink();
        v.addFooter(version);
        return v.root;
    }

    private void addHeader() {
        LinearLayout header = new LinearLayout(context);
        header.setGravity(Gravity.CENTER_VERTICAL);
        Bitmap avatar = RemoteImages.cached(card.avatarUrl);
        if (avatar != null) {
            ImageView image = new ImageView(context);
            image.setImageDrawable(new AccountCardView.RoundedBitmap(avatar, ui.dp(card.squareAvatar ? 8 : AVATAR_DP / 2f)));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(AVATAR_DP), ui.dp(AVATAR_DP));
            lp.setMarginEnd(ui.dp(12));
            lp.gravity = Gravity.TOP;
            header.addView(image, lp);
        }
        LinearLayout titles = new LinearLayout(context);
        titles.setOrientation(LinearLayout.VERTICAL);
        String name = card.name != null ? card.name : "@" + card.handle;
        TextView title = ui.text(name, 17, true, ui.text);
        title.setMaxLines(2);
        title.setEllipsize(TextUtils.TruncateAt.END);
        if (AccountCardView.checkLabel(card.verification) != null) {
            title.setText(new SpannableStringBuilder(name).append('\u00A0')
                    .append(Ui.inlineIcon(Icons.LABEL, AccountCardView.checkColor(ui, card.verification), title.getTextSize())));
        }
        titles.addView(title);
        if (card.name != null) titles.addView(ui.text("@" + card.handle, 15, false, ui.secondary));
        header.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        root.addView(header, Ui.matchWidth());
    }

    private void addText() {
        if (card.text.isEmpty()) return;
        TextView text = ui.text(card.text, 16, false, ui.text);
        text.setLineSpacing(ui.dp(2), 1);
        add(text, 12);
    }

    /** Up to four photos, whole rather than cropped, in one or two columns. */
    private void addPhotos() {
        int n = card.photos.size();
        if (n > 0) {
            LinearLayout grid = new LinearLayout(context);
            grid.setOrientation(LinearLayout.VERTICAL);
            int columns = n == 1 ? 1 : 2;
            for (int start = 0; start < n; start += columns) {
                List<PostCard.Photo> row = new ArrayList<>(card.photos.subList(start, Math.min(n, start + columns)));
                LinearLayout line = new LinearLayout(context);
                // A last photo on its own takes the whole width.
                float cellDp = (CONTENT_DP - GAP_DP * (row.size() - 1)) / (float) row.size();
                float heightDp = rowHeight(row, cellDp, n == 1 ? 360 : 220);
                for (int i = 0; i < row.size(); i++) {
                    ImageView image = new ImageView(context);
                    image.setImageDrawable(new ContainedBitmap(RemoteImages.cached(row.get(i).url), ui.dp(8), ui.divider));
                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ui.dp(heightDp), 1);
                    if (i > 0) lp.setMarginStart(ui.dp(GAP_DP));
                    line.addView(image, lp);
                }
                LinearLayout.LayoutParams lp = Ui.matchWidth();
                if (start > 0) lp.topMargin = ui.dp(GAP_DP);
                grid.addView(line, lp);
            }
            add(grid, 12);
        }
        if (card.mediaNote != null) add(ui.text(card.mediaNote, 13, false, ui.secondary), 8);
    }

    /** Tall enough for the tallest photo of the row at [cellDp] wide, within limits. */
    private static float rowHeight(List<PostCard.Photo> row, float cellDp, float maxDp) {
        float tallest = 0;
        for (PostCard.Photo p : row) {
            float ratio = p.width > 0 && p.height > 0 ? p.height / (float) p.width : 0.75f;
            tallest = Math.max(tallest, cellDp * ratio);
        }
        return Math.max(80, Math.min(maxDp, tallest));
    }

    private void addMeta() {
        if (card.postedAt > 0) add(ui.text("Posted " + PostCard.formatUtc(card.postedAt, false), 14, false, ui.secondary), 12);
        SpannableStringBuilder counts = new SpannableStringBuilder();
        StringBuilder spoken = new StringBuilder();
        TextView row = ui.text("", 14, false, ui.secondary);
        float icon = row.getTextSize() * 1.1f;
        metric(counts, spoken, Icons.REPLIES, card.replies, "replies", icon);
        metric(counts, spoken, Icons.REPOSTS, card.reposts, "reposts", icon);
        metric(counts, spoken, Icons.LIKES, card.likes, "likes", icon);
        metric(counts, spoken, Icons.VIEWS, card.views, "views", icon);
        if (counts.length() == 0) return;
        row.setText(counts);
        row.setContentDescription(spoken);
        add(row, 6);
    }

    /** Appends a count with its icon; X-Posed leaves out the ones that are zero or unknown. */
    private void metric(SpannableStringBuilder s, StringBuilder spoken, Glyphs.Glyph glyph, long value, String label, float iconPx) {
        if (value <= 0) return;
        if (s.length() > 0) {
            s.append("    ");
            spoken.append(", ");
        }
        s.append(Ui.inlineIcon(glyph, ui.secondary, iconPx)).append('\u00A0').append(AccountCardView.compact(value));
        spoken.append(NumberFormat.getIntegerInstance().format(value)).append(' ').append(label);
    }

    /** What X reports about the account: where it is based, how it connects, and X's warning. */
    private void addContext() {
        LinearLayout box = new LinearLayout(context);
        box.setOrientation(LinearLayout.VERTICAL);
        int pad = ui.dp(12);
        box.setPadding(pad, pad, pad, pad);
        GradientDrawable frame = new GradientDrawable();
        frame.setCornerRadius(ui.dp(12));
        frame.setColor(ui.dark ? CONTEXT_FILL_DARK : CONTEXT_FILL_LIGHT);
        frame.setStroke(Math.max(1, ui.dp(1)), ui.dark ? CONTEXT_LINE_DARK : CONTEXT_LINE_LIGHT);
        box.setBackground(frame);
        int labelColor = ui.dark ? CONTEXT_LABEL_DARK : CONTEXT_LABEL_LIGHT;

        if (card.location != null || card.source != null) {
            LinearLayout columns = new LinearLayout(context);
            if (card.location != null) {
                String flag = Countries.flagFor(card.location);
                columns.addView(signal(emoji(flag != null ? flag : Countries.UNKNOWN_FLAG), "Location reported by X",
                        card.location, labelColor), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            }
            if (card.source != null) {
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
                if (card.location != null) lp.setMarginStart(ui.dp(12));
                columns.addView(signal(icon(Glyphs.forSource(card.source), ui.secondary), "Connected via", card.source,
                        labelColor), lp);
            }
            box.addView(columns, Ui.matchWidth());
        } else {
            box.addView(ui.text("X has no location for this account.", 14, false, ui.secondary), Ui.matchWidth());
        }
        if (card.locationWarning) {
            LinearLayout warning = new LinearLayout(context);
            warning.setGravity(Gravity.CENTER_VERTICAL);
            warning.addView(icon(Icons.WARNING, ui.alert), new LinearLayout.LayoutParams(ui.dp(18), ui.dp(18)));
            TextView text = ui.text("X reports that this location may be inaccurate.", 13, false, ui.alert);
            text.setPaddingRelative(ui.dp(8), 0, 0, 0);
            warning.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            LinearLayout.LayoutParams lp = Ui.matchWidth();
            lp.topMargin = ui.dp(10);
            box.addView(warning, lp);
        }
        add(box, 14);
    }

    /** A small label over an icon and a value. */
    private View signal(View icon, String label, String value, int labelColor) {
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.addView(ui.text(label, 12, false, labelColor));
        LinearLayout line = new LinearLayout(context);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.addView(icon, new LinearLayout.LayoutParams(ui.dp(20), ui.dp(20)));
        TextView text = ui.text(value, 15, false, ui.text);
        text.setPaddingRelative(ui.dp(6), 0, 0, 0);
        line.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.topMargin = ui.dp(4);
        column.addView(line, lp);
        return column;
    }

    private void addLink() {
        add(ui.text(PostCard.statusUrl(card.postId).substring("https://".length()), 13, false, ui.secondary), 12);
    }

    private void addFooter(String version) {
        View divider = ui.divider();
        LinearLayout.LayoutParams dividerLp = (LinearLayout.LayoutParams) divider.getLayoutParams();
        dividerLp.topMargin = ui.dp(14);
        root.addView(divider);

        LinearLayout footer = new LinearLayout(context);
        footer.setGravity(Gravity.CENTER_VERTICAL);
        ImageView logo = new ImageView(context);
        logo.setImageDrawable(new Logo());
        footer.addView(logo, new LinearLayout.LayoutParams(ui.dp(28), ui.dp(28)));
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPaddingRelative(ui.dp(10), 0, 0, 0);
        texts.addView(ui.text(version != null ? "X-Posed " + version : "X-Posed", 14, true, ui.text));
        texts.addView(ui.text("Captured " + PostCard.formatUtc(card.capturedAt, true), 12, false, ui.secondary));
        footer.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        add(footer, 12);
    }

    private void add(View view, int topMarginDp) {
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.topMargin = ui.dp(topMarginDp);
        root.addView(view, lp);
    }

    private View emoji(String emoji) {
        TextView t = ui.text(emoji, 18, false, ui.text);
        // A flag is an icon: sized like the other icons, not with the text.
        t.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 16);
        t.setGravity(Gravity.CENTER);
        t.setIncludeFontPadding(false);
        FrameLayout box = new FrameLayout(context);
        box.addView(t, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return box;
    }

    private ImageView icon(Glyphs.Glyph glyph, int color) {
        ImageView v = new ImageView(context);
        v.setImageDrawable(glyph.asDrawable(color));
        return v;
    }

    /** A photo shown whole within its bounds on a rounded backdrop; only the backdrop when missing. */
    private static final class ContainedBitmap extends Drawable {
        private final Bitmap bitmap;
        private final float radius;
        private final int backdrop;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Path clip = new Path();
        private final RectF rect = new RectF();
        private final Rect target = new Rect();

        ContainedBitmap(Bitmap bitmap, float radius, int backdrop) {
            this.bitmap = bitmap;
            this.radius = radius;
            this.backdrop = backdrop;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            rect.set(b);
            clip.reset();
            clip.addRoundRect(rect, radius, radius, Path.Direction.CW);
            canvas.save();
            canvas.clipPath(clip);
            canvas.drawColor(backdrop);
            if (bitmap != null && !bitmap.isRecycled()) {
                float scale = Math.min(b.width() / (float) bitmap.getWidth(), b.height() / (float) bitmap.getHeight());
                int w = Math.round(bitmap.getWidth() * scale), h = Math.round(bitmap.getHeight() * scale);
                int left = b.left + (b.width() - w) / 2, top = b.top + (b.height() - h) / 2;
                target.set(left, top, left + w, top + h);
                canvas.drawBitmap(bitmap, null, target, paint);
            }
            canvas.restore();
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
