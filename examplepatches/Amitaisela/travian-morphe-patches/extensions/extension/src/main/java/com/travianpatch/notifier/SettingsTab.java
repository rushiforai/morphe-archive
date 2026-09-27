package com.travianpatch.notifier;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The Settings tab: the automation switches (master, practice mode, attack pause) and the timing used by
 * auto-build (resource buffer, random delay, daily quiet hours as clock times). Gold/Plus status and the
 * app's notification permission are shown at the bottom.
 */
final class SettingsTab implements HubActivity.Tab {

    private final HubActivity a;
    private EditText pause, buffer, delayMin, delayMax, quietFrom, quietTo, quietMinH, quietMaxH, escLead, escMin;

    SettingsTab(HubActivity a) {
        this.a = a;
    }

    @Override
    public View build() {
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        final SharedPreferences p = a.getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
        ActionClient.Settings s = ActionSender.settings(a);

        col.addView(UiKit.section(a, "Automation"));
        LinearLayout card = UiKit.card(a);
        Switch master = UiKit.accentSwitch(a, "Automatic actions", s.masterOn);
        master.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(ActionSender.KEY_MASTER, on).apply();
            }
        });
        card.addView(master, full());
        card.addView(UiKit.muted(a, "Off stops every queue at once (a kill switch). ▶ buttons still work."));
        card.addView(UiKit.divider(a), gap());
        Switch dry = UiKit.accentSwitch(a, "Practice mode", s.dryRun);
        dry.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(ActionSender.KEY_DRY_RUN, on).apply();
            }
        });
        card.addView(dry, full());
        card.addView(UiKit.muted(a, "On: nothing reaches the game; Activity shows what would have been sent."));
        card.addView(UiKit.divider(a), gap());
        Switch pauseOn = UiKit.accentSwitch(a, "Pause when an attack is coming", s.attackPauseOn);
        card.addView(pauseOn, full());
        pause = number(String.valueOf(s.attackPauseMinutes));
        final View pauseLine = line("Pause automation when an attack lands within", pause, "min");
        pause.setEnabled(s.attackPauseOn);
        pauseLine.setAlpha(s.attackPauseOn ? 1f : 0.4f);
        pauseOn.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(ActionSender.KEY_PAUSE_ON, on).apply();
                pause.setEnabled(on);
                pauseLine.setAlpha(on ? 1f : 0.4f);
            }
        });
        card.addView(pauseLine);
        card.addView(UiKit.muted(a, "Off: attacks never stop auto-build. The minutes are saved with Save below."));
        col.addView(card, UiKit.cardParams(a));

        col.addView(UiKit.section(a, "Celebrations"));
        LinearLayout cel = UiKit.card(a);
        Switch celOn = UiKit.accentSwitch(a, "Start celebrations automatically",
                p.getBoolean(CelebrationPlanner.KEY_ON, false));
        celOn.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(CelebrationPlanner.KEY_ON, on).apply();
            }
        });
        cel.addView(celOn, full());
        Switch celGreat = UiKit.accentSwitch(a, "Great celebration instead of small",
                p.getBoolean(CelebrationPlanner.KEY_GREAT, false));
        celGreat.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(CelebrationPlanner.KEY_GREAT, on).apply();
            }
        });
        cel.addView(celGreat, full());
        cel.addView(UiKit.muted(a, "Starts one when the game says it can, nothing is running, and resources cover "
                + "it plus the auto-build buffer below. A build queue waiting for resources goes first. Needs "
                + "Automatic actions on."));
        java.util.List<VillageList.Entry> villages = VillageList.fromJson(a.getSharedPreferences(
                NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE).getString(NotifierWorker.KEY_VILLAGES, null));
        for (VillageList.Entry v : villages) {
            String note = p.getString(CelebrationPlanner.notesKey(v.id), null);
            if (note != null) {
                cel.addView(UiKit.muted(a, (villages.size() > 1 ? v.name + " — " : "Last check ") + note));
            }
        }
        col.addView(cel, UiKit.cardParams(a));

        col.addView(UiKit.section(a, "Troop escape"));
        LinearLayout esc = UiKit.card(a);
        Switch escOn = UiKit.accentSwitch(a, "Move troops away before an attack",
                p.getBoolean(EscapePlanner.KEY_ON, false));
        escOn.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(EscapePlanner.KEY_ON, on).apply();
            }
        });
        esc.addView(escOn, full());
        Switch escHero = UiKit.accentSwitch(a, "Take the hero too", p.getBoolean(EscapePlanner.KEY_HERO, true));
        escHero.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean on) {
                p.edit().putBoolean(EscapePlanner.KEY_HERO, on).apply();
            }
        });
        esc.addView(escHero, full());
        escLead = number(String.valueOf(p.getInt(EscapePlanner.KEY_LEAD_MIN, EscapePlanner.DEFAULT_LEAD_MIN)));
        esc.addView(line("Act this long before it lands", escLead, "min"));
        escMin = number(String.valueOf(p.getInt(EscapePlanner.KEY_MIN_ATTACK, 0)));
        esc.addView(line("Only when incoming attack power is at least", escMin, ""));
        esc.addView(UiKit.muted(a, "Raids the nearest empty oasis with the troops at home (settlers stay) so they're "
                + "away when the attack lands, and they come back by themselves. The game's own travel time is "
                + "checked first: an oasis too close to keep them away past the last attack of the wave is skipped. "
                + "Attack power is the game's total for all attacks on the village (0 = any attack). Needs "
                + "Automatic actions on; Practice mode and quiet hours apply. Numbers are saved with Save below."));
        col.addView(esc, UiKit.cardParams(a));

        AutomationSettings.Config c = AutomationSettings.fromJson(a.getSharedPreferences(AutomationSettings.PREFS,
                Context.MODE_PRIVATE).getString(AutomationSettings.KEY, null));
        col.addView(UiKit.section(a, "Auto-build timing"));
        LinearLayout t = UiKit.card(a);
        buffer = number(String.valueOf(c.bufferPercent));
        t.addView(line("Keep extra resources before building", buffer, "%"));
        delayMin = number(String.valueOf(c.minDelayMs / 60_000L));
        delayMax = number(String.valueOf(c.maxDelayMs / 60_000L));
        t.addView(range("Wait before starting, random", delayMin, delayMax, "min"));
        t.addView(UiKit.divider(a), gap());
        quietFrom = time(Clock.format(c.quietHours.startRangeStartMin));
        quietTo = time(Clock.format(c.quietHours.startRangeEndMin));
        t.addView(range("Quiet hours start between", quietFrom, quietTo, ""));
        quietMinH = number(fmtHours(c.quietHours.minDurationMin));
        quietMaxH = number(fmtHours(c.quietHours.maxDurationMin));
        t.addView(range("and last", quietMinH, quietMaxH, "hours"));
        t.addView(UiKit.muted(a, "Nothing automatic happens during quiet hours: no auto-build, celebrations, troop "
                + "escape or Silver bids and sales (your own taps still work). The exact start and length change a "
                + "little every day."));
        LinearLayout.LayoutParams bp = full();
        bp.topMargin = UiKit.dp(a, 12);
        t.addView(UiKit.primaryButton(a, "Save", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                save(p);
            }
        }), bp);
        col.addView(t, UiKit.cardParams(a));

        col.addView(UiKit.section(a, "Account"));
        LinearLayout acc = UiKit.card(a);
        String gold = a.getSharedPreferences(NotifierWorker.STATE_PREFS, Context.MODE_PRIVATE)
                .getString(NotifierWorker.KEY_GOLD_CLUB, null);
        acc.addView(UiKit.body(a, AccountTier.goldClubLine(gold == null ? null : Boolean.valueOf(gold))));
        col.addView(acc, UiKit.cardParams(a));
        return col;
    }

    private void save(SharedPreferences p) {
        try {
            int pauseMin = Integer.parseInt(pause.getText().toString().trim());
            int lead = Integer.parseInt(escLead.getText().toString().trim());
            int minAttack = Integer.parseInt(escMin.getText().toString().trim());
            if (lead < 1 || lead > 60 || minAttack < 0) {
                throw new IllegalArgumentException("escape: 1-60 minutes, attack power 0 or more");
            }
            int buf = Integer.parseInt(buffer.getText().toString().trim());
            long dMin = Long.parseLong(delayMin.getText().toString().trim());
            long dMax = Long.parseLong(delayMax.getText().toString().trim());
            int from = Clock.parse(quietFrom.getText().toString());
            int to = Clock.parse(quietTo.getText().toString());
            int minH = (int) Math.round(Double.parseDouble(quietMinH.getText().toString().trim()) * 60);
            int maxH = (int) Math.round(Double.parseDouble(quietMaxH.getText().toString().trim()) * 60);
            if (from < 0 || to < 0) {
                throw new IllegalArgumentException("times are written like 23:00");
            }
            if (pauseMin < 0 || buf < 0 || dMin < 0 || dMax < dMin || minH < 0 || maxH < minH || maxH > 24 * 60) {
                throw new IllegalArgumentException("check the numbers (the second of each pair can't be smaller)");
            }
            AutomationSettings.Config old = AutomationSettings.fromJson(a.getSharedPreferences(AutomationSettings.PREFS,
                    Context.MODE_PRIVATE).getString(AutomationSettings.KEY, null));
            AutomationSettings.Config c = new AutomationSettings.Config(buf, dMin * 60_000L, dMax * 60_000L,
                    new QuietHours.Config(from, Clock.endAfter(from, to), minH, maxH), old.serverSpeed);
            a.getSharedPreferences(AutomationSettings.PREFS, Context.MODE_PRIVATE).edit()
                    .putString(AutomationSettings.KEY, AutomationSettings.toJson(c)).apply();
            p.edit().putInt(ActionSender.KEY_PAUSE_MIN, pauseMin).putInt(EscapePlanner.KEY_LEAD_MIN, lead)
                    .putInt(EscapePlanner.KEY_MIN_ATTACK, minAttack).apply();
            Toast.makeText(a, "Saved", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            String why = e instanceof IllegalArgumentException && e.getMessage() != null && !(e instanceof NumberFormatException)
                    ? e.getMessage() : "fill in every box with a number";
            Toast.makeText(a, "Not saved: " + why, Toast.LENGTH_LONG).show();
        }
    }

    private static String fmtHours(int minutes) {
        return minutes % 60 == 0 ? String.valueOf(minutes / 60) : String.valueOf(minutes / 60.0);
    }

    // ------------------------------------------------------------------ small builders

    private LinearLayout.LayoutParams full() {
        return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams gap() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                UiKit.dp(a, 1));
        lp.topMargin = UiKit.dp(a, 10);
        lp.bottomMargin = UiKit.dp(a, 10);
        return lp;
    }

    private EditText number(String value) {
        EditText e = field(value);
        e.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
        return e;
    }

    private EditText time(String value) {
        EditText e = field(value);
        e.setInputType(InputType.TYPE_CLASS_DATETIME | InputType.TYPE_DATETIME_VARIATION_TIME);
        return e;
    }

    private EditText field(String value) {
        EditText e = new EditText(a);
        e.setText(value);
        e.setTextColor(UiKit.textColor(a));
        e.setGravity(Gravity.CENTER);
        e.setMinWidth(UiKit.dp(a, 64));
        e.setSingleLine(true);
        return e;
    }

    private View line(String label, EditText box, String unit) {
        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(UiKit.body(a, label), new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(box);
        if (unit.length() > 0) {
            TextView u = UiKit.muted(a, unit);
            u.setPadding(UiKit.dp(a, 4), 0, 0, 0);
            row.addView(u);
        }
        return row;
    }

    private View range(String label, EditText from, EditText to, String unit) {
        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(UiKit.body(a, label), new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        row.addView(from);
        TextView dash = UiKit.muted(a, "–");
        dash.setPadding(UiKit.dp(a, 4), 0, UiKit.dp(a, 4), 0);
        row.addView(dash);
        row.addView(to);
        if (unit.length() > 0) {
            TextView u = UiKit.muted(a, unit);
            u.setPadding(UiKit.dp(a, 4), 0, 0, 0);
            row.addView(u);
        }
        return row;
    }

    @Override
    public void tick() {
    }
}
