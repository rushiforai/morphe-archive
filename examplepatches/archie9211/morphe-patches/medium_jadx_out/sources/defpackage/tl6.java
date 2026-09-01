package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tl6 extends ql6 {
    public final String a;

    public tl6(String str) {
        str.getClass();
        this.a = str;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof tl6) && g76.L(this.a, ((tl6) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
