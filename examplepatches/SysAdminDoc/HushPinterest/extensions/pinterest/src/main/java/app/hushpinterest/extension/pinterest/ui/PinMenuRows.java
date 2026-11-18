/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.ResourceType;
import app.hushpinterest.extension.shared.ResourceUtils;
import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * The rows picked under Pick pin menu rows (#43), and folding them out of a pin's menu.
 *
 * <p>Every row in the menu and the overflow sheet carries its title as its content description, the
 * rows Hush adds included, so a row is recognized by the title Pinterest would show for it in the
 * app's language. The block saying why a pin is shown has many wordings and one id, so it goes by id.
 */
public final class PinMenuRows {
    /** The picked keys, comma separated. */
    public static final StringSetting PICKED = new StringSetting("hushpinterest_hidden_pin_menu_rows", "", false, false);

    public static final String REASON = "reason";
    private static final String REASON_ID = "reason_text";
    private static final String PLACEHOLDER = "%(?:\\d+\\$)?s";

    private static final String[] OWN_ROWS = {"download_pin", "download_visible", "media_details", "copy_media_link",
            "share_image", "copy_image"};

    /** A key, then the string resources of the titles that row can have. The first one names it in the list. */
    private static final String[][] PINTEREST_ROWS = {
            {"save", "save_pin"},
            {"share", "overflow_menu_share"},
            {"download_image", "save_to_device"},
            {"copy_link", "copy_link"},
            {"add_to_collage", "overflow_menu_add_to_collage"},
            {"see_more", "overflow_menu_see_more", "overflow_menu_see_more_ai"},
            {"see_less", "overflow_menu_see_less", "overflow_menu_see_less_ai"},
            {"see_less_topic", "see_fewer_pins"},
            {"see_less_board", "stop_seeing_pins_based_on_board"},
            {"see_less_ai_topic", "grid_actions_gen_ai_topics_opt_out"},
            {"see_fewer_ads", "contextual_menu_see_fewer_weight_loss_ads"},
            {"hide", "hide_pin_option"},
            {"unfollow", "contextmenu_unfollow_board", "contextmenu_unfollow_user", "contextmenu_unfollow_topic",
                    "stop_following_board"},
            {"comment", "contextmenu_comment"},
            {"react", "contextmenu_react"},
            {"note", "contextmenu_add_note", "contextmenu_edit_note"},
            {"inspiration", "set_as_current_inspiration"},
            {"edit", "overflow_menu_edit"},
            {"delete_collage", "collage_delete_option"},
            {"visit_site", "pin_overflow_visit_site"},
            {"open_browser", "grid_actions_open_external_browser"},
            {"why_ad", "grid_actions_promoted_pin"},
            {"report", "grid_actions_report_pin"},
            {"report_ai", "grid_actions_report_ai_content"},
            {"manage_ai", "grid_actions_manage_ai_content"},
            {"ai_learn_more", "grid_actions_gen_ai_learn_more"},
    };

    /** What this feature folded, with the visibility to give back. Rows it didn't fold are never touched. */
    private static final Map<View, Integer> folded = new WeakHashMap<>();

    private PinMenuRows() {}

    /** One line of the list in settings. */
    public static final class Choice {
        public final String key;
        public final String label;

        Choice(String key, String label) {
            this.key = key;
            this.label = label;
        }
    }

    public static Set<String> picked() {
        Set<String> keys = new LinkedHashSet<>();
        for (String key : PICKED.get().split(",")) {
            if (!key.trim().isEmpty()) keys.add(key.trim());
        }
        return keys;
    }

    public static void pick(String key, boolean hide) {
        Set<String> keys = picked();
        if (hide) keys.add(key);
        else keys.remove(key);
        PICKED.save(String.join(",", keys));
    }

    /** The rows this build can show, named the way the menu names them. */
    public static List<Choice> choices(Context context) {
        List<Choice> choices = new ArrayList<>();
        Set<String> names = new HashSet<>();
        if (PatchFamily.Capability.PIN_DOWNLOADS.installed()) {
            for (String key : OWN_ROWS) add(choices, names, key, ownTitles(key).get(0));
        }
        add(choices, names, REASON, L10n.t("Why you're seeing this pin"));
        for (String[] row : PINTEREST_ROWS) {
            String title = text(context, row[1]);
            if (title != null) add(choices, names, row[0], title.replaceAll(PLACEHOLDER, "").trim());
        }
        return choices;
    }

    private static void add(List<Choice> choices, Set<String> names, String key, String label) {
        if (!label.isEmpty() && names.add(label)) choices.add(new Choice(key, label));
    }

    /** The names of the picked rows, in the order the list shows them. */
    public static List<String> pickedLabels(Context context) {
        Set<String> keys = picked();
        List<String> labels = new ArrayList<>();
        for (Choice choice : choices(context)) {
            if (keys.contains(choice.key)) labels.add(choice.label);
        }
        return labels;
    }

    private static List<String> ownTitles(String key) {
        switch (key) {
            case "download_pin": return Arrays.asList(L10n.t("Download pin"), L10n.t("Download unavailable"));
            case "download_visible": return Collections.singletonList(L10n.t("Download visible pins"));
            case "media_details": return Collections.singletonList(L10n.t("Media details"));
            case "copy_media_link": return Collections.singletonList(L10n.t("Copy media link"));
            case "share_image": return Collections.singletonList(L10n.t("Share image"));
            case "copy_image": return Collections.singletonList(L10n.t("Copy image"));
            default: return Collections.emptyList();
        }
    }

    private static String text(Context context, String resource) {
        int id = ResourceUtils.getIdentifier(context, ResourceType.STRING, resource);
        if (id == 0) return null;
        try {
            return context.getResources().getString(id);
        } catch (Resources.NotFoundException gone) {
            return null;
        }
    }

    /** Folds the picked rows under [root] and gives back any it folded that are no longer picked. */
    static void apply(View root, boolean on) {
        if (root == null) return;
        Set<String> keys = on ? picked() : Collections.emptySet();
        synchronized (folded) {
            if (keys.isEmpty() && folded.isEmpty()) return;
            wanted(root, new Titles(root.getContext(), keys));
        }
    }

    /** The titles to fold. A title with a name in it, such as Unfollow and a board, goes by its two ends. */
    private static final class Titles {
        final Set<String> exact = new HashSet<>();
        final List<String[]> around = new ArrayList<>();
        final boolean reason;

        Titles(Context context, Set<String> keys) {
            reason = keys.contains(REASON);
            for (String key : OWN_ROWS) {
                if (keys.contains(key)) exact.addAll(ownTitles(key));
            }
            for (String[] row : PINTEREST_ROWS) {
                if (!keys.contains(row[0])) continue;
                for (int at = 1; at < row.length; at++) {
                    String title = text(context, row[at]);
                    if (title == null) continue;
                    String[] ends = title.split(PLACEHOLDER, -1);
                    if (ends.length == 1) exact.add(title);
                    else if (ends.length == 2 && !ends[0].isEmpty()) around.add(ends);
                }
            }
        }

        boolean match(String description) {
            if (exact.contains(description)) return true;
            for (String[] ends : around) {
                if (description.length() > ends[0].length() + ends[1].length()
                        && description.startsWith(ends[0]) && description.endsWith(ends[1])) return true;
            }
            return false;
        }
    }

    /**
     * Whether [view] should fold, settling everything inside it first. Each view is set only once a
     * pass decides it, because this runs while the menu measures and flipping a view back and forth
     * there would ask for another layout every time.
     */
    private static boolean wanted(View view, Titles titles) {
        if (!(view instanceof ViewGroup)) return false;
        if (isRow(view, titles)) return true;
        ViewGroup group = (ViewGroup) view;
        View spacer = null;
        int rows = 0;
        int gone = 0;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            if (child.getClass() == View.class) {
                spacer = child;
                continue;
            }
            boolean hide = wanted(child, titles);
            set(child, hide);
            CharSequence description = child.getContentDescription();
            if (description != null && description.length() > 0) {
                rows++;
                if (hide) gone++;
            }
        }
        // See more and See less sit side by side with a gap between them. The one left takes the width.
        boolean pills = spacer != null && rows >= 2 && group instanceof LinearLayout
                && ((LinearLayout) group).getOrientation() == LinearLayout.HORIZONTAL;
        if (!pills) return false;
        set(spacer, gone > 0);
        return gone == rows;
    }

    private static boolean isRow(View view, Titles titles) {
        if (titles.reason && REASON_ID.equals(InterfaceControls.resourceName(view))) return true;
        CharSequence description = view.getContentDescription();
        return description != null && titles.match(description.toString());
    }

    private static void set(View view, boolean hide) {
        if (hide) {
            if (view.getVisibility() == View.GONE) return;
            folded.put(view, view.getVisibility());
            view.setVisibility(View.GONE);
        } else {
            Integer before = folded.remove(view);
            if (before != null && view.getVisibility() == View.GONE) view.setVisibility(before);
        }
    }
}
