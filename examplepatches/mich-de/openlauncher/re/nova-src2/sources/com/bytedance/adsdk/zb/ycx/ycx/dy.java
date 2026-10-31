package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.ListIterator;

/* loaded from: classes2.dex */
public class dy implements ea, jc, lud, ry, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.sya.ycx f23157dj;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> fby;

    /* renamed from: jc, reason: collision with root package name */
    private dj f23158jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.dy f23159jw;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23160lt;
    private final String lud;
    private final com.bytedance.adsdk.zb.jw sya;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f23161ul;
    private final Matrix ycx = new Matrix();

    /* renamed from: zb, reason: collision with root package name */
    private final Path f23162zb = new Path();

    public dy(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.ok okVar) {
        this.sya = jwVar;
        this.f23157dj = ycxVar;
        this.lud = okVar.ycx();
        this.f23160lt = okVar.lud();
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = okVar.zb().ycx();
        this.f23161ul = ycxVarYcx;
        ycxVar.ycx(ycxVarYcx);
        ycxVarYcx.ycx(this);
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx2 = okVar.sya().ycx();
        this.fby = ycxVarYcx2;
        ycxVar.ycx(ycxVarYcx2);
        ycxVarYcx2.ycx(this);
        com.bytedance.adsdk.zb.ycx.zb.dy dyVarJc = okVar.dj().jc();
        this.f23159jw = dyVarJc;
        dyVarJc.ycx(ycxVar);
        dyVarJc.ycx(this);
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ry
    public Path dj() {
        Path pathDj = this.f23158jc.dj();
        this.f23162zb.reset();
        float fFloatValue = this.f23161ul.ul().floatValue();
        float fFloatValue2 = this.fby.ul().floatValue();
        for (int i5 = ((int) fFloatValue) - 1; i5 >= 0; i5--) {
            this.ycx.set(this.f23159jw.zb(i5 + fFloatValue2));
            this.f23162zb.addPath(pathDj, this.ycx);
        }
        return this.f23162zb;
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.jc
    public void ycx(ListIterator<sya> listIterator) {
        if (this.f23158jc != null) {
            return;
        }
        while (listIterator.hasPrevious() && listIterator.previous() != this) {
        }
        ArrayList arrayList = new ArrayList();
        while (listIterator.hasPrevious()) {
            arrayList.add(listIterator.previous());
            listIterator.remove();
        }
        Collections.reverse(arrayList);
        this.f23158jc = new dj(this.sya, this.f23157dj, "Repeater", this.f23160lt, arrayList, null);
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
        this.f23158jc.ycx(list, list2);
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        float fFloatValue = this.f23161ul.ul().floatValue();
        float fFloatValue2 = this.fby.ul().floatValue();
        float fFloatValue3 = this.f23159jw.zb().ul().floatValue() / 100.0f;
        float fFloatValue4 = this.f23159jw.sya().ul().floatValue() / 100.0f;
        for (int i11 = ((int) fFloatValue) - 1; i11 >= 0; i11--) {
            this.ycx.set(matrix);
            float f11 = i11;
            this.ycx.preConcat(this.f23159jw.zb(f11 + fFloatValue2));
            this.f23158jc.ycx(canvas, this.ycx, (int) (com.bytedance.adsdk.zb.lt.lud.ycx(fFloatValue3, fFloatValue4, f11 / fFloatValue) * i5));
        }
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        this.f23158jc.ycx(rectF, matrix, z11);
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.sya.invalidateSelf();
    }
}
