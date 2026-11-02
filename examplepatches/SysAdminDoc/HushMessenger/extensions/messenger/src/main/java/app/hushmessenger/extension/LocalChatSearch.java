package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Parcelable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

/**
 * The button over a chat's search results that opens {@link LocalSearchActivity} (#92). Messenger's own search asks the
 * server, which no longer answers for some old chats, so the screen searches what's saved on this phone instead.
 * Reads nothing until it's tapped, and Messenger's own list carries on underneath.
 */
public final class LocalChatSearch {
    static final String KEY = "local_chat_search";

    /** The chat and words Messenger's list was last handed. A list that comes back after a rotation keeps its own. */
    private static volatile Object chat;
    private static volatile String words;

    private LocalChatSearch() {}

    public static void query(Object thread, String text) {
        chat = thread;
        words = text;
    }

    public static void attach(View list) {
        try {
            if (list == null || !Settings.enabled(KEY) || !Settings.available(KEY)) return;
            SavedBar bar = new SavedBar(list);
            list.addOnAttachStateChangeListener(bar);
            if (list.isAttachedToWindow()) bar.onViewAttachedToWindow(list);
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't add the saved messages button", error);
        }
    }

    /** The screen for the chat Messenger's list is showing, or null before it has one. */
    static Intent screen(Context context) {
        Object thread = chat;
        if (!(thread instanceof Parcelable)) return null;
        return new Intent(context, LocalSearchActivity.class)
            .putExtra(LocalSearchActivity.EXTRA_CHAT, (Parcelable) thread)
            .putExtra(LocalSearchActivity.EXTRA_CHAT_KEY, thread.toString())
            .putExtra(LocalSearchActivity.EXTRA_WORDS, words);
    }

    /** Lives while the list is on screen, in the activity's content, since the list itself is drawn by Messenger's Litho. */
    private static final class SavedBar implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener {
        private final View list;
        private final Rect visible = new Rect();
        private final int[] where = new int[2];
        private ViewGroup content;
        private ViewTreeObserver observer;
        private LinearLayout bar;

        SavedBar(View list) {
            this.list = list;
        }

        @Override public void onViewAttachedToWindow(View view) {
            try {
                if (bar != null) return;
                View found = view.getRootView().findViewById(android.R.id.content);
                if (!(found instanceof FrameLayout)) return;
                content = (ViewGroup) found;
                bar = bar(view.getContext());
                content.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
                observer = content.getViewTreeObserver();
                observer.addOnGlobalLayoutListener(this);
            } catch (RuntimeException error) {
                Settings.hookFailedPrivately(KEY, "Couldn't show the saved messages button", error);
            }
        }

        private static LinearLayout bar(Context context) {
            boolean light = Settings.preferences.getBoolean("light", false);
            SettingsUi ui = new SettingsUi(context, light);
            LinearLayout bar = ui.column();
            bar.setBackgroundColor(ui.background);
            bar.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), ui.dp(8));
            Button button = ui.button(new SettingsText(context).get("local_search_open"));
            button.setOnClickListener(tapped -> {
                try {
                    Intent screen = screen(context);
                    if (screen != null) context.startActivity(screen);
                } catch (RuntimeException error) {
                    Settings.hookFailedPrivately(KEY, "Couldn't open the saved messages search", error);
                }
            });
            bar.addView(button);
            return bar;
        }

        /** Stays above the keyboard and navigation bar, and hides with the list when Messenger hides it. */
        @Override public void onGlobalLayout() {
            if (bar == null || content == null) return;
            bar.setVisibility(list.isShown() ? View.VISIBLE : View.GONE);
            content.getWindowVisibleDisplayFrame(visible);
            content.getLocationOnScreen(where);
            int covered = Math.max(0, where[1] + content.getHeight() - visible.bottom);
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) bar.getLayoutParams();
            if (params.bottomMargin == covered) return;
            params.bottomMargin = covered;
            bar.setLayoutParams(params);
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnGlobalLayoutListener(this);
            else if (content != null) content.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            if (content != null && bar != null) content.removeView(bar);
            observer = null;
            content = null;
            bar = null;
        }
    }
}
