package app.smartlife.extension;

import android.app.Application;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import org.lsposed.hiddenapibypass.HiddenApiBypass;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * Keeps the original SmartLife signing certificate visible to the app after it has been
 * re-signed, so the app's own integrity self-check (com.thingclips.smart.security.watchdog)
 * does not quit with "integrity check failed".
 *
 * SmartLife reads the signature through a native library (libthing_security) that calls back
 * into the Java PackageManager, so a plain getPackageInfo redirect is not enough; this replaces
 * PackageInfo.CREATOR and clears the framework caches so every path that unmarshals a
 * PackageInfo for this package sees the original certificate.
 *
 * Adapted from the Reddit SpoofSignaturePatch in MorpheApp/morphe-patches, itself adapted from
 * https://github.com/L-JINBIN/ApkSignatureKillerEx
 *
 * This class is installed as the superclass of the app's Application subclass, so killPM() runs
 * from the static initializer before the watchdog starts.
 */
@SuppressWarnings("unused")
public class SignatureSpoof extends Application {
    private static final String PACKAGE_NAME = "com.tuya.smartlife";
    private static final String CERTIFICATE =
            "MIIDgzCCAmugAwIBAgIEe7R4yTANBgkqhkiG9w0BAQsFADBxMQswCQYDVQQGEwJDTjERMA8GA1UECBMIWmhlSmlhbmcxETAPBgNVBAcTCEhhbmd6aG91MQ4wDAYDVQQKEwV0bGlmZTEVMBMGA1UECxMMd3d3LnR1eWEuY29tMRUwEwYDVQQDEwx3d3cudHV5YS5jb20wIBcNMTYwNTE3MDM0OTA5WhgPMjA3MTAyMTgwMzQ5MDlaMHExCzAJBgNVBAYTAkNOMREwDwYDVQQIEwhaaGVKaWFuZzERMA8GA1UEBxMISGFuZ3pob3UxDjAMBgNVBAoTBXRsaWZlMRUwEwYDVQQLEwx3d3cudHV5YS5jb20xFTATBgNVBAMTDHd3dy50dXlhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIqNaWHwN3GHIIXhxgKC7EPRaHYvkkW+CoCqID7Yd1ExIuLZGuywT7Pgyr05ktE4idxWhvP5gemzEuwSYLqPvX8VjMikLVWO/wW52n7nbdISJpOSV3fpSR0cD9JnPd7vM8sxmYYgelkNhFIdnGEnH1imYyyjgM3n19d6XNWF5wMC2k4/bCUrunUPq3IB8bKf6gNxMuefWzCTiOYKjMcIvojx6+cb76oipW2d3J1U/aeFNQ4SD72acDW3fs5p2YakiXOxZ5CIMulezWNFW5lSOptMDaKXzq4gGgcOkNOgn5MDGEhGu1ac++azlhq9y1FHJWjHF9l5Pj6bVigWcw1x5XECAwEAAaMhMB8wHQYDVR0OBBYEFFTyzFsc+0lRy8qrsbgncBD70yK5MA0GCSqGSIb3DQEBCwUAA4IBAQCIqGDKz9hormN5JS7viJeSWgG57fiAz7AF8YO2aOUAXg4mnato7WzgrZJydsZFTVjDEbRJUmMdBnHA1QsHkW77L0KSlxhaIbMHcWjjZgCkwnkMybVr7EMbbhZ0OO+9NVcuE2+Ids/ircpsxRqb8hIFNNV+jfHMOqR3ssPUHLrdDAUUgCI+05Bant4WWHg+Lm2KkiL39Q+7oK2oZRzB/nmuhrvJZxHPM5PJoV/NpNzFelwXuT4wf7SQnwzCyzFsvkaIOuhlVSnqQICVWkAUCrDQP6mxyBohop1FPhASkA3BJDJ+tSWHua0/+ZROMLq/d7VF6GQ47bojstlh/p/dfbK4";

    static {
        try {
            killPM();
        } catch (Throwable ignored) {
        }
    }

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        // Capture the Application itself (getApplicationContext() is still null here) so the
        // in-app settings screen and the toggles can read and write SharedPreferences.
        try {
            SmartLifeSettings.init(this);
        } catch (Throwable ignored) {
        }
    }

    private static void killPM() {
        final Signature fakeSignature = new Signature(Base64.decode(CERTIFICATE, Base64.DEFAULT));
        final Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        Parcelable.Creator<PackageInfo> creator = new Parcelable.Creator<PackageInfo>() {
            @Override
            @SuppressWarnings("deprecation")
            public PackageInfo createFromParcel(Parcel source) {
                PackageInfo packageInfo = originalCreator.createFromParcel(source);
                if (PACKAGE_NAME.equals(packageInfo.packageName)) {
                    if (packageInfo.signatures != null && packageInfo.signatures.length > 0) {
                        packageInfo.signatures[0] = fakeSignature;
                    }
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && packageInfo.signingInfo != null) {
                        Signature[] signaturesArray = packageInfo.signingInfo.getApkContentsSigners();
                        if (signaturesArray != null && signaturesArray.length > 0) {
                            signaturesArray[0] = fakeSignature;
                        }
                    }
                }
                return packageInfo;
            }

            @Override
            public PackageInfo[] newArray(int size) {
                return originalCreator.newArray(size);
            }
        };
        try {
            findField(PackageInfo.class, "CREATOR").set(null, creator);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            HiddenApiBypass.addHiddenApiExemptions("Landroid/os/Parcel;", "Landroid/content/pm", "Landroid/app");
        }
        try {
            Object cache = findField(PackageManager.class, "sPackageInfoCache").get(null);
            if (cache != null) {
                cache.getClass().getMethod("clear").invoke(cache);
            }
        } catch (Throwable ignored) {
        }
        for (String fieldName : new String[]{"mCreators", "sPairedCreators"}) {
            try {
                Map<?, ?> creators = (Map<?, ?>) findField(Parcel.class, fieldName).get(null);
                if (creators != null) {
                    creators.clear();
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static Field findField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            try {
                Field field = current.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        throw new NoSuchFieldException(fieldName);
    }
}
