package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.EditText;

import app.afterglow.extension.settings.ThemeCatalog;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.settings.ThemeDocument;

/** iOS Theme Studio: active palette, presets, custom library, editor and portable files. */
final class ThemeStudioScreen extends SettingsScreen {
    private final AfterglowActivity activity;

    ThemeStudioScreen(AfterglowActivity activity) { this.activity = activity; }

    @Override String title() { return "Theme Studio"; }

    @Override void build(LinearLayout content) {
        RowViews views = activity.views();
        if (Build.VERSION.SDK_INT < 34) {
            content.addView(views.detailRow("Android 14 or newer required",
                    "Native YouTube theme colors require Android 14 or newer.", null, true, null));
        }
        ThemePalette active = ThemeStore.snapshot().palette;
        content.addView(views.sectionTitle("Active Theme"));
        content.addView(views.detailRow(active.name, active.summary, "Edit", true,
                v -> actions(ThemeStore.activeDocument())));
        content.addView(views.sectionTitle("My Themes"));
        java.util.List<ThemeDocument> saved = ThemeStore.savedThemes();
        if (saved.isEmpty()) content.addView(views.caption("Duplicate a preset or import a theme to start editing."));
        for (ThemeDocument document : saved) {
            content.addView(views.detailRow(document.name, document.summary,
                    document.identifier.equals(active.identifier) ? "✓" : null, true, v -> actions(document)));
        }
        content.addView(views.detailRow("Create Theme", "Start with your current palette.", null, true, v -> {
            ThemeDocument created = ThemeStore.activeDocument();
            created.identifier = ThemeDocument.freshIdentifier(); created.name = "Custom";
            activity.push(new ThemeEditorScreen(activity, created));
        }));
        content.addView(views.detailRow("Import Theme", "Choose an Afterglow theme JSON or property list.", null, true,
                v -> activity.importThemeFile()));
        content.addView(views.detailRow("Export Active Theme", "Save a portable copy of your current theme.", null, true,
                v -> activity.exportThemeFile(ThemeStore.activeDocument())));
        for (boolean holiday : new boolean[]{false, true}) {
            content.addView(views.sectionTitle(holiday ? "Holiday Themes" : "Presets"));
            for (ThemePalette preset : ThemeCatalog.PRESETS) {
                if (preset.identifier.startsWith("holiday-") != holiday) continue;
                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                ImageView swatch = new ImageView(activity);
                swatch.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                swatch.setImageDrawable(new Swatch(preset));
                LinearLayout.LayoutParams swatchParams = new LinearLayout.LayoutParams(views.dp(44), views.dp(28));
                swatchParams.leftMargin = views.dp(16);
                row.addView(swatch, swatchParams);
                View detail = views.detailRow(preset.name, preset.summary,
                        preset.identifier.equals(active.identifier) ? "✓" : null, true, null);
                row.addView(detail, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1));
                row.setBackground(views.touchFeedback());
                row.setOnClickListener(v -> actions(ThemeDocument.fromPalette(preset)));
                content.addView(row);
            }
        }
        content.addView(views.sectionTitle("Reset"));
        content.addView(views.detailRow("Reset to YouTube Colors",
                "Clears the active palette. Saved themes stay in My Themes.", null, true,
                v -> new AlertDialog.Builder(activity).setTitle("Reset to YouTube Colors")
                        .setMessage("Reset the active colors and restart YouTube?")
                        .setNegativeButton("Cancel", null)
                        .setPositiveButton("Reset & Restart", (dialog, which) -> {
                            ThemeStore.resetToSystem();
                            AppRestart.restart(activity);
                        }).show()));
    }

    private void activate(ThemeDocument document) {
        new AlertDialog.Builder(activity).setTitle(document.name)
                .setMessage("Use this theme and restart YouTube to apply its colors?")
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Use Theme & Restart", (dialog, which) -> {
                    ThemeStore.activate(document);
                    AppRestart.restart(activity);
                }).show();
    }

    private void actions(ThemeDocument document) {
        boolean saved = ThemeStore.savedTheme(document.identifier) != null;
        String[] choices = saved ? new String[]{"Use Theme", "Edit", "Duplicate", "Rename", "Export", "Delete"}
                : new String[]{"Use Theme", "Duplicate & Edit", "Duplicate", "Export"};
        new AlertDialog.Builder(activity).setTitle(document.name).setItems(choices, (dialog, which) -> {
            String choice = choices[which];
            try {
                switch (choice) {
                    case "Use Theme": activate(document); break;
                    case "Edit": case "Duplicate & Edit": edit(document); break;
                    case "Duplicate": ThemeStore.duplicate(document); activity.refresh(); break;
                    case "Export": activity.exportThemeFile(document); break;
                    case "Rename": rename(document); break;
                    case "Delete": new AlertDialog.Builder(activity).setTitle("Delete " + document.name + "?")
                            .setMessage("If this theme is active, its colors stay applied.")
                            .setNegativeButton("Cancel", null).setPositiveButton("Delete", (d, w) -> {
                                ThemeStore.delete(document.identifier); activity.refresh();
                            }).show(); break;
                }
            } catch (IllegalArgumentException error) { activity.alert("Theme Studio", error.getMessage()); }
        }).setNegativeButton("Cancel", null).show();
    }

    private void edit(ThemeDocument source) {
        ThemeDocument document = source.copy();
        if (ThemeStore.savedTheme(document.identifier) == null) {
            document.identifier = ThemeDocument.freshIdentifier();
            document.name += " Copy";
        }
        activity.push(new ThemeEditorScreen(activity, document));
    }

    private void rename(ThemeDocument document) {
        EditText input = new EditText(activity); input.setText(document.name); input.setSingleLine(true);
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle("Rename Theme").setView(input)
                .setNegativeButton("Cancel", null).setPositiveButton("Rename", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            try { ThemeStore.rename(document.identifier, input.getText().toString()); dialog.dismiss(); activity.refresh(); }
            catch (IllegalArgumentException error) { input.setError(error.getMessage()); }
        }));
        dialog.show();
    }

    /** Same four roles/order as the iOS preset swatch, with no screenshot-derived colors. */
    private static final class Swatch extends Drawable {
        private final ThemePalette palette;
        private final Paint paint = new Paint();
        private static final ThemeRole[] ROLES = {ThemeRole.BACKGROUND, ThemeRole.NAVIGATION_SURFACE,
                ThemeRole.ACCENT, ThemeRole.TAB_ICON};
        Swatch(ThemePalette palette) { this.palette = palette; }
        @Override public void draw(Canvas canvas) {
            float width = getBounds().width() / 4f;
            for (int i = 0; i < ROLES.length; i++) {
                Integer color = palette.color(ROLES[i]);
                paint.setColor(color == null ? 0xFF888888 : color);
                canvas.drawRect(getBounds().left + width * i, getBounds().top,
                        getBounds().left + width * (i + 1), getBounds().bottom, paint);
            }
        }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
