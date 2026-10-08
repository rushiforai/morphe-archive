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
                if (isGooglePhotos(context)) {
                    checkMicroGLocationPermission(context);
                }
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

    private static final String PREF_IGNORE_MICROG_LOCATION_PROMPT = "morphe_ignore_microg_location_prompt";
    private static final String MORPHE_PREFERENCES_NAME = "morphe_preferences";

    /**
     * Checks whether MicroG / GmsCore currently has location permissions granted.
     */
    public static boolean isMicroGLocationGranted(Context context) {
        if (context == null) context = Utils.getContext();
        if (context == null) return true;
        try {
            PackageManager pm = context.getPackageManager();
            boolean fine = pm.checkPermission(android.Manifest.permission.ACCESS_FINE_LOCATION, GMS_CORE_PACKAGE_NAME) == PackageManager.PERMISSION_GRANTED;
            boolean coarse = pm.checkPermission(android.Manifest.permission.ACCESS_COARSE_LOCATION, GMS_CORE_PACKAGE_NAME) == PackageManager.PERMISSION_GRANTED;
            return fine || coarse;
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean isMicroGLocationPromptIgnored(Context context) {
        if (context == null) context = Utils.getContext();
        if (context == null) return false;
        try {
            return context.getSharedPreferences(MORPHE_PREFERENCES_NAME, Context.MODE_PRIVATE)
                    .getBoolean(PREF_IGNORE_MICROG_LOCATION_PROMPT, false);
        } catch (Throwable t) {
            return false;
        }
    }

    public static void setMicroGLocationPromptIgnored(Context context, boolean ignored) {
        if (context == null) context = Utils.getContext();
        if (context == null) return;
        try {
            context.getSharedPreferences(MORPHE_PREFERENCES_NAME, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(PREF_IGNORE_MICROG_LOCATION_PROMPT, ignored)
                    .apply();
        } catch (Throwable ignoredException) {}
    }

    private static void checkMicroGLocationPermission(Activity context) {
        try {
            if (isMicroGLocationGranted(context)) {
                return;
            }
            if (isMicroGLocationPromptIgnored(context)) {
                Logger.printInfo(() -> "MicroG location permission not granted, but user previously selected Ignore");
                return;
            }

            Utils.runOnMainThreadDelayed(() -> {
                try {
                    if (context.isFinishing()) return;
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1 && context.isDestroyed()) return;

                    Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                            context,
                            "MicroG Location Permission",
                            "MicroG requires Location permission to display photo location maps and extra info.\n\nWithout this permission, location maps in Google Photos are temporarily disabled to prevent crashes.",
                            null,
                            "Open Settings",
                            () -> {
                                try {
                                    Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                                    intent.setData(Uri.fromParts("package", GMS_CORE_PACKAGE_NAME, null));
                                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                    context.startActivity(intent);
                                } catch (Throwable t) {
                                    Logger.printException(() -> "Failed to open MicroG settings", t);
                                }
                            },
                            null,
                            "Ignore",
                            () -> {
                                Logger.printInfo(() -> "User selected Ignore on MicroG location prompt");
                                setMicroGLocationPromptIgnored(context, true);
                            },
                            true
                    );

                    Dialog dialog = dialogPair.first;
                    dialog.setCancelable(true);
                    Utils.showDialog(context, dialog);
                } catch (Throwable t) {
                    Logger.printException(() -> "Failed to display MicroG location permission dialog", t);
                }
            }, 1000);
        } catch (Throwable t) {
            Logger.printException(() -> "checkMicroGLocationPermission error", t);
        }
    }

    /**
     * Interceptor for photos.killswitch_info_panel_map.
     * When MicroG lacks location permission, killswitches the map to gracefully
     * prevent crash when pulling up photo details.
     */
    public static boolean isInfoPanelMapKillswitched(boolean originalValue) {
        if (originalValue) {
            return true;
        }
        if (!isMicroGLocationGranted(Utils.getContext())) {
            Logger.printInfo(() -> "MicroG lacks location permission: killswitching Info Panel map to prevent crash");
            return true;
        }
        return false;
    }

    private interface LocationApplier {
        void onLocation(android.location.Location loc);
    }

    private static volatile Object sAttachedMapObj;
    private static volatile LocationSourceBinder sLocationSource;
    private static volatile android.location.Location sLastLocation;
    private static android.location.LocationListener sContinuousListener;
    private static volatile Object sMapExploreController;
    private static volatile java.lang.ref.WeakReference<Object> sCurrentMixinRef;
    private static final java.util.concurrent.atomic.AtomicBoolean sIsLocatingAnimation = new java.util.concurrent.atomic.AtomicBoolean(false);
    private static volatile Object sAppCameraIdleListener;
    private static volatile Object sAppMapClickListener;
    private static volatile Object sGoogleMapDelegate;
    private static final java.util.Set<Object> sWrappedMapObjects = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static final java.util.concurrent.atomic.AtomicBoolean sInitialSelectionCleared = new java.util.concurrent.atomic.AtomicBoolean(false);

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

    private static boolean isGoogleMapDelegateBinder(android.os.IBinder b) {
        if (b == null) return false;
        try {
            String desc = b.getInterfaceDescriptor();
            if (desc != null && (desc.equals("com.google.android.gms.maps.internal.IGoogleMapDelegate")
                    || desc.endsWith("IGoogleMapDelegate"))) {
                return true;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static boolean isValidBinderCandidate(android.os.IBinder b) {
        if (b == null) return false;
        try {
            String desc = b.getInterfaceDescriptor();
            if (desc != null && (desc.contains("UiSettings") || desc.contains("Projection")
                    || desc.contains("Panorama") || desc.contains("LocationSource"))) {
                return false;
            }
        } catch (Throwable ignored) {}
        return true;
    }

    private static android.os.IBinder extractMapBinder(Object mapObj) {
        if (mapObj == null) return null;
        try {
            android.os.IBinder fallback = null;
            for (Class<?> clazz = mapObj.getClass(); clazz != null && clazz != Object.class; clazz = clazz.getSuperclass()) {
                for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(mapObj);
                    if (val == null) continue;

                    if (val instanceof android.os.IInterface) {
                        android.os.IBinder b = ((android.os.IInterface) val).asBinder();
                        if (isGoogleMapDelegateBinder(b)) {
                            android.util.Log.d("MorpheLocation", "Found IGoogleMapDelegate directly: " + b);
                            return b;
                        }
                        if (fallback == null && isValidBinderCandidate(b)) fallback = b;
                    } else if (val instanceof android.os.IBinder) {
                        android.os.IBinder b = (android.os.IBinder) val;
                        if (isGoogleMapDelegateBinder(b)) {
                            android.util.Log.d("MorpheLocation", "Found IGoogleMapDelegate IBinder: " + b);
                            return b;
                        }
                        if (fallback == null && isValidBinderCandidate(b)) fallback = b;
                    } else {
                        try {
                            java.lang.reflect.Field mRemote = val.getClass().getDeclaredField("mRemote");
                            mRemote.setAccessible(true);
                            Object remoteObj = mRemote.get(val);
                            if (remoteObj instanceof android.os.IBinder) {
                                android.os.IBinder b = (android.os.IBinder) remoteObj;
                                if (isGoogleMapDelegateBinder(b)) {
                                    android.util.Log.d("MorpheLocation", "Found IGoogleMapDelegate in mRemote: " + b);
                                    return b;
                                }
                                if (fallback == null && isValidBinderCandidate(b)) fallback = b;
                            }
                        } catch (Throwable ignored) {}

                        for (java.lang.reflect.Field sf : val.getClass().getDeclaredFields()) {
                            sf.setAccessible(true);
                            Object sval = sf.get(val);
                            if (sval instanceof android.os.IBinder) {
                                android.os.IBinder b = (android.os.IBinder) sval;
                                if (isGoogleMapDelegateBinder(b)) {
                                    android.util.Log.d("MorpheLocation", "Found IGoogleMapDelegate in subfield: " + b);
                                    return b;
                                }
                                if (fallback == null && isValidBinderCandidate(b)) fallback = b;
                            } else if (sval instanceof android.os.IInterface) {
                                android.os.IBinder b = ((android.os.IInterface) sval).asBinder();
                                if (isGoogleMapDelegateBinder(b)) {
                                    android.util.Log.d("MorpheLocation", "Found IGoogleMapDelegate in subfield IInterface: " + b);
                                    return b;
                                }
                                if (fallback == null && isValidBinderCandidate(b)) fallback = b;
                            }
                        }
                    }
                }
            }
            if (fallback != null) {
                android.util.Log.w("MorpheLocation", "Using fallback binder: " + fallback);
                return fallback;
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "Error extracting map binder", t);
        }
        return null;
    }

    private static Object extractGoogleMapDelegate(Object mapObj) {
        if (mapObj == null) return null;
        try {
            for (Class<?> clazz = mapObj.getClass(); clazz != null && clazz != Object.class; clazz = clazz.getSuperclass()) {
                for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(mapObj);
                    if (val == null) continue;
                    if (val instanceof android.os.IInterface) {
                        android.os.IBinder b = ((android.os.IInterface) val).asBinder();
                        if (isGoogleMapDelegateBinder(b)) {
                            return val;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static Object getMapClickListener() {
        if (sAppMapClickListener != null) return sAppMapClickListener;
        Object delegate = sGoogleMapDelegate;
        if (delegate == null && sAttachedMapObj != null) {
            delegate = extractGoogleMapDelegate(sAttachedMapObj);
            if (delegate != null) sGoogleMapDelegate = delegate;
        }
        if (delegate != null) {
            for (Class<?> c = delegate.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (f.getName().contains("mapClickListener") || f.getName().contains("MapClick")) {
                        try {
                            f.setAccessible(true);
                            Object listener = f.get(delegate);
                            if (listener != null) {
                                sAppMapClickListener = listener;
                                android.util.Log.d("MorpheLocation", "Discovered mapClickListener on delegate: " + listener);
                                return listener;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }
        return null;
    }

    private static void wrapGoogleMapIfNeeded(Object mapObj) {
        if (mapObj == null || sWrappedMapObjects.contains(mapObj)) return;
        sWrappedMapObjects.add(mapObj);
        try {
            Object delegate = extractGoogleMapDelegate(mapObj);
            if (delegate != null) {
                sGoogleMapDelegate = delegate;
                android.util.Log.d("MorpheLocation", "Captured sGoogleMapDelegate: " + delegate.getClass().getName());
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "Failed to wrap GoogleMap delegate", t);
        }
    }

    public static void clearMarkerSelection() {
        // No-op: Marker selection is natively managed by Google Photos.
        // Firing synthetic onMapClick at the camera target coordinates actively selects/locks
        // the marker, causing a purple circle selection ring and switching off aggregate viewport mode.
    }

    public static int adjustScrollPosition(int pos) {
        if (pos <= 1) {
            android.util.Log.d("MorpheLocation", "adjustScrollPosition: adjusting pos " + pos + " to 0 (top header)");
            return 0;
        }
        return pos;
    }

    public static int adjustScrollOffset(int pos, int offset) {
        if (pos <= 1) {
            android.util.Log.d("MorpheLocation", "adjustScrollOffset: resetting offset " + offset + " to 0 for pos " + pos);
            return 0;
        }
        return offset;
    }

    public static int adjustScrollTargetPosition(int pos) {
        return adjustScrollPosition(pos);
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
            if ((m.getName().equals("t") || m.getName().equals("s") || m.getName().equals("r") || m.getName().equals("v") || m.getName().equals("u"))
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

    private static volatile Class<?> sCachedCameraUpdateFactoryClass = null;

    private static Object createCameraUpdate(ClassLoader cl, Object latLng, float zoom) {
        if (latLng == null) return null;
        Class<?> latLngClass = latLng.getClass();

        if (sCachedCameraUpdateFactoryClass != null) {
            Object cu = invokeCameraUpdateFactory(sCachedCameraUpdateFactoryClass, latLng, zoom, latLngClass);
            if (cu != null) return cu;
        }

        String[] knownClasses = new String[]{
            "bqyk", "defpackage.bqyk",
            "bqll", "defpackage.bqll",
            "bqbb", "defpackage.bqbb",
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
                    Object cu = invokeCameraUpdateFactory(c, latLng, zoom, latLngClass);
                    if (cu != null) {
                        sCachedCameraUpdateFactoryClass = c;
                        return cu;
                    }
                }
            } catch (Throwable ignored) {}
        }

        // Dynamic DEX scanning fallback if class name changed in newer/older versions
        if (cl != null) {
            try {
                Class<?> current = cl.getClass();
                java.lang.reflect.Field pathListField = null;
                while (current != null && current != Object.class) {
                    try {
                        pathListField = current.getDeclaredField("pathList");
                        break;
                    } catch (NoSuchFieldException e) {
                        current = current.getSuperclass();
                    }
                }
                if (pathListField != null) {
                    pathListField.setAccessible(true);
                    Object pathList = pathListField.get(cl);
                    java.lang.reflect.Field dexElementsField = pathList.getClass().getDeclaredField("dexElements");
                    dexElementsField.setAccessible(true);
                    Object[] dexElements = (Object[]) dexElementsField.get(pathList);
                    for (Object element : dexElements) {
                        java.lang.reflect.Field dexFileField = element.getClass().getDeclaredField("dexFile");
                        dexFileField.setAccessible(true);
                        dalvik.system.DexFile dexFile = (dalvik.system.DexFile) dexFileField.get(element);
                        if (dexFile != null) {
                            java.util.Enumeration<String> entries = dexFile.entries();
                            while (entries.hasMoreElements()) {
                                String className = entries.nextElement();
                                int dotIdx = className.lastIndexOf('.');
                                String simpleName = dotIdx >= 0 ? className.substring(dotIdx + 1) : className;
                                if (simpleName.length() <= 4 || simpleName.endsWith("CameraUpdateFactory")) {
                                    try {
                                        Class<?> candidate = cl.loadClass(className);
                                        Object cu = invokeCameraUpdateFactory(candidate, latLng, zoom, latLngClass);
                                        if (cu != null) {
                                            sCachedCameraUpdateFactoryClass = candidate;
                                            android.util.Log.d("MorpheLocation", "Discovered CameraUpdateFactory dynamically: " + className);
                                            return cu;
                                        }
                                    } catch (Throwable ignored) {}
                                }
                            }
                        }
                    }
                }
            } catch (Throwable t) {
                android.util.Log.w("MorpheLocation", "Dynamic CameraUpdateFactory scan failed", t);
            }
        }

        return null;
    }

    private static Object invokeCameraUpdateFactory(Class<?> c, Object latLng, float zoom, Class<?> latLngClass) {
        try {
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
        } catch (Throwable ignored) {}
        return null;
    }

    private static Object findMapExploreController(Object mixinObj) {
        if (mixinObj == null) return null;
        try {
            Class<?> mixinClass = mixinObj.getClass();
            Context context = null;
            for (java.lang.reflect.Field f : mixinClass.getDeclaredFields()) {
                if (Context.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    context = (Context) f.get(mixinObj);
                    break;
                }
            }
            if (context == null) return null;
            Activity activity = null;
            Context cur = context;
            while (cur instanceof android.content.ContextWrapper) {
                if (cur instanceof Activity) {
                    activity = (Activity) cur;
                    break;
                }
                cur = ((android.content.ContextWrapper) cur).getBaseContext();
            }
            if (activity == null) return null;

            for (Class<?> c = activity.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    f.setAccessible(true);
                    Object val = f.get(activity);
                    if (val != null) {
                        String valCls = val.getClass().getName().toLowerCase(Locale.ROOT);
                        if (valCls.contains("mapexplore")) {
                            android.util.Log.d("MorpheLocation", "Found MapExploreController by name: " + f.getName() + " (" + val.getClass().getName() + ")");
                            return val;
                        }
                        try {
                            val.getClass().getDeclaredMethod("ba");
                            android.util.Log.d("MorpheLocation", "Found MapExploreController in field: " + f.getName() + " (" + val.getClass().getName() + ")");
                            return val;
                        } catch (NoSuchMethodException ignored) {}
                    }
                }
            }

            try {
                Class<?> faClass = Class.forName("androidx.fragment.app.FragmentActivity");
                if (faClass.isInstance(activity)) {
                    java.lang.reflect.Method mGetFM = faClass.getMethod("getSupportFragmentManager");
                    Object fm = mGetFM.invoke(activity);
                    if (fm != null) {
                        java.lang.reflect.Method mGetFrags = fm.getClass().getMethod("getFragments");
                        java.util.List<?> frags = (java.util.List<?>) mGetFrags.invoke(fm);
                        if (frags != null) {
                            for (Object frag : frags) {
                                if (frag != null && frag.getClass().getName().toLowerCase(Locale.ROOT).contains("mapexplore")) {
                                    android.util.Log.d("MorpheLocation", "Found MapExplore fragment: " + frag.getClass().getName());
                                    return frag;
                                }
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {}
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "Error finding MapExploreController", t);
        }
        return null;
    }

    private static void refreshPhotosForCurrentBounds(Object controller) {
        // No-op: Photos updates viewport bounds query via onCameraIdle natively.
        // Calling obfuscated methods (ba) in 7.95 causes UI state corruption and blanks the header.
    }

    // Set to true after the first field dump so we only dump once.
    private static final java.util.concurrent.atomic.AtomicBoolean sDumpedGoogleMapImplFields =
            new java.util.concurrent.atomic.AtomicBoolean(false);

    /**
     * Fires the GMS OnCameraIdleListener that Google Photos registered via
     * IGoogleMapDelegate.setOnCameraIdleListener (transaction 32 on GoogleMapImpl).
     *
     * KEY: sGoogleMapDelegate is a client-side IInterface proxy. The OnCameraIdleListener is
     * stored on the SERVER side — MicroG's GoogleMapImpl, which is the Binder itself.
     * Since MicroG runs in-process, sGoogleMapDelegate.asBinder() IS the GoogleMapImpl object,
     * and we can walk its fields directly.
     *
     * We walk the fields of GoogleMapImpl looking for any stored IInterface / IBinder whose
     * interface descriptor contains "CameraIdle" and call onCameraIdle() on it.
     *
     * Fallback: call onCameraIdle() as a named method directly on GoogleMapImpl itself
     * (MicroG might dispatch internally without storing as a named binder field).
     */
    private static final android.os.Handler sCameraIdleHandler = new android.os.Handler(android.os.Looper.getMainLooper());
    private static final Runnable sCameraIdleRunnable = () -> doTriggerGmsCameraIdle();

    private static void triggerGmsCameraIdle() {
        sCameraIdleHandler.removeCallbacks(sCameraIdleRunnable);
        sCameraIdleHandler.postDelayed(sCameraIdleRunnable, 100);
    }

    private static void doTriggerGmsCameraIdle() {
        Object delegate = sGoogleMapDelegate;
        if (delegate == null) return;
        try {
            // Step 1: Obtain the server-side GoogleMapImpl.
            // sGoogleMapDelegate is a client IInterface proxy. asBinder() returns the actual
            // GoogleMapImpl Binder object (same process, so no BinderProxy intermediary).
            android.os.IBinder serverBinder = null;
            if (delegate instanceof android.os.IInterface) {
                serverBinder = ((android.os.IInterface) delegate).asBinder();
            } else if (delegate instanceof android.os.IBinder) {
                serverBinder = (android.os.IBinder) delegate;
            }

            android.util.Log.d("MorpheLocation",
                    "triggerGmsCameraIdle: serverBinder=" +
                    (serverBinder != null ? serverBinder.getClass().getName() : "null") +
                    " isLocalBinder=" + (serverBinder instanceof android.os.Binder));

            // Diagnostic: dump GoogleMapImpl fields once to identify the listener field name.
            if (serverBinder != null && sDumpedGoogleMapImplFields.compareAndSet(false, true)) {
                StringBuilder sb = new StringBuilder("GoogleMapImpl fields: ");
                for (Class<?> c = serverBinder.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                    for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                        f.setAccessible(true);
                        Object val;
                        try { val = f.get(serverBinder); } catch (Throwable e) { val = "<err>"; }
                        sb.append(f.getName()).append("=").append(val == null ? "null" : val.getClass().getSimpleName()).append(", ");
                    }
                }
                android.util.Log.d("MorpheLocation", sb.toString());
            }

            // Step 2: Walk GoogleMapImpl's fields (server side) for the stored listener.
            if (serverBinder != null && searchAndFireCameraIdleListener(serverBinder)) return;

            // Step 3: Also try delegate proxy's fields in case it's a local Binder subclass itself.
            if (delegate != serverBinder && searchAndFireCameraIdleListener(delegate)) return;

            // Step 4: Last resort — call onCameraIdle() directly on GoogleMapImpl via reflection.
            // MicroG may handle it internally by dispatching to all registered listeners.
            if (serverBinder != null) {
                for (java.lang.reflect.Method m : serverBinder.getClass().getDeclaredMethods()) {
                    if ("onCameraIdle".equals(m.getName()) && m.getParameterTypes().length == 0) {
                        m.setAccessible(true);
                        m.invoke(serverBinder);
                        android.util.Log.d("MorpheLocation",
                                "triggerGmsCameraIdle: called onCameraIdle() directly on GoogleMapImpl");
                        return;
                    }
                }
                // Also check superclasses
                for (Class<?> c = serverBinder.getClass().getSuperclass(); c != null && c != Object.class; c = c.getSuperclass()) {
                    for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                        if ("onCameraIdle".equals(m.getName()) && m.getParameterTypes().length == 0) {
                            m.setAccessible(true);
                            m.invoke(serverBinder);
                            android.util.Log.d("MorpheLocation",
                                    "triggerGmsCameraIdle: called onCameraIdle() on superclass " + c.getSimpleName());
                            return;
                        }
                    }
                }
            }

            android.util.Log.w("MorpheLocation",
                    "triggerGmsCameraIdle: could not fire camera-idle event");
        } catch (Throwable t) {
            android.util.Log.e("MorpheLocation", "triggerGmsCameraIdle failed", t);
        }
    }

    /**
     * Walks obj's fields (and superclass fields) looking for any stored IInterface/IBinder
     * whose interface descriptor contains "cameraidle" (case-insensitive), then invokes
     * onCameraIdle() on it via reflection or Binder transaction.
     *
     * @return true if successfully invoked, false if not found
     */
    private static boolean searchAndFireCameraIdleListener(Object obj) {
        for (Class<?> c = obj.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                f.setAccessible(true);
                Object val;
                try { val = f.get(obj); } catch (Throwable ignored) { continue; }
                if (val == null) continue;

                android.os.IBinder binder = null;
                if (val instanceof android.os.IBinder) {
                    binder = (android.os.IBinder) val;
                } else if (val instanceof android.os.IInterface) {
                    binder = ((android.os.IInterface) val).asBinder();
                }

                if (binder != null) {
                    String descriptor = null;
                    try { descriptor = binder.getInterfaceDescriptor(); } catch (Throwable ignored) {}
                    if (descriptor != null && descriptor.toLowerCase().contains("cameraidle")) {
                        android.util.Log.d("MorpheLocation",
                                "searchAndFire: found CameraIdle listener in field " + f.getName() +
                                " descriptor=" + descriptor + " on " + c.getSimpleName());
                        // Try direct reflection first
                        try {
                            java.lang.reflect.Method m = val.getClass().getMethod("onCameraIdle");
                            m.invoke(val);
                            android.util.Log.d("MorpheLocation", "searchAndFire: invoked via reflection");
                            return true;
                        } catch (NoSuchMethodException | IllegalAccessException | java.lang.reflect.InvocationTargetException ignored) {}
                        // Try binder transaction (code 1 = first method = onCameraIdle)
                        try {
                            android.os.Parcel data = android.os.Parcel.obtain();
                            android.os.Parcel reply = android.os.Parcel.obtain();
                            try {
                                data.writeInterfaceToken(descriptor);
                                binder.transact(1, data, reply, 0);
                                reply.readException();
                                android.util.Log.d("MorpheLocation", "searchAndFire: invoked via transact(1)");
                            } finally {
                                data.recycle();
                                reply.recycle();
                            }
                            return true;
                        } catch (Throwable t) {
                            android.util.Log.w("MorpheLocation", "searchAndFire: transact failed", t);
                        }
                    }
                }
            }
        }
        return false;
    }


    public static void onCurrentLocationMixinTintUpdated(Object mixinObj, boolean active) {
        if (!active) {
            StackTraceElement[] stack = Thread.currentThread().getStackTrace();
            for (StackTraceElement elem : stack) {
                if ("onClick".equals(elem.getMethodName())) {
                    android.util.Log.d("MorpheLocation", "CurrentLocationMixin.b(false) invoked from onClick! Redirecting to handleCurrentLocation()");
                    handleCurrentLocation(mixinObj);
                    return;
                }
            }
        }
    }

    public static void initMapLocation(Object mixinObj) {
        if (mixinObj == null) return;
        try {
            if (!isMicroGLocationGranted(Utils.getContext())) {
                android.util.Log.d("MorpheLocation", "initMapLocation skipped: MicroG location permission not granted");
                return;
            }
            android.util.Log.d("MorpheLocation", "initMapLocation called for: " + mixinObj.getClass().getName());
            sCurrentMixinRef = new java.lang.ref.WeakReference<>(mixinObj);
            sInitialSelectionCleared.set(false);
            if (sMapExploreController == null) {
                sMapExploreController = findMapExploreController(mixinObj);
            }

            final Object finalMixin = mixinObj;
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                int attempts = 0;
                @Override
                public void run() {
                    try {
                        Object mapObj = findMapObject(finalMixin);
                        if (mapObj != null) {
                            android.util.Log.d("MorpheLocation", "initMapLocation: mapObj found on attempt " + attempts);
                            wrapGoogleMapIfNeeded(mapObj);
                            android.os.IBinder mapBinder = extractMapBinder(mapObj);
                            if (mapBinder != null) {
                                if (sLocationSource == null) {
                                    sLocationSource = new LocationSourceBinder();
                                }
                                if (sAttachedMapObj != mapObj) {
                                    sAttachedMapObj = mapObj;
                                    setLocationSource(mapBinder, sLocationSource);
                                }
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

            if (!isMicroGLocationGranted(context)) {
                android.util.Log.w("MorpheLocation", "Location permission not granted to MicroG");
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
                    checkMicroGLocationPermission(activity);
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

            sCurrentMixinRef = new java.lang.ref.WeakReference<>(currentLocMixinObj);
            sIsLocatingAnimation.set(true);
            if (sMapExploreController == null) {
                sMapExploreController = findMapExploreController(currentLocMixinObj);
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

            // Reset 'h' to false immediately so click is never swallowed as a toggle-off
            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                if (f.getType() == boolean.class && f.getName().equals("h")) {
                    try {
                        f.setAccessible(true);
                        f.setBoolean(finalMixin, false);
                    } catch (Throwable ignored) {}
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
                        wrapGoogleMapIfNeeded(mapObj);

                        // Wire custom LocationSource to map if needed
                        android.os.IBinder mapBinder = extractMapBinder(mapObj);
                        if (mapBinder != null) {
                            if (sLocationSource == null) {
                                sLocationSource = new LocationSourceBinder();
                            }
                            if (sAttachedMapObj != mapObj) {
                                sAttachedMapObj = mapObj;
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

                        if (sLocationSource != null) {
                            sLocationSource.pushLocation(loc);
                        }

                        // Animate camera once per FAB click
                        if (cameraAnimated.compareAndSet(false, true)) {
                            try {
                                Class<?> latLngClass = Class.forName("com.google.android.gms.maps.model.LatLng", true, clazz.getClassLoader());
                                Object latLng = latLngClass.getConstructor(double.class, double.class)
                                        .newInstance(loc.getLatitude(), loc.getLongitude());

                                Object camUpdate = createCameraUpdate(clazz.getClassLoader(), latLng, 15.0f);
                                if (camUpdate != null) {
                                    boolean animated = false;
                                    Class<?> cuClass = camUpdate.getClass();
                                    for (java.lang.reflect.Method m : mapObj.getClass().getMethods()) {
                                        Class<?>[] pts = m.getParameterTypes();
                                        if (pts.length == 2 && (pts[0].isAssignableFrom(cuClass) || cuClass.isAssignableFrom(pts[0]))
                                                && (pts[1] == int.class || pts[1] == Integer.class)) {
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
                                    if (!animated) {
                                        for (java.lang.reflect.Method m : mapObj.getClass().getMethods()) {
                                            Class<?>[] pts = m.getParameterTypes();
                                            if (pts.length == 1 && (pts[0].isAssignableFrom(cuClass) || cuClass.isAssignableFrom(pts[0]))) {
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
                                }
                            } catch (Throwable t) {
                                android.util.Log.w("MorpheLocation", "Camera animation failed", t);
                            }

                            // Trigger camera idle fallback after animation time in case camera was already near target
                            sCameraIdleHandler.removeCallbacks(sCameraIdleRunnable);
                            sCameraIdleHandler.postDelayed(sCameraIdleRunnable, 600);

                            // Synchronize FAB active state reliably
                            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
                                if (f.getType() == boolean.class && f.getName().equals("h")) {
                                    try {
                                        f.setAccessible(true);
                                        f.setBoolean(finalMixin, true);
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

                            // Directly tint FloatingActionButton drawable if present
                            for (java.lang.reflect.Field f : clazz.getDeclaredFields()) {
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

                            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
                                sIsLocatingAnimation.set(false);
                            }, 600);
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
                                if (!cameraAnimated.get()) {
                                    applyLocation.onLocation(location);
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
