package r10;

import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes4.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f85266a = false;

    /* renamed from: b, reason: collision with root package name */
    public int f85267b = 0;

    /* renamed from: c, reason: collision with root package name */
    public boolean f85268c = false;

    /* renamed from: d, reason: collision with root package name */
    public int f85269d = -1;

    /* renamed from: e, reason: collision with root package name */
    public int f85270e = 0;

    /* renamed from: f, reason: collision with root package name */
    public boolean f85271f = false;

    /* renamed from: g, reason: collision with root package name */
    public int f85272g = LayoutNode.NotPlacedPlaceOrder;

    public final String toString() {
        int i5 = this.f85269d;
        int i11 = this.f85270e;
        boolean z11 = this.f85266a;
        int i12 = this.f85267b;
        boolean z12 = this.f85271f;
        boolean z13 = this.f85268c;
        int i13 = this.f85272g;
        StringBuilder sbT = b.c0.t(i5, "MatchState(titleIndex=", ", queryIndex=", i11, ", lastWasNotLetter=");
        sbT.append(z11);
        sbT.append(", lastWasUpper=");
        sbT.append(i12);
        sbT.append(", lastWasMatch=");
        a80.m.s(sbT, z12, ", nonUpperSinceLastUpper=", z13, ", matchStrength=");
        return b.c0.o(sbT, i13, ")");
    }
}
