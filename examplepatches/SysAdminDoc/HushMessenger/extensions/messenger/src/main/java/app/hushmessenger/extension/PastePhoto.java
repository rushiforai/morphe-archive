package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.ViewParent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * A photo pasted into a chat waits in the chat instead of going out by itself (#180). Messenger hands pasted content to
 * the keyboard's own route, which sends the photo as it is: no preview, no caption, no HD, and the server decides on its
 * own whether it arrives as a photo or as a sticker. Here the paste takes the route a pick from the phone's gallery
 * takes, by handing the chat the same result that pick comes back as, so the photo sits in the chat with Send left to
 * tap. Anything else, text and a GIF from the keyboard included, goes Messenger's way.
 */
public final class PastePhoto {
    static final String KEY = "paste_photo";
    /** How many open chats are remembered. A chat's view tells which chat a paste happened in. */
    private static final int CHATS = 8;
    /** GIFs the keyboard inserts go Messenger's way: it has its own route for them, and they send as GIFs. */
    private static final String GIF = "image/gif";
    private static final List<Chat> chats = new ArrayList<>();

    private PastePhoto() {}

    /** One open chat: the fragment that takes the result, and the view its composer sits in. */
    private static final class Chat {
        final WeakReference<Object> fragment;
        final WeakReference<View> view;

        Chat(Object fragment, View view) {
            this.fragment = new WeakReference<>(fragment);
            this.view = new WeakReference<>(view);
        }
    }

    /**
     * Every chat hands over itself and its view as it opens. A chat opened before the switch went on isn't remembered, so
     * a paste there goes Messenger's way until it's opened again.
     */
    public static void chatShown(Object fragment, View view) {
        try {
            if (fragment == null || view == null || !Settings.wouldUse(KEY)) return;
            synchronized (chats) {
                for (int i = chats.size() - 1; i >= 0; i--) {
                    Chat chat = chats.get(i);
                    Object had = chat.fragment.get();
                    if (had == null || chat.view.get() == null || had == fragment) chats.remove(i);
                }
                chats.add(new Chat(fragment, view));
                while (chats.size() > CHATS) chats.remove(0);
            }
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Couldn't follow the chat you opened", error);
        }
    }

    /**
     * The chat's text input asks this about every paste before Messenger reads it. True means the photo is already in the
     * chat and Messenger has nothing left to send. One photo the phone can read, pasted in a chat that's open, is all this
     * takes: several items, a GIF, text, a paste somewhere else and the switch off all go back to Messenger.
     */
    public static boolean pasted(View view, ClipData clip) {
        try {
            Context context = Settings.appContext;
            if (view == null || clip == null || context == null || clip.getItemCount() != 1 || !Settings.wouldUse(KEY)) {
                return false;
            }
            Uri item = clip.getItemAt(0).getUri();
            if (item == null || !"content".equals(item.getScheme())) return false;
            String type = context.getContentResolver().getType(item);
            if (type == null) return false;
            String lower = type.toLowerCase(Locale.ROOT);
            if (!lower.startsWith("image/") || lower.startsWith(GIF)) return false;
            Object chat = chatFor(view);
            if (chat == null || !Settings.enabled(KEY)) return false;
            return handOver(chat, GalleryPicker.chatItem(item, type));
        } catch (RuntimeException error) {
            Settings.hookFailed(KEY, "Couldn't put the pasted photo in the chat", error);
            return false;
        }
    }

    /** The open chat the pasted view sits in, or null: a paste anywhere else is Messenger's. */
    private static Object chatFor(View pasted) {
        synchronized (chats) {
            for (int i = chats.size() - 1; i >= 0; i--) {
                Chat chat = chats.get(i);
                Object fragment = chat.fragment.get();
                View root = chat.view.get();
                if (fragment == null || root == null) {
                    chats.remove(i);
                    continue;
                }
                if (holds(root, pasted)) return fragment;
            }
        }
        return null;
    }

    /** Whether the chat's view holds the view that was pasted in. */
    private static boolean holds(View root, View pasted) {
        View step = pasted;
        while (step != null) {
            if (step == root) return true;
            ViewParent parent = step.getParent();
            step = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    /**
     * The chat reads a photo from another app through its own result handler, and that's where the photo goes: the same
     * request, the same result and the same one-item marker a pick from the phone's gallery comes back with. A chat that
     * can't take it leaves the paste to Messenger.
     */
    private static boolean handOver(Object chat, Intent one) {
        try {
            chat.getClass().getMethod("onActivityResult", int.class, int.class, Intent.class)
                .invoke(chat, CameraActivity.EXTERNAL_MEDIA_REQUEST, Activity.RESULT_OK, one);
            return true;
        } catch (ReflectiveOperationException | RuntimeException refused) {
            Settings.hookFailedPrivately(KEY, "Couldn't hand the pasted photo to the chat", refused);
            return false;
        }
    }
}
