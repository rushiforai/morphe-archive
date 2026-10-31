package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.thx;

/* loaded from: classes2.dex */
public class wie<E extends thx> implements ul<E> {

    /* renamed from: dj, reason: collision with root package name */
    protected com.bytedance.sdk.component.adexpress.dynamic.dj.ul f23475dj;
    protected int lud;
    protected com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud sya;
    protected thx ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected Context f23476zb;

    public wie(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, int i5) {
        this.lud = i5;
        this.f23476zb = context;
        this.sya = ludVar;
        this.f23475dj = ulVar;
        dj();
    }

    public void dj() {
        this.ycx = new thx(this.f23476zb, this.f23475dj.dc());
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23476zb, 200.0f));
        layoutParams.gravity = 81;
        layoutParams.bottomMargin = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23476zb, 100 - this.lud);
        this.ycx.setLayoutParams(layoutParams);
        try {
            this.ycx.setGuideText(this.f23475dj.uf());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6kmT+s/lACo", "aOIkkQaJee6OXtJPjRK0", "UuAkgTW1bNA=", 43);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    /* renamed from: lud, reason: merged with bridge method [inline-methods] */
    public E sya() {
        return (E) this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        this.ycx.ycx();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        this.ycx.zb();
    }

    public wie(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        this(context, ludVar, ulVar, 0);
    }
}
