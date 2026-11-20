package app.aidan.extension.adobereader;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class SettingsBridge {
    private static final String TAG = "SettingsBridge";

    private SettingsBridge() {}

    public static void hideTelemetryPreferences(final Object fragment) {
        if (fragment == null) {
            return;
        }

        Runnable task = new Runnable() {
            @Override
            public void run() {
                try {
                    Class<?> clazz = fragment.getClass();

                    // Read direct fields on D0: C (optin), e0 (summary), A (crash)
                    Field optinField = findField(clazz, "C");
                    Field summaryField = findField(clazz, "e0");
                    Field crashField = findField(clazz, "A");

                    Object optinPref = optinField != null ? optinField.get(fragment) : null;
                    Object summaryPref = summaryField != null ? summaryField.get(fragment) : null;
                    Object crashPref = crashField != null ? crashField.get(fragment) : null;

                    // Hide parent group of optin if present
                    if (optinPref != null) {
                        hideParent(optinPref);
                    }

                    // Also try resolving via PreferenceFragment getString + findPreference if any field was null
                    if (optinPref == null || crashPref == null) {
                        try {
                            Method getStringMethod = clazz.getMethod("getString", int.class);
                            Method findPrefMethod = null;
                            for (Method m : clazz.getMethods()) {
                                if (m.getParameterTypes().length == 1 &&
                                        CharSequence.class.isAssignableFrom(m.getParameterTypes()[0]) &&
                                        m.getReturnType() != void.class &&
                                        !m.getName().equals("getString")) {
                                    findPrefMethod = m;
                                    break;
                                }
                            }
                            if (findPrefMethod != null) {
                                if (optinPref == null) {
                                    String optinKey = (String) getStringMethod.invoke(fragment, 0x7f1524a6);
                                    optinPref = findPrefMethod.invoke(fragment, optinKey);
                                    if (optinPref != null) {
                                        hideParent(optinPref);
                                    }
                                }
                                if (summaryPref == null) {
                                    String sumKey = (String) getStringMethod.invoke(fragment, 0x7f1524a7);
                                    summaryPref = findPrefMethod.invoke(fragment, sumKey);
                                }
                                if (crashPref == null) {
                                    String crashKey = (String) getStringMethod.invoke(fragment, 0x7f152433);
                                    crashPref = findPrefMethod.invoke(fragment, crashKey);
                                }
                            }
                        } catch (Throwable ignored) {
                        }
                    }

                    hidePreference(optinPref);
                    hidePreference(summaryPref);
                    hidePreference(crashPref);
                } catch (Throwable t) {
                    Log.w(TAG, "Failed to hide telemetry preferences", t);
                }
            }
        };

        if (Looper.myLooper() == Looper.getMainLooper()) {
            task.run();
        } else {
            new Handler(Looper.getMainLooper()).post(task);
        }
    }

    private static void hideParent(Object pref) {
        if (pref == null) {
            return;
        }
        try {
            Method getParentMethod = pref.getClass().getMethod("v");
            Object parentGroup = getParentMethod.invoke(pref);
            if (parentGroup != null) {
                hidePreference(parentGroup);
            }
        } catch (Throwable ignored) {
        }
    }

    private static Field findField(Class<?> clazz, String fieldName) {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            try {
                Field f = current.getDeclaredField(fieldName);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException e) {
                current = current.getSuperclass();
            }
        }
        return null;
    }

    private static void hidePreference(Object pref) {
        if (pref == null) {
            return;
        }
        try {
            Method setVisibleMethod = pref.getClass().getMethod("Q0", boolean.class);
            setVisibleMethod.invoke(pref, false);
        } catch (Throwable ignored) {
        }
    }
}
