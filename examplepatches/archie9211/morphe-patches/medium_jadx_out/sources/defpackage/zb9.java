package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zb9 {
    public final int a;

    public /* synthetic */ zb9(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zb9) {
            return this.a == ((zb9) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.u("PointerKeyboardModifiers(packedValue=", this.a, ')');
    }
}
