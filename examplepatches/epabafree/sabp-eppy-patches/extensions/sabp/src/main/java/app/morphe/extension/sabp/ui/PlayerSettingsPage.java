package app.morphe.extension.sabp.ui;

import android.view.View;
import android.widget.LinearLayout;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.SabpPrefs;

/**
 * SABP's main player settings, drawn in eppy's design. Every row reads and writes SABP's own key
 * (SabpPrefs), so the classic settings screens show the same values and SABP's engine picks a
 * change up the next time it reads it, with no restart. Anything not listed here is one tap away
 * in SABP's own screens, clearly labelled.
 */
public final class PlayerSettingsPage extends Page {
    /** Strong references: SharedPreferences only keeps listeners weakly. */
    static final class SabpPrefsWatch {
        private static final java.util.HashSet<Object> held = new java.util.HashSet<>();

        static void watch(android.content.Context c, android.content.SharedPreferences.OnSharedPreferenceChangeListener l) {
            held.add(l);
            SabpPrefs.prefs(c).registerOnSharedPreferenceChangeListener(l);
        }

        static void unwatch(android.content.Context c, android.content.SharedPreferences.OnSharedPreferenceChangeListener l) {
            held.remove(l);
            SabpPrefs.prefs(c).unregisterOnSharedPreferenceChangeListener(l);
        }
    }

    public static final String KEY = "playerSettings";

    public PlayerSettingsPage(Host host) {
        super(host, KEY, null, "Player settings", true);
        build();
        SabpPrefsWatch.watch(c, prefsListener);
    }

    // Changes made elsewhere (SABP's screens, another eppy view) show up immediately.
    private final android.content.SharedPreferences.OnSharedPreferenceChangeListener prefsListener = (sp, key) -> root.post(this::build);

    @Override
    public void onRemoved() {
        SabpPrefsWatch.unwatch(c, prefsListener);
    }

    private void build() {
        body.removeAllViews();
        note(body, "These are Smart AudioBook Player's own settings. Changes apply to both eppy and the classic player.");

        sectionTitle(SabpPrefs.str(c, "playback", "Playback"));
        LinearLayout p = card();
        p.addView(choiceRow(SabpPrefs.autoRewind(c)));
        p.addView(stepsRow("Rewind and forward (short)", SabpPrefs.SMALL_STEPS, SabpPrefs.smallIndex(c), true));
        p.addView(stepsRow("Rewind and forward (long)", SabpPrefs.BIG_STEPS, SabpPrefs.bigIndex(c), false));
        for (SabpPrefs.Toggle tg : SabpPrefs.playbackToggles(c)) p.addView(toggleRow(tg));

        sectionTitle(SabpPrefs.str(c, "sleep", "Sleep timer"));
        LinearLayout s = card();
        s.addView(choiceRow(SabpPrefs.sleepTime(c)));
        s.addView(choiceRow(SabpPrefs.shakeToExtend(c)));
        s.addView(choiceRow(SabpPrefs.shakeForce(c)));
        s.addView(toggleRow(SabpPrefs.sleepOffInAndroidAuto(c)));

        sectionTitle("Notification and statistics");
        LinearLayout n = card();
        n.addView(toggleRow(SabpPrefs.coverOnLockScreen(c)));
        n.addView(toggleRow(SabpPrefs.statisticsEnabled(c)));

        sectionTitle("More");
        LinearLayout m = card();
        m.addView(linkRow(EppyIcon.OPEN_IN_NEW, "All Smart AudioBook Player settings",
                "Opens SABP's own settings screens: headset buttons, decoder, notification, schedule, troubleshooting",
                v -> host.openSabp(EppyBridge.SETTINGS_ACTIVITY)));
    }

    private View toggleRow(SabpPrefs.Toggle tg) {
        return switchRow(tg.title, tg.summary, tg.get(c), (b, on) -> tg.set(c, on));
    }

    private View choiceRow(SabpPrefs.Choice ch) {
        return linkRow(0, ch.title, ch.label(c), v -> {
            Sheet sh = new Sheet(host.overlayRoot(), t, ch.title);
            int cur = ch.index(c);
            for (int i = 0; i < ch.values.length; i++) {
                final String value = ch.values[i];
                sh.item(i == cur ? EppyIcon.CHECK : 0, ch.labels[i], null, () -> {
                    ch.set(c, value);
                    build();
                });
            }
            sh.show();
        });
    }

    private View stepsRow(String title, int[] steps, int current, boolean small) {
        return linkRow(0, title, steps[current] + " seconds", v -> {
            Sheet sh = new Sheet(host.overlayRoot(), t, title);
            for (int i = 0; i < steps.length; i++) {
                final int idx = i;
                String label = steps[i] >= 60 && steps[i] % 60 == 0 ? (steps[i] / 60) + " min" : steps[i] + " s";
                sh.item(i == current ? EppyIcon.CHECK : 0, label, null, () -> {
                    if (small) SabpPrefs.setSmallIndex(c, idx);
                    else SabpPrefs.setBigIndex(c, idx);
                    build();
                });
            }
            sh.show();
        });
    }
}
