/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-26.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.text.InputType;
import android.util.LruCache;
import android.util.TypedValue;
import android.util.Pair;
import android.view.CollapsibleActionView;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toolbar;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.IntConsumer;

import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.theme.ThemePatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.utils.ThemeUtils;

/**
 * The offline library: downloads in progress first, then the downloaded videos.
 */
@SuppressLint("SetTextI18n")
final class OfflineLibraryScreen implements OfflineScreens.Screen {
    private static final String[] SORTS = {
            OfflineScreens.SORT_NEWEST, OfflineScreens.SORT_OLDEST,
            OfflineScreens.SORT_TITLE, OfflineScreens.SORT_SIZE
    };

    /** Shared between screen instances, so returning to the library does not decode again. */
    private static final LruCache<String, Bitmap> thumbnails = new LruCache<>(8 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount();
        }
    };
    private static final Set<String> thumbnailsLoading = ConcurrentHashMap.newKeySet();

    private final Activity activity;
    private final int foreground;
    private final int secondary;
    private final Adapter adapter = new Adapter();
    private final TextView emptyView;
    private final LibrarySearchView searchView;
    private final MenuItem searchItem;
    private final MenuItem cancelAllItem;

    private final List<Object> rows = new ArrayList<>();
    private String query = "";
    private boolean destroyed;

    private final Runnable changeListener = this::reload;

    OfflineLibraryScreen(Activity activity) {
        this.activity = activity;
        ThemePatch.applyToSettingsActivity(activity);
        activity.setTheme(Utils.getResourceIdentifierOrThrow(ThemeUtils.isDarkModeEnabled()
                ? "Theme.YouTube.Settings.Dark"
                : "Theme.YouTube.Settings", "style"));
        BaseThemeUtils.setNavigationBarColor(activity.getWindow());

        foreground = ThemeUtils.getAppForegroundColor();
        secondary = (foreground & 0x00FFFFFF) | 0xAA000000;
        final int background = ThemeUtils.getAppBackgroundColor();

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.setFitsSystemWindows(true);

        Toolbar toolbar = new Toolbar(activity);
        toolbar.setBackgroundColor(ThemeUtils.getToolbarBackgroundColor());
        toolbar.setNavigationIcon(ThemeUtils.getBackButtonDrawable());
        toolbar.setCollapseIcon(ThemeUtils.getBackButtonDrawable());
        tintToolbarOverflowIcon(toolbar);
        toolbar.setNavigationContentDescription(str("revanced_settings_navigate_up"));
        toolbar.setNavigationOnClickListener(v -> activity.finish());
        // A centered TextView avoids the Toolbar theme's title margins and extra font padding.
        TextView toolbarTitle = new TextView(activity);
        toolbarTitle.setText(str("revanced_offline_library_title"));
        toolbarTitle.setTextColor(foreground);
        toolbarTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        toolbarTitle.setSingleLine();
        toolbarTitle.setEllipsize(TextUtils.TruncateAt.END);
        toolbarTitle.setIncludeFontPadding(false);
        toolbarTitle.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.addView(toolbarTitle, new Toolbar.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.START | Gravity.CENTER_VERTICAL));
        TypedValue actionBarSize = new TypedValue();
        final int toolbarHeight = activity.getTheme().resolveAttribute(
                android.R.attr.actionBarSize, actionBarSize, true)
                ? TypedValue.complexToDimensionPixelSize(actionBarSize.data, activity.getResources().getDisplayMetrics())
                : Utils.dipToPixels(56);
        root.addView(toolbar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, toolbarHeight));

        searchView = new LibrarySearchView();

        Menu menu = toolbar.getMenu();
        searchItem = menu.add(str("revanced_offline_library_search"));
        searchItem.setIcon(OfflineUi.icon(activity, "search", foreground));
        searchItem.setActionView(searchView);
        searchItem.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS | MenuItem.SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW);
        searchItem.setOnActionExpandListener(new MenuItem.OnActionExpandListener() {
            @Override
            public boolean onMenuItemActionExpand(MenuItem item) {
                return true;
            }

            @Override
            public boolean onMenuItemActionCollapse(MenuItem item) {
                searchView.input.setText("");
                return true;
            }
        });

        MenuItem sortItem = menu.add(str("revanced_offline_library_sort"));
        sortItem.setIcon(OfflineUi.icon(activity, "sort", foreground));
        sortItem.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
        sortItem.setOnMenuItemClickListener(clicked -> {
            showSortDialog();
            return true;
        });

        // A playlist queues many downloads, so they can be cancelled together.
        cancelAllItem = menu.add(str("revanced_offline_cancel_all"));
        cancelAllItem.setIcon(OfflineUi.icon(activity, "close", foreground));
        cancelAllItem.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
        cancelAllItem.setVisible(false);
        cancelAllItem.setOnMenuItemClickListener(clicked -> {
            confirmCancelAll();
            return true;
        });

        MenuItem playlistItem = menu.add(str("revanced_offline_batch_menu"));
        playlistItem.setIcon(OfflineUi.icon(activity, "download", foreground));
        playlistItem.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
        playlistItem.setOnMenuItemClickListener(clicked -> {
            askPlaylist();
            return true;
        });

        FrameLayout content = new FrameLayout(activity);
        ListView list = new ListView(activity);
        list.setDivider(null);
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> {
            Object row = rows.get(position);
            if (row instanceof OfflineVideo video) {
                OfflineScreens.openPlayer(activity, video.key());
            }
        });
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            Object row = rows.get(position);
            if (row instanceof OfflineVideo video) {
                showActions(video);
                return true;
            }
            return false;
        });
        content.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        emptyView = new TextView(activity);
        emptyView.setText(str("revanced_offline_library_empty"));
        emptyView.setTextColor(secondary);
        emptyView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        emptyView.setGravity(Gravity.CENTER);
        final int padding = Utils.dipToPixels(32);
        emptyView.setPadding(padding, padding, padding, padding);
        content.addView(emptyView, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        list.setEmptyView(emptyView);

        root.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        activity.setContentView(root);

        OfflineIndex.addListener(changeListener);
        OfflineDownloader.addListener(changeListener);
        reload();
        verifyFiles();
    }

    private void tintToolbarOverflowIcon(Toolbar toolbar) {
        Drawable overflowIcon = toolbar.getOverflowIcon();
        if (overflowIcon != null) {
            overflowIcon = overflowIcon.mutate();
            overflowIcon.setTint(foreground);
            toolbar.setOverflowIcon(overflowIcon);
        }
    }

    private void showSortDialog() {
        String[] labels = new String[SORTS.length];
        for (int i = 0; i < SORTS.length; i++) {
            labels[i] = str("revanced_offline_library_sort_" + SORTS[i].toLowerCase(Locale.ROOT));
        }
        final String currentSort = Settings.OFFLINE_LIBRARY_SORT.get();
        int selected = 0;
        for (int i = 0; i < SORTS.length; i++) {
            if (SORTS[i].equals(currentSort)) selected = i;
        }
        showLibraryChoices(str("revanced_offline_library_sort"), labels, selected, which -> {
            Settings.OFFLINE_LIBRARY_SORT.save(SORTS[which]);
            reload();
        });
    }

    /** A plain input avoids the platform SearchView's underline and magnifier inside its hint. */
    private final class LibrarySearchView extends FrameLayout implements CollapsibleActionView {
        private final EditText input;

        LibrarySearchView() {
            super(activity);
            setPaddingRelative(0, 0, Utils.dipToPixels(8), 0);

            input = new EditText(activity);
            input.setSingleLine();
            input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            input.setTextColor(foreground);
            input.setHintTextColor(secondary);
            input.setHint(str("revanced_offline_library_search"));
            input.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
            input.setInputType(InputType.TYPE_CLASS_TEXT);
            input.setPaddingRelative(Utils.dipToPixels(16), 0, Utils.dipToPixels(16), 0);
            input.setGravity(Gravity.CENTER_VERTICAL);

            GradientDrawable pill = new GradientDrawable();
            pill.setCornerRadius(Utils.dipToPixels(20));
            pill.setColor(ThemeUtils.adjustColorBrightness(
                    ThemeUtils.getAppBackgroundColor(), 0.95f, 1.18f));
            input.setBackground(pill);
            addView(input, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Utils.dipToPixels(40), Gravity.CENTER_VERTICAL));

            input.setOnEditorActionListener((view, action, event) -> {
                hideKeyboard();
                input.clearFocus();
                return true;
            });
            input.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence text, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence text, int start, int before, int count) {
                    query = text.toString().trim().toLowerCase(Locale.ROOT);
                    reload();
                }

                @Override
                public void afterTextChanged(Editable text) {
                }
            });
        }

        private void hideKeyboard() {
            InputMethodManager keyboard = activity.getSystemService(InputMethodManager.class);
            keyboard.hideSoftInputFromWindow(input.getWindowToken(), 0);
        }

        @Override
        public void onActionViewExpanded() {
            // Toolbar replaces the action view's LayoutParams with WRAP_CONTENT during expansion.
            // Keep its expanded-view metadata, but fill the space between collapse and overflow.
            ViewGroup.LayoutParams layoutParams = getLayoutParams();
            layoutParams.width = ViewGroup.LayoutParams.MATCH_PARENT;
            layoutParams.height = ViewGroup.LayoutParams.MATCH_PARENT;
            setLayoutParams(layoutParams);

            input.requestFocus();
            input.post(() -> activity.getSystemService(InputMethodManager.class)
                    .showSoftInput(input, InputMethodManager.SHOW_IMPLICIT));
        }

        @Override
        public void onActionViewCollapsed() {
            hideKeyboard();
            input.clearFocus();
        }
    }

    /** Uses the settings dialog layout, but keeps even AMOLED surfaces equal to the library background. */
    private Pair<Dialog, LinearLayout> createLibraryDialog(String title, @Nullable String message,
                                                          @Nullable EditText input, @Nullable Runnable onConfirm) {
        Pair<Dialog, LinearLayout> dialog = CustomDialog.create(
                activity, title, message, input, null, onConfirm,
                onConfirm == null ? null : () -> {}, null, null, true);
        dialog.second.getBackground().mutate().setTint(ThemeUtils.getAppBackgroundColor());
        if (input != null && message != null) {
            TextView description = text(16, foreground, Integer.MAX_VALUE);
            description.setText(message);
            description.setPadding(0, 0, 0, Utils.dipToPixels(16));
            dialog.second.addView(description, 1);
        }

        return dialog;
    }

    private void showLibraryChoices(String title, String[] labels, int selected, IntConsumer onChosen) {
        Pair<Dialog, LinearLayout> dialog = createLibraryDialog(title, null, null, null);
        LinearLayout choices = new LinearLayout(activity);
        choices.setOrientation(LinearLayout.VERTICAL);

        for (int index = 0; index < labels.length; index++) {
            final int choice = index;
            TextView row = text(16, foreground, 2);
            row.setText(labels[index]);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinHeight(Utils.dipToPixels(52));
            row.setPaddingRelative(Utils.dipToPixels(8), 0, Utils.dipToPixels(8), 0);
            TypedValue selectable = new TypedValue();
            activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, selectable, true);
            row.setBackgroundResource(selectable.resourceId);
            if (index == selected) {
                row.setCompoundDrawablesRelativeWithIntrinsicBounds(
                        null, null, OfflineUi.icon(activity, "check", foreground), null);
                row.setCompoundDrawablePadding(Utils.dipToPixels(16));
            }
            row.setOnClickListener(view -> {
                dialog.first.dismiss();
                onChosen.accept(choice);
            });
            choices.addView(row, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        ScrollView scroll = new ScrollView(activity);
        scroll.addView(choices);
        dialog.second.addView(scroll, 1, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        dialog.first.show();
    }

    // region data

    private void reload() {
        if (destroyed) return;
        rows.clear();
        List<OfflineDownloader.Task> tasks = OfflineDownloader.getTasks();
        cancelAllItem.setVisible(tasks.size() > 1);
        for (OfflineDownloader.Task task : tasks) {
            if (matches(task.title)) rows.add(task);
        }
        for (OfflineVideo video : OfflineScreens.sorted(OfflineIndex.getAll())) {
            if (matches(video.title) || matches(video.author)) rows.add(video);
        }
        emptyView.setText(query.isEmpty()
                ? str("revanced_offline_library_empty")
                : str("revanced_offline_library_no_results"));
        adapter.notifyDataSetChanged();
    }

    private boolean matches(String text) {
        return query.isEmpty() || text.toLowerCase(Locale.ROOT).contains(query);
    }

    /** Drops entries whose file was deleted outside the app. */
    private void verifyFiles() {
        List<OfflineVideo> videos = OfflineIndex.getAll();
        Utils.runOnBackgroundThread(() -> {
            for (OfflineVideo video : videos) {
                if (!OfflineMediaStore.exists(activity.getApplicationContext(), video.contentUri)) {
                    Logger.printInfo(() -> "File of " + video.key() + " is gone, removing it from the library");
                    Utils.runOnMainThread(() -> OfflinePlayer.closeIfPlaying(video.key()));
                    OfflineIndex.remove(video.key());
                }
            }
        });
    }

    // endregion

    // region actions

    private void showActions(OfflineVideo video) {
        // A tap opens YouTube's player, so the built-in one gets an entry.
        final boolean builtInEntry = Settings.OFFLINE_USE_YOUTUBE_PLAYER.get();
        final int offset = builtInEntry ? 1 : 0;
        String[] actions = new String[4 + offset];
        if (builtInEntry) actions[0] = str("revanced_offline_action_play_builtin");
        actions[offset] = str("revanced_offline_action_play_background");
        actions[offset + 1] = str("revanced_offline_action_share");
        actions[offset + 2] = str("revanced_offline_action_open_youtube");
        actions[offset + 3] = str("revanced_offline_action_delete");
        showLibraryChoices(video.title, actions, -1, which -> {
            if (builtInEntry && which == 0) {
                OfflineScreens.openBuiltInPlayer(activity, video.key());
                return;
            }

            switch (which - offset) {
                case 0 -> {
                    OfflinePlayer.play(video, OfflineScreens.order());
                    Utils.showToastShort(str("revanced_offline_playing_background"));
                }
                case 1 -> share(video);
                case 2 -> openOnYouTube(video);
                case 3 -> confirmDelete(video);
                default -> {
                }
            }
        });
    }

    private void share(OfflineVideo video) {
        Uri uri = Uri.parse(video.contentUri);
        if ("file".equals(uri.getScheme())) {
            // Sharing file uris crashes the receiver on Android 7+, and the app has no FileProvider.
            Utils.showToastLong(str("revanced_offline_share_unsupported"));
            return;
        }
        Intent intent = new Intent(Intent.ACTION_SEND)
                .setType(OfflineMediaStore.mimeType(video.displayName))
                .putExtra(Intent.EXTRA_STREAM, uri)
                .putExtra(Intent.EXTRA_SUBJECT, video.title)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        try {
            activity.startActivity(Intent.createChooser(intent, video.title));
        } catch (Exception ex) {
            Logger.printException(() -> "Could not share " + video.videoId, ex);
        }
    }

    private void openOnYouTube(OfflineVideo video) {
        Intent intent = new Intent(Intent.ACTION_VIEW,
                Uri.parse("https://www.youtube.com/watch?v=" + video.videoId))
                .setPackage(activity.getPackageName());
        try {
            activity.startActivity(intent);
        } catch (Exception ex) {
            Logger.printException(() -> "Could not open " + video.videoId, ex);
        }
    }

    private void confirmDelete(OfflineVideo video) {
        createLibraryDialog(str("revanced_offline_delete_title"),
                str("revanced_offline_delete_message", video.title), null, () -> {
                    OfflinePlayer.closeIfPlaying(video.key());
                    if (OfflineMediaStore.delete(activity, video.contentUri)) {
                        Logger.printInfo(() -> "Deleted " + video.key());
                        OfflineIndex.remove(video.key());
                    }
                    // Otherwise the system asks for consent, and the next resume drops the entry
                    // if the user agreed.
                }).first.show();
    }

    private void confirmCancelAll() {
        createLibraryDialog(str("revanced_offline_cancel_all"),
                str("revanced_offline_cancel_all_message", OfflineDownloader.getTasks().size()),
                null, () -> OfflineDownloader.cancelAll(false)).first.show();
    }

    /** YouTube shows its own playlist download button only to some accounts, so the library offers a way in. */
    private void askPlaylist() {
        EditText input = CustomDialog.createEditText(activity);
        input.setHintTextColor(secondary);
        input.setHint(str("revanced_offline_batch_input_hint"));
        input.setSingleLine();
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        try {
            ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData clip = clipboard == null ? null : clipboard.getPrimaryClip();
            CharSequence copied = clip == null || clip.getItemCount() == 0
                    ? null : clip.getItemAt(0).coerceToText(activity);
            if (copied != null && OfflinePlaylist.parseId(copied.toString()) != null) {
                input.setText(copied.toString().trim());
                input.selectAll();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not read the playlist clipboard", ex);
        }
        createLibraryDialog(str("revanced_offline_batch_menu"),
                str("revanced_offline_batch_input_message"), input, () -> {
                    String playlistId = OfflinePlaylist.parseId(input.getText().toString());
                    Logger.printInfo(() -> "Library playlist dialog confirmed, parsed id: " + playlistId);
                    if (playlistId == null) {
                        Utils.showToastLong(str("revanced_offline_batch_input_invalid"));
                    } else {
                        OfflineDownloader.downloadPlaylist(activity, playlistId);
                    }
                }).first.show();
    }

    // endregion

    // region lifecycle

    @Override
    public boolean onBackPressed() {
        if (searchItem.isActionViewExpanded()) {
            searchItem.collapseActionView();
            return true;
        }
        return false;
    }

    @Override
    public void onResume() {
        reload();
        verifyFiles();
    }

    @Override
    public void onPause() {
    }

    @Override
    public void onDestroy() {
        destroyed = true;
        OfflineIndex.removeListener(changeListener);
        OfflineDownloader.removeListener(changeListener);
    }

    // endregion

    // region rows

    static String formatDuration(long millis) {
        long seconds = Math.max(0, millis / 1000);
        long hours = seconds / 3600;
        long minutes = (seconds % 3600) / 60;
        long secs = seconds % 60;
        return hours > 0
                ? String.format(Locale.US, "%d:%02d:%02d", hours, minutes, secs)
                : String.format(Locale.US, "%d:%02d", minutes, secs);
    }

    private final class Adapter extends BaseAdapter {
        @Override
        public int getCount() {
            return rows.size();
        }

        @Override
        public Object getItem(int position) {
            return rows.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public int getViewTypeCount() {
            return 2;
        }

        @Override
        public int getItemViewType(int position) {
            return rows.get(position) instanceof OfflineDownloader.Task ? 0 : 1;
        }

        @Override
        public View getView(int position, @Nullable View convertView, ViewGroup parent) {
            Object row = rows.get(position);
            if (row instanceof OfflineDownloader.Task task) {
                TaskRow view = convertView instanceof TaskRow existing ? existing : new TaskRow();
                view.bind(task);
                return view;
            }
            VideoRow view = convertView instanceof VideoRow existing ? existing : new VideoRow();
            view.bind((OfflineVideo) row);
            return view;
        }
    }

    private TextView text(float sizeSp, int color, int maxLines) {
        TextView view = new TextView(activity);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizeSp);
        view.setTextColor(color);
        view.setMaxLines(maxLines);
        view.setEllipsize(TextUtils.TruncateAt.END);
        return view;
    }

    private final class TaskRow extends LinearLayout {
        private final TextView title = text(15, foreground, 2);
        private final TextView status = text(13, secondary, 1);
        private final ProgressBar progress = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        private String taskKey;

        TaskRow() {
            super(activity);
            setOrientation(HORIZONTAL);
            setGravity(Gravity.CENTER_VERTICAL);
            final int padding = Utils.dipToPixels(16);
            setPadding(padding, padding / 2, padding / 2, padding / 2);

            LinearLayout texts = new LinearLayout(activity);
            texts.setOrientation(VERTICAL);
            texts.addView(title);
            texts.addView(progress, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            texts.addView(status);
            addView(texts, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            ImageButton cancel = new ImageButton(activity);
            cancel.setImageDrawable(OfflineUi.icon(activity, "close", foreground));
            cancel.setBackgroundColor(Color.TRANSPARENT);
            cancel.setContentDescription(str("revanced_offline_cancel"));
            cancel.setOnClickListener(v -> {
                if (taskKey != null) OfflineDownloader.cancel(taskKey);
            });
            addView(cancel, new LayoutParams(Utils.dipToPixels(48), Utils.dipToPixels(48)));
        }

        void bind(OfflineDownloader.Task task) {
            taskKey = task.key;
            title.setText(task.title);
            final int percent = task.getPercent();
            final boolean determinate = task.getState() == OfflineDownloader.State.DOWNLOADING && percent >= 0;
            progress.setIndeterminate(!determinate);
            if (determinate) progress.setProgress(percent);
            String state = switch (task.getState()) {
                case QUEUED -> str("revanced_offline_download_queued");
                case MERGING -> str("revanced_offline_download_merging");
                case SAVING -> str("revanced_offline_download_saving");
                default -> percent < 0
                        ? str("revanced_offline_download_starting")
                        : str("revanced_offline_download_progress", percent);
            };
            List<String> parts = new ArrayList<>();
            if (task.batch != null) parts.add(task.index + "/" + task.batch.total);
            if (!task.qualityLabel.isEmpty()) parts.add(task.qualityLabel);
            parts.add(state);
            status.setText(TextUtils.join(" · ", parts));
        }
    }

    private final class VideoRow extends LinearLayout {
        private final ImageView thumbnail = new ImageView(activity);
        private final TextView duration = text(12, Color.WHITE, 1);
        private final TextView title = text(15, foreground, 2);
        private final TextView channel = text(13, secondary, 1);
        private final TextView details = text(13, secondary, 2);
        private String videoKey;

        VideoRow() {
            super(activity);
            setOrientation(HORIZONTAL);
            final int padding = Utils.dipToPixels(12);
            setPadding(Utils.dipToPixels(16), padding, Utils.dipToPixels(16), padding);

            FrameLayout thumbnailFrame = new FrameLayout(activity);
            thumbnail.setScaleType(ImageView.ScaleType.CENTER_CROP);
            thumbnail.setClipToOutline(true);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(Utils.dipToPixels(8));
            shape.setColor(0x33808080);
            thumbnail.setBackground(shape);
            thumbnailFrame.addView(thumbnail, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));

            GradientDrawable badge = new GradientDrawable();
            badge.setCornerRadius(Utils.dipToPixels(4));
            badge.setColor(0xCC000000);
            duration.setBackground(badge);
            final int badgePadding = Utils.dipToPixels(4);
            duration.setPadding(badgePadding, 0, badgePadding, 0);
            FrameLayout.LayoutParams badgeParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
            badgeParams.setMargins(badgePadding, badgePadding, badgePadding, badgePadding);
            thumbnailFrame.addView(duration, badgeParams);
            addView(thumbnailFrame, new LayoutParams(Utils.dipToPixels(160), Utils.dipToPixels(90)));

            LinearLayout texts = new LinearLayout(activity);
            texts.setOrientation(VERTICAL);
            texts.setPadding(padding, 0, 0, 0);
            texts.addView(title);
            texts.addView(channel);
            texts.addView(details);
            addView(texts, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        }

        void bind(OfflineVideo video) {
            videoKey = video.key();
            title.setText(video.title);
            channel.setText(video.author);
            channel.setVisibility(video.author.isEmpty() ? GONE : VISIBLE);
            details.setText(describe(video));
            duration.setText(formatDuration(video.lengthMs));
            duration.setVisibility(video.lengthMs > 0 ? VISIBLE : GONE);
            loadThumbnail(video);
        }

        /**
         * The meta line of the card: the quality and the size, then the codec and the format id.
         * The resume position gets a line of its own.
         */
        private CharSequence describe(OfflineVideo video) {
            StringBuilder text = new StringBuilder();
            appendPart(text, video.audioOnly ? audioCodecName(video) : video.qualityLabel);
            if (video.sizeBytes > 0) {
                appendPart(text, Formatter.formatShortFileSize(activity, video.sizeBytes));
            }
            appendPart(text, technicalDetails(video));

            if (video.lastPositionMs > 0 && video.lengthMs > 0) {
                if (text.length() > 0) text.append('\n');
                text.append(str("revanced_offline_library_resume", formatDuration(video.lastPositionMs)));
            }
            return text;
        }

        /**
         * The codec and the format id of a video, or the bitrate and the format id of an audio
         * download. Entries made before these were stored show nothing here.
         */
        private String technicalDetails(OfflineVideo video) {
            if (video.codec.isEmpty()) return "";

            List<String> parts = new ArrayList<>(2);
            if (video.audioOnly) {
                if (video.bitrateKbps > 0) parts.add(str("revanced_offline_library_bitrate", video.bitrateKbps));
            } else {
                parts.add(video.codec);
            }
            if (video.itag > 0) parts.add(str("revanced_offline_picker_format_id", video.itag));
            return TextUtils.join(" · ", parts);
        }

        /** {@code Opus} and {@code M4A} instead of the {@code Opus audio} label of the picker. */
        private String audioCodecName(OfflineVideo video) {
            if (OfflineFormats.CODEC_OPUS.equals(video.codec)) {
                return str("revanced_offline_picker_audio_opus");
            }
            if (OfflineFormats.CODEC_AAC.equals(video.codec)) {
                return str("revanced_offline_picker_audio_m4a");
            }
            return video.qualityLabel;
        }

        private void appendPart(StringBuilder text, String part) {
            if (part.isEmpty()) return;
            if (text.length() > 0) text.append(" · ");
            text.append(part);
        }

        private void loadThumbnail(OfflineVideo video) {
            final String key = video.key();
            Bitmap cached = thumbnails.get(key);
            thumbnail.setImageBitmap(cached);
            if (cached != null || video.thumbnailPath.isEmpty() || !thumbnailsLoading.add(key)) {
                return;
            }
            Utils.runOnBackgroundThread(() -> {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = 2;
                Bitmap bitmap = BitmapFactory.decodeFile(video.thumbnailPath, options);
                thumbnailsLoading.remove(key);
                if (bitmap == null) return;
                thumbnails.put(key, bitmap);
                Utils.runOnMainThread(() -> {
                    if (key.equals(videoKey)) thumbnail.setImageBitmap(bitmap);
                });
            });
        }
    }

}
