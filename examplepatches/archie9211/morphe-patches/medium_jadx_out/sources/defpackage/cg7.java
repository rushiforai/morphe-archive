package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cg7 implements fg7 {
    public final List a;
    public final lv0 b;

    public cg7(f17 f17Var, lv0 lv0Var) {
        f17Var.getClass();
        lv0Var.getClass();
        this.a = f17Var;
        this.b = lv0Var;
    }

    @Override // defpackage.fg7
    public final List a() {
        return this.a;
    }

    @Override // defpackage.fg7
    public final lv0 b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cg7)) {
            return false;
        }
        cg7 cg7Var = (cg7) obj;
        return this.a.equals(cg7Var.a) && this.b == cg7Var.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Error(bottomBarItems=" + this.a + QFTsJPDEnO.kGeCvVvfJMZXU + this.b + ")";
    }
}
