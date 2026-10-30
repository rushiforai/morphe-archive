package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
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
        } catch (Throwable ignored) {
        }
    }

    static void show(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Formatting bar",
                "Untick a button to hide it, or use arrows to change button order. Preview, clear formatting, undo and redo stay hidden in editors that do not use them.");

        Set<String> hidden = new HashSet<>(hidden(activity));
        List<String> order = new ArrayList<>(getOrder(activity));

        LinearLayout rowsContainer = new LinearLayout(activity);
        rowsContainer.setOrientation(LinearLayout.VERTICAL);

        Runnable[] rebuildRef = new Runnable[1];
        rebuildRef[0] = () -> {
            rowsContainer.removeAllViews();
            float density = activity.getResources().getDisplayMetrics().density;
            for (int i = 0; i < order.size(); i++) {
                final int index = i;
                final String idName = order.get(i);
                String[] def = findDef(idName);
                if (def == null) continue;

                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setMinimumHeight(Math.round(44 * density));

                CheckBox box = MorpheDialog.check(activity, def[1], !hidden.contains(idName), def[2]);
                box.setOnCheckedChangeListener((buttonView, checked) -> {
                    if (checked) hidden.remove(idName);
                    else hidden.add(idName);
                    saveHidden(activity, hidden);
                });
                line.addView(box, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                TextView upBtn = arrowButton(activity, "▲", index > 0);
                if (index > 0) {
                    upBtn.setOnClickListener(v -> {
                        Collections.swap(order, index, index - 1);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                    });
                }
                line.addView(upBtn);

                TextView downBtn = arrowButton(activity, "▼", index < order.size() - 1);
                if (index < order.size() - 1) {
                    downBtn.setOnClickListener(v -> {
                        Collections.swap(order, index, index + 1);
                        saveOrder(activity, order);
                        rebuildRef[0].run();
                    });
                }
                line.addView(downBtn);

                rowsContainer.addView(line);
            }
        };
        rebuildRef[0].run();

        page.addView(MorpheDialog.scroller(activity, rowsContainer));
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done));

        AlertDialog dialog = MorpheDialog.show(activity, page);
        reset.setOnClickListener(v -> {
            hidden.clear();
            order.clear();
            for (String[] def : BUTTONS) order.add(def[0]);
            saveHidden(activity, hidden);
            saveOrder(activity, order);
            rebuildRef[0].run();
        });
        done.setOnClickListener(v -> dialog.dismiss());
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

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Set<String> hidden(Context context) {
        if (context == null) return new HashSet<>();
        Set<String> stored = prefs(context).getStringSet(KEY_HIDDEN, null);
        return stored == null ? new HashSet<>() : stored;
    }
}
