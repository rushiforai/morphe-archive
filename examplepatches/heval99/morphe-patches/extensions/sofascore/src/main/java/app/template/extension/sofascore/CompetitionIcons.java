package app.template.extension.sofascore;

import app.template.extension.hevalcontrols.HevalSettings;
import app.template.extension.hevalcontrols.OptionIcons;

/**
 * The pictures in the "Hidden competitions" picker (never saved, never used for filtering): the
 * competition's logo from Sofascore's image server (CompetitionFilter.IMAGE_URL, checked 200 for
 * the Premier League on 2026-11-03), with the flag of its country (CountryIcons) as the instant and
 * offline fallback, or a trophy while the country is not known yet in this process.
 */
final class CompetitionIcons implements HevalSettings.OptionImageProvider {
    static final CompetitionIcons INSTANCE = new CompetitionIcons();

    @Override
    public String iconFor(String key) {
        return icon(CompetitionFilter.countryKey(key));
    }

    @Override
    public String imageUrlFor(String key) {
        return CompetitionFilter.imageUrl(key);
    }

    /** The flag of a category key (CountryFilter.key), else the trophy. */
    static String icon(String countryKey) {
        String flag = countryKey == null || countryKey.isEmpty() ? null : CountryIcons.icon(countryKey);
        return flag != null ? flag : OptionIcons.TROPHY;
    }

    private CompetitionIcons() {
    }
}
