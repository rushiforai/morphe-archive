package app.template.extension.settings;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.fragment.app.Fragment;

import app.template.extension.artwork.ArtworkHooks;

public final class ProfileBadge {
    private static final String CUSTOM_VIEW = "morphe_profile_badge";
    private static boolean available;

    private ProfileBadge() {}

    public static void enable() {
        available = true;
    }

    static boolean available() {
        return available;
    }

    public static void apply(Fragment fragment, Object member) {
        try {
            View root = fragment.getView();
            if (root == null) return;
            int id = root.getResources().getIdentifier("badge", "id", root.getContext().getPackageName());
            View target = root.findViewById(id);
            if (!(target instanceof LinearLayout)) return;
            LinearLayout badge = (LinearLayout) target;
            View old = badge.findViewWithTag(CUSTOM_VIEW);
            if (old != null) {
                badge.removeView(old);
                badge.getChildAt(0).setVisibility(View.VISIBLE);
            }

            String account = ArtworkHooks.account();
            if (account == null || !account.equals(member.getClass().getMethod("getId").invoke(member))) return;
            String mode = Prefs.getString(Prefs.KEY_PROFILE_BADGE_MODE, "original");
            if ("pro".equals(mode) || "patron".equals(mode)) {
                ClassLoader loader = member.getClass().getClassLoader();
                Class<?> status = Class.forName("com.letterboxd.api.model.MemberStatus", false, loader);
                Class<?> accountStatus = Class.forName("com.letterboxd.api.model.AccountStatus", false, loader);
                Class<?> preset = Class.forName(status.getName() + ("pro".equals(mode) ? "$Pro" : "$Patron"),
                        false, loader);
                Object state = member.getClass().getMethod("getAccountStatus").invoke(member);
                badge.getClass().getMethod("setMemberStatus", status, accountStatus)
                        .invoke(badge, preset.getField("INSTANCE").get(null), state);
            } else if ("custom".equals(mode)) {
                String label = Prefs.getString(Prefs.KEY_PROFILE_BADGE_TEXT, "").trim();
                if (label.isEmpty() || badge.getChildCount() == 0) return;
                TextView custom = new TextView(badge.getContext());
                custom.setTag(CUSTOM_VIEW);
                style(custom, label, Prefs.getString(Prefs.KEY_PROFILE_BADGE_STYLE, "letterboxd"), Prefs.getString(Prefs.KEY_PROFILE_BADGE_COLOR, ""));
                badge.getChildAt(0).setVisibility(View.GONE);
                badge.addView(custom, new LinearLayout.LayoutParams(-2, -2));
                badge.setVisibility(View.VISIBLE);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Fall back to the native badge if the host view or member model is unavailable.
        }
    }

    static void style(TextView view, String label, String style, String hex) {
        Context ctx = view.getContext();
        int accent = AccentPresets.previewColor(ctx,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(ctx)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
        if (!hex.isEmpty()) {
            try {
                accent = AccentMath.parseHex(hex);
            } catch (IllegalArgumentException ignored) {
            }
        }
        accent |= 0xFF000000;
        boolean outline = "local".equals(style);
        float density = view.getResources().getDisplayMetrics().density;
        GradientDrawable background = new GradientDrawable();
        background.setColor(outline ? (accent & 0xFFFFFF) | 0x1C000000 : accent);
        background.setCornerRadius((outline ? 50 : 3) * density);
        if (outline) background.setStroke(Math.round(density), (accent & 0xFFFFFF) | 0x91000000);
        view.setBackground(background);
        view.setTextColor(outline ? AccentPresets.readableText(accent, SurfaceColors.background(ctx))
                : AccentPresets.readableText(Color.WHITE, accent));
        view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        view.setTextSize(outline ? 10 : 11);
        view.setSingleLine();
        view.setMaxWidth(Math.round(144 * density));
        view.setEllipsize(TextUtils.TruncateAt.END);
        int horizontal = Math.round((outline ? 7 : 5) * density);
        int vertical = Math.round((outline ? 3 : 2) * density);
        view.setPadding(horizontal, vertical, horizontal, vertical);
        view.setText(label);
    }
}
