/*
 * Adaptado de MorpheApp/morphe-patches (patch "Spoof signature" do Reddit)
 * https://github.com/MorpheApp/morphe-patches
 * https://github.com/sashade8-ship-it/dual-vot-patches
 *
 * Original adaptado de:
 * https://github.com/L-JINBIN/ApkSignatureKillerEx/blob/3e6a8dc7de1b108dc70647f62bc499d7b68852b2/killer/src/main/java/bin/mt/signature/KillerApplication.java
 *
 * Ver o NOTICE incluído no repositório original para os termos da Seção 7 da GPLv3
 * que se aplicam a este código.
 */

package app.morphe.extension.tinder.patches;

import android.app.Application;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;

import org.lsposed.hiddenapibypass.HiddenApiBypass;

import java.lang.reflect.Field;
import java.util.Map;

public class SpoofSignaturePatch extends Application {
    static {
        killPM();
    }

    @SuppressWarnings("ExtractMethodRecommender")
    private static void killPM() {
        String packageName = "com.tinder";
        // Certificado original do com.tinder (DER, base64) -- extraído do APK
        // oficial baixado no APKPure, não do APK assinado pelo Morphe.
        String certificateData = "MIIBmTCCAQKgAwIBAgIEUeAnWDANBgkqhkiG9w0BAQUFADARMQ8wDQYDVQQKEwZUaW5kZXIwHhcNMTMwNzEyMTU1NzEyWhcNMzgwNzA2MTU1NzEyWjARMQ8wDQYDVQQKEwZUaW5kZXIwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANDB/26UYsv6HWhfvI7WvEgFPbL5eHe1dCDONKD5I/MQi4GhhpWqexBWZCj9bs2YeWXWygcrM8kEDEH04rdEhobD+uzkXlc9Lkp/VRpt+rfpai6cNf64+TNor/wwmRdxlvAg4cC4MEpgIcbn0pOS/HiDLv3Fll8J0mTiuOhw/1ajAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEAt54DELzcQ79BwmPtuq7QS6QI2CF24eWUU61A3zLWzABSFlw9eE87eXwwwQh4TXv8Nwv3zU1drqbrDdBrKkRJ7w5ztZrMnII5NEpDuXx8hYjCCsUWIRtthaty6OcwECylY2Obqi3E+l+DJfRqq2VP6S77vJKkPIfb3CWZ2mzVVD8=";

        Signature fakeSignature = new Signature(Base64.decode(certificateData, Base64.DEFAULT));
        Parcelable.Creator<PackageInfo> originalCreator = PackageInfo.CREATOR;
        Parcelable.Creator<PackageInfo> creator = new Parcelable.Creator<>() {
            @Override
            @SuppressWarnings("deprecation")
            public PackageInfo createFromParcel(Parcel source) {
                PackageInfo packageInfo = originalCreator.createFromParcel(source);
                if (packageInfo.packageName.equals(packageName)) {
                    if (packageInfo.signatures != null && packageInfo.signatures.length > 0) {
                        packageInfo.signatures[0] = fakeSignature;
                    }
                    if (packageInfo.signingInfo != null) {
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
        HiddenApiBypass.addHiddenApiExemptions("Landroid/os/Parcel;", "Landroid/content/pm", "Landroid/app");
        try {
            Object cache = findField(PackageManager.class, "sPackageInfoCache").get(null);
            if (cache != null) {
                cache.getClass().getMethod("clear").invoke(cache);
            }
        } catch (Throwable ignored) {
        }
        try {
            Map<?, ?> mCreators = (Map<?, ?>) findField(Parcel.class, "mCreators").get(null);
            if (mCreators != null) {
                mCreators.clear();
            }
        } catch (Throwable ignored) {
        }
        try {
            Map<?, ?> sPairedCreators = (Map<?, ?>) findField(Parcel.class, "sPairedCreators").get(null);
            if (sPairedCreators != null) {
                sPairedCreators.clear();
            }
        } catch (Throwable ignored) {
        }
    }

    private static Field findField(Class<?> clazz, String fieldName) throws NoSuchFieldException {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field;
        } catch (NoSuchFieldException e) {
            while (true) {
                clazz = clazz.getSuperclass();
                if (clazz == null || clazz.equals(Object.class)) {
                    break;
                }
                try {
                    Field field = clazz.getDeclaredField(fieldName);
                    field.setAccessible(true);
                    return field;
                } catch (NoSuchFieldException ignored) {
                }
            }
            throw e;
        }
    }
}
