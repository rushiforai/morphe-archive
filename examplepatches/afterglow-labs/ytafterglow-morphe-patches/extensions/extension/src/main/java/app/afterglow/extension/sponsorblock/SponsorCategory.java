package app.afterglow.extension.sponsorblock;

/** Category identifiers, defaults and marker colors from the iOS SponsorBlock implementation. */
public enum SponsorCategory {
    SPONSOR("sponsor", "Sponsor", "Sponsor", 0xFF00D26A, true),
    INTERACTION("interaction", "Interaction", "Interaction reminder", 0xFFD84CFF, true),
    SELF_PROMO("selfpromo", "SelfPromo", "Self-promotion", 0xFFFFD23F, false),
    INTRO("intro", "Intro", "Intro", 0xFF27C2FF, false),
    OUTRO("outro", "Outro", "Outro", 0xFF5B6CFF, false),
    PREVIEW("preview", "Preview", "Preview", 0xFFFF8A3D, false),
    HOOK("hook", "Hook", "Hook", 0xFFFF4D8D, false),
    FILLER("filler", "Filler", "Filler", 0xFF8E5CFF, false),
    MUSIC_OFFTOPIC("music_offtopic", "MusicOfftopic", "Non-music section", 0xFF00B8A9, false);

    public final String id, skipKey, markerKey, displayName;
    public final int color;
    public final boolean skipByDefault;

    SponsorCategory(String id, String keySuffix, String displayName, int color, boolean skipByDefault) {
        this.id = id;
        this.skipKey = "sponsorBlockCategory" + keySuffix;
        this.markerKey = "sponsorBlockMarker" + keySuffix;
        this.displayName = displayName;
        this.color = color;
        this.skipByDefault = skipByDefault;
    }

    public static SponsorCategory fromId(Object id) {
        for (SponsorCategory category : values()) if (category.id.equals(id)) return category;
        return null;
    }
}
