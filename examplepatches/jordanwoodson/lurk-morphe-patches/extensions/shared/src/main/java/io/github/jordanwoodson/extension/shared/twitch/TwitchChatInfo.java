package io.github.jordanwoodson.extension.shared.twitch;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.text.style.DynamicDrawableSpan;
import android.util.Base64;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.nio.ByteBuffer;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Emote and badge info: a tap on an emote or badge image in native chat (live, history, VOD chat replay) shows a
 * small sheet with the image larger, its name, where it comes from and a button that copies the name.
 *
 * <p>While the switch is on, the chat line builder's badge and message spans get a tap span over each image span
 * that has no tap action of its own; GIFs and links keep theirs, and so do Twitch emotes while an account is
 * signed in (Twitch opens its emote card for them, and only then). The names and sources come from what the line
 * and Lurk's caches already hold: the code under an emote, Twitch's badge registry (set and version), and the
 * third-party emote and badge lists. Opening the sheet loads one larger copy of the image from the host the chat
 * image came from.
 */
@SuppressWarnings("unused")
public final class TwitchChatInfo {
    static final String KEY = "chat_emote_info";

    static final String TWITCH_EMOTE_URL = "https://static-cdn.jtvnw.net/emoticons/";
    static final String TWITCH_BADGE_URL = "https://static-cdn.jtvnw.net/badges/";
    static final String CDN_7TV = "https://cdn.7tv.app/emote/";
    static final String CDN_BTTV = "https://cdn.betterttv.net/emote/";
    static final String CDN_FFZ = "https://cdn.frankerfacez.com/emote/";

    private static final int MAX_IMAGE_BYTES = 4 * 1024 * 1024;

    /** Twitch badge image URL -> { set ID, version, "channel" or "global" }, as Twitch's registry answered. */
    private static final Map<String, String[]> TWITCH_BADGES = new LinkedHashMap<String, String[]>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String[]> eldest) {
            return size() > 512;
        }
    };

    private static boolean loggedFailure;

    private TwitchChatInfo() {
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /** Injection point: a chat line's badge span, right before the line's spans are put together. */
    public static CharSequence badges(CharSequence badges) {
        return enabled() ? tappable(badges, true) : badges;
    }

    /** Injection point: a chat line's message span, right before the line's spans are put together. */
    public static CharSequence message(CharSequence message) {
        return enabled() ? tappable(message, false) : message;
    }

    /** Injection point: Twitch's badge registry found {@code url} for a badge key in the channel's badges. */
    public static void twitchChannelBadge(String url, Object key) {
        twitchBadge(url, key, "channel");
    }

    /** Injection point: Twitch's badge registry found {@code url} for a badge key in the global badges. */
    public static void twitchGlobalBadge(String url, Object key) {
        twitchBadge(url, key, "global");
    }

    // ---------------------------------------------------------------------------------------------
    // Bridges, replaced at patch time

    /** Replaced at patch time: whether a drawable is Twitch's chat image placeholder (what its image spans hold). */
    private static boolean isPlaceholder(Object drawable) {
        return false;
    }

    /** Replaced at patch time: the image URL of one of Twitch's chat image placeholders. */
    private static String placeholderUrl(Object placeholder) {
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Lines

    static boolean enabled() {
        return Settings.isEnabled(KEY);
    }

    /**
     * {@code text} with an {@link InfoSpan} over every chat image without a tap action of its own: every badge, or
     * every Twitch or third-party emote. Twitch emotes carry Twitch's emote card span, but Twitch opens that card
     * only for a signed-in account; signed out, Lurk's span goes over it with the highest priority, so the tap shows
     * Lurk's sheet instead of nothing. Returns {@code text} itself when nothing changed.
     */
    static CharSequence tappable(CharSequence text, boolean badge) {
        try {
            if (!(text instanceof Spanned) || text.length() == 0) return text;
            Spanned spanned = (Spanned) text;
            DynamicDrawableSpan[] images = spanned.getSpans(0, spanned.length(), DynamicDrawableSpan.class);
            if (images.length == 0) return text;
            Spannable out = null;
            Boolean signedIn = null;
            for (DynamicDrawableSpan image : images) {
                int start = spanned.getSpanStart(image);
                int end = spanned.getSpanEnd(image);
                if (start < 0 || end <= start) continue;
                String url = imageUrl(image.getDrawable());
                if (url == null || url.isEmpty() || !badge && !isEmote(url)) continue;
                int flags = Spanned.SPAN_EXCLUSIVE_EXCLUSIVE;
                if (spanned.getSpans(start, end, ClickableSpan.class).length > 0) {
                    if (badge || !url.startsWith(TWITCH_EMOTE_URL)) continue;
                    if (signedIn == null) signedIn = !TwitchChatKeywords.signedIn("name").isEmpty();
                    if (signedIn) continue;
                    flags |= Spanned.SPAN_PRIORITY;
                }
                if (out == null) out = new SpannableString(text);
                out.setSpan(new InfoSpan(badge, spanned.subSequence(start, end).toString(), url), start, end, flags);
            }
            return out != null ? out : text;
        } catch (RuntimeException e) {
            fail(e);
            return text;
        }
    }

    private static String imageUrl(Drawable drawable) {
        return drawable != null && isPlaceholder(drawable) ? placeholderUrl(drawable) : null;
    }

    /** Whether a chat image URL is an emote's: Twitch's or a service's. Cheermotes and others aren't. */
    static boolean isEmote(String url) {
        return url.startsWith(TWITCH_EMOTE_URL) || url.startsWith(CDN_7TV) || url.startsWith(CDN_BTTV)
                || url.startsWith(CDN_FFZ);
    }

    private static void twitchBadge(String url, Object key, String scope) {
        try {
            if (url == null || key == null || !enabled()) return;
            // Twitch's BadgeKey(setId=<set>, version=<version>).
            String described = key.toString();
            int set = described.indexOf("setId=");
            int version = described.indexOf(", version=", set);
            if (set < 0 || version < 0 || !described.endsWith(")")) return;
            String[] badge = {described.substring(set + 6, version),
                    described.substring(version + 10, described.length() - 1), scope};
            synchronized (TWITCH_BADGES) {
                TWITCH_BADGES.put(url, badge);
            }
        } catch (RuntimeException e) {
            fail(e);
        }
    }

    /** The tap span over a chat image. It keeps the line's look; with the switch off a tap does nothing. */
    static final class InfoSpan extends ClickableSpan {
        final boolean badge;
        final String name;
        final String url;

        InfoSpan(boolean badge, String name, String url) {
            this.badge = badge;
            this.name = name;
            this.url = url;
        }

        @Override
        public void onClick(View widget) {
            try {
                if (widget != null && enabled()) show(widget.getContext(), describe(badge, name, url));
            } catch (RuntimeException e) {
                fail(e);
            }
        }

        @Override
        public void updateDrawState(TextPaint paint) {
            // An image span draws the text's place; nothing to color or underline.
        }
    }

    // ---------------------------------------------------------------------------------------------
    // What an image is

    /** What the sheet shows for one emote or badge. */
    static final class Info {
        final String name;
        /** "7TV channel emote", "Twitch badge", ... */
        final String kind;
        /** "by <owner>", a badge's detail, or null. */
        final String detail;
        final String image;

        Info(String name, String kind, String detail, String image) {
            this.name = name;
            this.kind = kind;
            this.detail = detail;
            this.image = image;
        }
    }

    static Info describe(boolean badge, String name, String url) {
        if (badge) {
            String[] provider = TwitchBadges.describe(url);
            if (provider != null) return new Info(provider[1], provider[0], null, url);
            String[] twitch;
            synchronized (TWITCH_BADGES) {
                twitch = TWITCH_BADGES.get(url);
            }
            if (twitch != null) {
                return new Info(badgeTitle(twitch[0], twitch[1]), "Twitch " + twitch[2] + " badge",
                        badgeDetail(twitch[0], twitch[1]), url);
            }
            return new Info(badgeTitle(name, ""), url.startsWith(TWITCH_BADGE_URL) ? "Twitch badge" : "Badge", null, url);
        }
        String[] provider = TwitchEmotes.describe(url);
        if (provider != null) {
            String kind = provider[0] + (provider[1] != null ? " " + provider[1] : "") + " emote";
            return new Info(name, kind, provider[2] != null ? "by " + provider[2] : null, url);
        }
        return new Info(name, url.startsWith(TWITCH_EMOTE_URL) ? "Twitch emote" : "Emote", null, url);
    }

    /** A readable title for Twitch badge set {@code set} at {@code version}, like Twitch's own where it's known. */
    static String badgeTitle(String set, String version) {
        int number = number(version);
        switch (set) {
            case "broadcaster": return "Broadcaster";
            case "moderator": return "Moderator";
            case "lead_moderator": return "Lead Moderator";
            case "vip": return "VIP";
            case "staff": return "Staff";
            case "admin": return "Admin";
            case "global_mod": return "Global Moderator";
            case "partner": return "Verified";
            case "premium": return "Prime Gaming";
            case "turbo": return "Turbo";
            case "founder": return "Founder";
            case "artist-badge": return "Artist";
            case "no_audio": return "Watching without audio";
            case "no_video": return "Listening only";
            case "subscriber": {
                if (number < 0) return "Subscriber";
                int tier = number / 1000;
                int months = number % 1000;
                String prefix = tier >= 2 ? "Tier " + tier + " " : "";
                if (months == 0) return prefix + "Subscriber";
                if (months % 12 == 0) return prefix + (months / 12) + "-Year Subscriber";
                return prefix + months + "-Month Subscriber";
            }
            case "bits": return number > 0 ? "cheer " + number : "Bits";
            case "bits-leader": return number > 0 ? "Bits Leader " + number : "Bits Leader";
            case "sub-gifter": return number > 0 ? number + " Gift Subs" : "Sub Gifter";
            case "sub-gift-leader": return number > 0 ? "Gifter Leader " + number : "Gifter Leader";
            default: {
                StringBuilder title = new StringBuilder();
                for (String word : set.split("[-_]")) {
                    if (word.isEmpty()) continue;
                    if (title.length() > 0) title.append(' ');
                    title.append(Character.toUpperCase(word.charAt(0))).append(word.substring(1));
                }
                return title.length() > 0 ? title.toString() : set;
            }
        }
    }

    /** The version of a Twitch badge where the title doesn't say it, or null. */
    static String badgeDetail(String set, String version) {
        switch (set) {
            case "subscriber":
            case "bits":
            case "bits-leader":
            case "sub-gifter":
            case "sub-gift-leader":
                return null;
            default:
                return version.isEmpty() || "0".equals(version) || "1".equals(version) ? null : "Version " + version;
        }
    }

    private static int number(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** The URL of a larger copy of a chat image from the same host, or the URL itself. */
    static String larger(String url) {
        int slash = url.lastIndexOf('/');
        if (slash < 0) return url;
        String head = url.substring(0, slash + 1);
        String tail = url.substring(slash + 1);
        if (url.startsWith(TWITCH_EMOTE_URL)) return head + "3.0";
        if (url.startsWith(TWITCH_BADGE_URL)) return tail.matches("[123]") ? head + "3" : url;
        if (url.startsWith(CDN_7TV)) return tail.matches("[1234]x(_static)?\\.(png|gif|webp)") ? head + "4x" + tail.substring(2) : url;
        if (url.startsWith(CDN_BTTV)) return tail.matches("[123]x(\\.(png|gif|webp))?") ? head + "3x" + tail.substring(2) : url;
        if (url.startsWith(CDN_FFZ)) {
            if (tail.matches("[124]")) return head + "4";
            if (tail.matches("[124]\\.gif") && head.endsWith("/animated/")) return head + "4.gif";
        }
        return url;
    }

    // ---------------------------------------------------------------------------------------------
    // Sheet

    /** The colors of Twitch's own dark and light themes. */
    private static final class Colors {
        final int background;
        final int text;
        final int secondary;
        final int divider;
        final int pressed;

        Colors(int background, int text, int secondary, int divider, int pressed) {
            this.background = background;
            this.text = text;
            this.secondary = secondary;
            this.divider = divider;
            this.pressed = pressed;
        }
    }

    private static final Colors DARK = new Colors(0xFF18181B, 0xFFEFEFF1, 0xFFADADB8, 0xFF35353B, 0x33FFFFFF);
    private static final Colors LIGHT = new Colors(0xFFFFFFFF, 0xFF0E0E10, 0xFF53535F, 0xFFDEDEE3, 0x1A000000);

    static void show(Context context, Info info) {
        Activity activity = TwitchContext.activity(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        boolean dark = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        Colors colors = dark ? DARK : LIGHT;

        LinearLayout sheet = new LinearLayout(activity);
        sheet.setOrientation(LinearLayout.VERTICAL);
        float radius = dp(activity, 16);
        GradientDrawable background = new GradientDrawable();
        background.setColor(colors.background);
        background.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        sheet.setBackground(background);
        sheet.setPadding(0, dp(activity, 10), 0, dp(activity, 12));

        View handle = new View(activity);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(colors.divider);
        pill.setCornerRadius(dp(activity, 2));
        handle.setBackground(pill);
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(dp(activity, 36), dp(activity, 4));
        handleParams.gravity = Gravity.CENTER_HORIZONTAL;
        handleParams.bottomMargin = dp(activity, 14);
        sheet.addView(handle, handleParams);

        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(activity, 20), 0, dp(activity, 20), dp(activity, 16));
        ImageView image = new ImageView(activity);
        image.setAdjustViewBounds(true);
        image.setScaleType(ImageView.ScaleType.FIT_CENTER);
        image.setMaxWidth(dp(activity, 192));
        image.setMinimumWidth(dp(activity, 64));
        image.setContentDescription(info.name);
        header.addView(image, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(activity, 64)));

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.setPadding(dp(activity, 16), 0, 0, 0);
        TextView name = text(activity, info.name, 20, colors.text);
        name.setTypeface(Typeface.DEFAULT_BOLD);
        name.setTextIsSelectable(true);
        texts.addView(name);
        texts.addView(text(activity, info.kind, 15, colors.secondary));
        if (info.detail != null) texts.addView(text(activity, info.detail, 15, colors.secondary));
        header.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        sheet.addView(header);

        View divider = new View(activity);
        divider.setBackgroundColor(colors.divider);
        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.max(1, dp(activity, 1) / 2));
        dividerParams.leftMargin = dividerParams.rightMargin = dp(activity, 20);
        sheet.addView(divider, dividerParams);

        Dialog dialog = new Dialog(activity);
        TextView copy = text(activity, "Copy name", 17, colors.text);
        copy.setGravity(Gravity.CENTER_VERTICAL);
        copy.setMinHeight(dp(activity, 56));
        copy.setPadding(dp(activity, 20), 0, dp(activity, 20), 0);
        copy.setCompoundDrawablePadding(dp(activity, 20));
        CopyIcon icon = new CopyIcon(colors.text, dp(activity, 2));
        icon.setBounds(0, 0, dp(activity, 22), dp(activity, 22));
        copy.setCompoundDrawablesRelative(icon, null, null, null);
        copy.setBackground(pressable(colors.pressed));
        copy.setClickable(true);
        copy.setOnClickListener(view -> {
            copyName(activity, info.name);
            dialog.dismiss();
        });
        sheet.addView(copy, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(sheet);
        dialog.setCanceledOnTouchOutside(true);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setGravity(Gravity.BOTTOM);
            int width = Math.min(activity.getResources().getDisplayMetrics().widthPixels, dp(activity, 560));
            window.setLayout(width, ViewGroup.LayoutParams.WRAP_CONTENT);
            window.setWindowAnimations(android.R.style.Animation_InputMethod);
        }
        dialog.show();
        load(info.image, image, dialog);
        Logger.d("chat info: " + info.kind + " " + info.name);
    }

    private static TextView text(Context context, String value, int sp, int color) {
        TextView view = new TextView(context);
        view.setText(value);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        view.setMaxLines(3);
        view.setEllipsize(TextUtils.TruncateAt.END);
        return view;
    }

    private static Drawable pressable(int pressed) {
        android.graphics.drawable.StateListDrawable states = new android.graphics.drawable.StateListDrawable();
        states.addState(new int[]{android.R.attr.state_pressed}, new ColorDrawable(pressed));
        states.addState(new int[0], new ColorDrawable(Color.TRANSPARENT));
        return states;
    }

    private static void copyName(Context context, String name) {
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null) return;
            clipboard.setPrimaryClip(ClipData.newPlainText(name, name));
            // Android 13 and later show their own confirmation.
            if (Build.VERSION.SDK_INT < 33) Toast.makeText(context, "Copied " + name, Toast.LENGTH_SHORT).show();
        } catch (RuntimeException e) {
            Logger.d("chat info: copy failed: " + e);
        }
    }

    /** Loads a larger copy of {@code url} in the background into {@code view}, while the sheet is up. */
    private static void load(String url, ImageView view, Dialog dialog) {
        Handler main = new Handler(Looper.getMainLooper());
        Context context = view.getContext();
        TwitchThirdParty.run("chat info image", () -> {
            Drawable drawable = decode(context, bytes(larger(url)));
            if (drawable == null && !larger(url).equals(url)) drawable = decode(context, bytes(url));
            if (drawable == null) return;
            Drawable image = drawable;
            main.post(() -> {
                if (!dialog.isShowing()) return;
                view.setImageDrawable(image);
                if (Build.VERSION.SDK_INT >= 28 && image instanceof android.graphics.drawable.AnimatedImageDrawable) {
                    ((android.graphics.drawable.AnimatedImageDrawable) image).start();
                }
            });
        });
    }

    private static byte[] bytes(String url) {
        try {
            if (url.startsWith("data:")) {
                int comma = url.indexOf(',');
                return comma < 0 || !url.substring(0, comma).endsWith(";base64") ? null
                        : Base64.decode(url.substring(comma + 1), Base64.DEFAULT);
            }
            return url.startsWith("https://") ? TwitchThirdParty.getBytes(url, MAX_IMAGE_BYTES) : null;
        } catch (Exception e) {
            Logger.d("chat info: image " + url + " unavailable: " + e);
            return null;
        }
    }

    private static Drawable decode(Context context, byte[] bytes) {
        if (bytes == null || bytes.length == 0) return null;
        try {
            if (Build.VERSION.SDK_INT >= 28) {
                return android.graphics.ImageDecoder.decodeDrawable(
                        android.graphics.ImageDecoder.createSource(ByteBuffer.wrap(bytes)));
            }
            Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            return bitmap == null ? null : new BitmapDrawable(context.getResources(), bitmap);
        } catch (Exception e) {
            Logger.d("chat info: image undecodable: " + e);
            return null;
        }
    }

    private static int dp(Context context, float dp) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp,
                context.getResources().getDisplayMetrics()));
    }

    /** Two overlapping rounded squares, the usual copy icon, drawn in code. */
    private static final class CopyIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        CopyIcon(int color, float stroke) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
        }

        @Override
        public void draw(Canvas canvas) {
            float size = getBounds().width();
            float stroke = paint.getStrokeWidth();
            float box = size * 0.68f;
            float radius = size * 0.12f;
            float left = getBounds().left + stroke / 2;
            float top = getBounds().top + stroke / 2;
            canvas.drawRoundRect(new RectF(left + size - box - stroke, top + size - box - stroke,
                    left + size - stroke, top + size - stroke), radius, radius, paint);
            canvas.drawRoundRect(new RectF(left, top, left + box, top + box), radius, radius, paint);
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

    private static void fail(Exception e) {
        if (loggedFailure) return;
        loggedFailure = true;
        Logger.d("chat info: failed: " + e);
    }
}
