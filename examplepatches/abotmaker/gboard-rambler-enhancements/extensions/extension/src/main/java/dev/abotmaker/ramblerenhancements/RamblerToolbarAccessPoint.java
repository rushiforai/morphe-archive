package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Icon;
import android.util.DisplayMetrics;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Registers a native, draggable "Rambler" Access Point inside Gboard's 4-dots toolbar drawer so
 * users can pin it onto Gboard's top suggestion strip and launch Rambler Enhancements in 1 tap.
 *
 * <p>Uses dynamically fingerprinted bindings from {@link RamblerDynamicConfig} (verified on Gboard
 * 18.5.4 and 18.8.0) and stacks safely alongside GboardWu's own Access Point contributions.</p>
 */
public final class RamblerToolbarAccessPoint {
    private static final String TAG = "RamblerEnhancements";
    public static final String TOKEN = "rambler_enhancements";
    public static final String LABEL = "Rambler";

    private static final Map<Object, WeakReference<Context>> CONTROLLERS =
            Collections.synchronizedMap(new WeakHashMap<Object, WeakReference<Context>>());
    private static volatile Handles cachedHandles;
    private static volatile ClassLoader cachedCopyLoader;
    private static volatile Method cachedCopyMethod;

    private RamblerToolbarAccessPoint() {
    }

    static void clearCacheForTesting() {
        cachedHandles = null;
        cachedCopyLoader = null;
        cachedCopyMethod = null;
        CONTROLLERS.clear();
    }

    public static Object includeOrderCatalog(Context context, Object original) {
        try {
            if (context == null || !(original instanceof Collection<?> collection)) {
                return original;
            }
            if (!RamblerEnhancementsSettings.readToolbarButtonEnabled(context)) {
                return original;
            }
            List<String> values = appendToken(collection);
            if (values.size() == collection.size()) {
                return original;
            }
            ClassLoader loader = original.getClass().getClassLoader();
            if (loader == null) {
                loader = context.getClassLoader();
            }
            Method copyMethod = resolveCatalogCopyMethod(loader);
            if (copyMethod == null) {
                return original;
            }
            Object expanded = copyMethod.invoke(null, values);
            return expanded != null ? expanded : original;
        } catch (Throwable err) {
            logWarningSafely("Failed to include Rambler toolbar access point in catalog", err);
            return original;
        }
    }

    public static void afterControllerCreated(Object controller, Context context) {
        if (controller == null || context == null) {
            return;
        }
        try {
            Context appContext = context.getApplicationContext();
            Context safeContext = appContext != null ? appContext : context;
            CONTROLLERS.put(controller, new WeakReference<Context>(safeContext));
            applyToController(controller, safeContext);
        } catch (Throwable err) {
            logWarningSafely("Failed to register Rambler toolbar access point", err);
        }
    }

    public static void refreshRegisteredControllers(Context fallbackContext) {
        List<Map.Entry<Object, WeakReference<Context>>> snapshot;
        synchronized (CONTROLLERS) {
            snapshot = new ArrayList<Map.Entry<Object, WeakReference<Context>>>(
                    CONTROLLERS.entrySet());
        }
        for (Map.Entry<Object, WeakReference<Context>> entry : snapshot) {
            Object controller = entry.getKey();
            Context ctx = entry.getValue() == null ? null : entry.getValue().get();
            if (ctx == null) {
                ctx = fallbackContext;
            }
            if (controller == null || ctx == null) {
                continue;
            }
            try {
                applyToController(controller, ctx);
            } catch (Throwable ignored) {
                // Next keyboard session / controller creation will sync.
            }
        }
    }

    private static void applyToController(Object controller, Context context) throws Throwable {
        ClassLoader loader = controller.getClass().getClassLoader();
        if (loader == null) {
            loader = context.getClassLoader();
        }
        Handles handles = resolveHandles(loader);
        if (handles == null || !handles.controllerClass.isInstance(controller)) {
            return;
        }

        boolean enabled = RamblerEnhancementsSettings.readToolbarButtonEnabled(context);
        Object orderHelper = handles.controllerOrderHelperField.get(controller);
        if (orderHelper != null) {
            syncOrderHelperCatalog(handles, orderHelper, enabled);
        }
        if (!enabled) {
            return;
        }

        Object builder = handles.descriptorBuilderFactory.invoke(null);
        handles.builderTokenMethod.invoke(builder, TOKEN);
        Icon icon = createRamblerToolbarIcon(context);
        if (icon != null) {
            handles.builderIconField.set(builder, icon);
        }
        handles.builderLabelField.set(builder, LABEL);
        handles.builderRunnableMethod.invoke(builder, new OpenRamblerAction(context));
        Object descriptor = handles.builderBuildMethod.invoke(builder);
        handles.controllerRegisterMethod.invoke(controller, descriptor, Boolean.FALSE);
    }

    private static void syncOrderHelperCatalog(
            Handles handles, Object orderHelper, boolean present) throws Throwable {
        Object original = handles.orderHelperCatalogField.get(orderHelper);
        if (!(original instanceof Collection<?> collection)) {
            return;
        }
        boolean currentlyPresent = collection.contains(TOKEN);
        if (currentlyPresent == present) {
            return;
        }
        List<String> updated = present ? appendToken(collection) : removeToken(collection);
        Object replacement = handles.immutableSetCopyMethod.invoke(null, updated);
        if (replacement instanceof Set<?>) {
            handles.orderHelperCatalogField.set(orderHelper, replacement);
        }
    }

    static List<String> appendToken(Collection<?> original) {
        List<String> result = new ArrayList<String>();
        if (original != null) {
            for (Object value : original) {
                if (value instanceof String str && !result.contains(str)) {
                    result.add(str);
                }
            }
        }
        if (!result.contains(TOKEN)) {
            result.add(TOKEN);
        }
        return result;
    }

    static List<String> removeToken(Collection<?> original) {
        List<String> result = new ArrayList<String>();
        if (original != null) {
            for (Object value : original) {
                if (value instanceof String str
                        && !TOKEN.equals(str)
                        && !result.contains(str)) {
                    result.add(str);
                }
            }
        }
        return result;
    }

    /**
     * Draws a crisp 24dp monochrome waveform + Rambler sparkle icon in pure white so Gboard's
     * toolbar ImageView tints it automatically for Light, Dark, and Material You themes.
     */
    static Icon createRamblerToolbarIcon(Context context) {
        try {
            DisplayMetrics dm = context.getResources().getDisplayMetrics();
            float density = dm.density > 0f ? dm.density : 2.0f;
            int sizePx = Math.max(24, Math.round(24f * density));
            Bitmap bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888);
            bitmap.setDensity(dm.densityDpi);

            Canvas canvas = new Canvas(bitmap);
            float scale = sizePx / 24.0f;

            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.FILL);

            // 5 rounded voice-waveform bars balanced nicely inside 24x24dp optical grid
            float barWidth = 2.05f * scale;
            float radius = barWidth * 0.5f;
            float centerY = 13.0f * scale;
            float[] xs = {4.3f, 7.75f, 11.2f, 14.65f, 18.1f};
            float[] heights = {5.2f, 10.6f, 14.6f, 8.6f, 4.8f};
            RectF rect = new RectF();
            for (int i = 0; i < xs.length; i++) {
                float cx = xs[i] * scale;
                float halfH = (heights[i] * 0.5f) * scale;
                rect.set(cx - radius, centerY - halfH, cx + radius, centerY + halfH);
                canvas.drawRoundRect(rect, radius, radius, paint);
            }

            // Crisp 4-point Rambler AI sparkle in top-right corner
            float sx = 18.4f * scale;
            float sy = 5.4f * scale;
            float outerR = 3.3f * scale;
            float innerR = 1.05f * scale;
            Path star = new Path();
            star.moveTo(sx, sy - outerR);
            star.lineTo(sx + innerR, sy - innerR);
            star.lineTo(sx + outerR, sy);
            star.lineTo(sx + innerR, sy + innerR);
            star.lineTo(sx, sy + outerR);
            star.lineTo(sx - innerR, sy + innerR);
            star.lineTo(sx - outerR, sy);
            star.lineTo(sx - innerR, sy - innerR);
            star.close();
            canvas.drawPath(star, paint);

            return Icon.createWithBitmap(bitmap);
        } catch (Throwable err) {
            logWarningSafely("Failed to render Rambler toolbar icon", err);
            return null;
        }
    }

    static Intent buildLaunchIntent(Context context) {
        Intent intent = new Intent(context, RamblerEnhancementsActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        return intent;
    }

    private static final class OpenRamblerAction implements Runnable {
        private final WeakReference<Context> contextRef;

        OpenRamblerAction(Context context) {
            this.contextRef = new WeakReference<Context>(context);
        }

        @Override
        public void run() {
            try {
                Context context = contextRef.get();
                if (context == null) {
                    return;
                }
                context.startActivity(buildLaunchIntent(context));
            } catch (Throwable err) {
                logWarningSafely("Failed to launch Rambler Enhancements from toolbar", err);
            }
        }
    }

    private static Method resolveCatalogCopyMethod(ClassLoader loader) {
        if (loader == null) {
            return null;
        }
        Method current = cachedCopyMethod;
        if (current != null && cachedCopyLoader == loader) {
            return current;
        }
        synchronized (RamblerToolbarAccessPoint.class) {
            current = cachedCopyMethod;
            if (current != null && cachedCopyLoader == loader) {
                return current;
            }
            try {
                Class<?> setClass = Class.forName(
                        RamblerDynamicConfig.AP_IMMUTABLE_SET_CLASS, false, loader);
                Method copy = setClass.getDeclaredMethod(
                        RamblerDynamicConfig.AP_IMMUTABLE_SET_COPY_METHOD, Collection.class);
                if (!Modifier.isStatic(copy.getModifiers()) || copy.getReturnType() != setClass) {
                    return null;
                }
                copy.setAccessible(true);
                cachedCopyLoader = loader;
                cachedCopyMethod = copy;
                return copy;
            } catch (Throwable err) {
                logWarningSafely("Failed to resolve ImmutableSet copy method", err);
                return null;
            }
        }
    }

    private static Handles resolveHandles(ClassLoader loader) {
        if (loader == null) {
            return null;
        }
        Handles current = cachedHandles;
        if (current != null && current.loader == loader) {
            return current;
        }
        synchronized (RamblerToolbarAccessPoint.class) {
            current = cachedHandles;
            if (current != null && current.loader == loader) {
                return current;
            }
            try {
                Handles resolved = Handles.resolve(loader);
                cachedHandles = resolved;
                return resolved;
            } catch (Throwable err) {
                logWarningSafely("Failed to resolve Gboard Access Point handles", err);
                return null;
            }
        }
    }

    private static final class Handles {
        final ClassLoader loader;
        final Class<?> controllerClass;
        final Field controllerOrderHelperField;
        final Field orderHelperCatalogField;
        final Method immutableSetCopyMethod;
        final Method descriptorBuilderFactory;
        final Method builderTokenMethod;
        final Method builderRunnableMethod;
        final Method builderBuildMethod;
        final Field builderIconField;
        final Field builderLabelField;
        final Method controllerRegisterMethod;

        Handles(
                ClassLoader loader,
                Class<?> controllerClass,
                Field controllerOrderHelperField,
                Field orderHelperCatalogField,
                Method immutableSetCopyMethod,
                Method descriptorBuilderFactory,
                Method builderTokenMethod,
                Method builderRunnableMethod,
                Method builderBuildMethod,
                Field builderIconField,
                Field builderLabelField,
                Method controllerRegisterMethod) {
            this.loader = loader;
            this.controllerClass = controllerClass;
            this.controllerOrderHelperField = controllerOrderHelperField;
            this.orderHelperCatalogField = orderHelperCatalogField;
            this.immutableSetCopyMethod = immutableSetCopyMethod;
            this.descriptorBuilderFactory = descriptorBuilderFactory;
            this.builderTokenMethod = builderTokenMethod;
            this.builderRunnableMethod = builderRunnableMethod;
            this.builderBuildMethod = builderBuildMethod;
            this.builderIconField = builderIconField;
            this.builderLabelField = builderLabelField;
            this.controllerRegisterMethod = controllerRegisterMethod;
        }

        static Handles resolve(ClassLoader loader) throws Throwable {
            Class<?> controllerClass = Class.forName(
                    RamblerDynamicConfig.AP_CONTROLLER_CLASS, false, loader);
            Class<?> orderHelperClass = Class.forName(
                    RamblerDynamicConfig.AP_ORDER_HELPER_CLASS, false, loader);
            Class<?> immutableSetClass = Class.forName(
                    RamblerDynamicConfig.AP_IMMUTABLE_SET_CLASS, false, loader);
            Class<?> descriptorClass = Class.forName(
                    RamblerDynamicConfig.AP_DESCRIPTOR_CLASS, false, loader);
            Class<?> builderBaseClass = Class.forName(
                    RamblerDynamicConfig.AP_BUILDER_BASE_CLASS, false, loader);
            Class<?> builderConcreteClass = Class.forName(
                    RamblerDynamicConfig.AP_BUILDER_CONCRETE_CLASS, false, loader);

            Field controllerOrderHelperField = findField(
                    controllerClass, RamblerDynamicConfig.AP_CONTROLLER_ORDER_HELPER_FIELD);
            Field orderHelperCatalogField = findField(
                    orderHelperClass, RamblerDynamicConfig.AP_ORDER_HELPER_CATALOG_FIELD);
            Method immutableSetCopyMethod = immutableSetClass.getDeclaredMethod(
                    RamblerDynamicConfig.AP_IMMUTABLE_SET_COPY_METHOD, Collection.class);
            Method descriptorBuilderFactory = descriptorClass.getDeclaredMethod(
                    RamblerDynamicConfig.AP_DESCRIPTOR_BUILDER_FACTORY_METHOD);
            Method builderTokenMethod = findMethod(
                    builderConcreteClass,
                    builderBaseClass,
                    RamblerDynamicConfig.AP_BUILDER_TOKEN_METHOD,
                    String.class);
            Method builderRunnableMethod = findMethod(
                    builderBaseClass,
                    builderConcreteClass,
                    RamblerDynamicConfig.AP_BUILDER_RUNNABLE_METHOD,
                    Runnable.class);
            Method builderBuildMethod = findMethod(
                    builderBaseClass,
                    builderConcreteClass,
                    RamblerDynamicConfig.AP_BUILDER_BUILD_METHOD);
            Field builderIconField = findField(
                    builderConcreteClass, RamblerDynamicConfig.AP_BUILDER_ICON_FIELD);
            Field builderLabelField = findField(
                    builderConcreteClass, RamblerDynamicConfig.AP_BUILDER_LABEL_FIELD);
            Method controllerRegisterMethod = controllerClass.getDeclaredMethod(
                    RamblerDynamicConfig.AP_CONTROLLER_REGISTER_METHOD,
                    descriptorClass,
                    boolean.class);

            immutableSetCopyMethod.setAccessible(true);
            descriptorBuilderFactory.setAccessible(true);
            controllerRegisterMethod.setAccessible(true);

            return new Handles(
                    loader,
                    controllerClass,
                    controllerOrderHelperField,
                    orderHelperCatalogField,
                    immutableSetCopyMethod,
                    descriptorBuilderFactory,
                    builderTokenMethod,
                    builderRunnableMethod,
                    builderBuildMethod,
                    builderIconField,
                    builderLabelField,
                    controllerRegisterMethod);
        }

        private static Field findField(Class<?> cls, String name) throws NoSuchFieldException {
            Class<?> cursor = cls;
            while (cursor != null && cursor != Object.class) {
                try {
                    Field f = cursor.getDeclaredField(name);
                    f.setAccessible(true);
                    return f;
                } catch (NoSuchFieldException ignored) {
                    cursor = cursor.getSuperclass();
                }
            }
            throw new NoSuchFieldException(cls.getName() + "." + name);
        }

        private static Method findMethod(
                Class<?> primary, Class<?> secondary, String name, Class<?>... params)
                throws NoSuchMethodException {
            for (Class<?> owner : new Class<?>[]{primary, secondary}) {
                Class<?> cursor = owner;
                while (cursor != null && cursor != Object.class) {
                    try {
                        Method m = cursor.getDeclaredMethod(name, params);
                        if (!Modifier.isAbstract(m.getModifiers())) {
                            m.setAccessible(true);
                            return m;
                        }
                    } catch (NoSuchMethodException ignored) {
                        // Walk superclass.
                    }
                    cursor = cursor.getSuperclass();
                }
            }
            throw new NoSuchMethodException(primary.getName() + "." + name);
        }
    }

    private static void logWarningSafely(String message, Throwable err) {
        try {
            Log.w(TAG, message, err);
        } catch (Throwable ignored) {
            // Never propagate logging failures on Gboard's hot toolbar path.
        }
    }
}
