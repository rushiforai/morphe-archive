package app.patchlab.extension.rtl;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayDeque;

import kotlin.jvm.internal.Lambda;
import z.gk;

/** Runtime bridge used by the ZenSMS RTL bytecode patch. */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class RtlSmsLayout {
    private static final String TAG = "PatchLabRTL";
    private static final String PREFS_NAME = "patchlab_rtl_sms_layout";
    private static final String CONVERSATION_LIST_KEY = "rtl_conversation_list";

    private static final ToggleCallback CONVERSATION_LIST_CALLBACK =
            new ToggleCallback(CONVERSATION_LIST_KEY);

    private static final ThreadLocal<ArrayDeque<Boolean>> PROVIDER_STACK =
            new ThreadLocal<ArrayDeque<Boolean>>() {
                @Override
                protected ArrayDeque<Boolean> initialValue() {
                    return new ArrayDeque<>();
                }
            };

    private static volatile Context appContext;
    private static volatile Context uiContext;
    private static volatile Object settingsRecomposeScope;
    private static volatile boolean composeReflectionReady;

    private static Method composerConsume;
    private static Method composerStartProvider;
    private static Method composerEndProvider;
    private static Method composerGetRecomposeScope;
    private static Method recomposeScopeInvalidate;
    private static Method compositionLocalProvides;
    private static Object localContext;
    private static Object localLayoutDirection;
    private static Object rtlLayoutDirection;
    private static Object ltrLayoutDirection;
    private static Object rightTextAlign;

    private static volatile boolean settingsReflectionReady;
    private static Method settingsSwitch;
    private static Object rtlIcon;

    private RtlSmsLayout() {
    }

    /** Adds the conversation-list switch at the end of ZenSMS' Appearance section. */
    public static void renderSettings(Object composer) {
        try {
            ensureComposeReflection();
            captureContext(composer);
            settingsRecomposeScope = composerGetRecomposeScope.invoke(composer);
            ensureSettingsReflection();

            renderSwitch(
                    composer,
                    "RTL conversation list",
                    "Mirror rows while keeping names and numbers left to right",
                    isEnabled(CONVERSATION_LIST_KEY),
                    CONVERSATION_LIST_CALLBACK
            );
        } catch (Throwable error) {
            // A failed reflective composable call can leave Composer state open;
            // continuing would be less safe than failing this exact version hook.
            throw new IllegalStateException("Unable to render RTL settings", error);
        }
    }

    /** Opens a balanced LocalLayoutDirection provider for a conversation row. */
    public static void beginConversationList(Object composer) {
        beginDirectionProvider(composer, true);
    }

    /** Gives only the conversation title an LTR paragraph fallback. */
    public static void beginConversationLabel(Object composer) {
        beginDirectionProvider(composer, false);
    }

    /** Uses physical right alignment only while the conversation-list switch is on. */
    public static Object conversationLabelTextAlign() {
        return isEnabled(CONVERSATION_LIST_KEY) ? rightTextAlign : null;
    }

    /** Makes Text honor the explicit alignment only while the switch is on. */
    public static int conversationLabelDefaultMask(int originalMask) {
        return isEnabled(CONVERSATION_LIST_KEY) && rightTextAlign != null
                ? originalMask & ~0x200
                : originalMask;
    }

    /** Closes the provider opened by either begin method. */
    public static void endDirectionProvider(Object composer) {
        ArrayDeque<Boolean> stack = PROVIDER_STACK.get();
        Boolean started = stack.pollFirst();
        if (!Boolean.TRUE.equals(started)) {
            return;
        }

        try {
            composerEndProvider.invoke(composer);
        } catch (Throwable error) {
            Log.e(TAG, "Unable to close RTL layout provider", error);
        }
    }

    private static void beginDirectionProvider(Object composer, boolean useRtlWhenEnabled) {
        boolean started = false;
        try {
            ensureComposeReflection();
            captureContext(composer);

            Object inheritedDirection = composerConsume.invoke(composer, localLayoutDirection);
            Object effectiveDirection = isEnabled(CONVERSATION_LIST_KEY)
                    ? (useRtlWhenEnabled ? rtlLayoutDirection : ltrLayoutDirection)
                    : inheritedDirection;
            Object providedValue = compositionLocalProvides.invoke(
                    localLayoutDirection,
                    effectiveDirection
            );
            composerStartProvider.invoke(composer, providedValue);
            started = true;
        } catch (Throwable error) {
            Log.e(TAG, "Unable to open RTL layout provider", error);
        } finally {
            PROVIDER_STACK.get().addFirst(started);
        }
    }

    private static void renderSwitch(
            Object composer,
            String title,
            String description,
            boolean checked,
            ToggleCallback callback
    ) throws Exception {
        // 0x20 selects the helper's default null trailing content. 0x30 is the
        // same changed-mask used by ZenSMS' own SettingsSwitch call sites.
        settingsSwitch.invoke(
                null,
                rtlIcon,
                title,
                description,
                checked,
                callback,
                null,
                composer,
                0x30,
                0x20
        );
    }

    private static synchronized void ensureComposeReflection() throws Exception {
        if (composeReflectionReady) {
            return;
        }

        ClassLoader loader = RtlSmsLayout.class.getClassLoader();
        Class<?> composerClass = Class.forName("androidx.compose.runtime.Composer", true, loader);
        Class<?> compositionLocalClass =
                Class.forName("androidx.compose.runtime.CompositionLocal", true, loader);
        Class<?> providedValueClass =
                Class.forName("androidx.compose.runtime.ProvidedValue", true, loader);
        Class<?> providableCompositionLocalClass =
                Class.forName("androidx.compose.runtime.ProvidableCompositionLocal", true, loader);
        Class<?> recomposeScopeClass =
                Class.forName("androidx.compose.runtime.RecomposeScope", true, loader);

        composerConsume = composerClass.getMethod("consume", compositionLocalClass);
        composerStartProvider = composerClass.getMethod("startProvider", providedValueClass);
        composerEndProvider = composerClass.getMethod("endProvider");
        composerGetRecomposeScope = composerClass.getMethod("getRecomposeScope");
        recomposeScopeInvalidate = recomposeScopeClass.getMethod("invalidate");
        compositionLocalProvides =
                providableCompositionLocalClass.getMethod("provides", Object.class);

        Class<?> androidLocals = Class.forName(
                "androidx.compose.ui.platform.AndroidCompositionLocals_androidKt",
                true,
                loader
        );
        localContext = androidLocals.getMethod("getLocalContext").invoke(null);

        Class<?> uiLocals = Class.forName(
                "androidx.compose.ui.platform.CompositionLocalsKt",
                true,
                loader
        );
        localLayoutDirection = uiLocals.getMethod("getLocalLayoutDirection").invoke(null);

        Class<? extends Enum> layoutDirection = (Class<? extends Enum>) Class.forName(
                "androidx.compose.ui.unit.LayoutDirection",
                true,
                loader
        );
        rtlLayoutDirection = Enum.valueOf(layoutDirection, "Rtl");
        ltrLayoutDirection = Enum.valueOf(layoutDirection, "Ltr");

        Class<?> textAlignClass = Class.forName(
                "androidx.compose.ui.text.style.TextAlign",
                true,
                loader
        );
        Object textAlignCompanion = textAlignClass.getField("Companion").get(null);
        int right = (Integer) textAlignCompanion.getClass()
                .getMethod("getRight-e0LSkKk")
                .invoke(textAlignCompanion);
        rightTextAlign = textAlignClass.getMethod("box-impl", int.class)
                .invoke(null, right);
        composeReflectionReady = true;
    }

    private static synchronized void ensureSettingsReflection() throws Exception {
        if (settingsReflectionReady) {
            return;
        }

        ClassLoader loader = RtlSmsLayout.class.getClassLoader();
        Class<?> iconsClass = Class.forName("androidx.compose.material.icons.Icons", true, loader);
        Object icons = iconsClass.getField("INSTANCE").get(null);
        Object filled = iconsClass.getMethod("getDefault").invoke(icons);
        Class<?> filledClass = Class.forName(
                "androidx.compose.material.icons.Icons$Filled",
                true,
                loader
        );
        Class<?> rtlIconClass = Class.forName(
                "androidx.compose.material.icons.filled.FormatTextdirectionRToLKt",
                true,
                loader
        );
        rtlIcon = rtlIconClass.getMethod("getFormatTextdirectionRToL", filledClass)
                .invoke(null, filled);

        Class<?> settingsClass = Class.forName("com.zensms.app.ui.settings.p", true, loader);
        Class<?> imageVectorClass =
                Class.forName("androidx.compose.ui.graphics.vector.ImageVector", true, loader);
        Class<?> function1Class = Class.forName("z.gk", true, loader);
        Class<?> function2Class = Class.forName("z.kk", true, loader);
        Class<?> composerClass = Class.forName("androidx.compose.runtime.Composer", true, loader);
        settingsSwitch = settingsClass.getDeclaredMethod(
                "o",
                imageVectorClass,
                String.class,
                String.class,
                boolean.class,
                function1Class,
                function2Class,
                composerClass,
                int.class,
                int.class
        );
        settingsSwitch.setAccessible(true);
        settingsReflectionReady = true;
    }

    private static void captureContext(Object composer) throws Exception {
        Object context = composerConsume.invoke(composer, localContext);
        if (context instanceof Context) {
            uiContext = (Context) context;
            Context application = ((Context) context).getApplicationContext();
            appContext = application != null ? application : (Context) context;
        }
    }

    private static boolean isEnabled(String key) {
        SharedPreferences preferences = preferences();
        return preferences != null && preferences.getBoolean(key, false);
    }

    private static void setEnabled(String key, boolean enabled) {
        SharedPreferences preferences = preferences();
        if (preferences == null) {
            return;
        }
        preferences.edit().putBoolean(key, enabled).apply();
        invalidateSettings();
    }

    private static SharedPreferences preferences() {
        Context context = appContext;
        return context == null ? null : context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static void invalidateSettings() {
        Object scope = settingsRecomposeScope;
        if (scope != null) {
            try {
                recomposeScopeInvalidate.invoke(scope);
                return;
            } catch (Throwable error) {
                Log.w(TAG, "Unable to invalidate settings composition", error);
            }
        }

        Activity activity = findActivity(uiContext);
        if (activity != null) {
            activity.getWindow().getDecorView().post(activity::recreate);
        }
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            Context next = ((ContextWrapper) current).getBaseContext();
            if (next == current) {
                break;
            }
            current = next;
        }
        return null;
    }

    /** Must extend Kotlin Lambda because ZenSMS specializes its callback field to Lambda. */
    public static final class ToggleCallback extends Lambda<Object> implements gk {
        private final String preferenceKey;

        ToggleCallback(String preferenceKey) {
            super(1);
            this.preferenceKey = preferenceKey;
        }

        @Override
        public Object invoke(Object value) {
            if (value instanceof Boolean) {
                setEnabled(preferenceKey, (Boolean) value);
            }
            return null;
        }
    }
}
