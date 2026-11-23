package app.merak.extension.authenticator;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

import app.merak.extension.authenticator.AccountOrganizerPatch.Entry;
import app.merak.extension.authenticator.OrganizerStore.Category;

/**
 * Views added to the account list screen: the organizer bar (layout toggle and organize button),
 * the folder grid, and the organize dialogs. Built with framework views only.
 */
final class OrganizerUi {

    private static WeakReference<LinearLayout> barRef = new WeakReference<>(null);
    private static WeakReference<ScrollView> gridRef = new WeakReference<>(null);

    /** Predictive back callback (API 33+), registered while a folder is open. */
    private static Object backCallback;
    private static WeakReference<Activity> backCallbackActivity = new WeakReference<>(null);

    private OrganizerUi() {
    }

    // region Attach / render

    /** Renders the bar and folder grid for the current state. */
    static void render(Activity activity) {
        if (!ensureAttached(activity)) return;
        OrganizerStore store = AccountOrganizerPatch.store();
        LinearLayout bar = barRef.get();
        ScrollView grid = gridRef.get();
        View swipe = findAppView(activity, "swipe_refresh");
        if (store == null || bar == null || grid == null || swipe == null) return;

        bar.setVisibility(View.VISIBLE);
        buildBar(activity, bar, store);

        boolean showGrid = store.isFolderMode() && AccountOrganizerPatch.openFolder == null;
        if (showGrid) buildGrid(activity, grid, store);
        grid.setVisibility(showGrid ? View.VISIBLE : View.GONE);
        swipe.setVisibility(showGrid ? View.GONE : View.VISIBLE);

        syncBackCallback(activity, store.isFolderMode() && AccountOrganizerPatch.openFolder != null);
    }

    /** Hides all organizer views, used when the app shows its "no accounts" screen. */
    static void hide(Activity activity) {
        LinearLayout bar = barRef.get();
        ScrollView grid = gridRef.get();
        if (bar != null) bar.setVisibility(View.GONE);
        if (grid != null) grid.setVisibility(View.GONE);
        View swipe = findAppView(activity, "swipe_refresh");
        if (swipe != null) swipe.setVisibility(View.VISIBLE);
        syncBackCallback(activity, false);
    }

    /**
     * The search view is a full screen overlay that stays visible while collapsed,
     * so whether search is open is read from its results list instead.
     */
    static boolean isSearchOpen(Activity activity) {
        View results = findAppView(activity, "filtered_otp_recycler_view");
        return results != null && results.isShown();
    }

    private static View findAppView(Activity activity, String idName) {
        int id = Ui.appIdentifier(activity, idName, "id");
        return id == 0 ? null : activity.findViewById(id);
    }

    /**
     * Inserts the bar between the search bar and the list, and the folder grid
     * in the list area. Layout: main_relative_view > [open_search_bar, swipe_refresh > list].
     */
    private static boolean ensureAttached(Activity activity) {
        View swipe = findAppView(activity, "swipe_refresh");
        View searchBar = findAppView(activity, "open_search_bar");
        if (swipe == null || searchBar == null || !(swipe.getParent() instanceof RelativeLayout)) {
            return false;
        }
        RelativeLayout parent = (RelativeLayout) swipe.getParent();

        LinearLayout bar = barRef.get();
        ScrollView grid = gridRef.get();
        if (bar != null && grid != null && bar.getParent() == parent && grid.getParent() == parent) {
            return true;
        }

        bar = new LinearLayout(activity);
        bar.setId(View.generateViewId());
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setMinimumHeight(Ui.dp(activity, 52));
        bar.setPadding(Ui.dp(activity, 8), Ui.dp(activity, 2), Ui.dp(activity, 8), Ui.dp(activity, 2));
        RelativeLayout.LayoutParams barParams = new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        barParams.addRule(RelativeLayout.BELOW, searchBar.getId());
        parent.addView(bar, parent.indexOfChild(swipe), barParams);

        RelativeLayout.LayoutParams swipeParams = (RelativeLayout.LayoutParams) swipe.getLayoutParams();
        swipeParams.addRule(RelativeLayout.BELOW, bar.getId());
        swipe.setLayoutParams(swipeParams);

        grid = new ScrollView(activity);
        grid.setClipToPadding(false);
        RelativeLayout.LayoutParams gridParams = new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        gridParams.addRule(RelativeLayout.BELOW, bar.getId());
        // Directly after the list, so the app's floating action button stays on top.
        parent.addView(grid, parent.indexOfChild(swipe) + 1, gridParams);
        grid.setVisibility(View.GONE);

        barRef = new WeakReference<>(bar);
        gridRef = new WeakReference<>(grid);
        return true;
    }

    // endregion

    // region Bar

    private static void buildBar(Activity activity, LinearLayout bar, OrganizerStore store) {
        bar.removeAllViews();
        final String open = AccountOrganizerPatch.openFolder;
        final boolean insideFolder = store.isFolderMode() && open != null;

        if (insideFolder) {
            ImageView back = iconButton(activity, "quantum_gm_ic_arrow_back_vd_theme_24", "←", "Back to folders");
            back.setOnClickListener(v -> AccountOrganizerPatch.closeOpenFolder());
            bar.addView(back);
        }

        TextView title = new TextView(activity);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setTextColor(Ui.onSurface(activity));
        title.setPadding(Ui.dp(activity, insideFolder ? 4 : 8), 0, Ui.dp(activity, 8), 0);
        if (insideFolder) {
            title.setText(folderTitle(store, open) + "  ·  " + folderCount(open));
        } else if (store.isFolderMode()) {
            title.setText("Folders");
        } else {
            int categories = store.categories.size();
            title.setText(categories == 0 ? "All accounts"
                    : categories + (categories == 1 ? " category" : " categories"));
        }
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        bar.addView(layoutToggle(activity, store.isFolderMode()));

        ImageView organize = iconButton(activity, "gs_settings_vd_theme_24", "⚙", "Organize accounts");
        organize.setOnClickListener(v -> showOrganizeDialog(activity));
        bar.addView(organize);
    }

    /** Segmented "Folders | Cards" control. */
    private static View layoutToggle(Activity activity, boolean folderMode) {
        LinearLayout toggle = new LinearLayout(activity);
        toggle.setOrientation(LinearLayout.HORIZONTAL);
        float radius = Ui.dp(activity, 18);
        toggle.setBackground(Ui.outlined(Ui.outlineVariant(activity), Ui.dp(activity, 1), radius, 0));
        int pad = Ui.dp(activity, 2);
        toggle.setPadding(pad, pad, pad, pad);
        toggle.addView(segment(activity, "Folders", folderMode, radius, v -> AccountOrganizerPatch.setFolderMode(true)));
        toggle.addView(segment(activity, "Cards", !folderMode, radius, v -> AccountOrganizerPatch.setFolderMode(false)));
        return toggle;
    }

    private static TextView segment(Activity activity, String label, boolean selected, float radius,
                                    View.OnClickListener listener) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(Ui.dp(activity, 32));
        view.setPadding(Ui.dp(activity, 14), 0, Ui.dp(activity, 14), 0);
        view.setSelected(selected);
        if (selected) {
            view.setBackground(Ui.rounded(Ui.secondaryContainer(activity), radius));
            view.setTextColor(Ui.onSecondaryContainer(activity));
        } else {
            view.setTextColor(Ui.onSurfaceVariant(activity));
            view.setBackground(Ui.selectableBackground(activity, false));
        }
        view.setContentDescription(label + " layout");
        view.setOnClickListener(listener);
        return view;
    }

    private static ImageView iconButton(Context context, String iconName, String fallbackText, String description) {
        ImageView button = new ImageView(context);
        int size = Ui.dp(context, 48);
        int pad = Ui.dp(context, 12);
        button.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        button.setPadding(pad, pad, pad, pad);
        Drawable icon = Ui.appIcon(context, iconName, Ui.onSurfaceVariant(context));
        if (icon != null) {
            button.setImageDrawable(icon);
        } else {
            button.setImageDrawable(new TextGlyph(context, fallbackText, Ui.onSurfaceVariant(context)));
        }
        button.setBackground(Ui.selectableBackground(context, true));
        button.setContentDescription(description);
        button.setClickable(true);
        button.setFocusable(true);
        return button;
    }

    private static String folderTitle(OrganizerStore store, String folderId) {
        if (OrganizerStore.FOLDER_ALL.equals(folderId)) return "All accounts";
        if (OrganizerStore.FOLDER_UNCATEGORIZED.equals(folderId)) return "Uncategorized";
        Category category = store.find(folderId);
        return category == null ? "" : category.name;
    }

    private static int folderCount(String folderId) {
        if (OrganizerStore.FOLDER_ALL.equals(folderId)) return AccountOrganizerPatch.entries.size();
        if (OrganizerStore.FOLDER_UNCATEGORIZED.equals(folderId)) return AccountOrganizerPatch.countIn(null);
        return AccountOrganizerPatch.countIn(folderId);
    }

    // endregion

    // region Folder grid

    private static void buildGrid(Activity activity, ScrollView scroll, OrganizerStore store) {
        scroll.removeAllViews();
        LinearLayout column = M3Dialog.column(activity);
        int side = Ui.dp(activity, 16);
        // Bottom padding keeps the last row clear of the floating action button.
        column.setPadding(side, Ui.dp(activity, 4), side, Ui.dp(activity, 112));
        scroll.addView(column, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        FolderGrid grid = new FolderGrid(activity);
        int uncategorized = AccountOrganizerPatch.countIn(null);
        for (String id : store.folderOrder()) {
            if (OrganizerStore.FOLDER_ALL.equals(id)) {
                grid.addTile(folderTile(activity, "All accounts", AccountOrganizerPatch.entries.size(),
                        Ui.primary(activity), id, CategoryIcons.NONE), id);
            } else if (OrganizerStore.FOLDER_UNCATEGORIZED.equals(id)) {
                if (store.categories.isEmpty() || uncategorized == 0) continue;
                grid.addTile(folderTile(activity, "Uncategorized", uncategorized,
                        Ui.onSurfaceVariant(activity), id, CategoryIcons.NONE), id);
            } else {
                Category category = store.find(id);
                grid.addTile(folderTile(activity, category.name, AccountOrganizerPatch.countIn(category.id),
                        Ui.accentFor(activity, category.colorValue()), id, category.icon), id);
            }
        }
        grid.addTile(newFolderTile(activity), null);
        grid.setListener(new FolderGrid.Listener() {
            @Override
            public void onReordered(List<String> folderIds) {
                store.reorderFolders(folderIds);
                AccountOrganizerPatch.reload();
            }

            @Override
            public void onLongPress(String folderId) {
                Category category = store.find(folderId);
                if (category != null) showCategoryActions(activity, category);
            }
        });
        column.addView(grid, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView hint = new TextView(activity);
        hint.setText(store.categories.isEmpty()
                ? "Create folders to group your accounts, for example Work, Personal or Finance."
                : "Touch and hold a folder to move it. Release without moving to edit it.");
        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        hint.setTextColor(Ui.onSurfaceVariant(activity));
        hint.setGravity(Gravity.CENTER_HORIZONTAL);
        hint.setPadding(Ui.dp(activity, 8), Ui.dp(activity, 20), Ui.dp(activity, 8), 0);
        column.addView(hint);
    }

    private static View folderTile(Activity activity, String name, int count, int accent, String folderId,
                                   String iconId) {
        LinearLayout tile = new LinearLayout(activity);
        tile.setOrientation(LinearLayout.VERTICAL);
        int pad = Ui.dp(activity, 16);
        tile.setPadding(pad, pad, pad, pad);
        tile.setMinimumHeight(Ui.dp(activity, 120));
        int base = Ui.surfaceContainer(activity);
        tile.setBackground(Ui.ripple(activity,
                Ui.rounded(Ui.blend(base, accent, Ui.isDark(activity) ? 0.16f : 0.12f), Ui.dp(activity, 24)),
                Ui.dp(activity, 24)));

        ImageView icon = new ImageView(activity);
        icon.setImageDrawable(Ui.categoryFolder(accent, iconId));
        int iconSize = Ui.dp(activity, 32);
        tile.addView(icon, new LinearLayout.LayoutParams(iconSize, iconSize));

        // Fixed gap: a weighted spacer would make the tile grow to the full screen height.
        tile.addView(new View(activity), new LinearLayout.LayoutParams(1, Ui.dp(activity, 20)));

        TextView title = new TextView(activity);
        title.setText(name);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        title.setTypeface(Ui.headline(activity));
        title.setTextColor(Ui.onSurface(activity));
        tile.addView(title);

        TextView subtitle = new TextView(activity);
        subtitle.setText(count + (count == 1 ? " account" : " accounts"));
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        subtitle.setTextColor(Ui.onSurfaceVariant(activity));
        tile.addView(subtitle);

        tile.setContentDescription(name + ", " + subtitle.getText());
        tile.setOnClickListener(v -> AccountOrganizerPatch.openFolder(folderId));
        return tile;
    }

    private static View newFolderTile(Activity activity) {
        LinearLayout tile = new LinearLayout(activity);
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setGravity(Gravity.CENTER);
        tile.setMinimumHeight(Ui.dp(activity, 120));
        tile.setBackground(Ui.ripple(activity, Ui.outlined(Ui.outlineVariant(activity),
                Ui.dp(activity, 2), Ui.dp(activity, 24), Ui.dp(activity, 6)), Ui.dp(activity, 24)));

        ImageView plus = new ImageView(activity);
        plus.setImageDrawable(Icons.appOr(activity, "gs_add_vd_theme_24", Ui.primary(activity),
                Icons.add(Ui.primary(activity))));
        int size = Ui.dp(activity, 28);
        tile.addView(plus, new LinearLayout.LayoutParams(size, size));

        TextView label = new TextView(activity);
        label.setText("New folder");
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        label.setTypeface(Ui.medium());
        label.setTextColor(Ui.primary(activity));
        label.setPadding(0, Ui.dp(activity, 8), 0, 0);
        label.setGravity(Gravity.CENTER);
        tile.addView(label, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        tile.setContentDescription("New folder");
        tile.setOnClickListener(v -> promptNewCategory(activity, null));
        return tile;
    }

    // endregion

    // region Organize sheet

    private static LinearLayout organizeContent;

    static void showOrganizeDialog(Activity activity) {
        LinearLayout content = M3Dialog.column(activity);
        organizeContent = content;
        renderOrganizeContent(activity);
        M3Dialog.sheet(activity)
                .title("Organize accounts")
                .content(content, true)
                .button("Done", null)
                .onDismiss(() -> organizeContent = null)
                .show();
    }

    /** Applies a change: re-renders the app list and any open organize sheet. */
    private static void changed(Activity activity) {
        AccountOrganizerPatch.reload();
        if (organizeContent != null) renderOrganizeContent(activity);
    }

    private static void renderOrganizeContent(Activity activity) {
        LinearLayout content = organizeContent;
        OrganizerStore store = AccountOrganizerPatch.store();
        if (content == null || store == null) return;
        content.removeAllViews();
        int fill = Ui.surfaceContainerHigh(activity);

        // Layout choice: two selectable option cards.
        content.addView(M3Dialog.sectionLabel(activity, "Layout"));
        LinearLayout options = new LinearLayout(activity);
        options.setOrientation(LinearLayout.HORIZONTAL);
        options.addView(layoutOption(activity, "Folders", "One folder at a time",
                Icons.folder(0), store.isFolderMode(), () -> {
                    AccountOrganizerPatch.setFolderMode(true);
                    renderOrganizeContent(activity);
                }), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        View spacer = new View(activity);
        options.addView(spacer, new LinearLayout.LayoutParams(Ui.dp(activity, 12), 1));
        options.addView(layoutOption(activity, "Cards", "Everything in one list",
                Icons.cards(0), !store.isFolderMode(), () -> {
                    AccountOrganizerPatch.setFolderMode(false);
                    renderOrganizeContent(activity);
                }), new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        content.addView(options);

        // Categories.
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.BOTTOM);
        header.addView(M3Dialog.sectionLabel(activity, "Categories"),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        View add = tonalButton(activity, "New", Icons.add(Ui.onSecondaryContainer(activity)));
        add.setOnClickListener(v -> promptNewCategory(activity, null));
        LinearLayout.LayoutParams addParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        addParams.bottomMargin = Ui.dp(activity, 8);
        header.addView(add, addParams);
        content.addView(header);

        if (store.categories.isEmpty()) {
            content.addView(note(activity, "No categories yet. Create one to start organizing."));
        } else {
            List<View> rows = new ArrayList<>();
            for (int i = 0; i < store.categories.size(); i++) {
                rows.add(categoryRow(activity, store, store.categories.get(i), i));
            }
            content.addView(M3Dialog.groupedList(activity, rows, fill));
        }

        // Accounts.
        content.addView(M3Dialog.sectionLabel(activity, "Accounts"));
        if (AccountOrganizerPatch.entries.isEmpty()) {
            content.addView(note(activity, "No accounts."));
        } else {
            List<View> rows = new ArrayList<>();
            for (Entry entry : new ArrayList<>(AccountOrganizerPatch.entries)) {
                rows.add(accountRow(activity, store, entry));
            }
            content.addView(M3Dialog.groupedList(activity, rows, fill));
        }
    }

    private static View layoutOption(Activity activity, String title, String summary, Drawable iconShape,
                                     boolean selected, Runnable onSelect) {
        LinearLayout option = M3Dialog.column(activity);
        int pad = Ui.dp(activity, 16);
        option.setPadding(pad, pad, pad, pad);
        float radius = Ui.dp(activity, 20);
        int textColor = selected ? Ui.onSecondaryContainer(activity) : Ui.onSurface(activity);
        if (selected) {
            option.setBackground(Ui.ripple(activity, Ui.rounded(Ui.secondaryContainer(activity), radius), radius));
        } else {
            option.setBackground(Ui.ripple(activity, Ui.outlined(Ui.outlineVariant(activity),
                    Ui.dp(activity, 1), radius, 0), radius));
        }

        ImageView icon = new ImageView(activity);
        Drawable tinted = title.equals("Folders") ? Icons.folder(textColor) : Icons.cards(textColor);
        icon.setImageDrawable(tinted);
        int size = Ui.dp(activity, 24);
        option.addView(icon, new LinearLayout.LayoutParams(size, size));

        TextView titleView = new TextView(activity);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        titleView.setTypeface(Ui.medium());
        titleView.setTextColor(textColor);
        titleView.setPadding(0, Ui.dp(activity, 12), 0, 0);
        option.addView(titleView);

        TextView summaryView = new TextView(activity);
        summaryView.setText(summary);
        summaryView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        summaryView.setTextColor(selected ? Ui.onSecondaryContainer(activity) : Ui.onSurfaceVariant(activity));
        option.addView(summaryView);

        option.setClickable(true);
        option.setFocusable(true);
        option.setSelected(selected);
        option.setContentDescription(title + ", " + summary + (selected ? ", selected" : ""));
        option.setOnClickListener(v -> onSelect.run());
        return option;
    }

    private static View categoryRow(Activity activity, OrganizerStore store, Category category, int index) {
        int count = AccountOrganizerPatch.countIn(category.id);
        LinearLayout arrows = new LinearLayout(activity);
        arrows.setOrientation(LinearLayout.HORIZONTAL);
        arrows.addView(smallIconButton(activity, Icons.chevron(Ui.onSurfaceVariant(activity), true),
                "Move " + category.name + " up", index > 0, () -> {
                    store.move(category, -1);
                    changed(activity);
                }));
        arrows.addView(smallIconButton(activity, Icons.chevron(Ui.onSurfaceVariant(activity), false),
                "Move " + category.name + " down", index < store.categories.size() - 1, () -> {
                    store.move(category, 1);
                    changed(activity);
                }));

        LinearLayout row = M3Dialog.listRow(activity,
                categoryBadge(activity, category),
                category.name, count + (count == 1 ? " account" : " accounts"), arrows);
        row.setOnClickListener(v -> showCategoryActions(activity, category));
        return row;
    }

    private static View accountRow(Activity activity, OrganizerStore store, Entry entry) {
        Category current = store.find(store.categoryOf(entry.key));
        LinearLayout chip = new LinearLayout(activity);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        chip.setPadding(Ui.dp(activity, 10), Ui.dp(activity, 6), Ui.dp(activity, 12), Ui.dp(activity, 6));
        chip.setBackground(Ui.outlined(Ui.outlineVariant(activity), Ui.dp(activity, 1), Ui.dp(activity, 8), 0));
        if (current != null) {
            int accent = Ui.accentFor(activity, current.colorValue());
            Drawable icon = CategoryIcons.create(current.icon, accent);
            View badge;
            if (icon != null) {
                ImageView image = new ImageView(activity);
                image.setImageDrawable(icon);
                int size = Ui.dp(activity, 16);
                image.setLayoutParams(new LinearLayout.LayoutParams(size, size));
                badge = image;
            } else {
                badge = M3Dialog.colorDot(activity, accent, 8);
            }
            ((LinearLayout.LayoutParams) badge.getLayoutParams()).setMarginEnd(Ui.dp(activity, 6));
            chip.addView(badge);
        }
        TextView label = new TextView(activity);
        label.setText(current == null ? "None" : current.name);
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        label.setMaxWidth(Ui.dp(activity, 120));
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        label.setTypeface(Ui.medium());
        label.setTextColor(current == null ? Ui.onSurfaceVariant(activity) : Ui.onSurface(activity));
        chip.addView(label);

        LinearLayout row = M3Dialog.listRow(activity, null, entry.name, null, chip);
        row.setContentDescription(entry.name + ", category " + label.getText());
        row.setOnClickListener(v -> chooseCategoryForAccount(activity, entry));
        return row;
    }

    // endregion

    // region Dialogs

    private static void chooseCategoryForAccount(Activity activity, Entry entry) {
        OrganizerStore store = AccountOrganizerPatch.store();
        if (store == null) return;
        String currentId = store.categoryOf(entry.key);
        M3Dialog dialog = M3Dialog.dialog(activity);
        LinearLayout list = M3Dialog.column(activity);

        List<View> rows = new ArrayList<>();
        View none = M3Dialog.listRow(activity, M3Dialog.radio(activity, currentId == null), "None", null, null);
        none.setOnClickListener(v -> {
            store.assign(entry.key, null);
            changed(activity);
            dialog.dismiss();
        });
        rows.add(none);
        for (Category category : store.categories) {
            View row = M3Dialog.listRow(activity, M3Dialog.radio(activity, category.id.equals(currentId)),
                    category.name, null, categoryBadge(activity, category));
            row.setOnClickListener(v -> {
                store.assign(entry.key, category.id);
                changed(activity);
                dialog.dismiss();
            });
            rows.add(row);
        }
        for (View row : rows) {
            row.setBackground(Ui.selectableBackground(activity, false));
            row.setPadding(Ui.dp(activity, 4), row.getPaddingTop(), Ui.dp(activity, 4), row.getPaddingBottom());
            list.addView(row);
        }

        View create = M3Dialog.sheetAction(activity, Icons.add(Ui.primary(activity)), "New category",
                Ui.primary(activity), () -> {
                    dialog.dismiss();
                    promptNewCategory(activity, entry);
                });
        create.setPadding(Ui.dp(activity, 8), 0, Ui.dp(activity, 4), 0);
        list.addView(create);

        dialog.title("Category")
                .message(entry.name)
                .content(list, true)
                .button("Cancel", null)
                .show();
    }

    /** Creates a category, optionally assigning an account to it right away. */
    private static void promptNewCategory(Activity activity, Entry assignTo) {
        promptName(activity, "New category", "", "Create", name -> {
            OrganizerStore store = AccountOrganizerPatch.store();
            if (store == null) return;
            Category category = store.add(name);
            if (assignTo != null) store.assign(assignTo.key, category.id);
            changed(activity);
            if (assignTo == null && !AccountOrganizerPatch.entries.isEmpty()) {
                chooseAccounts(activity, category);
            }
        });
    }

    static void showCategoryActions(Activity activity, Category category) {
        OrganizerStore store = AccountOrganizerPatch.store();
        if (store == null) return;
        int count = AccountOrganizerPatch.countIn(category.id);
        int iconColor = Ui.onSurfaceVariant(activity);
        int textColor = Ui.onSurface(activity);

        M3Dialog sheet = M3Dialog.sheet(activity);
        LinearLayout list = M3Dialog.column(activity);

        // Header: color, name and size of the category.
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(Ui.dp(activity, 24), 0, Ui.dp(activity, 24), Ui.dp(activity, 12));
        ImageView folder = new ImageView(activity);
        folder.setImageDrawable(Ui.categoryFolder(Ui.accentFor(activity, category.colorValue()), category.icon));
        int folderSize = Ui.dp(activity, 40);
        LinearLayout.LayoutParams folderParams = new LinearLayout.LayoutParams(folderSize, folderSize);
        folderParams.setMarginEnd(Ui.dp(activity, 16));
        header.addView(folder, folderParams);
        LinearLayout texts = M3Dialog.column(activity);
        TextView name = new TextView(activity);
        name.setText(category.name);
        name.setTypeface(Ui.headline(activity));
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        name.setTextColor(textColor);
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        texts.addView(name);
        TextView size = new TextView(activity);
        size.setText(count + (count == 1 ? " account" : " accounts"));
        size.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        size.setTextColor(Ui.onSurfaceVariant(activity));
        texts.addView(size);
        header.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        list.addView(header);

        View divider = new View(activity);
        divider.setBackgroundColor(Ui.outlineVariant(activity));
        LinearLayout.LayoutParams dividerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Ui.dp(activity, 1)));
        dividerParams.setMargins(0, 0, 0, Ui.dp(activity, 8));
        list.addView(divider, dividerParams);

        list.addView(M3Dialog.sheetAction(activity, Icons.checklist(iconColor), "Choose accounts", textColor, () -> {
            sheet.dismiss();
            chooseAccounts(activity, category);
        }));
        list.addView(M3Dialog.sheetAction(activity,
                Icons.appOr(activity, "gs_edit_vd_theme_24", iconColor, Icons.checklist(iconColor)),
                "Rename", textColor, () -> {
                    sheet.dismiss();
                    promptName(activity, "Rename category", category.name, "Save", newName -> {
                        store.rename(category, newName);
                        changed(activity);
                    });
                }));
        list.addView(M3Dialog.sheetAction(activity, Icons.palette(iconColor), "Change color", textColor, () -> {
            sheet.dismiss();
            chooseColor(activity, category);
        }));
        list.addView(M3Dialog.sheetAction(activity, Icons.shapes(iconColor), "Change icon", textColor, () -> {
            sheet.dismiss();
            chooseIcon(activity, category);
        }));
        list.addView(M3Dialog.sheetAction(activity, Icons.delete(Ui.error(activity)), "Delete",
                Ui.error(activity), () -> {
                    sheet.dismiss();
                    confirmDelete(activity, category);
                }));

        sheet.content(list, false).show();
    }

    private static void confirmDelete(Activity activity, Category category) {
        OrganizerStore store = AccountOrganizerPatch.store();
        if (store == null) return;
        M3Dialog.dialog(activity)
                .icon(Icons.delete(Ui.secondary(activity)))
                .title("Delete “" + category.name + "”?")
                .message("The accounts in this category are not deleted. They become uncategorized.")
                .button("Cancel", null)
                .button("Delete", M3Dialog.closing(() -> {
                    store.delete(category);
                    changed(activity);
                }))
                .show();
    }

    /** Checklist of the accounts that belong to a category. */
    private static void chooseAccounts(Activity activity, Category category) {
        OrganizerStore store = AccountOrganizerPatch.store();
        if (store == null) return;
        final List<Entry> accounts = new ArrayList<>(AccountOrganizerPatch.entries);
        if (accounts.isEmpty()) return;

        final boolean[] checked = new boolean[accounts.size()];
        LinearLayout list = M3Dialog.column(activity);
        for (int i = 0; i < accounts.size(); i++) {
            Entry entry = accounts.get(i);
            String currentId = store.categoryOf(entry.key);
            Category current = store.find(currentId);
            checked[i] = category.id.equals(currentId);
            android.widget.CheckBox box = M3Dialog.checkbox(activity, checked[i]);
            String subtitle = current == null || checked[i] ? null : "In " + current.name;
            LinearLayout row = M3Dialog.listRow(activity, box, entry.name, subtitle, null);
            row.setPadding(Ui.dp(activity, 4), row.getPaddingTop(), Ui.dp(activity, 4), row.getPaddingBottom());
            row.setBackground(Ui.selectableBackground(activity, false));
            final int index = i;
            row.setOnClickListener(v -> {
                checked[index] = !checked[index];
                box.setChecked(checked[index]);
            });
            list.addView(row);
        }

        M3Dialog.dialog(activity)
                .title("Accounts in " + category.name)
                .content(list, true)
                .button("Cancel", null)
                .button("Save", M3Dialog.closing(() -> {
                    for (int i = 0; i < accounts.size(); i++) {
                        Entry entry = accounts.get(i);
                        boolean wasIn = category.id.equals(store.categoryOf(entry.key));
                        if (checked[i] && !wasIn) store.assign(entry.key, category.id);
                        else if (!checked[i] && wasIn) store.assign(entry.key, null);
                    }
                    changed(activity);
                }))
                .show();
    }

    /** Grid of color swatches. Selecting one applies it. */
    private static void chooseColor(Activity activity, Category category) {
        OrganizerStore store = AccountOrganizerPatch.store();
        if (store == null) return;
        M3Dialog dialog = M3Dialog.dialog(activity);
        int selected = OrganizerStore.paletteIndex(category.color);
        int columns = 4;
        int swatchSize = Ui.dp(activity, 48);

        LinearLayout grid = M3Dialog.column(activity);
        LinearLayout row = null;
        for (int i = 0; i < OrganizerStore.PALETTE.length; i++) {
            if (i % columns == 0) {
                row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER);
                grid.addView(row, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            int color = Ui.accentFor(activity, OrganizerStore.PALETTE[i]);
            FrameLayout swatch = new FrameLayout(activity);
            swatch.setBackground(Ui.ripple(activity, Ui.dot(color), swatchSize / 2f));
            if (i == selected) {
                ImageView check = new ImageView(activity);
                check.setImageDrawable(Icons.check(0xFFFFFFFF));
                int pad = Ui.dp(activity, 12);
                check.setPadding(pad, pad, pad, pad);
                swatch.addView(check, new FrameLayout.LayoutParams(swatchSize, swatchSize));
            }
            final int index = i;
            swatch.setContentDescription(OrganizerStore.PALETTE_NAMES[i] + (i == selected ? ", selected" : ""));
            swatch.setOnClickListener(v -> {
                store.setColor(category, index);
                changed(activity);
                dialog.dismiss();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(swatchSize, swatchSize);
            int margin = Ui.dp(activity, 8);
            params.setMargins(margin, margin, margin, margin);
            row.addView(swatch, params);
        }

        dialog.icon(Icons.palette(Ui.secondary(activity)))
                .title("Color")
                .content(grid, true)
                .button("Cancel", null)
                .show();
    }

    /** Grid of category icons. Selecting one applies it. */
    private static void chooseIcon(Activity activity, Category category) {
        OrganizerStore store = AccountOrganizerPatch.store();
        if (store == null) return;
        M3Dialog dialog = M3Dialog.dialog(activity);
        int accent = Ui.accentFor(activity, category.colorValue());
        int columns = 5;
        int cell = Ui.dp(activity, 48);
        int margin = Ui.dp(activity, 4);

        List<String> ids = new ArrayList<>();
        ids.add(CategoryIcons.NONE);
        for (String id : CategoryIcons.IDS) ids.add(id);

        LinearLayout grid = M3Dialog.column(activity);
        LinearLayout row = null;
        for (int i = 0; i < ids.size(); i++) {
            if (i % columns == 0) {
                row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER);
                grid.addView(row, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            String id = ids.get(i);
            boolean selected = id.equals(category.icon);

            FrameLayout option = new FrameLayout(activity);
            Drawable fill = selected
                    ? Ui.rounded(Ui.secondaryContainer(activity), cell / 2f)
                    : null;
            option.setBackground(Ui.ripple(activity, fill, cell / 2f));
            View glyph;
            if (CategoryIcons.isValid(id)) {
                ImageView image = new ImageView(activity);
                image.setImageDrawable(CategoryIcons.create(id, accent));
                int pad = Ui.dp(activity, 12);
                image.setPadding(pad, pad, pad, pad);
                glyph = image;
                option.addView(glyph, new FrameLayout.LayoutParams(cell, cell));
            } else {
                // "No icon": the plain color dot used without an icon.
                glyph = M3Dialog.colorDot(activity, accent, 12);
                FrameLayout.LayoutParams dotParams = new FrameLayout.LayoutParams(
                        Ui.dp(activity, 12), Ui.dp(activity, 12), Gravity.CENTER);
                option.addView(glyph, dotParams);
            }
            option.setContentDescription(CategoryIcons.label(id) + (selected ? ", selected" : ""));
            option.setOnClickListener(v -> {
                store.setIcon(category, id);
                changed(activity);
                dialog.dismiss();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(cell, cell);
            params.setMargins(margin, margin, margin, margin);
            row.addView(option, params);
        }

        dialog.icon(Icons.shapes(Ui.secondary(activity)))
                .title("Icon")
                .content(grid, true)
                .button("Cancel", null)
                .show();
    }

    /** Category icon in the category color, or its color dot when it has no icon. */
    private static View categoryBadge(Activity activity, Category category) {
        int accent = Ui.accentFor(activity, category.colorValue());
        Drawable icon = CategoryIcons.create(category.icon, accent);
        if (icon == null) return M3Dialog.colorDot(activity, accent, 12);
        ImageView view = new ImageView(activity);
        view.setImageDrawable(icon);
        int size = Ui.dp(activity, 24);
        view.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        return view;
    }

    private interface NameCallback {
        void onName(String name);
    }

    private static void promptName(Activity activity, String title, String initial, String confirm,
                                   NameCallback callback) {
        M3Dialog.TextField field = new M3Dialog.TextField(activity, "Name", initial);
        LinearLayout content = M3Dialog.column(activity);
        content.setPadding(0, Ui.dp(activity, 8), 0, 0);
        content.addView(field.view);

        M3Dialog dialog = M3Dialog.dialog(activity);
        M3Dialog.ButtonAction submit = () -> {
            String name = field.text();
            if (name.isEmpty()) {
                field.setError(activity, "Enter a name");
                return false;
            }
            callback.onName(name);
            return true;
        };
        field.input.setOnEditorActionListener((v, actionId, event) -> {
            if (submit.run()) dialog.dismiss();
            return true;
        });
        dialog.title(title)
                .content(content, true)
                .button("Cancel", null)
                .button(confirm, submit)
                .show();

        field.input.requestFocus();
        field.input.postDelayed(() -> {
            android.view.inputmethod.InputMethodManager imm = (android.view.inputmethod.InputMethodManager)
                    activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (imm != null) imm.showSoftInput(field.input, 0);
        }, 150);
    }

    // endregion

    // region Building blocks

    private static TextView note(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        view.setTextColor(Ui.onSurfaceVariant(context));
        view.setPadding(Ui.dp(context, 4), Ui.dp(context, 4), Ui.dp(context, 4), Ui.dp(context, 8));
        return view;
    }

    /** Small pill shaped tonal button with an icon. */
    private static View tonalButton(Context context, String label, Drawable icon) {
        LinearLayout button = new LinearLayout(context);
        button.setOrientation(LinearLayout.HORIZONTAL);
        button.setGravity(Gravity.CENTER_VERTICAL);
        button.setMinimumHeight(Ui.dp(context, 36));
        button.setPadding(Ui.dp(context, 12), 0, Ui.dp(context, 16), 0);
        float radius = Ui.dp(context, 18);
        button.setBackground(Ui.ripple(context, Ui.rounded(Ui.secondaryContainer(context), radius), radius));
        ImageView iconView = new ImageView(context);
        iconView.setImageDrawable(icon);
        int size = Ui.dp(context, 18);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(size, size);
        iconParams.setMarginEnd(Ui.dp(context, 8));
        button.addView(iconView, iconParams);
        TextView text = new TextView(context);
        text.setText(label);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setTypeface(Ui.medium());
        text.setTextColor(Ui.onSecondaryContainer(context));
        button.addView(text);
        button.setClickable(true);
        button.setFocusable(true);
        button.setContentDescription(label);
        return button;
    }

    private static View smallIconButton(Context context, Drawable icon, String description, boolean enabled,
                                        Runnable onClick) {
        ImageView button = new ImageView(context);
        int size = Ui.dp(context, 40);
        int pad = Ui.dp(context, 8);
        button.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        button.setPadding(pad, pad, pad, pad);
        button.setImageDrawable(icon);
        button.setBackground(Ui.selectableBackground(context, true));
        button.setContentDescription(description);
        button.setEnabled(enabled);
        button.setAlpha(enabled ? 1f : 0.38f);
        button.setOnClickListener(v -> onClick.run());
        return button;
    }

    /** Text drawn as an icon, used only if an app icon resource is missing. */
    private static final class TextGlyph extends Drawable {
        private final android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        private final String text;

        TextGlyph(Context context, String text, int color) {
            this.text = text;
            paint.setColor(color);
            paint.setTextSize(Ui.sp(context, 20));
            paint.setTextAlign(android.graphics.Paint.Align.CENTER);
        }

        @Override
        public void draw(android.graphics.Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float y = b.exactCenterY() - (paint.descent() + paint.ascent()) / 2f;
            canvas.drawText(text, b.exactCenterX(), y, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    // endregion

    // region Back navigation

    /**
     * Registers a predictive back callback while a folder is open. On Android 16+ apps
     * targeting API 36+ no longer get onBackPressed(), so the activity hook alone is not enough.
     */
    private static void syncBackCallback(Activity activity, boolean folderOpen) {
        if (Build.VERSION.SDK_INT < 33) return; // onBackPressed() hook handles older versions.
        Activity registeredOn = backCallbackActivity.get();
        if (backCallback != null && (!folderOpen || registeredOn != activity)) {
            if (registeredOn != null) {
                registeredOn.getOnBackInvokedDispatcher()
                        .unregisterOnBackInvokedCallback((OnBackInvokedCallback) backCallback);
            }
            backCallback = null;
            backCallbackActivity = new WeakReference<>(null);
        }
        if (folderOpen && backCallback == null) {
            OnBackInvokedCallback callback = () -> {
                if (!isSearchOpen(activity) && AccountOrganizerPatch.closeOpenFolder()) return;
                // Not ours, for example search is open. Forward to the app's own back handling.
                // The activity hook does not consume it, as it applies the same checks.
                if (AccountOrganizerPatch.openFolder == null) syncBackCallback(activity, false);
                activity.onBackPressed();
            };
            activity.getOnBackInvokedDispatcher()
                    .registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            backCallback = callback;
            backCallbackActivity = new WeakReference<>(activity);
        }
    }

    // endregion
}
