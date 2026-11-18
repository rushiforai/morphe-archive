package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;

import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.GlowStyle;
import app.afterglow.extension.settings.ThemeColors;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.theme.GlowRenderer;

/** Live controls and preview using the same glow policy as native controls. */
final class GlowLabScreen extends SettingsScreen {
    private final AfterglowActivity activity;
    private View preview;
    private boolean dragging;
    GlowLabScreen(AfterglowActivity activity) { this.activity = activity; }
    @Override String title() { return "Glow Lab"; }
    @Override boolean isBusy() { return dragging; }
    @Override void build(LinearLayout content) {
        RowViews views = activity.views();
        content.addView(views.caption("Colored light around tabs, player controls, and the scrubber. Changes update the preview as you move."));
        preview = new Preview(); content.addView(preview, new LinearLayout.LayoutParams(-1, views.dp(180)));
        content.addView(views.switchRow("Enable glow", null, AfterglowPrefs.getBool("theme_glowEnabled"), true,
                (button, checked) -> AfterglowPrefs.setBool("theme_glowEnabled", checked)));
        content.addView(views.detailRow("Glow preset", null, "Low · Medium · High · Max", true, v ->
                new AlertDialog.Builder(activity).setTitle("Glow preset").setItems(new String[]{"Low", "Medium", "High", "Max"}, (d, index) -> {
                    Map<String, Object> changes = new HashMap<>();
                    changes.put("theme_glowEnabled", true); changes.put("theme_glowStrengthMode", index);
                    changes.put("theme_glowStrengthCustom", new int[]{25,50,80,100}[index]);
                    changes.put("theme_glowStrength", new int[]{25,50,80,100}[index]);
                    changes.put("theme_glowRadius", new int[]{36,50,72,100}[index]);
                    changes.put("theme_glowLayers", new int[]{1,1,2,3}[index]); changes.put("theme_glowOpacity", 100);
                    AfterglowPrefs.update(changes);
                }).show()));
        content.addView(views.sectionTitle("Strength"));
        GlowStyle style = GlowStyle.current();
        slider(content, "Intensity", "theme_glowStrengthCustom", style.strength, 0, 100);
        slider(content, "Opacity", "theme_glowOpacity", style.opacity, 0, 100);
        slider(content, "Radius", "theme_glowRadius", style.radius, 0, 100);
        slider(content, "Layers", "theme_glowLayers", style.layers, 1, 12);
        content.addView(views.sectionTitle("Surfaces"));
        String[] keys = {"theme_glowPivot", "theme_glowOverlay", "theme_glowScrubber", "theme_glowSeekBar"};
        String[] labels = {"Tab bar glow", "Overlay button glow", "Scrubber glow", "Seek bar glow"};
        for (int i=0; i<keys.length; i++) {
            String key = keys[i];
            content.addView(views.switchRow(labels[i], null, AfterglowPrefs.getBool(key), true,
                    (button, checked) -> AfterglowPrefs.update(Map.of(key, checked, "theme_glowEnabled", true))));
        }
        content.addView(views.detailRow("Glow Color", "Clear to use each surface's color.", ThemeColors.hex("theme_glowColor"), true, v -> color()));
        content.addView(views.sectionTitle("Motion"));
        String[] motion = {"seekBarAnimated", "seekBarGradient", "disableAmbientMode"};
        String[] names = {"Animated seek bar", "Seek bar gradient", "Hide YouTube ambient glow"};
        for (int i=0; i<motion.length; i++) {
            String key = motion[i];
            boolean checked = key.equals("seekBarGradient") ? ThemeStore.seekBarRainbowEnabled() : AfterglowPrefs.getBool(key);
            if (SettingsBehavior.keyVisible(key)) content.addView(views.switchRow(names[i], null, checked, true,
                    (button, value) -> AfterglowPrefs.setBool(key, value)));
        }
        content.addView(views.detailRow("Reset Glow Lab", null, null, true, v -> {
            Map<String, Object> changes = new HashMap<>();
            changes.put("theme_glowEnabled", true); changes.put("theme_glowStrengthMode", 1);
            changes.put("theme_glowStrengthCustom", 50); changes.put("theme_glowStrength", 50);
            changes.put("theme_glowOpacity", 100); changes.put("theme_glowRadius", 50); changes.put("theme_glowLayers", 1);
            changes.put("theme_glowColor", null); changes.put("theme_glowPivot", true); changes.put("theme_glowOverlay", true);
            changes.put("theme_glowScrubber", true); changes.put("theme_glowSeekBar", false); AfterglowPrefs.update(changes);
        }));
    }
    private void slider(LinearLayout content, String title, String key, int value, int min, int max) {
        TextView label = activity.views().text(title + ": " + value, 15, activity.views().palette.text, false);
        label.setPadding(activity.views().dp(16), activity.views().dp(8), 0, 0); content.addView(label);
        SeekBar slider = new SeekBar(activity); slider.setContentDescription(title); slider.setMin(min); slider.setMax(max); slider.setProgress(value);
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onStartTrackingTouch(SeekBar bar) { dragging = true; }
            public void onStopTrackingTouch(SeekBar bar) { dragging = false; activity.refresh(); }
            public void onProgressChanged(SeekBar bar, int progress, boolean user) {
                if (!user) return;
                Map<String, Object> changes = new HashMap<>(); changes.put(key, progress); changes.put("theme_glowEnabled", true);
                if (key.equals("theme_glowStrengthCustom")) { changes.put("theme_glowStrengthMode", 3); changes.put("theme_glowStrength", progress); }
                AfterglowPrefs.update(changes); label.setText(title + ": " + progress); preview.invalidate();
            }
        });
        content.addView(slider);
    }
    private void color() {
        EditText input = new EditText(activity); input.setSingleLine(true);
        input.setText(ThemeColors.hex("theme_glowColor"));
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle("Glow Color").setMessage("Enter #RRGGBB.").setView(input)
                .setNegativeButton("Cancel", null).setNeutralButton("Clear", (d, w) -> AfterglowPrefs.remove("theme_glowColor"))
                .setPositiveButton("Apply", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            Integer color = ThemeColors.decode(input.getText().toString());
            if (color == null) { input.setError("Enter a valid hex color."); return; }
            AfterglowPrefs.setInt("theme_glowColor", color | 0xFF000000); dialog.dismiss();
        })); dialog.show();
    }
    private final class Preview extends View {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        Preview() { super(activity); setContentDescription("Tab and seek bar glow preview"); }
        @Override protected void onDraw(Canvas canvas) {
            GlowStyle style = GlowStyle.current(); float density = getResources().getDisplayMetrics().density;
            Integer role = ThemeStore.snapshot().palette.color(ThemeRole.ACCENT);
            int color = style.color != null ? style.color : role != null ? role : activity.views().palette.accent;
            for (int i=0; i<5; i++) {
                float x = getWidth()*(i+1)/6f, y = 50*density;
                if (style.enabled && style.pivot) GlowRenderer.circle(canvas, x, y, 8*density, color, style, 12*density, i == 0 ? .9f : .45f);
                paint.setColor(color); canvas.drawCircle(x, y, 8*density, paint);
            }
            paint.setColor(activity.views().palette.secondaryText); paint.setStrokeWidth(3*density);
            canvas.drawLine(24*density, 125*density, getWidth()-24*density, 125*density, paint);
            if (style.enabled && style.seekBar) GlowRenderer.track(canvas, 24*density, 123.5f*density,
                    getWidth()*.6f, 126.5f*density, color, style, density);
            paint.setColor(color); canvas.drawLine(24*density, 125*density, getWidth()*.6f, 125*density, paint);
            if (style.enabled && style.scrubber) GlowRenderer.circle(canvas, getWidth()*.6f, 125*density, 6*density, color, style, density);
            paint.setColor(color); canvas.drawCircle(getWidth()*.6f, 125*density, 6*density, paint);
        }
    }
}
