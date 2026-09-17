package app.template.extension.settings;

import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * The mod settings screen, built as plain views so the toggles and section headers can be styled
 * and tinted with the chosen accent. Writes to the same {@link Prefs} store the patches read.
 */
final class ModSettingsView extends ScrollView {

    private static final String[] NAV_LABELS = {
            "Stock", "No pill", "No pill, white icon", "No pill, accent icon", "Accent pill",
    };
    private static final String[] NAV_VALUES = { "stock", "nopill", "white", "accent", "accentPill" };

    private static final String[] REVEAL_LABELS = { "Frosted panel", "Tap-to-show link", "Shimmer", "Tap to burst" };
    private static final String[] REVEAL_VALUES = { "panel", "link", "shimmer", "burst" };

    private static final String[] ANIMATION_LABELS = { "Pop", "Crumble", "Confetti" };
    private static final String[] ANIMATION_VALUES = { "default", "crumble", "confetti" };

    private static final String[] CONFETTI_COLOR_LABELS = { "Accent", "Letterboxd colors", "Classic red" };
    private static final String[] CONFETTI_COLOR_VALUES = { "accent", "letterboxd", "red" };

    private static final String[] STREAMING_APP_LABELS = { "Stremio", "Nuvio" };
    private static final String[] STREAMING_APP_VALUES = { "stremio", "nuvio" };


    private final Context ctx;
    private final float density;
    private final int accent;
    private final LinearLayout column;

    private View revealRow;
    private TextView revealValue;
    private View animationRow;
    private TextView animationValue;
    private View confettiColorRow;
    private TextView confettiColorValue;
    private View streamingAppRow;
    private TextView streamingAppValue;
    private TextView navItemsValue;
    private TextView launchTabValue;
    private TextView homeTabsValue;

    ModSettingsView(Context context) {
        super(context);
        this.ctx = context;
        this.density = context.getResources().getDisplayMetrics().density;
        Prefs.load(context);
        this.accent = 0xFF000000 | AccentPresets.previewColor(context,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(context)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));

        column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(dp(20), dp(4), dp(20), dp(28));
        addView(column, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        boolean themeAvailable = ModTheme.isSupported();

        boolean materialYouActive = ctx.getResources().getIdentifier(
                "morphe_my_surface", "color", ctx.getPackageName()) != 0;

        header("Theme");
        if (!themeAvailable) {
            column.addView(disabledRow("Pure black (OLED)", "Needs Android 12 or newer", null));
        } else if (materialYouActive) {
            column.addView(disabledRow("Pure black (OLED)", "Disabled — tap to find out why",
                    materialYouConflictExplainer()));
        } else {
            PillToggle oled = new PillToggle(ctx);
            View oledRow = toggleRow(oled, "Pure black (OLED)",
                    "True-black surfaces; elevated bits stay a faint grey",
                    Prefs.KEY_THEME_OLED, false, true);
            oled.setChecked("oled".equals(Prefs.surface()), false);
            oled.setOnToggle(new PillToggle.OnToggle() {
                @Override public void onToggle(boolean checked) {
                    Prefs.putString(Prefs.KEY_THEME_SURFACE, checked ? "oled" : "stock");
                    Prefs.putBoolean(Prefs.KEY_THEME_OLED, checked);
                    RestartHelper.promptRestart(ctx);
                }
            });
            column.addView(oledRow);
        }

        if (materialYouActive) {
            column.addView(disabledRow("Match bottom nav to top bar", "Disabled — tap to find out why",
                    materialYouConflictExplainer()));
        } else {
            column.addView(toggleRow("Match bottom nav to top bar",
                    "Paint the bottom navigation bar black to match the top bar",
                    Prefs.KEY_MATCH_BOTTOM_NAV, true, true));
        }

        if (themeAvailable) {
            column.addView(accentRow());
            column.addView(choiceRow("Bottom nav selected style", null,
                    labelFor(NAV_LABELS, NAV_VALUES, Prefs.getString(Prefs.KEY_NAV_INDICATOR, "stock")),
                    new Runnable() {
                        @Override public void run() {
                            new NavStyleDialog(ctx, Prefs.getString(Prefs.KEY_NAV_INDICATOR, "stock"),
                                    accent, new NavStyleDialog.OnPick() {
                                        @Override public void onPick(String value) {
                                            Prefs.putString(Prefs.KEY_NAV_INDICATOR, value);
                                            rebuildAndRestart();
                                        }
                                    }).show();
                        }
                    }));
        }

        header("Bottom navigation");
        column.addView(choiceRow("Shown items", "Which destinations the bottom bar shows",
                navSummary(),
                new Runnable() {
                    @Override public void run() {
                        new NavItemsDialog(ctx, accent, new NavItemsDialog.OnDone() {
                            @Override public void onDone() {
                                if (navItemsValue != null) navItemsValue.setText(navSummary());
                                if (launchTabValue != null) launchTabValue.setText(launchTabSummary());
                                RestartHelper.promptRestart(ctx);
                            }
                        }).show();
                    }
                }));
        column.addView(choiceRow("Launch tab", "Which tab the app opens on",
                launchTabSummary(),
                new Runnable() {
                    @Override public void run() {
                        new LaunchTabDialog(ctx, Prefs.getString(Prefs.KEY_LAUNCH_TAB, "last"), accent,
                                new LaunchTabDialog.OnPick() {
                                    @Override public void onPick(String value) {
                                        Prefs.putString(Prefs.KEY_LAUNCH_TAB, value);
                                        if (launchTabValue != null) launchTabValue.setText(launchTabSummary());
                                        RestartHelper.promptRestart(ctx);
                                    }
                                }).show();
                    }
                }));

        header("Home");
        column.addView(choiceRow("Home tabs", "Which section tabs the home screen shows, and their order",
                homeTabsSummary(),
                new Runnable() {
                    @Override public void run() {
                        new HomeTabsDialog(ctx, accent, new HomeTabsDialog.OnDone() {
                            @Override public void onDone() {
                                if (homeTabsValue != null) homeTabsValue.setText(homeTabsSummary());
                                RestartHelper.promptRestart(ctx);
                            }
                        }).show();
                    }
                }));
        column.addView(toggleRow("Hide Video Store",
                "Remove the Video Store promo row from the Films tab",
                Prefs.KEY_HIDE_VIDEO_STORE, false, true));
        column.addView(toggleRow("Hide Where to Watch",
                "Remove the \"Where to watch\" section from a film's page",
                Prefs.KEY_HIDE_WHERE_TO_WATCH, false, false));
        column.addView(toggleRow("Runtime as 1h 47m",
                "Show a film's runtime in hours and minutes instead of \"107 mins\"",
                Prefs.KEY_RUNTIME_HHMM, true, false));

        header("Streaming");
        final PillToggle openInPlayer = new PillToggle(ctx);
        column.addView(toggleRow(openInPlayer, "Open in player",
                "Opens the film in streaming apps like Stremio or Nuvio",
                Prefs.KEY_OPEN_IN_PLAYER, false, false));
        streamingAppRow = choiceRow("Streaming app", null,
                labelFor(STREAMING_APP_LABELS, STREAMING_APP_VALUES, Prefs.streamingApp()),
                new Runnable() {
                    @Override public void run() {
                        new StreamingAppDialog(ctx, Prefs.streamingApp(), accent,
                                new StreamingAppDialog.OnPick() {
                                    @Override public void onPick(String value) {
                                        Prefs.putString(Prefs.KEY_STREAMING_APP, value);
                                        if (streamingAppValue != null) {
                                            streamingAppValue.setText(
                                                    labelFor(STREAMING_APP_LABELS, STREAMING_APP_VALUES, value));
                                        }
                                    }
                                }).show();
                    }
                });
        column.addView(streamingAppRow);
        setRowEnabled(streamingAppRow, Prefs.getBoolean(Prefs.KEY_OPEN_IN_PLAYER, false));
        openInPlayer.setOnToggle(new PillToggle.OnToggle() {
            @Override public void onToggle(boolean checked) {
                Prefs.putBoolean(Prefs.KEY_OPEN_IN_PLAYER, checked);
                setRowEnabled(streamingAppRow, checked);
            }
        });

        header("Ratings");
        final PillToggle hideRatings = new PillToggle(ctx);
        column.addView(toggleRow(hideRatings, "Hide ratings until watched",
                "Cover a film's community rating until you mark it watched",
                Prefs.KEY_HIDE_RATINGS_ENABLED, true, false));

        revealRow = choiceRow("Cover", null,
                labelFor(REVEAL_LABELS, REVEAL_VALUES, Prefs.getString(Prefs.KEY_HIDE_RATINGS_STYLE, "panel")),
                new Runnable() {
                    @Override public void run() {
                        new RevealStyleDialog(ctx,
                                Prefs.getString(Prefs.KEY_HIDE_RATINGS_STYLE, "panel"), accent,
                                new RevealStyleDialog.OnPick() {
                                    @Override public void onPick(String value) {
                                        Prefs.putString(Prefs.KEY_HIDE_RATINGS_STYLE, value);
                                        if (revealValue != null) {
                                            revealValue.setText(labelFor(REVEAL_LABELS, REVEAL_VALUES, value));
                                        }
                                        refreshRevealRows();
                                    }
                                }).show();
                    }
                });
        column.addView(revealRow);

        animationRow = choiceRow("Reveal animation", null,
                labelFor(ANIMATION_LABELS, ANIMATION_VALUES, Prefs.revealAnimation()),
                new Runnable() {
                    @Override public void run() {
                        new RevealAnimationDialog(ctx, Prefs.revealAnimation(), accent,
                                new RevealAnimationDialog.OnPick() {
                                    @Override public void onPick(String value) {
                                        Prefs.putString(Prefs.KEY_HIDE_RATINGS_ANIMATION, value);
                                        if (animationValue != null) {
                                            animationValue.setText(labelFor(ANIMATION_LABELS, ANIMATION_VALUES, value));
                                        }
                                        refreshRevealRows();
                                    }
                                }).show();
                    }
                });
        column.addView(animationRow);

        confettiColorRow = choiceRow("Confetti color", null,
                labelFor(CONFETTI_COLOR_LABELS, CONFETTI_COLOR_VALUES, Prefs.confettiColor()),
                new Runnable() {
                    @Override public void run() {
                        new ConfettiColorDialog(ctx, Prefs.confettiColor(), accent,
                                new ConfettiColorDialog.OnPick() {
                                    @Override public void onPick(String value) {
                                        Prefs.putString(Prefs.KEY_HIDE_RATINGS_CONFETTI_COLOR, value);
                                        if (confettiColorValue != null) {
                                            confettiColorValue.setText(
                                                    labelFor(CONFETTI_COLOR_LABELS, CONFETTI_COLOR_VALUES, value));
                                        }
                                    }
                                }).show();
                    }
                });
        column.addView(confettiColorRow);

        column.addView(toggleRow("Reveal haptic feedback",
                "A short vibration when the rating is revealed",
                Prefs.KEY_HIDE_RATINGS_HAPTIC, true, false));

        refreshRevealRows();
        hideRatings.setOnToggle(new PillToggle.OnToggle() {
            @Override public void onToggle(boolean checked) {
                Prefs.putBoolean(Prefs.KEY_HIDE_RATINGS_ENABLED, checked);
                refreshRevealRows();
            }
        });

        header("Backup");
        column.addView(actionRow("Export settings",
                "Save your mod config to a file to share or keep",
                new Runnable() {
                    @Override public void run() {
                        if (ctx instanceof ModSettingsActivity) ((ModSettingsActivity) ctx).pickExport();
                    }
                }));
        column.addView(actionRow("Import settings",
                "Load a config file. Merges over your current settings",
                new Runnable() {
                    @Override public void run() {
                        if (ctx instanceof ModSettingsActivity) ((ModSettingsActivity) ctx).pickImport();
                    }
                }));

        header("About");
        column.addView(linkRow("Source and releases",
                "github.com/mvaishak/letterboxd-morphe-patches",
                "https://github.com/mvaishak/letterboxd-morphe-patches"));
    }

    private View actionRow(String title, String subtitle, final Runnable onClick) {
        LinearLayout row = rowBase();
        row.addView(titleBlock(title, subtitle), textLp());
        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { onClick.run(); }
        });
        return row;
    }

    private View linkRow(String title, String subtitle, final String url) {
        LinearLayout row = rowBase();
        row.addView(titleBlock(title, subtitle), textLp());

        TextView open = new TextView(ctx);
        open.setText("↗");
        open.setTextColor(accent);
        open.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        open.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(open);

        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                try {
                    ctx.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url))
                            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                } catch (Throwable ignored) {
                }
            }
        });
        return row;
    }

    // --- rows -----------------------------------------------------------

    private void header(String text) {
        TextView tv = new TextView(ctx);
        tv.setText(text.toUpperCase());
        tv.setTextColor(accent);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
        tv.setLetterSpacing(0.08f);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(22);
        lp.bottomMargin = dp(4);
        tv.setLayoutParams(lp);
        column.addView(tv);
    }

    private View toggleRow(String title, String subtitle, final String key,
                           final boolean def, final boolean restart) {
        return toggleRow(new PillToggle(ctx), title, subtitle, key, def, restart);
    }

    private View toggleRow(final PillToggle toggle, String title, String subtitle,
                           final String key, boolean def, final boolean restart) {
        LinearLayout row = rowBase();
        row.addView(titleBlock(title, subtitle), textLp());

        toggle.setAccent(accent);
        toggle.setChecked(Prefs.getBoolean(key, def), false);
        LinearLayout.LayoutParams tlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tlp.gravity = Gravity.CENTER_VERTICAL;
        row.addView(toggle, tlp);

        toggle.setOnToggle(new PillToggle.OnToggle() {
            @Override public void onToggle(boolean checked) {
                Prefs.putBoolean(key, checked);
                if (restart) RestartHelper.promptRestart(ctx);
            }
        });
        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { toggle.performClick(); }
        });
        return row;
    }

    private View choiceRow(String title, String subtitle, String value, final Runnable onClick) {
        LinearLayout row = rowBase();
        row.addView(titleBlock(title, subtitle), textLp());

        TextView v = new TextView(ctx);
        v.setText(value);
        v.setTextColor(0xFFB0B0B0);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        v.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(v);
        if (title.equals("Cover")) revealValue = v;
        else if (title.equals("Reveal animation")) animationValue = v;
        else if (title.equals("Confetti color")) confettiColorValue = v;
        else if (title.equals("Streaming app")) streamingAppValue = v;
        else if (title.equals("Shown items")) navItemsValue = v;
        else if (title.equals("Launch tab")) launchTabValue = v;
        else if (title.equals("Home tabs")) homeTabsValue = v;

        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { onClick.run(); }
        });
        return row;
    }

    private View accentRow() {
        LinearLayout row = rowBase();
        row.addView(titleBlock("Accent colour", null), textLp());

        final int argb = 0xFF000000 | AccentPresets.previewColor(ctx,
                Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(ctx)),
                Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
        View dot = new View(ctx);
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        d.setColor(argb);
        d.setStroke(dp(2), 0x33FFFFFF);
        dot.setBackground(d);
        LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(dp(24), dp(24));
        dlp.gravity = Gravity.CENTER_VERTICAL;
        row.addView(dot, dlp);

        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                new AccentPickerDialog(ctx,
                        Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(ctx)),
                        Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""),
                        new AccentPickerDialog.OnAccentChosen() {
                            @Override public void onChosen(String accentKey, String customHex) {
                                Prefs.putString(Prefs.KEY_THEME_ACCENT, accentKey);
                                Prefs.putString(Prefs.KEY_THEME_ACCENT_HEX, customHex);
                                rebuildAndRestart();
                            }
                        }).show();
            }
        });
        return row;
    }

    private View disabledRow(String title, String subtitle, final Runnable onTap) {
        LinearLayout row = rowBase();
        row.setAlpha(onTap != null ? 0.7f : 0.45f);
        row.addView(titleBlock(title, subtitle), textLp());
        if (onTap != null) {
            row.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) { onTap.run(); }
            });
        } else {
            row.setClickable(false);
        }
        return row;
    }

    /**
     * A new user seeing "Disabled — the Material You theme patch is active" under a greyed-out
     * switch has no way to know that's a deliberate design choice rather than a bug — explain it
     * in full when tapped instead of relying on a one-line subtitle to carry that.
     */
    private Runnable materialYouConflictExplainer() {
        return new Runnable() {
            @Override public void run() {
                ModDialog.show(ctx,
                        "Handled by Material You",
                        "This is off because you also patched \"Material You theme\" — it already " +
                                "controls this. Disable that patch to use OLED here.",
                        "Got it", null, null, null);
            }
        };
    }

    // --- helpers ------------------------------------------------------

    /**
     * The three rating-reveal rows below the master toggle nest: "Reveal animation" is only
     * meaningful once "Cover" isn't the plain text link, "Confetti color" only once the animation
     * is actually Confetti, and both collapse if the master toggle is off. Re-run after any of
     * the three inputs (master toggle, cover, animation) changes.
     */
    private void refreshRevealRows() {
        boolean enabled = Prefs.getBoolean(Prefs.KEY_HIDE_RATINGS_ENABLED, true);
        boolean animationApplies = enabled && !"link".equals(Prefs.getString(Prefs.KEY_HIDE_RATINGS_STYLE, "panel"));
        boolean confettiColorApplies = animationApplies && "confetti".equals(Prefs.revealAnimation());
        setRowEnabled(revealRow, enabled);
        setRowEnabled(animationRow, animationApplies);
        setRowEnabled(confettiColorRow, confettiColorApplies);
    }

    private void setRowEnabled(View row, boolean enabled) {
        if (row == null) return;
        row.setAlpha(enabled ? 1f : 0.4f);
        row.setClickable(enabled);
    }

    private void rebuildAndRestart() {
        RestartHelper.promptRestart(ctx);
    }

    private LinearLayout rowBase() {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(15), 0, dp(15));
        row.setClickable(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        row.setLayoutParams(lp);
        return row;
    }

    private View titleBlock(String title, String subtitle) {
        LinearLayout block = new LinearLayout(ctx);
        block.setOrientation(LinearLayout.VERTICAL);

        TextView t = new TextView(ctx);
        t.setText(title);
        t.setTextColor(0xFFEDEDED);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        block.addView(t);

        if (subtitle != null) {
            TextView s = new TextView(ctx);
            s.setText(subtitle);
            s.setTextColor(0xFF9AA0A6);
            s.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            LinearLayout.LayoutParams slp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            slp.topMargin = dp(2);
            s.setLayoutParams(slp);
            block.addView(s);
        }
        return block;
    }

    private LinearLayout.LayoutParams textLp() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        lp.rightMargin = dp(14);
        lp.gravity = Gravity.CENTER_VERTICAL;
        return lp;
    }

    private static String navSummary() {
        StringBuilder sb = new StringBuilder();
        for (String key : NavItems.enabled()) {
            for (int i = 0; i < NavItems.KEYS.length; i++) {
                if (NavItems.KEYS[i].equals(key)) {
                    if (sb.length() > 0) sb.append(", ");
                    sb.append(NavItems.LABELS[i]);
                }
            }
        }
        return sb.toString();
    }

    private static String homeTabsSummary() {
        StringBuilder sb = new StringBuilder();
        for (String key : HomeTabs.order()) {
            for (int i = 0; i < HomeTabs.KEYS.length; i++) {
                if (HomeTabs.KEYS[i].equals(key)) {
                    if (sb.length() > 0) sb.append(", ");
                    sb.append(HomeTabs.LABELS[i]);
                }
            }
        }
        return sb.toString();
    }

    private static String launchTabSummary() {
        String v = Prefs.getString(Prefs.KEY_LAUNCH_TAB, "last");
        if ("last".equals(v)) return "Last used";
        for (int i = 0; i < NavItems.KEYS.length; i++) {
            if (NavItems.KEYS[i].equals(v)) return NavItems.LABELS[i];
        }
        return "Last used";
    }

    private static String labelFor(String[] labels, String[] values, String value) {
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(value)) return labels[i];
        }
        return labels[0];
    }

    private int dp(float v) {
        return Math.round(v * density);
    }
}
