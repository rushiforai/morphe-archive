package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qw1 implements tw1 {
    public final int a;
    public final String b;

    public qw1(int i, String str) {
        this.a = i;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qw1)) {
            return false;
        }
        qw1 qw1Var = (qw1) obj;
        return this.a == qw1Var.a && this.b.equals(qw1Var.b);
    }

    @Override // defpackage.tw1
    public final String getParagraphName() {
        return this.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "Error(graphIndex=" + this.a + ", paragraphName=" + this.b + JWcjNoweKCnTr.xDnCIP;
    }
}
