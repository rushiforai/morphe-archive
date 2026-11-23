package app.mightymorphing.extension.joey;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Build;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Modern UI colour roles, the built-in themes, light and dark, per-colour changes and the
 * adjustment sliders. ModernUi.getPalette asks this once per change and caches the result,
 * so nothing here runs while the feed scrolls.
 */
public final class ModernTheme {
    static final int BACKGROUND = 0;
    static final int CARDS = 1;
    static final int RAISED = 2;
    static final int TOOLBAR = 3;
    static final int DRAWER = 4;
    static final int DIVIDERS = 5;
    static final int TEXT = 6;
    static final int READ = 7;
    static final int SECONDARY = 8;
    static final int ACCENT = 9;
    static final int LINKS = 10;
    static final int PINNED = 11;
    static final int ON_ACCENT = 12;
    static final int UPVOTE = 13;
    static final int DOWNVOTE = 14;
    /** The circle Joey draws when a profile is marked NSFW and its picture is hidden. */
    static final int HIDDEN_AVATAR = 15;
    /** Video controls in the media viewer. Zero or unset follows the theme. */
    static final int VIDEO_PLAYED = 16;
    static final int VIDEO_BUFFERED = 17;
    static final int VIDEO_UNPLAYED = 18;
    static final int VIDEO_BUTTONS = 19;
    static final int VIDEO_VOLUME = 20;
    static final int COUNT = 21;

    /** Stored names. They match the theme data the presets were designed with. */
    static final String[] KEYS = {
            "background", "cards", "raised", "toolbar", "drawer", "dividers",
            "text", "read", "secondary", "accent", "links", "pinned", "on_fab", "upvote", "downvote", "hidden_avatar",
            "video_played", "video_buffered", "video_unplayed", "video_buttons", "video_volume",
    };
    static final String[] LABELS = {
            "Background", "Cards", "Raised panels", "Toolbar", "Drawer", "Dividers",
            "Text", "Read titles", "Secondary text and icons", "Accent", "Links", "Pinned",
            "Text on accent", "Upvote", "Downvote", "Hidden profile pictures",
            "Played bar and knob", "Buffered bar", "Unplayed bar", "Buttons and time", "Volume slider",
    };
    static final String[] GROUPS = {"Surfaces", "Text and icons", "Accents", "Votes and comments", "Video controls"};
    static final int[][] GROUP_ROLES = {
            {BACKGROUND, CARDS, RAISED, TOOLBAR, DRAWER, DIVIDERS},
            {TEXT, READ, SECONDARY},
            {ACCENT, LINKS, PINNED, ON_ACCENT},
            {UPVOTE, DOWNVOTE, HIDDEN_AVATAR},
            {VIDEO_PLAYED, VIDEO_BUFFERED, VIDEO_UNPLAYED, VIDEO_BUTTONS, VIDEO_VOLUME},
    };

    /** Joey's own video controls: the bar and buttons in white. */
    static final int JOEY_VIDEO_PLAYED = 0xFFFFFFFF;
    static final int JOEY_VIDEO_BUFFERED = 0xFFFFFFFF;
    static final int JOEY_VIDEO_UNPLAYED = 0xFFFFFFFF;
    static final int JOEY_VIDEO_BUTTONS = 0xFFFFFFFF;
    static final int JOEY_VIDEO_VOLUME = 0xFFFFFFFF;
    static final String KEY_VIDEO_JOEY = "theme_video_joey";

    /** Joey's own vote colours, md_orange_600 and md_blue_600. "Restore standard" puts these back. */
    static final int JOEY_UPVOTE = 0xFFFB8C00;
    static final int JOEY_DOWNVOTE = 0xFF1E88E5;
    /** Joey's circle for a hidden NSFW profile picture. */
    static final int JOEY_HIDDEN_AVATAR = 0xFFFF575B;

    static final String KEY_MODE = "theme_mode";
    static final String KEY_MINE = "my_themes";
    static final String PREFIX_OVER = "theme_over:";
    static final String PREFIX_TWEAK = "theme_tweak:";
    static final String MODE_SYSTEM = "system";
    static final String MODE_LIGHT = "light";
    static final String MODE_DARK = "dark";

    static final String WALLPAPER = ModernUi.ACCENT_MONET;

    static final class Def {
        final String id;
        final String name;
        final int[] light;
        final int[] dark;

        Def(String id, String name, int[] light, int[] dark) {
            this.id = id;
            this.name = name;
            this.light = light;
            this.dark = dark;
        }
    }

    /** Light first, then dark. Role order is KEYS. */
    static final Def[] THEMES = {
            new Def("t:nordic_dusk", "Dusk", new int[]{0xFFECF0F4, 0xFFFFFFFF, 0xFFF7F9FB, 0xFFFFFFFF, 0xFFE2E8EE, 0xFFCCD5DF, 0xFF151B22, 0xFF667687, 0xFF495766, 0xFFC25E29, 0xFF1E60A3, 0xFF2E6F9E, 0xFFFFFFFF, 0xFFD9652B, 0xFF3B7AA8},
                    new int[]{0xFF0D131A, 0xFF161E27, 0xFF1F2A36, 0xFF161E27, 0xFF111821, 0xFF273545, 0xFFE6EDF5, 0xFF7C91A6, 0xFF9BB0C4, 0xFFF2874E, 0xFF68A6E8, 0xFF60B0E6, 0xFF361605, 0xFFF7915C, 0xFF60A8E0}),
            new Def("t:retro_terminal", "Terminal", new int[]{0xFFEDE6D8, 0xFFF6F1E6, 0xFFFAF7F0, 0xFFEDE6D8, 0xFFE2DAC9, 0xFFC9BEAA, 0xFF241A0D, 0xFF73604A, 0xFF524330, 0xFF9E5600, 0xFF1E6161, 0xFF8F4415, 0xFFFFFFFF, 0xFF1D7533, 0xFF6C2D9E},
                    new int[]{0xFF0B0906, 0xFF17130B, 0xFF241E12, 0xFF141009, 0xFF100D07, 0xFF382E1C, 0xFFFFC866, 0xFF9E793D, 0xFFC4A36E, 0xFFFFAA00, 0xFF42E0D1, 0xFFFF884D, 0xFF241600, 0xFF3EE668, 0xFFCF78FF}),
            new Def("t:cyber_neon", "Neon", new int[]{0xFFF4F0F7, 0xFFFFFFFF, 0xFFFAF7FC, 0xFFFFFFFF, 0xFFEBE3F2, 0xFFD4C8E3, 0xFF1E1329, 0xFF705E82, 0xFF544369, 0xFFA61775, 0xFF165C96, 0xFFA85408, 0xFFFFFFFF, 0xFF4C7800, 0xFF3E36BD},
                    new int[]{0xFF0D0914, 0xFF171024, 0xFF221736, 0xFF140E21, 0xFF100B1A, 0xFF342252, 0xFFF3ECFA, 0xFF947EA8, 0xFFBBA7D1, 0xFFFF2A9D, 0xFF00F0FF, 0xFFFFE600, 0xFF33001C, 0xFFB5FF2E, 0xFF8A82FF}),
            new Def("t:high_contrast", "Contrast", new int[]{0xFFFFFFFF, 0xFFF0F2F5, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFEAEDF2, 0xFF9EA8B5, 0xFF000000, 0xFF474D54, 0xFF282B2E, 0xFF003BB0, 0xFF003BB0, 0xFF721C24, 0xFFFFFFFF, 0xFFBF360C, 0xFF0273A8},
                    new int[]{0xFF000000, 0xFF121417, 0xFF1E2227, 0xFF121417, 0xFF0A0C0E, 0xFF47515E, 0xFFFFFFFF, 0xFF9EA8B3, 0xFFCBD3DC, 0xFFFFD600, 0xFF68B5FF, 0xFFFF80AB, 0xFF000000, 0xFFFF7700, 0xFF47A3FF}),
            new Def("t:newspaper", "Newsprint", new int[]{0xFFF0EEE9, 0xFFFCFBF7, 0xFFFFFFFF, 0xFFF0EEE9, 0xFFE3DFD5, 0xFFC9C4B7, 0xFF141312, 0xFF66635D, 0xFF474540, 0xFFBA1A1A, 0xFF164973, 0xFF853609, 0xFFFFFFFF, 0xFFC74A00, 0xFF244C8A},
                    new int[]{0xFF121212, 0xFF1C1C1C, 0xFF272727, 0xFF1A1A1A, 0xFF151515, 0xFF383838, 0xFFF0F0F0, 0xFF999999, 0xFFB8B8B8, 0xFFFF5252, 0xFF6BB1F2, 0xFFFFA040, 0xFF360000, 0xFFFF8533, 0xFF6899EB}),
            new Def("t:pastel_macaron", "Macaron", new int[]{0xFFF8F5FA, 0xFFFFFFFF, 0xFFFDFCFF, 0xFFFFFFFF, 0xFFEFE9F5, 0xFFDCD0E6, 0xFF261C30, 0xFF70627D, 0xFF524461, 0xFF7345A1, 0xFF225F8F, 0xFFA6542D, 0xFFFFFFFF, 0xFF9E217A, 0xFF2F5FC0},
                    new int[]{0xFF14101A, 0xFF1E1826, 0xFF292133, 0xFF1E1826, 0xFF17121E, 0xFF3B2E47, 0xFFF0EAF7, 0xFF9685A6, 0xFFBBA9CC, 0xFFB88EF5, 0xFF75BCF7, 0xFFF7A372, 0xFF200E3B, 0xFFF26AC8, 0xFF8AA0FF}),
            new Def("t:sunset_blvd", "Sunset", new int[]{0xFFF7F0F4, 0xFFFFFFFF, 0xFFFDF9FC, 0xFFFFFFFF, 0xFFEDE0E7, 0xFFDBC6D3, 0xFF24131F, 0xFF6E5968, 0xFF4D3D49, 0xFFB82352, 0xFF234E8F, 0xFF9E4C0D, 0xFFFFFFFF, 0xFF9C5800, 0xFF732B99},
                    new int[]{0xFF140C14, 0xFF211421, 0xFF2E1C2E, 0xFF1C101C, 0xFF170E17, 0xFF402640, 0xFFF2E4ED, 0xFF967D8F, 0xFFBCA3B4, 0xFFFF5C8A, 0xFF61A8FF, 0xFFF79B48, 0xFF360012, 0xFFFFA933, 0xFFCC78F5}),
            new Def("t:velvet_crimson", "Crimson", new int[]{0xFFF7EFF0, 0xFFFFFFFF, 0xFFFDFAFA, 0xFFFFFFFF, 0xFFEEE0E2, 0xFFDBC6C9, 0xFF241316, 0xFF6E5559, 0xFF4D3B3E, 0xFF94132F, 0xFF1A467A, 0xFF965B0E, 0xFFFFFFFF, 0xFF8A6200, 0xFF0A5E6B},
                    new int[]{0xFF140A0C, 0xFF211114, 0xFF2E181D, 0xFF1A0D10, 0xFF170C0E, 0xFF402026, 0xFFF2E4E6, 0xFF997A80, 0xFFBCA0A6, 0xFFF0486B, 0xFF6BB1F5, 0xFFF2B544, 0xFF36000C, 0xFFF7CC4A, 0xFF3EE0EB}),
            new Def("t:sepia_bookworm", "Sepia", new int[]{0xFFF3EBD9, 0xFFFAF4E8, 0xFFFDFAF3, 0xFFFAF4E8, 0xFFEBE1CB, 0xFFD9CDB4, 0xFF292118, 0xFF736452, 0xFF524434, 0xFF9C471E, 0xFF205278, 0xFF823C1C, 0xFFFFFFFF, 0xFF7A6600, 0xFF5C36A8},
                    new int[]{0xFF14100C, 0xFF1F1A14, 0xFF2B231C, 0xFF1F1A14, 0xFF191410, 0xFF382E23, 0xFFEDE2D1, 0xFF968673, 0xFFBCAAA0, 0xFFE67D45, 0xFF72A9D6, 0xFFDEB059, 0xFF311406, 0xFFEDD53B, 0xFFA887FF}),
            new Def("t:oled_obsidian", "Obsidian", new int[]{0xFFEDF3F8, 0xFFFFFFFF, 0xFFF5F9FC, 0xFFFFFFFF, 0xFFE4EDF5, 0xFFC8D7E6, 0xFF0A1622, 0xFF59738A, 0xFF3A5163, 0xFF026AA2, 0xFF026AA2, 0xFF6B3FC9, 0xFFFFFFFF, 0xFF057A55, 0xFF662EC9},
                    new int[]{0xFF000000, 0xFF0F1115, 0xFF1A1D24, 0xFF080A0D, 0xFF080A0C, 0xFF252B33, 0xFFF0F3F6, 0xFF8593A1, 0xFFA8B8C7, 0xFF00D2FF, 0xFF38D9FF, 0xFFBC8CFF, 0xFF00232E, 0xFF2EE8A5, 0xFFAD80FF}),
            new Def("t:forest_canopy", "Forest", new int[]{0xFFEDF2ED, 0xFFFFFFFF, 0xFFF7FAF7, 0xFFFFFFFF, 0xFFE1E9E1, 0xFFC8D4C8, 0xFF132115, 0xFF5D7362, 0xFF3F5443, 0xFF215E34, 0xFF1A5466, 0xFF804C1D, 0xFFFFFFFF, 0xFFB8336A, 0xFF404896},
                    new int[]{0xFF0B140E, 0xFF132118, 0xFF1A2C20, 0xFF132118, 0xFF0F1C14, 0xFF243B2C, 0xFFE5F0E8, 0xFF7EA086, 0xFFA1BEA8, 0xFF50CF7A, 0xFF54B8D9, 0xFFE39C59, 0xFF062912, 0xFFFF7FAE, 0xFF858EF2}),
            new Def("t:graphite_lime", "Lime", new int[]{0xFFEBEEF2, 0xFFFFFFFF, 0xFFF5F7FA, 0xFFFFFFFF, 0xFFDFE4EA, 0xFFC5CDD8, 0xFF11161C, 0xFF5B6978, 0xFF3F4D5C, 0xFF4D8C00, 0xFF165C9E, 0xFF8F4E0E, 0xFFFFFFFF, 0xFF0D7A36, 0xFF3B42BD},
                    new int[]{0xFF0E1114, 0xFF171C21, 0xFF212830, 0xFF171C21, 0xFF12161B, 0xFF2C3642, 0xFFEAF0F7, 0xFF7D91A3, 0xFF9BB0C4, 0xFF84F016, 0xFF4EC7F0, 0xFFE8A44D, 0xFF142600, 0xFF34E877, 0xFF858CFF}),
    };

    private ModernTheme() {
    }

    // ---------------------------------------------------------------------
    // Which theme, which mode
    // ---------------------------------------------------------------------

    static boolean isPreset(String id) {
        return id != null && id.startsWith("t:");
    }

    static boolean isMine(String id) {
        return id != null && id.startsWith("u:");
    }

    static Def preset(String id) {
        for (Def def : THEMES) if (def.id.equals(id)) return def;
        return null;
    }

    /** The original Modern colours (Blue to AMOLED) are dark only. Wallpaper and the new themes do both. */
    static boolean hasLight(Context context, String id) {
        if (isMine(id)) return hasLight(context, mineBase(context, id));
        return isPreset(id) || WALLPAPER.equalsIgnoreCase(id);
    }

    static String mode(Context context) {
        return prefs(context).getString(KEY_MODE, MODE_SYSTEM);
    }

    static void setMode(Context context, String mode) {
        prefs(context).edit().putString(KEY_MODE, mode).commit();
    }

    static boolean wantsLight(Context context, String id) {
        if (!hasLight(context, id)) return false;
        String mode = mode(context);
        if (MODE_LIGHT.equals(mode)) return true;
        if (MODE_DARK.equals(mode)) return false;
        int night = context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return night != Configuration.UI_MODE_NIGHT_YES;
    }

    static String name(Context context, String id) {
        if (id == null) return "Blue";
        Def def = preset(id);
        if (def != null) return def.name;
        if (isMine(id)) {
            JSONObject mine = mine(context, id);
            return mine == null ? "My theme" : mine.optString("name", "My theme");
        }
        if (ModernUi.ACCENT_TEAL.equalsIgnoreCase(id)) return "Aqua";
        if (ModernUi.ACCENT_PURPLE.equalsIgnoreCase(id)) return "Purple";
        if (ModernUi.ACCENT_CORAL.equalsIgnoreCase(id)) return "Coral";
        if (ModernUi.ACCENT_MINT.equalsIgnoreCase(id)) return "Mint";
        if (ModernUi.ACCENT_GOLD.equalsIgnoreCase(id)) return "Gold";
        if (ModernUi.ACCENT_AMBER.equalsIgnoreCase(id)) return "Amber";
        if (ModernUi.ACCENT_BLACK.equalsIgnoreCase(id)) return "Black";
        if (WALLPAPER.equalsIgnoreCase(id)) return "Wallpaper";
        if (ModernUi.ACCENT_AMOLED.equalsIgnoreCase(id)) return "AMOLED black";
        return "Blue";
    }

    // ---------------------------------------------------------------------
    // Building the colours
    // ---------------------------------------------------------------------

    /** Base colours before the user's changes. A My theme starts from the theme it was saved from. */
    static int[] base(Context context, String id, boolean light, boolean amoled) {
        int[] roles = baseRoles(context, id, light, amoled);
        fillVideo(roles);
        return roles;
    }

    /** Video colours the theme does not design itself follow its accent, with white for the rest. */
    private static void fillVideo(int[] roles) {
        if (roles[VIDEO_PLAYED] == 0) roles[VIDEO_PLAYED] = roles[ACCENT] != 0 ? roles[ACCENT] : JOEY_VIDEO_PLAYED;
        if (roles[VIDEO_BUFFERED] == 0) roles[VIDEO_BUFFERED] = JOEY_VIDEO_BUFFERED;
        if (roles[VIDEO_UNPLAYED] == 0) roles[VIDEO_UNPLAYED] = JOEY_VIDEO_UNPLAYED;
        if (roles[VIDEO_BUTTONS] == 0) roles[VIDEO_BUTTONS] = JOEY_VIDEO_BUTTONS;
        if (roles[VIDEO_VOLUME] == 0) roles[VIDEO_VOLUME] = roles[ACCENT] != 0 ? roles[ACCENT] : JOEY_VIDEO_VOLUME;
    }

    private static int[] baseRoles(Context context, String id, boolean light, boolean amoled) {
        if (isMine(id)) return base(context, mineBase(context, id), light, amoled);
        Def def = preset(id);
        if (def != null) return withNewRoles(light ? def.light : def.dark);
        if (WALLPAPER.equalsIgnoreCase(id) && Build.VERSION.SDK_INT >= 31) {
            int[] wall = wallpaper(context, light);
            if (wall != null) {
                if (amoled && !light) blackOut(wall);
                return wall;
            }
        }
        return legacy(context, id, amoled);
    }

    /** Roles added after the presets were designed take a quiet colour from the theme itself. */
    private static int[] withNewRoles(int[] designed) {
        int[] roles = new int[COUNT];
        System.arraycopy(designed, 0, roles, 0, Math.min(designed.length, COUNT));
        if (designed.length <= HIDDEN_AVATAR) roles[HIDDEN_AVATAR] = mix(roles[SECONDARY], roles[CARDS], 0.45f);
        return roles;
    }

    /** The colours Modern has always used. Kept exactly, so nobody's look changes. */
    static int[] legacy(Context context, String id, boolean amoled) {
        int accent = ModernUi.COLOR_BLUE;
        int primary = 0xFF111827;
        int canvas = 0xFF0B0F19;
        int container = 0xFF151E2E;
        int containerHigh = 0xFF1E293B;
        int outline = 0xFF334155;
        if (WALLPAPER.equalsIgnoreCase(id) && Build.VERSION.SDK_INT >= 31) {
            try {
                accent = context.getColor(android.R.color.system_accent1_500);
                canvas = context.getColor(android.R.color.system_neutral1_900);
                primary = context.getColor(android.R.color.system_neutral1_800);
                container = context.getColor(android.R.color.system_neutral1_800);
                containerHigh = context.getColor(android.R.color.system_neutral1_700);
                outline = context.getColor(android.R.color.system_neutral2_700);
            } catch (Throwable ignored) {
            }
        } else if (ModernUi.ACCENT_TEAL.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_TEAL;
            primary = 0xFF111E20;
            canvas = 0xFF0A1213;
            container = 0xFF132022;
            containerHigh = 0xFF1B2B2D;
            outline = 0xFF253B3E;
        } else if (ModernUi.ACCENT_PURPLE.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_PURPLE;
            primary = 0xFF141318;
            canvas = 0xFF0E0D12;
            container = 0xFF18161D;
            containerHigh = 0xFF221F28;
            outline = 0xFF34303C;
        } else if (ModernUi.ACCENT_CORAL.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_CORAL;
            primary = 0xFF1F1512;
            canvas = 0xFF130D0B;
            container = 0xFF241915;
            containerHigh = 0xFF30221D;
            outline = 0xFF453029;
        } else if (ModernUi.ACCENT_MINT.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_MINT;
            primary = 0xFF0D1E14;
            canvas = 0xFF08130D;
            container = 0xFF102418;
            containerHigh = 0xFF183222;
            outline = 0xFF254631;
        } else if (ModernUi.ACCENT_GOLD.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_GOLD;
            primary = 0xFF1C160F;
            canvas = 0xFF120E09;
            container = 0xFF241C13;
            containerHigh = 0xFF302416;
            outline = 0xFF4A3824;
        } else if (ModernUi.ACCENT_AMBER.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_AMBER;
            primary = 0xFF1C140E;
            canvas = 0xFF120E0A;
            container = 0xFF261910;
            containerHigh = 0xFF332114;
            outline = 0xFF4E3422;
        } else if (ModernUi.ACCENT_BLACK.equalsIgnoreCase(id)) {
            accent = ModernUi.COLOR_BLACK;
            primary = 0xFF141618;
            canvas = 0xFF0C0D10;
            container = 0xFF1A1C20;
            containerHigh = 0xFF24262B;
            outline = 0xFF3A3D44;
        }
        if (amoled) {
            canvas = 0xFF000000;
            primary = 0xFF000000;
            container = 0xFF0D1115;
            containerHigh = 0xFF161B22;
            outline = 0xFF26303B;
        }
        int[] roles = new int[COUNT];
        roles[BACKGROUND] = canvas;
        roles[CARDS] = container;
        roles[RAISED] = containerHigh;
        roles[TOOLBAR] = primary;
        roles[DRAWER] = canvas;
        roles[DIVIDERS] = outline;
        roles[TEXT] = 0xFFF1F5F9;
        roles[SECONDARY] = 0xFF94A3B8;
        roles[READ] = scale(0xFF94A3B8, 0.58f);
        roles[ACCENT] = accent;
        roles[LINKS] = accent;
        roles[PINNED] = accent;
        roles[ON_ACCENT] = canvas;
        // Zero leaves Joey's own vote colours in place.
        roles[UPVOTE] = 0;
        roles[DOWNVOTE] = 0;
        return roles;
    }

    /** Material You from the wallpaper. Dark keeps the exact colours Sky always had. */
    private static int[] wallpaper(Context context, boolean light) {
        if (!light) return null;
        try {
            int[] roles = new int[COUNT];
            roles[BACKGROUND] = context.getColor(android.R.color.system_neutral1_10);
            roles[CARDS] = context.getColor(android.R.color.system_neutral1_50);
            roles[RAISED] = context.getColor(android.R.color.system_neutral1_100);
            roles[TOOLBAR] = context.getColor(android.R.color.system_neutral1_50);
            roles[DRAWER] = context.getColor(android.R.color.system_neutral1_10);
            roles[DIVIDERS] = context.getColor(android.R.color.system_neutral2_200);
            roles[TEXT] = context.getColor(android.R.color.system_neutral1_900);
            roles[READ] = context.getColor(android.R.color.system_neutral2_500);
            roles[SECONDARY] = context.getColor(android.R.color.system_neutral2_700);
            roles[ACCENT] = context.getColor(android.R.color.system_accent1_600);
            roles[LINKS] = context.getColor(android.R.color.system_accent1_700);
            roles[PINNED] = context.getColor(android.R.color.system_accent1_600);
            roles[ON_ACCENT] = context.getColor(android.R.color.system_accent1_0);
            roles[UPVOTE] = 0;
            roles[DOWNVOTE] = 0;
            roles[HIDDEN_AVATAR] = mix(roles[SECONDARY], roles[CARDS], 0.45f);
            return roles;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void blackOut(int[] roles) {
        roles[BACKGROUND] = 0xFF000000;
        roles[TOOLBAR] = 0xFF000000;
        roles[DRAWER] = 0xFF000000;
        roles[CARDS] = mix(roles[CARDS], 0xFF000000, 0.5f);
        roles[RAISED] = mix(roles[RAISED], 0xFF000000, 0.4f);
    }

    /** The user's own changes: per-colour links and fixed colours, then the sliders. */
    static int[] finish(Context context, String id, boolean light, int[] base) {
        return finish(context, id, light, base, tweaks(context, id));
    }

    static int[] finish(Context context, String id, boolean light, int[] base, Tweaks tweaks) {
        int[] roles = base.clone();
        tweaks.apply(roles, light);
        JSONObject over = overrides(context, id, light);
        if (over != null) {
            int[] fixed = roles.clone();
            for (int i = 0; i < COUNT; i++) {
                String value = over.optString(KEYS[i], null);
                if (value == null || value.isEmpty()) continue;
                if (value.startsWith("=")) {
                    int other = indexOf(value.substring(1));
                    if (other >= 0 && other != i) roles[i] = fixed[other] != 0 ? fixed[other] : standard(other);
                } else {
                    try {
                        roles[i] = Color.parseColor(value) | 0xFF000000;
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        return roles;
    }

    /** What a role shows when it is left to Joey. Only the vote colours can be. */
    static int standard(int role) {
        if (role == UPVOTE) return JOEY_UPVOTE;
        if (role == DOWNVOTE) return JOEY_DOWNVOTE;
        if (role == HIDDEN_AVATAR) return JOEY_HIDDEN_AVATAR;
        if (role == VIDEO_PLAYED) return JOEY_VIDEO_PLAYED;
        if (role == VIDEO_BUFFERED) return JOEY_VIDEO_BUFFERED;
        if (role == VIDEO_UNPLAYED) return JOEY_VIDEO_UNPLAYED;
        if (role == VIDEO_BUTTONS) return JOEY_VIDEO_BUTTONS;
        if (role == VIDEO_VOLUME) return JOEY_VIDEO_VOLUME;
        return 0;
    }

    static int indexOf(String key) {
        for (int i = 0; i < KEYS.length; i++) if (KEYS[i].equals(key)) return i;
        return -1;
    }

    // ---------------------------------------------------------------------
    // Stored changes
    // ---------------------------------------------------------------------

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE);
    }

    private static String overKey(String id, boolean light) {
        return PREFIX_OVER + id + (light ? ":l" : ":d");
    }

    static JSONObject overrides(Context context, String id, boolean light) {
        String raw = prefs(context).getString(overKey(id, light), null);
        if (raw == null || raw.isEmpty()) return null;
        try {
            return new JSONObject(raw);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** "" clears the role back to the theme. "=links" follows another role. "#RRGGBB" fixes it. */
    static void setOverride(Context context, String id, boolean light, int role, String value) {
        JSONObject over = overrides(context, id, light);
        if (over == null) over = new JSONObject();
        try {
            if (value == null || value.isEmpty()) over.remove(KEYS[role]);
            else over.put(KEYS[role], value);
        } catch (Throwable ignored) {
        }
        SharedPreferences.Editor editor = prefs(context).edit();
        if (over.length() == 0) editor.remove(overKey(id, light));
        else editor.putString(overKey(id, light), over.toString());
        editor.commit();
    }

    static String override(Context context, String id, boolean light, int role) {
        JSONObject over = overrides(context, id, light);
        return over == null ? null : over.optString(KEYS[role], null);
    }

    static boolean hasChanges(Context context, String id) {
        SharedPreferences prefs = prefs(context);
        return prefs.contains(overKey(id, true)) || prefs.contains(overKey(id, false))
                || prefs.contains(PREFIX_TWEAK + id);
    }

    private static final String[] STATE_SUFFIX = {":l", ":d"};

    /** Everything stored for one theme: its colour changes and tuning. Tag and comment colours are not part of a theme. */
    static java.util.Map<String, String> themeState(Context context, String id) {
        SharedPreferences prefs = prefs(context);
        java.util.Map<String, String> out = new java.util.HashMap<>();
        for (String key : stateKeys(id)) {
            String value = prefs.getString(key, null);
            if (value != null) out.put(key, value);
        }
        return out;
    }

    /** Puts a theme back to a state from themeState. An empty or null state is the theme as shipped. */
    static void setThemeState(Context context, String id, java.util.Map<String, String> state) {
        SharedPreferences.Editor editor = prefs(context).edit();
        for (String key : stateKeys(id)) {
            String value = state == null ? null : state.get(key);
            if (value == null) editor.remove(key);
            else editor.putString(key, value);
        }
        editor.commit();
    }

    private static String[] stateKeys(String id) {
        return new String[]{overKey(id, true), overKey(id, false), PREFIX_TWEAK + id};
    }

    /** Every theme setting, so the Theme Manager can undo a whole session. */
    static java.util.Map<String, Object> snapshotAll(Context context) {
        java.util.Map<String, Object> out = new java.util.HashMap<>();
        for (java.util.Map.Entry<String, ?> entry : prefs(context).getAll().entrySet()) {
            if (watches(entry.getKey()) && entry.getValue() != null) out.put(entry.getKey(), entry.getValue());
        }
        return out;
    }

    static void restoreAll(Context context, java.util.Map<String, Object> snapshot) {
        SharedPreferences prefs = prefs(context);
        SharedPreferences.Editor editor = prefs.edit();
        for (String key : prefs.getAll().keySet()) if (watches(key)) editor.remove(key);
        for (java.util.Map.Entry<String, Object> entry : snapshot.entrySet()) {
            Object value = entry.getValue();
            if (value instanceof String) editor.putString(entry.getKey(), (String) value);
            else if (value instanceof Boolean) editor.putBoolean(entry.getKey(), (Boolean) value);
        }
        editor.commit();
    }

    /** For the problem report: what the user changed on this theme, in plain words. */
    static String describeChanges(Context context, String id) {
        List<String> parts = new ArrayList<>();
        for (boolean light : new boolean[]{false, true}) {
            JSONObject over = overrides(context, id, light);
            if (over != null && over.length() > 0) {
                parts.add(over.length() + " " + (light ? "light" : "dark") + " colour override" + (over.length() == 1 ? "" : "s"));
            }
        }
        Tweaks t = tweaks(context, id);
        if (t != null && !t.isDefault()) {
            if (t.vibrancy != 0) parts.add("vibrancy " + (t.vibrancy > 0 ? "+" : "") + t.vibrancy);
            if (t.brightness != 0) parts.add("brightness " + (t.brightness > 0 ? "+" : "") + t.brightness);
            if (t.contrast != 0) parts.add("contrast +" + t.contrast);
            if (t.black) parts.add("pure black");
        }
        SharedPreferences prefs = prefs(context);
        if (prefs.contains(depthKey(id, true)) || prefs.contains(depthKey(id, false))) parts.add("custom comment levels");
        return parts.isEmpty() ? "" : String.join(", ", parts);
    }

    static void clearChanges(Context context, String id) {
        prefs(context).edit()
                .remove(overKey(id, true))
                .remove(overKey(id, false))
                .remove(PREFIX_TWEAK + id)
                .commit();
    }

    /** Standard Reddit colours: Joey's orange and blue votes, in light and dark. */
    static void restoreStandard(Context context, String id) {
        String up = hex(JOEY_UPVOTE);
        String down = hex(JOEY_DOWNVOTE);
        for (boolean light : new boolean[]{true, false}) {
            setOverride(context, id, light, UPVOTE, up);
            setOverride(context, id, light, DOWNVOTE, down);
        }
    }

    static String hex(int color) {
        return String.format("#%06X", color & 0xFFFFFF);
    }

    /** Text cached for the palette key, so a change to any stored value rebuilds the palette. */
    static String stamp(Context context, String id) {
        migrateSplit(context, id);
        SharedPreferences prefs = prefs(context);
        return prefs.getString(overKey(id, true), "") + "|" + prefs.getString(overKey(id, false), "")
                + "|" + prefs.getString(PREFIX_TWEAK + id, "") + "|" + mode(context)
                + "|" + prefs.getString(depthKey(id, true), "") + "|" + prefs.getString(depthKey(id, false), "")
                + "|" + prefs.getString(tagsKey(id, true), "") + "|" + prefs.getString(tagsKey(id, false), "")
                + "|" + prefs.getBoolean(KEY_VIDEO_JOEY, false);
    }

    /** True when the user chose to leave the video controls as Joey draws them. */
    static boolean videoJoey(Context context) {
        return prefs(context).getBoolean(KEY_VIDEO_JOEY, false);
    }

    static void setVideoJoey(Context context, boolean joey) {
        prefs(context).edit().putBoolean(KEY_VIDEO_JOEY, joey).commit();
    }

    /** Puts every video colour on this theme back to what the theme gives (not Joey's white). */
    static void restoreVideo(Context context, String id) {
        for (boolean light : new boolean[]{true, false}) {
            for (int role : GROUP_ROLES[GROUP_ROLES.length - 1]) setOverride(context, id, light, role, "");
        }
    }

    static boolean watches(String key) {
        return key != null && (key.startsWith(PREFIX_OVER) || key.startsWith(PREFIX_TWEAK) || key.startsWith(PREFIX_DEPTH) || key.startsWith(PREFIX_TAGS)
                || KEY_MODE.equals(key) || KEY_MINE.equals(key) || KEY_VIDEO_JOEY.equals(key));
    }

    // ---------------------------------------------------------------------
    // Sliders
    // ---------------------------------------------------------------------

    static final class Tweaks {
        int vibrancy;    // -50 to 50
        int brightness;  // -50 to 50
        int contrast;    // 0 to 50
        boolean black;   // dark only

        boolean isDefault() {
            return vibrancy == 0 && brightness == 0 && contrast == 0 && !black;
        }

        void apply(int[] roles, boolean light) {
            if (vibrancy != 0) {
                float factor = 1f + vibrancy / 100f;
                for (int role : new int[]{ACCENT, LINKS, PINNED, UPVOTE, DOWNVOTE}) {
                    if (roles[role] == 0) continue;
                    float[] hsl = hsl(roles[role]);
                    hsl[1] = clamp(hsl[1] * factor);
                    roles[role] = fromHsl(hsl);
                }
            }
            if (brightness != 0) {
                float shift = brightness / 100f * 0.24f;
                for (int role : new int[]{BACKGROUND, CARDS, RAISED, TOOLBAR, DRAWER, DIVIDERS}) {
                    float[] hsl = hsl(roles[role]);
                    hsl[2] = clamp(hsl[2] + shift);
                    roles[role] = fromHsl(hsl);
                }
            }
            if (contrast > 0) {
                float pull = contrast / 100f;
                int target = light ? 0xFF000000 : 0xFFFFFFFF;
                for (int role : new int[]{TEXT, SECONDARY, READ}) {
                    roles[role] = mix(roles[role], target, pull);
                }
                roles[DIVIDERS] = mix(roles[DIVIDERS], target, pull * 0.5f);
            }
            if (black && !light) blackOut(roles);
        }

        String save() {
            try {
                return new JSONObject().put("v", vibrancy).put("b", brightness)
                        .put("c", contrast).put("k", black).toString();
            } catch (Throwable ignored) {
                return "";
            }
        }
    }

    static Tweaks tweaks(Context context, String id) {
        Tweaks tweaks = new Tweaks();
        String raw = prefs(context).getString(PREFIX_TWEAK + id, null);
        if (raw == null) return tweaks;
        try {
            JSONObject json = new JSONObject(raw);
            tweaks.vibrancy = json.optInt("v", 0);
            tweaks.brightness = json.optInt("b", 0);
            tweaks.contrast = json.optInt("c", 0);
            tweaks.black = json.optBoolean("k", false);
        } catch (Throwable ignored) {
        }
        return tweaks;
    }

    static void saveTweaks(Context context, String id, Tweaks tweaks) {
        SharedPreferences.Editor editor = prefs(context).edit();
        if (tweaks.isDefault()) editor.remove(PREFIX_TWEAK + id);
        else editor.putString(PREFIX_TWEAK + id, tweaks.save());
        editor.commit();
    }

    // ---------------------------------------------------------------------
    // My themes
    // ---------------------------------------------------------------------

    static JSONArray mineList(Context context) {
        try {
            return new JSONArray(prefs(context).getString(KEY_MINE, "[]"));
        } catch (Throwable ignored) {
            return new JSONArray();
        }
    }

    static JSONObject mine(Context context, String id) {
        JSONArray list = mineList(context);
        for (int i = 0; i < list.length(); i++) {
            JSONObject item = list.optJSONObject(i);
            if (item != null && id.equals(item.optString("id"))) return item;
        }
        return null;
    }

    static String mineBase(Context context, String id) {
        JSONObject mine = mine(context, id);
        String base = mine == null ? null : mine.optString("base", null);
        return base == null || isMine(base) ? ModernUi.ACCENT_BLUE : base;
    }

    static List<String> mineIds(Context context) {
        List<String> ids = new ArrayList<>();
        JSONArray list = mineList(context);
        for (int i = 0; i < list.length(); i++) {
            JSONObject item = list.optJSONObject(i);
            if (item != null) ids.add(item.optString("id"));
        }
        return ids;
    }

    /** Saves the theme on screen, with its changes, as a new My theme. Returns its id. */
    static String saveAsMine(Context context, String fromId, String name) {
        JSONArray list = mineList(context);
        int next = 1;
        for (int i = 0; i < list.length(); i++) {
            JSONObject item = list.optJSONObject(i);
            if (item == null) continue;
            try {
                next = Math.max(next, Integer.parseInt(item.optString("id").substring(2)) + 1);
            } catch (Throwable ignored) {
            }
        }
        String id = "u:" + next;
        String base = isMine(fromId) ? mineBase(context, fromId) : fromId;
        try {
            list.put(new JSONObject().put("id", id).put("name", name).put("base", base));
        } catch (Throwable ignored) {
        }
        SharedPreferences prefs = prefs(context);
        SharedPreferences.Editor editor = prefs.edit().putString(KEY_MINE, list.toString());
        for (boolean light : new boolean[]{true, false}) {
            String raw = prefs.getString(overKey(fromId, light), null);
            if (raw != null) editor.putString(overKey(id, light), raw);
        }
        String tweak = prefs.getString(PREFIX_TWEAK + fromId, null);
        if (tweak != null) editor.putString(PREFIX_TWEAK + id, tweak);
        editor.commit();
        return id;
    }

    static void renameMine(Context context, String id, String name) {
        JSONArray list = mineList(context);
        for (int i = 0; i < list.length(); i++) {
            JSONObject item = list.optJSONObject(i);
            if (item != null && id.equals(item.optString("id"))) {
                try {
                    item.put("name", name);
                } catch (Throwable ignored) {
                }
            }
        }
        prefs(context).edit().putString(KEY_MINE, list.toString()).commit();
    }

    private static final String FILE_TYPE = "mighty-morphing-theme";

    /** The theme on screen, with your changes, as the text of a theme file. */
    static String exportFile(Context context, String id) {
        try {
            JSONObject json = new JSONObject();
            json.put("type", FILE_TYPE);
            json.put("version", 1);
            json.put("name", isMine(id) ? name(context, id) : name(context, id) + " (mine)");
            json.put("base", isMine(id) ? mineBase(context, id) : id);
            for (boolean light : new boolean[]{true, false}) {
                JSONObject over = overrides(context, id, light);
                if (over != null && over.length() > 0) json.put(light ? "light" : "dark", over);
            }
            Tweaks t = tweaks(context, id);
            if (t != null && !t.isDefault()) json.put("tuning", new JSONObject(t.save()));
            return json.toString(2);
        } catch (Throwable e) {
            return null;
        }
    }

    private static boolean knownBase(String base) {
        if (base == null || base.isEmpty() || isMine(base)) return false;
        if (preset(base) != null || WALLPAPER.equalsIgnoreCase(base)) return true;
        String[] originals = {ModernUi.ACCENT_BLUE, ModernUi.ACCENT_TEAL, ModernUi.ACCENT_PURPLE, ModernUi.ACCENT_CORAL,
                ModernUi.ACCENT_MINT, ModernUi.ACCENT_GOLD, ModernUi.ACCENT_AMBER, ModernUi.ACCENT_BLACK,
                ModernUi.ACCENT_AMOLED};
        for (String original : originals) if (original.equalsIgnoreCase(base)) return true;
        return false;
    }

    private static boolean knownKey(String key) {
        for (String k : KEYS) if (k.equals(key)) return true;
        return false;
    }

    /** A colour change in a theme file: a hex colour, or "=" and the name of another colour. */
    private static boolean knownValue(Object value) {
        if (!(value instanceof String)) return false;
        String text = (String) value;
        if (text.matches("#[0-9A-Fa-f]{6}")) return true;
        return text.startsWith("=") && knownKey(text.substring(1));
    }

    private static boolean onlyKeys(JSONObject json, String... allowed) {
        java.util.Iterator<String> keys = json.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            boolean ok = false;
            for (String name : allowed) if (name.equals(key)) ok = true;
            if (!ok) return false;
        }
        return true;
    }

    private static JSONObject checkedColours(JSONObject over) {
        if (over == null) return null;
        java.util.Iterator<String> keys = over.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!knownKey(key) || !knownValue(over.opt(key))) return null;
        }
        return over;
    }

    private static boolean wholeNumber(Object value, int low, int high) {
        if (!(value instanceof Integer)) return false;
        int n = (Integer) value;
        return n >= low && n <= high;
    }

    /**
     * Adds a theme from the text of a theme file. Returns the new id. Anything the file holds that
     * this does not know is a reason to refuse the whole file, so a bad file changes nothing.
     */
    static String importFile(Context context, String text) {
        try {
            if (text == null || text.length() > 65536) return null;
            JSONObject json = new JSONObject(text);
            if (!onlyKeys(json, "type", "version", "name", "base", "light", "dark", "tuning")) return null;
            if (!FILE_TYPE.equals(json.opt("type")) || !Integer.valueOf(1).equals(json.opt("version"))) return null;
            Object nameValue = json.opt("name");
            if (!(nameValue instanceof String)) return null;
            String name = ((String) nameValue).trim();
            if (name.isEmpty() || name.length() > 40) return null;
            Object baseValue = json.opt("base");
            if (!(baseValue instanceof String) || !knownBase((String) baseValue)) return null;
            String base = (String) baseValue;

            JSONObject light = null;
            JSONObject dark = null;
            if (json.has("light")) {
                light = checkedColours(json.optJSONObject("light"));
                if (light == null) return null;
            }
            if (json.has("dark")) {
                dark = checkedColours(json.optJSONObject("dark"));
                if (dark == null) return null;
            }
            Tweaks tweaks = null;
            if (json.has("tuning")) {
                JSONObject t = json.optJSONObject("tuning");
                if (t == null || !onlyKeys(t, "v", "b", "c", "k")) return null;
                tweaks = new Tweaks();
                if (t.has("v")) {
                    if (!wholeNumber(t.opt("v"), -50, 50)) return null;
                    tweaks.vibrancy = t.getInt("v");
                }
                if (t.has("b")) {
                    if (!wholeNumber(t.opt("b"), -50, 50)) return null;
                    tweaks.brightness = t.getInt("b");
                }
                if (t.has("c")) {
                    if (!wholeNumber(t.opt("c"), 0, 50)) return null;
                    tweaks.contrast = t.getInt("c");
                }
                if (t.has("k")) {
                    if (!(t.opt("k") instanceof Boolean)) return null;
                    tweaks.black = t.getBoolean("k");
                }
            }

            JSONArray list = mineList(context);
            int next = 1;
            for (int i = 0; i < list.length(); i++) {
                JSONObject item = list.optJSONObject(i);
                if (item == null) continue;
                try {
                    next = Math.max(next, Integer.parseInt(item.optString("id").substring(2)) + 1);
                } catch (Throwable ignored) {
                }
            }
            String id = "u:" + next;
            list.put(new JSONObject().put("id", id).put("name", name).put("base", base));
            SharedPreferences.Editor editor = prefs(context).edit().putString(KEY_MINE, list.toString());
            if (light != null && light.length() > 0) editor.putString(overKey(id, true), light.toString());
            if (dark != null && dark.length() > 0) editor.putString(overKey(id, false), dark.toString());
            if (tweaks != null && !tweaks.isDefault()) editor.putString(PREFIX_TWEAK + id, tweaks.save());
            editor.commit();
            return id;
        } catch (Throwable e) {
            return null;
        }
    }

    static void deleteMine(Context context, String id) {
        JSONArray list = mineList(context);
        JSONArray kept = new JSONArray();
        for (int i = 0; i < list.length(); i++) {
            JSONObject item = list.optJSONObject(i);
            if (item != null && !id.equals(item.optString("id"))) kept.put(item);
        }
        prefs(context).edit().putString(KEY_MINE, kept.toString()).commit();
        clearChanges(context, id);
    }

    // ---------------------------------------------------------------------
    // Joey's colour resources (vote colours)
    // ---------------------------------------------------------------------

    private static volatile int sUpId = -1;
    private static volatile int sDownId = -1;

    private static void ids(Context context) {
        if (sUpId != -1) return;
        Resources res = context.getResources();
        String pkg = context.getPackageName();
        sDownId = res.getIdentifier("downvote", "color", pkg);
        sUpId = res.getIdentifier("upvote", "color", pkg);
    }

    /** The theme's colour for one of Joey's colour resources, or null to keep Joey's. */
    private static Integer resourceOverride(Context context, int id) {
        if (context == null) return null;
        ids(context);
        if (id != sUpId && id != sDownId) return null;
        if (!ModernUi.isModernUiEnabled(context)) return null;
        ModernUi.Palette palette = ModernUi.getPalette(context);
        int color = id == sUpId ? palette.upvote : palette.downvote;
        return color == 0 ? null : color;
    }

    /** zd.x0.b, Joey's getColor(Context, id). */
    public static int contextColor(Context context, int id) {
        Context source = context != null ? context : ModernUi.getContext();
        try {
            Integer override = resourceOverride(source, id);
            if (override != null) return override;
        } catch (Throwable ignored) {
        }
        return source.getColor(id);
    }

    /** zd.e.h, Joey's getColor(id) on the app context. */
    public static int appColor(int id) {
        Context source = ModernUi.getContext();
        try {
            Integer override = resourceOverride(source, id);
            if (override != null) return override;
        } catch (Throwable ignored) {
        }
        return source.getResources().getColor(id);
    }

    /** Resources.getColor calls inside Joey's comment and post text builders. */
    public static int resourcesColor(Resources resources, int id) {
        try {
            Integer override = resourceOverride(ModernUi.getContext(), id);
            if (override != null) return override;
        } catch (Throwable ignored) {
        }
        return resources.getColor(id);
    }

    /** zd.n.c: the colour Joey gives a hidden NSFW profile picture, as "#RRGGBB". */
    public static String hiddenAvatar(String joey) {
        try {
            Context context = ModernUi.getContext();
            if (context == null || !ModernUi.isModernUiEnabled(context)) return joey;
            int color = ModernUi.getPalette(context).roles[HIDDEN_AVATAR];
            return color == 0 ? joey : hex(color);
        } catch (Throwable ignored) {
            return joey;
        }
    }

    // ---------------------------------------------------------------------
    // Comment levels
    // ---------------------------------------------------------------------

    static final String PREFIX_DEPTH = "theme_depth:";
    static final String[] DEPTH_PRESETS = {"joey", "rainbow", "shades", "warm", "cool"};
    static final String[] DEPTH_NAMES = {"Joey classic", "Rainbow", "Accent shades", "Warm", "Cool"};
    /** Joey's own nine, in Joey's order. */
    static final int[] JOEY_DEPTH = {
            0xFF1E88E5, 0xFFFFB300, 0xFF66BB6A, 0xFF9C27B0, 0xFF00BCD4,
            0xFFF44336, 0xFF00796B, 0xFF8D6E63, 0xFFE91E63,
    };

    // ---------------------------------------------------------------------
    // Author tags: OP, Mod, You, Friend and Admin
    // ---------------------------------------------------------------------

    static final String PREFIX_TAGS = "theme_tags:";
    /** Joey's names for the tags, in the order the colours are stored. SPECIAL shares Admin's colour. */
    static final String[] TAG_TYPES = {"OP", "MODERATOR", "YOU", "FRIEND", "ADMIN"};
    static final String[] TAG_NAMES = {"OP", "Mod", "You", "Friend", "Admin"};
    static final String[] TAG_PRESETS = {"accent", "theme"};
    static final String[] TAG_PRESET_NAMES = {"One colour", "Custom"};

    /** One theme's tag colours for light or dark. */
    static final class Tags {
        String preset = "accent";
        /** Per-tag fixed colours, "" for the preset's own. */
        final String[] custom = new String[TAG_TYPES.length];

        boolean hasCustom() {
            for (String value : custom) if (value != null && !value.isEmpty()) return true;
            return false;
        }

        String save() {
            try {
                JSONArray list = new JSONArray();
                for (String value : custom) list.put(value == null ? "" : value);
                return new JSONObject().put("p", preset).put("c", list).toString();
            } catch (Throwable ignored) {
                return "";
            }
        }
    }

    /** Tag and comment colours belong to you, not to a theme, so one key serves every theme. */
    private static String tagsKey(String id, boolean light) {
        return PREFIX_TAGS + "all" + (light ? ":l" : ":d");
    }

    static Tags tags(Context context, String id, boolean light) {
        migrateSplit(context, id);
        Tags tags = new Tags();
        String raw = prefs(context).getString(tagsKey(id, light), null);
        if (raw != null) {
            try {
                JSONObject json = new JSONObject(raw);
                tags.preset = json.optString("p", "accent");
                if ("joey".equals(tags.preset)) tags.preset = "accent";
                JSONArray list = json.optJSONArray("c");
                if (list != null) {
                    for (int i = 0; i < tags.custom.length && i < list.length(); i++) tags.custom[i] = list.optString(i, "");
                }
            } catch (Throwable ignored) {
            }
        }
        return tags;
    }

    static void saveTags(Context context, String id, boolean light, Tags tags) {
        prefs(context).edit().putString(tagsKey(id, light), tags.save()).commit();
    }

    /** What a preset gives for the five tags on this theme. */
    static int[] tagPreset(String preset, int[] roles, boolean light) {
        int[] out = new int[TAG_TYPES.length];
        int accent = roles[ACCENT];
        if ("theme".equals(preset)) {
            out[0] = roles[LINKS] != 0 ? roles[LINKS] : accent;
            out[1] = light ? 0xFF1E8A5A : 0xFF4CC38A;
            out[2] = accent;
            out[3] = light ? 0xFF9A6B00 : 0xFFE9B949;
            out[4] = light ? 0xFFC02D2D : 0xFFF26B6B;
        } else {
            java.util.Arrays.fill(out, accent);
        }
        return out;
    }

    static int[] tagColors(Context context, String id, boolean light, int[] roles) {
        Tags tags = tags(context, id, light);
        int[] out = tagPreset(tags.preset, roles, light);
        for (int i = 0; i < out.length; i++) {
            String value = tags.custom[i];
            if (value == null || value.isEmpty()) continue;
            try {
                out[i] = Color.parseColor(value) | 0xFF000000;
            } catch (Throwable ignored) {
            }
        }
        return out;
    }

    private static final ThreadLocal<String> sTagType = new ThreadLocal<>();

    /** zd.n.y, first thing: which tag Joey is about to draw. */
    public static void tagType(Object type) {
        sTagType.set(type == null ? null : String.valueOf(type));
    }

    /** zd.n.y, where the chip is built: the colour for the tag named above. Joey's colour when unset. */
    public static int tagColor(int joey) {
        try {
            String type = sTagType.get();
            sTagType.set(null);
            Context context = ModernUi.getContext();
            if (type == null || context == null || !ModernUi.isModernUiEnabled(context)) return joey;
            if ("SPECIAL".equals(type)) type = "ADMIN";
            int[] colors = ModernUi.getPalette(context).tags;
            for (int i = 0; i < TAG_TYPES.length; i++) {
                if (TAG_TYPES[i].equals(type) && i < colors.length && colors[i] != 0) return colors[i];
            }
        } catch (Throwable ignored) {
        }
        return joey;
    }

    /** One theme's comment level setup for light or dark. */
    static final class Depth {
        String preset;
        int count;
        boolean hidden;
        /** Per-level fixed colours, "" for the preset's own. */
        final String[] custom = new String[9];

        boolean isJoey() {
            return "joey".equals(preset) && count == 9 && !hasCustom();
        }

        boolean hasCustom() {
            for (String value : custom) if (value != null && !value.isEmpty()) return true;
            return false;
        }

        String save() {
            try {
                JSONObject json = new JSONObject().put("p", preset).put("n", count).put("h", hidden);
                JSONArray list = new JSONArray();
                for (String value : custom) list.put(value == null ? "" : value);
                json.put("c", list);
                return json.toString();
            } catch (Throwable ignored) {
                return "";
            }
        }
    }

    private static String depthKey(String id, boolean light) {
        return PREFIX_DEPTH + "all" + (light ? ":l" : ":d");
    }

    private static final String KEY_SPLIT_DONE = "theme_split_done";

    /**
     * Tag and comment colours used to be saved per theme. They are yours now. The first time this
     * runs, the colours on the theme in use become the shared ones and the old per-theme copies go.
     */
    private static void migrateSplit(Context context, String id) {
        SharedPreferences prefs = prefs(context);
        if (prefs.getBoolean(KEY_SPLIT_DONE, false)) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (boolean light : new boolean[]{true, false}) {
            String suffix = light ? ":l" : ":d";
            for (String prefix : new String[]{PREFIX_TAGS, PREFIX_DEPTH}) {
                String global = prefix + "all" + suffix;
                String own = prefs.getString(prefix + id + suffix, null);
                if (own != null && !prefs.contains(global)) editor.putString(global, own);
            }
        }
        for (String key : prefs.getAll().keySet()) {
            boolean old = (key.startsWith(PREFIX_TAGS) && !key.startsWith(PREFIX_TAGS + "all:"))
                    || (key.startsWith(PREFIX_DEPTH) && !key.startsWith(PREFIX_DEPTH + "all:"));
            if (old) editor.remove(key);
        }
        editor.putBoolean(KEY_SPLIT_DONE, true).commit();
    }

    /** The original themes keep Joey's nine. The new ones and Wallpaper light start from the theme. */
    static Depth depth(Context context, String id, boolean light) {
        migrateSplit(context, id);
        Depth depth = new Depth();
        depth.preset = "joey";
        depth.count = 9;
        String raw = prefs(context).getString(depthKey(id, light), null);
        if (raw != null) {
            try {
                JSONObject json = new JSONObject(raw);
                depth.preset = json.optString("p", depth.preset);
                depth.count = Math.max(2, Math.min(9, json.optInt("n", depth.count)));
                if ("theme".equals(depth.preset)) {
                    // "From the theme" is gone. Joey's own take its place.
                    depth.preset = "joey";
                    depth.count = 9;
                }
                depth.hidden = json.optBoolean("h", false);
                JSONArray list = json.optJSONArray("c");
                if (list != null) {
                    for (int i = 0; i < depth.custom.length && i < list.length(); i++) depth.custom[i] = list.optString(i, "");
                }
            } catch (Throwable ignored) {
            }
        }
        if (!"joey".equals(depth.preset) && depth.count > 8) depth.count = 8;
        return depth;
    }

    static void saveDepth(Context context, String id, boolean light, Depth depth) {
        prefs(context).edit().putString(depthKey(id, light), depth.save()).commit();
    }

    /** The colours a preset gives for [count] levels on this theme. */
    static int[] depthPreset(String preset, int count, int[] roles, boolean light) {
        int[] out = new int[count];
        int accent = roles[ACCENT];
        int cards = roles[CARDS];
        float[] base = hsl(accent);
        float sat = Math.max(0.45f, Math.min(0.85f, base[1]));
        float lig = light ? 0.42f : 0.64f;
        float[] hues;
        switch (preset) {
            case "joey":
                for (int i = 0; i < count; i++) out[i] = JOEY_DEPTH[i % JOEY_DEPTH.length];
                return out;
            case "shades":
                float[] steps = {0f, 0.28f, 0.46f, 0.6f, 0.7f, 0.76f, 0.8f, 0.84f};
                for (int i = 0; i < count; i++) {
                    int shade = mix(accent, cards, steps[Math.min(i, steps.length - 1)]);
                    out[i] = i < 5 ? shade : readable(shade, cards, light);
                }
                return out;
            case "rainbow":
                hues = new float[]{4f, 32f, 52f, 130f, 210f, 270f, 320f, 170f};
                sat = 0.75f;
                break;
            case "warm":
                hues = new float[]{8f, 32f, 50f, 340f, 18f, 44f, 355f, 26f};
                sat = 0.72f;
                break;
            case "cool":
                hues = new float[]{200f, 230f, 265f, 170f, 290f, 185f, 250f, 215f};
                sat = 0.62f;
                break;
            default:
                hues = new float[count];
                for (int i = 0; i < count; i++) hues[i] = (base[0] + 360f * i / count) % 360f;
                break;
        }
        for (int i = 0; i < count; i++) out[i] = readable(fromHsl(new float[]{hues[i % hues.length], sat, lig}), cards, light);
        return out;
    }

    /** Nudges a colour lighter or darker until it shows as a bar on the cards (3:1). */
    private static int readable(int color, int cards, boolean light) {
        float[] hsl = hsl(color);
        for (int i = 0; i < 12 && contrast(fromHsl(hsl), cards) < 3.0; i++) {
            hsl[2] = clamp(hsl[2] + (light ? -0.04f : 0.04f));
        }
        return fromHsl(hsl);
    }

    /** The colours actually used, with any level the user fixed. Empty keeps Joey's own. */
    static int[] depthColors(Context context, String id, boolean light, int[] roles) {
        Depth depth = depth(context, id, light);
        if (depth.isJoey()) return new int[0];
        int[] out = depthPreset(depth.preset, depth.count, roles, light);
        for (int i = 0; i < out.length; i++) {
            String value = depth.custom[i];
            if (value == null || value.isEmpty()) continue;
            try {
                out[i] = Color.parseColor(value) | 0xFF000000;
            } catch (Throwable ignored) {
            }
        }
        return out;
    }

    /** n9.j.d: the bar colour for a comment at [level]. Zero keeps Joey's. */
    public static int depthColor(Context context, int level) {
        try {
            if (level < 2) return 0;
            Context source = context != null ? context : ModernUi.getContext();
            if (source == null || !ModernUi.isModernUiEnabled(source)) return 0;
            int[] colors = ModernUi.getPalette(source).depth;
            if (colors.length == 0) return 0;
            return colors[(level - 2) % colors.length];
        } catch (Throwable ignored) {
            return 0;
        }
    }

    /** The comment and "more replies" bars. Hidden bars keep their space so replies stay indented. */
    public static void depthBar(android.view.View bar, int color) {
        boolean hide = false;
        try {
            Context context = bar.getContext();
            hide = ModernUi.isModernUiEnabled(context) && ModernUi.getPalette(context).hideDepth;
        } catch (Throwable ignored) {
        }
        bar.setBackgroundColor(hide ? 0 : color);
    }

    // ---------------------------------------------------------------------
    // Colour maths
    // ---------------------------------------------------------------------

    static int mix(int from, int to, float amount) {
        float keep = 1f - amount;
        return Color.rgb(
                Math.round(Color.red(from) * keep + Color.red(to) * amount),
                Math.round(Color.green(from) * keep + Color.green(to) * amount),
                Math.round(Color.blue(from) * keep + Color.blue(to) * amount));
    }

    static int scale(int color, float scale) {
        return Color.argb(Color.alpha(color),
                Math.round(Color.red(color) * scale),
                Math.round(Color.green(color) * scale),
                Math.round(Color.blue(color) * scale));
    }

    static float clamp(float value) {
        return Math.max(0f, Math.min(1f, value));
    }

    static float[] hsl(int color) {
        float r = Color.red(color) / 255f;
        float g = Color.green(color) / 255f;
        float b = Color.blue(color) / 255f;
        float max = Math.max(r, Math.max(g, b));
        float min = Math.min(r, Math.min(g, b));
        float l = (max + min) / 2f;
        float h = 0f;
        float s = 0f;
        if (max != min) {
            float d = max - min;
            s = l > 0.5f ? d / (2f - max - min) : d / (max + min);
            if (max == r) h = (g - b) / d + (g < b ? 6f : 0f);
            else if (max == g) h = (b - r) / d + 2f;
            else h = (r - g) / d + 4f;
            h *= 60f;
        }
        return new float[]{h, s, l};
    }

    static int fromHsl(float[] hsl) {
        float h = hsl[0] / 360f;
        float s = hsl[1];
        float l = hsl[2];
        if (s == 0f) {
            int v = Math.round(l * 255f);
            return Color.rgb(v, v, v);
        }
        float q = l < 0.5f ? l * (1f + s) : l + s - l * s;
        float p = 2f * l - q;
        return Color.rgb(
                Math.round(hue(p, q, h + 1f / 3f) * 255f),
                Math.round(hue(p, q, h) * 255f),
                Math.round(hue(p, q, h - 1f / 3f) * 255f));
    }

    private static float hue(float p, float q, float t) {
        if (t < 0f) t += 1f;
        if (t > 1f) t -= 1f;
        if (t < 1f / 6f) return p + (q - p) * 6f * t;
        if (t < 1f / 2f) return q;
        if (t < 2f / 3f) return p + (q - p) * (2f / 3f - t) * 6f;
        return p;
    }

    static double luminance(int color) {
        double[] c = {Color.red(color) / 255.0, Color.green(color) / 255.0, Color.blue(color) / 255.0};
        for (int i = 0; i < 3; i++) c[i] = c[i] <= 0.03928 ? c[i] / 12.92 : Math.pow((c[i] + 0.055) / 1.055, 2.4);
        return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2];
    }

    static double contrast(int a, int b) {
        double la = luminance(a);
        double lb = luminance(b);
        return (Math.max(la, lb) + 0.05) / (Math.min(la, lb) + 0.05);
    }

    static boolean isLight(int color) {
        return luminance(color) > 0.4;
    }
}
