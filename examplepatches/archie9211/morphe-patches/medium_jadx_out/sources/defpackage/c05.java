package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c05 {
    public final List a;

    public c05(b05... b05VarArr) {
        if (b05VarArr.length <= 0) {
            this.a = k80.Q0(b05VarArr);
        } else {
            b05 b05Var = b05VarArr[0];
            throw null;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof c05) {
            return this.a.equals(((c05) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
