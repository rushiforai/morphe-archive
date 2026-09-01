package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ikf implements sy {
    public static final ikf c;
    public final boolean a;
    public final String b;

    static {
        d2f d2fVar = new d2f(6);
        d2fVar.b = Boolean.FALSE;
        c = new ikf(d2fVar);
    }

    public ikf(d2f d2fVar) {
        this.a = ((Boolean) d2fVar.b).booleanValue();
        this.b = (String) d2fVar.c;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ikf)) {
            return false;
        }
        ikf ikfVar = (ikf) obj;
        return en7.u(null, null) && this.a == ikfVar.a && en7.u(this.b, ikfVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{null, Boolean.valueOf(this.a), this.b});
    }
}
