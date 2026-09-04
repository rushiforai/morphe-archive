package com.autocat.morphe.smartlauncher.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Injects Morphe Actions into Smart Launcher's contextual long-press popup menus and settings.
 */
public final class MorpheMenuInjector {

    private static final String TAG = "MorpheMenuInjector";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private static volatile String sLastPackageName = null;
    private static volatile Context sLastContext = null;
    private static Method sPopupShowMethod = null;

    private MorpheMenuInjector() {}

    /**
     * Drop-in replacement for the original rj.d(List)V call in the popup coroutine method.
     *
     * The patch uses replaceInstruction (not addInstruction) so the method's bytecode size
     * stays identical and no jump offsets are shifted. This prevents the ART class-verification
     * failure that caused an instant crash at startup when addInstruction was used.
     *
     * After injecting the archive item, this method calls the original show method via reflection.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void injectAndShow(Object popupLayerObj, List items, Object callerObj) {
        // Always work with a mutable copy. Smart Launcher passes Kotlin's immutable listOf()
        // which throws UnsupportedOperationException on add(), silently swallowed otherwise.
        List mutableItems = items != null ? new ArrayList(items) : new ArrayList();

        injectArchiveItem(popupLayerObj, mutableItems, callerObj);

        if (popupLayerObj == null) return;
        try {
            if (sPopupShowMethod == null) {
                Class<?> clazz = popupLayerObj.getClass();
                while (clazz != null && clazz != Object.class) {
                    for (Method m : clazz.getDeclaredMethods()) {
                        Class<?>[] params = m.getParameterTypes();
                        if (params.length == 1
                                && List.class.isAssignableFrom(params[0])
                                && m.getReturnType() == void.class) {
                            if ("d".equals(m.getName()) || m.getName().length() <= 2) {
                                m.setAccessible(true);
                                sPopupShowMethod = m;
                                break;
                            }
                        }
                    }
                    if (sPopupShowMethod != null) break;
                    clazz = clazz.getSuperclass();
                }
            }
            if (sPopupShowMethod != null) {
                sPopupShowMethod.invoke(popupLayerObj, mutableItems);
            } else {
                Log.w(TAG, "injectAndShow: could not locate popup show method");
            }
        } catch (Throwable t) {
            Log.w(TAG, "injectAndShow: reflection call failed: " + t.getMessage());
        }
    }

    /**
     * Injects a dedicated "Archive App" or "Restore App" item into Smart Launcher's contextual popup menu list.
     */
    @SuppressWarnings("rawtypes")
    public static void injectArchiveItem(Object popupLayerObj, List items, Object callerObj) {
        if (items == null) {
            return;
        }

        try {
            // 1. Resolve Context
            Context context = null;
            if (popupLayerObj != null) {
                context = resolveContext(popupLayerObj);
            }
            if (context == null && callerObj != null) {
                context = resolveContext(callerObj);
            }
            if (context == null) {
                context = sLastContext;
            }
            if (context == null) {
                context = getForegroundActivity();
            }
            if (context == null) {
                try {
                    Class<?> atClass = Class.forName("android.app.ActivityThread");
                    Method currentAppMethod = atClass.getMethod("currentApplication");
                    context = (Context) currentAppMethod.invoke(null);
                } catch (Throwable ignored) {}
            }
            if (context != null) {
                sLastContext = context;
            }

            final Context finalContext = (context != null) ? context : sLastContext;

            // 2. Extract target packageName from all available structures (items closures, popup, caller)
            String packageName = extractPackageNameFromAll(popupLayerObj, items, callerObj, finalContext);
            if (packageName != null) {
                sLastPackageName = packageName;
            } else {
                packageName = sLastPackageName;
            }

            final String finalPackageName = packageName;

            // 3. Find sample item to clone reflection structures
            Object sampleItem = null;
            for (Object obj : items) {
                if (obj != null) {
                    sampleItem = obj;
                    break;
                }
            }

            if (sampleItem == null) {
                return;
            }

            Class<?> itemClass = sampleItem.getClass();
            Field stringField = null;
            Field actionField = null;

            // Scan the full class hierarchy, not just itemClass.getDeclaredFields().
            // Action fields declared on a superclass would be silently missed otherwise.
            Class<?> scanClass = itemClass;
            while (scanClass != null && scanClass != Object.class) {
                for (Field f : scanClass.getDeclaredFields()) {
                    f.setAccessible(true);
                    if (stringField == null && CharSequence.class.isAssignableFrom(f.getType())) {
                        stringField = f;
                    } else if (actionField == null
                            && (f.getName().equals("f")
                                || f.getType().getName().contains("b34")
                                || f.getType().getName().contains("Function")
                                || (f.getType().isInterface()
                                    && !Collection.class.isAssignableFrom(f.getType())
                                    && !Map.class.isAssignableFrom(f.getType())))) {
                        actionField = f;
                    }
                }
                if (stringField != null && actionField != null) break;
                scanClass = scanClass.getSuperclass();
            }

            // Determine if target app is currently archived
            boolean isArchived = false;
            if (finalContext != null && finalPackageName != null) {
                ApplicationInfo appInfo = getAppInfoSafe(finalContext.getPackageManager(), finalPackageName);
                if (appInfo != null) isArchived = ArchivedAppFilter.isAppArchived(appInfo);
            }

            final boolean targetIsArchived = isArchived;
            final String actionTitle = (finalPackageName != null)
                    ? (targetIsArchived ? "Restore App" : "Archive App")
                    : "Archive / Restore App";

            // 4. Resolve the Kotlin / SAM functional interface
            List<Class<?>> interfaceList = new ArrayList<>();
            if (actionField != null) {
                Class<?> fieldType = actionField.getType();
                if (fieldType.isInterface()) {
                    interfaceList.add(fieldType);
                }
                try {
                    Object existingAction = actionField.get(sampleItem);
                    if (existingAction != null) {
                        for (Class<?> iface : existingAction.getClass().getInterfaces()) {
                            if (!interfaceList.contains(iface)) {
                                interfaceList.add(iface);
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            }

            if (interfaceList.isEmpty()) {
                try {
                    Class<?> candidate = Class.forName("b34");
                    if (candidate.isInterface()) interfaceList.add(candidate);
                } catch (ClassNotFoundException ignored) {}
            }

            // Broader fallback: walk the full class hierarchy and accept any interface-typed
            // field that isn't a standard collection/map. This survives obfuscated name changes
            // (e.g., "b34" becomes "c12" in the next build) without requiring a code update.
            if (interfaceList.isEmpty()) {
                Class<?> cls = itemClass;
                outerScan:
                while (cls != null && cls != Object.class) {
                    for (Field f : cls.getDeclaredFields()) {
                        try {
                            f.setAccessible(true);
                            Class<?> ft = f.getType();
                            if (ft.isInterface()
                                    && !CharSequence.class.isAssignableFrom(ft)
                                    && !Collection.class.isAssignableFrom(ft)
                                    && !Map.class.isAssignableFrom(ft)) {
                                if (!interfaceList.contains(ft)) interfaceList.add(ft);
                                try {
                                    Object val = f.get(sampleItem);
                                    if (val != null) {
                                        for (Class<?> iface : val.getClass().getInterfaces()) {
                                            if (!interfaceList.contains(iface)) interfaceList.add(iface);
                                        }
                                    }
                                } catch (Throwable ignored) {}
                                if (actionField == null) actionField = f;
                                break outerScan;
                            }
                        } catch (Throwable ignored) {}
                    }
                    cls = cls.getSuperclass();
                }
            }

            if (interfaceList.isEmpty()) {
                Log.w(TAG, "injectArchiveItem: could not resolve functional interface; skipping inject");
                return;
            }

            final Class<?>[] interfacesArray = interfaceList.toArray(new Class<?>[0]);
            Object clickProxy = Proxy.newProxyInstance(
                    itemClass.getClassLoader(),
                    interfacesArray,
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            String mName = method.getName();
                            if ("toString".equals(mName)) return "MorpheAction";
                            if ("hashCode".equals(mName)) return System.identityHashCode(proxy);
                            if ("equals".equals(mName)) return proxy == (args != null && args.length > 0 ? args[0] : null);

                            Context execCtx = (finalContext != null) ? finalContext : getForegroundActivity();
                            if (finalPackageName != null) {
                                performArchiveOrRestoreAsync(execCtx, finalPackageName, targetIsArchived);
                            } else if (execCtx != null) {
                                MorpheSettingsDialog.show(execCtx);
                            }
                            return null;
                        }
                    }
            );

            // 5. Instantiate new popup item via constructor reflection
            Object archiveItem = null;
            for (Constructor<?> ctor : itemClass.getDeclaredConstructors()) {
                ctor.setAccessible(true);
                try {
                    Class<?>[] paramTypes = ctor.getParameterTypes();
                    Object[] initArgs = new Object[paramTypes.length];
                    for (int i = 0; i < paramTypes.length; i++) {
                        Class<?> pt = paramTypes[i];
                        if (pt == int.class) initArgs[i] = 0;
                        else if (pt == boolean.class) initArgs[i] = false;
                        else if (pt == long.class) initArgs[i] = 0L;
                        else if (pt == float.class) initArgs[i] = 0f;
                        else if (pt == double.class) initArgs[i] = 0d;
                        else if (pt == byte.class) initArgs[i] = (byte) 0;
                        else if (pt == short.class) initArgs[i] = (short) 0;
                        else if (pt == char.class) initArgs[i] = '\0';
                        else if (CharSequence.class.isAssignableFrom(pt)) initArgs[i] = actionTitle;
                        else if (isAssignableToAny(pt, interfacesArray)) initArgs[i] = clickProxy;
                        else initArgs[i] = null;
                    }
                    archiveItem = ctor.newInstance(initArgs);
                    if (archiveItem != null) break;
                } catch (Throwable ignored) {}
            }

            if (archiveItem != null) {
                // Copy default styling attributes from sampleItem
                for (Field f : itemClass.getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        if (CharSequence.class.isAssignableFrom(f.getType())) {
                            f.set(archiveItem, actionTitle);
                        } else if (isAssignableToAny(f.getType(), interfacesArray)) {
                            f.set(archiveItem, clickProxy);
                        } else {
                            Object sampleVal = f.get(sampleItem);
                            if (sampleVal != null) {
                                f.set(archiveItem, sampleVal);
                            }
                        }
                    } catch (Throwable ignored) {}
                }

                items.add(archiveItem);
                Log.i(TAG, "Successfully injected [" + actionTitle + "] into hold menu (package: " + finalPackageName + ")");
            }
        } catch (Throwable t) {
            Log.w(TAG, "Safe popup item injection catch: " + t.getMessage());
        }
    }

    /**
     * Extracts the target application package name by comprehensively searching items, closures, and controllers.
     */
    public static String extractPackageNameFromAll(Object popupLayerObj, List<?> items, Object callerObj, Context context) {
        String pkg = null;

        // 1. Inspect all items in popup list (most direct source of closures)
        if (items != null) {
            for (Object item : items) {
                if (item != null) {
                    pkg = extractPackageName(item, 0);
                    if (pkg != null && isInstalledPackage(context, pkg)) {
                        return pkg;
                    }
                }
            }
        }

        // 2. Inspect popupLayerObj (controller containing target view)
        if (popupLayerObj != null) {
            pkg = extractPackageName(popupLayerObj, 0);
            if (pkg != null && isInstalledPackage(context, pkg)) {
                return pkg;
            }
        }

        // 3. Inspect callerObj
        if (callerObj != null) {
            pkg = extractPackageName(callerObj, 0);
            if (pkg != null && isInstalledPackage(context, pkg)) {
                return pkg;
            }
        }

        if (pkg != null) return pkg;
        return sLastPackageName;
    }

    // On API 35+, archived packages are excluded from getApplicationInfo(pkg, 0).
    // MATCH_ARCHIVED_PACKAGES (0x8000) must be passed to see them.
    private static final int PM_FLAGS = Build.VERSION.SDK_INT >= 35 ? 0x00008000 : 0;

    static ApplicationInfo getAppInfoSafe(PackageManager pm, String pkg) {
        try {
            return pm.getApplicationInfo(pkg, PM_FLAGS);
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean isInstalledPackage(Context context, String pkg) {
        if (pkg == null || pkg.isEmpty() || !pkg.contains(".")) return false;
        if ("android".equals(pkg) || "ginlemon.flowerfree".equals(pkg)) return false;
        if (context != null) {
            return getAppInfoSafe(context.getPackageManager(), pkg) != null;
        }
        return true;
    }

    private static String extractPackageName(Object obj, int depth) {
        if (obj == null || depth > 4) return null;

        if (obj instanceof ComponentName) {
            return ((ComponentName) obj).getPackageName();
        }
        if (obj instanceof Intent) {
            Intent it = (Intent) obj;
            if (it.getComponent() != null) return it.getComponent().getPackageName();
            if (it.getPackage() != null) return it.getPackage();
            if (it.getData() != null) {
                String pkg = extractPackageFromUri(it.getData());
                if (pkg != null) return pkg;
            }
        }
        if (obj instanceof Uri) {
            String pkg = extractPackageFromUri((Uri) obj);
            if (pkg != null) return pkg;
        }
        if (obj instanceof LauncherActivityInfo) {
            return ((LauncherActivityInfo) obj).getApplicationInfo().packageName;
        }
        if (obj instanceof ApplicationInfo) {
            return ((ApplicationInfo) obj).packageName;
        }
        if (obj instanceof PackageInfo) {
            return ((PackageInfo) obj).packageName;
        }
        if (obj instanceof String) {
            String s = (String) obj;
            if (s.startsWith("package:")) return s.substring(8);
            if (s.contains(".") && !s.contains(" ") && !s.contains("/") && !s.contains(":") && s.length() >= 3 && s.length() <= 100) {
                return s;
            }
        }
        if (obj instanceof Collection) {
            for (Object elem : (Collection<?>) obj) {
                String pkg = extractPackageName(elem, depth + 1);
                if (pkg != null) return pkg;
            }
        }
        if (obj instanceof Object[]) {
            for (Object elem : (Object[]) obj) {
                String pkg = extractPackageName(elem, depth + 1);
                if (pkg != null) return pkg;
            }
        }

        // Recursively inspect declared fields on the object
        try {
            Class<?> clazz = obj.getClass();
            while (clazz != null && clazz != Object.class && !clazz.getName().startsWith("java.lang.")) {
                for (Field f : clazz.getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val != null && val != obj) {
                            String pkg = extractPackageName(val, depth + 1);
                            if (pkg != null) return pkg;
                        }
                    } catch (Throwable ignored) {}
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable ignored) {}

        return null;
    }

    private static String extractPackageFromUri(Uri uri) {
        if (uri == null) return null;
        String scheme = uri.getScheme();
        if ("package".equalsIgnoreCase(scheme)) {
            return uri.getSchemeSpecificPart();
        }
        if (uri.isHierarchical()) {
            String id = uri.getQueryParameter("id");
            if (id != null && id.contains(".")) return id;
        }
        String str = uri.toString();
        if (str.startsWith("package:")) {
            return str.substring(8);
        }
        return null;
    }

    private static boolean isAssignableToAny(Class<?> target, Class<?>[] candidates) {
        if (target == null || candidates == null) return false;
        for (Class<?> c : candidates) {
            if (target.isAssignableFrom(c) || c.isAssignableFrom(target)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Executes archive or restore asynchronously on a background worker thread.
     */
    public static void performArchiveOrRestoreAsync(final Context context, final String packageName, final boolean isCurrentlyArchived) {
        if (context == null || packageName == null || packageName.isEmpty()) {
            return;
        }

        PackageManager pm = context.getPackageManager();
        String appLabel = packageName;
        ApplicationInfo ai = getAppInfoSafe(pm, packageName);
        if (ai != null) {
            CharSequence label = ai.loadLabel(pm);
            if (label != null) appLabel = label.toString();
        }

        final String finalLabel = appLabel;
        final String startingToast = (isCurrentlyArchived ? "Restoring " : "Archiving ") + finalLabel + "…";
        postToast(context, startingToast);

        EXECUTOR.execute(new Runnable() {
            @Override
            public void run() {
                boolean success = false;
                boolean shizukuEnabled = MorphePreferences.isShizukuEnabled(context);
                boolean nativeEnabled = MorphePreferences.isNativeEnabled(context);

                // 1. Try Shizuku privileged archiving if enabled
                if (shizukuEnabled && ShizukuArchiveHelper.isShizukuAlive()) {
                    if (ShizukuArchiveHelper.hasPermission()) {
                        success = isCurrentlyArchived
                                ? ShizukuArchiveHelper.unarchivePackage(packageName)
                                : ShizukuArchiveHelper.archivePackage(packageName);
                    } else {
                        postToast(context, "Shizuku permission needed — grant it then try again");
                        MAIN_HANDLER.post(new Runnable() {
                            @Override
                            public void run() {
                                ShizukuArchiveHelper.requestShizukuPermission(ShizukuArchiveHelper.SHIZUKU_REQ_CODE);
                            }
                        });
                        return;
                    }
                }

                // 2. Try Native Android 15+ archiving if Shizuku didn't succeed
                if (!success && nativeEnabled && NativeArchiveHelper.isSupported()) {
                    success = isCurrentlyArchived
                            ? NativeArchiveHelper.unarchivePackage(context, packageName)
                            : NativeArchiveHelper.archivePackage(context, packageName);
                }

                // Only toast on failure — the pre-toast and drawer refresh confirm success
                if (!success) {
                    if (!NativeArchiveHelper.isSupported() && !ShizukuArchiveHelper.isShizukuAlive()) {
                        postToast(context, "App archiving requires Shizuku or Android 15+");
                    } else {
                        postToast(context, "Failed to " + (isCurrentlyArchived ? "restore " : "archive ") + finalLabel);
                    }
                }
            }
        });
    }

    /**
     * Intercepts the Uninstall action triggered from the long-press popup menu.
     */
    public static void handleUninstallOrArchive(final Context context, final Intent uninstallIntent) {
        if (context == null || uninstallIntent == null) {
            return;
        }

        try {
            Uri data = uninstallIntent.getData();
            final String packageName = (data != null) ? data.getSchemeSpecificPart() : null;

            if (packageName == null || packageName.isEmpty()) {
                context.startActivity(uninstallIntent);
                return;
            }

            PackageManager pm = context.getPackageManager();
            ApplicationInfo appInfo = getAppInfoSafe(pm, packageName);
            if (appInfo == null) {
                context.startActivity(uninstallIntent);
                return;
            }
            CharSequence label = appInfo.loadLabel(pm);
            final String appName = label != null ? label.toString() : packageName;
            final boolean isArchived = ArchivedAppFilter.isAppArchived(appInfo);

            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.setTitle("📦 " + appName);

            if (isArchived) {
                builder.setMessage(appName + " is archived. Restore it to use it again, or delete it permanently.");
                builder.setPositiveButton("Restore App", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        performArchiveOrRestoreAsync(context, packageName, true);
                    }
                });
                builder.setNeutralButton("Delete App", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        context.startActivity(uninstallIntent);
                    }
                });
            } else {
                builder.setMessage("Archive " + appName + " to free up space while keeping your data, or uninstall it completely.");
                builder.setPositiveButton("Archive App", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        performArchiveOrRestoreAsync(context, packageName, false);
                    }
                });
                builder.setNeutralButton("Uninstall", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        context.startActivity(uninstallIntent);
                    }
                });
            }

            builder.setNegativeButton("Cancel", null);
            builder.show();
        } catch (Throwable t) {
            try {
                context.startActivity(uninstallIntent);
            } catch (Throwable ignored) {}
        }
    }

    private static void postToast(final Context context, final String message) {
        if (context == null || message == null) return;
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {}
            }
        });
    }

    /**
     * Resolves an Activity or Context dynamically from an arbitrary object.
     */
    public static Context resolveContext(Object obj) {
        if (obj == null) return null;
        if (obj instanceof Activity) {
            return (Activity) obj;
        }
        if (obj instanceof View) {
            Context ctx = ((View) obj).getContext();
            Activity act = findActivity(ctx);
            return (act != null) ? act : ctx;
        }
        if (obj instanceof Context) {
            Activity act = findActivity((Context) obj);
            return (act != null) ? act : (Context) obj;
        }
        // Inspect fields on object (listener, closure, lambda, etc.)
        try {
            Class<?> clazz = obj.getClass();
            while (clazz != null && clazz != Object.class) {
                for (Field f : clazz.getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val instanceof Activity) {
                            return (Activity) val;
                        } else if (val instanceof Context) {
                            Activity act = findActivity((Context) val);
                            return (act != null) ? act : (Context) val;
                        } else if (val instanceof View) {
                            Context ctx = ((View) val).getContext();
                            Activity act = findActivity(ctx);
                            return (act != null) ? act : ctx;
                        }
                    } catch (Throwable ignored) {}
                }
                clazz = clazz.getSuperclass();
            }
        } catch (Throwable ignored) {}
        return null;
    }

    public static Activity findActivity(Context ctx) {
        Context current = ctx;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            current = ((ContextWrapper) current).getBaseContext();
        }
        return null;
    }

    public static Activity getForegroundActivity() {
        try {
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Method currentAtMethod = atClass.getMethod("currentActivityThread");
            Object at = currentAtMethod.invoke(null);
            if (at != null) {
                Field activitiesField = atClass.getDeclaredField("mActivities");
                activitiesField.setAccessible(true);
                Object activities = activitiesField.get(at);
                if (activities instanceof Map) {
                    for (Object record : ((Map<?, ?>) activities).values()) {
                        Field activityField = record.getClass().getDeclaredField("activity");
                        activityField.setAccessible(true);
                        Activity act = (Activity) activityField.get(record);
                        if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                            Field pausedField = record.getClass().getDeclaredField("paused");
                            pausedField.setAccessible(true);
                            boolean paused = pausedField.getBoolean(record);
                            if (!paused) {
                                return act;
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    /**
     * Entry point for Morphe settings called by patched Dev options / Experimental features.
     */
    public static void openMorpheSettings(Object obj1, Object obj2) {
        Context ctx = resolveContext(obj1);
        if (ctx == null) {
            ctx = resolveContext(obj2);
        }
        openMorpheSettings(ctx);
    }

    public static void openMorpheSettings(Object obj) {
        Context ctx = resolveContext(obj);
        openMorpheSettings(ctx);
    }

    public static void openMorpheSettings(Context context) {
        if (context == null) {
            context = getForegroundActivity();
        }
        if (context == null) {
            try {
                Class<?> atClass = Class.forName("android.app.ActivityThread");
                Method currentAppMethod = atClass.getMethod("currentApplication");
                context = (Context) currentAppMethod.invoke(null);
            } catch (Throwable ignored) {}
        }
        if (context != null) {
            MorpheSettingsDialog.show(context);
        }
    }

    public static void openMorpheSettings() {
        openMorpheSettings((Context) null);
    }
}
