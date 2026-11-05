package app.template.extension.sofascore;

import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.OptionIcons;

/**
 * The flags in the "Hidden countries" picker (icons only: they are never saved and never decide
 * what is hidden). A key is a Sofascore alpha2 code or {@code "slug:" + slug} (see CountryFilter).
 *
 * <p>Sofascore's country list (26.10.19, 234 codes) uses ISO 3166-1 alpha-2 except for EN England,
 * SX Scotland (ISO SX is Sint Maarten), WA Wales, NX Northern Ireland, TU Tuvalu (ISO TV) and SW
 * Sint Maarten (ISO SX); XK Kosovo is the common user-assigned code. Any other two-letter A-Z key
 * gets its regional-indicator flag; anything else gets none.
 *
 * <p>Images (2026-11-03): every alpha2 key also names Sofascore's own flag image,
 * {@value #FLAG_URL} with the code in place of {@code %s} (the same picture the app shows; checked
 * 200 image/png for EN, ES, SX, NX and XK), which the picker swaps in for the emoji once loaded.
 * Slug keys have no image.
 */
final class CountryIcons implements HevalSettings.OptionImageProvider {
    static final CountryIcons INSTANCE = new CountryIcons();

    private static final String SLUG_PREFIX = "slug:";
    static final String FLAG_URL = "https://img.sofascore.com/api/v1/country/%s/flag";

    @Override
    public String iconFor(String key) {
        return icon(key);
    }

    @Override
    public String imageUrlFor(String key) {
        return imageUrl(key);
    }

    /** Sofascore's flag image of an alpha2 key (exactly two letters A-Z, any case), else null. */
    static String imageUrl(String key) {
        if (key == null || key.length() != 2) return null;
        String code = key.toUpperCase(java.util.Locale.ROOT);
        for (int i = 0; i < 2; i++) {
            char c = code.charAt(i);
            if (c < 'A' || c > 'Z') return null;
        }
        return FLAG_URL.replace("%s", code);
    }

    static String icon(String key) {
        if (key == null) return null;
        if (key.startsWith(SLUG_PREFIX)) return slugIcon(key.substring(SLUG_PREFIX.length()));
        switch (key) {
            case "EN":
                return OptionIcons.ENGLAND;
            case "SX":
                return OptionIcons.SCOTLAND;
            case "WA":
                return OptionIcons.WALES;
            case "NX":
                return OptionIcons.countryFlag("GB");
            case "TU":
                return OptionIcons.countryFlag("TV");
            case "SW":
                return OptionIcons.countryFlag("SX");
            default:
                return OptionIcons.countryFlag(key);
        }
    }

    /**
     * World, continents and International by the slug's first word ("europe-amateur" is Europe),
     * any slug with an "america" word is the Americas; other amateur, youth and women groups get the
     * globe; everything else (tennis tours, motorsport series, ...) has no icon.
     */
    static String slugIcon(String slug) {
        String[] words = slug.toLowerCase(java.util.Locale.ROOT).split("-");
        switch (words[0]) {
            case "world":
            case "africa":
                return OptionIcons.GLOBE_EUROPE_AFRICA;
            case "europe":
                return OptionIcons.countryFlag("EU");
            case "international":
                return OptionIcons.GLOBE;
            case "asia":
            case "oceania":
                return OptionIcons.GLOBE_ASIA_AUSTRALIA;
            default:
                break;
        }
        boolean group = false;
        for (String word : words) {
            if (word.equals("america")) return OptionIcons.GLOBE_AMERICAS;
            if (word.equals("amateur") || word.equals("youth") || word.equals("women")) group = true;
        }
        return group ? OptionIcons.GLOBE : null;
    }

    private CountryIcons() {
    }
}
