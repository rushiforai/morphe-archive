package com.bytedance.adsdk.zb.sya.sya;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.LongSparseArray;
import com.bytedance.adsdk.zb.sya.sya.lud;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class zb extends ycx {

    /* renamed from: ea, reason: collision with root package name */
    private final Paint f23015ea;
    private final List<ycx> fby;

    /* renamed from: jc, reason: collision with root package name */
    private final RectF f23016jc;

    /* renamed from: jw, reason: collision with root package name */
    private final RectF f23017jw;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f23018ok;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f23019ul;

    /* renamed from: com.bytedance.adsdk.zb.sya.sya.zb$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[lud.zb.values().length];
            ycx = iArr;
            try {
                iArr[lud.zb.ADD.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[lud.zb.INVERT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    public zb(com.bytedance.adsdk.zb.jw jwVar, lud ludVar, List<lud> list, com.bytedance.adsdk.zb.ul ulVar, Context context) {
        int i5;
        ycx ycxVar;
        lud.zb zbVarOk;
        int i11;
        super(jwVar, ludVar);
        this.fby = new ArrayList();
        this.f23017jw = new RectF();
        this.f23016jc = new RectF();
        this.f23015ea = new Paint();
        this.f23018ok = true;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarThx = ludVar.thx();
        if (zbVarThx != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = zbVarThx.ycx();
            this.f23019ul = ycxVarYcx;
            ycx(ycxVarYcx);
            this.f23019ul.ycx(this);
        } else {
            this.f23019ul = null;
        }
        LongSparseArray longSparseArray = new LongSparseArray(ulVar.ry().size());
        int size = list.size() - 1;
        ycx ycxVar2 = null;
        while (true) {
            if (size < 0) {
                break;
            }
            lud ludVar2 = list.get(size);
            ycx ycxVarYcx2 = ycx.ycx(this, ludVar2, jwVar, ulVar, context);
            if (ycxVarYcx2 != null) {
                longSparseArray.put(ycxVarYcx2.zb().lud(), ycxVarYcx2);
                if (ycxVar2 != null) {
                    ycxVar2.ycx(ycxVarYcx2);
                    ycxVar2 = null;
                } else {
                    this.fby.add(0, ycxVarYcx2);
                    if (ludVar2 != null && (zbVarOk = ludVar2.ok()) != null && ((i11 = AnonymousClass1.ycx[zbVarOk.ordinal()]) == 1 || i11 == 2)) {
                        ycxVar2 = ycxVarYcx2;
                    }
                }
            }
            size--;
        }
        for (i5 = 0; i5 < longSparseArray.size(); i5++) {
            ycx ycxVar3 = (ycx) longSparseArray.get(longSparseArray.keyAt(i5));
            if (ycxVar3 != null && (ycxVar = (ycx) longSparseArray.get(ycxVar3.zb().ry())) != null) {
                ycxVar3.zb(ycxVar);
            }
        }
    }

    public List<ycx> ok() {
        return this.fby;
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void ycx(boolean z11) {
        super.ycx(z11);
        Iterator<ycx> it = this.fby.iterator();
        while (it.hasNext()) {
            it.next().ycx(z11);
        }
    }

    public void zb(boolean z11) {
        this.f23018ok = z11;
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        super.zb(canvas, matrix, i5);
        com.bytedance.adsdk.zb.lud.ycx("CompositionLayer#draw");
        this.f23016jc.set(0.0f, 0.0f, this.sya.fby(), this.sya.jw());
        matrix.mapRect(this.f23016jc);
        boolean z11 = this.f23013zb.jw() && this.fby.size() > 1 && i5 != 255;
        if (z11) {
            this.f23015ea.setAlpha(i5);
            com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.f23016jc, this.f23015ea);
        } else {
            canvas.save();
        }
        if (z11) {
            i5 = 255;
        }
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            if (((this.f23018ok || !"__container".equals(this.sya.lt())) && !this.f23016jc.isEmpty()) ? canvas.clipRect(this.f23016jc) : true) {
                this.fby.get(size).ycx(canvas, matrix, i5);
            }
        }
        canvas.restore();
        com.bytedance.adsdk.zb.lud.zb("CompositionLayer#draw");
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        super.ycx(rectF, matrix, z11);
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            this.f23017jw.set(0.0f, 0.0f, 0.0f, 0.0f);
            this.fby.get(size).ycx(this.f23017jw, this.ycx, true);
            rectF.union(this.f23017jw);
        }
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void ycx(float f11) {
        super.ycx(f11);
        if (this.f23019ul != null) {
            f11 = ((this.sya.ycx().ok() * this.f23019ul.ul().floatValue()) - this.sya.ycx().lt()) / (this.f23013zb.hf().wie() + 0.01f);
        }
        if (this.f23019ul == null) {
            f11 -= this.sya.sya();
        }
        if (this.sya.zb() != 0.0f && !"__container".equals(this.sya.lt())) {
            f11 /= this.sya.zb();
        }
        for (int size = this.fby.size() - 1; size >= 0; size--) {
            this.fby.get(size).ycx(f11);
        }
    }
}
