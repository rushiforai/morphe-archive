package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class awa {
    public static final awa b = new awa("login");
    public static final awa c = new awa("signup");
    public final String a;

    public awa(String str) {
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof awa) && this.a.equals(((awa) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        String str = this.a;
        return y30.s(new StringBuilder(str.length() + 24), "RecaptchaAction(action=", str, QFTsJPDEnO.xOibU);
    }
}
