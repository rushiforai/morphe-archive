package com.google.protobuf;

/* loaded from: classes3.dex */
public final class k0 implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final s0 f34879a;

    /* renamed from: b, reason: collision with root package name */
    public final int f34880b;

    /* renamed from: c, reason: collision with root package name */
    public final t2 f34881c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f34882d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f34883e;

    public k0(s0 s0Var, int i5, t2 t2Var, boolean z11, boolean z12) {
        this.f34879a = s0Var;
        this.f34880b = i5;
        this.f34881c = t2Var;
        this.f34882d = z11;
        this.f34883e = z12;
    }

    public final s0 a() {
        return this.f34879a;
    }

    public final u2 b() {
        return this.f34881c.f34978a;
    }

    public final t2 c() {
        return this.f34881c;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f34880b - ((k0) obj).f34880b;
    }

    public final int getNumber() {
        return this.f34880b;
    }

    public final boolean isPacked() {
        return this.f34883e;
    }

    public final boolean isRepeated() {
        return this.f34882d;
    }
}
