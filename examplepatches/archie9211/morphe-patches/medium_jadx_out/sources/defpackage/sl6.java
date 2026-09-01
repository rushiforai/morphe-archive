package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sl6 extends ql6 {
    public final short a;

    public sl6(short s) {
        this.a = s;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return Short.valueOf(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof sl6) && this.a == ((sl6) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }
}
