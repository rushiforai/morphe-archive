package app.template.extension.pdb;

import android.app.Activity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import app.template.extension.BuildConfig;

/**
 * The simplified "Pdb Extras" screen (0.5.4 redesign), opened from the single
 * "Pdb Extras" row at the top of Pdb's Settings screen — or from the floating
 * power button. Intentionally small: six everyday switches on one page, no
 * tabs, no diagnostics, no data tools, no dev-screen launcher. The heavy tools
 * were removed for everyday usability; the underlying bytecode patches (ads,
 * telemetry, pro unlock, visitor limit) are always-on and need no switches.
 */
public final class PdbExtrasActivity extends Activity {

    private LinearLayout content;

    /** The everyday switches: label → morphe key. */
    private static final String[][] SWITCH_ROWS = {
        {"Show profile IDs next to names", PdbSettings.IDS_EVERYWHERE},
        {"Disable read receipts", PdbSettings.PRIVACY_RECEIPTS},
        {"Ignore \u201csee more\u201d walls", PdbSettings.PRIVACY_SEE_MORE},
        {"Stay signed in", PdbSettings.REMEMBER_AUTH},
        {"Show floating power button", PdbSettings.BUBBLE},
        {"Pause all Morphe extras", PdbSettings.GLOBAL_PAUSE},
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            PdbMmkv.init(this);
            setContentView(buildScreen());
        } catch (Throwable t) {
            PdbTools.toast(this, "Morphe Extras: " + t);
            finish();
        }
    }

    private View buildScreen() {
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        int pad = PdbUi.dp(this, 16);
        page.setPadding(pad, PdbUi.dp(this, 12), pad, 0);

        TextView title = PdbUi.text(this,
            "Pdb Extras v" + BuildConfig.EXTRAS_VERSION, 22, "gray_01", 0xFF1C1C1E);
        title.setPadding(0, 0, 0, PdbUi.dp(this, 2));
        page.addView(title);

        TextView status = PdbUi.text(this, PdbTools.summary(this),
            12, "gray_03", 0xFF8E8E93);
        status.setPadding(0, 0, 0, PdbUi.dp(this, 8));
        page.addView(status);

        content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, PdbUi.dp(this, 4), 0, PdbUi.dp(this, 24));

        section("Everyday switches");
        LinearLayout card = newCard();
        note(card, "Profile IDs asks to restart the app after toggling \u2014 "
            + "names redecorate when lists rebuild. The power button puts the "
            + "most-used actions one tap away on any screen.");
        for (String[] row : SWITCH_ROWS) {
            card.addView(switchRow(row[0], row[1]));
        }

        section("Power");
        LinearLayout power = newCard();
        power.addView(row("Soul history \u2014 who you saw & liked", v -> {
            try {
                android.content.Intent i = new android.content.Intent();
                i.setClassName(this, "app.template.extension.pdb.SoulHistoryActivity");
                startActivity(i);
            } catch (Throwable t) {
                PdbTools.toast(this, "Soul history: " + t);
            }
        }));

        section("Always on in this build");
        LinearLayout facts = newCard();
        note(facts, "Ad-free \u00b7 telemetry off (AppsFlyer, CleverTap, Facebook, "
            + "Firebase Analytics/Perf) \u00b7 mock pro flags (client-side; "
            + "server-gated premium stays server-gated) \u00b7 no profile-visitor "
            + "limit \u00b7 profile IDs with badges \u00b7 local Soul history. "
            + "These are part of the patch and have no switch.");

        LinearLayout close = newCard();
        close.addView(row("Close", v -> finish()));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(content);
        page.addView(scroll, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        content = null;
        return page;
    }

    /* ── shared widgets ── */

    private void section(String label) {
        if (content != null) content.addView(PdbUi.sectionLabel(this, label));
    }

    private LinearLayout newCard() {
        LinearLayout card = PdbUi.themedCard(this);
        if (content != null) content.addView(card, PdbUi.cardParams(this));
        return card;
    }

    private void note(LinearLayout card, String text) {
        if (card != null) {
            TextView t = PdbUi.text(this, text, 11, null, PdbUi.subText(this));
            int pad = PdbUi.dp(this, 14);
            t.setPadding(pad, PdbUi.dp(this, 6), pad, PdbUi.dp(this, 2));
            card.addView(t);
        }
    }

    private View row(String label, View.OnClickListener onClick) {
        return PdbUi.actionCell(this, label, onClick);
    }

    private View switchRow(String label, final String key) {
        Switch sw = new Switch(this);
        sw.setText(label);
        sw.setTextSize(15);
        sw.setAllCaps(false);
        sw.setTextColor(PdbUi.mainText(this));
        sw.setChecked(PdbSettings.getBool(PdbTools.prefs(this), key,
            PdbSettings.defaultBool(key)));
        int padV = PdbUi.dp(this, 10);
        sw.setPadding(PdbUi.dp(this, 14), padV, PdbUi.dp(this, 14), padV);
        sw.setOnCheckedChangeListener((buttonView, isChecked) -> {
            PdbTools.prefs(this).edit().putBoolean(key, isChecked).apply();
            if (PdbSettings.GLOBAL_PAUSE.equals(key)) {
                PdbTools.toast(this, isChecked
                    ? "Morphe paused \u2014 takes effect after restarting the app"
                    : "Morphe resumed \u2014 takes effect after restarting the app");
            } else {
                PdbTools.toast(this, (isChecked ? "On" : "Off")
                    + " \u2014 " + switchNote(key));
            }
            if (PdbSettings.IDS_EVERYWHERE.equals(key)) {
                PdbUi.IDS_EVERYWHERE = isChecked; // stays hot for new binds
                PdbTools.restartDialog(this);     // full decoration rebind on restart
            }
        });
        return sw;
    }

    private String switchNote(String key) {
        if (PdbSettings.BUBBLE.equals(key)) return "reopen Pdb to move the button";
        if (PdbSettings.PRIVACY_RECEIPTS.equals(key)) return "applies next launch";
        if (PdbSettings.PRIVACY_SEE_MORE.equals(key)) return "applies next launch";
        if (PdbSettings.REMEMBER_AUTH.equals(key)) return "applies next launch";
        return "applies to new content";
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        content = null;
    }
}
