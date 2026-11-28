package app.xposed.extension;

import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.icu.text.CompactDecimalFormat;
import android.net.Uri;
import android.os.Build;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.text.style.ForegroundColorSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

/**
 * X-Posed's account card as views: header, location, activity counts and account details. The
 * sheet shows it with working links and a copyable user ID; the card image shows it as it is.
 */
final class AccountCardView {
    static final int AVATAR_DP = 48, BADGE_DP = 18;
    // X-Posed's checkmark tones, chosen for contrast on X's dark and light backgrounds.
    private static final int BLUE_DARK = 0xFF5BBCF6, BLUE_LIGHT = 0xFF096DAB, GOLD_DARK = 0xFFE7BC54, GOLD_LIGHT = 0xFF95650D;
    // X's green; the darker one keeps 3:1 contrast on white.
    private static final int GREEN_DARK = 0xFF00BA7C, GREEN_LIGHT = 0xFF00875A;
    private static final long COPIED_MS = 2000;

    private final Ui ui;
    private final Context context;
    private final AccountCard card;
    /** False for the card image: no links, copy button or relative times. */
    private final boolean interactive;
    private final LinearLayout root;

    private AccountCardView(Ui ui, AccountCard card, boolean interactive) {
        this.ui = ui;
        this.context = ui.context;
        this.card = card;
        this.interactive = interactive;
        root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
    }

    static View build(Ui ui, AccountCard card, boolean interactive) {
        AccountCardView v = new AccountCardView(ui, card, interactive);
        v.addHeader();
        v.addSignals();
        v.addCounts();
        v.addDetails();
        v.addSource();
        return v.root;
    }

    private void addHeader() {
        LinearLayout header = new LinearLayout(context);
        header.setGravity(Gravity.CENTER_VERTICAL);
        if (card.avatarUrl != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(AVATAR_DP), ui.dp(AVATAR_DP));
            lp.setMarginEnd(ui.dp(12));
            // Beside the name, also when large text makes the titles tall.
            lp.gravity = Gravity.TOP;
            lp.topMargin = ui.dp(2);
            header.addView(image(card.avatarUrl, card.squareAvatar ? 8 : AVATAR_DP / 2f, AVATAR_DP), lp);
        }
        LinearLayout titles = new LinearLayout(context);
        titles.setOrientation(LinearLayout.VERTICAL);
        String name = card.name != null ? card.name : "@" + card.handle;
        TextView title = ui.text(name, 19, true, ui.text);
        title.setMaxLines(3);
        title.setEllipsize(TextUtils.TruncateAt.END);
        String check = checkLabel(card.verification);
        if (check != null) {
            title.setText(new SpannableStringBuilder(name).append('\u00A0')
                    .append(Ui.inlineIcon(Icons.LABEL, checkColor(ui, card.verification), title.getTextSize())));
            title.setContentDescription(name + ", " + check);
        }
        titles.addView(title);
        if (card.name != null) titles.addView(ui.text("@" + card.handle, 15, false, ui.secondary));
        if (card.identityVerified || card.isProtected) {
            TextView tags = ui.text("", 13, false, ui.secondary);
            tags.setPadding(0, ui.dp(4), 0, 0);
            addTags(tags);
            titles.addView(tags);
        }
        header.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        root.addView(header, Ui.matchWidth());
    }

    /** What X's checkmark of a verification code means, or null without one. */
    static String checkLabel(int verification) {
        switch (verification) {
            case ModelBridge.VERIFIED_BLUE:
                return "Blue verified";
            case ModelBridge.VERIFIED_BUSINESS:
                return "Verified organization";
            case ModelBridge.VERIFIED_GOVERNMENT:
                return "Government verified";
            case ModelBridge.VERIFIED_OTHER:
                return "Verified";
            default:
                return null;
        }
    }

    static int checkColor(Ui ui, int verification) {
        switch (verification) {
            case ModelBridge.VERIFIED_BLUE:
                return ui.dark ? BLUE_DARK : BLUE_LIGHT;
            case ModelBridge.VERIFIED_BUSINESS:
                return ui.dark ? GOLD_DARK : GOLD_LIGHT;
            default:
                return ui.secondary;
        }
    }

    /** "Identity verified" and "Protected", each after its icon, wrapping like words. */
    private void addTags(TextView tags) {
        SpannableStringBuilder s = new SpannableStringBuilder();
        StringBuilder spoken = new StringBuilder();
        float size = tags.getTextSize() * 1.15f;
        if (card.identityVerified) {
            s.append(Ui.inlineIcon(Icons.LABEL, ui.dark ? GREEN_DARK : GREEN_LIGHT, size)).append("\u00A0Identity verified");
            spoken.append("Identity verified");
        }
        if (card.isProtected) {
            if (s.length() > 0) {
                s.append("   ");
                spoken.append(", ");
            }
            s.append(Ui.inlineIcon(Icons.SHIELD, ui.secondary, size)).append("\u00A0Protected");
            spoken.append("Protected");
        }
        tags.setText(s);
        tags.setContentDescription(spoken);
    }

    private void addSignals() {
        if (card.location != null) {
            String flag = Countries.flagFor(card.location);
            root.addView(signal(emoji(flag != null ? flag : Countries.UNKNOWN_FLAG), "Account based in", card.location, ui.text));
        }
        if (card.source != null) {
            root.addView(signal(icon(Glyphs.forSource(card.source), ui.secondary), "Connected via", card.source, ui.text));
        }
        if (card.locationWarning) {
            root.addView(signal(icon(Glyphs.VPN, ui.alert), null,
                    "X reports that this account's location may not be accurate. This is not proof of VPN use.", ui.alert));
        }
        if (card.location == null && card.source == null) {
            root.addView(signal(icon(Glyphs.UNKNOWN_DEVICE, ui.secondary), null, "X has no location for this account.", ui.secondary));
        }
    }

    /** Icon at the start, then a small label over the value. */
    private View signal(View icon, String label, String value, int valueColor) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, ui.dp(14), 0, 0);
        FrameLayout iconBox = new FrameLayout(context);
        iconBox.addView(icon, new FrameLayout.LayoutParams(ui.dp(24), ui.dp(24), Gravity.CENTER));
        row.addView(iconBox, new LinearLayout.LayoutParams(ui.dp(28), ui.dp(28)));
        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPaddingRelative(ui.dp(14), 0, 0, 0);
        if (label != null) texts.addView(ui.text(label, 13, false, ui.secondary));
        texts.addView(ui.text(value, 16, false, valueColor));
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        // TalkBack reads the label and value as one item.
        row.setFocusable(true);
        return row;
    }

    /** Followers, following and posts in a framed row, as X-Posed's card shows them. */
    private void addCounts() {
        if (!card.hasCounts()) return;
        LinearLayout counts = new LinearLayout(context);
        counts.setPadding(0, ui.dp(10), 0, ui.dp(10));
        GradientDrawable frame = new GradientDrawable();
        frame.setCornerRadius(ui.dp(8));
        frame.setStroke(Math.max(1, ui.dp(1)), ui.divider);
        counts.setBackground(frame);
        GradientDrawable line = new GradientDrawable();
        line.setColor(ui.divider);
        line.setSize(Math.max(1, ui.dp(1)), 0);
        counts.setDividerDrawable(line);
        counts.setShowDividers(LinearLayout.SHOW_DIVIDER_MIDDLE);
        addCount(counts, card.followers, "Followers");
        addCount(counts, card.following, "Following");
        addCount(counts, card.posts, "Posts");
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.topMargin = ui.dp(16);
        root.addView(counts, lp);
    }

    private void addCount(LinearLayout counts, long value, String label) {
        if (value < 0) return;
        LinearLayout stat = new LinearLayout(context);
        stat.setOrientation(LinearLayout.VERTICAL);
        stat.setGravity(Gravity.CENTER_HORIZONTAL);
        stat.setPadding(ui.dp(6), 0, ui.dp(6), 0);
        TextView number = ui.text(compact(value), 17, true, ui.text);
        number.setGravity(Gravity.CENTER);
        TextView name = ui.text(label, 13, false, ui.secondary);
        name.setGravity(Gravity.CENTER);
        stat.addView(number);
        stat.addView(name);
        stat.setFocusable(true);
        stat.setContentDescription(NumberFormat.getIntegerInstance().format(value) + " " + label.toLowerCase(Locale.ROOT));
        counts.addView(stat, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
    }

    /** Exact below a million, then short ("1.2M"), as X-Posed shows counts. */
    static String compact(long value) {
        if (value < 1_000_000) return NumberFormat.getIntegerInstance().format(value);
        CompactDecimalFormat format = CompactDecimalFormat.getInstance(Locale.getDefault(), CompactDecimalFormat.CompactStyle.SHORT);
        format.setMaximumFractionDigits(1);
        return format.format(value);
    }

    private void addDetails() {
        if (!card.hasHistory()) return;
        TextView heading = ui.text("Account details", 15, true, ui.text);
        heading.setPadding(0, ui.dp(20), 0, ui.dp(4));
        heading.setAccessibilityHeading(true);
        root.addView(heading);
        DateFormat dates = DateFormat.getDateInstance(DateFormat.MEDIUM);
        if (card.createdAt > 0) {
            int years = AccountCard.ageYears(card.createdAt, System.currentTimeMillis());
            String date = dates.format(new Date(card.createdAt));
            SpannableStringBuilder s = new SpannableStringBuilder(date).append(' ');
            int start = s.length();
            s.append("\u00B7 ").append(String.valueOf(years)).append('y');
            s.setSpan(new ForegroundColorSpan(ui.secondary), start, s.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            TextView value = value(s);
            value.setContentDescription(date + ", " + years + (years == 1 ? " year old" : " years old"));
            root.addView(detail("Created", value));
        }
        if (card.verifiedSince > 0) {
            root.addView(detail("Verified since", value(dates.format(new Date(card.verifiedSince)))));
        } else if (card.verifiedYear > 0) {
            root.addView(detail("Verified since", value(String.valueOf(card.verifiedYear))));
        }
        if (card.handleChanges >= 0) root.addView(detail("Handle changes", value(String.valueOf(card.handleChanges))));
        if (card.affiliation != null) addAffiliation();
        if (card.userId > 0) addUserId();
    }

    private TextView value(CharSequence text) {
        TextView t = ui.text(text, 15, false, ui.text);
        t.setGravity(Gravity.CENTER_VERTICAL);
        endAligned(t);
        return t;
    }

    /** At the row's end even when the text runs the other way, such as an Arabic date in an English row. */
    private static void endAligned(TextView t) {
        t.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_END);
    }

    /** The label at the start, the value at the end. */
    private LinearLayout detail(String label, View value) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(ui.dp(40));
        row.addView(ui.text(label, 15, false, ui.secondary));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
        lp.setMarginStart(ui.dp(16));
        row.addView(value, lp);
        row.setFocusable(true);
        return row;
    }

    /** The organization's badge and name; the name opens its page when X gave one. */
    private void addAffiliation() {
        boolean link = interactive && card.affiliationUrl != null;
        LinearLayout value = new LinearLayout(context);
        value.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        if (card.affiliationBadge != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(BADGE_DP), ui.dp(BADGE_DP));
            lp.setMarginEnd(ui.dp(6));
            value.addView(image(card.affiliationBadge, 4, BADGE_DP), lp);
        }
        TextView name = ui.text(card.affiliation, 15, false, link ? Ui.ACCENT : ui.text);
        endAligned(name);
        value.addView(name);
        LinearLayout row = detail("Affiliation", value);
        if (link) {
            row.setMinimumHeight(ui.dp(48));
            row.setBackground(ui.rowBackground());
            row.setOnClickListener(v -> open(card.affiliationUrl));
            actionLabel(row, "Open " + card.affiliation);
        }
        root.addView(row);
    }

    /** Opens X's own pages in X and other pages in the browser. */
    private void open(String url) {
        Uri uri = Uri.parse(url);
        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        if ("x.com".equalsIgnoreCase(uri.getHost()) || "twitter.com".equalsIgnoreCase(uri.getHost())) {
            intent.setPackage(context.getPackageName());
        }
        try {
            context.startActivity(intent);
        } catch (ActivityNotFoundException e) {
            try {
                context.startActivity(intent.setPackage(null));
            } catch (ActivityNotFoundException ignored) {
                // No app opens web pages; nothing else to try.
            }
        }
    }

    /** The permanent user ID. Tapping it copies a link to the account that survives handle changes. */
    private void addUserId() {
        LinearLayout value = new LinearLayout(context);
        value.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        value.addView(ui.text(String.valueOf(card.userId), 15, false, ui.text));
        LinearLayout row = detail("User ID", value);
        root.addView(row);
        String link = AccountCard.profileLink(card.userId);
        if (!interactive || link == null) return;

        ImageView icon = icon(Icons.COPY, ui.secondary);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(16), ui.dp(16));
        lp.setMarginStart(ui.dp(8));
        value.addView(icon, lp);
        TextView copied = ui.text("Profile link copied", 13, false, ui.secondary);
        endAligned(copied);
        copied.setVisibility(View.GONE);
        copied.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        root.addView(copied, Ui.matchWidth());

        row.setMinimumHeight(ui.dp(48));
        row.setBackground(ui.rowBackground());
        actionLabel(row, "Copy profile link");
        Runnable reset = () -> {
            icon.setImageDrawable(Icons.COPY.asDrawable(ui.secondary));
            copied.setVisibility(View.GONE);
        };
        row.setOnClickListener(v -> {
            ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
            clipboard.setPrimaryClip(ClipData.newPlainText("Profile link", link));
            icon.setImageDrawable(Icons.CHECK.asDrawable(Ui.ACCENT));
            // Android 13 and newer confirm copies themselves.
            if (Build.VERSION.SDK_INT < 33) copied.setVisibility(View.VISIBLE);
            row.removeCallbacks(reset);
            row.postDelayed(reset, COPIED_MS);
        });
    }

    /** Names what a tap does, so TalkBack says "Double tap to [label]". */
    private static void actionLabel(View view, String label) {
        view.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, label));
            }
        });
    }

    private void addSource() {
        String origin = card.fromCloud ? "X-Posed community cache" : "X";
        CharSequence when;
        long now = System.currentTimeMillis();
        if (!interactive) {
            when = "as of " + DateFormat.getDateInstance(DateFormat.MEDIUM).format(new Date(card.observedAt));
        } else if (now - card.observedAt < DateUtils.MINUTE_IN_MILLIS) {
            when = "just now";
        } else {
            when = DateUtils.getRelativeTimeSpanString(card.observedAt, now, DateUtils.MINUTE_IN_MILLIS);
        }
        TextView footer = ui.text("Source: " + origin + " \u00B7 " + when + "\nThis is what X reports, not a live location.",
                13, false, ui.secondary);
        footer.setPadding(0, ui.dp(16), 0, 0);
        root.addView(footer, Ui.matchWidth());
    }

    private View emoji(String emoji) {
        TextView t = ui.text(emoji, 20, false, ui.text);
        // A flag is an icon: sized like the other icons, not with the text.
        t.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 20);
        t.setGravity(Gravity.CENTER);
        t.setIncludeFontPadding(false);
        t.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return t;
    }

    private ImageView icon(Glyphs.Glyph glyph, int color) {
        ImageView v = new ImageView(context);
        v.setImageDrawable(glyph.asDrawable(color));
        v.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return v;
    }

    /**
     * A picture from X's image server with rounded corners. Its own drawable rounds them, so the
     * corners also show in the card image, which a software canvas draws. The sheet loads the
     * picture; the card image uses it once loaded.
     */
    private ImageView image(String url, float radiusDp, int sizeDp) {
        ImageView v = new ImageView(context);
        v.setScaleType(ImageView.ScaleType.FIT_XY);
        v.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        float radius = ui.dp(radiusDp);
        GradientDrawable placeholder = new GradientDrawable();
        placeholder.setColor(ui.divider);
        placeholder.setCornerRadius(radius);
        v.setImageDrawable(placeholder);
        Bitmap cached = RemoteImages.cached(url);
        if (cached != null) {
            v.setImageDrawable(new RoundedBitmap(cached, radius));
        } else if (interactive) {
            RemoteImages.load(url, ui.dp(sizeDp), bitmap -> {
                if (bitmap != null) v.setImageDrawable(new RoundedBitmap(bitmap, radius));
            });
        }
        return v;
    }

    /** A bitmap cropped to fill its bounds, with rounded corners. */
    static final class RoundedBitmap extends Drawable {
        private final Bitmap bitmap;
        private final float radius;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Matrix matrix = new Matrix();
        private final RectF rect = new RectF();

        RoundedBitmap(Bitmap bitmap, float radius) {
            this.bitmap = bitmap;
            this.radius = radius;
            paint.setShader(new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float scale = Math.max(b.width() / (float) bitmap.getWidth(), b.height() / (float) bitmap.getHeight());
            matrix.setScale(scale, scale);
            matrix.postTranslate(b.left + (b.width() - bitmap.getWidth() * scale) / 2,
                    b.top + (b.height() - bitmap.getHeight() * scale) / 2);
            paint.getShader().setLocalMatrix(matrix);
            rect.set(b);
            canvas.drawRoundRect(rect, radius, radius, paint);
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
