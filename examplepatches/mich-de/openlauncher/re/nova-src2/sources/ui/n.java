package ui;

import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import ni.i0;

/* loaded from: classes.dex */
public final class n extends ni.p {

    /* renamed from: j, reason: collision with root package name */
    public final List f91288j;

    /* renamed from: k, reason: collision with root package name */
    public List f91289k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f91290l;

    /* renamed from: m, reason: collision with root package name */
    public b f91291m;
    public ni.b n;
    public i0 o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f91292p;

    /* renamed from: q, reason: collision with root package name */
    public mi.a f91293q;

    /* renamed from: r, reason: collision with root package name */
    public List f91294r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(String adUnitId, List nativeAdTypes) {
        super(adUnitId);
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(nativeAdTypes, "nativeAdTypes");
        this.f91288j = nativeAdTypes;
        EmptyList emptyList = EmptyList.f71733a;
        this.f91289k = emptyList;
        this.f91291m = b.f91276a;
        this.n = ni.b.f78245c;
        this.f91294r = emptyList;
    }

    @Override // ni.p
    public final ni.p a() {
        return this;
    }

    public final o d() {
        String str = this.f78299a;
        if (str == null) {
            throw new IllegalArgumentException("Ad unit ID cannot be null.");
        }
        return new o(str, this.f78300b, this.f78301c, this.f78302d, this.f78303e, this.f78304f, this.f78305g, this.f78306h, this.f78307i, b70.g.I1(this.f91288j), this.f91289k, this.f91290l, this.f91291m, this.n, this.o, null, false, this.f91292p, this.f91293q, this.f91294r, false, false);
    }
}
