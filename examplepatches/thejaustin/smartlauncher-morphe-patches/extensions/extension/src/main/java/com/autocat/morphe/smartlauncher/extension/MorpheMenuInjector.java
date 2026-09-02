package com.autocat.morphe.smartlauncher.extension;

import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.List;

/**
 * Injects Morphe Actions into Smart Launcher's contextual long-press popup menus and settings.
 */
public final class MorpheMenuInjector {

    private static final String TAG = "MorpheMenuInjector";
    private static String sLastPackageName = null;
    private static Context sLastContext = null;

    private static Method sPopupShowMethod = null;

    private MorpheMenuInjector() {}

    /**
     * Drop-in replacement for the original rj.d(List)V call in the popup coroutine method.
     *
     * The patch uses replaceInstruction (not addInstruction) so the method's bytecode size
     * stays identical and no jump offsets are shifted. This prevents the ART class-verification
     * failure that caused an instant crash at startup when addInstruction was used.
     *
     * After injecting the archive item, this method calls the original rj.d(List)V via
     * reflection so the popup still shows normally.
     */
    @SuppressWarnings("rawtypes")
    public static void injectAndShow(Object popupLayerObj, List items, Object callerObj) {
        injectArchiveItem(popupLayerObj, items, callerObj);

        if (popupLayerObj == null) return;
        try {
            if (sPopupShowMethod == null) {
                for (Method m : popupLayerObj.getClass().getDeclaredMethods()) {
                    Class<?>[] params = m.getParameterTypes();
                    if (params.length == 1
                            && List.class.isAssignableFrom(params[0])
                            && m.getReturnType() == void.class
                            && m.getName().length() <= 2) {
                        m.setAccessible(true);
                        sPopupShowMethod = m;
                        break;
                    }
                }
            }
            if (sPopupShowMethod != null) {
                sPopupShowMethod.invoke(popupLayerObj, items);
            } else {
                Log.w(TAG, "injectAndShow: could not locate popup show method");
            }
        } catch (Throwable t) {
            Log.w(TAG, "injectAndShow: reflection call failed: " + t.getMessage());
        }
    }

    /**
     * Injects a dedicated "Archive App" or "Restore App" item into Smart Launcher's contextual popup menu list.
     *
     * @param popupLayerObj The Lrj; popup controller (contains view & context)
     * @param items         The List of popup items (LinkedList of q36)
     * @param callerObj     The Ldl3; coroutine closure (contains target ComponentName)
     */
    @SuppressWarnings("rawtypes")
    public static void injectArchiveItem(Object popupLayerObj, List items, Object callerObj) {
        if (items == null) {
            return;
        }

        try {
            Context context = null;
            String packageName = null;

            // 1. Extract context from popupLayerObj (Lrj; -> field n: View)
            if (popupLayerObj != null) {
                for (Field f : popupLayerObj.getClass().getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(popupLayerObj);
                    if (val instanceof View) {
                        context = ((View) val).getContext();
                        break;
                    }
                }
            }

            // 2. Extract target packageName from callerObj (Ldl3; -> field y: ComponentName)
            if (callerObj != null) {
                for (Field f : callerObj.getClass().getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(callerObj);
                    if (val instanceof ComponentName) {
                        packageName = ((ComponentName) val).getPackageName();
                        break;
                    } else if (val instanceof String && ((String) val).contains(".")) {
                        packageName = (String) val;
                    }
                }
            }

            if (context == null) {
                context = sLastContext;
            } else {
                sLastContext = context;
            }

            if (packageName == null) {
                packageName = sLastPackageName;
            } else {
                sLastPackageName = packageName;
            }

            final Context finalContext = context;
            final String finalPackageName = packageName;

            if (finalContext == null || finalPackageName == null) {
                return;
            }

            // 3. Find sample q36 item to clone reflection structures
            Object sampleItem = null;
            for (Object obj : items) {
                if (obj != null && obj.getClass().getName().endsWith("q36")) {
                    sampleItem = obj;
                    break;
                }
            }

            if (sampleItem == null) {
                return;
            }

            Class<?> q36Class = sampleItem.getClass();
            Field stringField = null;
            Field actionField = null;

            for (Field f : q36Class.getDeclaredFields()) {
                f.setAccessible(true);
                if (f.getType() == String.class && stringField == null) {
                    stringField = f;
                } else if (f.getName().equals("f") || f.getType().getName().contains("b34") || f.getType().getName().contains("Function")) {
                    actionField = f;
                }
            }

            // Check if app is currently archived
            PackageManager pm = finalContext.getPackageManager();
            ApplicationInfo appInfo = pm.getApplicationInfo(finalPackageName, 0);
            final boolean isArchived = (appInfo.flags & 0x40000000) != 0;
            final String actionTitle = isArchived ? "♻️ Restore / Unarchive" : "📦 Archive App";

            // 4. Resolve the Kotlin Function1 interface class (obfuscated as e.g. "b34").
            // Prefer the runtime type of the existing action field so we stay correct
            // across obfuscation renames. Fall back to Class.forName only if needed.
            Class<?> function1Class = null;
            if (actionField != null) {
                function1Class = actionField.getType();
                if (!function1Class.isInterface()) {
                    function1Class = null;
                }
            }
            if (function1Class == null) {
                try {
                    Class<?> candidate = Class.forName("b34");
                    if (candidate.isInterface()) function1Class = candidate;
                } catch (ClassNotFoundException ignored) {}
            }
            if (function1Class == null) {
                Log.w(TAG, "injectArchiveItem: could not resolve Function1 interface; skipping inject");
                return;
            }

            final Class<?> resolvedFn1 = function1Class;
            Object clickProxy = Proxy.newProxyInstance(
                    q36Class.getClassLoader(),
                    new Class<?>[]{resolvedFn1},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            if ("invoke".equals(method.getName())) {
                                boolean ok;
                                if (isArchived) {
                                    ok = ShizukuArchiveHelper.unarchivePackage(finalPackageName);
                                    if (!ok) {
                                        ok = NativeArchiveHelper.unarchivePackage(finalContext, finalPackageName);
                                    }
                                    Toast.makeText(finalContext, ok ? "Unarchiving " + finalPackageName + "..." : "Failed to unarchive app", Toast.LENGTH_SHORT).show();
                                } else {
                                    ok = ShizukuArchiveHelper.archivePackage(finalPackageName);
                                    if (!ok) {
                                        ok = NativeArchiveHelper.archivePackage(finalContext, finalPackageName);
                                    }
                                    Toast.makeText(finalContext, ok ? "Archiving " + finalPackageName + "..." : "Failed to archive app", Toast.LENGTH_SHORT).show();
                                }
                                return null;
                            }
                            return null;
                        }
                    }
            );

            // 5. Instantiate a new q36 entry via reflection
            Constructor<?>[] constructors = q36Class.getDeclaredConstructors();
            if (constructors.length > 0) {
                Constructor<?> ctor = constructors[0];
                ctor.setAccessible(true);
                Class<?>[] paramTypes = ctor.getParameterTypes();
                Object[] initArgs = new Object[paramTypes.length];

                for (int i = 0; i < paramTypes.length; i++) {
                    if (paramTypes[i] == int.class) initArgs[i] = 0;
                    else if (paramTypes[i] == boolean.class) initArgs[i] = false;
                    else if (paramTypes[i] == String.class) initArgs[i] = actionTitle;
                    else if (paramTypes[i].isAssignableFrom(function1Class)) initArgs[i] = clickProxy;
                    else initArgs[i] = null;
                }

                Object archiveItem = ctor.newInstance(initArgs);
                if (stringField != null) stringField.set(archiveItem, actionTitle);
                if (actionField != null) actionField.set(archiveItem, clickProxy);

                // Add to the popup list right next to other app actions
                items.add(archiveItem);
                Log.i(TAG, "Successfully injected " + actionTitle + " entry into popup menu for " + finalPackageName);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Safe popup item injection catch: " + t.getMessage());
        }
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
            ApplicationInfo appInfo = pm.getApplicationInfo(packageName, 0);
            CharSequence label = appInfo.loadLabel(pm);
            final String appName = label != null ? label.toString() : packageName;
            final boolean isArchived = (appInfo.flags & 0x40000000) != 0;

            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.setTitle("📦 " + appName);

            if (isArchived) {
                builder.setMessage("This application is currently archived. Choose an action:");
                builder.setPositiveButton("♻️ Restore / Unarchive", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        boolean ok = ShizukuArchiveHelper.unarchivePackage(packageName);
                        if (!ok) {
                            ok = NativeArchiveHelper.unarchivePackage(context, packageName);
                        }
                        Toast.makeText(context, ok ? "Unarchiving " + appName + "..." : "Failed to unarchive", Toast.LENGTH_SHORT).show();
                    }
                });
                builder.setNeutralButton("🗑️ Delete Completely", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        context.startActivity(uninstallIntent);
                    }
                });
            } else {
                builder.setMessage("Choose an action for " + appName + ":");
                builder.setPositiveButton("📦 Archive App (Save Space)", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        boolean ok = ShizukuArchiveHelper.archivePackage(packageName);
                        if (!ok) {
                            ok = NativeArchiveHelper.archivePackage(context, packageName);
                        }
                        Toast.makeText(context, ok ? "Archiving " + appName + "..." : "Failed to archive", Toast.LENGTH_SHORT).show();
                    }
                });
                builder.setNeutralButton("🗑️ Uninstall", new DialogInterface.OnClickListener() {
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

    /**
     * Called when Smart Launcher preferences / experimental menu is loaded.
     */
    public static void openMorpheSettings(Context context) {
        MorpheSettingsDialog.show(context);
    }
}
