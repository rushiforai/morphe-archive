package app.hushmessenger.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.List;

/**
 * Ask before a call (#130): a tap on a chat's audio or video call button asks first, so a stray tap doesn't ring
 * anyone. Both top bars hand their buttons over through {@link MarkReadButton}. Each call button keeps its tap
 * listener in a field typed as an interface with one onClick(View) method, and that listener is wrapped in place, so
 * the button looks and sits as it did. Call runs Messenger's own tap, Cancel drops it.
 */
final class CallConfirm {
    static final String KEY = "call_confirm";
    static final String VIDEO_TAG = "video_call_button";

    /** How the question is put on screen. Tests swap it for one that answers straight away. */
    interface Asker {
        void ask(View view, boolean video, Runnable call);
    }

    static volatile Asker asker = CallConfirm::showQuestion;

    private CallConfirm() { }

    /** Wraps the tap listener of every call button in [buttons] while the switch is on. Never throws. */
    static void guard(List<Object> buttons) {
        try {
            if (buttons == null || !Settings.enabled(KEY)) return;
            for (Object held : buttons) {
                if (held != null && MarkReadButton.isCall(held)) guard(held, MarkReadButton.hasTag(held, VIDEO_TAG));
            }
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't ask before a call", error);
        }
    }

    /** Wraps each tap listener [button] holds, and returns how many were wrapped. One already wrapped stays as it is. */
    static int guard(Object button, boolean video) throws IllegalAccessException {
        int wrapped = 0;
        for (Class<?> type = button.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !isTapListener(field.getType())) continue;
                field.setAccessible(true);
                Object listener = field.get(button);
                if (listener == null || asking(listener) != null) continue;
                field.set(button, Proxy.newProxyInstance(field.getType().getClassLoader(), new Class<?>[]{field.getType()},
                    new Asking(listener, video)));
                wrapped++;
            }
        }
        return wrapped;
    }

    /** An interface whose only abstract method is onClick(View) returning nothing, like View.OnClickListener. */
    static boolean isTapListener(Class<?> type) {
        if (!type.isInterface()) return false;
        Method tap = null;
        for (Method method : type.getMethods()) {
            if (!Modifier.isAbstract(method.getModifiers())) continue;
            if (tap != null) return false;
            tap = method;
        }
        return tap != null && "onClick".equals(tap.getName()) && tap.getReturnType() == void.class
            && tap.getParameterTypes().length == 1 && tap.getParameterTypes()[0] == View.class;
    }

    /** The wrapper behind [listener] when it's one of ours, else null. */
    static Asking asking(Object listener) {
        if (listener == null || !Proxy.isProxyClass(listener.getClass())) return null;
        InvocationHandler handler = Proxy.getInvocationHandler(listener);
        return handler instanceof Asking ? (Asking) handler : null;
    }

    /** Puts the question up over the chat. Call runs [call], Cancel and a tap outside leave it. */
    private static void showQuestion(View view, boolean video, Runnable call) {
        Context context = view.getContext();
        SettingsText text = new SettingsText(context);
        new AlertDialog.Builder(context, MaterialYouTheme.chatDialogTheme())
            .setMessage(text.get(video ? "call_confirm_video" : "call_confirm_audio"))
            .setPositiveButton(text.get("call_confirm_call"), (dialog, which) -> call.run())
            .setNegativeButton(text.get("call_confirm_cancel"), null)
            .show();
    }

    /** Stands in for a call button's tap listener: a tap asks first while the switch is on, everything else passes through. */
    static final class Asking implements InvocationHandler {
        final Object listener;
        final boolean video;

        Asking(Object listener, boolean video) {
            this.listener = listener;
            this.video = video;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals":
                        Asking other = asking(args[0]);
                        return args[0] == proxy || listener.equals(other != null ? other.listener : args[0]);
                    case "hashCode":
                        return listener.hashCode();
                    default:
                        return listener.toString();
                }
            }
            if ("onClick".equals(method.getName()) && args != null && args.length == 1 && args[0] instanceof View) {
                View view = (View) args[0];
                try {
                    if (Settings.enabled(KEY)) {
                        asker.ask(view, video, () -> pass(method, args));
                        return null;
                    }
                } catch (Throwable error) {
                    // A question that can't go up mustn't cost the call.
                    Settings.hookFailed(KEY, "Can't ask before the call", error);
                }
            }
            return call(method, args);
        }

        /** Messenger's own tap, after Call. */
        private void pass(Method method, Object[] args) {
            try {
                call(method, args);
            } catch (Throwable error) {
                Settings.hookFailed(KEY, "The call didn't start after Call", error);
            }
        }

        private Object call(Method method, Object[] args) throws Throwable {
            method.setAccessible(true);
            try {
                return method.invoke(listener, args);
            } catch (InvocationTargetException wrapped) {
                throw wrapped.getCause();
            }
        }
    }
}
