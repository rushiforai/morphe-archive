package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes3.dex */
public final class w0 implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final e1 f30932a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30933b;

    /* renamed from: c, reason: collision with root package name */
    public final j4 f30934c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f30935d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f30936e;

    public w0(e1 e1Var, int i5, j4 j4Var, boolean z11, boolean z12) {
        this.f30932a = e1Var;
        this.f30933b = i5;
        this.f30934c = j4Var;
        this.f30935d = z11;
        this.f30936e = z12;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f30933b - ((w0) obj).f30933b;
    }
}
