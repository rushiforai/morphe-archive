package app.badfella.extension.linkedin;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.Collections;

/**
 * "Copy post text": long pressing a post's text copies all of it, also the part hidden behind "...more".
 *
 * The text is an SDUI text block (feed-commentary) whose payload holds the whole text. The filter hook sees it at
 * the start of its transform ({@link #onComponent}), right before the transform builds its ClickActions, where the
 * ClickActions hook ({@link #longClick}) gives it a long click: an ActionListViewData (an interface) of our own,
 * which copies the text when the long click runs its actions.
 */
@SuppressWarnings("unused")
public final class CopyPostText {
    private static final String ACTION_LIST = "com.linkedin.sdui.viewdata.action.ActionListViewData";
    /** The text of the feed-commentary component being transformed on this thread, for its ClickActions. */
    private static final ThreadLocal<String> pending = new ThreadLocal<>();
    private static volatile Class<?> actionListType;

    private CopyPostText() {
    }

    /** Compact data type of a text block, whose payload holds its text at field 1, field 1. */
    private static final long TEXT_BLOCK_TYPE = 13158;

    /** At the start of every SDUI component transform. */
    static void onComponent(Object component, String viewName) {
        pending.remove();
        if (!"feed-commentary".equals(viewName) || !Settings.copyPostText()) return;
        try {
            Object compact = Proto.is(component, "hasCompactData") ? Proto.call(component, "getCompactData") : null;
            Object type = compact == null ? null : Proto.call(compact, "getTypeId");
            if (!(type instanceof Long) || (Long) type != TEXT_BLOCK_TYPE) return;
            Object payload = Proto.call(compact, "getPayload");
            Object bytes = payload == null ? null : Proto.call(payload, "toByteArray");
            if (!(bytes instanceof byte[])) return;
            byte[] block = field((byte[]) bytes, 1);
            byte[] text = block == null ? null : field(block, 1);
            if (text != null && text.length > 0) pending.set(new String(text, StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Diagnostics.error("copy post text failed", t);
        }
    }

    /** The bytes of the first length-delimited field [number] of the message [data], or null. */
    private static byte[] field(byte[] data, int number) {
        int p = 0;
        while (p < data.length) {
            long[] tag = varint(data, p);
            if (tag == null) return null;
            p = (int) tag[1];
            switch ((int) (tag[0] & 7)) {
                case 0: {
                    long[] value = varint(data, p);
                    if (value == null) return null;
                    p = (int) value[1];
                    break;
                }
                case 1:
                    p += 8;
                    break;
                case 2: {
                    long[] length = varint(data, p);
                    if (length == null || length[0] < 0 || length[1] + length[0] > data.length) return null;
                    int start = (int) length[1];
                    int end = (int) (length[1] + length[0]);
                    if ((tag[0] >>> 3) == number) return java.util.Arrays.copyOfRange(data, start, end);
                    p = end;
                    break;
                }
                case 5:
                    p += 4;
                    break;
                default:
                    return null;
            }
        }
        return null;
    }

    /** {value, next position}, or null at a truncated varint. */
    private static long[] varint(byte[] data, int p) {
        long value = 0;
        for (int shift = 0; shift < 64 && p < data.length; shift += 7) {
            byte b = data[p++];
            value |= (long) (b & 0x7F) << shift;
            if ((b & 0x80) == 0) return new long[]{value, p};
        }
        return null;
    }

    /** In the ClickActions constructor, for its onLongClick: a long click that copies the pending post text. */
    public static Object longClick(Object onLongClick) {
        String text = pending.get();
        pending.remove();
        if (text == null || onLongClick != null) return onLongClick;
        try {
            Class<?> type = actionListType;
            if (type == null) {
                type = Class.forName(ACTION_LIST, false, CopyPostText.class.getClassLoader());
                actionListType = type;
            }
            return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, handler(text));
        } catch (Throwable t) {
            Diagnostics.error("copy post text failed", t);
            return null;
        }
    }

    private static InvocationHandler handler(String text) {
        return (proxy, method, args) -> {
            switch (method.getName()) {
                case "equals":
                    return proxy == args[0];
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "toString":
                    return "CopyPostText";
                case "isEmpty":
                    return false;
                case "getActions":
                    onActions(text);
                    return Collections.emptyList();
                case "getTrackingBreadcrumbs":
                    return Collections.emptyList();
                default:
                    return null;
            }
        };
    }

    private static long lastCopy;

    /** The long click runs: copies [text]. Calls in quick succession are one long click. */
    private static void onActions(String text) {
        long now = System.currentTimeMillis();
        if (now - lastCopy < 1000) return;
        lastCopy = now;
        new Handler(Looper.getMainLooper()).post(() -> {
            Context context = Settings.context();
            if (context == null) return;
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null) return;
            clipboard.setPrimaryClip(ClipData.newPlainText("LinkedIn post", text));
            Downloads.toast(context, "Post text copied");
        });
    }
}
