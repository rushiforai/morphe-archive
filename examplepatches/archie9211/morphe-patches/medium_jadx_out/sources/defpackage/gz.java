package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gz {
    public final int a;
    public final s26 b;
    public final sy c;
    public final String d;

    public gz(s26 s26Var, sy syVar, String str) {
        this.b = s26Var;
        this.c = syVar;
        this.d = str;
        this.a = Arrays.hashCode(new Object[]{s26Var, syVar, str});
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof gz)) {
            return false;
        }
        gz gzVar = (gz) obj;
        return en7.u(this.b, gzVar.b) && en7.u(this.c, gzVar.c) && en7.u(this.d, gzVar.d);
    }

    public final int hashCode() {
        return this.a;
    }
}
