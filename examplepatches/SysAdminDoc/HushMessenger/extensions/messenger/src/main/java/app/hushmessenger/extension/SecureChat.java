package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Block screenshots in chats (#187). Android refuses to screenshot or record a window marked secure, and keeps it out
 * of the app switcher's preview, so an open chat marks the window it sits in and gives it up when the chat goes. It
 * covers this phone only: the person on the other side has their own.
 *
 * A window Messenger had already secured itself, the way it does for a disappearing chat, is left secure on the way
 * out, and a second chat in the same window keeps it secure until the last one leaves.
 * Public, since the call comes from Messenger's own chat fragment in another package.
 */
public final class SecureChat {
    static final String KEY = "secure_chat";
    private static final int SECURE = WindowManager.LayoutParams.FLAG_SECURE;

    /** The chat views already being watched, so one view gets one listener. */
    private static final Set<View> watched = Collections.newSetFromMap(new WeakHashMap<>());
    /** The chats holding a window secure right now, so the last one out is the one that clears it. */
    private static final Map<View, Window> securing = new WeakHashMap<>();
    /** Windows that came in secure, which stay that way. */
    private static final Set<Window> theirs = Collections.newSetFromMap(new WeakHashMap<>());

    private SecureChat() { }

    /** The chat fragment's view, on its way in. Called whether the switch is on or off. */
    public static void chatShown(Object fragment, View view) {
        try {
            if (view == null) return;
            if (watched.add(view)) {
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View attached) {
                        secure(attached);
                    }

                    @Override public void onViewDetachedFromWindow(View detached) {
                        release(detached);
                    }
                });
            }
            if (view.isAttachedToWindow()) secure(view);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't hold the chat's window secure", error);
        }
    }

    /** Marks the chat's window secure, which is what has Android refuse a screenshot or a recording of it. */
    private static void secure(View chat) {
        try {
            if (!Settings.enabled(KEY) || securing.containsKey(chat)) return;
            Window window = windowOf(chat);
            if (window == null) return;
            // Messenger's own, so this chat leaves it as it found it.
            if (!securing.containsValue(window) && (window.getAttributes().flags & SECURE) != 0) theirs.add(window);
            securing.put(chat, window);
            window.addFlags(SECURE);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't hold the chat's window secure", error);
        }
    }

    /** The chat is gone, so the window takes screenshots again once no chat of ours is left in it. */
    private static void release(View chat) {
        try {
            Window window = securing.remove(chat);
            if (window == null || securing.containsValue(window)) return;
            if (!theirs.remove(window)) window.clearFlags(SECURE);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't give the chat's window back", error);
        }
    }

    /** The window the chat is drawn in, through the screen it belongs to, or none. */
    private static Window windowOf(View view) {
        for (Context context = view.getContext(); context instanceof ContextWrapper;
                context = ((ContextWrapper) context).getBaseContext()) {
            if (context instanceof Activity) return ((Activity) context).getWindow();
        }
        return null;
    }
}
