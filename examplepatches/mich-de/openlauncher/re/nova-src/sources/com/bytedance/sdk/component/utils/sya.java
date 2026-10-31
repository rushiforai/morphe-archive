package com.bytedance.sdk.component.utils;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;

/* loaded from: classes2.dex */
public class sya {
    private static HashMap<String, ArrayList<String>> ycx = new HashMap<>();

    public static ArrayList<String> ycx(Context context, String str) {
        ArrayList<String> arrayList = null;
        if (context != null && str != null) {
            String packageName = context.getPackageName();
            if (packageName == null) {
                return null;
            }
            if (ycx.get(str) != null) {
                return ycx.get(str);
            }
            arrayList = new ArrayList<>();
            try {
                Signature[] signatureArrZb = zb(context, packageName);
                if (signatureArrZb != null) {
                    for (Signature signature : signatureArrZb) {
                        String strYcx = "error!";
                        if ("MD5".equals(str)) {
                            strYcx = ycx(signature, "MD5");
                        } else if ("SHA1".equals(str)) {
                            strYcx = ycx(signature, "SHA1");
                        } else if ("SHA256".equals(str)) {
                            strYcx = ycx(signature, "SHA256");
                        }
                        arrayList.add(strYcx);
                    }
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "ev49pgq7Z86OTQ==", "XOs5pgq7Z+6OTNg=", 57);
            }
            ycx.put(str, arrayList);
        }
        return arrayList;
    }

    private static Signature[] zb(Context context, String str) throws PackageManager.NameNotFoundException {
        try {
            if (Build.VERSION.SDK_INT >= 33) {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo(str, PackageManager.PackageInfoFlags.of(134217728L));
                if (packageInfo.signingInfo != null) {
                    return packageInfo.signingInfo.getApkContentsSigners();
                }
                return null;
            }
            PackageInfo packageInfo2 = context.getPackageManager().getPackageInfo(str, 64);
            if (packageInfo2 != null) {
                return packageInfo2.signatures;
            }
            return null;
        } catch (Exception unused) {
            return null;
        }
    }

    public static String ycx(Context context) {
        StringBuilder sb2 = new StringBuilder();
        ArrayList<String> arrayListYcx = ycx(context, "SHA1");
        if (arrayListYcx != null && arrayListYcx.size() != 0) {
            for (int i5 = 0; i5 < arrayListYcx.size(); i5++) {
                sb2.append(arrayListYcx.get(i5));
                if (i5 < arrayListYcx.size() - 1) {
                    sb2.append(",");
                }
            }
        }
        return sb2.toString();
    }

    private static String ycx(Signature signature, String str) throws NoSuchAlgorithmException {
        byte[] byteArray = signature.toByteArray();
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(str);
            if (messageDigest == null) {
                return "error!";
            }
            byte[] bArrDigest = messageDigest.digest(byteArray);
            StringBuilder sb2 = new StringBuilder();
            for (byte b11 : bArrDigest) {
                sb2.append(Integer.toHexString((b11 & 255) | 256).substring(1, 3).toUpperCase());
                sb2.append(":");
            }
            return sb2.substring(0, sb2.length() - 1).toString();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "ev49pgq7Z86OTQ==", "XOs5pgq7Z8aUX8VYrgi0LWj6P5wNuw==", 159);
            return "error!";
        }
    }
}
