package defpackage;

import com.google.android.recaptcha.internal.zzuf;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class aog {
    public static final /* synthetic */ int a = 0;

    static {
        Charset.forName("UTF-8");
    }

    public static final cmf a(String str) {
        byte[] bArr = new byte[str.length()];
        for (int i = 0; i < str.length(); i++) {
            char cCharAt = str.charAt(i);
            if (cCharAt < '!' || cCharAt > '~') {
                StringBuilder sb = new StringBuilder(String.valueOf(cCharAt).length() + 33);
                sb.append("Not a printable ASCII character: ");
                sb.append(cCharAt);
                throw new zzuf(sb.toString());
            }
            bArr[i] = (byte) cCharAt;
        }
        return cmf.a(bArr);
    }

    public static boolean b(byte[] bArr, byte[] bArr2) {
        if (bArr2.length >= bArr.length) {
            for (int i = 0; i < bArr.length; i++) {
                if (bArr2[i] == bArr[i]) {
                }
            }
            return true;
        }
        return false;
    }
}
