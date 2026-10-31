package kl;

import com.google.crypto.tink.internal.TinkBugException;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;

/* loaded from: classes.dex */
public abstract class w0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f71650a = 0;

    static {
        Charset.forName("UTF-8");
    }

    public static final tl.a a(String str) throws GeneralSecurityException {
        byte[] bArr = new byte[str.length()];
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt < '!' || cCharAt > '~') {
                throw new GeneralSecurityException("Not a printable ASCII character: " + cCharAt);
            }
            bArr[i5] = (byte) cCharAt;
        }
        return tl.a.a(bArr);
    }

    public static boolean b(byte[] bArr, byte[] bArr2) {
        if (bArr2.length < bArr.length) {
            return false;
        }
        for (int i5 = 0; i5 < bArr.length; i5++) {
            if (bArr2[i5] != bArr[i5]) {
                return false;
            }
        }
        return true;
    }

    public static final tl.a c(String str) {
        byte[] bArr = new byte[str.length()];
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if (cCharAt < '!' || cCharAt > '~') {
                throw new TinkBugException("Not a printable ASCII character: " + cCharAt);
            }
            bArr[i5] = (byte) cCharAt;
        }
        return tl.a.a(bArr);
    }
}
