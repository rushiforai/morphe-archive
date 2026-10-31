package com.google.android.flexbox;

import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: e, reason: collision with root package name */
    public int f31665e;

    /* renamed from: f, reason: collision with root package name */
    public int f31666f;

    /* renamed from: g, reason: collision with root package name */
    public int f31667g;

    /* renamed from: h, reason: collision with root package name */
    public int f31668h;

    /* renamed from: i, reason: collision with root package name */
    public int f31669i;

    /* renamed from: j, reason: collision with root package name */
    public float f31670j;

    /* renamed from: k, reason: collision with root package name */
    public float f31671k;

    /* renamed from: l, reason: collision with root package name */
    public int f31672l;

    /* renamed from: m, reason: collision with root package name */
    public int f31673m;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f31674p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f31675q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f31676r;

    /* renamed from: a, reason: collision with root package name */
    public int f31661a = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: b, reason: collision with root package name */
    public int f31662b = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: c, reason: collision with root package name */
    public int f31663c = Integer.MIN_VALUE;

    /* renamed from: d, reason: collision with root package name */
    public int f31664d = Integer.MIN_VALUE;
    public final ArrayList n = new ArrayList();

    public final int a() {
        return this.f31668h - this.f31669i;
    }

    public final void b(View view, int i5, int i11, int i12, int i13) {
        FlexItem flexItem = (FlexItem) view.getLayoutParams();
        this.f31661a = Math.min(this.f31661a, (view.getLeft() - flexItem.n0()) - i5);
        this.f31662b = Math.min(this.f31662b, (view.getTop() - flexItem.G()) - i11);
        this.f31663c = Math.max(this.f31663c, view.getRight() + flexItem.z0() + i12);
        this.f31664d = Math.max(this.f31664d, view.getBottom() + flexItem.l0() + i13);
    }
}
