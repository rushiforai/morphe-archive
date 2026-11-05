package app.template.extension.fotmob;

import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.OptionIcons;

/**
 * The pictures in the "Hidden competitions" picker (never saved, never used for filtering): the
 * competition's logo from FotMob's image server (CompetitionFilter.IMAGE_URL, checked 200
 * image/png for 47, 42, 9227, 10082 and 9173 on 2026-11-03), with the flag of its country
 * (CountryData's league country, CountryIcons) as the instant and offline fallback, or a trophy
 * while the country is not known.
 */
final class CompetitionIcons implements HevalSettings.OptionImageProvider {
    static final CompetitionIcons INSTANCE = new CompetitionIcons();

    @Override
    public String iconFor(String key) {
        return icon(CountryData.code(CountryFilter.context(), CountryData.parseInt(key)));
    }

    @Override
    public String imageUrlFor(String key) {
        return CompetitionFilter.imageUrl(key);
    }

    /** The flag of a league country code (INT a globe, INT-2 a trophy), else the trophy. */
    static String icon(String code) {
        String flag = code == null || code.isEmpty() ? null : CountryIcons.icon(code);
        return flag != null ? flag : OptionIcons.TROPHY;
    }

    private CompetitionIcons() {
    }
}
