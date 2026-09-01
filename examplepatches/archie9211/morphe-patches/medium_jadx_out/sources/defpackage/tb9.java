package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tb9 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final boolean e;
    public final float f;
    public final int g;
    public final boolean h;
    public final ArrayList i;
    public final long j;
    public final float k;
    public final long l;
    public final long m;

    public tb9(long j, long j2, long j3, long j4, boolean z, float f, int i, boolean z2, ArrayList arrayList, long j5, float f2, long j6, long j7) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = z;
        this.f = f;
        this.g = i;
        this.h = z2;
        this.i = arrayList;
        this.j = j5;
        this.k = f2;
        this.l = j6;
        this.m = j7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tb9)) {
            return false;
        }
        tb9 tb9Var = (tb9) obj;
        return br7.q(this.a, tb9Var.a) && this.b == tb9Var.b && ip8.b(this.c, tb9Var.c) && ip8.b(this.d, tb9Var.d) && this.e == tb9Var.e && Float.compare(this.f, tb9Var.f) == 0 && this.g == tb9Var.g && this.h == tb9Var.h && this.i.equals(tb9Var.i) && ip8.b(this.j, tb9Var.j) && Float.compare(this.k, tb9Var.k) == 0 && ip8.b(this.l, tb9Var.l) && ip8.b(this.m, tb9Var.m);
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        return ev6.n(this.m) + ((ev6.n(this.l) + km4.p(this.k, (ev6.n(this.j) + b09.p(this.i, (((km4.p(this.f, (((ev6.n(this.d) + ((ev6.n(this.c) + (((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31)) * 31)) * 31) + (this.e ? 1231 : 1237)) * 31, 31) + this.g) * 31) + (this.h ? 1231 : 1237)) * 31, 31)) * 31, 31)) * 31);
    }

    public final String toString() {
        return "PointerInputEventData(id=" + ((Object) br7.y(this.a)) + ", uptime=" + this.b + ", positionOnScreen=" + ((Object) ip8.g(this.c)) + ", position=" + ((Object) ip8.g(this.d)) + ", down=" + this.e + ", pressure=" + this.f + ", type=" + ((Object) ac9.a(this.g)) + ", activeHover=" + this.h + ", historical=" + this.i + ", scrollDelta=" + ((Object) ip8.g(this.j)) + ", scaleGestureFactor=" + this.k + ", panGestureOffset=" + ((Object) ip8.g(this.l)) + ", originalEventPosition=" + ((Object) ip8.g(this.m)) + ')';
    }
}
