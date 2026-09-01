package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ve6 {
    public final Throwable a;
    public final String b;
    public final ArrayList c;

    public ve6(Throwable th, String str, ArrayList arrayList) {
        this.a = th;
        this.b = str;
        this.c = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ve6)) {
            return false;
        }
        ve6 ve6Var = (ve6) obj;
        return this.a.equals(ve6Var.a) && this.b.equals(ve6Var.b) && this.c.equals(ve6Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return QFTsJPDEnO.BkjXE + this.a + ", message=" + this.b + ", threads=" + this.c + ")";
    }
}
