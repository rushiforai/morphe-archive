package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class g94 {
    public static final HashSet a = qo7.q("8a3c4b262d721acd49a4bf97d5213199c86fa2b9", "cc2751449a350f668590264ed76692694a80308a", "a4b7452e2ed8f5f191058ca7bbfd26b0d3214bfc", "df6b721c8b4d3b6eb44c861d4415007e5a35fc95", "9b8f518b086098de3d77736f9458a3d2f6f95a37", "2438bce1ddb7bd026d5ff89f598b3b5e5bb824b3", "c56fb7d591ba6704df047fd98f535372fea00211");

    public static final boolean a(Context context, String str) {
        String string;
        context.getClass();
        String str2 = Build.BRAND;
        int i = context.getApplicationInfo().flags;
        str2.getClass();
        if (tuc.N(str2, "generic", false) && (i & 2) != 0) {
            return true;
        }
        try {
            Signature[] signatureArr = context.getPackageManager().getPackageInfo(str, 64).signatures;
            if (signatureArr != null && signatureArr.length != 0) {
                signatureArr.getClass();
                for (Signature signature : signatureArr) {
                    HashSet hashSet = a;
                    byte[] byteArray = signature.toByteArray();
                    byteArray.getClass();
                    try {
                        MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
                        messageDigest.getClass();
                        messageDigest.update(byteArray);
                        byte[] bArrDigest = messageDigest.digest();
                        StringBuilder sb = new StringBuilder();
                        bArrDigest.getClass();
                        for (byte b : bArrDigest) {
                            sb.append(Integer.toHexString((b >> 4) & 15));
                            sb.append(Integer.toHexString(b & 15));
                        }
                        string = sb.toString();
                    } catch (NoSuchAlgorithmException unused) {
                        string = null;
                    }
                    if (bu1.p0(hashSet, string)) {
                    }
                }
                return true;
            }
        } catch (PackageManager.NameNotFoundException unused2) {
        }
        return false;
    }
}
