package com.amplitude;

import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class Q {

    /* renamed from: a, reason: collision with root package name */
    public final String f20362a;

    /* renamed from: b, reason: collision with root package name */
    public final int f20363b;

    /* renamed from: c, reason: collision with root package name */
    public final int f20364c;

    /* renamed from: d, reason: collision with root package name */
    public final y3.c f20365d;

    /* renamed from: e, reason: collision with root package name */
    public final y3.n f20366e;

    /* renamed from: f, reason: collision with root package name */
    public final long f20367f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f20368g;

    /* renamed from: h, reason: collision with root package name */
    public final float f20369h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f20370i;

    public Q(String nodeName, int i5, int i11, y3.c density, y3.n layoutDirection, long j11, ArrayList nodes, float f11, boolean z11) {
        Intrinsics.g(nodeName, "nodeName");
        Intrinsics.g(density, "density");
        Intrinsics.g(layoutDirection, "layoutDirection");
        Intrinsics.g(nodes, "nodes");
        this.f20362a = nodeName;
        this.f20363b = i5;
        this.f20364c = i11;
        this.f20365d = density;
        this.f20366e = layoutDirection;
        this.f20367f = j11;
        this.f20368g = nodes;
        this.f20369h = f11;
        this.f20370i = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Q)) {
            return false;
        }
        Q q5 = (Q) obj;
        return Intrinsics.b(this.f20362a, q5.f20362a) && this.f20363b == q5.f20363b && this.f20364c == q5.f20364c && Intrinsics.b(this.f20365d, q5.f20365d) && this.f20366e == q5.f20366e && h2.b.b(this.f20367f, q5.f20367f) && Intrinsics.b(this.f20368g, q5.f20368g) && Float.compare(this.f20369h, q5.f20369h) == 0 && this.f20370i == q5.f20370i;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f20370i) + a80.m.d(this.f20369h, (this.f20368g.hashCode() + b.c0.d((this.f20366e.hashCode() + ((this.f20365d.hashCode() + b.u4.a(this.f20364c, b.u4.a(this.f20363b, this.f20362a.hashCode() * 31, 31), 31)) * 31)) * 31, 31, this.f20367f)) * 31, 31);
    }

    public final String toString() {
        String str = this.f20362a;
        int i5 = this.f20363b;
        int i11 = this.f20364c;
        y3.c cVar = this.f20365d;
        y3.n nVar = this.f20366e;
        String strI = h2.b.i(this.f20367f);
        ArrayList arrayList = this.f20368g;
        float f11 = this.f20369h;
        boolean z11 = this.f20370i;
        StringBuilder sbV = b.c0.v("CompositionData(nodeName=", i5, str, ", width=", ", height=");
        sbV.append(i11);
        sbV.append(", density=");
        sbV.append(cVar);
        sbV.append(", layoutDirection=");
        sbV.append(nVar);
        sbV.append(", offset=");
        sbV.append(strI);
        sbV.append(", nodes=");
        sbV.append(arrayList);
        sbV.append(", contentAlpha=");
        sbV.append(f11);
        sbV.append(", isNodeMasked=");
        return a80.m.k(sbV, z11, ")");
    }
}
