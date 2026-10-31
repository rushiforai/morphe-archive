package gf;

/* loaded from: classes3.dex */
public class u {

    /* renamed from: a, reason: collision with root package name */
    public final Object f57640a;

    /* renamed from: b, reason: collision with root package name */
    public final int f57641b;

    /* renamed from: c, reason: collision with root package name */
    public final int f57642c;

    /* renamed from: d, reason: collision with root package name */
    public final long f57643d;

    /* renamed from: e, reason: collision with root package name */
    public final int f57644e;

    public u(long j11, Object obj) {
        this(obj, -1, -1, j11, -1);
    }

    public final boolean a() {
        return this.f57641b != -1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return this.f57640a.equals(uVar.f57640a) && this.f57641b == uVar.f57641b && this.f57642c == uVar.f57642c && this.f57643d == uVar.f57643d && this.f57644e == uVar.f57644e;
    }

    public final int hashCode() {
        return ((((((((this.f57640a.hashCode() + 527) * 31) + this.f57641b) * 31) + this.f57642c) * 31) + ((int) this.f57643d)) * 31) + this.f57644e;
    }

    public u(u uVar) {
        this.f57640a = uVar.f57640a;
        this.f57641b = uVar.f57641b;
        this.f57642c = uVar.f57642c;
        this.f57643d = uVar.f57643d;
        this.f57644e = uVar.f57644e;
    }

    public u(Object obj, int i5, int i11, long j11, int i12) {
        this.f57640a = obj;
        this.f57641b = i5;
        this.f57642c = i11;
        this.f57643d = j11;
        this.f57644e = i12;
    }
}
