package app.template.extension.zalo.chat;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.shared.ZaloEnv;

/**
 * "Mark as read" toolbar button shown in the chat screen while Hide read receipts is enabled.
 * Sends a one-shot seen ACK that bypasses the hide hook, then clears Zalo's local unread state.
 */
public final class MarkAsRead {
    private static final String TAG = "MarkAsRead";
    private static final String VIEW_TAG = "nezumi_mark_as_read";
    private static final int ICON_FALLBACK = 0x7f081632;
    private static final int TITLE_FALLBACK = 0x7f1018eb;
    private static final ThreadLocal<Boolean> SEEN_BYPASS = new ThreadLocal<>();

    private MarkAsRead() { }

    /** Read by the patched seen ACK prologue; true only inside {@link #sendSeen}. */
    public static boolean isSeenBypass() {
        return Boolean.TRUE.equals(SEEN_BYPASS.get());
    }

    /** Called at the end of ChatView's drawer button refresh (UI thread). */
    public static void attach(Object chatView) {
        try {
            Object drawerObject = fieldValue(chatView, "v4");
            if (!(drawerObject instanceof View)) return;
            View drawer = (View) drawerObject;
            if (!(drawer.getParent() instanceof ViewGroup)) return;
            ViewGroup container = (ViewGroup) drawer.getParent();
            View button = findButton(container);

            Object presenter = fieldValue(chatView, "H1");
            Context context = container.getContext();
            boolean show = presenter != null && ChatOptions.isReadReceiptsHidden(context)
                && !Boolean.TRUE.equals(presenter.getClass().getMethod("I3").invoke(presenter))
                && drawer.getVisibility() == View.VISIBLE;
            if (!show) {
                if (button != null) container.removeView(button);
                return;
            }

            if (button == null) button = createButton(context);
            if (button == null) return;
            bindButton(button, chatView);
            if (button.getParent() != null) ((ViewGroup) button.getParent()).removeView(button);
            container.addView(button, Math.max(0, container.indexOfChild(drawer)));
        } catch (Exception | LinkageError error) {
            NezumiLog.w(TAG, "Unable to attach mark as read button", error);
        }
    }

    private static View findButton(ViewGroup container) {
        for (int i = 0; i < container.getChildCount(); i++) {
            View child = container.getChildAt(i);
            if (VIEW_TAG.equals(child.getTag())) return child;
        }
        return null;
    }

    private static View createButton(Context context) {
        try {
            Constructor<?> constructor = Class.forName("com.zing.zalo.ui.chat.actionbar.ChatViewActionBarButton")
                .getConstructor(Context.class, android.util.AttributeSet.class);
            View button = (View) constructor.newInstance(context, null);
            Resources resources = context.getResources();
            String pkg = context.getPackageName();
            int icon = resources.getIdentifier("zds_ic_read_message_line_24", "drawable", pkg);
            if (icon == 0) icon = ICON_FALLBACK;
            int title = resources.getIdentifier("str_mark_as_read_title", "string", pkg);
            if (title == 0) title = TITLE_FALLBACK;
            Drawable drawable = context.getDrawable(icon);
            if (drawable != null) {
                button.getClass().getMethod("setIconDrawable", Drawable.class).invoke(button, drawable.mutate());
            }
            CharSequence label = context.getText(title);
            button.setContentDescription(label);
            button.setTooltipText(label);
            button.setTag(VIEW_TAG);
            return button;
        } catch (ReflectiveOperationException | RuntimeException error) {
            NezumiLog.w(TAG, "Unable to create mark as read button", error);
            return null;
        }
    }

    private static void bindButton(View button, Object chatView) {
        button.setOnClickListener(view -> onClick(view.getContext(), chatView));
    }

    private static void onClick(Context context, Object chatView) {
        try {
            Object presenter = fieldValue(chatView, "H1");
            String convId = (String) presenter.getClass().getMethod("e2").invoke(presenter);
            if (convId == null || convId.isEmpty()) return;
            boolean group = Boolean.TRUE.equals(presenter.getClass().getMethod("B3").invoke(presenter));
            Object chat = presenter.getClass().getMethod("f2").invoke(presenter);
            Object messages = chat == null ? null : chat.getClass().getMethod("d0").invoke(chat);
            List<?> snapshot = messages instanceof List ? (List<?>) messages : null;
            Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            Thread worker = new Thread(() -> run(appContext, convId, group, snapshot), "nezumi-mark-read");
            worker.start();
        } catch (Exception | LinkageError error) {
            NezumiLog.w(TAG, "Mark as read click failed", error);
        }
    }

    private static void run(Context context, String convId, boolean group, List<?> messages) {
        boolean ok = false;
        try {
            sendSeen(convId, group, messages);
            ok = true;
        } catch (Exception | LinkageError error) {
            NezumiLog.w(TAG, "Unable to send seen ACK", error);
        }
        try {
            clearLocalUnread(convId);
        } catch (Exception | LinkageError error) {
            NezumiLog.w(TAG, "Unable to clear local unread state", error);
        }
        if (ok) {
            boolean vietnamese = ZaloEnv.isVietnamese(context);
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context,
                vietnamese ? "Đã đánh dấu đã xem" : "Marked as read", Toast.LENGTH_SHORT).show());
        }
    }

    private static void sendSeen(String convId, boolean group, List<?> messages) throws Exception {
        Object qc = lastIncomingAck(convId, messages);
        if (qc == null) throw new IllegalStateException("No incoming message to acknowledge");
        qc.getClass().getField("a").setInt(qc, 3);
        ArrayList<Object> list = new ArrayList<>();
        list.add(qc);
        Object manager = Class.forName("w4n").getMethod("c").invoke(null);
        SEEN_BYPASS.set(Boolean.TRUE);
        try {
            manager.getClass().getMethod("j", ArrayList.class).invoke(manager, list);
            manager.getClass().getMethod("i", ArrayList.class, boolean.class).invoke(manager, list, group);
        } finally {
            SEEN_BYPASS.remove();
        }
    }

    /** Prefer Zalo's tracked ACK entry; use the newest incoming message when it is missing or older. */
    private static Object lastIncomingAck(String convId, List<?> messages) throws Exception {
        Object tracked = null;
        try {
            Object store = Class.forName("y8g").getMethod("a").invoke(null);
            tracked = store.getClass().getMethod("z", String.class).invoke(store, convId);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.swallowedOnce(TAG, "tracked conversation lookup unavailable (y8g)", failure);
        }
        if (tracked != null && !isValid(tracked)) tracked = null;

        Object latest = null;
        if (messages != null) {
            Class<?> messageClass = Class.forName("vv3");
            Constructor<?> constructor = Class.forName("qc").getConstructor(messageClass);
            for (int i = messages.size() - 1; i >= 0; i--) {
                Object message = messages.get(i);
                if (message == null || !messageClass.isInstance(message)) continue;
                if (Boolean.TRUE.equals(messageClass.getMethod("R3").invoke(message))) continue;
                Object candidate = constructor.newInstance(message);
                if (isValid(candidate)) {
                    latest = candidate;
                    break;
                }
            }
        }
        if (tracked == null) return latest;
        if (latest == null) return tracked;
        return field(latest, "c") > field(tracked, "c") ? latest : tracked;
    }

    private static boolean isValid(Object qc) throws ReflectiveOperationException {
        return field(qc, "b") != 0L && field(qc, "c") != 0L;
    }

    private static long field(Object owner, String name) throws ReflectiveOperationException {
        return owner.getClass().getField(name).getLong(owner);
    }

    private static void clearLocalUnread(String convId) throws Exception {
        // MarkAsReadConversation: clears notification, manual unread flag and the local badge.
        Object useCase = Class.forName("cfj").getMethod("A0").invoke(null);
        ArrayList<String> ids = new ArrayList<>();
        ids.add(convId);
        Object request = Class.forName("hcf").getConstructor(List.class).newInstance(ids);
        useCase.getClass().getMethod("L", Object.class).invoke(useCase, request);
    }

    private static Object fieldValue(Object owner, String name) throws ReflectiveOperationException {
        Field field = owner.getClass().getField(name);
        return field.get(owner);
    }
}
