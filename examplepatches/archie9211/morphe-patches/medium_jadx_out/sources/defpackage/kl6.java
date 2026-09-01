package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kl6 extends ql6 {
    public final char a;

    public kl6(char c) {
        this.a = c;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return Character.valueOf(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof kl6) && this.a == ((kl6) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }
}
