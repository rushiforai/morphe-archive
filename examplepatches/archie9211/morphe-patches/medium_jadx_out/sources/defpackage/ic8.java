package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ic8 {
    public final int a;
    public final float b;
    public final float c;
    public final float d;
    public final long e;

    public ic8(float f, float f2, float f3, int i, long j) {
        this.a = i;
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && ic8.class == obj.getClass()) {
            ic8 ic8Var = (ic8) obj;
            return this.c == ic8Var.c && this.d == ic8Var.d && this.b == ic8Var.b && this.a == ic8Var.a && this.e == ic8Var.e;
        }
        return false;
    }

    public final int hashCode() {
        int iP = (km4.p(this.b, km4.p(this.d, Float.floatToIntBits(this.c) * 31, 31), 31) + this.a) * 31;
        long j = this.e;
        return iP + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return "NavigationEvent(touchX=" + this.c + ", touchY=" + this.d + ", progress=" + this.b + ", swipeEdge=" + this.a + ", frameTimeMillis=" + this.e + ')';
    }
}
