package rb;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* loaded from: classes2.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final MessageDigest f85772a;

    /* renamed from: b, reason: collision with root package name */
    public static final char[] f85773b;

    static {
        MessageDigest messageDigest;
        try {
            messageDigest = MessageDigest.getInstance("md5");
        } catch (NoSuchAlgorithmException e3) {
            sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "dsp4", "XOs5uAfp", 17);
            messageDigest = null;
        }
        f85772a = messageDigest;
        f85773b = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    }

    public static String a(String str) {
        byte[] bArrDigest;
        MessageDigest messageDigest = f85772a;
        if (messageDigest == null || TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        byte[] bytes = str.getBytes(Charset.forName("UTF-8"));
        synchronized (a.class) {
            bArrDigest = messageDigest.digest(bytes);
        }
        if (bArrDigest == null || bArrDigest.length == 0) {
            return null;
        }
        char[] cArr = new char[bArrDigest.length << 1];
        int i5 = 0;
        for (byte b11 : bArrDigest) {
            int i11 = i5 + 1;
            char[] cArr2 = f85773b;
            cArr[i5] = cArr2[(b11 & 240) >> 4];
            i5 += 2;
            cArr[i11] = cArr2[b11 & 15];
        }
        return new String(cArr);
    }
}
