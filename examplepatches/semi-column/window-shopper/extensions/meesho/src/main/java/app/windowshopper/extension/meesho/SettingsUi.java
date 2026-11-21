package app.windowshopper.extension.meesho;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Intent;
import android.content.ComponentName;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.net.Uri;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import org.json.JSONException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public final class SettingsUi {
    static final int ACCENT = Color.rgb(159, 37, 112);
    private static final int INK = 0xFF353543;
    private static final int MUTED = 0xFF616173;
    private static final int BACKGROUND = 0xFFFAFAFA;
    private static final int PRIMARY = 0xFF9F2089;
    private static final String REPO = "semi-column/window-shopper";
    private static final String[] CATEGORIES = {"Ads", "Ratings", "Layout", "Privacy"};

    private SettingsUi() {}

    static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    static Drawable background(int color, int radius, Activity activity) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(activity, radius));
        return shape;
    }

    static Drawable buttonBackground(Activity activity, boolean filled) {
        return new RippleDrawable(ColorStateList.valueOf(
            filled ? 0x33FFFFFF : 0x189F2570),
            background(filled ? ACCENT : Color.WHITE, 28, activity), null);
    }

    public static void show(Activity activity) { show(activity, false); }

    private static void show(Activity activity, boolean pending) {
        try {
            showDialog(activity, pending);
        } catch (ReflectiveOperationException | Resources.NotFoundException error) {
            Log.e("WindowShopper", "Cannot load Meesho settings UI", error);
            Toast.makeText(activity, "Could not open Morphe settings", Toast.LENGTH_LONG).show();
        }
    }

    private static void showDialog(Activity activity, boolean pending) throws ReflectiveOperationException {
        Dialog dialog = new Dialog(activity, android.R.style.Theme_Material_Light_NoActionBar);
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BACKGROUND);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });

        Class<?> toolbarType = Class.forName("com.meesho.mesh.android.components.MeshToolbar");
        View toolbar = (View) toolbarType.getConstructor(Context.class).newInstance(activity);
        toolbarType.getMethod("setTitle", CharSequence.class).invoke(toolbar, "MORPHE");
        toolbarType.getMethod("setNavigationIcon", int.class)
            .invoke(toolbar, resource(activity, "drawable", "mesh_ic_toolbar_navigation_back"));
        toolbarType.getMethod("setNavigationContentDescription", CharSequence.class).invoke(toolbar, "Back");
        toolbarType.getMethod("setNavigationOnClickListener", View.OnClickListener.class)
            .invoke(toolbar, (View.OnClickListener) view -> dialog.dismiss());
        root.addView(toolbar, new LinearLayout.LayoutParams(-1, dp(activity, 56)));
        root.addView(divider(activity));

        ScrollView scroll = new ScrollView(activity);
        LinearLayout preferences = new LinearLayout(activity);
        preferences.setOrientation(LinearLayout.VERTICAL);
        preferences.setPadding(0, 0, 0, dp(activity, 16));
        scroll.addView(preferences);
        FrameLayout body = new FrameLayout(activity);
        body.addView(scroll);
        TextView apply = text(activity, "Apply & reopen Meesho", 16, Color.WHITE, false);
        apply.setGravity(Gravity.CENTER);
        apply.setPadding(dp(activity, 24), 0, dp(activity, 24), 0);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(PRIMARY);
        pill.setCornerRadius(dp(activity, 28));
        apply.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), pill, null));
        apply.setElevation(dp(activity, 6));
        apply.setVisibility(View.GONE);
        FrameLayout.LayoutParams applyParams = new FrameLayout.LayoutParams(-2, dp(activity, 56),
            Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        applyParams.bottomMargin = dp(activity, 24);
        body.addView(apply, applyParams);
        root.addView(body, new LinearLayout.LayoutParams(-1, 0, 1));
        Runnable changed = () -> {
            if (apply.getVisibility() == View.VISIBLE) return;
            preferences.setPadding(0, 0, 0, dp(activity, 104));
            apply.setVisibility(View.VISIBLE);
            apply.setAlpha(0f);
            apply.setTranslationY(dp(activity, 24));
            apply.animate().alpha(1f).translationY(0f).setDuration(200).start();
        };

        for (int category = 0; category < CATEGORIES.length; category++) {
            TextView heading = text(activity, CATEGORIES[category], 20, INK, true);
            heading.setPadding(dp(activity, 16), dp(activity, 16), dp(activity, 16), dp(activity, 12));
            heading.setBackgroundColor(Color.WHITE);
            heading.setAccessibilityHeading(true);
            preferences.addView(heading);
            for (Settings.Feature feature : Settings.Feature.values()) {
                if (feature.category == category) preferences.addView(featureRow(activity, feature, changed));
            }
            if (category == 2) preferences.addView(tabsRow(activity, changed));
            preferences.addView(divider(activity));
        }

        TextView note = text(activity,
            "Settings are saved automatically. Apply & reopen Meesho appears after a change; "
            + "it rebuilds navigation and keeps your sign-in.", 13, MUTED, false);
        note.setPadding(dp(activity, 16), dp(activity, 8), dp(activity, 16), dp(activity, 16));
        preferences.addView(note);
        preferences.addView(divider(activity));
        preferences.addView(backupSection(activity, dialog));
        preferences.addView(divider(activity));
        preferences.addView(aboutRow(activity));
        if (pending) changed.run();
        apply.setOnClickListener(view -> {
            try {
                activity.startActivity(Intent.makeRestartActivityTask(new ComponentName(
                    activity, "com.meesho.supply.main.MainActivity")));
                dialog.dismiss();
            } catch (ActivityNotFoundException error) {
                Log.e("WindowShopper", "Meesho main entry unavailable", error);
                Toast.makeText(activity, "Could not reopen Meesho; reopen it manually", Toast.LENGTH_LONG).show();
            }
        });
        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window == null) throw new IllegalStateException("Morphe settings window unavailable");
        window.setStatusBarColor(BACKGROUND);
        window.setNavigationBarColor(BACKGROUND);
        window.getDecorView().setSystemUiVisibility(
            View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        dialog.show();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        root.requestApplyInsets();
    }

    private static View aboutRow(Activity activity) {
        LinearLayout section = new LinearLayout(activity);
        section.setOrientation(LinearLayout.VERTICAL);
        section.setPadding(dp(activity, 16), dp(activity, 16), dp(activity, 16), dp(activity, 24));
        TextView heading = text(activity, "About", 20, INK, true);
        heading.setAccessibilityHeading(true);
        heading.setPadding(0, 0, 0, dp(activity, 12));
        section.addView(heading);

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(activity, 16), dp(activity, 16), dp(activity, 16), dp(activity, 16));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(Color.WHITE);
        cardBg.setCornerRadius(dp(activity, 12));
        cardBg.setStroke(dp(activity, 1), 0xFFE0E0E8);
        card.setBackground(cardBg);
        section.addView(card);

        LinearLayout title = new LinearLayout(activity);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.addView(text(activity, "Window Shopper", 18, INK, true), new LinearLayout.LayoutParams(0, -2, 1));
        TextView version = text(activity, "v" + BuildConfig.PATCHES_VERSION, 12, PRIMARY, false);
        version.setPadding(dp(activity, 10), dp(activity, 4), dp(activity, 10), dp(activity, 4));
        GradientDrawable chip = new GradientDrawable();
        chip.setColor(0x149F2089);
        chip.setCornerRadius(dp(activity, 12));
        version.setBackground(chip);
        title.addView(version);
        card.addView(title);

        TextView body = text(activity, "Open-source Morphe patches that unclutter Meesho. "
            + "If they help, a star on GitHub helps others find them.", 14, MUTED, false);
        body.setPadding(0, dp(activity, 8), 0, dp(activity, 16));
        card.addView(body);

        LinearLayout buttons = new LinearLayout(activity);
        LinearLayout.LayoutParams half = new LinearLayout.LayoutParams(0, dp(activity, 44), 1);
        buttons.addView(button(activity, "GitHub", false), half);
        LinearLayout.LayoutParams right = new LinearLayout.LayoutParams(0, dp(activity, 44), 1);
        right.leftMargin = dp(activity, 12);
        buttons.addView(button(activity, "\u2605 Star repo", true), right);
        card.addView(buttons);
        for (int i = 0; i < buttons.getChildCount(); i++) {
            buttons.getChildAt(i).setOnClickListener(view -> {
                try {
                    activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://github.com/" + REPO)));
                } catch (ActivityNotFoundException error) {
                    Toast.makeText(activity, "No browser found", Toast.LENGTH_SHORT).show();
                }
            });
        }
        return section;
    }

    private static TextView button(Activity activity, String label, boolean filled) {
        TextView button = text(activity, label, 14, filled ? Color.WHITE : PRIMARY, false);
        button.setGravity(Gravity.CENTER);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(activity, 8));
        if (filled) bg.setColor(PRIMARY);
        else { bg.setColor(Color.WHITE); bg.setStroke(dp(activity, 1), PRIMARY); }
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(filled ? 0x33FFFFFF : 0x149F2089), bg, null));
        return button;
    }

    private static View backupSection(Activity activity, Dialog dialog) {
        LinearLayout section = new LinearLayout(activity);
        section.setOrientation(LinearLayout.VERTICAL);
        TextView heading = text(activity, "Backup", 20, INK, true);
        heading.setPadding(dp(activity, 16), dp(activity, 16), dp(activity, 16), dp(activity, 12));
        heading.setBackgroundColor(Color.WHITE);
        heading.setAccessibilityHeading(true);
        section.addView(heading);
        section.addView(actionRow(activity, "Export settings", "Copy settings as JSON and share or save them.", view -> {
            try {
                String json = Settings.exportJson();
                ((ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE))
                    .setPrimaryClip(ClipData.newPlainText("Window Shopper settings", json));
                Intent send = new Intent(Intent.ACTION_SEND).setType("application/json")
                    .putExtra(Intent.EXTRA_SUBJECT, "window-shopper-meesho.json").putExtra(Intent.EXTRA_TEXT, json);
                activity.startActivity(Intent.createChooser(send, "Export settings"));
                Toast.makeText(activity, "Settings copied to clipboard", Toast.LENGTH_SHORT).show();
            } catch (JSONException | ActivityNotFoundException error) {
                Log.e("WindowShopper", "Cannot export settings", error);
                Toast.makeText(activity, "Could not export settings", Toast.LENGTH_LONG).show();
            }
        }));
        section.addView(actionRow(activity, "Import settings", "Paste exported JSON to replace these settings.", view -> {
            EditText input = new EditText(activity);
            input.setHint("Paste settings JSON");
            input.setMinLines(4);
            input.setTextSize(13);
            ClipData clip = ((ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE)).getPrimaryClip();
            if (clip != null && clip.getItemCount() > 0) {
                CharSequence pasted = clip.getItemAt(0).coerceToText(activity);
                if (pasted != null && pasted.toString().contains("window-shopper-meesho")) input.setText(pasted);
            }
            FrameLayout box = new FrameLayout(activity);
            box.setPadding(dp(activity, 20), dp(activity, 8), dp(activity, 20), 0);
            box.addView(input);
            new AlertDialog.Builder(activity)
                .setTitle("Import settings")
                .setView(box)
                .setPositiveButton("Import", (alert, which) -> {
                    try {
                        int count = Settings.importJson(input.getText().toString());
                        Toast.makeText(activity, "Imported " + count + " settings", Toast.LENGTH_SHORT).show();
                        dialog.dismiss();
                        show(activity, true);
                    } catch (JSONException | IllegalStateException error) {
                        Log.e("WindowShopper", "Cannot import settings", error);
                        Toast.makeText(activity, "Invalid settings: " + error.getMessage(), Toast.LENGTH_LONG).show();
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
        }));
        return section;
    }

    private static View actionRow(Activity activity, String title, String summary, View.OnClickListener click) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setMinimumHeight(dp(activity, 72));
        row.setPadding(dp(activity, 16), dp(activity, 12), dp(activity, 16), dp(activity, 12));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(0x149F2089),
            new ColorDrawable(Color.WHITE), null));
        row.addView(text(activity, title, 17, INK, false));
        TextView detail = text(activity, summary, 14, MUTED, false);
        detail.setPadding(0, dp(activity, 4), 0, 0);
        row.addView(detail);
        row.setOnClickListener(click);
        return row;
    }

    private static View featureRow(Activity activity, Settings.Feature feature, Runnable changed) throws ReflectiveOperationException {
        boolean available = feature.available();
        LinearLayout row = new LinearLayout(activity);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(activity, 72));
        row.setPadding(dp(activity, 16), dp(activity, 12), dp(activity, 16), dp(activity, 12));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(0x149F2089),
            new ColorDrawable(Color.WHITE), null));
        row.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        LinearLayout labels = new LinearLayout(activity);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setPadding(0, 0, dp(activity, 12), 0);
        labels.addView(text(activity, feature.title, 17, INK, false));
        TextView detail = text(activity, available ? feature.summary
            : "Not included in this APK. Select its patch before building.", 14, MUTED, false);
        detail.setPadding(0, dp(activity, 4), 0, 0);
        labels.addView(detail);
        row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1));
        CompoundButton toggle = (CompoundButton) Class.forName("com.google.android.material.switchmaterial.SwitchMaterial")
            .getConstructor(Context.class).newInstance(activity);
        toggle.setMinimumHeight(dp(activity, 48));
        toggle.setContentDescription(feature.title);
        toggle.setTag("morphe-" + feature.name());
        toggle.setChecked(Settings.enabled(feature));
        toggle.setEnabled(available);
        toggle.setOnCheckedChangeListener((view, checked) -> {
            if (!Settings.save(feature, checked)) {
                Toast.makeText(activity, "Could not save setting; it may reset after restart",
                    Toast.LENGTH_LONG).show();
            }
            changed.run();
        });
        row.addView(toggle);
        row.setOnClickListener(view -> { if (available) toggle.setChecked(!toggle.isChecked()); });
        if (!available) row.setAlpha(0.55f);
        return row;
    }

    private static View tabsRow(Activity activity, Runnable changed) {
        boolean available = Unclutter.hideNavTabs();
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setMinimumHeight(dp(activity, 72));
        row.setPadding(dp(activity, 16), dp(activity, 12), dp(activity, 16), dp(activity, 12));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(0x149F2089),
            new ColorDrawable(Color.WHITE), null));
        row.addView(text(activity, "Tab bar", 17, INK, false));
        TextView detail = text(activity, "", 14, MUTED, false);
        detail.setPadding(0, dp(activity, 4), 0, 0);
        row.addView(detail);
        Runnable refresh = () -> {
            List<String> names = new ArrayList<>();
            java.util.Map<String, String> known = Settings.knownTabs();
            for (String tab : Settings.tabs()) if (known.containsKey(tab)) names.add(known.get(tab));
            detail.setText(!available ? "Not included in this APK. Select its patch before building."
                : names.isEmpty() ? "Meesho default. Tap to choose and reorder up to 5 tabs."
                : String.join(" · ", names));
        };
        refresh.run();
        row.setOnClickListener(view -> { if (available) tabsDialog(activity, () -> { refresh.run(); changed.run(); }); });
        if (!available) row.setAlpha(0.55f);
        return row;
    }

    private static void tabsDialog(Activity activity, Runnable done) {
        java.util.Map<String, String> known = Settings.knownTabs();
        if (known.isEmpty()) {
            Toast.makeText(activity, "Open the home screen once, then try again", Toast.LENGTH_LONG).show();
            return;
        }
        List<String> order = new ArrayList<>();
        Set<String> picked = new HashSet<>();
        for (String tab : Settings.tabs()) if (known.containsKey(tab) && picked.add(tab)) order.add(tab);
        if (picked.isEmpty()) {
            for (String tab : known.keySet()) if (!tab.equals("action_account") && picked.size() < NavTabs.MAX) picked.add(tab);
        }
        for (String tab : known.keySet()) if (!order.contains(tab)) order.add(tab);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(dp(activity, 8), dp(activity, 8), dp(activity, 8), 0);
        for (String tab : order) {
            LinearLayout row = new LinearLayout(activity);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setTag(tab);
            CheckBox box = new CheckBox(activity);
            box.setText(known.get(tab));
            box.setTextAppearance(activity, resource(activity, "style", "TextAppearance.Mesh.Body1"));
            box.setButtonTintList(new ColorStateList(new int[][] {{android.R.attr.state_checked}, {}},
                new int[] {PRIMARY, MUTED}));
            box.setTextSize(16);
            box.setChecked(picked.contains(tab));
            box.setOnCheckedChangeListener((view, checked) -> {
                if (checked && picked.size() >= NavTabs.MAX) {
                    view.setChecked(false);
                    Toast.makeText(activity, "Up to 5 tabs", Toast.LENGTH_SHORT).show();
                } else if (checked) picked.add(tab);
                else picked.remove(tab);
            });
            row.addView(box, new LinearLayout.LayoutParams(0, dp(activity, 48), 1));
            TextView handle = text(activity, "≡", 24, MUTED, false);
            handle.setGravity(Gravity.CENTER);
            handle.setContentDescription("Reorder " + known.get(tab));
            handle.setOnTouchListener((view, event) -> {
                switch (event.getActionMasked()) {
                    case android.view.MotionEvent.ACTION_DOWN:
                        list.requestDisallowInterceptTouchEvent(true);
                        row.setAlpha(0.6f);
                        return true;
                    case android.view.MotionEvent.ACTION_MOVE:
                        float y = row.getTop() + row.getHeight() / 2f + event.getY() - view.getHeight() / 2f;
                        for (int i = 0; i < list.getChildCount(); i++) {
                            View other = list.getChildAt(i);
                            if (other != row && y > other.getTop() && y < other.getBottom()) {
                                // Move the neighbour, not the touched row: removing it would cancel this drag.
                                int from = list.indexOfChild(row);
                                list.removeView(other);
                                list.addView(other, from);
                                break;
                            }
                        }
                        return true;
                    case android.view.MotionEvent.ACTION_UP:
                    case android.view.MotionEvent.ACTION_CANCEL:
                        row.setAlpha(1f);
                        return true;
                    default:
                        return false;
                }
            });
            // Screen-reader alternative to dragging.
            handle.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.addAction(new AccessibilityNodeInfo.AccessibilityAction(1, "Move up"));
                    info.addAction(new AccessibilityNodeInfo.AccessibilityAction(2, "Move down"));
                }
                public boolean performAccessibilityAction(View host, int action, android.os.Bundle args) {
                    if (action != 1 && action != 2) return super.performAccessibilityAction(host, action, args);
                    int to = list.indexOfChild(row) + (action == 1 ? -1 : 1);
                    if (to < 0 || to >= list.getChildCount()) return false;
                    list.removeView(row);
                    list.addView(row, to);
                    return true;
                }
            });
            row.addView(handle, new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 48)));
            list.addView(row);
        }
        new AlertDialog.Builder(activity)
            .setTitle("Tab bar")
            .setMessage("Choose up to 5 tabs. Drag ≡ to reorder, top is leftmost.")
            .setView(list)
            .setPositiveButton("Save", (dialog, which) -> {
                List<String> tabs = new ArrayList<>();
                for (int i = 0; i < list.getChildCount(); i++) {
                    String tab = (String) list.getChildAt(i).getTag();
                    if (picked.contains(tab)) tabs.add(tab);
                }
                if (tabs.isEmpty() || !Settings.saveTabs(tabs)) {
                    Toast.makeText(activity, "Select at least one tab", Toast.LENGTH_LONG).show();
                }
                done.run();
            })
            .setNeutralButton("Default", (dialog, which) -> { Settings.saveTabs(new ArrayList<>()); done.run(); })
            .setNegativeButton("Cancel", null)
            .show();
    }

    private static TextView text(Activity activity, String value, int size, int color, boolean bold) {
        TextView text = new TextView(activity);
        text.setTextAppearance(activity, resource(activity, "style", bold ? "TextAppearance.Mesh.Headline6"
            : size > 14 ? "TextAppearance.Mesh.Body1" : "TextAppearance.Mesh.Body2"));
        text.setText(value);
        text.setTextSize(size);
        text.setTextColor(color);
        return text;
    }

    private static int resource(Activity activity, String type, String name) {
        int id = activity.getResources().getIdentifier(name, type, "com.meesho.supply");
        if (id == 0) throw new Resources.NotFoundException("Missing Meesho resource: " + type + "/" + name);
        return id;
    }

    private static View divider(Activity activity) {
        View divider = new View(activity);
        divider.setBackground(activity.getResources().getDrawable(
            resource(activity, "drawable", "mesh_list_divider_bg"), activity.getTheme()));
        divider.setLayoutParams(new LinearLayout.LayoutParams(-1, activity.getResources()
            .getDimensionPixelSize(resource(activity, "dimen", "mesh_divider_height"))));
        return divider;
    }

    static final class SortIcon extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        SortIcon() {
            paint.setColor(Color.WHITE);
            paint.setStrokeWidth(2);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStyle(Paint.Style.STROKE);
        }

        public void draw(Canvas canvas) {
            canvas.save();
            canvas.translate(getBounds().left, getBounds().top);
            canvas.scale(getBounds().width() / 24f, getBounds().height() / 24f);
            canvas.drawLine(4, 6, 15, 6, paint);
            canvas.drawLine(4, 12, 12, 12, paint);
            canvas.drawLine(4, 18, 9, 18, paint);
            canvas.drawLine(19, 5, 19, 19, paint);
            canvas.drawLine(16, 16, 19, 19, paint);
            canvas.drawLine(19, 19, 22, 16, paint);
            canvas.restore();
        }

        public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
        public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
