package dev.jason.gboardpatches.extension.spacebarlogo;

public final class GboardSpacebarLogoContract {
    public static final String ICON_GOOGLE_G = "GOOGLE_G";
    public static final String ICON_HEART = "HEART";
    public static final String ICON_EMOJI = "EMOJI";
    public static final String DEFAULT_ICON = ICON_GOOGLE_G;

    private GboardSpacebarLogoContract() {
    }

    public static String normalizeIcon(String icon) {
        String normalized = icon == null ? "" : icon.trim();
        if (ICON_HEART.equalsIgnoreCase(normalized)) {
            return ICON_HEART;
        }
        if (ICON_EMOJI.equalsIgnoreCase(normalized)) {
            return ICON_EMOJI;
        }
        return ICON_GOOGLE_G;
    }
}
