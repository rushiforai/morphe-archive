package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Locale;

import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.SabpPrefs;

/**
 * The long-press panels for speed and the sleep timer. Both drive SABP's own engine: speed goes
 * to PlayerService (the same call SABP's speed dialog makes) and the timer is SABP's, which runs in
 * its service with the screen off, so switching interfaces or leaving eppy doesn't affect it.
 */
public final class PlaybackPanels {
    private PlaybackPanels() {
    }

    // ---- speed --------------------------------------------------------------------------------

    /** Speeds the tap cycles through: the user's favourites, or every preset. */
    public static float[] speedCycle(Context c) {
        String favs = EppyTheme.prefs(c).getString("speedFavs", "");
        if (favs.isEmpty()) return EppyPlayer.SPEED_PRESETS;
        java.util.ArrayList<Float> list = new java.util.ArrayList<>();
        for (String s : favs.split(",")) {
            try {
                list.add(Float.parseFloat(s));
            } catch (NumberFormatException ignored) {
            }
        }
        if (list.size() < 2) return EppyPlayer.SPEED_PRESETS;
        java.util.Collections.sort(list);
        float[] out = new float[list.size()];
        for (int i = 0; i < out.length; i++) out[i] = list.get(i);
        return out;
    }

    private static boolean isFavourite(Context c, float f) {
        for (String s : EppyTheme.prefs(c).getString("speedFavs", "").split(",")) {
            try {
                if (Math.abs(Float.parseFloat(s) - f) < 0.001f) return true;
            } catch (NumberFormatException ignored) {
            }
        }
        return false;
    }

    private static void toggleFavourite(Context c, float f) {
        SharedPreferences p = EppyTheme.prefs(c);
        java.util.ArrayList<String> out = new java.util.ArrayList<>();
        boolean had = false;
        for (String s : p.getString("speedFavs", "").split(",")) {
            if (s.isEmpty()) continue;
            try {
                if (Math.abs(Float.parseFloat(s) - f) < 0.001f) {
                    had = true;
                    continue;
                }
            } catch (NumberFormatException ignored) {
                continue;
            }
            out.add(s);
        }
        if (!had) out.add(String.valueOf(f));
        p.edit().putString("speedFavs", String.join(",", out)).apply();
    }

    public static String formatSpeed(float s) {
        String v = String.format(Locale.US, "%.2f", s);
        while (v.endsWith("0")) v = v.substring(0, v.length() - 1);
        if (v.endsWith(".")) v = v.substring(0, v.length() - 1);
        return v + "×";
    }

    public static void showSpeed(Host host, Runnable changed) {
        Context c = host.activity();
        EppyTheme t = host.theme();
        EppyPlayer p = host.player();
        if (!p.canSetSpeed()) {
            Toast.makeText(c, p.book() == null ? "Start a book first" : "Speed control isn't available (see Diagnostics)", Toast.LENGTH_SHORT).show();
            return;
        }
        final float[] speed = {p.bookSpeed()};
        final int[] skip = {p.skipSilence()};
        Sheet sh = new Sheet(host.overlayRoot(), t, "Playback speed");
        LinearLayout box = sh.content();

        TextView big = Ui.text(c, t, formatSpeed(speed[0]), 44, 650, t.onSurface);
        big.setGravity(Gravity.CENTER);
        big.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        box.addView(big, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView left = Ui.text(c, t, "", 13, 400, t.onSurfaceVariant);
        left.setGravity(Gravity.CENTER);
        box.addView(left, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout row = Ui.row(c);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(Ui.dp(c, 12), Ui.dp(c, 8), Ui.dp(c, 12), 0);
        SeekBar bar = new SeekBar(c);
        int steps = Math.round((EppyPlayer.MAX_SPEED - EppyPlayer.MIN_SPEED) / 0.05f);
        bar.setMax(steps);
        bar.setProgressTintList(ColorStateList.valueOf(t.primary));
        bar.setThumbTintList(ColorStateList.valueOf(t.primary));
        bar.setContentDescription("Speed");
        row.addView(Ui.iconButton(c, t, 0, t.onSurface, t.surfaceContainerHigh, "Slower", v ->
                bar.setProgress(Math.max(0, bar.getProgress() - 1))));
        ((android.widget.FrameLayout) row.getChildAt(0)).addView(centered(c, t, "−"));
        row.addView(bar, Ui.lp(0, Ui.dp(c, 48), 1));
        row.addView(Ui.iconButton(c, t, 0, t.onSurface, t.surfaceContainerHigh, "Faster", v ->
                bar.setProgress(Math.min(steps, bar.getProgress() + 1))));
        ((android.widget.FrameLayout) row.getChildAt(2)).addView(centered(c, t, "+"));
        box.addView(row);

        LinearLayout presets = Ui.row(c);
        presets.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 4));
        HorizontalScrollView hs = new HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        hs.addView(presets);
        box.addView(hs);
        TextView favNote = Ui.text(c, t, "Tap the speed button to step through these. Long-press a speed to add it to (or remove it from) your favourites; with two or more, tapping cycles only your favourites.",
                12, 400, t.onSurfaceVariant);
        favNote.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 8));
        box.addView(favNote);

        Runnable[] apply = new Runnable[1];
        Runnable[] buildPresets = new Runnable[1];
        buildPresets[0] = () -> {
            presets.removeAllViews();
            for (float f : EppyPlayer.SPEED_PRESETS) {
                boolean sel = Math.abs(f - speed[0]) < 0.001f;
                boolean fav = isFavourite(c, f);
                LinearLayout chip = Ui.chip(c, t, fav ? EppyIcon.STAR : 0, formatSpeed(f), sel, v -> {
                    bar.setProgress(Math.round((f - EppyPlayer.MIN_SPEED) / 0.05f));
                });
                chip.setOnLongClickListener(v -> {
                    toggleFavourite(c, f);
                    buildPresets[0].run();
                    return true;
                });
                chip.setContentDescription(formatSpeed(f) + (fav ? ", favourite" : "") + (sel ? ", selected" : ""));
                presets.addView(chip);
                presets.addView(Ui.space(c, 8, 1));
            }
        };
        Handler h = new Handler(Looper.getMainLooper());
        Runnable send = () -> {
            p.setSpeed(speed[0], skip[0]);
            if (changed != null) changed.run();
        };
        apply[0] = () -> {
            big.setText(formatSpeed(speed[0]));
            int rem = p.bookRemainingSeconds();
            left.setText(rem > 0 ? Ui.duration(Math.round(rem / speed[0])) + " left at this speed" : "");
            buildPresets[0].run();
            // Debounced so dragging the slider sends one change, not dozens.
            h.removeCallbacks(send);
            h.postDelayed(send, 250);
        };
        bar.setProgress(Math.round((speed[0] - EppyPlayer.MIN_SPEED) / 0.05f));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar s, int v, boolean fromUser) {
                float n = Math.round((EppyPlayer.MIN_SPEED + v * 0.05f) * 100f) / 100f;
                if (Math.abs(n - speed[0]) < 0.001f) return;
                speed[0] = n;
                apply[0].run();
            }

            @Override
            public void onStartTrackingTouch(SeekBar s) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar s) {
            }
        });
        big.setText(formatSpeed(speed[0]));
        int rem0 = p.bookRemainingSeconds();
        left.setText(rem0 > 0 ? Ui.duration(Math.round(rem0 / speed[0])) + " left at this speed" : "");
        buildPresets[0].run();

        // Skip silence, as SABP's engine offers it (levels 1–5).
        TextView sl = Ui.text(c, t, "Skip silence", 14, 600, t.onSurface);
        sl.setPadding(Ui.dp(c, 24), Ui.dp(c, 12), Ui.dp(c, 24), Ui.dp(c, 4));
        box.addView(sl);
        LinearLayout skipRow = Ui.row(c);
        skipRow.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 4));
        HorizontalScrollView hs2 = new HorizontalScrollView(c);
        hs2.setHorizontalScrollBarEnabled(false);
        hs2.addView(skipRow);
        box.addView(hs2);
        String[] skipLabels = {"Off", "Very light", "Light", "Medium", "Strong", "Very strong"};
        Runnable[] buildSkip = new Runnable[1];
        buildSkip[0] = () -> {
            skipRow.removeAllViews();
            for (int i = 0; i < skipLabels.length; i++) {
                final int lvl = i;
                skipRow.addView(Ui.chip(c, t, 0, skipLabels[i], i == skip[0], v -> {
                    skip[0] = lvl;
                    buildSkip[0].run();
                    h.removeCallbacks(send);
                    h.post(send);
                }));
                skipRow.addView(Ui.space(c, 8, 1));
            }
        };
        buildSkip[0].run();

        TextView pitch = Ui.text(c, t, "Pitch is kept natural at every speed by SABP's audio engine.", 12, 400, t.onSurfaceVariant);
        pitch.setPadding(Ui.dp(c, 24), Ui.dp(c, 4), Ui.dp(c, 24), Ui.dp(c, 8));
        box.addView(pitch);

        sh.item(EppyIcon.RESET, "Reset to 1×", null, () -> {
            p.setSpeed(1f, skip[0]);
            if (changed != null) changed.run();
        });
        sh.item(EppyIcon.CHECK, "Use for books you haven't started", "Default for new books: " + formatSpeed(SabpPrefs.defaultSpeed(c)), () -> {
            SabpPrefs.setDefaultSpeed(c, speed[0], skip[0]);
            Toast.makeText(c, formatSpeed(speed[0]) + " is now the default for new books", Toast.LENGTH_SHORT).show();
        });
        sh.onDismiss(() -> {
            if (h.hasCallbacks(send)) {
                h.removeCallbacks(send);
                send.run();
            }
        });
        sh.show();
    }

    private static TextView centered(Context c, EppyTheme t, String s) {
        TextView tv = Ui.text(c, t, s, 22, 600, t.onSurface);
        tv.setGravity(Gravity.CENTER);
        tv.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return tv;
    }

    // ---- sleep timer ----------------------------------------------------------------------------

    private static final int[] SLEEP_PRESETS = {5, 10, 15, 30, 45, 60};

    public static void showSleep(Host host, Runnable changed) {
        Context c = host.activity();
        EppyTheme t = host.theme();
        EppyPlayer p = host.player();
        Sheet sh = new Sheet(host.overlayRoot(), t, "Sleep timer");
        LinearLayout box = sh.content();
        TextView status = Ui.text(c, t, "", 40, 650, t.onSurface);
        status.setGravity(Gravity.CENTER);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        box.addView(status, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView sub = Ui.text(c, t, "", 13, 400, t.onSurfaceVariant);
        sub.setGravity(Gravity.CENTER);
        box.addView(sub, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout actions = Ui.row(c);
        actions.setGravity(Gravity.CENTER);
        actions.setPadding(Ui.dp(c, 16), Ui.dp(c, 12), Ui.dp(c, 16), Ui.dp(c, 4));
        box.addView(actions, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout presets = Ui.row(c);
        presets.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
        HorizontalScrollView hs = new HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        hs.addView(presets);
        box.addView(hs);

        Handler h = new Handler(Looper.getMainLooper());
        Runnable[] refresh = new Runnable[1];
        refresh[0] = () -> {
            boolean on = p.sleepActive();
            String rem = p.sleepRemaining();
            int minutes = SabpPrefs.sleepMinutes(c);
            if (on) {
                status.setText(minutes < 0 ? "End of chapter" : rem != null && !rem.isEmpty() ? rem : minutes + " min");
                sub.setText(minutes < 0 ? "Stops when this chapter (file) ends" : "Counting down while playing. Fades out at the end; shake to restart (Player settings).");
            } else {
                status.setText("Off");
                sub.setText("Next time: " + (minutes < 0 ? "end of chapter" : minutes + " min"));
            }
            actions.removeAllViews();
            if (on) {
                actions.addView(Ui.chip(c, t, EppyIcon.PLUS, "+5 min", false, v -> {
                    p.extendSleep(5);
                    h.postDelayed(refresh[0], 300);
                    if (changed != null) changed.run();
                }));
                actions.addView(Ui.space(c, 8, 1));
                actions.addView(Ui.chip(c, t, EppyIcon.RESET, "Restart", false, v -> {
                    p.startSleep(SabpPrefs.sleepMinutes(c));
                    h.postDelayed(refresh[0], 300);
                    if (changed != null) changed.run();
                }));
                actions.addView(Ui.space(c, 8, 1));
                actions.addView(Ui.chip(c, t, EppyIcon.CLOSE, "Turn off", false, v -> {
                    p.stopSleep();
                    h.postDelayed(refresh[0], 300);
                    if (changed != null) changed.run();
                }));
            } else {
                actions.addView(Ui.chip(c, t, EppyIcon.MOON, "Start", true, v -> {
                    p.startSleep(SabpPrefs.sleepMinutes(c));
                    h.postDelayed(refresh[0], 300);
                    if (changed != null) changed.run();
                }));
            }
            presets.removeAllViews();
            for (int m : SLEEP_PRESETS) {
                presets.addView(Ui.chip(c, t, 0, m + " min", on && minutes == m, v -> {
                    p.startSleep(m);
                    h.postDelayed(refresh[0], 300);
                    if (changed != null) changed.run();
                }));
                presets.addView(Ui.space(c, 8, 1));
            }
            presets.addView(Ui.chip(c, t, EppyIcon.BOOK, "End of chapter", on && minutes < 0, v -> {
                p.startSleep(-1);
                h.postDelayed(refresh[0], 300);
                if (changed != null) changed.run();
            }));
            presets.addView(Ui.space(c, 8, 1));
            presets.addView(Ui.chip(c, t, EppyIcon.EDIT, "Custom", false, v -> custom(host, minutesPicked -> {
                p.startSleep(minutesPicked);
                h.postDelayed(refresh[0], 300);
                if (changed != null) changed.run();
            })));
        };
        Runnable tick = new Runnable() {
            @Override
            public void run() {
                if (!sh.isShowing()) return;
                String rem = p.sleepRemaining();
                if (p.sleepActive() && rem != null && !rem.isEmpty() && SabpPrefs.sleepMinutes(c) >= 0) status.setText(rem);
                h.postDelayed(this, 1000);
            }
        };
        refresh[0].run();
        TextView note = Ui.text(c, t, "The timer is Smart AudioBook Player's own: it keeps running with the screen off and in the classic player. \"End of chapter\" stops at the end of the current file or embedded chapter, as SABP defines it.",
                12, 400, t.onSurfaceVariant);
        note.setPadding(Ui.dp(c, 24), Ui.dp(c, 4), Ui.dp(c, 24), Ui.dp(c, 8));
        box.addView(note);
        sh.onDismiss(() -> h.removeCallbacksAndMessages(null));
        sh.show();
        h.postDelayed(tick, 1000);
    }

    private static void custom(Host host, java.util.function.IntConsumer done) {
        Context c = host.activity();
        EppyTheme t = host.theme();
        Sheet sh = new Sheet(host.overlayRoot(), t, "Custom sleep timer");
        EditText in = new EditText(c);
        in.setInputType(InputType.TYPE_CLASS_NUMBER);
        in.setHint("Minutes (1–600)");
        in.setTextColor(t.onSurface);
        in.setHintTextColor(t.onSurfaceVariant);
        in.setPadding(Ui.dp(c, 24), Ui.dp(c, 12), Ui.dp(c, 24), Ui.dp(c, 12));
        sh.content().addView(in, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        sh.item(EppyIcon.CHECK, "Start", null, () -> {
            try {
                int m = Integer.parseInt(in.getText().toString().trim());
                if (m >= 1 && m <= 600) done.accept(m);
                else Toast.makeText(c, "Choose 1 to 600 minutes", Toast.LENGTH_SHORT).show();
            } catch (NumberFormatException e) {
                Toast.makeText(c, "Type a number of minutes", Toast.LENGTH_SHORT).show();
            }
        });
        sh.show();
        in.requestFocus();
    }
}
