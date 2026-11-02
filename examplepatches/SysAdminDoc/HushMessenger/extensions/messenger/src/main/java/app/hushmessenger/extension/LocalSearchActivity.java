package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.format.DateUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Searches one chat's messages saved on this phone (#92), in its own process, see the patch's addLocalSearch. A hit opens
 * Messenger's chat at that message. Only what the phone has loaded can be found, and the screen says how far that goes.
 */
public final class LocalSearchActivity extends Activity {
    static final String EXTRA_CHAT = "hush_chat";
    static final String EXTRA_CHAT_KEY = "hush_chat_key";
    static final String EXTRA_WORDS = "hush_words";
    private static final String THREAD_VIEW = "com.facebook.orca.threadview.ThreadViewActivity";
    private static final String OPENED_FROM = "MESSAGE_SEARCH";
    private static final int SEARCH_LENGTH = 200;
    private static final int SHOWN_TEXT = 400;

    static boolean present(Context context) {
        try {
            context.getPackageManager().getActivityInfo(new ComponentName(context.getPackageName(), LocalSearchActivity.class.getName()), 0);
            return true;
        } catch (PackageManager.NameNotFoundException missing) {
            return false;
        }
    }

    private SettingsUi ui;
    private SettingsText text;
    private EditText field;
    private Button search;
    private TextView status;
    private final List<LocalSearchStore.Hit> hits = new ArrayList<>();
    private final Hits adapter = new Hits();
    private long chat;
    private AtomicBoolean running;

    @Override @SuppressWarnings("deprecation") protected void onCreate(Bundle state) {
        HostScreens.start(this);
        Settings.initialize(this);
        boolean light = Settings.preferences.getBoolean("light", false);
        setTheme(light ? android.R.style.Theme_Material_Light_NoActionBar : android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        chat = LocalSearchStore.chatNumber(getIntent().getStringExtra(EXTRA_CHAT_KEY));
        if (!Settings.enabled(LocalChatSearch.KEY) || chat < 0) {
            finish();
            return;
        }
        // Chat text on screen stays out of the Recents thumbnail, set before any message is read.
        if (Build.VERSION.SDK_INT >= 33) setRecentsScreenshotEnabled(false);
        else getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        ui = new SettingsUi(this, light);
        text = new SettingsText(this);
        getWindow().setStatusBarColor(ui.background);
        getWindow().setNavigationBarColor(ui.background);
        getWindow().getDecorView().setSystemUiVisibility(light ? View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0);
        setContentView(content());
        status.setText(text.get("local_search_help"));
        if (state != null) return;
        field.setText(getIntent().getStringExtra(EXTRA_WORDS));
        start();
    }

    @SuppressWarnings("deprecation") private View content() {
        LinearLayout root = ui.column();
        root.setBackgroundColor(ui.background);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft() + ui.dp(16), insets.getSystemWindowInsetTop() + ui.dp(12),
                insets.getSystemWindowInsetRight() + ui.dp(16), insets.getSystemWindowInsetBottom() + ui.dp(8));
            return insets;
        });
        root.addView(ui.title(text.get("local_search_title"), 22));
        field = ui.field(text.get("local_search_hint"), SEARCH_LENGTH, true);
        field.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        field.setOnEditorActionListener((view, action, event) -> {
            if (action != EditorInfo.IME_ACTION_SEARCH) return false;
            start();
            return true;
        });
        ui.add(root, field, 12);
        search = ui.primaryButton(text.get("local_search_run"));
        search.setOnClickListener(view -> {
            if (running != null) running.set(true);
            else start();
        });
        ui.add(root, search, 8);
        status = ui.text("", 13, ui.muted, false);
        ui.add(root, status, 10);
        ListView list = new ListView(this);
        list.setDivider(null);
        list.setClipToPadding(false);
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> open(hits.get(position)));
        LinearLayout.LayoutParams fill = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1);
        fill.topMargin = ui.dp(8);
        root.addView(list, fill);
        return root;
    }

    private void start() {
        String words = field.getText().toString();
        if (running != null || LocalSearchStore.words(words).length == 0) return;
        InputMethodManager keyboard = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(field.getWindowToken(), 0);
        hits.clear();
        adapter.notifyDataSetChanged();
        status.setText(text.get("local_search_running"));
        search.setText(text.get("local_search_stop"));
        AtomicBoolean stop = new AtomicBoolean();
        running = stop;
        File folder = getDatabasePath("x").getParentFile();
        Thread worker = new Thread(() -> {
            LocalSearchStore.Result result = null;
            try {
                result = read(folder, words, stop);
            } catch (SQLiteException | IllegalStateException error) {
                Settings.hookFailedPrivately(LocalChatSearch.KEY, "Couldn't read the saved messages", error);
            }
            LocalSearchStore.Result finished = result;
            runOnUiThread(() -> finished(stop, finished));
        }, "HushMessenger-local-search");
        worker.setDaemon(true);
        worker.start();
    }

    /** Null when there's no database to read. */
    private LocalSearchStore.Result read(File folder, String words, AtomicBoolean stop) {
        File file = folder == null ? null : LocalSearchStore.database(folder);
        if (file == null) return null;
        try (SQLiteDatabase database = SQLiteDatabase.openDatabase(file.getPath(), null,
                SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS)) {
            return LocalSearchStore.search(database, chat, words, stop);
        }
    }

    private void finished(AtomicBoolean stop, LocalSearchStore.Result result) {
        if (running != stop || isDestroyed()) return;
        running = null;
        search.setText(text.get("local_search_run"));
        if (result == null) {
            status.setText(text.get("local_search_failed"));
            return;
        }
        hits.addAll(result.hits);
        adapter.notifyDataSetChanged();
        status.setText(coverage(result));
    }

    /** How far the search went, so an empty or short list reads as what it is. */
    private String coverage(LocalSearchStore.Result result) {
        if (result.searched == 0) return text.get("local_search_nothing");
        String back = DateUtils.formatDateTime(this, result.oldest, DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_YEAR);
        return text.get(result.full ? "local_search_full" : result.stopped ? "local_search_stopped" : "local_search_done",
            result.hits.size(), result.searched, back);
    }

    /** Messenger's chat at the message. Its opener takes the chat, where the chat was opened from, and the message. */
    private void open(LocalSearchStore.Hit hit) {
        try {
            startActivity(chatAt(this, chatKey(), hit.messageId));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            Settings.hookFailedPrivately(LocalChatSearch.KEY, "Couldn't open the saved message", error);
            Toast.makeText(getApplicationContext(), text.get("local_search_open_failed"), Toast.LENGTH_SHORT).show();
        }
    }

    @SuppressWarnings("deprecation") private Parcelable chatKey() {
        Intent intent = getIntent();
        intent.setExtrasClassLoader(getClassLoader());
        return intent.getParcelableExtra(EXTRA_CHAT);
    }

    /** Found by shape, since its name changes with each of Messenger's builds. */
    static Intent chatAt(Context context, Object chat, String messageId) throws ReflectiveOperationException {
        if (chat == null) throw new NoSuchMethodException("no chat");
        Class<?> thread = Class.forName(THREAD_VIEW, false, context.getClassLoader());
        for (Method method : thread.getDeclaredMethods()) {
            Class<?>[] types = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Intent.class || types.length != 4
                || types[0] != Context.class || !types[1].isInstance(chat) || !types[2].isEnum()
                || types[3] != String.class) continue;
            for (Object source : types[2].getEnumConstants()) {
                if (!OPENED_FROM.equals(((Enum<?>) source).name())) continue;
                method.setAccessible(true);
                return (Intent) method.invoke(null, context, chat, source, messageId);
            }
        }
        throw new NoSuchMethodException("chat opener");
    }

    @Override protected void onDestroy() {
        if (running != null) running.set(true);
        running = null;
        super.onDestroy();
    }

    private final class Hits extends BaseAdapter {
        @Override public int getCount() { return hits.size(); }
        @Override public Object getItem(int position) { return hits.get(position); }
        @Override public long getItemId(int position) { return position; }

        @Override public View getView(int position, View reused, ViewGroup parent) {
            LinearLayout row;
            TextView heading, body;
            if (reused instanceof LinearLayout) {
                row = (LinearLayout) reused;
                heading = (TextView) row.getChildAt(0);
                body = (TextView) row.getChildAt(1);
            } else {
                row = ui.column();
                row.setPadding(ui.dp(4), ui.dp(10), ui.dp(4), ui.dp(10));
                heading = ui.text("", 12, ui.muted, false);
                body = ui.text("", 15, ui.text, false);
                row.addView(heading);
                row.addView(body);
            }
            LocalSearchStore.Hit hit = hits.get(position);
            String when = DateUtils.formatDateTime(LocalSearchActivity.this, hit.time,
                DateUtils.FORMAT_SHOW_DATE | DateUtils.FORMAT_SHOW_YEAR | DateUtils.FORMAT_SHOW_TIME);
            heading.setText(hit.sender == null || hit.sender.isEmpty() ? when : hit.sender + ", " + when);
            body.setText(hit.text.length() > SHOWN_TEXT ? hit.text.substring(0, SHOWN_TEXT) + "..." : hit.text);
            return row;
        }
    }
}
