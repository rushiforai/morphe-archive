/*
 * Story mentions popup (Morphe): a modern replacement for the plain list dialog.
 * Part of the story mention indicator; see StoryMentionIcon.
 */

package app.morphe.extension.instagram.patches.story;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Shows the accounts mentioned in a story, in one of three styles chosen in the settings:
 * Instagram-like bottom sheet, modern translucent card, or minimalist floating card.
 */
@SuppressWarnings("unused")
public final class StoryMentionPopup {
    public static final int STYLE_SHEET = 0;
    public static final int STYLE_MODERN = 1;
    public static final int STYLE_MINIMAL = 2;
    public static final int STYLE_COUNT = 3;

    /** One mentioned account. Details other than the username may be empty. */
    public static final class Mention {
        final String username;
        final String fullName;
        final String picUrl;
        final boolean verified;

        Mention(String username, String fullName, String picUrl, boolean verified) {
            this.username = username;
            this.fullName = fullName;
            this.picUrl = picUrl;
            this.verified = verified;
        }

        @Override
        public String toString() {
            return username;
        }
    }

    private static final int ACCENT = 0xFF3897F0;

    private static final ExecutorService POOL = Executors.newFixedThreadPool(3);
    private static final LruCache<String, Bitmap> AVATARS = new LruCache<>(48);

    private StoryMentionPopup() {
    }

    // ---- names ---------------------------------------------------------------------------

    public static String styleName(int style, boolean pt) {
        switch (style) {
            case STYLE_MODERN:
                return pt ? "Moderno (translúcido)" : "Modern (translucent)";
            case STYLE_MINIMAL:
                return pt ? "Minimalista" : "Minimalist";
            default:
                return pt ? "Instagram (bottom sheet)" : "Instagram (bottom sheet)";
        }
    }

    public static String styleDescription(int style, boolean pt) {
        switch (style) {
            case STYLE_MODERN:
                return pt ? "Com leve transparência e efeito de vidro." : "Slightly transparent, glass effect.";
            case STYLE_MINIMAL:
                return pt ? "Simples, direto e elegante." : "Simple, direct and elegant.";
            default:
                return pt ? "Visual nativo, limpo e consistente com o app." : "Native look, clean and consistent with the app.";
        }
    }

    private static boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    // ---- palette -------------------------------------------------------------------------

    private static final class Palette {
        int background = 0xFF10141A;
        int stroke = 0;
        int primary = 0xFFF5F7FA;
        int secondary = 0xFF9AA3AE;
        int placeholder = 0xFF2A2F36;
    }

    /** The minimalist style follows the app's light/dark mode; the others are dark, as in their references. */
    private static Palette palette(Activity activity, int style) {
        Palette p = new Palette();
        if (style == STYLE_MODERN) {
            p.background = 0xCC141820;
            p.stroke = 0x40FFFFFF;
        } else if (style == STYLE_MINIMAL) {
            boolean dark = (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            if (dark) {
                p.background = 0xFF12161C;
            } else {
                p.background = 0xFFFFFFFF;
                p.primary = 0xFF121417;
                p.secondary = 0xFF6B7480;
                p.placeholder = 0xFFE6EAF0;
            }
        }
        return p;
    }

    // ---- popup ---------------------------------------------------------------------------

    public static void show(Activity activity, List<Mention> mentions) {
        if (mentions.isEmpty()) return;
        int style = StoryMentionSettings.popupStyle(activity);
        Palette p = palette(activity, style);
        boolean pt = pt();

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(activity, 20);
        content.setPadding(pad, dp(activity, style == STYLE_SHEET ? 10 : 20), pad, dp(activity, 20));

        if (style == STYLE_MINIMAL && mentions.size() == 1) {
            // One account: a large avatar and a "view profile" button.
            Mention only = mentions.get(0);
            content.addView(single(activity, only, p, pt, () -> {
                dialog.dismiss();
                StoryMentionIcon.openProfile(activity, only.username);
            }));
        } else {
            if (style == STYLE_SHEET) {
                View handle = new View(activity);
                GradientDrawable handleBg = new GradientDrawable();
                handleBg.setColor(0xFF4A515A);
                handleBg.setCornerRadius(dp(activity, 2));
                handle.setBackground(handleBg);
                LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(activity, 36), dp(activity, 4));
                handleLp.gravity = Gravity.CENTER_HORIZONTAL;
                handleLp.bottomMargin = dp(activity, 18);
                content.addView(handle, handleLp);
            }

            TextView title = new TextView(activity);
            title.setText(pt ? "Menções" : "Mentions");
            title.setTextColor(p.primary);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            content.addView(title);

            int count = mentions.size();
            TextView subtitle = new TextView(activity);
            subtitle.setText(pt
                    ? count + (count == 1 ? " conta mencionada neste story" : " contas mencionadas neste story")
                    : count + (count == 1 ? " account mentioned in this story" : " accounts mentioned in this story"));
            subtitle.setTextColor(p.secondary);
            subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            subtitle.setPadding(0, dp(activity, 2), 0, dp(activity, 12));
            content.addView(subtitle);

            LinearLayout list = new LinearLayout(activity);
            list.setOrientation(LinearLayout.VERTICAL);
            for (Mention mention : mentions) {
                list.addView(row(activity, mention, p, () -> {
                    dialog.dismiss();
                    StoryMentionIcon.openProfile(activity, mention.username);
                }));
            }
            int maxHeight = Math.round(activity.getResources().getDisplayMetrics().heightPixels * 0.5f);
            MaxHeightScrollView scroll = new MaxHeightScrollView(activity, maxHeight);
            scroll.setVerticalScrollBarEnabled(false);
            scroll.addView(list);
            content.addView(scroll);
        }

        dialog.setContentView(content);
        dialog.setCanceledOnTouchOutside(true);
        configureWindow(activity, dialog.getWindow(), style, p);
        dialog.show();
    }

    private static void configureWindow(Activity activity, Window window, int style, Palette p) {
        if (window == null) return;
        float radius = dp(activity, 24);
        int margin = style == STYLE_SHEET ? 0 : dp(activity, style == STYLE_MODERN ? 12 : 32);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(p.background);
        if (p.stroke != 0) bg.setStroke(Math.max(1, dp(activity, 1)), p.stroke);
        if (style == STYLE_SHEET) {
            bg.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        } else {
            bg.setCornerRadius(radius);
        }
        window.setBackgroundDrawable(bg);

        int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
        WindowManager.LayoutParams lp = window.getAttributes();
        lp.width = screenWidth - margin * 2;
        lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        if (style == STYLE_MINIMAL) {
            // Centered in the screen.
            lp.gravity = Gravity.CENTER;
            lp.windowAnimations = android.R.style.Animation_Dialog;
        } else {
            lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
            lp.y = style == STYLE_SHEET ? 0 : dp(activity, 12);
            lp.windowAnimations = android.R.style.Animation_InputMethod;
        }
        lp.dimAmount = 0.5f;
        window.setAttributes(lp);
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);

        if (style == STYLE_MODERN && Build.VERSION.SDK_INT >= 31) {
            // Blur of what is behind the window (Android 12+); reflection because the extension may
            // be compiled against an older SDK. Silently skipped if unavailable.
            try {
                Window.class.getMethod("setBackgroundBlurRadius", int.class).invoke(window, dp(activity, 24));
            } catch (Throwable ignored) {
                // Plain translucency is still a fine result.
            }
        }
    }

    // ---- content -------------------------------------------------------------------------

    /** Minimalist, one account: centered large avatar, @username, full name and a "view profile" button. */
    private static View single(Activity activity, Mention mention, Palette p, boolean pt, Runnable open) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER_HORIZONTAL);

        box.addView(avatar(activity, mention, p, 28), new LinearLayout.LayoutParams(dp(activity, 88), dp(activity, 88)));

        LinearLayout nameLine = nameLine(activity, mention, p, 20);
        LinearLayout.LayoutParams nameLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nameLp.topMargin = dp(activity, 14);
        box.addView(nameLine, nameLp);

        if (!mention.fullName.isEmpty()) {
            TextView full = new TextView(activity);
            full.setText(mention.fullName);
            full.setTextColor(p.secondary);
            full.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            full.setGravity(Gravity.CENTER);
            box.addView(full);
        }

        TextView button = new TextView(activity);
        button.setText(pt ? "Ver perfil" : "View profile");
        button.setTextColor(Color.WHITE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        button.setGravity(Gravity.CENTER);
        GradientDrawable buttonBg = new GradientDrawable();
        buttonBg.setColor(ACCENT);
        buttonBg.setCornerRadius(dp(activity, 24));
        button.setBackground(buttonBg);
        button.setOnClickListener(v -> open.run());
        LinearLayout.LayoutParams buttonLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 48));
        buttonLp.topMargin = dp(activity, 22);
        box.addView(button, buttonLp);
        return box;
    }

    private static View row(Activity activity, Mention mention, Palette p, Runnable onClick) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(activity, 8), 0, dp(activity, 8));
        row.setOnClickListener(v -> onClick.run());

        row.addView(avatar(activity, mention, p, 18), new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 48)));

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(nameLine(activity, mention, p, 16));
        if (!mention.fullName.isEmpty()) {
            TextView full = new TextView(activity);
            full.setText(mention.fullName);
            full.setTextColor(p.secondary);
            full.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            full.setSingleLine(true);
            full.setEllipsize(android.text.TextUtils.TruncateAt.END);
            texts.addView(full);
        }
        LinearLayout.LayoutParams textsLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textsLp.setMarginStart(dp(activity, 14));
        row.addView(texts, textsLp);

        TextView chevron = new TextView(activity);
        chevron.setText("\u203A");
        chevron.setTextColor(p.secondary);
        chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 26);
        chevron.setGravity(Gravity.CENTER);
        row.addView(chevron, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    /** "@username" followed by the verified badge, if any. */
    private static LinearLayout nameLine(Activity activity, Mention mention, Palette p, int sp) {
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        TextView handle = new TextView(activity);
        handle.setText("@" + mention.username);
        handle.setTextColor(p.primary);
        handle.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        handle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        handle.setSingleLine(true);
        handle.setEllipsize(android.text.TextUtils.TruncateAt.END);
        line.addView(handle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        if (mention.verified) {
            TextView badge = new TextView(activity);
            badge.setText("\u2713");
            badge.setTextColor(Color.WHITE);
            badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 9);
            badge.setGravity(Gravity.CENTER);
            GradientDrawable badgeBg = new GradientDrawable();
            badgeBg.setShape(GradientDrawable.OVAL);
            badgeBg.setColor(ACCENT);
            badge.setBackground(badgeBg);
            LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(dp(activity, 14), dp(activity, 14));
            badgeLp.setMarginStart(dp(activity, 6));
            line.addView(badge, badgeLp);
        }
        return line;
    }

    /** Round avatar: a placeholder circle with the initial, replaced by the picture once downloaded. */
    private static View avatar(Activity activity, Mention mention, Palette p, int initialSp) {
        FrameLayout frame = new FrameLayout(activity);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(p.placeholder);
        frame.setBackground(circle);

        TextView initial = new TextView(activity);
        initial.setText(mention.username.isEmpty() ? "" : mention.username.substring(0, 1).toUpperCase(Locale.ROOT));
        initial.setTextColor(p.secondary);
        initial.setTextSize(TypedValue.COMPLEX_UNIT_SP, initialSp);
        initial.setGravity(Gravity.CENTER);
        frame.addView(initial, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        ImageView picture = new ImageView(activity);
        picture.setScaleType(ImageView.ScaleType.CENTER_CROP);
        picture.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setOval(0, 0, view.getWidth(), view.getHeight());
            }
        });
        picture.setClipToOutline(true);
        frame.addView(picture, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        loadAvatar(mention.picUrl, picture);
        return frame;
    }

    private static void loadAvatar(String url, ImageView target) {
        if (url == null || url.isEmpty()) return;
        Bitmap cached = AVATARS.get(url);
        if (cached != null) {
            target.setImageBitmap(cached);
            return;
        }
        target.setTag(url);
        POOL.execute(() -> {
            Bitmap bitmap = download(url);
            if (bitmap == null) return;
            AVATARS.put(url, bitmap);
            target.post(() -> {
                if (url.equals(target.getTag())) target.setImageBitmap(bitmap);
            });
        });
    }

    private static Bitmap download(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            try (InputStream in = connection.getInputStream()) {
                return BitmapFactory.decodeStream(in);
            }
        } catch (Throwable t) {
            android.util.Log.w("StoryMentionIcon", "avatar download failed", t);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    /** ScrollView that is only as tall as its content, up to a maximum. */
    private static final class MaxHeightScrollView extends ScrollView {
        private final int maxHeight;

        MaxHeightScrollView(Activity activity, int maxHeight) {
            super(activity);
            this.maxHeight = maxHeight;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
        }
    }

    private static int dp(Activity activity, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics()));
    }
}
