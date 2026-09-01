package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rb9 {
    public final long a;
    public final long b;
    public final long c;
    public final boolean d;
    public final float e;
    public final long f;
    public final long g;
    public final boolean h;
    public final int i;
    public final long j;
    public final float k;
    public final long l;
    public final ArrayList m;
    public final long n;
    public boolean o;
    public boolean p;
    public rb9 q;

    public rb9(long j, long j2, long j3, boolean z, float f, long j4, long j5, boolean z2, boolean z3, int i, long j6, float f2, long j7) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = z;
        this.e = f;
        this.f = j4;
        this.g = j5;
        this.h = z2;
        this.i = i;
        this.j = j6;
        this.k = f2;
        this.l = j7;
        this.n = 0L;
        this.o = z3;
        this.p = z3;
    }

    public final void a() {
        rb9 rb9Var = this.q;
        if (rb9Var == null) {
            this.o = true;
            this.p = true;
        } else if (rb9Var != null) {
            rb9Var.a();
        }
    }

    public final boolean b() {
        rb9 rb9Var = this.q;
        return rb9Var != null ? rb9Var.b() : this.o || this.p;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("PointerInputChange(id=");
        sb.append((Object) br7.y(this.a));
        sb.append(", uptimeMillis=");
        sb.append(this.b);
        sb.append(", position=");
        sb.append((Object) ip8.g(this.c));
        sb.append(", pressed=");
        sb.append(this.d);
        sb.append(", pressure=");
        sb.append(this.e);
        sb.append(", previousUptimeMillis=");
        sb.append(this.f);
        sb.append(", previousPosition=");
        sb.append((Object) ip8.g(this.g));
        sb.append(", previousPressed=");
        sb.append(this.h);
        sb.append(", isConsumed=");
        sb.append(b());
        sb.append(", type=");
        sb.append((Object) ac9.a(this.i));
        sb.append(", historical=");
        Object obj = this.m;
        if (obj == null) {
            obj = ey3.a;
        }
        sb.append(obj);
        sb.append(", scrollDelta=");
        sb.append((Object) ip8.g(this.j));
        sb.append(", scaleFactor=");
        sb.append(this.k);
        sb.append(", panOffset=");
        sb.append((Object) ip8.g(this.l));
        sb.append(')');
        return sb.toString();
    }

    public rb9(long j, long j2, long j3, boolean z, float f, long j4, long j5, boolean z2, int i, ArrayList arrayList, long j6, float f2, long j7, long j8) {
        this(j, j2, j3, z, f, j4, j5, z2, false, i, j6, f2, j7);
        this.m = arrayList;
        this.n = j8;
    }
}
