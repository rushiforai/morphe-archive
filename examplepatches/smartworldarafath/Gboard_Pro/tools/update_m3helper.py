with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java', 'r', encoding='utf-8') as f:
    code = f.read()

# 1. Update resolveActivityTheme
old_theme = '''    public static int resolveActivityTheme(Activity activity) {
        try {
            android.content.pm.ActivityInfo info = activity.getPackageManager().getActivityInfo(
                    new android.content.ComponentName(activity, "com.google.android.apps.inputmethod.latin.preference.SettingsActivity"),
                    0);
            if (info.theme != 0) {
                return info.theme;
            }
        } catch (Throwable ignored) {
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return android.R.style.Theme_DeviceDefault_DayNight;
        }
        boolean nightMode = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return nightMode
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }'''

new_theme = '''    public static int resolveActivityTheme(Activity activity) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return android.R.style.Theme_DeviceDefault_DayNight;
        }
        boolean nightMode = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return nightMode
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar;
    }'''

# 2. Update registerPredictiveBackCallback
old_back = '''    public static void registerPredictiveBackCallback(final Activity activity) {
        if (activity == null || Build.VERSION.SDK_INT < 33) return;
        try {
            Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
            Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");

            Object callback = Proxy.newProxyInstance(
                    callbackClass.getClassLoader(),
                    new Class<?>[]{callbackClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            if ("onBackInvoked".equals(method.getName())) {
                                activity.finish();
                                applyActivityExitTransition(activity);
                            }
                            return null;
                        }
                    }
            );

            Object dispatcher = activity.getClass().getMethod("getOnBackInvokedDispatcher").invoke(activity);
            if (dispatcher != null) {
                dispatcherClass.getMethod("registerOnBackInvokedCallback", int.class, callbackClass)
                        .invoke(dispatcher, 0, callback);
            }
        } catch (Throwable ignored) {
        }
    }'''

new_back = '''    public static void registerPredictiveBackCallback(final Activity activity) {
        if (activity == null || Build.VERSION.SDK_INT < 33) return;
        try {
            Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
            Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");

            Object callback = Proxy.newProxyInstance(
                    callbackClass.getClassLoader(),
                    new Class<?>[]{callbackClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            if (method.getDeclaringClass() == Object.class) {
                                if ("hashCode".equals(method.getName())) {
                                    return Integer.valueOf(System.identityHashCode(proxy));
                                }
                                if ("equals".equals(method.getName())) {
                                    Object other = args != null && args.length > 0 ? args[0] : null;
                                    return Boolean.valueOf(proxy == other);
                                }
                                if ("toString".equals(method.getName())) {
                                    return "GboardPredictiveBackCallbackProxy";
                                }
                            }
                            if ("onBackInvoked".equals(method.getName())) {
                                activity.finish();
                            }
                            return null;
                        }
                    }
            );

            Object dispatcher = activity.getClass().getMethod("getOnBackInvokedDispatcher").invoke(activity);
            if (dispatcher != null) {
                dispatcherClass.getMethod("registerOnBackInvokedCallback", int.class, callbackClass)
                        .invoke(dispatcher, 0, callback);
            }
        } catch (Throwable ignored) {
        }
    }'''

# 3. Update transitions
old_transitions = '''    public static void applyActivityEnterTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0x7f01004c;
            int exitAnim = 0x7f01004d;
            try {
                int dynEnter = activity.getResources().getIdentifier("m3_slide_in_right", "anim", activity.getPackageName());
                int dynExit = activity.getResources().getIdentifier("m3_slide_out_left", "anim", activity.getPackageName());
                if (dynEnter != 0) enterAnim = dynEnter;
                if (dynExit != 0) exitAnim = dynExit;
            } catch (Throwable ignored) {
            }
            activity.overridePendingTransition(enterAnim, exitAnim);
        } catch (Throwable ignored) {
        }
    }

    public static void applyActivityExitTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0x7f01004e;
            int exitAnim = 0x7f01004f;
            try {
                int dynEnter = activity.getResources().getIdentifier("m3_slide_in_left", "anim", activity.getPackageName());
                int dynExit = activity.getResources().getIdentifier("m3_slide_out_right", "anim", activity.getPackageName());
                if (dynEnter != 0) enterAnim = dynEnter;
                if (dynExit != 0) exitAnim = dynExit;
            } catch (Throwable ignored) {
            }
            activity.overridePendingTransition(enterAnim, exitAnim);
        } catch (Throwable ignored) {
        }
    }'''

new_transitions = '''    public static void applyActivityEnterTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0;
            int exitAnim = 0;
            try {
                enterAnim = activity.getResources().getIdentifier("m3_slide_in_right", "anim", activity.getPackageName());
                exitAnim = activity.getResources().getIdentifier("m3_slide_out_left", "anim", activity.getPackageName());
            } catch (Throwable ignored) {
            }
            if (enterAnim != 0 && exitAnim != 0) {
                activity.overridePendingTransition(enterAnim, exitAnim);
            } else {
                activity.overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyActivityExitTransition(Activity activity) {
        if (activity == null) return;
        try {
            int enterAnim = 0;
            int exitAnim = 0;
            try {
                enterAnim = activity.getResources().getIdentifier("m3_slide_in_left", "anim", activity.getPackageName());
                exitAnim = activity.getResources().getIdentifier("m3_slide_out_right", "anim", activity.getPackageName());
            } catch (Throwable ignored) {
            }
            if (enterAnim != 0 && exitAnim != 0) {
                activity.overridePendingTransition(enterAnim, exitAnim);
            } else {
                activity.overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
            }
        } catch (Throwable ignored) {
        }
    }'''

code = code.replace(old_theme.replace('\r\n', '\n'), new_theme.replace('\r\n', '\n'))
code = code.replace(old_back.replace('\r\n', '\n'), new_back.replace('\r\n', '\n'))
code = code.replace(old_transitions.replace('\r\n', '\n'), new_transitions.replace('\r\n', '\n'))

with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java', 'w', encoding='utf-8') as f:
    f.write(code)

print("Updated GboardM3Helper.java successfully!")
