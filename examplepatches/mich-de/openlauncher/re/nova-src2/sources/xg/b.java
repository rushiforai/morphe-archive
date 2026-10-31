package xg;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f95831a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /* renamed from: b, reason: collision with root package name */
    public static final char[] f95832b = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    /* renamed from: c, reason: collision with root package name */
    public static Boolean f95833c;

    /* renamed from: d, reason: collision with root package name */
    public static Boolean f95834d;

    /* renamed from: e, reason: collision with root package name */
    public static Boolean f95835e;

    /* renamed from: f, reason: collision with root package name */
    public static Boolean f95836f;

    public static String a(byte[] bArr) {
        int length = bArr.length;
        char[] cArr = new char[length + length];
        int i5 = 0;
        for (byte b11 : bArr) {
            char[] cArr2 = f95832b;
            cArr[i5] = cArr2[(b11 & 255) >>> 4];
            cArr[i5 + 1] = cArr2[b11 & 15];
            i5 += 2;
        }
        return new String(cArr);
    }

    public static String b(byte[] bArr) {
        int length = bArr.length;
        StringBuilder sb2 = new StringBuilder(length + length);
        for (int i5 = 0; i5 < length; i5++) {
            int i11 = (bArr[i5] & 240) >>> 4;
            char[] cArr = f95831a;
            sb2.append(cArr[i11]);
            sb2.append(cArr[bArr[i5] & 15]);
        }
        return sb2.toString();
    }

    public static String c(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return Base64.encodeToString(bArr, 11);
    }

    public static byte[] d(Context context, String str) throws NoSuchAlgorithmException {
        MessageDigest messageDigest;
        PackageInfo packageInfoC = zg.b.a(context).c(64, str);
        Signature[] signatureArr = packageInfoC.signatures;
        if (signatureArr != null && signatureArr.length == 1) {
            int i5 = 0;
            while (true) {
                if (i5 >= 2) {
                    messageDigest = null;
                    break;
                }
                try {
                    messageDigest = MessageDigest.getInstance("SHA1");
                } catch (NoSuchAlgorithmException unused) {
                }
                if (messageDigest != null) {
                    break;
                }
                i5++;
            }
            if (messageDigest != null) {
                return messageDigest.digest(packageInfoC.signatures[0].toByteArray());
            }
        }
        return null;
    }

    public static boolean e(Context context) {
        PackageManager packageManager = context.getPackageManager();
        if (f95833c == null) {
            f95833c = Boolean.valueOf(packageManager.hasSystemFeature("android.hardware.type.watch"));
        }
        f95833c.booleanValue();
        if (f95834d == null) {
            f95834d = Boolean.valueOf(context.getPackageManager().hasSystemFeature("cn.google"));
        }
        return f95834d.booleanValue() && Build.VERSION.SDK_INT >= 30;
    }
}
