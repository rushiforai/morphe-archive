package app.lchanc3.extension.jptt;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;

import com.joshua.jptt.DBHelper;
import com.joshua.jptt.FavoriteListFragment;
import com.joshua.jptt.MainActivity;

import java.util.ArrayList;
import java.util.List;

/**
 * Long pressing a keyword in the search dialog's 最近看板搜尋 / 最近搜尋 lists opens
 * the menu the 最近搜尋 tab opens for the same entry.
 *
 * <p>The options and their wording are the ones
 * {@code FavoriteListFragment.showOptionDialog()} uses for search history, and
 * deleting and clearing call what it calls. Afterwards the tab reloads its list,
 * while the dialog here takes the keywords that are gone off the screen.
 *
 * <p>The shortcut is the exception. JPTT's shortcut for a search only opens its
 * board, though JPTT can open a board with a search: its article widget hands
 * {@code MainActivity} a {@code wKeyword} next to {@code wBoard}. So the shortcut
 * made here, and the one the 最近搜尋 tab makes through {@link #buildShortcut},
 * adds the keyword as an extra, and {@link #passSearchKeyword} copies it into
 * {@code wKeyword} on the way from {@code SplashActivity} to {@code MainActivity}.
 */
@SuppressWarnings("unused")
public final class SearchHistoryActionsPatch {

    private static final String SHORTCUT = "在啟動器建立捷徑";
    private static final String DELETE = "刪除這筆紀錄";
    private static final String CLEAR = "清除歷史紀錄";

    /** The keyword a search shortcut opens its board with. */
    private static final String EXTRA_KEYWORD = "lchanc3_search_keyword";

    /** Marks the keyword buttons, so clearing the history can find them all. */
    private static final Object KEYWORD_TAG = new Object();

    /**
     * Called from the patched {@code addSearchHistoryListToLayout()} for each
     * keyword button, once it has been inflated.
     */
    public static void addActions(TextView button, Object entry) {
        if (!(entry instanceof FavoriteListFragment.FavoriteItem)) {
            return;
        }
        FavoriteListFragment.FavoriteItem item = (FavoriteListFragment.FavoriteItem) entry;
        button.setTag(KEYWORD_TAG);
        button.setOnLongClickListener(view -> {
            try {
                showMenu(button, item);
            } catch (Throwable ex) {
                Log.e(JpttContext.LOG_TAG, "Could not open the search history menu", ex);
            }
            return true;
        });
    }

    private static void showMenu(TextView button, FavoriteListFragment.FavoriteItem item) {
        Context context = button.getContext();
        String[] options = {SHORTCUT, DELETE, CLEAR};
        new AlertDialog.Builder(context)
                .setTitle("您想做什麼?")
                .setItems(options, (dialog, which) -> {
                    String site = site(context);
                    if (site == null) {
                        return;
                    }
                    switch (options[which]) {
                        case SHORTCUT:
                            showShortcutDialog(context, site, item);
                            break;
                        case DELETE:
                            DBHelper.deleteBoardHistory(context, item.title, item.keyword, site);
                            remove(button);
                            break;
                        case CLEAR:
                            confirmClear(button, site);
                            break;
                    }
                })
                .setPositiveButton("什麼都不做", null)
                .setCancelable(true)
                .show();
    }

    /**
     * Called from the patched 在啟動器建立捷徑 of the history tabs' menu, in place
     * of {@code MainActivity.showBuildShortcutOnLauncherDialog(context, site,
     * entry.title)}. A search history row gets a shortcut to its search; anything
     * else gets the board shortcut JPTT would have made.
     */
    public static void buildShortcut(Context context, String site, Object entry) {
        if (!(entry instanceof FavoriteListFragment.FavoriteItem)) {
            return;
        }
        FavoriteListFragment.FavoriteItem item = (FavoriteListFragment.FavoriteItem) entry;
        if (item.keyword != null && !item.keyword.isEmpty()) {
            showShortcutDialog(context, site, item);
        } else {
            MainActivity.showBuildShortcutOnLauncherDialog(context, site, item.title);
        }
    }

    /**
     * What {@code MainActivity.showBuildShortcutOnLauncherDialog()} asks, for a
     * shortcut that opens the board with this search.
     */
    private static void showShortcutDialog(
            Context context, String site, FavoriteListFragment.FavoriteItem item) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            // Pinning needs ShortcutManager; fall back to JPTT's board shortcut.
            MainActivity.showBuildShortcutOnLauncherDialog(context, site, item.title);
            return;
        }

        EditText input = new EditText(context);
        input.setSingleLine(true);
        input.setHint("捷徑標題");
        input.setText(item.title + " " + item.subtitle.trim());
        input.setSelection(input.getText().length());

        int padding = (int) (24 * context.getResources().getDisplayMetrics().density);
        FrameLayout frame = new FrameLayout(context);
        frame.setPadding(padding, padding / 2, padding, 0);
        frame.addView(input);

        new AlertDialog.Builder(context)
                .setTitle("輸入捷徑標題")
                .setView(frame)
                .setPositiveButton("建立", (dialog, which) -> {
                    try {
                        pinSearchShortcut(context, input.getText().toString(), site, item);
                    } catch (Throwable ex) {
                        Log.e(JpttContext.LOG_TAG, "Could not pin the search shortcut", ex);
                        Toast.makeText(context, "無法建立捷徑", Toast.LENGTH_SHORT).show();
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    /**
     * {@code MainActivity.buildShortcutOnLauncher()} with the keyword added. Built
     * on the platform's ShortcutManager, since the app's shrunk androidx.core may
     * not keep what ShortcutManagerCompat needs from outside.
     */
    private static void pinSearchShortcut(
            Context context, String label, String site, FavoriteListFragment.FavoriteItem item) {
        if (label.trim().isEmpty()) {
            label = item.title + " " + item.subtitle.trim();
        }
        Intent intent = new Intent(Intent.ACTION_SEND)
                // By name, so a clone with a renamed package still opens itself.
                .setClassName(context, "com.joshua.jptt.SplashActivity")
                .putExtra("board", item.title)
                .putExtra("site", site)
                .putExtra(EXTRA_KEYWORD, item.keyword)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

        ShortcutManager manager = context.getSystemService(ShortcutManager.class);
        if (manager == null || !manager.isRequestPinShortcutSupported()) {
            Toast.makeText(context, "桌面不支援建立捷徑", Toast.LENGTH_SHORT).show();
            return;
        }
        // The label doubles as the id, as it does for JPTT's own shortcuts.
        manager.requestPinShortcut(
                new ShortcutInfo.Builder(context, label)
                        .setShortLabel(label)
                        .setIcon(Icon.createWithResource(context, context.getApplicationInfo().icon))
                        .setIntent(intent)
                        .build(),
                null);
    }

    /**
     * Called from the patched {@code SplashActivity.startMainActivity()} with what
     * it is about to hand {@code MainActivity}. Opening a search shortcut, that is
     * the board alone; this adds the search, which {@code MainActivity} then
     * applies the way it does for the widget.
     */
    public static void passSearchKeyword(Context context, Bundle extras) {
        try {
            if (!(context instanceof Activity) || extras == null) {
                return;
            }
            Intent intent = ((Activity) context).getIntent();
            String keyword = intent == null ? null : intent.getStringExtra(EXTRA_KEYWORD);
            if (keyword == null || keyword.isEmpty() || extras.getString("wBoard") == null) {
                return;
            }
            extras.putString("wKeyword", keyword);
        } catch (Throwable ex) {
            // The board still opens, just without the search.
            Log.e(JpttContext.LOG_TAG, "Could not pass the search on", ex);
        }
    }

    /** What {@code SettingsActivity.showClearBoardHistoryDialog()} asks for searches. */
    private static void confirmClear(TextView button, String site) {
        Context context = button.getContext();
        new AlertDialog.Builder(context)
                .setTitle("噢")
                .setMessage("真的要清除最近搜尋嗎?")
                .setPositiveButton("好", (dialog, which) -> {
                    DBHelper.clearBoardHistory(context, site, true);
                    List<View> buttons = new ArrayList<>();
                    collectKeywords(button.getRootView(), buttons);
                    for (View keyword : buttons) {
                        remove(keyword);
                    }
                })
                .setNegativeButton("不要", null)
                .setCancelable(true)
                .show();
    }

    /** The site the history is kept under, or null with a toast if not connected. */
    private static String site(Context context) {
        if (MainActivity.socket == null) {
            Toast.makeText(context, "尚未連線", Toast.LENGTH_SHORT).show();
            return null;
        }
        return MainActivity.socket.getSiteAddress();
    }

    /**
     * Takes one keyword button out of its list, and hides the list the way
     * {@code addSearchHistoryListToLayout()} does when there is nothing to show.
     */
    private static void remove(View button) {
        ViewParent parent = button.getParent();
        if (!(parent instanceof ViewGroup)) {
            return;
        }
        ViewGroup list = (ViewGroup) parent;
        list.removeView(button);

        // The list also holds its 最近搜尋 label, so empty means no keywords left.
        for (int i = 0; i < list.getChildCount(); i++) {
            if (list.getChildAt(i).getTag() == KEYWORD_TAG) {
                return;
            }
        }
        ViewParent row = list.getParent();
        if (row instanceof View) {
            ((View) row).setVisibility(View.GONE);
        }
    }

    private static void collectKeywords(View view, List<View> into) {
        if (view.getTag() == KEYWORD_TAG) {
            into.add(view);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                collectKeywords(group.getChildAt(i), into);
            }
        }
    }

    private SearchHistoryActionsPatch() {
    }
}
