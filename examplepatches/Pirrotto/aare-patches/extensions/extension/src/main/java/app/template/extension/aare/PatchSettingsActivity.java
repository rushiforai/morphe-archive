package app.template.extension.aare;

import android.Manifest;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * The "Settings" screen of the patches, drawn with plain views as a copy of AARE's own pages
 * (MainActivity's Section, AppGroup, AppRow and Material 3 Switch): same palette, sizes and spacing.
 */
public final class PatchSettingsActivity extends Activity {

    /** AARE's palette (net.prototux.aare.ui.theme.AareTheme), night and day. */
    private static final class Palette {
        final int background, surfaceContainer, surfaceContainerHighest, onSurface, onSurfaceVariant;
        final int primary, onPrimary, primaryContainer, onPrimaryContainer, outline;

        Palette(boolean night) {
            if (night) {
                background = 0xFF0B0F0F;
                surfaceContainer = 0xFF161D1C;
                surfaceContainerHighest = 0xFF26302E;
                onSurface = 0xFFE3E9E7;
                onSurfaceVariant = 0xFFAFBAB7;
                primary = 0xFF3DDBC6;
                onPrimary = 0xFF00201C;
                primaryContainer = 0xFF0E3B36;
                onPrimaryContainer = 0xFFB9F5EA;
                outline = 0xFF5E6B68;
            } else {
                background = 0xFFF3F7F6;
                surfaceContainer = 0xFFE6ECEA;
                surfaceContainerHighest = 0xFFD9E1DF;
                onSurface = 0xFF161D1C;
                onSurfaceVariant = 0xFF3F4947;
                primary = 0xFF00695C;
                onPrimary = 0xFFFFFFFF;
                primaryContainer = 0xFFB9F5EA;
                onPrimaryContainer = 0xFF00201C;
                outline = 0xFF6F7977;
            }
        }
    }

    /** Material 3 type scale: size in sp, letter spacing in sp, medium weight. */
    private enum Type {
        TITLE_LARGE(22, 0f, false),
        TITLE_MEDIUM(16, 0.15f, true),
        LABEL_LARGE(14, 0.1f, true),
        BODY_LARGE(16, 0.5f, false),
        BODY_SMALL(12, 0.4f, false);

        final int sp;
        final float tracking;
        final boolean medium;

        Type(int sp, float tracking, boolean medium) {
            this.sp = sp;
            this.tracking = tracking;
            this.medium = medium;
        }
    }

    private Palette colors;
    private final List<Runnable> refreshers = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        boolean night = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        colors = new Palette(night);

        Window window = getWindow();
        window.getDecorView().setBackgroundColor(colors.background);
        if (Build.VERSION.SDK_INT < 35) {
            window.setStatusBarColor(colors.background);
            window.setNavigationBarColor(colors.background);
        }
        if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
            int light = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
            window.getInsetsController().setSystemBarsAppearance(night ? 0 : light, light);
        }

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(colors.background);
        page.setOnApplyWindowInsetsListener((v, insets) -> {
            int top, bottom, left, right;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                top = bars.top;
                bottom = bars.bottom;
                left = bars.left;
                right = bars.right;
            } else {
                top = insets.getSystemWindowInsetTop();
                bottom = insets.getSystemWindowInsetBottom();
                left = insets.getSystemWindowInsetLeft();
                right = insets.getSystemWindowInsetRight();
            }
            v.setPadding(left, top, right, bottom);
            return insets;
        });

        page.addView(topBar());

        ScrollView scroll = new ScrollView(this);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(20), 0, dp(20), dp(24));
        scroll.addView(content, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        content.addView(section());
        for (PatchSettings.Feature f : PatchSettings.features()) {
            if (PatchSettings.AARE_ASSISTANT.equals(f.key)) {
                LinearLayout.LayoutParams params = wrap();
                params.topMargin = dp(16);
                content.addView(assistantSection(), params);
            }
            if (PatchSettings.INTEGRATED_SHIZUKU.equals(f.key)) {
                LinearLayout.LayoutParams params = wrap();
                params.topMargin = dp(16);
                content.addView(shizukuSection(), params);
            }
        }

        setContentView(page);
    }

    @Override
    protected void onResume() {
        super.onResume();
        // The location permission may have changed in the system settings.
        for (Runnable r : refreshers) r.run();
    }

    /** Back arrow and title, as at the top of AARE's pages. */
    private View topBar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(8), dp(8), dp(8), dp(8));

        ImageView back = new ImageView(this);
        back.setImageDrawable(new ArrowBack(colors.onSurface, dp(24)));
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setContentDescription(PatchSettings.phrase("Back", "Indietro"));
        back.setBackground(new RippleDrawable(ColorStateList.valueOf(withAlpha(colors.onSurface, 0x1F)), null, oval(0xFFFFFFFF)));
        back.setOnClickListener(v -> finish());
        bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));

        TextView title = text("Settings", Type.TITLE_LARGE, colors.onSurface);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleParams.leftMargin = dp(8);
        bar.addView(title, titleParams);
        return bar;
    }

    /** One card like AARE's Section: title, hint, a group label and the rows. */
    private View section() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(colors.surfaceContainer);
        shape.setCornerRadius(dp(24));
        card.setBackground(shape);
        card.setClipToOutline(true);
        card.setPadding(dp(20), dp(20), dp(20), dp(20));

        card.addView(text(PatchSettings.phrase("Morphe patches", "Patch Morphe"), Type.TITLE_MEDIUM, colors.onSurface));
        TextView hint = text(PatchSettings.phrase(
                "Turn off the features you don't want in the car. Each new release of the patches adds its own here.",
                "Disattiva le funzioni che non vuoi in auto. Ogni nuova release delle patch aggiunge qui le sue."),
                Type.BODY_SMALL, colors.onSurfaceVariant);
        LinearLayout.LayoutParams hintParams = wrap();
        hintParams.topMargin = dp(8);
        card.addView(hint, hintParams);

        TextView group = text(PatchSettings.phrase("Installed patches", "Patch installate"), Type.LABEL_LARGE, colors.primary);
        LinearLayout.LayoutParams groupParams = wrap();
        groupParams.topMargin = dp(16);
        groupParams.bottomMargin = dp(4);
        card.addView(group, groupParams);

        List<PatchSettings.Feature> features = PatchSettings.features();
        if (features.isEmpty()) {
            card.addView(text(PatchSettings.phrase("No patch with settings is installed.",
                    "Nessuna patch con impostazioni installata."), Type.BODY_SMALL, colors.onSurfaceVariant));
        }
        for (PatchSettings.Feature f : features) card.addView(row(f));
        return card;
    }

    /** A row like AARE's AppRow: round icon, title and kind, switch. */
    private View row(PatchSettings.Feature feature) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(8), 0, dp(8));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(withAlpha(colors.onSurface, 0x1F)), null, null));

        ImageView icon = new ImageView(this);
        icon.setImageDrawable(new RoundIcon(feature.icon, colors.primaryContainer, colors.onPrimaryContainer, dp(40), dp(24)));
        row.addView(icon, new LinearLayout.LayoutParams(dp(40), dp(40)));

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(text(feature.title, Type.BODY_LARGE, colors.onSurface));
        texts.addView(text(feature.summary, Type.BODY_SMALL, colors.onSurfaceVariant));
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textParams.leftMargin = dp(12);
        textParams.rightMargin = dp(12);
        row.addView(texts, textParams);

        M3Switch toggle = new M3Switch(this, colors);
        row.addView(toggle, new LinearLayout.LayoutParams(dp(52), dp(32)));

        if (feature.permission) {
            // Android grants this one: the switch shows it, and the row opens the permission.
            Runnable refresh = () -> toggle.setChecked(
                    checkSelfPermission(Manifest.permission.ACCESS_BACKGROUND_LOCATION) == PackageManager.PERMISSION_GRANTED, false);
            refreshers.add(refresh);
            refresh.run();
            row.setOnClickListener(v -> openAppSettings());
        } else {
            toggle.setChecked(PatchSettings.isEnabled(this, feature.key), false);
            row.setOnClickListener(v -> {
                boolean on = !toggle.isChecked();
                toggle.setChecked(on, true);
                PatchSettings.setEnabled(this, feature.key, on);
            });
        }
        toggle.setOnClickListener(v -> row.performClick());
        return row;
    }

    // region AARE assistant

    private static final String[] LANGUAGES = {"auto", "it", "de", "en"};

    private String languageName(String code) {
        switch (code) {
            case "it":
                return "Italiano";
            case "de":
                return "Deutsch";
            case "en":
                return "English";
            default:
                return PatchSettings.phrase("Same as the phone", "Come il telefono");
        }
    }

    /** The assistant's card: its language (the words it understands, its voice and answers). */
    private View assistantSection() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(colors.surfaceContainer);
        shape.setCornerRadius(dp(24));
        card.setBackground(shape);
        card.setClipToOutline(true);
        card.setPadding(dp(20), dp(20), dp(20), dp(20));

        card.addView(text(PatchSettings.phrase("AARE assistant", "Assistente AARE"), Type.TITLE_MEDIUM, colors.onSurface));
        TextView hint = text(PatchSettings.phrase(
                "The language you speak to it. Speech recognition works offline once Android's offline speech for that "
                        + "language is downloaded (Settings > System > Languages > Speech > On-device recognition).",
                "La lingua in cui gli parli. Il riconoscimento funziona anche offline dopo aver scaricato la lingua "
                        + "(Impostazioni > Sistema > Lingue > Voce > Riconoscimento sul dispositivo)."),
                Type.BODY_SMALL, colors.onSurfaceVariant);
        LinearLayout.LayoutParams hintParams = wrap();
        hintParams.topMargin = dp(8);
        hintParams.bottomMargin = dp(8);
        card.addView(hint, hintParams);

        TextView[] texts = new TextView[2];
        card.addView(actionRow(PatchSettings.ICON_ASSISTANT, PatchSettings.phrase("Language", "Lingua"), "", v -> {
            String current = PatchSettings.assistantLanguage();
            int i = java.util.Arrays.asList(LANGUAGES).indexOf(current);
            String next = LANGUAGES[(i + 1) % LANGUAGES.length];
            PatchSettings.setAssistantLanguage(this, next);
            texts[1].setText(languageName(next));
        }, texts));
        texts[1].setText(languageName(PatchSettings.assistantLanguage()));
        return card;
    }

    // endregion

    // region Integrated Shizuku

    /** The card of AARE's integrated Shizuku: state, pairing, start/stop and start after a restart. */
    private View shizukuSection() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(colors.surfaceContainer);
        shape.setCornerRadius(dp(24));
        card.setBackground(shape);
        card.setClipToOutline(true);
        card.setPadding(dp(20), dp(20), dp(20), dp(20));

        card.addView(text(PatchSettings.phrase("Integrated Shizuku", "Shizuku integrato"), Type.TITLE_MEDIUM, colors.onSurface));
        TextView hint = text(PatchSettings.phrase(
                "AARE starts its own Shizuku through wireless debugging: no Shizuku app needed. Pair once; then AARE "
                        + "starts it by itself after a restart and when the car connects, on any Wi-Fi (the car's too).",
                "AARE avvia il suo Shizuku tramite il debug wireless: l'app Shizuku non serve. Accoppia una volta; "
                        + "poi AARE lo avvia da sola dopo un riavvio e quando ti colleghi all'auto, con qualsiasi Wi-Fi "
                        + "(anche quello dell'auto)."),
                Type.BODY_SMALL, colors.onSurfaceVariant);
        LinearLayout.LayoutParams hintParams = wrap();
        hintParams.topMargin = dp(8);
        card.addView(hint, hintParams);

        TextView group = text(PatchSettings.phrase("State", "Stato"), Type.LABEL_LARGE, colors.primary);
        LinearLayout.LayoutParams groupParams = wrap();
        groupParams.topMargin = dp(16);
        groupParams.bottomMargin = dp(4);
        card.addView(group, groupParams);

        TextView[] status = new TextView[2];
        card.addView(actionRow(PatchSettings.ICON_DEVELOPER, "", "", null, status));
        status[1].setTextIsSelectable(true); // the last error can be copied

        TextView[] pairTexts = new TextView[2];
        card.addView(actionRow(PatchSettings.ICON_LINK,
                PatchSettings.phrase("Pair with wireless debugging", "Accoppia col debug wireless"),
                PatchSettings.phrase("Once. Opens Wireless debugging: tap \"Pair device with pairing code\", then type the "
                                + "code in AARE's notification.",
                        "Una volta sola. Apre il Debug wireless: tocca «Associa dispositivo con codice di accoppiamento», "
                                + "poi scrivi il codice nella notifica di AARE."),
                v -> startPairing(), pairTexts));

        TextView[] startTexts = new TextView[2];
        ImageView[] startIcon = new ImageView[1];
        View startRow = actionRow(PatchSettings.ICON_PLAY, "", "", v -> {
            if (app.template.extension.aare.adb.IntegratedShizuku.isRunning()) {
                app.template.extension.aare.adb.IntegratedShizuku.stop();
                v.postDelayed(this::refreshAll, 800);
            } else {
                askRuntimePermissions();
                app.template.extension.aare.adb.IntegratedShizukuService.start(this);
            }
        }, startTexts);
        startIcon[0] = (ImageView) ((LinearLayout) startRow).getChildAt(0);
        card.addView(startRow);

        TextView[] diagTexts = new TextView[2];
        card.addView(actionRow(PatchSettings.ICON_DEVELOPER,
                PatchSettings.phrase("Copy diagnostics", "Copia diagnostica"),
                PatchSettings.phrase("Copies the state and messages of integrated Shizuku, to paste in a chat or an issue.",
                        "Copia stato e messaggi di Shizuku integrato, da incollare in chat o in una segnalazione."),
                v -> new Thread(() -> {
                    String report = app.template.extension.aare.adb.IntegratedShizuku.diagnostics(this);
                    runOnUiThread(() -> {
                        android.content.ClipboardManager clip = getSystemService(android.content.ClipboardManager.class);
                        clip.setPrimaryClip(android.content.ClipData.newPlainText("AARE diagnostics", report));
                        android.widget.Toast.makeText(this, PatchSettings.phrase("Diagnostics copied.", "Diagnostica copiata."),
                                android.widget.Toast.LENGTH_SHORT).show();
                    });
                }).start(), diagTexts));

        PatchSettings.Feature auto = new PatchSettings.Feature("integrated_shizuku_auto_start",
                PatchSettings.phrase("Start by itself", "Avvio automatico"),
                PatchSettings.phrase("After a restart and when the car connects, as soon as the phone is on Wi-Fi.",
                        "Dopo un riavvio e quando ti colleghi all'auto, appena il telefono è sul Wi-Fi."),
                false, PatchSettings.ICON_PLAY);
        View autoRow = row(auto);
        M3Switch autoSwitch = (M3Switch) ((LinearLayout) autoRow).getChildAt(2);
        autoSwitch.setChecked(app.template.extension.aare.adb.IntegratedShizuku.autoStart(this), false);
        autoRow.setOnClickListener(v -> {
            boolean on = !autoSwitch.isChecked();
            autoSwitch.setChecked(on, true);
            app.template.extension.aare.adb.IntegratedShizuku.setAutoStart(this, on);
        });
        card.addView(autoRow);

        Runnable refresh = () -> {
            boolean paired = app.template.extension.aare.adb.IntegratedShizuku.isPaired(this);
            boolean ours = app.template.extension.aare.adb.IntegratedShizuku.isRunning();
            boolean other = !ours && app.template.extension.aare.adb.IntegratedShizuku.anyShizukuRunning();
            status[0].setText(ours ? PatchSettings.phrase("Running", "Attivo")
                    : other ? PatchSettings.phrase("The Shizuku app is running", "È attiva l'app Shizuku")
                    : paired ? PatchSettings.phrase("Not running", "Non attivo")
                    : PatchSettings.phrase("Not paired yet", "Non ancora accoppiato"));
            status[1].setText(ours ? PatchSettings.phrase("AARE's car audio and voice messages use it now.",
                    "Audio in auto e vocali di AARE lo usano adesso.")
                    : other ? PatchSettings.phrase("AARE uses the Shizuku app; the integrated one isn't needed while it runs.",
                    "AARE usa l'app Shizuku; quello integrato non serve finché è attiva.")
                    : paired ? PatchSettings.phrase("Tap Start, or it starts by itself after the next restart.",
                    "Tocca Avvia, oppure parte da solo al prossimo riavvio.")
                    + (app.template.extension.aare.adb.IntegratedShizuku.lastError(this) != null
                    ? "\n" + PatchSettings.phrase("Last error: ", "Ultimo errore: ")
                    + app.template.extension.aare.adb.IntegratedShizuku.lastError(this) : "")
                    : PatchSettings.phrase("Pair it once, below.", "Accoppialo una volta, qui sotto."));
            pairTexts[0].setText(paired ? PatchSettings.phrase("Pair again", "Accoppia di nuovo")
                    : PatchSettings.phrase("Pair with wireless debugging", "Accoppia col debug wireless"));
            startTexts[0].setText(ours ? PatchSettings.phrase("Stop", "Ferma") : PatchSettings.phrase("Start", "Avvia"));
            startTexts[1].setText(ours ? PatchSettings.phrase("Car audio falls back to screen capture until the next start.",
                    "L'audio in auto torna alla cattura schermo fino al prossimo avvio.")
                    : PatchSettings.phrase("Needs Wi-Fi. Wireless debugging is switched on just for the start.",
                    "Serve il Wi-Fi. Il debug wireless si accende solo per l'avvio."));
            startIcon[0].setImageDrawable(new RoundIcon(ours ? PatchSettings.ICON_STOP : PatchSettings.ICON_PLAY,
                    colors.primaryContainer, colors.onPrimaryContainer, dp(40), dp(24)));
        };
        refreshers.add(refresh);
        refresh.run();
        return card;
    }

    private void refreshAll() {
        for (Runnable r : refreshers) r.run();
    }

    /** A row like AppRow with a chevron instead of the switch; texts[0..1] get the title and subtitle views. */
    private View actionRow(String icon, String title, String subtitle, View.OnClickListener onClick, TextView[] texts) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(8), 0, dp(8));
        if (onClick != null) {
            row.setBackground(new RippleDrawable(ColorStateList.valueOf(withAlpha(colors.onSurface, 0x1F)), null, null));
            row.setOnClickListener(onClick);
        }

        ImageView iconView = new ImageView(this);
        iconView.setImageDrawable(new RoundIcon(icon, colors.primaryContainer, colors.onPrimaryContainer, dp(40), dp(24)));
        row.addView(iconView, new LinearLayout.LayoutParams(dp(40), dp(40)));

        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        texts[0] = text(title, Type.BODY_LARGE, colors.onSurface);
        texts[1] = text(subtitle, Type.BODY_SMALL, colors.onSurfaceVariant);
        column.addView(texts[0]);
        column.addView(texts[1]);
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        p.leftMargin = dp(12);
        row.addView(column, p);

        if (onClick != null) {
            ImageView chevron = new ImageView(this);
            chevron.setImageDrawable(new RoundIcon("M10,6L8.59,7.41 13.17,12l-4.58,4.59L10,18l6,-6z", 0x00000000,
                    colors.onSurfaceVariant, dp(24), dp(24)));
            row.addView(chevron, new LinearLayout.LayoutParams(dp(24), dp(24)));
        }
        return row;
    }

    private void startPairing() {
        askRuntimePermissions();
        // Some phones don't report Developer options as on even when they are: just try to open them.
        app.template.extension.aare.adb.IntegratedShizukuService.pair(this);
        Intent wireless = new Intent(Settings.ACTION_APPLICATION_DEVELOPMENT_SETTINGS)
                .putExtra(":settings:fragment_args_key", "toggle_adb_wireless");
        Bundle args = new Bundle();
        args.putString(":settings:fragment_args_key", "toggle_adb_wireless");
        wireless.putExtra(":settings:show_fragment_args", args);
        try {
            startActivity(wireless.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (Throwable t) {
            // No Developer options yet: they appear after tapping "Build number" seven times.
            android.widget.Toast.makeText(this, PatchSettings.phrase(
                    "Turn on Developer options first: tap \"Build number\" seven times.",
                    "Prima attiva le Opzioni sviluppatore: tocca sette volte «Numero build»."), android.widget.Toast.LENGTH_LONG).show();
            try {
                startActivity(new Intent(Settings.ACTION_DEVICE_INFO_SETTINGS));
            } catch (Throwable ignored) {
            }
            return;
        }
        android.widget.Toast.makeText(this, PatchSettings.phrase(
                "Turn on Wireless debugging, tap \"Pair device with pairing code\" and type the code in AARE's notification.",
                "Attiva il Debug wireless, tocca «Associa dispositivo con codice di accoppiamento» e scrivi il codice nella "
                        + "notifica di AARE."), android.widget.Toast.LENGTH_LONG).show();
    }

    /** Notifications for the pairing code, and local-network access for finding wireless debugging. */
    private void askRuntimePermissions() {
        List<String> wanted = new ArrayList<>();
        if (Build.VERSION.SDK_INT >= 33) {
            wanted.add(Manifest.permission.POST_NOTIFICATIONS);
            wanted.add(Manifest.permission.NEARBY_WIFI_DEVICES);
        }
        wanted.add("android.permission.ACCESS_LOCAL_NETWORK");
        List<String> missing = new ArrayList<>();
        for (String p : wanted) {
            try {
                String[] declared = getPackageManager().getPackageInfo(getPackageName(), PackageManager.GET_PERMISSIONS).requestedPermissions;
                boolean isDeclared = false;
                if (declared != null) for (String d : declared) if (d.equals(p)) isDeclared = true;
                if (isDeclared && checkSelfPermission(p) != PackageManager.PERMISSION_GRANTED) missing.add(p);
            } catch (Throwable ignored) {
            }
        }
        if (!missing.isEmpty()) requestPermissions(missing.toArray(new String[0]), 7);
    }

    // endregion

    private void openAppSettings() {
        try {
            startActivity(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.fromParts("package", getPackageName(), null)));
        } catch (Throwable ignored) {
        }
    }

    // region Helpers

    private TextView text(String value, Type type, int color) {
        TextView t = new TextView(this);
        t.setText(value);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, type.sp);
        t.setLetterSpacing(type.tracking / type.sp);
        t.setTextColor(color);
        t.setIncludeFontPadding(true);
        t.setTypeface(Typeface.create(type.medium ? "sans-serif-medium" : "sans-serif", Typeface.NORMAL));
        return t;
    }

    private static LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    private static Drawable oval(int color) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        d.setColor(color);
        return d;
    }

    // endregion

    // region Drawing

    /** Material 3 Switch: 52 x 32 dp track, 16 dp thumb off with an outline, 24 dp thumb on. */
    private static final class M3Switch extends View {
        private final Palette colors;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private boolean checked;
        /** 0 off, 1 on. */
        private float position;
        private ValueAnimator animator;

        M3Switch(Context context, Palette colors) {
            super(context);
            this.colors = colors;
            setClickable(true);
        }

        boolean isChecked() {
            return checked;
        }

        void setChecked(boolean value, boolean animate) {
            checked = value;
            if (animator != null) animator.cancel();
            float target = value ? 1f : 0f;
            if (!animate) {
                position = target;
                invalidate();
                return;
            }
            animator = ValueAnimator.ofFloat(position, target);
            animator.setDuration(150);
            animator.addUpdateListener(a -> {
                position = (float) a.getAnimatedValue();
                invalidate();
            });
            animator.start();
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float d = getResources().getDisplayMetrics().density;
            float w = getWidth(), h = getHeight();
            float radius = h / 2f;

            // Track.
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(blend(colors.surfaceContainerHighest, colors.primary, position));
            rect.set(0, 0, w, h);
            canvas.drawRoundRect(rect, radius, radius, paint);
            if (position < 1f) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(2 * d);
                paint.setColor(withAlpha(colors.outline, Math.round(255 * (1f - position))));
                rect.set(d, d, w - d, h - d);
                canvas.drawRoundRect(rect, radius - d, radius - d, paint);
            }

            // Thumb.
            float thumb = (16 + 8 * position) * d / 2f;
            float cx = radius + (w - 2 * radius) * position;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(blend(colors.outline, colors.onPrimary, position));
            canvas.drawCircle(cx, h / 2f, thumb, paint);
        }

        private static int blend(int from, int to, float t) {
            int a = Math.round(((from >>> 24) & 0xFF) + ((((to >>> 24) & 0xFF) - ((from >>> 24) & 0xFF)) * t));
            int r = Math.round(((from >> 16) & 0xFF) + ((((to >> 16) & 0xFF) - ((from >> 16) & 0xFF)) * t));
            int g = Math.round(((from >> 8) & 0xFF) + ((((to >> 8) & 0xFF) - ((from >> 8) & 0xFF)) * t));
            int b = Math.round((from & 0xFF) + (((to & 0xFF) - (from & 0xFF)) * t));
            return (a << 24) | (r << 16) | (g << 8) | b;
        }
    }

    /** A 40 dp circle in primaryContainer with a 24 dp Material icon, like AARE's app rows without an icon. */
    private static class RoundIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path glyph;
        private final int background, foreground, size, glyphSize;

        RoundIcon(String pathData, int background, int foreground, int size, int glyphSize) {
            this.glyph = SvgPath.parse(pathData);
            this.background = background;
            this.foreground = foreground;
            this.size = size;
            this.glyphSize = glyphSize;
        }

        @Override
        public void draw(Canvas canvas) {
            float cx = getBounds().exactCenterX(), cy = getBounds().exactCenterY();
            paint.setColor(background);
            canvas.drawCircle(cx, cy, Math.min(getBounds().width(), getBounds().height()) / 2f, paint);
            if (glyph == null) return;
            Path p = new Path(glyph);
            Matrix m = new Matrix();
            float scale = glyphSize / 24f;
            m.setScale(scale, scale);
            m.postTranslate(cx - glyphSize / 2f, cy - glyphSize / 2f);
            p.transform(m);
            paint.setColor(foreground);
            canvas.drawPath(p, paint);
        }

        @Override
        public int getIntrinsicWidth() {
            return size;
        }

        @Override
        public int getIntrinsicHeight() {
            return size;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Material's rounded "arrow back", as in AARE's top bar. */
    private static final class ArrowBack extends RoundIcon {
        ArrowBack(int color, int size) {
            super("M19,11H7.83l4.88,-4.88c0.39,-0.39 0.39,-1.03 0,-1.42 -0.39,-0.39 -1.02,-0.39 -1.41,0l-6.59,6.59"
                    + "c-0.39,0.39 -0.39,1.02 0,1.41l6.59,6.59c0.39,0.39 1.02,0.39 1.41,0 0.39,-0.39 0.39,-1.02 0,-1.41L7.83,13H19"
                    + "c0.55,0 1,-0.45 1,-1s-0.45,-1 -1,-1z", 0x00000000, color, size, size);
        }
    }

    /** The subset of SVG path data that Material icons use without arcs: M L H V C S Q T Z. */
    private static final class SvgPath {
        private final String s;
        private int i;

        private SvgPath(String s) {
            this.s = s;
        }

        static Path parse(String data) {
            try {
                return new SvgPath(data).run();
            } catch (Throwable t) {
                return null;
            }
        }

        private Path run() {
            Path p = new Path();
            float x = 0, y = 0, startX = 0, startY = 0, lastCx = 0, lastCy = 0;
            char cmd = 0, prev = 0;
            while (true) {
                skip();
                if (i >= s.length()) break;
                char c = s.charAt(i);
                if (Character.isLetter(c)) {
                    cmd = c;
                    i++;
                } else if (cmd == 'M') {
                    cmd = 'L';
                } else if (cmd == 'm') {
                    cmd = 'l';
                }
                boolean rel = Character.isLowerCase(cmd);
                float ox = rel ? x : 0, oy = rel ? y : 0;
                switch (Character.toUpperCase(cmd)) {
                    case 'M':
                        x = ox + num();
                        y = oy + num();
                        p.moveTo(x, y);
                        startX = x;
                        startY = y;
                        break;
                    case 'L':
                        x = ox + num();
                        y = oy + num();
                        p.lineTo(x, y);
                        break;
                    case 'H':
                        x = ox + num();
                        p.lineTo(x, y);
                        break;
                    case 'V':
                        y = oy + num();
                        p.lineTo(x, y);
                        break;
                    case 'C': {
                        float x1 = ox + num(), y1 = oy + num(), x2 = ox + num(), y2 = oy + num();
                        x = ox + num();
                        y = oy + num();
                        p.cubicTo(x1, y1, x2, y2, x, y);
                        lastCx = x2;
                        lastCy = y2;
                        break;
                    }
                    case 'S': {
                        boolean smooth = "CcSs".indexOf(prev) >= 0;
                        float x1 = smooth ? 2 * x - lastCx : x, y1 = smooth ? 2 * y - lastCy : y;
                        float x2 = ox + num(), y2 = oy + num();
                        x = ox + num();
                        y = oy + num();
                        p.cubicTo(x1, y1, x2, y2, x, y);
                        lastCx = x2;
                        lastCy = y2;
                        break;
                    }
                    case 'Q': {
                        float x1 = ox + num(), y1 = oy + num();
                        x = ox + num();
                        y = oy + num();
                        p.quadTo(x1, y1, x, y);
                        lastCx = x1;
                        lastCy = y1;
                        break;
                    }
                    case 'T': {
                        boolean smooth = "QqTt".indexOf(prev) >= 0;
                        float x1 = smooth ? 2 * x - lastCx : x, y1 = smooth ? 2 * y - lastCy : y;
                        x = ox + num();
                        y = oy + num();
                        p.quadTo(x1, y1, x, y);
                        lastCx = x1;
                        lastCy = y1;
                        break;
                    }
                    case 'Z':
                        p.close();
                        x = startX;
                        y = startY;
                        break;
                    default:
                        throw new IllegalArgumentException("Unsupported path command " + cmd);
                }
                prev = cmd;
            }
            return p;
        }

        private void skip() {
            while (i < s.length() && (s.charAt(i) == ',' || Character.isWhitespace(s.charAt(i)))) i++;
        }

        private float num() {
            skip();
            int start = i;
            if (i < s.length() && (s.charAt(i) == '-' || s.charAt(i) == '+')) i++;
            boolean dot = false;
            while (i < s.length()) {
                char c = s.charAt(i);
                if (Character.isDigit(c)) {
                    i++;
                } else if (c == '.' && !dot) {
                    dot = true;
                    i++;
                } else if ((c == 'e' || c == 'E') && i + 1 < s.length()) {
                    i++;
                    if (s.charAt(i) == '-' || s.charAt(i) == '+') i++;
                } else {
                    break;
                }
            }
            return Float.parseFloat(s.substring(start, i));
        }
    }

    // endregion
}
