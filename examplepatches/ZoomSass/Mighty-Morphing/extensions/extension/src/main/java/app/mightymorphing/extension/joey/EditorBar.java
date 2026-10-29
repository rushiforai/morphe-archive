package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.HashSet;
import java.util.Set;

/**
 * Show or hide each button on Joey's editor formatting bar.
 * A hidden button is set gone after Joey finishes its own setup, so a mode that
 * already hides a button stays hidden when the box is left on.
 */
public final class EditorBar {
    private static final String KEY = "editor_bar_hidden";

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
            Set<String> hidden = hidden(activity);
            if (hidden.isEmpty()) return;
            String pkg = activity.getPackageName();
            for (String[] button : BUTTONS) {
                if (!hidden.contains(button[0])) continue;
                int id = activity.getResources().getIdentifier(button[0], "id", pkg);
                if (id == 0) continue;
                View view = activity.findViewById(id);
                if (view != null) view.setVisibility(View.GONE);
            }
        } catch (Throwable ignored) {
        }
    }

    static void show(Activity activity) {
        LinearLayout page = MorpheDialog.page(activity, "Formatting bar",
                "Untick a button to hide it. Preview, clear formatting, undo and redo stay hidden in the editor that does not use them.");
        Set<String> hidden = new HashSet<>(hidden(activity));
        java.util.List<View> cells = new java.util.ArrayList<>();
        for (String[] button : BUTTONS) {
            CheckBox box = MorpheDialog.check(activity, button[1], !hidden.contains(button[0]), button[2]);
            box.setOnCheckedChangeListener((CompoundButton view, boolean checked) -> {
                if (checked) hidden.remove(button[0]);
                else hidden.add(button[0]);
                activity.getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE)
                        .edit()
                        .putStringSet(KEY, new HashSet<>(hidden))
                        .commit();
            });
            cells.add(box);
        }
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        MorpheDialog.addGrid(rows, cells);
        page.addView(MorpheDialog.scroller(activity, rows));
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, done));
        AlertDialog dialog = MorpheDialog.show(activity, page);
        done.setOnClickListener(v -> dialog.dismiss());
    }

    private static Set<String> hidden(Context context) {
        Set<String> stored = context.getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE)
                .getStringSet(KEY, null);
        return stored == null ? new HashSet<>() : stored;
    }
}
