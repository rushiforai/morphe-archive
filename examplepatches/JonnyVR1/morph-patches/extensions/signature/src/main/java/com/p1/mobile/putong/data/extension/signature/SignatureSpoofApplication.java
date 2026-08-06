package com.p1.mobile.putong.data.extension.signature;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Parcel;
import android.util.Base64;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;

/**
 * Signature spoofing Content Provider that intercepts PackageManager signature queries.
 * 
 * Content Providers are instantiated very early in the app lifecycle, before Application.onCreate().
 * This allows us to hook the PackageManager before Maps SDK or other services initialize.
 * 
 * This class hooks into the Android framework to return the original Tantan signing
 * certificate when any code queries the app's signature. This allows Google Maps
 * and other signature-dependent services to work correctly after the APK is re-signed.
 * 
 * Implementation based on:
 * - https://github.com/L-JINBIN/ApkSignatureKiller
 * - https://github.com/hoo-dles/morphe-patches
 * - https://github.com/rushiranpise/morphe-patches
 */
public class SignatureSpoofApplication extends ContentProvider {
    private static final String TAG = "SignatureSpoof";
    private static final int GET_SIGNATURES = 0x00000040;
    private static final int GET_SIGNING_CERTIFICATES = 0x08000000;
    private static volatile boolean initialized = false;
    
    // Original Tantan certificate (SHA-1: 71:5B:AB:0F:36:33:95:FE:34:D1:87:68:4B:0E:F7:71:A9:D4:00:F0)
    // Extracted from: tantan+-+Global+Dating+App_7.2.7_APKPure.xapk
    private static final String ORIGINAL_SIGNATURE_BASE64 = 
        "MIIDazCCAlOgAwIBAgIEXrmQTjANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJjbjEQMA4GA1UECBMH" +
        "YmVpamluZzEQMA4GA1UEBxMHYmVpamluZzEPMA0GA1UEChMGemhpd2VuMQ8wDQYDVQQLEwZ6aGl3ZW4x" +
        "EDAOBgNVBAMTB3R0dHJpYmUwIBcNMjQwODE1MDgzNTI1WhgPMjA1MjAxMDEwODM1MjVaMGUxCzAJBgNV" +
        "BAYTAmNuMRAwDgYDVQQIEwdiZWlqaW5nMRAwDgYDVQQHEwdiZWlqaW5nMQ8wDQYDVQQKEwZ6aGl3ZW4x" +
        "DzANBgNVBAsTBnpoaXdlbjEQMA4GA1UEAxMHdHR0cmliZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC" +
        "AQoCggEBAJ6EeV5CPv7COn6Gm2HUnBi+8WZShy7FrIV3vJ+nI6xHrDLJ18Gh9vwtpvh+rALBK2JYnj8Q" +
        "JJMIEO1+JGQydBgfv17dbNTkaNv6Vd2RcjY5yRDSGyhzByERoTFq+m23UohzGqa+WNG6tWisEj6ugJKP" +
        "Txn63EyWDydh8E2e+vBa+9ueraGBXyqo2Ekmze07r4tR5hpZK1aC1E/tjzAxa7du7zchyBsoaq4iXP/w" +
        "NcebpFXe1hr38VSdpNVwG+kxAX9rhIXS7xy5uI6i9DrdM7/p3lRueIEAQ1srr0F60U9Tr7BdKWXlXTPy" +
        "FrsV9TwpQz9ZWlrxTPuzSOhM2Swe7DECAwEAAaMhMB8wHQYDVR0OBBYEFMNag9W+nIOM8axzW+BdqHze" +
        "vHAVMA0GCSqGSIb3DQEBCwUAA4IBAQAdayAZ6iWLFENHngbnFZrHJncwhYTuACIQw+4Uvl0EuaP3wO5g" +
        "HOjPf83jLCmnDNWpDY+QeC3qIAyorm9xxAkOp2LsL3JVpZPQkLseb1VgtT4kCZWs50FFZ4iQyx4v+uzz" +
        "TPMXDpV8dwwrkj3p1OvmZKG3R+n+5o0GY5p0mzO+NiYRZcdnaAVQ7YjC7p02GtkuIcFapN0CE3aXOVh8" +
        "9gAo07GxrqHSmQ35RpV6gY05Eij3wIQIQbf+Hg4FQ0g/LsWyidtMTY08DnD+Rwz1JoQ9fqe1bTzMkbRV" +
        "65R/uNJUYp9Q0ci2NKoPn9ktHpnOZVVpC90Vl4bLiT8Nr/D6uu0s";
    
    private Object originalPackageManager;
    private Signature spoofedSignature;
    private String packageName;
    
    /**
     * Static initialization method called from the bytecode-patched Application.attachBaseContext().
     * This is the primary initialization path that works on-device without manifest modification.
     * Safe to call multiple times - subsequent calls are no-ops.
     */
    public static void initialize(Context context) {
        if (initialized) return;
        initialized = true;
        
        try {
            String packageName = context.getPackageName();
            Log.d(TAG, "Initializing signature spoof for package: " + packageName);
            
            Signature spoofedSig = new Signature(Base64.decode(ORIGINAL_SIGNATURE_BASE64, Base64.DEFAULT));
            hookPackageManagerStatic(context, spoofedSig, packageName);
            clearPackageManagerCachesStatic();
            
            Log.d(TAG, "Signature spoof initialized successfully via static method");
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize signature spoof via static method", e);
        }
    }
    
    @Override
    public boolean onCreate() {
        // Fallback initialization path for when the manifest provider declaration works
        // (e.g., local PatcherMain workaround). If already initialized via static method, skip.
        if (initialized) {
            Log.d(TAG, "Signature spoof already initialized, skipping ContentProvider onCreate");
            return true;
        }
        
        Context context = getContext();
        if (context == null) {
            Log.e(TAG, "Context is null, cannot initialize signature spoof");
            return false;
        }
        
        try {
            packageName = context.getPackageName();
            Log.d(TAG, "Initializing signature spoof via ContentProvider for package: " + packageName);
            
            spoofedSignature = new Signature(Base64.decode(ORIGINAL_SIGNATURE_BASE64, Base64.DEFAULT));
            hookPackageManagerStatic(context, spoofedSignature, packageName);
            clearPackageManagerCachesStatic();
            
            initialized = true;
            Log.d(TAG, "Signature spoof initialized successfully via ContentProvider");
            return true;
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize signature spoof via ContentProvider", e);
            return false;
        }
    }
    
    // ── Static helpers (used by initialize()) ──────────────────────────────────
    
    private static void hookPackageManagerStatic(Context context, Signature spoofedSig, String packageName) {
        try {
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Method currentActivityThreadMethod = activityThreadClass.getDeclaredMethod("currentActivityThread");
            currentActivityThreadMethod.setAccessible(true);
            Object currentActivityThread = currentActivityThreadMethod.invoke(null);
            
            Field sPackageManagerField = activityThreadClass.getDeclaredField("sPackageManager");
            sPackageManagerField.setAccessible(true);
            Object originalPm = sPackageManagerField.get(currentActivityThread);
            
            Class<?> iPackageManagerInterface = Class.forName("android.content.pm.IPackageManager");
            Object proxy = Proxy.newProxyInstance(
                iPackageManagerInterface.getClassLoader(),
                new Class<?>[]{iPackageManagerInterface},
                new StaticInvocationHandler(originalPm, spoofedSig, packageName)
            );
            
            sPackageManagerField.set(currentActivityThread, proxy);
            
            PackageManager pm = context.getPackageManager();
            try {
                Field mPmField = pm.getClass().getDeclaredField("mPM");
                mPmField.setAccessible(true);
                mPmField.set(pm, proxy);
            } catch (NoSuchFieldException e) {
                Log.w(TAG, "mPM field not found (may be OK on this Android version)");
            }
            
            Log.d(TAG, "PackageManager hooked successfully (static)");
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook PackageManager (static)", e);
        }
    }
    
    private static void clearPackageManagerCachesStatic() {
        try {
            Field cacheField = PackageManager.class.getDeclaredField("sPackageInfoCache");
            cacheField.setAccessible(true);
            Object cache = cacheField.get(null);
            if (cache != null) {
                Method clearMethod = cache.getClass().getMethod("clear");
                clearMethod.invoke(cache);
            }
            
            try {
                Field mCreatorsField = Parcel.class.getDeclaredField("mCreators");
                mCreatorsField.setAccessible(true);
                Map<?, ?> mCreators = (Map<?, ?>) mCreatorsField.get(null);
                if (mCreators != null) mCreators.clear();
            } catch (NoSuchFieldException e) {
                Log.w(TAG, "Parcel.mCreators not found (removed in this Android version)");
            }
            
            try {
                Field sPairedCreatorsField = Parcel.class.getDeclaredField("sPairedCreators");
                sPairedCreatorsField.setAccessible(true);
                Map<?, ?> sPairedCreators = (Map<?, ?>) sPairedCreatorsField.get(null);
                if (sPairedCreators != null) sPairedCreators.clear();
            } catch (NoSuchFieldException e) {
                Log.w(TAG, "Parcel.sPairedCreators not found (removed in this Android version)");
            }
            
            Log.d(TAG, "PackageManager caches cleared (static)");
        } catch (Exception e) {
            Log.e(TAG, "Failed to clear PackageManager caches (static)", e);
        }
    }
    
    /**
     * Static InvocationHandler that doesn't require an instance of SignatureSpoofApplication.
     */
    private static class StaticInvocationHandler implements InvocationHandler {
        private final Object originalPackageManager;
        private final Signature spoofedSignature;
        private final String packageName;
        
        StaticInvocationHandler(Object originalPackageManager, Signature spoofedSignature, String packageName) {
            this.originalPackageManager = originalPackageManager;
            this.spoofedSignature = spoofedSignature;
            this.packageName = packageName;
        }
        
        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            try {
                String methodName = method.getName();
                
                // Hook getPackageInfo() - intercept signature queries
                if ("getPackageInfo".equals(methodName)) {
                    String pkgName = (String) args[0];
                    long flags = ((Number) args[1]).longValue();
                    
                    if (((flags & GET_SIGNATURES) != 0 || (flags & GET_SIGNING_CERTIFICATES) != 0)
                            && packageName.equals(pkgName)) {
                        PackageInfo info = (PackageInfo) method.invoke(originalPackageManager, args);
                        if (info != null) {
                            spoofPackageInfo(info);
                            Log.d(TAG, "Spoofed signature for getPackageInfo: " + pkgName + " (flags=0x" + Long.toHexString(flags) + ")");
                            return info;
                        }
                    }
                }
                
                // Hook getPackageArchiveInfo() - used to inspect APK files
                else if ("getPackageArchiveInfo".equals(methodName)) {
                    // args: (String path, int flags, int userId)
                    long flags = ((Number) args[1]).longValue();
                    if ((flags & GET_SIGNATURES) != 0 || (flags & GET_SIGNING_CERTIFICATES) != 0) {
                        PackageInfo info = (PackageInfo) method.invoke(originalPackageManager, args);
                        if (info != null && packageName.equals(info.packageName)) {
                            spoofPackageInfo(info);
                            Log.d(TAG, "Spoofed signature for getPackageArchiveInfo: " + info.packageName);
                            return info;
                        }
                    }
                }
                
                // Hook getSigningCertificateHistory() - API 28+
                else if ("getSigningCertificateHistory".equals(methodName)) {
                    if (Build.VERSION.SDK_INT >= 28) {
                        String pkgName = (String) args[0];
                        if (packageName.equals(pkgName)) {
                            // Return a ParceledListSlice containing our spoofed signature
                            Object result = createSpoofedSigningCertificateHistory();
                            if (result != null) {
                                Log.d(TAG, "Spoofed signing certificate history for: " + pkgName);
                                return result;
                            }
                        }
                    }
                }
                
                // Hook hasSigningCertificate() - API 28+
                else if ("hasSigningCertificate".equals(methodName)) {
                    if (Build.VERSION.SDK_INT >= 28) {
                        String pkgName = (String) args[0];
                        byte[] certBytes = (byte[]) args[1];
                        if (packageName.equals(pkgName)) {
                            // Check if the queried cert matches our spoofed signature
                            try {
                                byte[] spoofedBytes = spoofedSignature.toByteArray();
                                if (java.util.Arrays.equals(certBytes, spoofedBytes)) {
                                    Log.d(TAG, "hasSigningCertificate: returning true for spoofed cert");
                                    return true;
                                }
                            } catch (Exception e) {
                                Log.w(TAG, "Error comparing certificates", e);
                            }
                        }
                    }
                }
            } catch (Exception e) {
                Log.e(TAG, "Error in static invocation handler", e);
            }
            
            return method.invoke(originalPackageManager, args);
        }
        
        // Helper method to spoof a PackageInfo object
        private void spoofPackageInfo(PackageInfo info) {
            // Spoof legacy signatures field
            info.signatures = new Signature[]{spoofedSignature};
            
            // Spoof modern SigningInfo field (API 28+)
            if (Build.VERSION.SDK_INT >= 28) {
                try {
                    Field signingInfoField = PackageInfo.class.getDeclaredField("signingInfo");
                    signingInfoField.setAccessible(true);
                    Object existingSigningInfo = signingInfoField.get(info);
                    
                    if (existingSigningInfo != null) {
                        // Strategy 1: Try to create a new SigningInfo via constructor
                        if (tryCreateNewSigningInfo(info, signingInfoField)) {
                            return;
                        }
                        
                        // Strategy 2: Try to modify internal fields by enumerating them
                        // (field names change between Android versions)
                        if (tryModifySigningInfoFields(existingSigningInfo)) {
                            return;
                        }
                        
                        // Strategy 3: Create SigningInfo via CREATOR and Parcel (Android 16+)
                        if (tryCreateSigningInfoViaCreator(info, signingInfoField)) {
                            return;
                        }
                        
                        // Strategy 4: Try to set signingInfo to null to force fallback to legacy signatures
                        if (trySetSigningInfoToNull(info, signingInfoField)) {
                            return;
                        }
                        
                        Log.w(TAG, "All strategies to spoof SigningInfo failed");
                    }
                } catch (Exception e) {
                    Log.w(TAG, "Failed to update SigningInfo", e);
                }
            }
        }
        
        // Strategy 1: Create a new SigningInfo object via constructor
        private boolean tryCreateNewSigningInfo(PackageInfo info, Field signingInfoField) {
            try {
                Class<?> signingInfoClass = Class.forName("android.content.pm.SigningInfo");
                Object newSigningInfo = null;
                
                // Try constructor: SigningInfo(Signature[] signatures)
                try {
                    java.lang.reflect.Constructor<?> constructor = signingInfoClass.getDeclaredConstructor(Signature[].class);
                    constructor.setAccessible(true);
                    newSigningInfo = constructor.newInstance((Object) new Signature[]{spoofedSignature});
                    Log.d(TAG, "Created new SigningInfo with single-signature constructor");
                } catch (NoSuchMethodException e) {
                    // Try alternative: SigningInfo(Signature[] signatures, boolean hasMultipleSigners)
                    try {
                        java.lang.reflect.Constructor<?> constructor = signingInfoClass.getDeclaredConstructor(Signature[].class, boolean.class);
                        constructor.setAccessible(true);
                        newSigningInfo = constructor.newInstance(new Signature[]{spoofedSignature}, false);
                        Log.d(TAG, "Created new SigningInfo with two-arg constructor");
                    } catch (NoSuchMethodException e2) {
                        // Try: SigningInfo(Parcel) - some versions use Parcelable constructor
                        Log.d(TAG, "No standard SigningInfo constructors found, trying field enumeration");
                    }
                }
                
                if (newSigningInfo != null) {
                    signingInfoField.set(info, newSigningInfo);
                    return true;
                }
            } catch (Exception e) {
                Log.d(TAG, "Strategy 1 (new SigningInfo) failed: " + e.getMessage());
            }
            return false;
        }
        
        // Strategy 2: Enumerate SigningInfo fields and modify any Signature[] or List<Signature> fields
        private boolean tryModifySigningInfoFields(Object signingInfo) {
            try {
                Class<?> clazz = signingInfo.getClass();
                boolean modified = false;
                
                // Log all fields for debugging
                StringBuilder fieldInfo = new StringBuilder("SigningInfo fields: ");
                for (Field f : clazz.getDeclaredFields()) {
                    fieldInfo.append(f.getName()).append("(").append(f.getType().getSimpleName()).append(") ");
                }
                Log.d(TAG, fieldInfo.toString());
                
                // Try to find and modify any Signature[] fields
                for (Field f : clazz.getDeclaredFields()) {
                    f.setAccessible(true);
                    
                    if (f.getType().equals(Signature[].class)) {
                        f.set(signingInfo, new Signature[]{spoofedSignature});
                        Log.d(TAG, "Set Signature[] field: " + f.getName());
                        modified = true;
                    } else if (f.getType().equals(boolean.class) || f.getType().equals(Boolean.class)) {
                        // Set boolean fields like hasMultipleSigners to false
                        if (f.getName().toLowerCase().contains("multiple")) {
                            f.setBoolean(signingInfo, false);
                            Log.d(TAG, "Set boolean field to false: " + f.getName());
                            modified = true;
                        }
                    }
                }
                
                return modified;
            } catch (Exception e) {
                Log.d(TAG, "Strategy 2 (field enumeration) failed: " + e.getMessage());
            }
            return false;
        }
        
        // Strategy 3: Create SigningInfo via CREATOR and Parcel (Android 16+)
        private boolean tryCreateSigningInfoViaCreator(PackageInfo info, Field signingInfoField) {
            try {
                Class<?> signingInfoClass = Class.forName("android.content.pm.SigningInfo");
                
                // Get the CREATOR field
                Field creatorField = signingInfoClass.getDeclaredField("CREATOR");
                creatorField.setAccessible(true);
                Object creator = creatorField.get(null);
                
                if (creator == null) {
                    Log.d(TAG, "Strategy 3: CREATOR field is null");
                    return false;
                }
                
                // Create a Parcel and write the spoofed signature
                Parcel parcel = Parcel.obtain();
                try {
                    // Write the signature array
                    parcel.writeArray(new Signature[]{spoofedSignature});
                    // Write hasMultipleSigners = false
                    parcel.writeInt(0);
                    // Write hasPastSigningCertificates = false
                    parcel.writeInt(0);
                    
                    // Reset parcel position for reading
                    parcel.setDataPosition(0);
                    
                    // Use CREATOR.createFromParcel() to create SigningInfo
                    java.lang.reflect.Method createFromParcelMethod = creator.getClass().getMethod("createFromParcel", Parcel.class);
                    Object newSigningInfo = createFromParcelMethod.invoke(creator, parcel);
                    
                    if (newSigningInfo != null) {
                        signingInfoField.set(info, newSigningInfo);
                        Log.d(TAG, "Strategy 3: Created SigningInfo via CREATOR");
                        return true;
                    }
                } finally {
                    parcel.recycle();
                }
            } catch (Exception e) {
                Log.d(TAG, "Strategy 3 (CREATOR) failed: " + e.getMessage());
            }
            return false;
        }
        
        // Strategy 4: Set signingInfo to null to force fallback to legacy signatures field
        private boolean trySetSigningInfoToNull(PackageInfo info, Field signingInfoField) {
            try {
                signingInfoField.set(info, null);
                Log.d(TAG, "Strategy 4: Set signingInfo to null");
                return true;
            } catch (Exception e) {
                Log.d(TAG, "Strategy 4 (set to null) failed: " + e.getMessage());
            }
            return false;
        }
        
        // Helper method to create a spoofed ParceledListSlice for getSigningCertificateHistory()
        private Object createSpoofedSigningCertificateHistory() {
            try {
                // Create a SigningCertificateHistory object with our spoofed signature
                Class<?> signingCertHistoryClass = Class.forName("android.content.pm.SigningCertificateHistory");
                Object history = signingCertHistoryClass.getDeclaredConstructor().newInstance();
                
                // Set the signingCerts field
                Field signingCertsField = signingCertHistoryClass.getDeclaredField("signingCerts");
                signingCertsField.setAccessible(true);
                signingCertsField.set(history, new Signature[]{spoofedSignature});
                
                // Create a List containing our history object
                java.util.List<Object> historyList = new java.util.ArrayList<>();
                historyList.add(history);
                
                // Create a ParceledListSlice from the list
                Class<?> parceledListSliceClass = Class.forName("android.content.pm.ParceledListSlice");
                return parceledListSliceClass.getDeclaredConstructor(java.util.List.class).newInstance(historyList);
            } catch (Exception e) {
                Log.w(TAG, "Failed to create spoofed signing certificate history", e);
                return null;
            }
        }
    }
    
    // Required ContentProvider methods (not used)
    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }
    
    @Override
    public String getType(Uri uri) {
        return null;
    }
    
    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }
    
    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }
    
    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
