package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.LinkedHashMap;
import java.util.Locale;

import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.GlowStyle;
import app.afterglow.extension.theme.GlowRenderer;
import app.afterglow.extension.theme.Typography;
import app.afterglow.extension.settings.ThemeColors;
import app.afterglow.extension.settings.ThemeDocument;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;

/** A private draft until Save: cancelling never writes colors or scalar settings. */
final class ThemeEditorScreen extends SettingsScreen {
    private final AfterglowActivity activity;
    private final ThemeDocument draft;
    private final String original;

    ThemeEditorScreen(AfterglowActivity activity, ThemeDocument document) {
        this.activity = activity;
        draft = document.copy();
        if (draft.typography == null) draft.typography = new LinkedHashMap<>(ThemeStore.activeDocument().typography);
        if (draft.glow == null) draft.glow = new LinkedHashMap<>(ThemeStore.activeDocument().glow);
        if (draft.glowEnabled != null) draft.glow.put("enabled", draft.glowEnabled);
        original = draft.json();
    }
    @Override String title() { return "Edit Theme"; }
    @Override boolean onBack() {
        if (draft.json().equals(original)) return false;
        new AlertDialog.Builder(activity).setTitle("Discard changes?")
                .setMessage("Your saved theme and active colors have not changed.")
                .setNegativeButton("Keep Editing", null).setPositiveButton("Discard", (d, w) -> activity.pop()).show();
        return true;
    }

    @Override void build(LinearLayout content) {
        RowViews views = activity.views();
        content.addView(new Preview(), new LinearLayout.LayoutParams(-1, views.dp(190)));
        content.addView(views.detailRow("Save & Restart", "Save this theme in My Themes and apply it to YouTube.", null, true, v -> {
            try {
                ThemeStore.save(draft, true);
                AppRestart.restart(activity);
            } catch (IllegalArgumentException error) { activity.alert("Could not save theme", error.getMessage()); }
        }));
        section(content, "Foundation");
        content.addView(views.detailRow("Name", null, draft.name, true, v -> editName()));
        content.addView(views.switchRow("Light foundation", "YouTube's light or dark chrome under this theme.",
                draft.palette().lightFoundation, true, (button, checked) -> { draft.lightFoundation = checked; activity.refresh(); }));
        section(content, "Surfaces");
        colors(content, ThemeRole.BACKGROUND, ThemeRole.ELEVATED_SURFACE, ThemeRole.NAVIGATION_SURFACE, ThemeRole.BORDER);
        section(content, "Text");
        colors(content, ThemeRole.PRIMARY_TEXT, ThemeRole.SECONDARY_TEXT);
        section(content, "Controls");
        colors(content, ThemeRole.ACCENT, ThemeRole.TAB_ICON, ThemeRole.FOCUS);
        section(content, "Player");
        colors(content, ThemeRole.OVERLAY_CONTROL, ThemeRole.OVERLAY_BACKDROP, ThemeRole.SEEK_PLAYED,
                ThemeRole.SEEK_BUFFERED, ThemeRole.SEEK_LIVE, ThemeRole.SEEK_SCRUBBER, ThemeRole.SEEK_SCRUBBER_LIVE);
        section(content, "Gradient");
        content.addView(views.switchRow("Page gradient", null, draft.palette().hasGradient(), true, (button, checked) -> {
            if (checked) {
                draft.colors.put(ThemeRole.GRADIENT_START, color(ThemeRole.BACKGROUND, 0xFF101010));
                draft.colors.put(ThemeRole.GRADIENT_END, color(ThemeRole.NAVIGATION_SURFACE, 0xFF202020));
            } else { draft.colors.remove(ThemeRole.GRADIENT_START); draft.colors.remove(ThemeRole.GRADIENT_END); }
            activity.refresh();
        }));
        if (draft.palette().hasGradient()) colors(content, ThemeRole.GRADIENT_START, ThemeRole.GRADIENT_END);
        if (InstalledTweaks.has("glow")) {
        section(content, "Glow");
        glowToggle(content, "Glow", "enabled");
        if (Boolean.TRUE.equals(draft.glow.get("enabled"))) {
            colors(content, ThemeRole.GLOW);
            slider(content, "Strength", "strengthCustom", 0, 100);
            slider(content, "Opacity", "opacity", 0, 100);
            slider(content, "Radius", "radius", 0, 100);
            slider(content, "Layers", "layers", 1, 12);
            glowToggle(content, "Tab Bar", "pivot");
            glowToggle(content, "Overlay Buttons", "overlay");
            glowToggle(content, "Scrubber", "scrubber");
            glowToggle(content, "Seek Bar", "seekBar");
        }
        }
        if (InstalledTweaks.has("typography")) {
        section(content, "Typography");
        content.addView(views.caption("Bundled fonts keep their original faces. Apple system fonts use Android equivalents."));
        String[] titles = {"App Font", "App Font Size", "App Font Weight", "App Font Style", "Tab Label Size"};
        for (int i = 0; i < ThemeDocument.TYPOGRAPHY.length; i++) {
            String key = ThemeDocument.TYPOGRAPHY[i];
            String title = titles[i];
            SettingsModel.Row row = null;
            for (SettingsModel.Page page : SettingsSpec.pages()) for (SettingsModel.Row candidate : page.rows)
                if (("theme_" + key).equals(candidate.key) && candidate.kind == SettingsModel.Kind.PICKER) row = candidate;
            if (row == null) continue;
            java.util.List<SettingsBehavior.Choice> choices = SettingsBehavior.choices(row);
            String[] labels = new String[choices.size()];
            for (int c = 0; c < labels.length; c++) labels[c] = choices.get(c).label;
            int selected = ((Number) draft.typography.get(key)).intValue();
            content.addView(views.detailRow(title, null, labels[Math.max(0, Math.min(labels.length - 1, selected))], true,
                    v -> new AlertDialog.Builder(activity).setTitle(title).setSingleChoiceItems(labels, selected, (dialog, which) -> {
                        draft.typography.put(key, choices.get(which).value); dialog.dismiss(); activity.refresh();
                    }).setNegativeButton("Cancel", null).show()));
        }
        }
        section(content, "Derived Overrides");
        colors(content, ThemeRole.SHADOW);
        content.addView(views.caption("Use Auto in a color's menu to restore its derived value. Changes stay in the preview until Save."));
    }
    private void section(LinearLayout content, String title) { content.addView(activity.views().sectionTitle(title)); }
    private void colors(LinearLayout content, ThemeRole... roles) {
        for (ThemeRole role : roles) {
            Integer value = draft.palette().color(role);
            String detail = draft.colors.containsKey(role) ? hex(value) : "Auto" + (value == null ? "" : " · " + hex(value));
            Integer backdrop = backdrop(role);
            boolean suggest = value != null && backdrop != null && ThemeColors.contrast(value, backdrop) <
                    (role == ThemeRole.PRIMARY_TEXT || role == ThemeRole.SECONDARY_TEXT ? 4.5 : 3);
            if (value != null && backdrop != null)
                detail += String.format(Locale.ROOT, " · %.1f:1%s", ThemeColors.contrast(value, backdrop), suggest ? " ⚠" : "");
            content.addView(activity.views().detailRow(label(role), null, detail, true, v -> editColor(role)));
            if (suggest) content.addView(activity.views().detailRow("Use suggested " + label(role).toLowerCase(Locale.ROOT),
                    "Choose black or white for stronger contrast.", null, true, v -> {
                        draft.colors.put(role, ThemeColors.blackOrWhite(backdrop)); activity.refresh();
                    }));
        }
    }
    private Integer backdrop(ThemeRole role) {
        switch (role) {
            case BORDER: return draft.palette().color(ThemeRole.ELEVATED_SURFACE);
            case TAB_ICON: return draft.palette().color(ThemeRole.NAVIGATION_SURFACE);
            case OVERLAY_CONTROL: return draft.palette().color(ThemeRole.OVERLAY_BACKDROP);
            case PRIMARY_TEXT: case SECONDARY_TEXT: case ACCENT: case FOCUS:
            case SEEK_PLAYED: case SEEK_BUFFERED: case SEEK_LIVE: case SEEK_SCRUBBER: case SEEK_SCRUBBER_LIVE:
                return color(ThemeRole.BACKGROUND, draft.palette().lightFoundation ? 0xFFFFFFFF : 0xFF0F0F0F);
            default: return null;
        }
    }
    static String label(ThemeRole role) {
        switch (role) {
            case TAB_ICON: return "Tab Icons";
            case OVERLAY_CONTROL: return "Overlay Controls";
            case GLOW: return "Glow Color";
            case SEEK_SCRUBBER: return "Scrubber";
            case SEEK_SCRUBBER_LIVE: return "Scrubber (Live)";
            case FOCUS: return "Focus Ring";
            default: String text = role.semanticName.replaceAll("([a-z])([A-Z])", "$1 $2"); return Character.toUpperCase(text.charAt(0)) + text.substring(1);
        }
    }
    private static String hex(Integer value) { return value == null ? "Auto" : String.format(Locale.ROOT, "#%08X", value); }
    private int color(ThemeRole role, int fallback) { Integer color = draft.palette().color(role); return color == null ? fallback : color; }
    private void editName() {
        EditText input = new EditText(activity); input.setSingleLine(true); input.setText(draft.name);
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle("Theme name").setView(input)
                .setNegativeButton("Cancel", null).setPositiveButton("Apply", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String name = ThemeDocument.normalizedName(input.getText().toString());
            if (name.isEmpty()) { input.setError("The theme needs a name."); return; }
            draft.name = name; dialog.dismiss(); activity.refresh();
        }));
        dialog.show();
    }
    private void editColor(ThemeRole role) {
        EditText input = new EditText(activity); input.setSingleLine(true); input.setInputType(InputType.TYPE_CLASS_TEXT);
        Integer current = draft.palette().color(role);
        input.setText(current == null ? "#" : hex(current));
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle(label(role))
                .setMessage("Enter #RRGGBB or #AARRGGBB. Alpha controls transparency.").setView(input)
                .setNegativeButton("Cancel", null).setNeutralButton("Use Auto", (d, w) -> {
                    if (role == ThemeRole.GRADIENT_START || role == ThemeRole.GRADIENT_END) {
                        draft.colors.remove(ThemeRole.GRADIENT_START); draft.colors.remove(ThemeRole.GRADIENT_END);
                    } else draft.colors.remove(role);
                    activity.refresh();
                }).setPositiveButton("Apply", null).create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            Integer value = ThemeColors.decode(input.getText().toString());
            if (value == null) { input.setError("Enter a valid hex color."); return; }
            draft.colors.put(role, value); dialog.dismiss(); activity.refresh();
        }));
        dialog.show();
    }
    private void glowToggle(LinearLayout content, String title, String key) {
        content.addView(activity.views().switchRow(title, null, Boolean.TRUE.equals(draft.glow.get(key)), true,
                (button, checked) -> { draft.glow.put(key, checked); if (key.equals("enabled")) draft.glowEnabled = checked; activity.refresh(); }));
    }
    private void slider(LinearLayout content, String title, String key, int min, int max) {
        int current = ((Number) draft.glow.get(key)).intValue();
        if (key.equals("strengthCustom")) current = GlowStyle.preview(draft).strength;
        TextView label = activity.views().text(title + ": " + current, 15, activity.views().palette.text, false);
        label.setPadding(activity.views().dp(16), activity.views().dp(8), 0, 0); content.addView(label);
        SeekBar bar = new SeekBar(activity); bar.setContentDescription(title); bar.setMin(min); bar.setMax(max); bar.setProgress(current);
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar seek, int progress, boolean user) {
                if (!user) return;
                draft.glow.put(key, progress);
                if (key.equals("strengthCustom")) draft.glow.put("strengthMode", 3);
                label.setText(title + ": " + progress);
            }
            public void onStartTrackingTouch(SeekBar seek) {}
            public void onStopTrackingTouch(SeekBar seek) { activity.refresh(); }
        });
        content.addView(bar);
    }
    private final class Preview extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        Preview() { super(activity); setContentDescription("Theme preview: " + draft.name); }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float d = getResources().getDisplayMetrics().density;
            ThemePalette palette = draft.palette();
            GlowStyle glow = GlowStyle.preview(draft);
            int background = color(ThemeRole.BACKGROUND, palette.lightFoundation ? 0xFFFFFFFF : 0xFF0F0F0F);
            paint.setColor(background);
            if (palette.hasGradient()) paint.setShader(new LinearGradient(0, 0, 0, getHeight(),
                    palette.color(ThemeRole.GRADIENT_START), palette.color(ThemeRole.GRADIENT_END), Shader.TileMode.CLAMP));
            canvas.drawRect(16*d, 8*d, getWidth()-16*d, getHeight()-8*d, paint); paint.setShader(null);
            paint.setColor(color(ThemeRole.NAVIGATION_SURFACE, background));
            canvas.drawRect(16*d, 8*d, getWidth()-16*d, 46*d, paint);
            paint.setColor(color(ThemeRole.PRIMARY_TEXT, palette.lightFoundation ? 0xFF0F0F0F : 0xFFF1F1F1));
            Typography.preview(paint, draft.typography, 19*d, true); canvas.drawText(draft.name, 28*d, 34*d, paint);
            Typography.preview(paint, draft.typography, 16*d, false); canvas.drawText("Your YouTube, your colors", 28*d, 76*d, paint);
            paint.setColor(color(ThemeRole.SECONDARY_TEXT, 0xFF888888)); Typography.preview(paint, draft.typography, 13*d, false);
            canvas.drawText("Theme preview", 28*d, 101*d, paint);
            paint.setStrokeWidth(3*d); paint.setColor(color(ThemeRole.SEEK_BUFFERED, 0xFF888888));
            canvas.drawLine(28*d, 126*d, getWidth()-28*d, 126*d, paint);
            paint.setColor(color(ThemeRole.SEEK_PLAYED, 0xFFFF0033));
            if (InstalledTweaks.has("glow") && glow.enabled && glow.seekBar)
                GlowRenderer.track(canvas, 28*d, 124.5f*d, getWidth()*.6f, 127.5f*d, paint.getColor(), glow, d);
            canvas.drawLine(28*d, 126*d, getWidth()*0.6f, 126*d, paint);
            paint.setColor(color(ThemeRole.SEEK_SCRUBBER, paint.getColor()));
            if (InstalledTweaks.has("glow") && glow.enabled && glow.scrubber)
                GlowRenderer.circle(canvas, getWidth()*.6f, 126*d, 5*d, paint.getColor(), glow, d);
            canvas.drawCircle(getWidth()*0.6f, 126*d, 5*d, paint);
            paint.setColor(color(ThemeRole.TAB_ICON, palette.lightFoundation ? 0xFF0F0F0F : 0xFFF1F1F1));
            for (int i=0; i<4; i++) {
                if (InstalledTweaks.has("glow") && glow.enabled && glow.pivot)
                    GlowRenderer.circle(canvas, getWidth()*(i+1)/5f, 161*d, 7*d, paint.getColor(), glow, 12*d, i == 0 ? .9f : .45f);
                canvas.drawCircle(getWidth()*(i+1)/5f, 161*d, 7*d, paint);
            }
        }
    }
}
