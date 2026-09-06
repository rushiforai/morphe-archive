package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** Full-screen TV settings subpage for files owned by Local Downloads. */
public final class LocalDownloadsManagerActivity extends Activity {
    private final List<LocalDownloadsRuntime.DownloadedEntry> items = new ArrayList<>();
    private DownloadAdapter adapter;
    private TextView summary;
    private TextView empty;
    private Button deleteAll;
    private ListView list;
    private boolean selectLongPressHandled;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable selectLongPress = () -> {
        if (list == null) return;
        int position = list.getSelectedItemPosition();
        if (position < 0 || position >= items.size()) return;
        selectLongPressHandled = true;
        LocalDownloadsRuntime.showDeleteEntryAction(items.get(position));
    };

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        createUi();
    }

    @Override protected void onResume() {
        super.onResume();
        refresh();
    }

    private void createUi() {
        LinearLayout screen = new LinearLayout(this);
        screen.setOrientation(LinearLayout.VERTICAL);
        screen.setPadding(dp(64), dp(42), dp(64), dp(42));
        screen.setBackgroundColor(Color.rgb(18, 18, 18));

        LinearLayout heading = new LinearLayout(this);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = LocalDownloadsTvUi.text(this, 32, LocalDownloadsTvUi.TEXT_PRIMARY);
        title.setText(MorpheTranslations.text("Downloads"));
        heading.addView(title, new LinearLayout.LayoutParams(0, -2, 1f));
        deleteAll = LocalDownloadsTvUi.button(this, "Delete all downloads");
        deleteAll.setOnClickListener(view -> startActivity(
                new android.content.Intent(this, LocalDownloadsDeleteAllActivity.class)));
        heading.addView(deleteAll, new LinearLayout.LayoutParams(-2, dp(56)));
        screen.addView(heading, new LinearLayout.LayoutParams(-1, -2));

        summary = LocalDownloadsTvUi.text(this, 16, LocalDownloadsTvUi.TEXT_SECONDARY);
        LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(-1, -2);
        summaryParams.topMargin = dp(8);
        screen.addView(summary, summaryParams);

        TextView help = LocalDownloadsTvUi.text(this, 15, LocalDownloadsTvUi.TEXT_SECONDARY);
        help.setText(MorpheTranslations.text("Press an item to play it. Hold for playback or deletion options."));
        LinearLayout.LayoutParams helpParams = new LinearLayout.LayoutParams(-1, -2);
        helpParams.topMargin = dp(6);
        screen.addView(help, helpParams);

        list = new ListView(this);
        list.setDivider(new ColorDrawable(Color.TRANSPARENT));
        list.setDividerHeight(dp(12));
        StateListDrawable selector = new StateListDrawable();
        selector.addState(new int[]{android.R.attr.state_focused},
                LocalDownloadsTvUi.shape(Color.TRANSPARENT, dp(14),
                        dp(3), LocalDownloadsTvUi.TEXT_PRIMARY));
        selector.addState(new int[]{}, new ColorDrawable(Color.TRANSPARENT));
        list.setSelector(selector);
        list.setDrawSelectorOnTop(true);
        list.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        list.setItemsCanFocus(false);
        list.setClipToPadding(false);
        list.setPadding(0, dp(22), 0, 0);
        adapter = new DownloadAdapter();
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> {
            if (position < 0 || position >= items.size()) return;
            if (LocalDownloadsRuntime.playDownloadedEntry(items.get(position))) finish();
        });
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            LocalDownloadsRuntime.showDeleteEntryAction(items.get(position));
            return true;
        });
        list.setOnKeyListener((view, keyCode, event) -> {
            if (keyCode != KeyEvent.KEYCODE_DPAD_CENTER && keyCode != KeyEvent.KEYCODE_ENTER &&
                    keyCode != KeyEvent.KEYCODE_NUMPAD_ENTER) return false;
            if (event.getAction() == KeyEvent.ACTION_DOWN) {
                if (event.getRepeatCount() == 0) {
                    selectLongPressHandled = false;
                    main.removeCallbacks(selectLongPress);
                    main.postDelayed(selectLongPress, ViewConfiguration.getLongPressTimeout());
                } else if (!selectLongPressHandled) {
                    main.removeCallbacks(selectLongPress);
                    selectLongPress.run();
                }
                return selectLongPressHandled;
            }
            if (event.getAction() == KeyEvent.ACTION_UP) {
                main.removeCallbacks(selectLongPress);
                boolean handled = selectLongPressHandled;
                selectLongPressHandled = false;
                return handled;
            }
            return false;
        });
        screen.addView(list, new LinearLayout.LayoutParams(-1, 0, 1f));

        empty = LocalDownloadsTvUi.text(this, 19, LocalDownloadsTvUi.TEXT_SECONDARY);
        empty.setText(MorpheTranslations.text("No local downloads"));
        empty.setGravity(Gravity.CENTER);
        screen.addView(empty, new LinearLayout.LayoutParams(-1, 0, 1f));
        setContentView(screen);
    }

    private void refresh() {
        int selected = list == null ? -1 : list.getSelectedItemPosition();
        items.clear();
        items.addAll(LocalDownloadsRuntime.availableEntries());
        adapter.notifyDataSetChanged();
        int count = items.size();
        summary.setText(MorpheTranslations.format(count == 1 ? "%d item" : "%d items", count) + " • " +
                LocalDownloadsStorageStats.caption());
        deleteAll.setEnabled(count > 0);
        empty.setVisibility(count == 0 ? View.VISIBLE : View.GONE);
        if (count > 0) list.setSelection(Math.max(0, Math.min(selected, count - 1)));
    }

    private final class DownloadAdapter extends BaseAdapter {
        @Override public int getCount() { return items.size(); }
        @Override public Object getItem(int position) { return items.get(position); }
        @Override public long getItemId(int position) { return position; }

        @Override public View getView(int position, View recycled, ViewGroup parent) {
            LinearLayout row = recycled instanceof LinearLayout
                    ? (LinearLayout) recycled : createRow();
            LocalDownloadsRuntime.DownloadedEntry entry = items.get(position);
            TextView primary = (TextView) row.getChildAt(0);
            TextView secondary = (TextView) row.getChildAt(1);
            primary.setText(entry.displayLabel());
            String detail = entry.episodeTitle.isEmpty() ? entry.filename
                    : entry.episodeTitle + " • " + entry.filename;
            if (entry.size > 0L) detail += " • " + size(entry.size);
            secondary.setText(detail);
            return row;
        }

        private LinearLayout createRow() {
            LinearLayout row = new LinearLayout(LocalDownloadsManagerActivity.this);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(dp(24), dp(17), dp(24), dp(17));
            row.setFocusable(false);
            row.setFocusableInTouchMode(false);
            row.setSoundEffectsEnabled(true);
            StateListDrawable background = new StateListDrawable();
            background.addState(new int[]{android.R.attr.state_pressed},
                    LocalDownloadsTvUi.shape(LocalDownloadsTvUi.SELECTED, dp(14),
                            dp(2), LocalDownloadsTvUi.TEXT_PRIMARY));
            background.addState(new int[]{}, LocalDownloadsTvUi.shape(
                    LocalDownloadsTvUi.CARD, dp(14), 0, 0));
            row.setBackground(background);
            row.addView(LocalDownloadsTvUi.text(LocalDownloadsManagerActivity.this,
                    19, LocalDownloadsTvUi.TEXT_PRIMARY), new LinearLayout.LayoutParams(-1, -2));
            TextView detail = LocalDownloadsTvUi.text(LocalDownloadsManagerActivity.this,
                    14, LocalDownloadsTvUi.TEXT_SECONDARY);
            LinearLayout.LayoutParams detailParams = new LinearLayout.LayoutParams(-1, -2);
            detailParams.topMargin = dp(6);
            row.addView(detail, detailParams);
            row.setMinimumHeight(dp(82));
            return row;
        }
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }

    private static String size(long bytes) {
        if (bytes >= 1_073_741_824L) return String.format(Locale.US, "%.1f GB", bytes / 1_073_741_824.0);
        return String.format(Locale.US, "%.1f MB", bytes / 1_048_576.0);
    }
}
