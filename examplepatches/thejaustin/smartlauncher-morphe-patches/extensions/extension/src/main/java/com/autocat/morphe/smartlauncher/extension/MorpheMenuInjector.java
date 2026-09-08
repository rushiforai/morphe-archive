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
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
    public static final int ID_SECTION_HEADER   = 0x7f13bee0;
    public static final int ID_HIDE_ARCHIVED    = 0x7f13bee1;
    public static final int ID_HIDE_SUMMARY     = 0x7f13bee2;
    public static final int ID_NATIVE_ARCHIVE   = 0x7f13bee3;
    public static final int ID_NATIVE_SUMMARY   = 0x7f13bee4;
    public static final int ID_SHIZUKU_ARCHIVE  = 0x7f13bee5;
    public static final int ID_SHIZUKU_SUMMARY  = 0x7f13bee6;
    public static final int ID_ACTION_ARCHIVE   = 0x7f13bee7;
    public static final int ID_ACTION_RESTORE   = 0x7f13bee8;
    public static final int ID_DIAG_ACTION      = 0x7f13bee9;
    public static final int ID_DIAG_SUMMARY     = 0x7f13beea;
    public static final int DRAWABLE_ARCHIVE    = 0x7f0801b3; // ic_cloud_download
    public static final int DRAWABLE_RESTORE    = 0x7f080292; // ic_restore

    public static Context getLastContext() {
        return sLastContext;
    }

    /**
     * Intercepts Android string resource resolution from Jetpack Compose stringResource calls.
     */
    public static String getString(Resources resources, int id) {
        switch (id) {
            case ID_SECTION_HEADER:
                return "App Archiving (Morphe)";
            case ID_HIDE_ARCHIVED: {
                boolean hide = MorphePreferences.isHideArchivedEnabled(sLastContext);
                return "Hide Archived Apps: " + (hide ? "ON" : "OFF");
            }
            case ID_HIDE_SUMMARY:
                return "Filter out archived applications from the app drawer";
            case ID_NATIVE_ARCHIVE: {
                boolean nat = MorphePreferences.isNativeEnabled(sLastContext);
                return "Android 15+ Native Archiving: " + (nat ? "ON" : "OFF");
            }
            case ID_NATIVE_SUMMARY:
                return "Use Android PackageInstaller requestArchive / requestUnarchive";
            case ID_SHIZUKU_ARCHIVE: {
                boolean shiz = MorphePreferences.isShizukuEnabled(sLastContext);
                return "Shizuku Archiving: " + (shiz ? "ON" : "OFF");
            }
            case ID_SHIZUKU_SUMMARY:
                return "Use Shizuku privileged shell for seamless archiving";
            case ID_DIAG_ACTION:
                return "Archive Diagnostics & Status";
            case ID_DIAG_SUMMARY:
                return "Tap to check Shizuku status and Android 15+ archive capability";
            case ID_ACTION_ARCHIVE:
            case ID_ACTION_RESTORE: {
                String pkg = sLastPackageName;
                Context ctx = sLastContext;
                boolean isArch = false;
                if (ctx != null && pkg != null) {
                    isArch = ArchivedAppFilter.isPackageArchived(ctx.getPackageManager(), pkg);
                }
                return isArch ? "Restore App" : "Archive App";
            }
            default:
                if (resources != null) {
                    return resources.getString(id);
                }
                return "";
        }
    }

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
    @SuppressWarnings("rawtypes")
    public static void injectAndShow(Object popupLayerObj, List items) {
        injectAndShow(popupLayerObj, items, null);
    }

    /**
     * Drop-in replacement with callerObj support.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void injectAndSetPopupValue(Object stateObj, List items) {
        List mutableItems = items != null ? new ArrayList(items) : new ArrayList();
        injectArchiveItem(null, mutableItems, null);
        if (stateObj != null) {
            try {
                for (Method m : stateObj.getClass().getMethods()) {
                    if ("setValue".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        m.invoke(stateObj, mutableItems);
                        return;
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "injectAndSetPopupValue setValue failed", t);
            }
        }
    }

    /**
     * Entry-point for bytecode replacement at popup show call-sites.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void injectAndShow(Object popupLayerObj, List items, Object callerObj) {
        Log.i(TAG, "injectAndShow called! items count: " + (items != null ? items.size() : "null") + ", popupLayer=" + popupLayerObj);
        // Always work with a mutable copy. Smart Launcher passes Kotlin's immutable listOf()
        // which throws UnsupportedOperationException on add(), silently swallowed otherwise.
        List mutableItems = items != null ? new ArrayList(items) : new ArrayList();

        injectArchiveItem(popupLayerObj, mutableItems, callerObj);

        if (popupLayerObj == null) return;
        try {
            if (sPopupShowMethod == null) {
                Class<?> clazz = popupLayerObj.getClass();
                while (clazz != null && clazz != Object.class) {
                    // First pass: look for "d" or short method name (<= 2 chars) matching (List)V
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
                    // Fallback pass: match any single-List-param void method
                    for (Method m : clazz.getDeclaredMethods()) {
                        Class<?>[] params = m.getParameterTypes();
                        if (params.length == 1
                                && List.class.isAssignableFrom(params[0])
                                && m.getReturnType() == void.class) {
                            m.setAccessible(true);
                            sPopupShowMethod = m;
                            break;
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
    public static void injectArchiveItem(Object popupLayerObj, List items) {
        injectArchiveItem(popupLayerObj, items, null);
    }

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
                ShizukuArchiveHelper.ensureInitialized(context);
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
            if (finalPackageName == null) {
                return;
            }

            // Prevent duplicate injection if already present
            for (Object item : items) {
                if (item != null) {
                    int id = getIntFieldSafe(item, "b", 0);
                    if (id == ID_ACTION_ARCHIVE || id == ID_ACTION_RESTORE) {
                        return;
                    }
                }
            }

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
                                || f.getType().getName().contains("j54")
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
                isArchived = ArchivedAppFilter.isPackageArchived(finalContext.getPackageManager(), finalPackageName);
            }

            final boolean targetIsArchived = isArchived;
            final String actionTitle = (finalPackageName != null)
                    ? (targetIsArchived ? "Restore App" : "Archive App")
                    : "Archive / Restore App";

            Log.i(TAG, "injectArchiveItem called: finalPackageName=" + finalPackageName + ", isArchived=" + targetIsArchived);

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
                for (String name : new String[]{"j54", "b34"}) {
                    try {
                        Class<?> candidate = Class.forName(name);
                        if (candidate.isInterface()) {
                            interfaceList.add(candidate);
                            break;
                        }
                    } catch (ClassNotFoundException ignored) {}
                }
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

                            Class<?> retType = method.getReturnType();
                            if (retType == void.class) {
                                return null;
                            }
                            if (retType == boolean.class || retType == Boolean.class) {
                                return Boolean.TRUE;
                            }
                            if (retType == int.class || retType == Integer.class) {
                                return 0;
                            }
                            try {
                                Class<?> unitClass = Class.forName("kotlin.Unit");
                                Field instanceField = unitClass.getField("INSTANCE");
                                Object unitInstance = instanceField.get(null);
                                if (retType.isInstance(unitInstance) || retType == Object.class) {
                                    return unitInstance;
                                }
                            } catch (Throwable ignored) {}
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
                        if (pt == int.class) {
                            if (i == 0) {
                                int iconRes = targetIsArchived ? DRAWABLE_RESTORE : DRAWABLE_ARCHIVE;
                                if (finalContext != null) {
                                    try {
                                        int dynRes = targetIsArchived
                                                ? finalContext.getResources().getIdentifier("ic_restore", "drawable", finalContext.getPackageName())
                                                : finalContext.getResources().getIdentifier("ic_file_compressed", "drawable", finalContext.getPackageName());
                                        if (dynRes == 0 && !targetIsArchived) {
                                            dynRes = finalContext.getResources().getIdentifier("ic_pop_backup", "drawable", finalContext.getPackageName());
                                        }
                                        if (dynRes != 0) iconRes = dynRes;
                                    } catch (Throwable ignored) {}
                                }
                                if (iconRes == 0) {
                                    iconRes = getIntFieldSafe(sampleItem, "a", 0);
                                }
                                initArgs[i] = iconRes;
                            } else if (i == 1) {
                                initArgs[i] = targetIsArchived ? ID_ACTION_RESTORE : ID_ACTION_ARCHIVE;
                            } else {
                                initArgs[i] = 0;
                            }
                        }
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
                        if ("a".equals(f.getName())) {
                            int iconRes = targetIsArchived ? DRAWABLE_RESTORE : DRAWABLE_ARCHIVE;
                            if (iconRes == 0) {
                                Object sVal = f.get(sampleItem);
                                if (sVal instanceof Integer) iconRes = (Integer) sVal;
                            }
                            f.set(archiveItem, iconRes);
                        } else if ("b".equals(f.getName())) {
                            f.set(archiveItem, targetIsArchived ? ID_ACTION_RESTORE : ID_ACTION_ARCHIVE);
                        } else if (CharSequence.class.isAssignableFrom(f.getType())) {
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
        Set<Object> visited = Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>());
        String pkg = null;

        // 1. Inspect all items in popup list (most direct source of closures)
        if (items != null) {
            for (Object item : items) {
                if (item != null) {
                    pkg = extractPackageName(context, item, 0, visited);
                    if (pkg != null) {
                        return pkg;
                    }
                }
            }
        }

        // 2. Inspect popupLayerObj (controller containing target view)
        if (popupLayerObj != null) {
            pkg = extractPackageName(context, popupLayerObj, 0, visited);
            if (pkg != null) {
                return pkg;
            }
        }

        // 3. Inspect callerObj
        if (callerObj != null) {
            pkg = extractPackageName(context, callerObj, 0, visited);
            if (pkg != null) {
                return pkg;
            }
        }

        return sLastPackageName;
    }

    // On API 35+, archived packages are excluded from getApplicationInfo(pkg, 0).
    // MATCH_ARCHIVED_PACKAGES (0x8000) must be passed to see them.
    private static final int PM_FLAGS = Build.VERSION.SDK_INT >= 35 ? 0x00008000 : 0;

    static ApplicationInfo getAppInfoSafe(PackageManager pm, String pkg) {
        if (pm == null || pkg == null) return null;
        try {
            return pm.getApplicationInfo(pkg, PM_FLAGS);
        } catch (Throwable t) {
            if (PM_FLAGS != 0) {
                try {
                    return pm.getApplicationInfo(pkg, 0);
                } catch (Throwable ignored) {}
            }
            return null;
        }
    }

    private static boolean isInstalledPackage(Context context, String pkg) {
        if (pkg == null || pkg.isEmpty() || !pkg.contains(".")) return false;
        if ("android".equals(pkg) || pkg.startsWith("ginlemon.flower")) return false;
        if (pkg.startsWith("android.") || pkg.startsWith("androidx.")
                || pkg.startsWith("java.") || pkg.startsWith("javax.")
                || pkg.startsWith("kotlin.") || pkg.startsWith("kotlinx.")) {
            return false;
        }
        Context ctx = context;
        if (ctx == null) ctx = sLastContext;
        if (ctx == null) {
            try {
                Class<?> atClass = Class.forName("android.app.ActivityThread");
                Method currentAppMethod = atClass.getMethod("currentApplication");
                ctx = (Context) currentAppMethod.invoke(null);
            } catch (Throwable ignored) {}
        }
        if (ctx != null) {
            return getAppInfoSafe(ctx.getPackageManager(), pkg) != null;
        }
        return false;
    }

    private static String extractPackageName(Context context, Object obj, int depth, Set<Object> visited) {
        if (obj == null || depth > 5) return null;
        if (!visited.add(obj)) return null;

        // Direct extraction for Smart Launcher AppModel or models wrapping AppModel
        try {
            Class<?> cls = obj.getClass();
            String cname = cls.getName();
            if (cname.contains("AppModel") || cname.endsWith(".s51") || cname.equals("s51")) {
                for (String fName : new String[]{"e", "packageName"}) {
                    try {
                        Field f = cls.getDeclaredField(fName);
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val instanceof String && isInstalledPackage(context, (String) val)) {
                            return (String) val;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ignored) {}

        if (obj instanceof ComponentName) {
            String pkg = ((ComponentName) obj).getPackageName();
            if (isInstalledPackage(context, pkg)) return pkg;
        }
        if (obj instanceof Intent) {
            Intent it = (Intent) obj;
            if (it.getComponent() != null) {
                String pkg = it.getComponent().getPackageName();
                if (isInstalledPackage(context, pkg)) return pkg;
            }
            if (it.getPackage() != null) {
                String pkg = it.getPackage();
                if (isInstalledPackage(context, pkg)) return pkg;
            }
            if (it.getData() != null) {
                String pkg = extractPackageFromUri(it.getData());
                if (isInstalledPackage(context, pkg)) return pkg;
            }
        }
        if (obj instanceof Uri) {
            String pkg = extractPackageFromUri((Uri) obj);
            if (isInstalledPackage(context, pkg)) return pkg;
        }
        if (obj instanceof LauncherActivityInfo) {
            String pkg = ((LauncherActivityInfo) obj).getApplicationInfo().packageName;
            if (isInstalledPackage(context, pkg)) return pkg;
        }
        if (obj instanceof ApplicationInfo) {
            String pkg = ((ApplicationInfo) obj).packageName;
            if (isInstalledPackage(context, pkg)) return pkg;
        }
        if (obj instanceof PackageInfo) {
            String pkg = ((PackageInfo) obj).packageName;
            if (isInstalledPackage(context, pkg)) return pkg;
        }
        if (obj instanceof String) {
            String s = (String) obj;
            if (s.startsWith("package:")) s = s.substring(8);
            if (s.contains(".") && !s.contains(" ") && !s.contains("/") && !s.contains(":")
                    && !s.contains(";") && !s.contains("$") && s.length() >= 3 && s.length() <= 100) {
                if (isInstalledPackage(context, s)) {
                    return s;
                }
            }
            return null;
        }

        // Avoid deep reflection into heavy Android framework objects, but allow custom launcher views
        if (obj instanceof View) {
            Object tag = ((View) obj).getTag();
            if (tag != null && tag != obj) {
                String pkg = extractPackageName(context, tag, depth + 1, visited);
                if (pkg != null) return pkg;
            }
            String vName = obj.getClass().getName();
            if (vName.startsWith("android.") || vName.startsWith("androidx.")) {
                return null;
            }
        }
        if (obj instanceof Context || obj instanceof Window || obj instanceof Activity || obj instanceof Resources) {
            return null;
        }

        if (obj instanceof Collection) {
            for (Object elem : (Collection<?>) obj) {
                if (elem != null) {
                    String pkg = extractPackageName(context, elem, depth + 1, visited);
                    if (pkg != null) return pkg;
                }
            }
            return null;
        }
        if (obj instanceof Object[]) {
            for (Object elem : (Object[]) obj) {
                if (elem != null) {
                    String pkg = extractPackageName(context, elem, depth + 1, visited);
                    if (pkg != null) return pkg;
                }
            }
            return null;
        }

        // Check common getters before deep field traversal
        for (String getter : new String[]{"getPackageName", "getComponent", "getIntent", "getApplicationInfo", "getPackage", "getIntentUri"}) {
            try {
                Method m = obj.getClass().getMethod(getter);
                if (m.getParameterTypes().length == 0) {
                    Object val = m.invoke(obj);
                    if (val != null && val != obj) {
                        String pkg = extractPackageName(context, val, depth + 1, visited);
                        if (pkg != null) return pkg;
                    }
                }
            } catch (Throwable ignored) {}
        }

        // Recursively inspect declared fields on the object
        try {
            Class<?> clazz = obj.getClass();
            while (clazz != null && clazz != Object.class) {
                String cname = clazz.getName();
                if (cname.startsWith("java.") || cname.startsWith("javax.")
                        || cname.startsWith("android.") || cname.startsWith("androidx.")
                        || cname.startsWith("kotlin.")) {
                    clazz = clazz.getSuperclass();
                    continue;
                }
                for (Field f : clazz.getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(obj);
                        if (val != null && val != obj) {
                            String pkg = extractPackageName(context, val, depth + 1, visited);
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

                // 1. Try ShizukuArchiveHelper (uses rish → Shizuku API → su as fallback chain)
                if (shizukuEnabled) {
                    ShizukuArchiveHelper.ensureInitialized(context);
                    success = isCurrentlyArchived
                            ? ShizukuArchiveHelper.unarchivePackage(packageName)
                            : ShizukuArchiveHelper.archivePackage(packageName);
                    Log.i(TAG, "ShizukuArchiveHelper result for " + packageName + ": " + success);

                    // If not yet alive, request permission for future attempts
                    if (!success && ShizukuArchiveHelper.isShizukuAlive() && !ShizukuArchiveHelper.hasPermission()) {
                        MAIN_HANDLER.post(new Runnable() {
                            @Override
                            public void run() {
                                ShizukuArchiveHelper.requestPermissionWithFeedback(context, packageName, isCurrentlyArchived);
                            }
                        });
                        return;
                    }
                }

                // 2. Try Native Android 15+ archiving if ShizukuArchiveHelper didn't succeed
                if (!success && nativeEnabled && NativeArchiveHelper.isSupported()) {
                    success = isCurrentlyArchived
                            ? NativeArchiveHelper.unarchivePackage(context, packageName)
                            : NativeArchiveHelper.archivePackage(context, packageName);
                    Log.i(TAG, "NativeArchiveHelper result for " + packageName + ": " + success);
                }

                // 3. User feedback
                if (success) {
                    postToast(context, finalLabel + (isCurrentlyArchived ? " restored!" : " archived!"));
                } else {
                    postToast(context, "Failed to " + (isCurrentlyArchived ? "restore " : "archive ") + finalLabel + ". Ensure Shizuku is running.");
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

    public static void postToast(final Context context, final String message) {
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
     * obj1 = PrefMenuActivity instance, obj2 = original Dev Options Intent.
     * We show Morphe settings AND forward the original intent so Dev Options also opens.
     */
    public static void openMorpheSettings(Object obj1, Object obj2) {
        Context ctx = resolveContext(obj1);
        if (ctx == null) ctx = resolveContext(obj2);
        if (ctx == null) ctx = getForegroundActivity();
        if (ctx == null) {
            try {
                Class<?> atClass = Class.forName("android.app.ActivityThread");
                Method currentAppMethod = atClass.getMethod("currentApplication");
                ctx = (Context) currentAppMethod.invoke(null);
            } catch (Throwable ignored) {}
        }
        if (ctx == null) return;
        Intent devIntent = (obj2 instanceof Intent) ? (Intent) obj2 : null;
        MorpheSettingsDialog.show(ctx, devIntent);
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

    private static int getIntFieldSafe(Object obj, String fieldName, int defVal) {
        if (obj == null) return defVal;
        try {
            Field f = obj.getClass().getDeclaredField(fieldName);
            f.setAccessible(true);
            return f.getInt(obj);
        } catch (Throwable t) {
            for (Field f : obj.getClass().getDeclaredFields()) {
                if (f.getType() == int.class) {
                    try {
                        f.setAccessible(true);
                        return f.getInt(obj);
                    } catch (Throwable ignored) {}
                }
            }
            return defVal;
        }
    }

    /**
     * Called by bytecode patch in Smart Launcher's Experimental Features provider method (Lu28;->invoke).
     * Merges native setting items and injects dedicated Morphe Archiving settings rows.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList mergeAndInjectSettings(Collection a, Iterable b) {
        ArrayList list = new ArrayList();
        try {
            if (a != null) list.addAll(a);
            if (b != null) {
                for (Object item : b) {
                    list.add(item);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in mergeAndInjectSettings", t);
        }
        return list;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void injectExperimentalSettings(List list) {
        if (list == null || list.isEmpty()) return;
        try {
            Context ctx = sLastContext;
            if (ctx == null) ctx = getForegroundActivity();
            final Context context = ctx;

            // Locate sample divider (Lyk2) and sample preference action (Lfc1)
            Class<?> dividerClass = null;
            Class<?> actionClass = null;
            Constructor<?> dividerCtor = null;
            Constructor<?> actionCtor = null;

            for (Object item : list) {
                if (item == null) continue;
                Class<?> cls = item.getClass();
                for (Constructor<?> c : cls.getDeclaredConstructors()) {
                    Class<?>[] pts = c.getParameterTypes();
                    if (pts.length == 1 && pts[0] == String.class && dividerClass == null) {
                        dividerClass = cls;
                        dividerCtor = c;
                        dividerCtor.setAccessible(true);
                    } else if (pts.length >= 5 && pts[0] == String.class && pts[1] == int.class && actionClass == null) {
                        actionClass = cls;
                        actionCtor = c;
                        actionCtor.setAccessible(true);
                    }
                }
                if (dividerClass != null && actionClass != null) break;
            }

            if (dividerClass != null && dividerCtor != null) {
                Object divider = dividerCtor.newInstance("morphe_archiving_divider");
                list.add(divider);
            }

            if (actionClass != null && actionCtor != null) {
                Class<?>[] pTypes = actionCtor.getParameterTypes();
                Class<?> samInterface = null;
                for (Class<?> pt : pTypes) {
                    if (pt.isInterface()) {
                        samInterface = pt;
                        break;
                    }
                }

                String[] keys = new String[] {
                    "morphe_hide_archived",
                    "morphe_native_archive",
                    "morphe_shizuku_archive",
                    "morphe_diag"
                };
                int[] titles = new int[] {
                    ID_HIDE_ARCHIVED,
                    ID_NATIVE_ARCHIVE,
                    ID_SHIZUKU_ARCHIVE,
                    ID_DIAG_ACTION
                };
                int[] summaries = new int[] {
                    ID_HIDE_SUMMARY,
                    ID_NATIVE_SUMMARY,
                    ID_SHIZUKU_SUMMARY,
                    ID_DIAG_SUMMARY
                };

                for (int i = 0; i < keys.length; i++) {
                    final String prefKey = keys[i];
                    Object proxy = null;
                    if (samInterface != null) {
                        proxy = Proxy.newProxyInstance(
                            actionClass.getClassLoader(),
                            new Class<?>[] { samInterface },
                            new InvocationHandler() {
                                @Override
                                public Object invoke(Object p, Method m, Object[] args) throws Throwable {
                                    handlePrefClick(context, prefKey);
                                    Class<?> rt = m.getReturnType();
                                    if (rt == boolean.class || rt == Boolean.class) return Boolean.TRUE;
                                    try {
                                        Class<?> unitClass = Class.forName("kotlin.Unit");
                                        Field f = unitClass.getField("INSTANCE");
                                        return f.get(null);
                                    } catch (Throwable ignored) {}
                                    return null;
                                }
                            }
                        );
                    }

                    int summaryIndex = (pTypes.length >= 6) ? 4 : 3;
                    Object[] initArgs = new Object[pTypes.length];
                    for (int j = 0; j < pTypes.length; j++) {
                        Class<?> pt = pTypes[j];
                        if (pt == String.class) initArgs[j] = prefKey;
                        else if (pt == int.class) initArgs[j] = (j == 1 ? titles[i] : 0);
                        else if (pt == Integer.class) initArgs[j] = (j == summaryIndex ? Integer.valueOf(summaries[i]) : null);
                        else if (samInterface != null && pt.isAssignableFrom(samInterface)) initArgs[j] = proxy;
                        else if (pt == boolean.class) initArgs[j] = false;
                        else initArgs[j] = null;
                    }

                    Object prefItem = actionCtor.newInstance(initArgs);
                    if (prefItem != null) {
                        list.add(prefItem);
                    }
                }
                Log.i(TAG, "Successfully injected Morphe preferences into Experimental settings list");
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to inject experimental settings: " + t.getMessage(), t);
        }
    }

    private static void handlePrefClick(final Context ctx, String key) {
        final Context safeCtx = (ctx != null) ? ctx : getForegroundActivity();
        if ("morphe_hide_archived".equals(key)) {
            boolean cur = MorphePreferences.isHideArchivedEnabled(safeCtx);
            MorphePreferences.setHideArchivedEnabled(safeCtx, !cur);
            showToastSafe(safeCtx, "Hide Archived Apps: " + (!cur ? "Enabled" : "Disabled"));
        } else if ("morphe_native_archive".equals(key)) {
            boolean cur = MorphePreferences.isNativeEnabled(safeCtx);
            MorphePreferences.setNativeEnabled(safeCtx, !cur);
            showToastSafe(safeCtx, "Native Archiving: " + (!cur ? "Enabled" : "Disabled"));
        } else if ("morphe_shizuku_archive".equals(key)) {
            boolean cur = MorphePreferences.isShizukuEnabled(safeCtx);
            MorphePreferences.setShizukuEnabled(safeCtx, !cur);
            showToastSafe(safeCtx, "Shizuku Archiving: " + (!cur ? "Enabled" : "Disabled"));
        } else if ("morphe_diag".equals(key)) {
            boolean isA15 = Build.VERSION.SDK_INT >= 35;
            boolean hasShizuku = ShizukuArchiveHelper.isShizukuAlive();
            showToastSafe(safeCtx, "Morphe Status:\nAndroid " + Build.VERSION.RELEASE + " (API " + Build.VERSION.SDK_INT + ")\nNative Archiving: " + (isA15 ? "Supported" : "Requires Android 15+") + "\nShizuku: " + (hasShizuku ? "Available" : "Not running"));
        }
    }

    private static void showToastSafe(final Context ctx, final String msg) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Context c = ctx != null ? ctx : getForegroundActivity();
                    if (c != null) {
                        Toast.makeText(c.getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
                    }
                } catch (Throwable ignored) {}
            }
        });
    }
}
