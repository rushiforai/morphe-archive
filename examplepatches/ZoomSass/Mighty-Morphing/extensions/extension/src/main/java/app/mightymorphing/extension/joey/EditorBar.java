package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Show, hide, and reorder each button on Joey's editor formatting bar.
 * A hidden button is set gone after Joey finishes its own setup.
 */
public final class EditorBar {
    private static final String PREFS = "mighty_morphing";
    private static final String KEY_HIDDEN = "editor_bar_hidden";
    private static final String KEY_ORDER = "editor_bar_order";
    private static final String KEY_ICON = "editor_bar_icon_dp";
    private static final int ICON_MIN = 16;
    private static final int ICON_MAX = 36;
    private static final int ICON_DEFAULT = 24;
    /** Touch target is the icon plus 12dp of padding on each side. */
    private static final int TARGET_EXTRA = 24;

    private static final String[][] BUTTONS = {
            {"switcher", "Editor switch", "fpe"},
            {"undo", "Undo", "undo"},
            {"redo", "Redo", "redo"},
            {"preview", "Preview", "preview"},
            {"drafts", "Drafts", "folder_outline"},
            {"smiley", "Emoticon", "emoticon_open_mouth"},
            {"bold", "Bold", "bold"},
            {"italic", "Italic", "italic"},
            {"strikethrough", "Strikethrough", "strikethrough"},
            {"editor_actions_image", "Image", "image_outline"},
            {"editor_actions_gif", "Video", "video_outline"},
            {"link", "Link", "link"},
            {"spoiler", "Spoiler", "alert_circle"},
            {"superscript", "Superscript", "superscript"},
            {"bulletlist", "Bulleted list", "bulletlist"},
            {"numbersList", "Numbered list", "numberslist"},
            {"clear_format", "Clear formatting", "clear_format"},
            {"quote", "Quote", "quote"},
            {"code", "Code", "code"},
            {"heading", "Heading", "heading"},
            {"table", "Table", "table"},
            {"joey_promotion", "Joey promotion", "ic_launcher"},
            {"device_info", "Device info", "info_outline"},
    };

    private EditorBar() {
    }

    public static void apply(Activity activity) {
        try {
            if (activity == null) return;
            Set<String> hidden = hidden(activity);
            List<String> order = getOrder(activity);
            String pkg = activity.getPackageName();

            // First apply visibility
            for (String[] button : BUTTONS) {
                int id = activity.getResources().getIdentifier(button[0], "id", pkg);
                if (id == 0) continue;
                View view = activity.findViewById(id);
                if (view != null && hidden.contains(button[0])) {
                    view.setVisibility(View.GONE);
                }
            }

            // Reorder horizontal scrollable buttons
            // In editor_actions.xml, buttons after preview (drafts, smiley, bold, etc.)
            // are inside a CLinearLayout child of HorizontalScrollView
            int draftsId = activity.getResources().getIdentifier("drafts", "id", pkg);
            if (draftsId != 0) {
                View draftsView = activity.findViewById(draftsId);
                if (draftsView != null && draftsView.getParent() instanceof ViewGroup) {
                    ViewGroup scrollContainer = (ViewGroup) draftsView.getParent();
                    // Reorder views inside scrollContainer according to order
                    for (String idName : order) {
                        int resId = activity.getResources().getIdentifier(idName, "id", pkg);
                        if (resId == 0) continue;
                        View v = activity.findViewById(resId);
                        if (v != null && v.getParent() == scrollContainer) {
                            scrollContainer.removeView(v);
                            scrollContainer.addView(v);
                        }
                    }
                }
            }

            // Also reorder fixed buttons (switcher, undo, redo, preview) if they share the top CLinearLayout
            int switcherId = activity.getResources().getIdentifier("switcher", "id", pkg);
            if (switcherId != 0) {
                View switcherView = activity.findViewById(switcherId);
                if (switcherView != null && switcherView.getParent() instanceof ViewGroup) {
                    ViewGroup topContainer = (ViewGroup) switcherView.getParent();
                    int targetIdx = 0;
                    for (String idName : order) {
                        int resId = activity.getResources().getIdentifier(idName, "id", pkg);
                        if (resId == 0) continue;
                        View v = activity.findViewById(resId);
                        if (v != null && v.getParent() == topContainer && !(v instanceof android.widget.HorizontalScrollView)) {
                            topContainer.removeView(v);
                            topContainer.addView(v, Math.min(targetIdx, topContainer.getChildCount() - 1));
                            targetIdx++;
                        }
                    }
                }
            }
            restyle(activity);
        } catch (Throwable ignored) {
        }
    }

    private static final String DIVIDER = "mm_bar_divider";
    private static final int KEYBOARD_TAG = 0x4d4d4b42;
    private static final int ICON_TAG = 0x4d4d4943;

    private static String entryName(Activity activity, int id) {
        try {
            return activity.getResources().getResourceEntryName(id);
        } catch (Throwable ignored) {
            return "";
        }
    }

    /** Modern UI: bigger touch targets, a themed surface and a divider after the fixed buttons. */
    private static void restyle(Activity activity) {
        try {
            if (!ModernUi.isModernUiEnabled(activity)) return;
            if (activity.getWindow().getDecorView().getTag(KEYBOARD_TAG) == null) {
                activity.getWindow().getDecorView().setTag(KEYBOARD_TAG, Boolean.TRUE);
                KeyboardBackdrop.install(activity);
            }
            ModernUi.Palette palette = ModernUi.getPalette(activity);
            float d = activity.getResources().getDisplayMetrics().density;
            String pkg = activity.getPackageName();
            int draftsId = activity.getResources().getIdentifier("drafts", "id", pkg);
            View drafts = draftsId == 0 ? null : activity.findViewById(draftsId);
            if (drafts == null || !(drafts.getParent() instanceof ViewGroup)) return;
            ViewGroup scroller = (ViewGroup) drafts.getParent();
            ViewGroup top = scroller.getParent() instanceof android.widget.HorizontalScrollView
                    ? (ViewGroup) ((View) scroller.getParent()).getParent() : null;
            View scrollView = scroller.getParent() instanceof android.widget.HorizontalScrollView
                    ? (View) scroller.getParent() : null;
            int icon = iconDp(activity);
            int size = Math.round((icon + TARGET_EXTRA) * d);
            int pad = Math.round(12 * d);
            for (ViewGroup group : new ViewGroup[]{scroller, top}) {
                if (group == null) continue;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View v = group.getChildAt(i);
                    if (!(v instanceof android.widget.ImageView)) continue;
                    ViewGroup.LayoutParams lp = v.getLayoutParams();
                    if (lp == null) continue;
                    lp.width = size;
                    lp.height = size;
                    v.setLayoutParams(lp);
                    v.setPadding(pad, pad, pad, pad);
                    ((android.widget.ImageView) v).setScaleType(android.widget.ImageView.ScaleType.FIT_CENTER);
                    if (v.getTag(ICON_TAG) == null) {
                        v.setTag(ICON_TAG, Boolean.TRUE);
                        String[] def = v.getId() == View.NO_ID ? null : findDef(entryName(activity, v.getId()));
                        android.graphics.drawable.Drawable pack = def == null ? null : ModernIcons.packed(activity, def[2]);
                        if (pack != null) ((android.widget.ImageView) v).setImageDrawable(pack);
                    }
                }
            }
            if (top == null) return;
            android.graphics.drawable.GradientDrawable surface = new android.graphics.drawable.GradientDrawable();
            surface.setColor(palette.container);
            android.graphics.drawable.LayerDrawable layers = new android.graphics.drawable.LayerDrawable(
                    new android.graphics.drawable.Drawable[]{surface});
            top.setBackground(layers);
            if (top.findViewWithTag(DIVIDER) == null && scrollView != null && top instanceof android.widget.LinearLayout) {
                View line = new View(activity);
                line.setTag(DIVIDER);
                line.setBackgroundColor(palette.outline);
                android.widget.LinearLayout.LayoutParams lp = new android.widget.LinearLayout.LayoutParams(
                        Math.max(1, Math.round(d)), Math.round(24 * d));
                lp.gravity = android.view.Gravity.CENTER_VERTICAL;
                lp.setMargins(Math.round(4 * d), 0, Math.round(4 * d), 0);
                top.addView(line, top.indexOfChild(scrollView), lp);
            }
        } catch (Throwable ignored) {
        }
    }

    static void show(Activity activity) {
        Set<String> hidden = new HashSet<>(hidden(activity));
        List<List<String>> zones = ZoneEditor.lists(3);
        for (String id : getOrder(activity)) {
            if (findDef(id) == null) continue;
            zones.get(hidden.contains(id) ? 2 : isPinned(id) ? 0 : 1).add(id);
        }
        FrameLayout stage = new FrameLayout(activity);
        stage.setClipChildren(true);
        Runnable[] repaint = new Runnable[1];
        LinearLayout top = new LinearLayout(activity);
        top.setOrientation(LinearLayout.VERTICAL);
        top.addView(stage);
        top.addView(sizeControl(activity, () -> {
            if (repaint[0] != null) repaint[0].run();
        }));
        Runnable paint = () -> {
            LinearLayout host = new LinearLayout(activity);
            host.setOrientation(LinearLayout.VERTICAL);
            List<String> shown = new ArrayList<>(zones.get(0));
            shown.addAll(zones.get(1));
            drawBar(activity, host, shown);
            BarPreview.show(activity, stage, host);
        };
        Runnable save = () -> {
            List<String> all = new ArrayList<>(zones.get(0));
            all.addAll(zones.get(1));
            all.addAll(zones.get(2));
            saveHidden(activity, new HashSet<>(zones.get(2)));
            saveOrder(activity, all);
            paint.run();
        };
        repaint[0] = paint;
        ZoneEditor editor = new ZoneEditor(activity,
                new String[]{"Left, always visible", "Right", "Hidden"},
                new String[]{"Drag a button here", "Drag a button here", "Drag a button here to hide it"},
                zones, (id, zone) -> zone == 2 || (zone == 0) == isPinned(id),
                new ZoneEditor.Look() {
                    @Override
                    public String label(String id) {
                        String[] def = findDef(id);
                        return def == null ? id : def[1];
                    }

                    @Override
                    public String icon(String id) {
                        String[] def = findDef(id);
                        return def == null ? null : def[2];
                    }
                }, save);
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        LinearLayout page = ZoneEditor.screen(activity, "Formatting bar",
                "Drag the handle to reorder a button within its side, or to hide it. Buttons stay on their own side of the bar. Preview, clear formatting, undo and redo stay hidden in editors that do not use them.",
                top, editor, reset, done);
        android.app.Dialog dialog = MorpheDialog.showFull(activity, page, 640, null);
        page.post(paint);
        reset.setOnClickListener(v -> {
            for (List<String> zone : zones) zone.clear();
            for (String[] def : BUTTONS) zones.get(isPinned(def[0]) ? 0 : 1).add(def[0]);
            saveIconDp(activity, ICON_DEFAULT);
            top.removeViewAt(1);
            top.addView(sizeControl(activity, () -> repaint[0].run()));
            save.run();
            editor.rebuild();
        });
        done.setOnClickListener(v -> dialog.dismiss());
    }

    /** Buttons on the fixed left side of the bar; everything else scrolls on the right. */
    private static boolean isPinned(String id) {
        return id.equals("switcher") || id.equals("undo") || id.equals("redo") || id.equals("preview");
    }

    /** The bar as it sits above the keyboard. It scrolls sideways when there are many buttons. */
    private static void drawBar(Activity activity, LinearLayout host, List<String> shown) {
        float density = activity.getResources().getDisplayMetrics().density;
        boolean modern = ModernUi.isModernUiEnabled(activity);
        ModernUi.Palette palette = modern ? ModernUi.getPalette(activity) : null;
        int text = palette != null ? palette.onSurfaceVariant : MorpheDialog.text(activity);
        int icon = iconDp(activity);
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(Math.round(4 * density), 0, Math.round(4 * density), 0);
        List<String> fixed = new ArrayList<>();
        List<String> moving = new ArrayList<>();
        for (String id : shown) {
            if (isPinned(id)) {
                fixed.add(id);
            } else {
                moving.add(id);
            }
        }
        List<String> ordered = new ArrayList<>(modern ? fixed : shown);
        if (modern) ordered.addAll(moving);
        boolean divided = false;
        for (String id : ordered) {
            String[] def = findDef(id);
            if (def == null) continue;
            if (modern && !divided && !fixed.isEmpty() && moving.contains(id)) {
                View line = new View(activity);
                line.setBackgroundColor(palette.outline);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        Math.max(1, Math.round(density)), Math.round(24 * density));
                lp.setMargins(Math.round(4 * density), 0, Math.round(4 * density), 0);
                row.addView(line, lp);
                divided = true;
            }
            int tint = modern && id.equals("switcher") ? palette.accent : text;
            android.widget.ImageView view = BarPreview.icon(activity, def[2], tint, icon);
            int pad = Math.round(12 * density);
            view.setPadding(pad, pad, pad, pad);
            view.setLayoutParams(new LinearLayout.LayoutParams(
                    Math.round((icon + TARGET_EXTRA) * density), Math.round((icon + TARGET_EXTRA) * density)));
            row.addView(view);
        }
        android.widget.HorizontalScrollView frame = new android.widget.HorizontalScrollView(activity);
        frame.setHorizontalScrollBarEnabled(false);
        frame.addView(row);
        host.addView(frame, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.round((icon + TARGET_EXTRA + 4) * density)));
        host.setBackgroundColor(palette != null ? palette.container : BarPreview.canvas(activity));
    }

    /** Icon size: three presets and a slider that goes a little beyond them. */
    private static View sizeControl(Activity activity, Runnable changed) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(0, Math.round(8 * density), 0, 0);

        LinearLayout head = new LinearLayout(activity);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        TextView label = new TextView(activity);
        label.setText("Icon size");
        label.setTextColor(MorpheDialog.text(activity));
        label.setTextSize(14);
        head.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        int[] presets = {20, 24, 28};
        String[] names = {"Compact", "Default", "Large"};
        TextView[] chips = new TextView[3];
        android.widget.SeekBar seek = new android.widget.SeekBar(activity);
        Runnable[] mark = new Runnable[1];
        mark[0] = () -> {
            int now = iconDp(activity);
            label.setText("Icon size  " + now + "dp");
            for (int i = 0; i < 3; i++) {
                chips[i].setTextColor(presets[i] == now ? MorpheDialog.GOLD : MorpheDialog.SUB);
            }
        };
        for (int i = 0; i < 3; i++) {
            TextView chip = MorpheDialog.action(activity, names[i], MorpheDialog.SUB);
            chip.setTextSize(13);
            final int dp = presets[i];
            chip.setOnClickListener(v -> {
                saveIconDp(activity, dp);
                seek.setProgress(dp - ICON_MIN);
                mark[0].run();
                changed.run();
            });
            chips[i] = chip;
            head.addView(chip);
        }
        box.addView(head);

        seek.setMax(ICON_MAX - ICON_MIN);
        seek.setProgress(iconDp(activity) - ICON_MIN);
        try {
            seek.getThumb().setTint(MorpheDialog.accent(activity));
            seek.getProgressDrawable().setTint(MorpheDialog.accent(activity));
        } catch (Throwable ignored) {
        }
        seek.setOnSeekBarChangeListener(new android.widget.SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(android.widget.SeekBar bar, int progress, boolean fromUser) {
                if (!fromUser) return;
                saveIconDp(activity, ICON_MIN + progress);
                mark[0].run();
                changed.run();
            }

            @Override
            public void onStartTrackingTouch(android.widget.SeekBar bar) {
            }

            @Override
            public void onStopTrackingTouch(android.widget.SeekBar bar) {
            }
        });
        box.addView(seek);
        mark[0].run();
        return box;
    }

    private static String[] findDef(String key) {
        for (String[] def : BUTTONS) {
            if (def[0].equals(key)) return def;
        }
        return null;
    }

    private static TextView arrowButton(Activity activity, String symbol, boolean enabled) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView btn = new TextView(activity);
        btn.setText(symbol);
        btn.setTextSize(16);
        btn.setTextColor(enabled ? MorpheDialog.GOLD : MorpheDialog.SUB);
        btn.setAlpha(enabled ? 1.0f : 0.3f);
        btn.setGravity(Gravity.CENTER);
        btn.setClickable(enabled);
        btn.setFocusable(enabled);
        int padH = Math.round(12 * density);
        int padV = Math.round(8 * density);
        btn.setPadding(padH, padV, padH, padV);
        return btn;
    }

    private static List<String> getOrder(Context context) {
        List<String> list = new ArrayList<>();
        if (context != null) {
            String raw = prefs(context).getString(KEY_ORDER, null);
            if (raw != null && !raw.isEmpty()) {
                try {
                    JSONArray arr = new JSONArray(raw);
                    for (int i = 0; i < arr.length(); i++) {
                        String id = arr.optString(i, "");
                        if (!id.isEmpty() && findDef(id) != null && !list.contains(id)) {
                            list.add(id);
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        for (String[] def : BUTTONS) {
            if (!list.contains(def[0])) {
                list.add(def[0]);
            }
        }
        return list;
    }

    private static void saveOrder(Context context, List<String> order) {
        if (context == null || order == null) return;
        JSONArray arr = new JSONArray();
        for (String id : order) arr.put(id);
        prefs(context).edit().putString(KEY_ORDER, arr.toString()).apply();
    }

    private static void saveHidden(Context context, Set<String> hidden) {
        if (context == null || hidden == null) return;
        prefs(context).edit().putStringSet(KEY_HIDDEN, new HashSet<>(hidden)).apply();
    }

    static int iconDp(Context context) {
        int value = prefs(context).getInt(KEY_ICON, ICON_DEFAULT);
        return Math.max(ICON_MIN, Math.min(ICON_MAX, value));
    }

    private static void saveIconDp(Context context, int dp) {
        prefs(context).edit().putInt(KEY_ICON, Math.max(ICON_MIN, Math.min(ICON_MAX, dp))).apply();
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Set<String> hidden(Context context) {
        if (context == null) return new HashSet<>();
        Set<String> stored = prefs(context).getStringSet(KEY_HIDDEN, null);
        return stored == null ? new HashSet<>() : stored;
    }
}
