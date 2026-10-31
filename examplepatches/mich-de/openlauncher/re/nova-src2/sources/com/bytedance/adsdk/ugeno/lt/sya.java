package com.bytedance.adsdk.ugeno.lt;

import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dy, reason: collision with root package name */
    int f22425dy;

    /* renamed from: ea, reason: collision with root package name */
    float f22426ea;
    int fby;

    /* renamed from: jc, reason: collision with root package name */
    float f22427jc;

    /* renamed from: jw, reason: collision with root package name */
    int f22428jw;

    /* renamed from: lt, reason: collision with root package name */
    int f22429lt;
    int lud;

    /* renamed from: ok, reason: collision with root package name */
    int f22430ok;
    boolean pmi;

    /* renamed from: ry, reason: collision with root package name */
    int f22431ry;
    int syc;

    /* renamed from: ul, reason: collision with root package name */
    int f22432ul;
    boolean wie;
    int ycx = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: zb, reason: collision with root package name */
    int f22433zb = LayoutNode.NotPlacedPlaceOrder;
    int sya = Integer.MIN_VALUE;

    /* renamed from: dj, reason: collision with root package name */
    int f22424dj = Integer.MIN_VALUE;
    List<Integer> xkz = new ArrayList();

    public int ycx() {
        return this.f22432ul;
    }

    public int zb() {
        return this.fby - this.f22428jw;
    }

    public void ycx(View view, int i5, int i11, int i12, int i13) {
        zb zbVar = (zb) view.getLayoutParams();
        this.ycx = Math.min(this.ycx, (view.getLeft() - zbVar.ry()) - i5);
        this.f22433zb = Math.min(this.f22433zb, (view.getTop() - zbVar.xkz()) - i11);
        this.sya = Math.max(this.sya, zbVar.syc() + view.getRight() + i12);
        this.f22424dj = Math.max(this.f22424dj, zbVar.dy() + view.getBottom() + i13);
    }
}
