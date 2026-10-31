package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class dj implements lud, ry, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final Path f23150dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.dy f23151ea;
    private final List<sya> fby;

    /* renamed from: jc, reason: collision with root package name */
    private List<ry> f23152jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.jw f23153jw;

    /* renamed from: lt, reason: collision with root package name */
    private final String f23154lt;
    private final RectF lud;
    private final Matrix sya;

    /* renamed from: ul, reason: collision with root package name */
    private final boolean f23155ul;
    private final Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final RectF f23156zb;

    public dj(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.dy dyVar, com.bytedance.adsdk.zb.ul ulVar) {
        this(jwVar, ycxVar, dyVar.ycx(), dyVar.sya(), ycx(jwVar, ulVar, ycxVar, dyVar.zb()), ycx(dyVar.zb()));
    }

    private boolean lud() {
        int i5 = 0;
        for (int i11 = 0; i11 < this.fby.size(); i11++) {
            if ((this.fby.get(i11) instanceof lud) && (i5 = i5 + 1) >= 2) {
                return true;
            }
        }
        return false;
    }

    private static List<sya> ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, List<com.bytedance.adsdk.zb.sya.zb.sya> list) {
        ArrayList arrayList = new ArrayList(list.size());
        for (int i5 = 0; i5 < list.size(); i5++) {
            sya syaVarYcx = list.get(i5).ycx(jwVar, ulVar, ycxVar);
            if (syaVarYcx != null) {
                arrayList.add(syaVarYcx);
            }
        }
        return arrayList;
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ry
    public Path dj() {
        this.sya.reset();
        com.bytedance.adsdk.zb.ycx.zb.dy dyVar = this.f23151ea;
        if (dyVar != null) {
            this.sya.set(dyVar.dj());
        }
        this.f23150dj.reset();
        if (this.f23155ul) {
            return this.f23150dj;
        }
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            sya syaVar = this.fby.get(size);
            if (syaVar instanceof ry) {
                this.f23150dj.addPath(((ry) syaVar).dj(), this.sya);
            }
        }
        return this.f23150dj;
    }

    public Matrix sya() {
        com.bytedance.adsdk.zb.ycx.zb.dy dyVar = this.f23151ea;
        if (dyVar != null) {
            return dyVar.dj();
        }
        this.sya.reset();
        return this.sya;
    }

    public List<ry> zb() {
        if (this.f23152jc == null) {
            this.f23152jc = new ArrayList();
            for (int i5 = 0; i5 < this.fby.size(); i5++) {
                sya syaVar = this.fby.get(i5);
                if (syaVar instanceof ry) {
                    this.f23152jc.add((ry) syaVar);
                }
            }
        }
        return this.f23152jc;
    }

    public dj(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, String str, boolean z11, List<sya> list, com.bytedance.adsdk.zb.sya.ycx.ok okVar) {
        this.ycx = new com.bytedance.adsdk.zb.ycx.ycx();
        this.f23156zb = new RectF();
        this.sya = new Matrix();
        this.f23150dj = new Path();
        this.lud = new RectF();
        this.f23154lt = str;
        this.f23153jw = jwVar;
        this.f23155ul = z11;
        this.fby = list;
        if (okVar != null) {
            com.bytedance.adsdk.zb.ycx.zb.dy dyVarJc = okVar.jc();
            this.f23151ea = dyVarJc;
            dyVarJc.ycx(ycxVar);
            this.f23151ea.ycx(this);
        }
        ArrayList arrayList = new ArrayList();
        for (int size = list.size() - 1; size >= 0; size--) {
            sya syaVar = list.get(size);
            if (syaVar instanceof jc) {
                arrayList.add((jc) syaVar);
            }
        }
        for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
            ((jc) arrayList.get(size2)).ycx(list.listIterator(list.size()));
        }
    }

    public static com.bytedance.adsdk.zb.sya.ycx.ok ycx(List<com.bytedance.adsdk.zb.sya.zb.sya> list) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            com.bytedance.adsdk.zb.sya.zb.sya syaVar = list.get(i5);
            if (syaVar instanceof com.bytedance.adsdk.zb.sya.ycx.ok) {
                return (com.bytedance.adsdk.zb.sya.ycx.ok) syaVar;
            }
        }
        return null;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.f23153jw.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
        ArrayList arrayList = new ArrayList(this.fby.size() + list.size());
        arrayList.addAll(list);
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            sya syaVar = this.fby.get(size);
            syaVar.ycx(arrayList, this.fby.subList(0, size));
            arrayList.add(syaVar);
        }
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        if (this.f23155ul) {
            return;
        }
        this.sya.set(matrix);
        com.bytedance.adsdk.zb.ycx.zb.dy dyVar = this.f23151ea;
        if (dyVar != null) {
            this.sya.preConcat(dyVar.dj());
            i5 = (int) (((((this.f23151ea.ycx() == null ? 100 : this.f23151ea.ycx().ul().intValue()) / 100.0f) * i5) / 255.0f) * 255.0f);
        }
        boolean z11 = this.f23153jw.jw() && lud() && i5 != 255;
        if (z11) {
            this.f23156zb.set(0.0f, 0.0f, 0.0f, 0.0f);
            ycx(this.f23156zb, this.sya, true);
            this.ycx.setAlpha(i5);
            com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.f23156zb, this.ycx);
        }
        if (z11) {
            i5 = 255;
        }
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            sya syaVar = this.fby.get(size);
            if (syaVar instanceof lud) {
                ((lud) syaVar).ycx(canvas, this.sya, i5);
            }
        }
        if (z11) {
            canvas.restore();
        }
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        this.sya.set(matrix);
        com.bytedance.adsdk.zb.ycx.zb.dy dyVar = this.f23151ea;
        if (dyVar != null) {
            this.sya.preConcat(dyVar.dj());
        }
        this.lud.set(0.0f, 0.0f, 0.0f, 0.0f);
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            sya syaVar = this.fby.get(size);
            if (syaVar instanceof lud) {
                ((lud) syaVar).ycx(this.lud, this.sya, z11);
                rectF.union(this.lud);
            }
        }
    }
}
