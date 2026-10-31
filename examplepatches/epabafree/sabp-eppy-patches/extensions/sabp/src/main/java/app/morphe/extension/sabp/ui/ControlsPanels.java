package app.morphe.extension.sabp.ui;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Locale;

import app.morphe.extension.sabp.BookControls;
import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyDiag;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyRoute;
import app.morphe.extension.sabp.EppyTheme;

/**
 * eppy's versions of the classic player's tools, each driving SABP's own engine and data:
 * equalizer, volume boost, repeat, skip start/end, ID3 titles, rotate control, subtitles, the file
 * list, companion text/PDF files, audio output and exit. Things that only exist as classic dialogs
 * (cover picker, file deletion, MP3→Opus) open the classic player on purpose, labelled as such.
 */
public final class ControlsPanels {
    private ControlsPanels() {
    }

    private static boolean need(Host host, boolean ok, String what) {
        if (ok) return true;
        Toast.makeText(host.activity(), host.player().book() == null ? "Start a book first"
                : what + " isn't available (see Settings → Diagnostics)", Toast.LENGTH_SHORT).show();
        return false;
    }

    // ---- equalizer ------------------------------------------------------------------------------

    public static void showEqualizer(Host host, Runnable changed) {
        if (!need(host, BookControls.canEqualize(), "The equalizer")) return;
        Context c = host.activity();
        EppyTheme t = host.theme();
        BookControls.Eq eq = BookControls.equalizer();
        Sheet sh = new Sheet(host.overlayRoot(), t, "Equalizer");
        LinearLayout box = sh.content();
        note(c, t, box, "For this book. Same settings as the classic player's equalizer.");
        String[] names = {"60 Hz", "230 Hz", "910 Hz", "4 kHz", "14 kHz"};
        Runnable apply = () -> {
            BookControls.setEqualizer(eq);
            if (changed != null) changed.run();
        };
        android.os.Handler h = new android.os.Handler(android.os.Looper.getMainLooper());
        Runnable debounced = () -> {
            h.removeCallbacks(apply);
            h.postDelayed(apply, 200);
        };
        for (int i = 0; i < 5; i++) {
            final int band = i;
            slider(c, t, box, names[i], 30, eq.levels[i] + 15, v -> String.format(Locale.US, "%+d dB", v - 15), v -> {
                eq.levels[band] = v - 15;
                debounced.run();
            });
        }
        if (BookControls.advancedEqAvailable(c)) {
            slider(c, t, box, "Balance", 40, Math.round((eq.balance + 1f) * 20f), v -> {
                float b = v / 20f - 1f;
                return Math.abs(b) < 0.01f ? "Centre" : (b < 0 ? "Left " : "Right ") + Math.round(Math.abs(b) * 100) + "%";
            }, v -> {
                eq.balance = v / 20f - 1f;
                debounced.run();
            });
            slider(c, t, box, "Pitch", 60, Math.round((eq.pitch / 2.5f + 1f) * 30f), v -> {
                float p = (v / 30f - 1f) * 2.5f;
                return Math.abs(p) < 0.01f ? "Natural" : String.format(Locale.US, "%+.2f semitones", p);
            }, v -> {
                eq.pitch = (v / 30f - 1f) * 2.5f;
                debounced.run();
            });
            box.addView(Ui.switchRow(c, t, "Mono", "Mix both channels", eq.mono, (b, on) -> {
                eq.mono = on;
                debounced.run();
            }));
            box.addView(Ui.switchRow(c, t, "Reduce noise", null, eq.denoise, (b, on) -> {
                eq.denoise = on;
                debounced.run();
            }));
        } else {
            note(c, t, box, "Balance, mono, pitch and noise reduction need SABP's built-in decoder (Player settings → All SABP settings → Troubleshooting → Decoder).");
        }
        sh.item(EppyIcon.RESET, "Reset to flat", null, () -> {
            BookControls.setEqualizer(new BookControls.Eq());
            if (changed != null) changed.run();
        });
        sh.onDismiss(() -> {
            if (h.hasCallbacks(apply)) {
                h.removeCallbacks(apply);
                apply.run();
            }
        });
        sh.show();
    }

    interface Label {
        String of(int v);
    }

    interface Change {
        void to(int v);
    }

    private static void slider(Context c, EppyTheme t, LinearLayout box, String name, int max, int value, Label label, Change change) {
        LinearLayout row = Ui.row(c);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(Ui.dp(c, 24), Ui.dp(c, 2), Ui.dp(c, 16), Ui.dp(c, 2));
        TextView n = Ui.text(c, t, name, 14, 500, t.onSurface);
        n.setMinWidth(Ui.dp(c, 72));
        row.addView(n);
        SeekBar sb = new SeekBar(c);
        sb.setMax(max);
        sb.setProgress(Math.max(0, Math.min(max, value)));
        sb.setProgressTintList(ColorStateList.valueOf(t.primary));
        sb.setThumbTintList(ColorStateList.valueOf(t.primary));
        sb.setContentDescription(name);
        row.addView(sb, Ui.lp(0, Ui.dp(c, 48), 1));
        TextView v = Ui.text(c, t, label.of(sb.getProgress()), 12, 500, t.onSurfaceVariant);
        v.setMinWidth(Ui.dp(c, 88));
        v.setGravity(Gravity.END);
        row.addView(v);
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar s, int p, boolean fromUser) {
                v.setText(label.of(p));
                sb.setStateDescription(label.of(p));
                if (fromUser) change.to(p);
            }

            @Override
            public void onStartTrackingTouch(SeekBar s) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar s) {
            }
        });
        box.addView(row);
    }

    private static void note(Context c, EppyTheme t, LinearLayout box, String s) {
        TextView tv = Ui.text(c, t, s, 12, 400, t.onSurfaceVariant);
        tv.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 8));
        box.addView(tv);
    }

    // ---- volume boost ---------------------------------------------------------------------------

    public static String boostLabel(int level) {
        return level < 0 ? "Quieter" : level == 0 ? "Boost" : "Boost " + level;
    }

    /** Tap: next boost level (off → 1 → 2 → 3 → off), like the classic button. */
    public static void cycleBoost(Host host, Runnable changed) {
        if (!need(host, BookControls.canBoost(), "Volume boost")) return;
        int next = (Math.max(0, BookControls.boost()) + 1) % 4;
        BookControls.setBoost(next);
        Toast.makeText(host.activity(), next == 0 ? "Volume boost off" : "Volume boost " + next, Toast.LENGTH_SHORT).show();
        if (changed != null) changed.run();
    }

    public static void showBoost(Host host, Runnable changed) {
        if (!need(host, BookControls.canBoost(), "Volume boost")) return;
        int cur = BookControls.boost();
        Sheet sh = new Sheet(host.overlayRoot(), host.theme(), "Volume boost");
        String[] labels = {"Quieter", "Off", "Boost 1", "Boost 2", "Boost 3"};
        for (int l = -1; l <= 3; l++) {
            final int level = l;
            sh.item(l == cur ? EppyIcon.CHECK : 0, labels[l + 1], l == -1 ? "Lower than normal, for loud recordings" : null, () -> {
                BookControls.setBoost(level);
                if (changed != null) changed.run();
            });
        }
        sh.show();
    }

    // ---- repeat ---------------------------------------------------------------------------------

    public static void showRepeat(Host host, Runnable changed) {
        if (!need(host, BookControls.canRepeat(), "Repeat")) return;
        String cur = BookControls.repeatMode();
        Sheet sh = new Sheet(host.overlayRoot(), host.theme(), "Repeat");
        sh.item(cur == null ? EppyIcon.CHECK : 0, "Off", null, () -> {
            BookControls.setRepeat(null);
            if (changed != null) changed.run();
        });
        for (String m : BookControls.REPEAT_MODES) {
            sh.item(m.equals(cur) ? EppyIcon.CHECK : 0, BookControls.repeatLabel(m), null, () -> {
                BookControls.setRepeat(m);
                if (changed != null) changed.run();
            });
        }
        sh.show();
    }

    // ---- skip start / end -----------------------------------------------------------------------

    public static void showSkipStartEnd(Host host, Runnable changed) {
        if (!need(host, BookControls.canSkipStartEnd(), "Skip start and end")) return;
        Context c = host.activity();
        EppyTheme t = host.theme();
        int[] se = BookControls.skipStartEnd();
        Sheet sh = new Sheet(host.overlayRoot(), t, "Skip start and end");
        LinearLayout box = sh.content();
        note(c, t, box, "Skips intros and outros (music, \"This is Audible\") at the start and end of every file of this book.");
        slider(c, t, box, "Start", 120, se[0], v -> v == 0 ? "Off" : v + " s", v -> {
            se[0] = v;
            BookControls.setSkipStartEnd(se[0], se[1]);
            if (changed != null) changed.run();
        });
        slider(c, t, box, "End", 120, se[1], v -> v == 0 ? "Off" : v + " s", v -> {
            se[1] = v;
            BookControls.setSkipStartEnd(se[0], se[1]);
            if (changed != null) changed.run();
        });
        sh.show();
    }

    // ---- subtitles ------------------------------------------------------------------------------

    /** The subtitle line playing now, or null. */
    public static String currentSubtitle(EppyPlayer p) {
        EppyBook b = p.book();
        if (b == null || b.srts.isEmpty()) return null;
        double pos = p.bookPositionSeconds();
        if (pos < 0) return null;
        for (EppyBook.SrtItem s : b.srts) {
            if (s.start >= 0 && pos >= s.start && pos < s.start + Math.max(1, s.endInFile - s.startInFile)) return s.text;
        }
        return null;
    }

    public static void showSubtitles(Host host) {
        EppyBook b = host.player().book();
        if (b == null || b.srts.isEmpty()) {
            Toast.makeText(host.activity(), "This book has no subtitle (.srt) files", Toast.LENGTH_SHORT).show();
            return;
        }
        Sheet sh = new Sheet(host.overlayRoot(), host.theme(), "Subtitles");
        int n = 0;
        for (EppyBook.SrtItem s : b.srts) {
            if (++n > 400) break;
            sh.item(0, s.text != null ? s.text : "", Ui.time(Math.max(0, s.start) * 1000L),
                    () -> host.player().jumpTo(s.fileName, s.startInFile));
        }
        sh.show();
    }

    // ---- files ----------------------------------------------------------------------------------

    public static void showFiles(Host host) {
        EppyBook b = host.player().book();
        if (b == null) {
            Toast.makeText(host.activity(), "Start a book first", Toast.LENGTH_SHORT).show();
            return;
        }
        Sheet sh = new Sheet(host.overlayRoot(), host.theme(), b.files.size() + (b.files.size() == 1 ? " file" : " files"));
        for (EppyBook.FileItem f : b.files) {
            String name = f.id3Title != null && !f.id3Title.trim().isEmpty() && BookControls.id3Titles() ? f.id3Title : f.name;
            sh.item(f.name != null && f.name.equals(b.currentFile) ? EppyIcon.PLAY : 0, name,
                    f.duration > 0 ? Ui.duration(f.duration) : null, () -> host.player().jumpTo(f.name, 0));
        }
        sh.show();
    }

    // ---- companion text / PDF files ---------------------------------------------------------------

    public static void showTextFiles(Host host) {
        EppyBook b = host.player().book();
        if (b == null || b.textFiles.isEmpty()) {
            Toast.makeText(host.activity(), "No text or PDF files next to this book", Toast.LENGTH_SHORT).show();
            return;
        }
        Sheet sh = new Sheet(host.overlayRoot(), host.theme(), "Open a file from the book's folder");
        for (String name : b.textFiles) sh.item(EppyIcon.OPEN_IN_NEW, name, null, () -> openInFolder(host, b.folderUri, name));
        sh.show();
    }

    private static void openInFolder(Host host, String folderUri, String name) {
        Context c = host.activity();
        try {
            Uri folder = Uri.parse(folderUri);
            String folderDoc = DocumentsContract.getDocumentId(folder);
            Uri doc = DocumentsContract.buildDocumentUriUsingTree(folder, folderDoc + "/" + name);
            String lower = name.toLowerCase(Locale.ROOT);
            String mime = lower.endsWith(".pdf") ? "application/pdf" : lower.endsWith(".epub") ? "application/epub+zip"
                    : lower.endsWith(".txt") ? "text/plain" : "*/*";
            Intent i = new Intent(Intent.ACTION_VIEW);
            i.setDataAndType(doc, mime);
            i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            c.startActivity(Intent.createChooser(i, name));
        } catch (ActivityNotFoundException e) {
            Toast.makeText(c, "No app can open " + name, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            EppyDiag.error("controls", "open text file failed: " + t);
            Toast.makeText(c, "Couldn't open " + name, Toast.LENGTH_SHORT).show();
        }
    }

    // ---- audio output ---------------------------------------------------------------------------

    /** Android's output switcher (Bluetooth, speakers, and cast devices the system offers). */
    public static void showOutputSwitcher(Host host) {
        Context c = host.activity();
        try {
            if (android.os.Build.VERSION.SDK_INT >= 34) {
                if (android.media.MediaRouter2.getInstance(c).showSystemOutputSwitcher()) return;
            }
        } catch (Throwable ignored) {
        }
        try {
            Intent i = new Intent("com.android.systemui.action.LAUNCH_MEDIA_OUTPUT_DIALOG");
            i.setPackage("com.android.systemui");
            i.putExtra("package_name", c.getPackageName());
            c.sendBroadcast(i);
        } catch (Throwable t) {
            Toast.makeText(c, "Audio output picker not available on this phone", Toast.LENGTH_SHORT).show();
        }
    }

    // ---- exit -----------------------------------------------------------------------------------

    /** Same as the classic Exit and the notification's close button: stops SABP and closes. */
    public static void exit(Host host) {
        EppyBridge.send(host.activity(), EppyBridge.SABP_PACKAGE + ".ActionExit");
        host.activity().finishAndRemoveTask();
    }

    // ---- classic-only tools -----------------------------------------------------------------------

    /** Opens the classic player on purpose, telling the user where the tool is. */
    public static void openClassicFor(Host host, String where) {
        Toast.makeText(host.activity(), "In the classic player: " + where + ". Use ⋮ → Switch to eppy to come back.", Toast.LENGTH_LONG).show();
        host.openSabp(EppyBridge.PLAYER_ACTIVITY);
    }
}
