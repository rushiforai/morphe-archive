/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.comment;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * A box above the comments that narrows them to the ones you are looking for.
 *
 * <p>Nothing is taken out of TikTok's own list. A comment that does not match is collapsed
 * where it sits, the same way the inbox hides a row it was told to hide, so clearing the box
 * brings everything straight back and TikTok's paging, replies and counts never learn that
 * anything happened.
 */
public final class CommentSearch {
    /** Rows put back at the height they had, once the box is cleared again. */
    private static final Map<View, Integer> ORIGINAL_HEIGHTS = new WeakHashMap<>();
    /** What each bound row is showing, so typing can go over the rows already on screen. */
    private static final Map<View, Object> ROW_COMMENTS = new WeakHashMap<>();
    /** A reply control can also be collapsed by TikTok after all replies have been loaded. */
    private static final Map<View, Boolean> COLLAPSED_REPLY_ROWS = new WeakHashMap<>();
    /** Bound rows report attach and detach so the visible count follows scrolling. */
    private static final Map<View, Boolean> ROW_ATTACH_LISTENERS = new WeakHashMap<>();
    /** The list owns its decoration through its listener; neither map side retains that tree. */
    private static final Map<ViewGroup, WeakReference<SearchField>> DECORATED = new WeakHashMap<>();

    static final String FIELD_TAG = "comment_search_field";
    static final String STATUS_TAG = "comment_search_status";

    private static final View.OnAttachStateChangeListener ROW_ATTACH_LISTENER =
            new View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View view) {
                    scheduleCountRefresh();
                }

                @Override public void onViewDetachedFromWindow(View view) {
                    scheduleCountRefresh();
                }
            };

    /** How far above the list to look for something that stacks its children. */
    private static final int MAX_COLUMN_LEVELS = 4;

    private static volatile String query = "";
    private static WeakReference<ViewGroup> shown = new WeakReference<>(null);
    private static boolean warnedNoColumn;

    private CommentSearch() {}

    public static boolean enabled() {
        return Settings.COMMENT_SEARCH.get();
    }

    /** The settings page calls this after saving, including when the comment sheet is cached. */
    public static void onSettingChanged() {
        try {
            if (enabled()) {
                trackBoundRowAttachments();
                ViewGroup listView = shown.get();
                if (listView != null && listView.isAttachedToWindow()) {
                    addSearchField(listView);
                    narrowShownRows();
                }
                return;
            }
            setQuery("");
            for (WeakReference<SearchField> reference : new ArrayList<>(DECORATED.values())) {
                SearchField field = reference.get();
                if (field != null) field.remove(false);
            }
            for (View row : new ArrayList<>(ROW_ATTACH_LISTENERS.keySet())) {
                untrackRowAttachments(row);
            }
            // Retain bound models for re-enabling on the same sheet without another native bind.
            for (View row : ROW_COMMENTS.keySet()) setRowHidden(row, false);
        } catch (Throwable exception) {
            Logger.printException(() -> "Could not update comment search after its setting changed", exception);
        }
    }

    /** Restores listeners removed while search was off, including rows retained by a cached sheet. */
    private static void trackBoundRowAttachments() {
        for (View row : new ArrayList<>(ROW_COMMENTS.keySet())) trackRowAttachments(row);
    }

    /** What is in the box, lower cased once so every comparison does not have to be. */
    static String query() {
        return query;
    }

    static void setQuery(String text) {
        query = text == null ? "" : text.trim().toLowerCase(Locale.ROOT);
    }

    /**
     * Whether a comment stays on screen. An empty box keeps everything, and a comment matches
     * on what it says or on who said it, by handle or by the name they show.
     */
    static boolean matches(Object comment, String wanted) {
        if (wanted.isEmpty()) return true;
        if (comment == null) return false;

        String text = Reflect.string(comment, "getText", "text");
        if (contains(text, wanted)) return true;

        Object user = Reflect.property(comment, "getUser", "user");
        return contains(Reflect.string(user, "getUniqueId", "uniqueId"), wanted)
                || contains(Reflect.string(user, "getNickname", "nickname"), wanted);
    }

    private static boolean contains(String haystack, String wanted) {
        return haystack != null && haystack.toLowerCase(Locale.ROOT).contains(wanted);
    }

    /** Called for each comment row as it is bound, with the comment that row is showing. */
    public static void onCellBound(View itemView, Object comment) {
        if (itemView == null) return;
        try {
            if (!enabled()) {
                untrackRowAttachments(itemView);
                if (ROW_COMMENTS.containsKey(itemView)) {
                    // Body binding leaves the root height that search collapsed in place.
                    setRowHidden(itemView, false);
                    ROW_COMMENTS.remove(itemView);
                    ORIGINAL_HEIGHTS.remove(itemView);
                }
                return;
            }
            trackRowAttachments(itemView);
            ROW_COMMENTS.put(itemView, comment);
            setRowHidden(itemView, !matches(comment, query));
            // A list binds a row before putting it in place, and detaches one it is about to
            // rebind, so the sheet is not reachable from the row while this runs. Waiting for
            // the row to be attached is the only time the list can be found.
            itemView.post(() -> decorate(itemView));
        } catch (Throwable exception) {
            Logger.printException(() -> "Could not narrow a comment row", exception);
        }
    }

    /** Called after the native reply control binds its parent and computes its render state. */
    public static void onReplyControlBound(View itemView, Object parentComment, int nativeState) {
        if (itemView == null) return;
        if (!enabled()) {
            untrackRowAttachments(itemView);
            if (COLLAPSED_REPLY_ROWS.remove(itemView) != null) {
                ROW_COMMENTS.remove(itemView);
                ORIGINAL_HEIGHTS.remove(itemView);
                // Q5 has already set the current native height, including zero for state4.
                // Release only our visibility; an old search height must not replace it.
                if (itemView.getVisibility() == View.GONE) itemView.setVisibility(View.VISIBLE);
            }
            return;
        }
        COLLAPSED_REPLY_ROWS.put(itemView, nativeState == 4);
        onCellBound(itemView, parentComment);
    }

    /** Runs once the bound row is in place, which is the first moment the list can be read. */
    private static void decorate(View itemView) {
        try {
            if (!enabled()) return;
            ViewParent parent = itemView.getParent();
            if (!(parent instanceof ViewGroup)) return;
            ViewGroup listView = (ViewGroup) parent;
            if (shown.get() != listView) {
                // A different sheet. Whatever was typed into the last one was about that
                // video's comments, so it does not follow the reader to this one.
                SearchField previous = searchFieldFor(shown.get());
                shown = new WeakReference<>(listView);
                setQuery("");
                if (previous != null) previous.clearForSheetChange();
            }
            addSearchField(listView);
            narrowShownRows();
        } catch (Throwable exception) {
            Logger.printException(() -> "Could not put a box above the comments", exception);
        }
    }

    /**
     * Puts the box above the comments, once per list. Something above the list has to lay its
     * children out one under another for a box added there to land above the list rather than
     * across it, so the nearest few ancestors are tried and anything else is left alone.
     */
    private static void addSearchField(ViewGroup listView) {
        View anchor = listView;
        ViewParent parent = listView.getParent();
        for (int level = 0; level < MAX_COLUMN_LEVELS && parent instanceof ViewGroup; level++) {
            if (parent instanceof LinearLayout
                    && ((LinearLayout) parent).getOrientation() == LinearLayout.VERTICAL) {
                insertBox((LinearLayout) parent, anchor, listView);
                return;
            }
            anchor = (View) parent;
            parent = parent.getParent();
        }
        if (!warnedNoColumn) {
            warnedNoColumn = true;
            ViewParent nearest = listView.getParent();
            String name = nearest == null ? "none" : nearest.getClass().getName();
            Logger.printInfo(() -> "Nothing above the comment list stacks its children, so the "
                    + "search box has nowhere to go. Nearest parent: " + name);
        }
    }

    /**
     * Whether the sheet this box is going into is dark.
     *
     * <p>Read from the context the sheet itself was built with, not from the shared dark mode
     * flag: that flag is only ever written when Hushfeed's own settings screen opens, so in a
     * session that never opened it the answer comes from the system configuration instead,
     * which does not carry the night mode TikTok applied to itself. A white card in a black
     * comment sheet is the visible version of that.
     */
    private static boolean isDarkSheet(Context context) {
        int night = context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK;
        return night == Configuration.UI_MODE_NIGHT_YES;
    }

    /**
     * The field's background, which is also the only thing that shows it has focus. A plain
     * drawable would look the same focused and not, and replacing the platform background is
     * what took the underline away in the first place.
     */
    private static StateListDrawable fieldBackground(Context context, boolean dark) {
        float radius = SettingsUi.dp(context, SettingsUi.RADIUS_FIELD);
        int stroke = Math.max(1, Math.round(context.getResources().getDisplayMetrics().density));

        // The theme is worked out locally, because the comment sheet is drawn in TikTok's theme
        // rather than the system's, and then the matching palette value is asked for by name.
        // These eight colours used to be hex literals copied out of SettingsUi, which is the
        // same palette maintained in two places and free to drift in one of them.
        // Focus lifts the field off the sheet in dark, where there is somewhere to lift to. In
        // light the resting fill is already the brightest surface, so the accent ring does that
        // job alone, which is what the two hex literals here used to say.
        GradientDrawable focused = new GradientDrawable();
        focused.setColor(dark ? SettingsUi.liftedSurfaceOn(true) : SettingsUi.surfaceOn(false));
        focused.setCornerRadius(radius);
        focused.setStroke(stroke * 2, SettingsUi.accentOn(dark));

        GradientDrawable resting = new GradientDrawable();
        resting.setColor(SettingsUi.surfaceOn(dark));
        resting.setCornerRadius(radius);
        resting.setStroke(stroke, SettingsUi.borderOn(dark));

        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_focused}, focused);
        states.addState(new int[]{}, resting);
        return states;
    }

    /** Builds the box and puts it in {@code column}, directly above whatever holds the list. */
    private static void insertBox(LinearLayout column, View anchor, ViewGroup listView) {
        WeakReference<SearchField> existing = DECORATED.get(column);
        if (existing != null && existing.get() != null) return;

        Context context = column.getContext();
        EditText box = new EditText(context);
        box.setTag(FIELD_TAG);
        box.setHint(L10n.t(context, "Search these comments"));
        // No content description on a search box. On an editable view it replaces what was
        // typed in the announcement, so "cats" came back as the label. The hint names it.
        box.setSingleLine(true);
        // A single line field with a newline key is a dead end; this is a search.
        box.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        box.setInputType(InputType.TYPE_CLASS_TEXT);
        box.setGravity(Gravity.CENTER_VERTICAL);
        box.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        boolean dark = isDarkSheet(context);
        box.setTextColor(SettingsUi.textPrimaryOn(dark));
        box.setHintTextColor(SettingsUi.textSecondaryOn(dark));
        // A transparent background takes the focus underline with it, which left nothing
        // saying this was a field at all, so the border does that job instead.
        box.setBackground(fieldBackground(context, dark));
        int padding = SettingsUi.dp(context, 12);
        box.setPadding(padding, padding, padding, padding);
        // A minimum rather than a height: 48dp is the touch target, but at a large font scale
        // the text needs more than that and a fixed height would cut the letters off.
        box.setMinimumHeight(SettingsUi.dp(context, 48));
        box.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView status = SettingsUi.resultCount(context, STATUS_TAG);
        status.setTextColor(SettingsUi.textSecondaryOn(dark));
        status.setFocusable(false);
        status.setClickable(false);
        status.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        status.setVisibility(View.GONE);
        status.setPadding(padding, 0, padding, Math.round(
                4 * context.getResources().getDisplayMetrics().density));
        status.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        box.setText(query);
        box.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {}
            @Override public void afterTextChanged(Editable typed) {
                if (!enabled()) return;
                setQuery(typed == null ? "" : typed.toString());
                narrowShownRows();
            }
        });
        box.setOnEditorActionListener((view, actionId, event) -> {
            if (actionId != EditorInfo.IME_ACTION_SEARCH) return false;
            // Filtering already happened as it was typed, so the key's job is to get the
            // keyboard out of the way of the comments it just narrowed down.
            InputMethodManager keyboard = (InputMethodManager)
                    context.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (keyboard != null) keyboard.hideSoftInputFromWindow(view.getWindowToken(), 0);
            view.clearFocus();
            return true;
        });
        int insertionIndex = column.indexOfChild(anchor);
        column.addView(box, insertionIndex);
        column.addView(status, insertionIndex + 1);
        // Only once it is really in. Marking the column first would blacklist it for good if
        // anything above threw, and the sheet would never get a box again.
        SearchField field = new SearchField(column, listView, box, status);
        DECORATED.put(column, new WeakReference<>(field));

        // The column can be further up than the sheet and outlive it, so the box leaves with
        // the list it belongs to rather than being left over the feed.
        listView.addOnAttachStateChangeListener(field);
    }

    private static final class SearchField implements View.OnAttachStateChangeListener {
        private final LinearLayout column;
        private final ViewGroup listView;
        private final EditText box;
        private final TextView status;

        SearchField(LinearLayout column, ViewGroup listView, EditText box, TextView status) {
            this.column = column;
            this.listView = listView;
            this.box = box;
            this.status = status;
        }

        void remove(boolean detaching) {
            // Keep one listener while the cached list is detached. It is owned by the list and
            // can rebuild the decoration when that same native tree returns without another bind.
            if (!detaching) listView.removeOnAttachStateChangeListener(this);
            WeakReference<SearchField> current = DECORATED.get(column);
            if (current != null && current.get() == this) DECORATED.remove(column);
            // Detach runs during native child removal; don't alter a second child mid-dispatch.
            if (detaching) {
                column.post(() -> {
                    column.removeView(box);
                    column.removeView(status);
                });
            } else {
                column.removeView(box);
                column.removeView(status);
            }
        }

        void updateResult(String wanted, int count) {
            if (wanted.isEmpty()) {
                clearStatus();
                return;
            }
            status.setVisibility(View.VISIBLE);
            if (count == 0) {
                String next = L10n.t(status.getContext(),
                        "No matching comments. Try a different word or clear the search.");
                if (!TextUtils.equals(status.getText(), next)) status.setText(next);
            } else {
                SettingsUi.setResultCount(status, count);
            }
        }

        void clearForSheetChange() {
            if (box.length() != 0) box.setText("");
            clearStatus();
        }

        private void clearStatus() {
            if (status.length() != 0) status.setText("");
            if (status.getVisibility() != View.GONE) status.setVisibility(View.GONE);
        }

        @Override public void onViewAttachedToWindow(View view) {
            // Adding siblings while Android dispatches attach can upset the native parent. Post the
            // remount, then replace this detached-field listener with the newly created field's.
            listView.post(() -> {
                if (!listView.isAttachedToWindow()) return;
                listView.removeOnAttachStateChangeListener(this);
                if (!enabled()) return;
                trackBoundRowAttachments();
                addSearchField(listView);
                narrowShownRows();
            });
        }

        @Override public void onViewDetachedFromWindow(View view) {
            remove(true);
            if (shown.get() == listView) setQuery("");
        }
    }

    /**
     * Goes over the rows already on screen. Rows scrolled to afterwards are dealt with as
     * they bind, and a row the list recycles onto a different comment is put right by the
     * bind that recycled it.
     */
    static void narrowShownRows() {
        ViewGroup listView = shown.get();
        if (listView == null) return;
        boolean filtering = enabled();
        String wanted = query;
        int matchingComments = 0;
        for (int index = 0; index < listView.getChildCount(); index++) {
            View row = listView.getChildAt(index);
            if (!ROW_COMMENTS.containsKey(row)) continue;
            boolean rowMatches = !filtering || matches(ROW_COMMENTS.get(row), wanted);
            setRowHidden(row, filtering && !rowMatches);
            if (rowMatches && !COLLAPSED_REPLY_ROWS.containsKey(row)) matchingComments++;
        }
        SearchField field = searchFieldFor(listView);
        if (field != null) field.updateResult(filtering ? wanted : "", matchingComments);
    }

    private static SearchField searchFieldFor(ViewGroup listView) {
        if (listView == null) return null;
        for (WeakReference<SearchField> reference : new ArrayList<>(DECORATED.values())) {
            SearchField field = reference.get();
            if (field != null && field.listView == listView) return field;
        }
        return null;
    }

    private static void trackRowAttachments(View row) {
        if (ROW_ATTACH_LISTENERS.put(row, Boolean.TRUE) == null) {
            row.addOnAttachStateChangeListener(ROW_ATTACH_LISTENER);
        }
    }

    private static void untrackRowAttachments(View row) {
        if (ROW_ATTACH_LISTENERS.remove(row) != null) {
            row.removeOnAttachStateChangeListener(ROW_ATTACH_LISTENER);
        }
    }

    private static void scheduleCountRefresh() {
        ViewGroup listView = shown.get();
        if (listView != null) listView.post(CommentSearch::narrowShownRows);
    }

    /**
     * A scrolling list measures its children itself and does not honour {@code GONE}, so a
     * hidden row also needs a zero height to collapse. Nothing is written when the row is
     * already in the wanted state.
     */
    private static void setRowHidden(View row, boolean hidden) {
        hidden |= Boolean.TRUE.equals(COLLAPSED_REPLY_ROWS.get(row));
        ViewGroup.LayoutParams params = row.getLayoutParams();
        if (params == null) {
            int wanted = hidden ? View.GONE : View.VISIBLE;
            if (row.getVisibility() != wanted) row.setVisibility(wanted);
            return;
        }

        Integer original = ORIGINAL_HEIGHTS.get(row);
        if (original == null && params.height != 0) {
            original = params.height;
            ORIGINAL_HEIGHTS.put(row, original);
        }

        if (hidden) {
            if (row.getVisibility() != View.GONE || params.height != 0) {
                row.setVisibility(View.GONE);
                params.height = 0;
                row.setLayoutParams(params);
            }
        } else {
            int restored = original != null ? original : ViewGroup.LayoutParams.WRAP_CONTENT;
            if (row.getVisibility() != View.VISIBLE || params.height != restored) {
                row.setVisibility(View.VISIBLE);
                params.height = restored;
                row.setLayoutParams(params);
            }
        }
    }
}
