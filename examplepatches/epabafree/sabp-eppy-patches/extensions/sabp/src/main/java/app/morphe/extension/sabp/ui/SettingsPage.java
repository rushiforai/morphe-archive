package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyTheme;

/** Eppy UI settings plus shortcuts into SABP's own settings and tools. */
public final class SettingsPage {
    private final Host host;
    private final Context c;
    private final EppyTheme t;
    public final ScrollView root;
    private final LinearLayout col;

    private static final int[] SEEDS = {0xFFE8735A, 0xFFF2B8B5, 0xFFD0BCFF, 0xFF8AB4F8, 0xFF7DD3C0, 0xFFA8C97F, 0xFFF5C26B, 0xFFB0A8A0};

    public SettingsPage(Host host) {
        this.host = host;
        this.c = host.activity();
        this.t = host.theme();
        root = new ScrollView(c);
        root.setFillViewport(true);
        col = Ui.column(c);
        col.setPadding(Ui.dp(c, 20), Ui.dp(c, 12), Ui.dp(c, 20), Ui.dp(c, 8));
        root.addView(col, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        build();
    }

    private SharedPreferences prefs() {
        return EppyTheme.prefs(c);
    }

    private void build() {
        TextView h = Ui.text(c, t, "Settings", 30, 600, t.onSurface);
        h.setAccessibilityHeading(true);
        h.setMinHeight(Ui.dp(c, 56));
        h.setGravity(Gravity.CENTER_VERTICAL);
        col.addView(h);

        LinearLayout player = group("Player interface");
        player.addView(interfaceChoice());

        LinearLayout look = group("Appearance");
        look.addView(label("Style"));
        look.addView(skinPicker());
        look.addView(nameField());
        if (!EppyTheme.SKIN_MATERIAL.equals(t.skin)) {
            TextView note = Ui.text(c, t, "Theme and accent below apply to the Material You style. Other styles use their own fixed palette.", 13, 400, t.onSurfaceVariant);
            note.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 8));
            look.addView(note);
        }
        look.addView(label("Theme"));
        look.addView(segmented(new String[]{"System", "Light", "Dark", "Black"},
                new String[]{EppyTheme.MODE_SYSTEM, EppyTheme.MODE_LIGHT, EppyTheme.MODE_DARK, EppyTheme.MODE_BLACK},
                t.mode, "mode"));
        look.addView(label("Accent colour"));
        look.addView(segmented(new String[]{"Wallpaper", "Book cover", "Custom"},
                new String[]{EppyTheme.ACCENT_WALLPAPER, EppyTheme.ACCENT_COVER, EppyTheme.ACCENT_CUSTOM},
                t.accentSource, "accent"));
        if (EppyTheme.ACCENT_CUSTOM.equals(t.accentSource) || android.os.Build.VERSION.SDK_INT < 31) {
            look.addView(swatches());
        }
        look.addView(toggle("High contrast", "Stronger text and outlines", "highContrast", t.highContrast));
        look.addView(toggle("Waveform seek bar", "A static waveform instead of the slider track", "waveform", t.waveformSeekBar));

        LinearLayout mini = group("Mini-player");
        mini.addView(label("Swipe sideways"));
        mini.addView(segmented(new String[]{"Change chapter", "Pause and hide", "Off"},
                new String[]{"chapters", "dismiss", "off"}, prefs().getString("miniSwipe", "chapters"), "miniSwipe"));
        TextView mn = Ui.text(c, t, "Tap or swipe up to open the player. Swipe down to pause and hide it until you play again.", 13, 400, t.onSurfaceVariant);
        mn.setPadding(Ui.dp(c, 16), Ui.dp(c, 4), Ui.dp(c, 16), Ui.dp(c, 12));
        mini.addView(mn);

        LinearLayout gest = group("Cover gestures");
        int dts = prefs().getInt("doubleTapSeconds", 0);
        String[] dtLabels = {"Same as rewind (" + app.morphe.extension.sabp.SabpPrefs.smallSeconds(c) + " s)", "5 s", "10 s", "15 s", "20 s", "30 s", "45 s", "60 s", "Off"};
        int[] dtValues = {0, 5, 10, 15, 20, 30, 45, 60, -1};
        int dtIdx = 0;
        for (int i = 0; i < dtValues.length; i++) if (dtValues[i] == dts) dtIdx = i;
        final int curIdx = dtIdx;
        gest.addView(Ui.linkRow(c, t, EppyIcon.TOUCH, "Double-tap the cover to skip", dtLabels[dtIdx], v -> {
            Sheet sh = new Sheet(host.overlayRoot(), t, "Double-tap to skip");
            for (int i = 0; i < dtValues.length; i++) {
                final int val = dtValues[i];
                sh.item(i == curIdx ? EppyIcon.CHECK : 0, dtLabels[i], null, () -> {
                    prefs().edit().putInt("doubleTapSeconds", val).apply();
                    host.rebuild();
                });
            }
            sh.show();
        }));
        TextView gn = Ui.text(c, t, "Left half goes back, right half forward. Keep tapping to add more.", 13, 400, t.onSurfaceVariant);
        gn.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 12));
        gest.addView(gn);

        LinearLayout motion = group("Motion and feedback");
        motion.addView(toggle("Reduce motion", "Skip transitions and shape animations", "reduceMotion", t.reduceMotion));
        motion.addView(toggle("Haptic feedback", "Vibrate lightly on taps", "haptics", t.haptics));

        LinearLayout sabp = group("Smart AudioBook Player");
        sabp.addView(Ui.linkRow(c, t, EppyIcon.TUNE, "Player settings", "Playback, skip intervals, sleep timer, statistics",
                v -> host.pushPage(PlayerSettingsPage.KEY, null)));
        sabp.addView(link(EppyIcon.FOLDER, "Library manager", "Folders, finished books, covers, files", EppyBridge.LIBRARY_ACTIVITY));
        sabp.addView(Ui.linkRow(c, t, EppyIcon.CHART, "Listening statistics", "Time listened per month and book", v -> host.pushPage(StatisticsPage.KEY, null)));
        sabp.addView(Ui.linkRow(c, t, EppyIcon.HISTORY, "History", "Recent books, undo accidental jumps", v -> host.pushPage(HistoryPage.KEY, null)));
        sabp.addView(Ui.linkRow(c, t, EppyIcon.PERSON, "Characters", "Names and notes for the playing book", v -> host.pushPage(CharactersPage.KEY, null)));
        sabp.addView(link(EppyIcon.QUEUE, "Book queue", "Books to play next", EppyBridge.QUEUE_ACTIVITY));
        sabp.addView(link(EppyIcon.CLASSIC, "Classic player", "The original Smart AudioBook Player screen", EppyBridge.PLAYER_ACTIVITY));

        LinearLayout info = group("Book information sources");
        bookInfo(info);

        LinearLayout backup = group("Back up eppy settings");
        backup.addView(Ui.linkRow(c, t, EppyIcon.DOWNLOAD, "Save a backup", "Appearance, player interface, read-along and book-information settings, as a JSON file",
                v -> host.requestDocument(true, "application/json", "eppy-settings.json", uri -> {
                    try (java.io.OutputStream out = c.getContentResolver().openOutputStream(uri, "wt")) {
                        out.write(app.morphe.extension.sabp.EppySettings.export(c).getBytes(java.nio.charset.StandardCharsets.UTF_8));
                        android.widget.Toast.makeText(c, "Backup saved", android.widget.Toast.LENGTH_SHORT).show();
                    } catch (Throwable e) {
                        app.morphe.extension.sabp.EppyDiag.error("settings", "backup failed: " + e);
                        android.widget.Toast.makeText(c, "Couldn't save the backup: " + e.getMessage(), android.widget.Toast.LENGTH_LONG).show();
                    }
                })));
        backup.addView(Ui.linkRow(c, t, EppyIcon.UPLOAD, "Restore from a backup", "Replaces eppy's settings. Smart AudioBook Player's data isn't touched.",
                v -> host.requestDocument(false, "*/*", null, uri -> {
                    try (java.io.InputStream in = c.getContentResolver().openInputStream(uri)) {
                        java.io.ByteArrayOutputStream bo = new java.io.ByteArrayOutputStream();
                        byte[] buf = new byte[8192];
                        int r;
                        while (in != null && (r = in.read(buf)) > 0 && bo.size() < 1_000_000) bo.write(buf, 0, r);
                        int n = app.morphe.extension.sabp.EppySettings.restore(c, bo.toString("UTF-8"));
                        android.widget.Toast.makeText(c, "Restored " + n + " settings", android.widget.Toast.LENGTH_SHORT).show();
                        host.rebuild();
                    } catch (Throwable e) {
                        app.morphe.extension.sabp.EppyDiag.error("settings", "restore failed: " + e);
                        android.widget.Toast.makeText(c, "That file isn't an eppy settings backup", android.widget.Toast.LENGTH_LONG).show();
                    }
                })));
        backup.addView(Ui.linkRow(c, t, EppyIcon.RESET, "Reset eppy settings", "Back to the defaults. Your books, positions, bookmarks and SABP settings stay as they are.",
                v -> new Sheet(host.overlayRoot(), t, "Reset eppy settings?")
                        .item(EppyIcon.RESET, "Reset", "Style, theme, mini-player, feature switches", () -> {
                            app.morphe.extension.sabp.EppySettings.reset(c);
                            host.rebuild();
                        })
                        .item(EppyIcon.CLOSE, "Cancel", null, null)
                        .show()));

        LinearLayout diag = group("Help and bug reports");
        diag.addView(Ui.linkRow(c, t, EppyIcon.CHECK, "Diagnostics", "Hooks, feature switches, storage, errors and an exportable log",
                v -> host.pushPage(DiagnosticsPage.KEY, null)));

        LinearLayout keys = group("Keyboard shortcuts");
        TextView k = Ui.text(c, t,
                "Space or K  Play / pause\nJ or ←  Rewind     L or →  Fast forward\nN  Next file     P  Previous file\nB  Add bookmark     S  Sleep timer on/off\n[ and ]  Slower / faster\nCtrl+F  Search     1–4  Switch tabs     Esc  Back",
                14, 400, t.onSurfaceVariant);
        k.setLineSpacing(Ui.dp(c, 6), 1f);
        k.setPadding(Ui.dp(c, 16), Ui.dp(c, 4), Ui.dp(c, 16), Ui.dp(c, 16));
        keys.addView(k);

        LinearLayout credits = group("Credits and open source");
        credit(credits, "Smart AudioBook Player", "The app this interface runs on. Playback, library, bookmarks and settings are all SABP's own. eppy only adds a new interface on top.");
        credit(credits, "Hooman's Morphe Patches · github.com/arandomhooman/hoomans-morphe-patches",
                "GPL-3.0. eppy is designed to be used together with Hooman's SABP patch, and it's tested on Hooman's SABP 11.7.8 build. Not affiliated with or endorsed by Hooman.");
        credit(credits, "Morphe patches template · github.com/MorpheApp", "GPL-3.0. Project and build setup. eppy patches are for use with Morphe and aren't made by the Morphe project.");
        credit(credits, "Outfit font · github.com/Outfitio/Outfit-Fonts", "© 2021 The Outfit Project Authors · SIL Open Font License 1.1");
        credit(credits, "Plus Jakarta Sans font · github.com/tokotype/PlusJakartaSans", "© 2020 The Plus Jakarta Sans Project Authors · SIL Open Font License 1.1");
        credit(credits, "Storyteller · gitlab.com/storyteller-platform/storyteller",
                "MIT. Not bundled. Read along can use the narration timings (EPUB 3 Media Overlays) in \"readaloud\" EPUBs that Storyteller creates, for exact sync.");
        credit(credits, "Android speech recognition and PdfRenderer", "Built-in Android APIs. They match narration to text and read PDF text on the device. Nothing is uploaded.");

        TextView about = Ui.text(c, t, "eppy · patches for Smart AudioBook Player, for use with Morphe", 12, 400, t.onSurfaceVariant);
        about.setGravity(Gravity.CENTER);
        about.setText("eppy " + EppyTheme.configString(c, "eppy_version", "") + " · patches for Smart AudioBook Player, for use with Morphe");
        final int[] taps = {0};
        about.setOnClickListener(v -> {
            if (++taps[0] >= 5) {
                taps[0] = 0;
                host.pushPage(DiagnosticsPage.KEY, null);
            }
        });
        about.setPadding(0, Ui.dp(c, 24), 0, 0);
        col.addView(about);
    }

    private LinearLayout group(String title) {
        TextView tv = Ui.text(c, t, title, 14, 600, t.primary);
        tv.setAccessibilityHeading(true);
        tv.setPadding(Ui.dp(c, 4), Ui.dp(c, 24), 0, Ui.dp(c, 8));
        col.addView(tv);
        LinearLayout box = Ui.column(c);
        box.setBackground(Ui.rounded(t.surfaceContainer, Ui.dp(c, 24)));
        box.setPadding(0, Ui.dp(c, 8), 0, Ui.dp(c, 8));
        col.addView(box, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return box;
    }

    /** Style cards: a miniature of each reference design (background, accent, card). */
    private View skinPicker() {
        android.widget.HorizontalScrollView hs = new android.widget.HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 12));
        int[][] sw = {
                {0xFF3B3346, 0xFFD0BCFF, 0xFF4A4458},
                {0xFF0E0E10, 0xFFEE6A50, 0xFF222226},
                {0xFF2C2350, 0xFFD5C8FA, 0xFF3A3166},
                {0xFFF5F1FB, 0xFF8B2BE2, 0xFFFFFFFF},
                {0xFFF2ECE3, 0xFFD9493E, 0xFFFBF8F3},
                {0xFFF3F3F3, 0xFFF4C430, 0xFF151515}};
        for (int i = 0; i < EppyTheme.SKINS.length; i++) {
            final String skin = EppyTheme.SKINS[i];
            boolean sel = skin.equals(t.skin);
            LinearLayout card = Ui.column(c);
            card.setGravity(Gravity.CENTER_HORIZONTAL);
            FrameLayout mini = new FrameLayout(c);
            mini.setBackground(Ui.outlined(sw[i][0], sel ? t.primary : t.outlineVariant, Ui.dp(c, sel ? 3 : 1), Ui.dp(c, 16)));
            View cardV = new View(c);
            cardV.setBackground(Ui.rounded(sw[i][2], Ui.dp(c, 6)));
            FrameLayout.LayoutParams cl = new FrameLayout.LayoutParams(Ui.dp(c, 44), Ui.dp(c, 30), Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            cl.topMargin = Ui.dp(c, 12);
            mini.addView(cardV, cl);
            View dot = new View(c);
            android.graphics.drawable.GradientDrawable d = new android.graphics.drawable.GradientDrawable();
            d.setShape(android.graphics.drawable.GradientDrawable.OVAL);
            d.setColor(sw[i][1]);
            dot.setBackground(d);
            FrameLayout.LayoutParams dl = new FrameLayout.LayoutParams(Ui.dp(c, 22), Ui.dp(c, 22), Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            dl.bottomMargin = Ui.dp(c, 10);
            mini.addView(dot, dl);
            card.addView(mini, new LinearLayout.LayoutParams(Ui.dp(c, 76), Ui.dp(c, 96)));
            TextView name = Ui.text(c, t, EppyTheme.SKIN_NAMES[i], 12, sel ? 650 : 500, sel ? t.onSurface : t.onSurfaceVariant);
            name.setPadding(0, Ui.dp(c, 6), 0, 0);
            card.addView(name);
            card.setClickable(true);
            card.setFocusable(true);
            card.setContentDescription(EppyTheme.SKIN_NAMES[i] + " style" + (sel ? ", selected" : ""));
            card.setOnClickListener(v -> {
                Ui.haptic(v, t);
                prefs().edit().putString("skin", skin).apply();
                host.rebuild();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.rightMargin = Ui.dp(c, 10);
            row.addView(card, lp);
        }
        hs.addView(row);
        return hs;
    }

    private View nameField() {
        android.widget.EditText e = new android.widget.EditText(c);
        e.setHint("Your name (for the greeting)");
        e.setText(t.userName);
        e.setSingleLine(true);
        e.setTextColor(t.onSurface);
        e.setHintTextColor(t.onSurfaceVariant);
        e.setTypeface(EppyTheme.font(c, 400));
        e.setBackground(Ui.rounded(t.surfaceContainerHigh, Ui.dp(c, 16)));
        e.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), 0);
        e.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_DONE);
        e.setOnEditorActionListener((v, a, ev) -> {
            prefs().edit().putString("name", v.getText().toString().trim()).apply();
            host.rebuild();
            return true;
        });
        e.setOnFocusChangeListener((v, has) -> {
            if (!has) prefs().edit().putString("name", e.getText().toString().trim()).apply();
        });
        LinearLayout wrap = Ui.column(c);
        wrap.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 8));
        wrap.addView(e, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 52)));
        return wrap;
    }

    /** eppy vs the classic SABP player. The only switch between the two interfaces. */
    private View interfaceChoice() {
        LinearLayout box = Ui.column(c);
        String current = app.morphe.extension.sabp.EppyRoute.playerInterface(c);
        String[] values = {app.morphe.extension.sabp.EppyRoute.INTERFACE_EPPY, app.morphe.extension.sabp.EppyRoute.INTERFACE_CLASSIC};
        String[] names = {"eppy", "Classic SABP player"};
        String[] notes = {"Notification, widgets, library and voice search all open eppy.",
                "Everything opens SABP's original player. Long-press the app icon → \"eppy\" to come back."};
        for (int i = 0; i < 2; i++) {
            final String v = values[i];
            boolean sel = v.equals(current);
            LinearLayout row = Ui.row(c);
            row.setMinimumHeight(Ui.dp(c, 64));
            row.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
            android.widget.RadioButton rb = new android.widget.RadioButton(c);
            rb.setChecked(sel);
            rb.setClickable(false);
            rb.setFocusable(false);
            rb.setButtonTintList(ColorStateList.valueOf(sel ? t.primary : t.outline));
            row.addView(rb);
            LinearLayout texts = Ui.column(c);
            texts.setPadding(Ui.dp(c, 8), 0, 0, 0);
            texts.addView(Ui.label(c, t, names[i], 16, 500, t.onSurface));
            TextView n = Ui.text(c, t, notes[i], 13, 400, t.onSurfaceVariant);
            n.setPadding(0, Ui.dp(c, 4), 0, 0);
            texts.addView(n);
            row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            row.setBackground(Ui.ripple(t, null, 0));
            row.setClickable(true);
            row.setFocusable(true);
            row.setContentDescription(names[i] + (sel ? ", selected" : ""));
            row.setOnClickListener(x -> {
                if (sel) return;
                Ui.haptic(x, t);
                app.morphe.extension.sabp.EppyRoute.setInterface(c, v);
                app.morphe.extension.sabp.EppyDiag.log("route", "player interface set to " + v);
                if (app.morphe.extension.sabp.EppyRoute.INTERFACE_CLASSIC.equals(v)) {
                    host.activity().startActivity(app.morphe.extension.sabp.EppyRoute.classicIntent(c));
                    host.activity().finish();
                } else {
                    host.rebuild();
                }
            });
            box.addView(row);
        }
        return box;
    }

    private void bookInfo(LinearLayout box) {
        android.content.SharedPreferences ip = app.morphe.extension.sabp.info.BookInfo.prefs(c);
        box.addView(switchRow("Online lookups", "Off by default. When on, only the title and author of the book you look up are sent to the providers you enable.",
                app.morphe.extension.sabp.info.BookInfo.onlineEnabled(c), on -> ip.edit().putBoolean("online", on).apply()));
        box.addView(switchRow("Look up automatically", "Fills in a book only when a provider returns one exact title match. Otherwise you choose from candidates.",
                app.morphe.extension.sabp.info.BookInfo.automatic(c), on -> ip.edit().putBoolean("auto", on).apply()));
        java.util.List<app.morphe.extension.sabp.info.BookInfo.Provider> order = app.morphe.extension.sabp.info.BookInfo.ordered(c);
        for (int i = 0; i < order.size(); i++) {
            final app.morphe.extension.sabp.info.BookInfo.Provider p = order.get(i);
            LinearLayout item = Ui.column(c);
            item.setPadding(0, Ui.dp(c, 4), 0, Ui.dp(c, 4));
            item.addView(switchRow((i + 1) + ". " + p.name(), p.about(), app.morphe.extension.sabp.info.BookInfo.providerEnabled(c, p),
                    on -> ip.edit().putBoolean("enabled:" + p.id(), on).apply()));
            LinearLayout actions = Ui.row(c);
            actions.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), 0);
            if (i > 0) actions.addView(Ui.textButton(c, t, "Move up", v -> {
                app.morphe.extension.sabp.info.BookInfo.move(c, p, -1);
                host.rebuild();
            }));
            actions.addView(Ui.textButton(c, t, "Test", v -> testProvider(p)));
            item.addView(actions);
            if (p.needsKey()) {
                android.widget.EditText key = new android.widget.EditText(c);
                key.setHint(p.name() + " API key");
                key.setText(app.morphe.extension.sabp.info.BookInfo.apiKey(c, p));
                key.setSingleLine(true);
                key.setTextColor(t.onSurface);
                key.setHintTextColor(t.onSurfaceVariant);
                key.setBackground(Ui.rounded(t.surfaceContainerHigh, Ui.dp(c, 16)));
                key.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), 0);
                key.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
                key.setOnFocusChangeListener((v, has) -> {
                    if (!has) ip.edit().putString("key:" + p.id(), key.getText().toString().trim()).apply();
                });
                LinearLayout.LayoutParams kl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 48));
                kl.setMargins(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 8));
                item.addView(key, kl);
            }
            box.addView(item);
        }
        TextView spoil = Ui.text(c, t, "Character information: spoiler protection is on. No supported provider offers verified spoiler-free character descriptions, so eppy shows none. Wikipedia/Wikidata and fan wikis were evaluated and left out because they routinely reveal plot.", 13, 400, t.onSurfaceVariant);
        spoil.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
        box.addView(spoil);
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 8));
        row.addView(Ui.textButton(c, t, "Clear cached information", v -> {
            app.morphe.extension.sabp.info.BookInfo.clearCache(c);
            android.widget.Toast.makeText(c, "Cleared", android.widget.Toast.LENGTH_SHORT).show();
        }));
        box.addView(row);
    }

    private void testProvider(app.morphe.extension.sabp.info.BookInfo.Provider p) {
        android.widget.Toast.makeText(c, "Testing " + p.name() + "…", android.widget.Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            String result;
            try {
                if (p.needsKey() && app.morphe.extension.sabp.info.BookInfo.apiKey(c, p).isEmpty()) result = "No API key entered.";
                else result = "Works: " + p.search(c, "Pride and Prejudice", "Austen").size() + " results for a test search.";
            } catch (Throwable e) {
                result = "Failed: " + e.getClass().getSimpleName() + (e.getMessage() != null ? " " + e.getMessage() : "");
            }
            final String r = result;
            root.post(() -> showText(p.name(), r));
        }).start();
    }

    private View switchRow(String title, String summary, boolean value, java.util.function.Consumer<Boolean> onChange) {
        LinearLayout row = Ui.row(c);
        row.setMinimumHeight(Ui.dp(c, 64));
        row.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
        LinearLayout texts = Ui.column(c);
        texts.addView(Ui.label(c, t, title, 16, 500, t.onSurface));
        TextView sm = Ui.text(c, t, summary, 13, 400, t.onSurfaceVariant);
        sm.setPadding(0, Ui.dp(c, 4), 0, 0);
        texts.addView(sm);
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Switch sw = new Switch(c);
        sw.setChecked(value);
        int[][] states = {{android.R.attr.state_checked}, {}};
        sw.setThumbTintList(new ColorStateList(states, new int[]{t.onPrimary, t.outline}));
        sw.setTrackTintList(new ColorStateList(states, new int[]{t.primary, t.surfaceContainerHighest}));
        sw.setContentDescription(title);
        sw.setOnCheckedChangeListener((b, checked) -> {
            Ui.haptic(b, t);
            onChange.accept(checked);
        });
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        row.setBackground(Ui.ripple(t, null, 0));
        return row;
    }

    private static String firstLines(String s, int n) {
        String[] lines = s.split("\n");
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < Math.min(n, lines.length); i++) b.append(i > 0 ? " · " : "").append(lines[i].trim());
        return b.toString();
    }

    private void copy(String label, String text) {
        android.content.ClipboardManager cm = (android.content.ClipboardManager) c.getSystemService(Context.CLIPBOARD_SERVICE);
        if (cm != null) cm.setPrimaryClip(android.content.ClipData.newPlainText(label, text));
        android.widget.Toast.makeText(c, "Copied. Paste it into your bug report.", android.widget.Toast.LENGTH_SHORT).show();
    }

    private void showText(String title, String body) {
        Sheet sh = new Sheet(host.overlayRoot(), t, title);
        TextView tv = Ui.text(c, t, body, 13, 400, t.onSurface);
        tv.setTypeface(android.graphics.Typeface.MONOSPACE);
        tv.setTextIsSelectable(true);
        tv.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 16));
        sh.content().addView(tv);
        sh.item(EppyIcon.LIST, "Copy", null, () -> copy(title, body));
        sh.show();
    }

    private void credit(LinearLayout box, String title, String body) {
        LinearLayout item = Ui.column(c);
        item.setPadding(Ui.dp(c, 16), Ui.dp(c, 10), Ui.dp(c, 16), Ui.dp(c, 10));
        item.addView(Ui.text(c, t, title, 14, 600, t.onSurface));
        TextView b = Ui.text(c, t, body, 13, 400, t.onSurfaceVariant);
        b.setPadding(0, Ui.dp(c, 4), 0, 0);
        b.setLineSpacing(Ui.dp(c, 2), 1f);
        item.addView(b);
        item.setFocusable(true);
        item.setContentDescription(title + ". " + body);
        box.addView(item);
    }

    private TextView label(String s) {
        TextView tv = Ui.text(c, t, s, 16, 500, t.onSurface);
        tv.setPadding(Ui.dp(c, 16), Ui.dp(c, 12), Ui.dp(c, 16), Ui.dp(c, 8));
        return tv;
    }

    private View segmented(String[] labels, String[] values, String current, String key) {
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 8));
        float r = Ui.dp(c, 20);
        for (int i = 0; i < labels.length; i++) {
            final String value = values[i];
            boolean sel = value.equals(current);
            TextView seg = Ui.text(c, t, labels[i], 13, sel ? 600 : 500, sel ? t.onSecondaryContainer : t.onSurface);
            seg.setGravity(Gravity.CENTER);
            seg.setMaxLines(1);
            android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable();
            bg.setColor(sel ? t.secondaryContainer : 0);
            bg.setStroke(Ui.dp(c, 1), t.outline);
            float left = i == 0 ? r : 0, right = i == labels.length - 1 ? r : 0;
            bg.setCornerRadii(new float[]{left, left, right, right, right, right, left, left});
            seg.setBackground(Ui.ripple(t, bg, 0));
            seg.setClickable(true);
            seg.setFocusable(true);
            seg.setContentDescription(labels[i] + (sel ? ", selected" : ""));
            seg.setOnClickListener(v -> {
                Ui.haptic(v, t);
                prefs().edit().putString(key, value).apply();
                host.rebuild();
            });
            LinearLayout.LayoutParams lp = Ui.lp(0, Ui.dp(c, 44), 1);
            if (i > 0) lp.leftMargin = -Ui.dp(c, 1);
            row.addView(seg, lp);
        }
        return row;
    }

    private View swatches() {
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 16), Ui.dp(c, 4), Ui.dp(c, 16), Ui.dp(c, 12));
        int current = t.customSeed;
        for (int seed : SEEDS) {
            FrameLayout sw = new FrameLayout(c);
            android.graphics.drawable.GradientDrawable d = new android.graphics.drawable.GradientDrawable();
            d.setShape(android.graphics.drawable.GradientDrawable.OVAL);
            d.setColor(seed);
            if ((seed | 0xFF000000) == (current | 0xFF000000)) d.setStroke(Ui.dp(c, 3), t.onSurface);
            sw.setBackground(d);
            sw.setClickable(true);
            sw.setFocusable(true);
            sw.setContentDescription(String.format("Accent colour #%06X", seed & 0xFFFFFF));
            sw.setOnClickListener(v -> {
                Ui.haptic(v, t);
                prefs().edit().putInt("seed", seed).putString("accent", EppyTheme.ACCENT_CUSTOM).apply();
                host.rebuild();
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Ui.dp(c, 36), Ui.dp(c, 36));
            lp.rightMargin = Ui.dp(c, 10);
            row.addView(sw, lp);
        }
        return row;
    }

    private View toggle(String title, String summary, String key, boolean value) {
        LinearLayout row = Ui.row(c);
        row.setMinimumHeight(Ui.dp(c, 64));
        row.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
        LinearLayout texts = Ui.column(c);
        texts.addView(Ui.text(c, t, title, 16, 500, t.onSurface));
        TextView s = Ui.text(c, t, summary, 13, 400, t.onSurfaceVariant);
        s.setPadding(0, Ui.dp(c, 4), 0, 0);
        texts.addView(s);
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Switch sw = new Switch(c);
        sw.setChecked(value);
        int[][] states = {{android.R.attr.state_checked}, {}};
        sw.setThumbTintList(new ColorStateList(states, new int[]{t.onPrimary, t.outline}));
        sw.setTrackTintList(new ColorStateList(states, new int[]{t.primary, t.surfaceContainerHighest}));
        sw.setContentDescription(title);
        sw.setOnCheckedChangeListener((b, checked) -> {
            Ui.haptic(b, t);
            prefs().edit().putBoolean(key, checked).apply();
            host.rebuild();
        });
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        row.setBackground(Ui.ripple(t, null, 0));
        return row;
    }

    private View link(int icon, String title, String summary, String activity) {
        LinearLayout row = Ui.row(c);
        row.setMinimumHeight(Ui.dp(c, 64));
        row.setPadding(Ui.dp(c, 16), Ui.dp(c, 8), Ui.dp(c, 16), Ui.dp(c, 8));
        ImageView iv = new ImageView(c);
        iv.setImageDrawable(new EppyIcon(icon, t.onSurfaceVariant));
        LinearLayout.LayoutParams il = new LinearLayout.LayoutParams(Ui.dp(c, 24), Ui.dp(c, 24));
        il.rightMargin = Ui.dp(c, 16);
        row.addView(iv, il);
        LinearLayout texts = Ui.column(c);
        texts.addView(Ui.text(c, t, title, 16, 500, t.onSurface));
        TextView s = Ui.text(c, t, summary, 13, 400, t.onSurfaceVariant);
        s.setPadding(0, Ui.dp(c, 4), 0, 0);
        texts.addView(s);
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.setBackground(Ui.ripple(t, null, 0));
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(title);
        row.setOnClickListener(v -> host.openSabp(activity));
        return row;
    }
}
