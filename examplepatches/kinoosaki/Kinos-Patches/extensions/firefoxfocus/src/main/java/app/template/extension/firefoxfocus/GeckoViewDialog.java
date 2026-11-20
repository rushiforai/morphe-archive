package app.template.extension.firefoxfocus;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.mozilla.geckoview.GeckoRuntime;
import org.mozilla.geckoview.GeckoSession;
import org.mozilla.geckoview.GeckoSessionSettings;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Shows a GeckoSession in a Dialog hosting an org.mozilla.geckoview.GeckoView: browser action
 * popups (the session Android Components created, private like every Focus tab) and, as a
 * fallback, an add-on's settings page. The session is released and closed when the dialog goes
 * away or its Activity is destroyed, and window.close() in the page dismisses it.
 *
 * GeckoView is a FrameLayout, so it is created and driven by reflection to keep Android types out
 * of the compile-only stubs.
 */
final class GeckoViewDialog {
    private static final String GECKO_VIEW = "org.mozilla.geckoview.GeckoView";

    private GeckoViewDialog() {
    }

    /** A browser action popup; runs on the main thread. */
    static void showPopup(GeckoSession session) {
        Activity activity = FocusAddons.foregroundActivity();
        if (activity == null) {
            closeQuietly(session);
            return;
        }
        show(activity, session, null);
    }

    /** Fallback for an add-on's settings page: a new private session in a full-screen dialog. */
    static void showPage(Activity activity, String title, String url) {
        GeckoSession session = null;
        try {
            Field field = GeckoRuntime.class.getDeclaredField("sRuntime");
            field.setAccessible(true);
            GeckoRuntime runtime = (GeckoRuntime) field.get(null);
            if (runtime == null) {
                FocusAddons.toast("Could not open the settings page.");
                return;
            }
            session = new GeckoSession(new GeckoSessionSettings.Builder().usePrivateMode(true).build());
            session.open(runtime);
            session.loadUri(url);
            show(activity, session, title);
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "showPage", t);
            closeQuietly(session);
            FocusAddons.toast("Could not open the settings page.");
        }
    }

    /** [title] null: a popup (80% high, dismissed by a tap outside); otherwise full screen with a header. */
    private static void show(Activity activity, GeckoSession session, String title) {
        View view = null;
        try {
            Class<?> geckoViewClass = Class.forName(GECKO_VIEW, true, activity.getClassLoader());
            view = (View) geckoViewClass.getConstructor(Context.class).newInstance(activity);
            geckoViewClass.getMethod("setSession", GeckoSession.class).invoke(view, session);
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "GeckoView", t);
            closeQuietly(session);
            return;
        }
        // Released exactly once: on dismiss, when the Activity is destroyed (the dismiss listener
        // does not fire then), or when the dialog cannot be built or shown.
        View geckoView = view;
        boolean[] released = {false};
        Runnable[] cancelDestroyHook = {null};
        Runnable releaseOnce = () -> {
            if (released[0]) return;
            released[0] = true;
            if (cancelDestroyHook[0] != null) cancelDestroyHook[0].run();
            release(geckoView, session);
        };
        boolean fullScreen = title != null;
        Dialog dialog = null;
        try {
            boolean night = FocusAddons.isNight(activity);
            int theme;
            if (fullScreen) {
                theme = night ? android.R.style.Theme_DeviceDefault_NoActionBar
                        : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
            } else {
                theme = night ? android.R.style.Theme_DeviceDefault_Dialog
                        : android.R.style.Theme_DeviceDefault_Light_Dialog;
            }
            dialog = new Dialog(activity, theme);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            if (fullScreen) root.addView(header(activity, title, dialog));
            root.addView(view, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
            dialog.setContentView(root);
            dialog.setCanceledOnTouchOutside(!fullScreen);
            // GeckoView may consume the back key; close the dialog first.
            dialog.setOnKeyListener((d, keyCode, event) -> {
                if (keyCode != KeyEvent.KEYCODE_BACK) return false;
                if (event.getAction() == KeyEvent.ACTION_UP) d.dismiss();
                return true;
            });
            dialog.setOnDismissListener(d -> releaseOnce.run());
            closeOnWindowClose(session, dialog);
            Dialog shown = dialog;
            cancelDestroyHook[0] = FocusAddons.onDestroyed(activity, () -> {
                releaseOnce.run();
                AddonsManager.dismissQuietly(shown);
            });

            dialog.show();
            Window window = dialog.getWindow();
            if (window != null) {
                int height = fullScreen ? ViewGroup.LayoutParams.MATCH_PARENT
                        : (int) (activity.getResources().getDisplayMetrics().heightPixels * 0.8f);
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, height);
                window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            }
            session.setActive(true);
            session.setFocused(true);
        } catch (Throwable t) {
            Log.e(FocusAddons.TAG, "show", t);
            releaseOnce.run();
            AddonsManager.dismissQuietly(dialog);
        }
    }

    private static View header(Activity activity, String title, Dialog dialog) {
        float density = activity.getResources().getDisplayMetrics().density;
        int padding = (int) (16 * density);
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(padding, padding / 2, padding / 2, padding / 2);

        TextView name = new TextView(activity);
        name.setText(title);
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        name.setTypeface(Typeface.DEFAULT_BOLD);
        name.setSingleLine(true);
        header.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView close = new TextView(activity);
        close.setText("Close");
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        close.setPadding(padding, padding / 2, padding, padding / 2);
        close.setOnClickListener(v -> dialog.dismiss());
        header.addView(close);
        return header;
    }

    /** Forwards every ContentDelegate call to Focus's delegate; onCloseRequest also dismisses. */
    private static void closeOnWindowClose(GeckoSession session, Dialog dialog) {
        try {
            GeckoSession.ContentDelegate original = session.getContentDelegate();
            Object proxy = Proxy.newProxyInstance(
                    GeckoSession.ContentDelegate.class.getClassLoader(),
                    new Class<?>[]{GeckoSession.ContentDelegate.class},
                    (self, method, args) -> {
                        String name = method.getName();
                        if (method.getDeclaringClass() == Object.class) {
                            if (name.equals("equals")) return self == args[0];
                            if (name.equals("hashCode")) return System.identityHashCode(self);
                            return "ContentDelegateProxy";
                        }
                        if (name.equals("onCloseRequest")) {
                            FocusAddons.MAIN.post(() -> AddonsManager.dismissQuietly(dialog));
                        }
                        if (original == null) return null;
                        try {
                            return method.invoke(original, args);
                        } catch (InvocationTargetException e) {
                            throw e.getCause() != null ? e.getCause() : e;
                        }
                    });
            session.setContentDelegate((GeckoSession.ContentDelegate) proxy);
        } catch (Throwable t) {
            Log.w(FocusAddons.TAG, "closeOnWindowClose", t);
        }
    }

    private static void release(View view, GeckoSession session) {
        try {
            Method releaseSession = view.getClass().getMethod("releaseSession");
            releaseSession.invoke(view);
        } catch (Throwable t) {
            Log.w(FocusAddons.TAG, "releaseSession", t);
        }
        closeQuietly(session);
    }

    private static void closeQuietly(GeckoSession session) {
        if (session == null) return;
        try {
            if (session.isOpen()) session.close();
        } catch (Throwable t) {
            Log.w(FocusAddons.TAG, "close session", t);
        }
    }
}
