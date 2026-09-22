package app.morphe.extension.shared.patches;

import static app.morphe.extension.shared.StringRef.str;
import static app.morphe.extension.shared.requests.Route.Method.GET;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.app.SearchManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Pair;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import androidx.annotation.Nullable;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.requests.Route;
import app.morphe.extension.shared.ui.CustomDialog;

@SuppressWarnings("unused")
public class GmsCoreSupportPatch {
    private static final String GOOGLE_PHOTOS_PACKAGE_NAME = "com.google.android.apps.photos";
    private static final String GMS_CORE_PACKAGE_NAME
            = getGmsCoreVendorGroupId() + ".android.gms";
    private static final Uri GMS_CORE_PROVIDER
            = Uri.parse("content://" + getGmsCoreVendorGroupId() + ".android.gsf.gservices/prefix");
    private static final String DONT_KILL_MY_APP_URL
            = "https://dontkillmyapp.com/";
    private static final Route DONT_KILL_MY_APP_MANUFACTURER_API
            = new Route(GET, "/api/v2/{manufacturer}.json");
    private static final String DONT_KILL_MY_APP_NAME_PARAMETER
            = "?app=MicroG";
    private static final String BUILD_MANUFACTURER
            = Build.MANUFACTURER.toLowerCase(Locale.ROOT).replace(" ", "-");

    /**
     * If a manufacturer specific page exists on DontKillMyApp.
     */
    @Nullable
    private static volatile Boolean DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED;

    private static String getOriginalPackageName() {
       return null; // Modified during patching.
    }

    /**
     * @return If the current package name is the same as the original unpatched app.
     *         If `GmsCore support` was not included during patching, this returns true;
     */
    public static boolean isPackageNameOriginal(Context context) {
        String originalPackageName = getOriginalPackageName();
        return originalPackageName == null
                || originalPackageName.equals(context.getPackageName());
    }

    private static void open(String queryOrLink) {
        Logger.printInfo(() -> "Opening link: " + queryOrLink);

        Intent intent;
        try {
            // Check if queryOrLink is a valid URL.
            new URL(queryOrLink);

            intent = new Intent(Intent.ACTION_VIEW, Uri.parse(queryOrLink));
        } catch (MalformedURLException e) {
            intent = new Intent(Intent.ACTION_WEB_SEARCH);
            intent.putExtra(SearchManager.QUERY, queryOrLink);
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        Utils.getContext().startActivity(intent);

        // Gracefully exit, otherwise the broken app will continue to run.
        System.exit(0);
    }

    private static void showBatteryOptimizationDialog(Activity context,
                                                      String dialogMessageRef,
                                                      String positiveButtonTextRef,
                                                      DialogInterface.OnClickListener onPositiveClickListener) {
        // Use a delay to allow the activity to finish initializing.
        // Otherwise, if device is in dark mode the dialog is shown with wrong color scheme.
        Utils.runOnMainThreadDelayed(() -> {
            // Create the custom dialog.
            Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                    context,
                    str("gms_core_dialog_title"), // Title.
                    str(dialogMessageRef), // Message.
                    null, // No EditText.
                    str(positiveButtonTextRef), // OK button text.
                    () -> onPositiveClickListener.onClick(null, 0), // Convert DialogInterface.OnClickListener to Runnable.
                    null, // No Cancel button action.
                    null, // No Neutral button text.
                    null, // No Neutral button action.
                    true // Dismiss dialog when onNeutralClick.
            );

            Dialog dialog = dialogPair.first;

            // Do not set cancelable too false to allow using back button to skip the action,
            // just in case the battery change can never be satisfied.
            dialog.setCancelable(true);

            // Show the dialog
            Utils.showDialog(context, dialog);
        }, 100);
    }

    /**
     * Injection point.
     */
    public static void checkGmsCore(Activity context) {
        try {
            // Verify GmsCore is installed.
            try {
                PackageManager manager = context.getPackageManager();
                manager.getPackageInfo(GMS_CORE_PACKAGE_NAME, PackageManager.GET_ACTIVITIES);
            } catch (PackageManager.NameNotFoundException exception) {
                Logger.printInfo(() -> "GmsCore was not found");
                // Cannot show a dialog and must show a toast,
                // because on some installations the app crashes before a dialog can be displayed.
                Utils.showToastLong(str("gms_core_toast_not_installed_message"));
                open(getGmsCoreDownload());
                return;
            }

            if (isAndroidAutomotive(context) || isGooglePhotos(context)) {
                // Ignore Android Automotive devices (Google built-in) and Google Photos,
                // as Photos does not require persistent background GmsCore services.
                Logger.printDebug(() -> "Skipping battery optimization check (Automotive or Google Photos)");
            } else if (batteryOptimizationsEnabled(context)) {
                Logger.printInfo(() -> "GmsCore is not whitelisted from battery optimizations");

                showBatteryOptimizationDialog(context,
                        "gms_core_dialog_not_whitelisted_using_battery_optimizations_message",
                        "gms_core_dialog_continue_text",
                        (dialog, id) -> openGmsCoreDisableBatteryOptimizationsIntent(context));
                return;
            }

            if (!isGooglePhotos(context)) {
                // Check if GmsCore is currently running in the background.
                var client = context.getContentResolver().acquireContentProviderClient(GMS_CORE_PROVIDER);
                //noinspection TryFinallyCanBeTryWithResources
                try {
                    if (client == null) {
                        Logger.printInfo(() -> "GmsCore is not running in the background");
                        checkIfDontKillMyAppSupportsManufacturer();

                        showBatteryOptimizationDialog(context,
                                "gms_core_dialog_not_whitelisted_not_allowed_in_background_message",
                                "gms_core_dialog_open_website_text",
                                (dialog, id) -> openDontKillMyApp());
                    }
                } finally {
                    if (client != null) client.close();
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "checkGmsCore failure", ex);
        }
    }

    @SuppressLint("BatteryLife") // Permission is part of GmsCore
    private static void openGmsCoreDisableBatteryOptimizationsIntent(Activity activity) {
        Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
        intent.setData(Uri.fromParts("package", GMS_CORE_PACKAGE_NAME, null));
        activity.startActivityForResult(intent, 0);
    }

    private static void checkIfDontKillMyAppSupportsManufacturer() {
        Utils.runOnBackgroundThread(() -> {
            try {
                final long start = System.currentTimeMillis();
                HttpURLConnection connection = Requester.getConnectionFromRoute(
                        DONT_KILL_MY_APP_URL, DONT_KILL_MY_APP_MANUFACTURER_API, BUILD_MANUFACTURER);
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);

                final boolean supported = connection.getResponseCode() == 200;
                Logger.printInfo(() -> "Manufacturer is " + (supported ? "" : "NOT ")
                        + "listed on DontKillMyApp: " + BUILD_MANUFACTURER
                        + " fetch took: " + (System.currentTimeMillis() - start) + "ms");
                DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED = supported;
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not check if manufacturer is listed on DontKillMyApp: "
                        + BUILD_MANUFACTURER, ex);
                DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED = null;
            }
        });
    }

    private static void openDontKillMyApp() {
        final Boolean manufacturerSupported = DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED;

        String manufacturerPageToOpen;
        if (manufacturerSupported == null) {
            // Fetch has not completed yet. Only happens on extremely slow internet connections
            // and the user spends less than 1 second reading what's on screen.
            // Instead of waiting for the fetch (which may time out),
            // open the website without a vendor.
            manufacturerPageToOpen = "";
        } else if (manufacturerSupported) {
            manufacturerPageToOpen = BUILD_MANUFACTURER;
        } else {
            // No manufacturer specific page exists. Open the general page.
            manufacturerPageToOpen = "general";
        }

        open(DONT_KILL_MY_APP_URL + manufacturerPageToOpen + DONT_KILL_MY_APP_NAME_PARAMETER);
    }

    /**
     * @return If GmsCore is not whitelisted from battery optimizations.
     */
    private static boolean batteryOptimizationsEnabled(Context context) {
        //noinspection ObsoleteSdkInt
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            // Android 5.0 does not have battery optimization settings.
            return false;
        }
        var powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return !powerManager.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE_NAME);
    }

    private static boolean isAndroidAutomotive(Context context) {
        return context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE);
    }

    private static boolean isGooglePhotos(Context context) {
        return GOOGLE_PHOTOS_PACKAGE_NAME.equals(getOriginalPackageName())
                || context.getPackageName().contains("photos");
    }

    private static String getGmsCoreDownload() {
        //noinspection SwitchStatementWithTooFewBranches
        return switch (getGmsCoreVendorGroupId()) {
            case "app.revanced" -> "https://morphe.software/microg";
            default -> getGmsCoreVendorGroupId() + ".android.gms";
        };
    }

    private static String getGmsCoreVendorGroupId() {
        return "app.revanced"; // Modified during patching.
    }

    private interface LocationApplier {
        void onLocation(android.location.Location loc);
    }

    private static volatile Object sAttachedMapObj;
    private static volatile Object sLocationComponent;
    private static volatile LocationSourceBinder sLocationSource;
    private static volatile android.location.Location sLastLocation;
    private static android.location.LocationListener sContinuousListener;

    private static class LocationSourceBinder extends android.os.Binder implements android.os.IInterface {
        private volatile android.os.IBinder listenerBinder;

        LocationSourceBinder() {
            attachInterface(this, "com.google.android.gms.maps.internal.ILocationSourceDelegate");
        }

        @Override
        public android.os.IBinder asBinder() {
            return this;
        }

        @Override
        protected boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException {
            if (code == INTERFACE_TRANSACTION) {
                reply.writeString("com.google.android.gms.maps.internal.ILocationSourceDelegate");
                return true;
            }
            if (code == 1 || code == 0) { // activate(IOnLocationChangeListener listener)
                data.enforceInterface("com.google.android.gms.maps.internal.ILocationSourceDelegate");
                android.os.IBinder b = data.readStrongBinder();
                this.listenerBinder = b;
                android.util.Log.d("MorpheLocation", "LocationSourceBinder: activated with listener " + b + " (code " + code + ")");
                android.location.Location loc = sLastLocation;
                if (loc != null) {
                    pushLocation(loc);
                }
                if (reply != null) reply.writeNoException();
                return true;
            } else if (code == 2) { // deactivate()
                data.enforceInterface("com.google.android.gms.maps.internal.ILocationSourceDelegate");
                android.util.Log.d("MorpheLocation", "LocationSourceBinder: deactivate() received (retaining listener)");
                if (reply != null) reply.writeNoException();
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }

        public void pushLocation(android.location.Location loc) {
            android.os.IBinder b = this.listenerBinder;
            if (b == null || loc == null) return;
            android.location.Location pushLoc = new android.location.Location(loc);
            if (pushLoc.getProvider() == null || pushLoc.getProvider().isEmpty()) {
                pushLoc.setProvider("fused");
            }
            if (pushLoc.getTime() == 0) {
                pushLoc.setTime(System.currentTimeMillis());
            }
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR1) {
                if (pushLoc.getElapsedRealtimeNanos() == 0) {
                    pushLoc.setElapsedRealtimeNanos(android.os.SystemClock.elapsedRealtimeNanos());
                }
            }
            if (!pushLoc.hasAccuracy() || pushLoc.getAccuracy() <= 0.0f) {
                pushLoc.setAccuracy(15.0f);
            }

            for (int code : new int[]{1, 2}) {
                android.os.Parcel p = android.os.Parcel.obtain();
                android.os.Parcel reply = android.os.Parcel.obtain();
                try {
                    p.writeInterfaceToken("com.google.android.gms.maps.internal.IOnLocationChangeListener");
                    p.writeInt(1); // indicates Parcelable exists
                    pushLoc.writeToParcel(p, 0);
                    boolean sent = b.transact(code, p, reply, 0);
                    if (sent) {
                        reply.readException();
                        android.util.Log.d("MorpheLocation", "Native Location pushed via transact " + code + ": "
                                + pushLoc.getLatitude() + ", " + pushLoc.getLongitude()
                                + " (acc=" + pushLoc.getAccuracy() + "m)");
                        break;
                    }
                } catch (Throwable t) {
                    // try next code
                } finally {
                    p.recycle();
                    reply.recycle();
                }
            }
        }
    }

    private static android.os.IBinder extractMapBinder(Object mapObj) {
        if (mapObj == null) return null;
        try {
            for (java.lang.reflect.Field f : mapObj.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object val = f.get(mapObj);
                if (val instanceof android.os.IInterface) {
                    android.os.IBinder b = ((android.os.IInterface) val).asBinder();
                    if (b != null) return b;
                } else if (val instanceof android.os.IBinder) {
                    return (android.os.IBinder) val;
                } else if (val != null) {
                    try {
                        java.lang.reflect.Field mRemote = val.getClass().getDeclaredField("mRemote");
                        mRemote.setAccessible(true);
                        Object b = mRemote.get(val);
                        if (b instanceof android.os.IBinder) {
                            return (android.os.IBinder) b;
                        }
                    } catch (Throwable ignored) {}

                    for (java.lang.reflect.Field sf : val.getClass().getDeclaredFields()) {
                        sf.setAccessible(true);
                        Object sval = sf.get(val);
                        if (sval instanceof android.os.IBinder) {
                            return (android.os.IBinder) sval;
                        } else if (sval instanceof android.os.IInterface) {
                            android.os.IBinder b = ((android.os.IInterface) sval).asBinder();
                            if (b != null) return b;
                        }
                    }
                }
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "Error extracting map binder", t);
        }
        return null;
    }

    private static void setLocationSource(android.os.IBinder mapBinder, android.os.IBinder locationSource) {
        if (mapBinder == null || locationSource == null) return;
        // Try transaction 23 (official AIDL), then fallback to 24
        for (int code : new int[]{23, 24}) {
            android.os.Parcel data = android.os.Parcel.obtain();
            android.os.Parcel reply = android.os.Parcel.obtain();
            try {
                data.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
                data.writeStrongBinder(locationSource);
                boolean success = mapBinder.transact(code, data, reply, 0);
                if (success) {
                    reply.readException();
                    android.util.Log.d("MorpheLocation", "Successfully called setLocationSource (transact " + code + ")");
                    break;
                }
            } catch (Throwable t) {
                android.util.Log.w("MorpheLocation", "transact " + code + " for setLocationSource failed", t);
            } finally {
                data.recycle();
                reply.recycle();
            }
        }
    }

    private static void setMyLocationEnabled(android.os.IBinder mapBinder, boolean enabled) {
        if (mapBinder == null) return;
        // Try transaction 21 (official AIDL), then fallback to 22
        for (int code : new int[]{21, 22}) {
            android.os.Parcel data = android.os.Parcel.obtain();
            android.os.Parcel reply = android.os.Parcel.obtain();
            try {
                data.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
                data.writeInt(enabled ? 1 : 0);
                boolean success = mapBinder.transact(code, data, reply, 0);
                if (success) {
                    reply.readException();
                    android.util.Log.d("MorpheLocation", "Successfully called setMyLocationEnabled (transact " + code + ")");
                    break;
                }
            } catch (Throwable t) {
                android.util.Log.w("MorpheLocation", "transact " + code + " for setMyLocationEnabled failed", t);
            } finally {
                data.recycle();
                reply.recycle();
            }
        }
    }

    private static boolean isMapObject(Object obj) {
        if (obj == null) return false;
        Class<?> cls = obj.getClass();
        for (java.lang.reflect.Method m : cls.getMethods()) {
            if (m.getReturnType() != null && m.getReturnType().getName().contains("CameraPosition")) {
                return true;
            }
        }
        boolean hasLocationOrCamera = false;
        for (java.lang.reflect.Method m : cls.getMethods()) {
            if (m.getName().equals("f") && m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == boolean.class) {
                hasLocationOrCamera = true;
            }
            if ((m.getName().equals("t") || m.getName().equals("s") || m.getName().equals("r"))
                    && (m.getParameterTypes().length == 1 || m.getParameterTypes().length == 2)) {
                if (hasLocationOrCamera) return true;
            }
        }
        return hasLocationOrCamera;
    }

    private static Object findMapObject(Object mixin) {
        if (mixin == null) return null;
        Class<?> clazz = mixin.getClass();
        for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
            try {
                f.setAccessible(true);
                Object val = f.get(mixin);
                if (val == null) continue;

                if (isMapObject(val)) {
                    return val;
                }

                // Check if val is a Lazy/Provider/Holder
                for (java.lang.reflect.Method m : val.getClass().getDeclaredMethods()) {
                    if ((m.getName().equals("a") || m.getName().equals("get")) && m.getParameterTypes().length == 0) {
                        try {
                            m.setAccessible(true);
                            Object inner = m.invoke(val);
                            if (inner != null && isMapObject(inner)) {
                                return inner;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static Object createCameraUpdate(ClassLoader cl, Object latLng, float zoom) {
        if (latLng == null) return null;
        Class<?> latLngClass = latLng.getClass();
        String[] knownClasses = new String[]{
            "bprq", "defpackage.bprq",
            "brwd", "defpackage.brwd",
            "com.google.android.gms.maps.CameraUpdateFactory"
        };
        for (String clsName : knownClasses) {
            try {
                Class<?> c = null;
                try { c = Class.forName(clsName); } catch (Throwable ignored) {}
                if (c == null && cl != null) {
                    try { c = cl.loadClass(clsName); } catch (Throwable ignored) {}
                }
                if (c != null) {
                    for (java.lang.reflect.Method m : c.getMethods()) {
                        if (java.lang.reflect.Modifier.isStatic(m.getModifiers())) {
                            Class<?>[] pts = m.getParameterTypes();
                            if (pts.length == 2 && pts[0] == latLngClass && (pts[1] == float.class || pts[1] == Float.class)) {
                                m.setAccessible(true);
                                Object cu = m.invoke(null, latLng, zoom);
                                if (cu != null) return cu;
                            }
                        }
                    }
                    for (java.lang.reflect.Method m : c.getMethods()) {
                        if (java.lang.reflect.Modifier.isStatic(m.getModifiers())) {
                            Class<?>[] pts = m.getParameterTypes();
                            if (pts.length == 1 && pts[0] == latLngClass) {
                                m.setAccessible(true);
                                Object cu = m.invoke(null, latLng);
                                if (cu != null) return cu;
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    public static void initMapLocation(Object mixinObj) {
        if (mixinObj == null) return;
        try {
            android.util.Log.d("MorpheLocation", "initMapLocation called for: " + mixinObj.getClass().getName());
            final Object finalMixin = mixinObj;
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                int attempts = 0;
                @Override
                public void run() {
                    try {
                        Object mapObj = findMapObject(finalMixin);
                        if (mapObj != null) {
                            android.util.Log.d("MorpheLocation", "initMapLocation: mapObj found on attempt " + attempts);
                            android.os.IBinder mapBinder = extractMapBinder(mapObj);
                            if (mapBinder != null) {
                                if (sLocationSource == null) {
                                    sLocationSource = new LocationSourceBinder();
                                }
                                if (sAttachedMapObj != mapObj) {
                                    sAttachedMapObj = mapObj;
                                    sLocationComponent = null;
                                    setLocationSource(mapBinder, sLocationSource);
                                }
                                setMyLocationEnabled(mapBinder, true);
                            }
                            try {
                                for (java.lang.reflect.Method m : mapObj.getClass().getMethods()) {
                                    if (m.getName().equals("f") && m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == boolean.class) {
                                        m.invoke(mapObj, true);
                                        break;
                                    }
                                }
                            } catch (Throwable ignored) {}

                            if (sLastLocation != null && sLocationSource != null) {
                                sLocationSource.pushLocation(sLastLocation);
                            }
                        } else if (attempts < 6) {
                            attempts++;
                            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(this, 1000);
                        }
                    } catch (Throwable t) {
                        android.util.Log.e("MorpheLocation", "initMapLocation error in poll", t);
                    }
                }
            }, 500);
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "initMapLocation outer exception", t);
        }
    }

    private static Object findLocationComponent(Object obj, int depth, Set<Object> visited) {
        if (obj == null || depth > 5 || visited.contains(obj)) return null;
        visited.add(obj);

        String className = obj.getClass().getName();
        if (className.contains("LocationComponent") && !className.contains("Options")
                && !className.contains("Constants") && !className.contains("Exception")
                && !className.contains("Activation")) {
            return obj;
        }

        if (className.contains("MapboxMap")) {
            try {
                java.lang.reflect.Method m = obj.getClass().getMethod("getLocationComponent");
                Object lc = m.invoke(obj);
                if (lc != null) return lc;
            } catch (Throwable ignored) {}
        }

        if (className.contains("GoogleMapImpl")) {
            try {
                for (java.lang.reflect.Field f : obj.getClass().getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(obj);
                    if (val != null && val.getClass().getName().contains("MapboxMap")) {
                        Object lc = findLocationComponent(val, depth + 1, visited);
                        if (lc != null) return lc;
                    }
                }
            } catch (Throwable ignored) {}
        }

        for (Class<?> c = obj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                if (f.getType().isPrimitive() || f.getType() == String.class) continue;
                try {
                    f.setAccessible(true);
                    Object child = f.get(obj);
                    if (child != null) {
                        Object lc = findLocationComponent(child, depth + 1, visited);
                        if (lc != null) return lc;
                    }
                } catch (Throwable ignored) {}
            }
        }
        return null;
    }

    private static Object findLocationComponentFromView(View v, int depth, Set<Object> visited) {
        if (v == null || depth > 8 || visited.contains(v)) return null;
        visited.add(v);
        String vName = v.getClass().getName();
        if (vName.contains("MapView")) {
            for (Class<?> c = v.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (f.getType().getName().contains("MapboxMap")) {
                        try {
                            f.setAccessible(true);
                            Object mapboxMap = f.get(v);
                            if (mapboxMap != null) {
                                java.lang.reflect.Method m = mapboxMap.getClass().getMethod("getLocationComponent");
                                Object lc = m.invoke(mapboxMap);
                                if (lc != null) return lc;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                Object lc = findLocationComponentFromView(vg.getChildAt(i), depth + 1, visited);
                if (lc != null) return lc;
            }
        }
        return null;
    }

    private static void configureLocationComponent(Object locationComponent, android.location.Location loc) {
        if (locationComponent == null) return;
        try {
            android.util.Log.d("MorpheLocation", "configureLocationComponent: " + locationComponent.getClass().getName());

            // 1. Ensure LocationComponent is enabled
            try {
                java.lang.reflect.Method mEnable = locationComponent.getClass().getMethod("setLocationComponentEnabled", boolean.class);
                mEnable.invoke(locationComponent, true);
                android.util.Log.d("MorpheLocation", "LocationComponent.setLocationComponentEnabled(true) succeeded");
            } catch (Throwable t) {
                android.util.Log.w("MorpheLocation", "Failed to setLocationComponentEnabled", t);
            }

            // 2. Set renderMode = 18 (RenderMode.NORMAL) to hide the compass chevron/arrow
            try {
                java.lang.reflect.Method mRender = locationComponent.getClass().getMethod("setRenderMode", int.class);
                mRender.invoke(locationComponent, 18); // RenderMode.NORMAL = 18
                android.util.Log.d("MorpheLocation", "LocationComponent: setRenderMode(NORMAL) succeeded");
            } catch (Throwable t) {
                android.util.Log.w("MorpheLocation", "Failed to set renderMode on LocationComponent", t);
            }

            // 3. Disable stale state so MapLibre renders the solid blue dot (#4A90E2) instead of grey (#A1B0C0)
            for (Class<?> c = locationComponent.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (f.getType().getName().contains("StaleStateManager")) {
                        try {
                            f.setAccessible(true);
                            Object ssm = f.get(locationComponent);
                            if (ssm != null) {
                                try {
                                    java.lang.reflect.Method mSetEnabled = ssm.getClass().getDeclaredMethod("setEnabled", boolean.class);
                                    mSetEnabled.setAccessible(true);
                                    mSetEnabled.invoke(ssm, false);
                                    android.util.Log.d("MorpheLocation", "StaleStateManager.setEnabled(false) succeeded");
                                } catch (Throwable ignored) {}

                                try {
                                    java.lang.reflect.Field fStale = ssm.getClass().getDeclaredField("isStale");
                                    fStale.setAccessible(true);
                                    fStale.setBoolean(ssm, false);
                                } catch (Throwable ignored) {}

                                try {
                                    for (java.lang.reflect.Field fListener : ssm.getClass().getDeclaredFields()) {
                                        if (fListener.getType().getName().contains("OnLocationStaleListener")) {
                                            fListener.setAccessible(true);
                                            Object listener = fListener.get(ssm);
                                            if (listener != null) {
                                                java.lang.reflect.Method mStaleChange = listener.getClass().getMethod("onStaleStateChange", boolean.class);
                                                mStaleChange.invoke(listener, false);
                                                android.util.Log.d("MorpheLocation", "OnLocationStaleListener.onStaleStateChange(false) succeeded");
                                            }
                                        }
                                    }
                                } catch (Throwable ignored) {}
                            }
                        } catch (Throwable ignored) {}
                    }
                    if (f.getType().getName().contains("LocationComponentOptions")) {
                        try {
                            f.setAccessible(true);
                            Object opts = f.get(locationComponent);
                            if (opts != null) {
                                for (java.lang.reflect.Field of : opts.getClass().getDeclaredFields()) {
                                    if (of.getName().equals("enableStaleState") && of.getType() == boolean.class) {
                                        of.setAccessible(true);
                                        of.setBoolean(opts, false);
                                        android.util.Log.d("MorpheLocation", "LocationComponentOptions.enableStaleState set to false");
                                    }
                                }
                            }
                        } catch (Throwable ignored) {}
                    }
                    // Ensure isLayerReady and isEnabled are true
                    if ((f.getName().equals("isLayerReady") || f.getName().equals("isEnabled")) && f.getType() == boolean.class) {
                        try {
                            f.setAccessible(true);
                            f.setBoolean(locationComponent, true);
                        } catch (Throwable ignored) {}
                    }
                    // Show location layer if hidden
                    if (f.getName().equals("locationLayerController")) {
                        try {
                            f.setAccessible(true);
                            Object layerCtrl = f.get(locationComponent);
                            if (layerCtrl != null) {
                                java.lang.reflect.Method mShow = layerCtrl.getClass().getMethod("show");
                                mShow.invoke(layerCtrl);
                                android.util.Log.d("MorpheLocation", "locationLayerController.show() succeeded");
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }

            // 4. Force location update
            if (loc != null) {
                try {
                    for (java.lang.reflect.Method m : locationComponent.getClass().getMethods()) {
                        if (m.getName().equals("forceLocationUpdate") && m.getParameterTypes().length >= 1
                                && m.getParameterTypes()[0] == android.location.Location.class) {
                            if (m.getParameterTypes().length == 1) {
                                m.invoke(locationComponent, loc);
                            } else if (m.getParameterTypes().length == 2 && m.getParameterTypes()[1] == boolean.class) {
                                m.invoke(locationComponent, loc, false);
                            }
                            android.util.Log.d("MorpheLocation", "LocationComponent.forceLocationUpdate invoked successfully");
                            break;
                        }
                    }
                } catch (Throwable t) {
                    android.util.Log.w("MorpheLocation", "Failed to forceLocationUpdate", t);
                }
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "configureLocationComponent error", t);
        }
    }

    @SuppressLint({"MissingPermission", "NewApi"})
    public static void handleCurrentLocation(Object currentLocMixinObj) {
        if (currentLocMixinObj == null) return;
        try {
            android.util.Log.d("MorpheLocation", "handleCurrentLocation triggered with: " + currentLocMixinObj.getClass().getName());
            Class<?> clazz = currentLocMixinObj.getClass();
            Context context = null;
            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                if (Context.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    context = (Context) f.get(currentLocMixinObj);
                    break;
                }
            }
            if (context == null) {
                android.util.Log.e("MorpheLocation", "Context not found on mixin");
                return;
            }

            final Context finalContext = context;
            final Object finalMixin = currentLocMixinObj;

            // Check runtime permissions
            boolean hasFine = context.checkCallingOrSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION) == android.content.pm.PackageManager.PERMISSION_GRANTED;
            boolean hasCoarse = context.checkCallingOrSelfPermission(android.Manifest.permission.ACCESS_COARSE_LOCATION) == android.content.pm.PackageManager.PERMISSION_GRANTED;
            if (!hasFine && !hasCoarse) {
                android.util.Log.w("MorpheLocation", "Location permission not granted to Google Photos");
                Activity activity = null;
                Context cur = context;
                while (cur instanceof android.content.ContextWrapper) {
                    if (cur instanceof Activity) {
                        activity = (Activity) cur;
                        break;
                    }
                    cur = ((android.content.ContextWrapper) cur).getBaseContext();
                }
                if (activity != null) {
                    final Activity finalAct = activity;
                    new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                        try {
                            android.widget.Toast.makeText(finalAct, "Location permission required for map", android.widget.Toast.LENGTH_SHORT).show();
                            if (android.os.Build.VERSION.SDK_INT >= 23) {
                                finalAct.requestPermissions(new String[]{
                                    android.Manifest.permission.ACCESS_FINE_LOCATION,
                                    android.Manifest.permission.ACCESS_COARSE_LOCATION
                                }, 1001);
                            }
                        } catch (Throwable t) {
                            android.util.Log.e("MorpheLocation", "Failed to request location permissions", t);
                        }
                    });
                }
                return;
            }

            android.location.LocationManager lm = (android.location.LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
            if (lm == null) {
                android.util.Log.e("MorpheLocation", "LocationManager is null");
                return;
            }

            boolean isGpsEnabled = false;
            boolean isNetworkEnabled = false;
            boolean isFusedEnabled = false;
            try {
                isGpsEnabled = lm.isProviderEnabled(android.location.LocationManager.GPS_PROVIDER);
            } catch (Exception ignored) {}
            try {
                isNetworkEnabled = lm.isProviderEnabled(android.location.LocationManager.NETWORK_PROVIDER);
            } catch (Exception ignored) {}
            try {
                if (android.os.Build.VERSION.SDK_INT >= 31) {
                    isFusedEnabled = lm.isProviderEnabled(android.location.LocationManager.FUSED_PROVIDER);
                }
            } catch (Exception ignored) {}

            if (!isGpsEnabled && !isNetworkEnabled && !isFusedEnabled) {
                android.util.Log.w("MorpheLocation", "Location providers are disabled on device");
                new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                    try {
                        android.widget.Toast.makeText(finalContext, "Please enable Location in device settings", android.widget.Toast.LENGTH_SHORT).show();
                    } catch (Throwable ignored) {}
                });
                return;
            }

            // Reset pending flag 'j'
            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                if (f.getType() == boolean.class && f.getName().equals("j")) {
                    try {
                        f.setAccessible(true);
                        f.setBoolean(finalMixin, false);
                    } catch (Exception ignored) {}
                }
            }

            final java.util.concurrent.atomic.AtomicBoolean cameraAnimated = new java.util.concurrent.atomic.AtomicBoolean(false);

            LocationApplier applyLocation = (loc) -> {
                if (loc == null) return;
                sLastLocation = loc;
                android.util.Log.d("MorpheLocation", "Applying location: " + loc.getLatitude() + ", " + loc.getLongitude());

                new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                    try {
                        Object mapObj = findMapObject(finalMixin);
                        if (mapObj == null) {
                            android.util.Log.e("MorpheLocation", "Map object not found on mixin");
                            return;
                        }

                        // Wire custom LocationSource to map if needed
                        android.os.IBinder mapBinder = extractMapBinder(mapObj);
                        if (mapBinder != null) {
                            if (sLocationSource == null) {
                                sLocationSource = new LocationSourceBinder();
                            }
                            if (sAttachedMapObj != mapObj) {
                                sAttachedMapObj = mapObj;
                                sLocationComponent = null;
                                setLocationSource(mapBinder, sLocationSource);
                            }
                            // Always ensure myLocation is enabled on the map binder
                            setMyLocationEnabled(mapBinder, true);
                        }
                        try {
                            for (java.lang.reflect.Method m : mapObj.getClass().getMethods()) {
                                if (m.getName().equals("f") && m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == boolean.class) {
                                    m.invoke(mapObj, true);
                                    android.util.Log.d("MorpheLocation", "Invoked map.f(true)");
                                    break;
                                }
                            }
                        } catch (Throwable ignored) {}

                        // Discover LocationComponent if not already cached
                        if (sLocationComponent == null) {
                            sLocationComponent = findLocationComponent(mapObj, 0, new HashSet<>());
                            if (sLocationComponent == null && finalContext instanceof Activity) {
                                View decor = ((Activity) finalContext).getWindow().getDecorView();
                                sLocationComponent = findLocationComponentFromView(decor, 0, new HashSet<>());
                            }
                            if (sLocationComponent != null) {
                                android.util.Log.d("MorpheLocation", "Discovered LocationComponent: " + sLocationComponent.getClass().getName());
                            } else {
                                android.util.Log.w("MorpheLocation", "LocationComponent not found via mapObj/view traversal");
                            }
                        }

                        if (sLocationComponent != null) {
                            configureLocationComponent(sLocationComponent, loc);
                        }

                        if (sLocationSource != null) {
                            sLocationSource.pushLocation(loc);
                        }

                        // Animate camera once per FAB click
                        if (cameraAnimated.compareAndSet(false, true)) {
                            // Direct MapboxMap camera animation via reflection for smooth, guaranteed re-centering
                            Object mapboxMap = null;
                            if (sLocationComponent != null) {
                                for (Class<?> c = sLocationComponent.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                                    for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                                        if (f.getName().equals("mapboxMap") || f.getType().getName().contains("MapboxMap")) {
                                            try {
                                                f.setAccessible(true);
                                                mapboxMap = f.get(sLocationComponent);
                                                if (mapboxMap != null) break;
                                            } catch (Throwable ignored) {}
                                        }
                                    }
                                    if (mapboxMap != null) break;
                                }
                            }

                            if (mapboxMap != null) {
                                try {
                                    double currentZoom = 14.0d;
                                    try {
                                        java.lang.reflect.Method mGetCam = mapboxMap.getClass().getMethod("getCameraPosition");
                                        Object camPos = mGetCam.invoke(mapboxMap);
                                        if (camPos != null) {
                                            java.lang.reflect.Field fZoom = camPos.getClass().getField("zoom");
                                            double z = fZoom.getDouble(camPos);
                                            if (z > 0.0) {
                                                currentZoom = Math.max(z, 14.0d);
                                            }
                                        }
                                    } catch (Throwable ignored) {}

                                    Class<?> mbLatLngClass = Class.forName("com.mapbox.mapboxsdk.geometry.LatLng");
                                    Object mbLatLng = mbLatLngClass.getConstructor(double.class, double.class)
                                            .newInstance(loc.getLatitude(), loc.getLongitude());

                                    Class<?> mbCamUpdateFactory = Class.forName("com.mapbox.mapboxsdk.camera.CameraUpdateFactory");
                                    java.lang.reflect.Method mNewLatLngZoom = mbCamUpdateFactory.getMethod("newLatLngZoom", mbLatLngClass, double.class);
                                    Object mbCamUpdate = mNewLatLngZoom.invoke(null, mbLatLng, currentZoom);

                                    try {
                                        java.lang.reflect.Method mCancel = mapboxMap.getClass().getMethod("cancelTransitions");
                                        mCancel.invoke(mapboxMap);
                                    } catch (Throwable ignored) {}

                                    Class<?> mbCamUpdateClass = Class.forName("com.mapbox.mapboxsdk.camera.CameraUpdate");
                                    Class<?> mbCancelCallbackClass = Class.forName("com.mapbox.mapboxsdk.maps.MapboxMap$CancelableCallback");
                                    java.lang.reflect.Method mAnimate = mapboxMap.getClass().getMethod("animateCamera", mbCamUpdateClass, int.class, mbCancelCallbackClass);
                                    mAnimate.invoke(mapboxMap, mbCamUpdate, 500, null);
                                    android.util.Log.d("MorpheLocation", "Direct MapboxMap.animateCamera succeeded");
                                } catch (Throwable t) {
                                    android.util.Log.w("MorpheLocation", "Direct MapboxMap animation failed, falling back", t);
                                }
                            }

                            // Direct mapObj animation (via GMS CameraUpdate)
                            try {
                                Class<?> latLngClass = Class.forName("com.google.android.gms.maps.model.LatLng");
                                Object latLng = latLngClass.getConstructor(double.class, double.class)
                                        .newInstance(loc.getLatitude(), loc.getLongitude());

                                Object camUpdate = createCameraUpdate(clazz.getClassLoader(), latLng, 15.0f);
                                if (camUpdate != null) {
                                    boolean animated = false;
                                    // 1. Try animateCamera with duration: t(camUpdate, 500)
                                    for (java.lang.reflect.Method m : mapObj.getClass().getMethods()) {
                                        if ((m.getName().equals("t") || m.getName().equals("animateCamera")) && m.getParameterTypes().length == 2) {
                                            try {
                                                m.setAccessible(true);
                                                m.invoke(mapObj, camUpdate, 500);
                                                android.util.Log.d("MorpheLocation", "Invoked map." + m.getName() + "(camUpdate, 500)");
                                                animated = true;
                                                break;
                                            } catch (Throwable t) {
                                                android.util.Log.w("MorpheLocation", "Failed invoking " + m.getName() + "(camUpdate, 500)", t);
                                            }
                                        }
                                    }
                                    // 2. Try animateCamera without duration: s(camUpdate) or moveCamera: r(camUpdate)
                                    if (!animated) {
                                        for (java.lang.reflect.Method m : mapObj.getClass().getMethods()) {
                                            if ((m.getName().equals("s") || m.getName().equals("animateCamera") || m.getName().equals("r") || m.getName().equals("moveCamera"))
                                                    && m.getParameterTypes().length == 1) {
                                                try {
                                                    m.setAccessible(true);
                                                    m.invoke(mapObj, camUpdate);
                                                    android.util.Log.d("MorpheLocation", "Invoked map." + m.getName() + "(camUpdate)");
                                                    animated = true;
                                                    break;
                                                } catch (Throwable t) {
                                                    android.util.Log.w("MorpheLocation", "Failed invoking " + m.getName() + "(camUpdate)", t);
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    android.util.Log.w("MorpheLocation", "Could not create CameraUpdate object");
                                }
                            } catch (Throwable t) {
                                android.util.Log.w("MorpheLocation", "Failed to animate mapObj camera", t);
                            }

                            // Synchronize FAB active state reliably
                            // Reset 'h' to false first so mixin.b(true) detects the transition
                            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                                if (f.getType() == boolean.class && f.getName().equals("h")) {
                                    try {
                                        f.setAccessible(true);
                                        f.setBoolean(finalMixin, false);
                                    } catch (Throwable ignored) {}
                                }
                            }

                            for (java.lang.reflect.Method m : clazz.getDeclaredMethods()) {
                                if (m.getName().equals("b") && m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == boolean.class) {
                                    try {
                                        m.setAccessible(true);
                                        m.invoke(finalMixin, true);
                                        android.util.Log.d("MorpheLocation", "Invoked mixin.b(true)");
                                    } catch (Throwable ignored) {}
                                    break;
                                }
                            }

                            // Ensure 'h' is true
                            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                                if (f.getType() == boolean.class && f.getName().equals("h")) {
                                    try {
                                        f.setAccessible(true);
                                        f.setBoolean(finalMixin, true);
                                    } catch (Throwable ignored) {}
                                }
                                // Directly tint FloatingActionButton drawable if present
                                if (f.getName().equals("m")) {
                                    try {
                                        f.setAccessible(true);
                                        Object fab = f.get(finalMixin);
                                        if (fab instanceof android.widget.ImageView) {
                                            android.widget.ImageView fabView = (android.widget.ImageView) fab;
                                            if (fabView.getDrawable() != null) {
                                                fabView.getDrawable().mutate().setTint(0xFF1A73E8);
                                                android.util.Log.d("MorpheLocation", "Directly tinted FAB drawable to active blue");
                                            }
                                        }
                                    } catch (Throwable ignored) {}
                                }
                            }
                        }
                    } catch (Throwable t) {
                        android.util.Log.e("MorpheLocation", "Error applying location to map", t);
                    }
                });
            };

            // 1. Try last known location first for immediate response
            android.location.Location lastLoc = null;
            if (android.os.Build.VERSION.SDK_INT >= 31 && isFusedEnabled) {
                try {
                    lastLoc = lm.getLastKnownLocation(android.location.LocationManager.FUSED_PROVIDER);
                } catch (Exception ignored) {}
            }
            if (lastLoc == null && isGpsEnabled) {
                try {
                    lastLoc = lm.getLastKnownLocation(android.location.LocationManager.GPS_PROVIDER);
                } catch (Exception ignored) {}
            }
            if (lastLoc == null && isNetworkEnabled) {
                try {
                    lastLoc = lm.getLastKnownLocation(android.location.LocationManager.NETWORK_PROVIDER);
                } catch (Exception ignored) {}
            }
            if (lastLoc == null) {
                try {
                    lastLoc = lm.getLastKnownLocation(android.location.LocationManager.PASSIVE_PROVIDER);
                } catch (Exception ignored) {}
            }
            if (lastLoc == null) {
                lastLoc = sLastLocation;
            }

            if (lastLoc != null) {
                android.util.Log.d("MorpheLocation", "Found lastKnownLocation: " + lastLoc);
                applyLocation.onLocation(lastLoc);
            }

            // 2. Request fresh location updates and continuous tracking
            final boolean finalGps = isGpsEnabled;
            final boolean finalNetwork = isNetworkEnabled;
            final boolean finalFused = isFusedEnabled;
            new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                try {
                    if (sContinuousListener == null) {
                        sContinuousListener = new android.location.LocationListener() {
                            @Override
                            public void onLocationChanged(android.location.Location location) {
                                if (location == null) return;
                                sLastLocation = location;
                                LocationSourceBinder src = sLocationSource;
                                if (src != null) {
                                    src.pushLocation(location);
                                }
                                Object lc = sLocationComponent;
                                if (lc != null) {
                                    configureLocationComponent(lc, location);
                                }
                            }
                            @Override public void onStatusChanged(String provider, int status, android.os.Bundle extras) {}
                            @Override public void onProviderEnabled(String provider) {}
                            @Override public void onProviderDisabled(String provider) {}
                        };
                        if (android.os.Build.VERSION.SDK_INT >= 31 && finalFused) {
                            try {
                                lm.requestLocationUpdates(android.location.LocationManager.FUSED_PROVIDER, 1000L, 1.0f, sContinuousListener, android.os.Looper.getMainLooper());
                            } catch (Throwable ignored) {}
                        }
                        if (finalGps) {
                            try {
                                lm.requestLocationUpdates(android.location.LocationManager.GPS_PROVIDER, 1000L, 1.0f, sContinuousListener, android.os.Looper.getMainLooper());
                            } catch (Throwable ignored) {}
                        }
                        if (finalNetwork) {
                            try {
                                lm.requestLocationUpdates(android.location.LocationManager.NETWORK_PROVIDER, 1000L, 1.0f, sContinuousListener, android.os.Looper.getMainLooper());
                            } catch (Throwable ignored) {}
                        }
                        android.util.Log.d("MorpheLocation", "Registered continuous LocationListener for map tracking");
                    }
                } catch (Throwable t) {
                    android.util.Log.w("MorpheLocation", "Failed to register continuous location updates", t);
                }
            });

            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
                if (android.os.Build.VERSION.SDK_INT >= 31 && finalFused) {
                    try {
                        lm.getCurrentLocation(android.location.LocationManager.FUSED_PROVIDER, null, context.getMainExecutor(), loc -> applyLocation.onLocation(loc));
                    } catch (Exception ignored) {}
                }
                if (isGpsEnabled) {
                    try {
                        lm.getCurrentLocation(android.location.LocationManager.GPS_PROVIDER, null, context.getMainExecutor(), loc -> applyLocation.onLocation(loc));
                    } catch (Exception ignored) {}
                }
                if (isNetworkEnabled) {
                    try {
                        lm.getCurrentLocation(android.location.LocationManager.NETWORK_PROVIDER, null, context.getMainExecutor(), loc -> applyLocation.onLocation(loc));
                    } catch (Exception ignored) {}
                }
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "handleCurrentLocation exception", t);
        }
    }
}
