package app.afterglow.extension.settings;

/** Stable semantic names and preference keys from iOS Utils/YTAGTheme.m. */
public enum ThemeRole {
    BACKGROUND("background", "theme_background"),
    ELEVATED_SURFACE("elevatedSurface", null),
    NAVIGATION_SURFACE("navigationSurface", "theme_navBar"),
    PRIMARY_TEXT("primaryText", "theme_textPrimary"),
    SECONDARY_TEXT("secondaryText", "theme_textSecondary"),
    ACCENT("accent", "theme_accent"),
    BORDER("border", null),
    TAB_ICON("tabIcon", "theme_tabBarIcons"),
    OVERLAY_CONTROL("overlayControl", "theme_overlayButtons"),
    OVERLAY_BACKDROP("overlayBackdrop", null),
    SEEK_PLAYED("seekPlayed", "theme_seekBar"),
    SEEK_BUFFERED("seekBuffered", null),
    SEEK_LIVE("seekLive", "theme_seekBarLive"),
    GRADIENT_START("gradientStart", "theme_gradientStart"),
    GRADIENT_END("gradientEnd", "theme_gradientEnd"),
    GLOW("glow", "theme_glowColor"),
    FOCUS("focus", null),
    SHADOW("shadow", null),
    SEEK_SCRUBBER("seekScrubber", "theme_seekBarScrubber"),
    SEEK_SCRUBBER_LIVE("seekScrubberLive", "theme_seekBarScrubberLive");

    public final String semanticName;
    public final String legacyKey;

    ThemeRole(String semanticName, String legacyKey) {
        this.semanticName = semanticName;
        this.legacyKey = legacyKey;
    }

    private static final java.util.Map<String, ThemeRole> BY_KEY = new java.util.HashMap<>();
    static {
        for (ThemeRole role : values()) if (role.legacyKey != null) BY_KEY.put(role.legacyKey, role);
    }

    public static ThemeRole forLegacyKey(String key) {
        return BY_KEY.get(key);
    }
}
