package app.aidan.extension.adobescan;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public final class PdfOperationUi {

    private static final String TAG = "PdfOperationUi";
    private static final String PROGRESS_DIALOG_TAG = "progressDialogTag";

    private PdfOperationUi() {}

    public static void showProgress(
            final Activity activity,
            final String message,
            final Runnable onCancel) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        final Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                        return;
                    }
                    final Class<?> v3Class = Class.forName("qe.v3");
                    final Class<?> v3bClass = Class.forName("qe.v3$b");

                    Object cancelProxy = null;
                    if (onCancel != null) {
                        cancelProxy = Proxy.newProxyInstance(
                                v3bClass.getClassLoader(),
                                new Class<?>[]{v3bClass},
                                new InvocationHandler() {
                                    @Override
                                    public Object invoke(final Object proxy, final Method method, final Object[] args) {
                                        if ("onCancel".equals(method.getName())) {
                                            onCancel.run();
                                        }
                                        return null;
                                    }
                                });
                    }

                    // Try to instantiate via qe.v3() or qe.v3$a.a()
                    Object dialog = null;
                    try {
                        final Class<?> companionClass = Class.forName("qe.v3$a");
                        final Method aMethod = companionClass.getMethod(
                                "a", boolean.class, String.class, v3bClass);
                        dialog = aMethod.invoke(null, true, message, cancelProxy);
                    } catch (final Throwable t) {
                        final Constructor<?> ctor = v3Class.getConstructor();
                        dialog = ctor.newInstance();
                        try {
                            final Field qField = v3Class.getField("q");
                            qField.setBoolean(dialog, true); // cancelable
                            final Field rField = v3Class.getField("r");
                            rField.set(dialog, message);
                            final Field sField = v3Class.getField("s");
                            sField.set(dialog, cancelProxy);
                            final Field tField = v3Class.getField("t");
                            tField.setBoolean(dialog, true);
                        } catch (final Throwable ignored) {
                        }
                    }

                    // Store dialog in activity.U if activity is instance of com.adobe.scan.android.m
                    try {
                        final Field uField = activity.getClass().getField("U");
                        uField.set(activity, dialog);
                    } catch (final Throwable ignored) {
                    }

                    // Show DialogFragment
                    try {
                        Method getFm = null;
                        try {
                            getFm = activity.getClass().getMethod("getSupportFragmentManager");
                        } catch (final Throwable ignored) {
                            try {
                                getFm = activity.getClass().getMethod("W");
                            } catch (final Throwable ignored2) {
                            }
                        }
                        final Object fm = getFm != null ? getFm.invoke(activity) : null;
                        if (fm != null) {
                            boolean stateSaved = false;
                            try {
                                final Method isStateSavedMethod = fm.getClass().getMethod("isStateSaved");
                                final Object res = isStateSavedMethod.invoke(fm);
                                if (res instanceof Boolean) {
                                    stateSaved = (Boolean) res;
                                }
                            } catch (final Throwable ignored) {
                            }

                            if (activity.isFinishing() || activity.isDestroyed() || stateSaved) {
                                Log.w(TAG, "FragmentManager state saved or activity destroyed; skipping progress dialog show");
                                return;
                            }

                            Method showMethod = null;
                            for (final Method m : dialog.getClass().getMethods()) {
                                if (("H".equals(m.getName()) || "show".equals(m.getName()))
                                        && m.getParameterTypes().length == 2
                                        && m.getParameterTypes()[1] == String.class) {
                                    showMethod = m;
                                    break;
                                }
                            }
                            if (showMethod != null) {
                                showMethod.invoke(dialog, fm, PROGRESS_DIALOG_TAG);
                            }
                        }
                    } catch (final Throwable t) {
                        Log.w(TAG, "Failed to invoke show dialog fragment", t);
                    }
                } catch (final Throwable t) {
                    Log.e(TAG, "Failed to show native progress dialog", t);
                }
            }
        };

        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            new Handler(Looper.getMainLooper()).post(r);
        }
    }

    public static void dismissProgress(final Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        final Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    final Method m0Method = activity.getClass().getMethod("m0", boolean.class);
                    m0Method.invoke(activity, false);
                } catch (final Throwable t) {
                    // Try to dismiss via activity.U
                    try {
                        final Field uField = activity.getClass().getField("U");
                        final Object dialog = uField.get(activity);
                        if (dialog != null) {
                            final Method dismissMethod = dialog.getClass().getMethod("dismissAllowingStateLoss");
                            dismissMethod.invoke(dialog);
                            uField.set(activity, null);
                        }
                    } catch (final Throwable ignored) {
                    }
                }
            }
        };

        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            new Handler(Looper.getMainLooper()).post(r);
        }
    }

    public static void showSnackbar(final Activity activity, final String message) {
        if (activity == null || message == null || activity.isFinishing() || activity.isDestroyed()) return;

        final Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    final Method j1Method = activity.getClass().getMethod("j1", String.class);
                    j1Method.invoke(activity, message);
                } catch (final Throwable t) {
                    Log.e(TAG, "Failed to show snackbar on activity", t);
                }
            }
        };

        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            new Handler(Looper.getMainLooper()).post(r);
        }
    }
}
