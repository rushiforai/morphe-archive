package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ue3 implements xe3 {
    public final int a;

    public /* synthetic */ ue3(int i) {
        this.a = i;
    }

    public static void a(int i) {
        if (i > 0) {
            return;
        }
        ay0.e("px must be > 0.");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ue3) {
            return this.a == ((ue3) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.u("Pixels(px=", this.a, ')');
    }
}
