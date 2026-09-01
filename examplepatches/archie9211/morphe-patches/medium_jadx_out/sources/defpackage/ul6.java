package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ul6 extends ql6 {
    public final byte a;

    public ul6(byte b) {
        this.a = b;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return new tyd(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ul6) && this.a == ((ul6) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }
}
