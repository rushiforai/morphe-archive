package ue;

/* loaded from: classes3.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f90855a;

    /* renamed from: b, reason: collision with root package name */
    public final int f90856b;

    /* renamed from: c, reason: collision with root package name */
    public final int f90857c;

    /* renamed from: d, reason: collision with root package name */
    public int f90858d;

    /* renamed from: e, reason: collision with root package name */
    public String f90859e;

    public d0(int i5, int i11) {
        this(Integer.MIN_VALUE, i5, i11);
    }

    public final void a() {
        int i5 = this.f90858d;
        this.f90858d = i5 == Integer.MIN_VALUE ? this.f90856b : i5 + this.f90857c;
        this.f90859e = this.f90855a + this.f90858d;
    }

    public final void b() {
        if (this.f90858d == Integer.MIN_VALUE) {
            throw new IllegalStateException("generateNewId() must be called before retrieving ids.");
        }
    }

    public d0(int i5, int i11, int i12) {
        this.f90855a = i5 != Integer.MIN_VALUE ? a2.c.h(i5, "/") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f90856b = i11;
        this.f90857c = i12;
        this.f90858d = Integer.MIN_VALUE;
        this.f90859e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
