package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kp3 implements lp3 {
    public final boolean a;

    public kp3(boolean z) {
        this.a = z;
    }

    @Override // defpackage.lp3
    public final boolean a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof kp3) && this.a == ((kp3) obj).a;
    }

    public final int hashCode() {
        return this.a ? 1231 : 1237;
    }

    public final String toString() {
        return b09.z("Loading(isFocused=", ")", this.a);
    }
}
