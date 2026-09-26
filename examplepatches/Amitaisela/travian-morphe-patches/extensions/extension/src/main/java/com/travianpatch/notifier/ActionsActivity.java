package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

/**
 * The Actions screen: the master switch for automatic actions, practice mode (nothing is sent, the log
 * only says what would have been sent), and the log of everything the app did or would have done.
 */
public class ActionsActivity extends Activity {

    private LinearLayout logColumn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(buildContent());
    }

    @Override
    protected void onResume() {
        super.onResume();
        drawLog();
    }

    private View buildContent() {
        LinearLayout column = UiKit.column(this);
        column.addView(UiKit.title(this, "Actions"));
        column.addView(UiKit.muted(this, "Things Travian Tools does in the game for you. Gold is never spent. "
                + "Automatic actions pause when an attack lands soon."));
        final SharedPreferences p = getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE);
        ActionClient.Settings s = ActionSender.settings(this);

        LinearLayout switches = UiKit.card(this);
        Switch master = UiKit.accentSwitch(this, "Automatic actions", s.masterOn);
        master.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean checked) {
                p.edit().putBoolean(ActionSender.KEY_MASTER, checked).apply();
            }
        });
        switches.addView(master, full());
        switches.addView(UiKit.muted(this, "Off: queues and timers never act on their own. Buttons you tap still work."));
        Switch dry = UiKit.accentSwitch(this, "Practice mode (send nothing)", s.dryRun);
        dry.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean checked) {
                p.edit().putBoolean(ActionSender.KEY_DRY_RUN, checked).apply();
            }
        });
        TextView gap = UiKit.muted(this, "On: nothing reaches the game; the log shows what would have been sent.");
        switches.addView(dry, full());
        switches.addView(gap);
        column.addView(switches, UiKit.cardParams(this));

        column.addView(UiKit.section(this, "Log"));
        logColumn = new LinearLayout(this);
        logColumn.setOrientation(LinearLayout.VERTICAL);
        column.addView(logColumn);
        return UiKit.page(this, column);
    }

    private LinearLayout.LayoutParams full() {
        return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private void drawLog() {
        logColumn.removeAllViews();
        List<ActionLog.Entry> entries = ActionLog.read(
                getSharedPreferences(ActionSender.PREFS, Context.MODE_PRIVATE).getString(ActionLog.KEY, null));
        if (entries.isEmpty()) {
            LinearLayout empty = UiKit.card(this);
            empty.addView(UiKit.body(this, "Nothing sent yet."));
            logColumn.addView(empty, UiKit.cardParams(this));
            return;
        }
        DateFormat fmt = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
        for (ActionLog.Entry e : entries) {
            LinearLayout card = UiKit.card(this);
            card.setOrientation(LinearLayout.VERTICAL);
            card.addView(UiKit.body(this, e.label));
            TextView outcome = UiKit.text(this, word(e.outcome) + " · " + fmt.format(new Date(e.atMs)), 13, true,
                    "SENT".equals(e.outcome) ? UiKit.accentText(this) : UiKit.mutedColor(this));
            card.addView(outcome);
            if (e.detail != null && e.detail.length() > 0) {
                card.addView(UiKit.muted(this, e.detail));
            }
            logColumn.addView(card, UiKit.cardParams(this));
        }
    }

    private static String word(String outcome) {
        if ("SENT".equals(outcome)) {
            return "Sent";
        }
        if ("DRY_RUN".equals(outcome)) {
            return "Practice (not sent)";
        }
        if ("REFUSED".equals(outcome)) {
            return "Not sent";
        }
        return "Failed";
    }
}
