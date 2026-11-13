/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.os.LocaleList;
import android.preference.ListPreference;
import android.view.View;
import android.widget.Button;

import java.text.Collator;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Locale;

import app.morphe.extension.hushthreads.misc.SimRegions;
import app.morphe.extension.shared.L10n;

/**
 * The Privacy section's one row that isn't a plain switch: the country Spoof SIM region makes
 * Threads' SIM read as, picked from a list by its name in the language the page is drawn in.
 *
 * <p>It keeps the screen's colours, its dialog's buttons and its row's role the way the Downloads
 * quality list does, so the page reads and speaks the same throughout.
 */
final class SimRegionRows {
    private SimRegionRows() {
    }

    /** The region's row, keyed by the setting that holds it. Its summary is the chosen country's name. */
    static ListPreference regionRow(Context context) {
        RegionRow row = new RegionRow(context);
        row.setKey(SimRegions.REGION.key);
        row.setIcon(SettingsIcons.icon(context, SettingsIcons.SIM_CARD, ScreenColors.DEFAULT.heading));
        row.setTitle(L10n.t("SIM region"));
        row.setDialogTitle(L10n.t("SIM region"));
        // A list's dialog keeps DialogPreference's Cancel, which Android fills in the activity's
        // language unless it's set here, as the quality list's is.
        row.setNegativeButtonText(L10n.t("Cancel"));
        Locale language = language(context);
        SimRegions.Region[] regions = byName(language);
        CharSequence[] entries = new CharSequence[regions.length];
        CharSequence[] values = new CharSequence[regions.length];
        for (int i = 0; i < regions.length; i++) {
            // Android's name for the country, not one of the catalog's rows, so it's set apart
            // the way a version or a folder is.
            entries[i] = L10n.isolate(regions[i].displayName(language));
            values[i] = regions[i].iso;
        }
        row.setEntries(entries);
        row.setEntryValues(values);
        row.setValue(SimRegions.REGION.savedValue());
        return row;
    }

    /**
     * The language the page is drawn in: the application's first, the one the catalog reads.
     * Threads can set its own language on the application, and the phone's default would leave
     * the country names in another language than the rows around them.
     */
    static Locale language(Context context) {
        try {
            Context application = context.getApplicationContext();
            Context source = application != null ? application : context;
            LocaleList list = source.getResources().getConfiguration().getLocales();
            if (!list.isEmpty()) return list.get(0);
        } catch (RuntimeException ignored) {
            // A context with no resources: the default locale still answers.
        }
        return Locale.getDefault();
    }

    /** The regions in the order their names sort in [language]. */
    static SimRegions.Region[] byName(Locale language) {
        SimRegions.Region[] regions = SimRegions.REGIONS.clone();
        Collator collator = Collator.getInstance(language);
        Arrays.sort(regions, Comparator.comparing(region -> region.displayName(language), collator));
        return regions;
    }

    static final class RegionRow extends ListPreference {
        RegionRow(Context context) {
            super(context);
        }

        /** Its summary follows its value, whoever sets it: the person, the shared page or an import. */
        @Override
        public void setValue(String value) {
            super.setValue(value);
            CharSequence country = getEntry();
            setSummary(country != null ? country : value);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            HushThreadsPreferenceFragment.showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new HushThreadsPreferenceFragment.RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }
}
