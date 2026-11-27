package app.hushmessenger.extension;

import android.content.Context;
import android.view.View;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Keep taps in the chat preview (#247). The preview a long press on a chat opens lays a see-through layer over the
 * chat, and any tap on it opens the chat, the chat's own jump-to-the-bottom arrow included. With this switch on the
 * layer lets every touch through to the chat, and an Open chat row at the top of the menu under it opens the chat.
 */
public final class PreviewTaps {
    static final String KEY = "chat_preview_taps";
    /** Our chat menu row's id. Messenger hands it back on the tap, so it can't be one of Messenger's own. */
    static final int ROW_ID = 0x48550004;
    private static final String ROW_NAME = "hush_open_chat";
    /** The newest preview's tap layer, which Open chat clicks. */
    private static WeakReference<View> layer = new WeakReference<>(null);
    /** The newest preview itself. */
    private static WeakReference<Object> preview = new WeakReference<>(null);
    /** The type of the callbacks Messenger hands its preview, the open-chat one among them. */
    static final String CALLBACK = "kotlin.jvm.functions.Function0";
    /**
     * The preview's callbacks as it was built. Closing the preview clears them, and its menu closes it before Open chat's
     * tap arrives, so the layer's click had nothing left to open the chat with.
     */
    private static final Map<Field, Object> callbacks = new LinkedHashMap<>();
    /** Whether Messenger showed its preview since it started, with or without Preview chats on long press. */
    private static boolean previewSeen;

    private PreviewTaps() { }

    static void resetForTests() {
        layer = new WeakReference<>(null);
        preview = new WeakReference<>(null);
        callbacks.clear();
        previewSeen = false;
    }

    /**
     * ChatPreviewSize.tapLayer hands over each preview's tap layer as it's built. With the switch on, the layer stops
     * taking touches, so they reach the chat under it, and TalkBack skips it for the Open chat row. True when it did.
     */
    static boolean adopt(View tapLayer) {
        layer = new WeakReference<>(tapLayer);
        previewSeen = true;
        if (!Settings.enabled(KEY)) return false;
        tapLayer.setClickable(false);
        tapLayer.setLongClickable(false);
        tapLayer.setFocusable(false);
        tapLayer.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        return true;
    }

    /** Adds Open chat to the top of the menu a long press opens, when the switch is on and that menu sits in a preview. */
    static void menuRow(ChatHiding.Route target, ArrayList<Object> rows) {
        try {
            Context context = Settings.appContext;
            if (context == null || !Settings.wouldUse(KEY) || !(previewSeen || Settings.wouldUse("chat_preview"))) return;
            Object row = target.row(ROW_ID, ROW_NAME, new SettingsText(context).get("chat_preview_taps_open"), "MESSAGE", "APP_MESSENGER");
            if (row == null) return;
            // Messenger pads the list with empty slots up to the count it expects, so one goes to make room at the top.
            int slot = rows.indexOf(null);
            if (slot >= 0) rows.remove(slot);
            rows.add(0, row);
            Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't add Open chat to the chat menu", error);
        }
    }

    /**
     * ChatPreviewSize.preview hands over each preview as its view is built, with its callbacks already in place. With
     * the switch on, they're kept for Open chat.
     */
    static void keep(Object fragment) throws IllegalAccessException {
        callbacks.clear();
        preview = new WeakReference<>(fragment);
        if (fragment == null || !Settings.wouldUse(KEY)) return;
        for (Field field : fragment.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || !CALLBACK.equals(field.getType().getName())) continue;
            field.setAccessible(true);
            Object callback = field.get(fragment);
            if (callback != null) callbacks.put(field, callback);
        }
    }

    /**
     * Opens the chat whose menu was tapped the way a tap on the chat in the preview does: the preview's callbacks go back
     * for the length of a click on its layer, so Messenger opens the chat its own way, then they're cleared again.
     * Starting Messenger's older chat screen from here crashed Messenger on the S22, and the closed preview's layer
     * opened nothing on its own. A preview of another chat, or none, gets a toast instead.
     */
    static void tapped(ChatHiding.Route target, Object menu) {
        Context context = Settings.appContext;
        if (context == null) return;
        Object fragment = preview.get();
        View held = layer.get();
        List<Field> restored = new ArrayList<>();
        boolean opened = false;
        try {
            Object chat = target != null && target.menu.isInstance(menu) ? target.menuSummary.get(menu) : null;
            Object key = chat != null && target.summary.isInstance(chat) ? target.key.get(chat) : null;
            if (key != null && fragment != null && held != null && !callbacks.isEmpty() && shows(fragment, key)) {
                for (Map.Entry<Field, Object> kept : callbacks.entrySet()) {
                    if (kept.getKey().get(fragment) != null) continue;
                    kept.getKey().set(fragment, kept.getValue());
                    restored.add(kept.getKey());
                }
                opened = held.performClick();
            }
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't open the chat", error);
        } finally {
            for (Field field : restored) {
                try {
                    field.set(fragment, null);
                } catch (Throwable error) {
                    Settings.hookFailedPrivately(KEY, "Couldn't clear the chat preview", error);
                }
            }
            callbacks.clear();
        }
        if (!opened) Toast.makeText(context, new SettingsText(context).get("chat_preview_taps_gone"), Toast.LENGTH_SHORT).show();
    }

    /** Whether the preview holds this chat's key, so Open chat never opens some other chat's preview. */
    private static boolean shows(Object fragment, Object key) throws IllegalAccessException {
        for (Field field : fragment.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() == Object.class || !field.getType().isInstance(key)) continue;
            field.setAccessible(true);
            if (key.equals(field.get(fragment))) return true;
        }
        return false;
    }
}
