package defpackage;

import com.google.android.recaptcha.internal.zzqb;
import com.medium.android.data.notification.YMl.DtuT;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class oig {
    public final String a;
    public final char[] b;
    public final int c;
    public final int d;
    public final int e;
    public final int f;
    public final byte[] g;
    public final boolean[] h;

    /* JADX WARN: Removed duplicated region for block: B:37:0x00a6 A[LOOP:1: B:35:0x00a2->B:37:0x00a6, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public oig(java.lang.String r10, char[] r11) {
        /*
            Method dump skipped, instruction units count: 250
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.oig.<init>(java.lang.String, char[]):void");
    }

    public final boolean equals(Object obj) {
        return (obj instanceof oig) && Arrays.equals(this.b, ((oig) obj).b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) + 1237;
    }

    public final String toString() {
        return this.a;
    }

    public final int a(char c) throws zzqb {
        if (c > 127) {
            throw new zzqb("Unrecognized character: 0x".concat(String.valueOf(Integer.toHexString(c))));
        }
        byte b = this.g[c];
        if (b != -1) {
            return b;
        }
        if (c <= ' ' || c == 127) {
            throw new zzqb("Unrecognized character: 0x".concat(String.valueOf(Integer.toHexString(c))));
        }
        throw new zzqb(ev6.z(new StringBuilder(String.valueOf(c).length() + 24), DtuT.irLQtSUwdlRQ, c));
    }
}
