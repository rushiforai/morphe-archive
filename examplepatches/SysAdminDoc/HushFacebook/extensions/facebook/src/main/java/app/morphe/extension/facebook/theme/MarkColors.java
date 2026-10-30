/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Badge and logo colors (#263): the red of the count badges on the tabs, and the blue of the
 * Facebook logo at the top of Home, in colors you pick.
 *
 * <p>It rides route one of the themes, after them: the colours Facebook's FDS resolvers answer.
 * Facebook draws every count badge from its {@link #BADGE_TOKEN} token and the wordmark and logo
 * from the {@link #LOGO_TOKENS}, so a colour asked for with one of those becomes the picked one at
 * the alpha Facebook gave it. Home header text's words take the wordmark's colour, so they follow
 * the logo's pick too. Blank keeps Facebook's own, and so does a paused Facebook.
 *
 * <p>The selected tab's icon and the line over it (#297) come from no single token, so they arrive
 * through {@link SelectedTab}, the hook Material You's selected tab uses, and take the picked
 * color last.
 */
public final class MarkColors {
    /** The three rows: the count badges, the logo, the selected tab. */
    public enum Mark { BADGE, LOGO, TAB }

    /** The FDS token of the red count badge on the tabs, the Menu and the notification bell. */
    static final String BADGE_TOKEN = "NOTIFICATION_BADGE";

    /** The FDS tokens of the Facebook wordmark at the top of Home and the round "f" logo. */
    static final Set<String> LOGO_TOKENS =
            Collections.unmodifiableSet(new HashSet<>(Arrays.asList("FB_WORDMARK", "FB_LOGO")));

    /** Counted under the patch's name each time a badge is drawn in the picked color. */
    static final String BADGE_COLORED = "badge drawn in the picked color";

    /** Counted under the patch's name each time the logo is drawn in the picked color. */
    static final String LOGO_COLORED = "logo drawn in the picked color";

    /** Counted under the patch's name each time the selected tab is drawn in the picked color. */
    static final String TAB_COLORED = "selected tab drawn in the picked color";

    private static final String FAMILY = FamilyNames.MARK_COLORS;

    private MarkColors() {}

    /**
     * Route one, for FDS: a colour a resolver returns for {@code token}. Never throws.
     *
     * @return the picked badge or logo color for those tokens, otherwise {@code color}
     */
    public static int fds(int color, Object token) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !(token instanceof Enum)) return color;
            String name = ((Enum<?>) token).name();
            int themed = fds(color, name, Settings.BADGE_COLOR.get(), Settings.LOGO_COLOR.get());
            if (themed != color) {
                HookStatus.bound(FAMILY, "colour token");
                HookStatus.counted(FAMILY, BADGE_TOKEN.equals(name) ? BADGE_COLORED : LOGO_COLORED);
            }
            return themed;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "colour token", failure);
            return color;
        }
    }

    /** What [color], asked for with [token], becomes with [badge] and [logo] picked, each blank or a code. */
    static int fds(int color, String token, @Nullable String badge, @Nullable String logo) {
        String code = BADGE_TOKEN.equals(token) ? badge : LOGO_TOKENS.contains(token) ? logo : null;
        Integer picked = colour(code);
        if (picked == null) return color;
        return (color & 0xFF000000) | (picked & 0xFFFFFF);
    }

    /**
     * The selected tab's colour, handed over by {@link SelectedTab}. Never throws.
     *
     * @return the picked Selected tab color at the alpha Facebook gave the tab, otherwise {@code color}
     */
    static int tabBarSelected(int color) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady()) return color;
            int themed = tabBarSelected(color, Settings.TAB_COLOR.get());
            if (themed != color) {
                HookStatus.bound(FAMILY, "selected tab");
                HookStatus.counted(FAMILY, TAB_COLORED);
            }
            return themed;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "selected tab", failure);
            return color;
        }
    }

    /** What the selected tab's [color] becomes with [tab] picked, blank or a code. A clear colour stays clear. */
    static int tabBarSelected(int color, @Nullable String tab) {
        Integer picked = colour(tab);
        if (picked == null || (color >>> 24) == 0) return color;
        return (color & 0xFF000000) | (picked & 0xFFFFFF);
    }

    /** The opaque colour {@code text} names as {@code #RRGGBB} (or {@code #FFRRGGBB}), or null when it's blank or names none. */
    @Nullable
    public static Integer colour(@Nullable String text) {
        if (AmoledBackground.hex(text).isEmpty()) return null;
        return AmoledBackground.parsed(text);
    }

    /** {@code text} as its row keeps it: blank, or the colour as {@code #RRGGBB} in capitals. Null when it names none. */
    @Nullable
    public static String stored(@Nullable String text) {
        if (AmoledBackground.hex(text).isEmpty()) return "";
        Integer colour = colour(text);
        return colour == null ? null : String.format(Locale.ROOT, "#%06X", colour & 0xFFFFFF);
    }

    /** Why a row refuses {@code text}, in words the person typing can act on, or null when it's taken. Blank is taken. */
    @Nullable
    public static String problem(@Nullable String text) {
        String hex = AmoledBackground.hex(text);
        if (hex.isEmpty()) return null;
        String shown = L10n.isolate(text.trim());
        if (!AmoledBackground.looksLikeAColour(hex)) {
            return L10n.f("\"%1$s\" isn't a color. Type a six-digit color code (#RRGGBB), like #2ECC71, or leave it blank "
                    + "for Facebook's own.", shown);
        }
        if (colour(text) == null) {
            return L10n.f("%1$s is see-through. Type a solid six-digit color code (#RRGGBB), like #2ECC71.", shown);
        }
        return null;
    }
}
