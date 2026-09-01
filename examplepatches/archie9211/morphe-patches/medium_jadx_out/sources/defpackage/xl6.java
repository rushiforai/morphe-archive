package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xl6 extends ql6 {
    public final short a;

    public xl6(short s) {
        this.a = s;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return new kzd(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof xl6) && this.a == ((xl6) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }
}
