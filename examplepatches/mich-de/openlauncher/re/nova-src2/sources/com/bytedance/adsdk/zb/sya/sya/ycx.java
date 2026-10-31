package com.bytedance.adsdk.zb.sya.sya;

import android.content.Context;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.os.Build;
import com.bytedance.adsdk.zb.sya.sya.lud;
import com.bytedance.adsdk.zb.sya.zb.fby;
import com.bytedance.adsdk.zb.sya.zb.xkz;
import com.bytedance.adsdk.zb.ycx.zb.dy;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

/* loaded from: classes2.dex */
public abstract class ycx implements com.bytedance.adsdk.zb.ycx.ycx.lud, ycx.InterfaceC0028ycx {
    private float aeu;

    /* renamed from: av, reason: collision with root package name */
    private Paint f22999av;
    private boolean bhi;

    /* renamed from: dj, reason: collision with root package name */
    final dy f23000dj;

    /* renamed from: dv, reason: collision with root package name */
    private ycx f23001dv;

    /* renamed from: dy, reason: collision with root package name */
    private final RectF f23002dy;

    /* renamed from: ea, reason: collision with root package name */
    private final Paint f23003ea;

    /* renamed from: hf, reason: collision with root package name */
    private final List<com.bytedance.adsdk.zb.ycx.zb.ycx<?, ?>> f23004hf;
    private final String htf;

    /* renamed from: lt, reason: collision with root package name */
    BlurMaskFilter f23007lt;
    float lud;

    /* renamed from: ok, reason: collision with root package name */
    private final Paint f23008ok;
    private List<ycx> oty;
    private final RectF pmi;
    private final Matrix rmf;

    /* renamed from: ry, reason: collision with root package name */
    private final Paint f23009ry;
    final lud sya;
    private final RectF syc;
    private com.bytedance.adsdk.zb.ycx.zb.fby thx;

    /* renamed from: tn, reason: collision with root package name */
    private ycx f23010tn;
    private boolean tru;

    /* renamed from: uh, reason: collision with root package name */
    private final RectF f23011uh;
    private final RectF wie;
    private com.bytedance.adsdk.zb.ycx.zb.dj wwx;
    private final Paint xkz;
    final Matrix ycx;

    /* renamed from: zb, reason: collision with root package name */
    final com.bytedance.adsdk.zb.jw f23013zb;

    /* renamed from: ul, reason: collision with root package name */
    private final Path f23012ul = new Path();
    private final Matrix fby = new Matrix();

    /* renamed from: jw, reason: collision with root package name */
    private final Matrix f23006jw = new Matrix();

    /* renamed from: jc, reason: collision with root package name */
    private final Paint f23005jc = new com.bytedance.adsdk.zb.ycx.ycx(1);

    /* renamed from: com.bytedance.adsdk.zb.sya.sya.ycx$2, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] ycx;

        /* renamed from: zb, reason: collision with root package name */
        static final /* synthetic */ int[] f23014zb;

        static {
            int[] iArr = new int[fby.ycx.values().length];
            f23014zb = iArr;
            try {
                iArr[fby.ycx.MASK_MODE_NONE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                f23014zb[fby.ycx.MASK_MODE_SUBTRACT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                f23014zb[fby.ycx.MASK_MODE_INTERSECT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                f23014zb[fby.ycx.MASK_MODE_ADD.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            int[] iArr2 = new int[lud.ycx.values().length];
            ycx = iArr2;
            try {
                iArr2[lud.ycx.SHAPE.ordinal()] = 1;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                ycx[lud.ycx.PRE_COMP.ordinal()] = 2;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                ycx[lud.ycx.SOLID.ordinal()] = 3;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                ycx[lud.ycx.IMAGE.ordinal()] = 4;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                ycx[lud.ycx.NULL.ordinal()] = 5;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                ycx[lud.ycx.TEXT.ordinal()] = 6;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                ycx[lud.ycx.UNKNOWN.ordinal()] = 7;
            } catch (NoSuchFieldError unused11) {
            }
        }
    }

    public ycx(com.bytedance.adsdk.zb.jw jwVar, lud ludVar) {
        PorterDuff.Mode mode = PorterDuff.Mode.DST_IN;
        this.f23003ea = new com.bytedance.adsdk.zb.ycx.ycx(1, mode);
        PorterDuff.Mode mode2 = PorterDuff.Mode.DST_OUT;
        this.f23008ok = new com.bytedance.adsdk.zb.ycx.ycx(1, mode2);
        com.bytedance.adsdk.zb.ycx.ycx ycxVar = new com.bytedance.adsdk.zb.ycx.ycx(1);
        this.f23009ry = ycxVar;
        this.xkz = new com.bytedance.adsdk.zb.ycx.ycx(PorterDuff.Mode.CLEAR);
        this.syc = new RectF();
        this.f23002dy = new RectF();
        this.wie = new RectF();
        this.pmi = new RectF();
        this.f23011uh = new RectF();
        this.ycx = new Matrix();
        this.f23004hf = new ArrayList();
        this.tru = true;
        this.lud = 0.0f;
        this.rmf = new Matrix();
        this.aeu = 1.0f;
        this.f23013zb = jwVar;
        this.sya = ludVar;
        this.htf = ludVar.lt() + "#draw";
        if (ludVar.ok() == lud.zb.INVERT) {
            ycxVar.setXfermode(new PorterDuffXfermode(mode2));
        } else {
            ycxVar.setXfermode(new PorterDuffXfermode(mode));
        }
        dy dyVarJc = ludVar.syc().jc();
        this.f23000dj = dyVarJc;
        dyVarJc.ycx((ycx.InterfaceC0028ycx) this);
        if (ludVar.jc() != null && !ludVar.jc().isEmpty()) {
            com.bytedance.adsdk.zb.ycx.zb.fby fbyVar = new com.bytedance.adsdk.zb.ycx.zb.fby(ludVar.jc());
            this.thx = fbyVar;
            Iterator<com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path>> it = fbyVar.zb().iterator();
            while (it.hasNext()) {
                it.next().ycx(this);
            }
            for (com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2 : this.thx.sya()) {
                ycx(ycxVar2);
                ycxVar2.ycx(this);
            }
        }
        ok();
    }

    private void ok() {
        if (this.sya.dj().isEmpty()) {
            zb(true);
            return;
        }
        com.bytedance.adsdk.zb.ycx.zb.dj djVar = new com.bytedance.adsdk.zb.ycx.zb.dj(this.sya.dj());
        this.wwx = djVar;
        djVar.ycx();
        this.wwx.ycx(new ycx.InterfaceC0028ycx() { // from class: com.bytedance.adsdk.zb.sya.sya.ycx.1
            @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
            public void ycx() {
                ycx ycxVar = ycx.this;
                ycxVar.zb(ycxVar.wwx.jw() == 1.0f);
            }
        });
        zb(this.wwx.ul().floatValue() == 1.0f);
        ycx(this.wwx);
    }

    private void ry() {
        this.f23013zb.invalidateSelf();
    }

    private void syc() {
        if (this.oty != null) {
            return;
        }
        if (this.f23001dv == null) {
            this.oty = Collections.EMPTY_LIST;
            return;
        }
        this.oty = new ArrayList();
        for (ycx ycxVar = this.f23001dv; ycxVar != null; ycxVar = ycxVar.f23001dv) {
            this.oty.add(ycxVar);
        }
    }

    private boolean xkz() {
        if (this.thx.zb().isEmpty()) {
            return false;
        }
        for (int i5 = 0; i5 < this.thx.ycx().size(); i5++) {
            if (this.thx.ycx().get(i5).ycx() != fby.ycx.MASK_MODE_NONE) {
                return false;
            }
        }
        return true;
    }

    public Matrix dj() {
        return this.rmf;
    }

    public com.bytedance.adsdk.zb.lud.jc ea() {
        return this.sya.dv();
    }

    public boolean fby() {
        return this.tru;
    }

    public com.bytedance.adsdk.zb.sya.zb.ycx jc() {
        return this.sya.tn();
    }

    public String jw() {
        return this.sya.lt();
    }

    public float lt() {
        return this.aeu;
    }

    public String lud() {
        lud ludVar = this.sya;
        if (ludVar != null) {
            return ludVar.ul();
        }
        return null;
    }

    public boolean ul() {
        com.bytedance.adsdk.zb.ycx.zb.fby fbyVar = this.thx;
        return (fbyVar == null || fbyVar.zb().isEmpty()) ? false : true;
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<com.bytedance.adsdk.zb.ycx.ycx.sya> list, List<com.bytedance.adsdk.zb.ycx.ycx.sya> list2) {
    }

    public lud zb() {
        return this.sya;
    }

    private void dj(Canvas canvas, Matrix matrix, com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar, com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2) {
        com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23003ea);
        this.f23012ul.set(ycxVar.ul());
        this.f23012ul.transform(matrix);
        this.f23005jc.setAlpha((int) (ycxVar2.ul().intValue() * 2.55f));
        canvas.drawPath(this.f23012ul, this.f23005jc);
        canvas.restore();
    }

    public boolean sya() {
        return this.f23010tn != null;
    }

    public void zb(ycx ycxVar) {
        this.f23001dv = ycxVar;
    }

    private void lud(Canvas canvas, Matrix matrix, com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar, com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2) {
        com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23003ea);
        canvas.drawRect(this.syc, this.f23005jc);
        this.f23008ok.setAlpha((int) (ycxVar2.ul().intValue() * 2.55f));
        this.f23012ul.set(ycxVar.ul());
        this.f23012ul.transform(matrix);
        canvas.drawPath(this.f23012ul, this.f23008ok);
        canvas.restore();
    }

    private void sya(float f11) {
        this.f23013zb.hf().sya().ycx(this.sya.lt(), f11);
    }

    public static ycx ycx(zb zbVar, lud ludVar, com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, Context context) {
        switch (AnonymousClass2.ycx[ludVar.ea().ordinal()]) {
            case 1:
                return new ul(jwVar, ludVar, zbVar, ulVar);
            case 2:
                return new zb(jwVar, ludVar, ulVar.zb(ludVar.ul()), ulVar, context);
            case 3:
                return new fby(jwVar, ludVar);
            case 4:
                if (ycx(jwVar, ludVar, "text:")) {
                    return new sya(jwVar, ludVar, context);
                }
                if (ycx(jwVar, ludVar, "videoview:")) {
                    return new jc(jwVar, ludVar, context);
                }
                return new dj(jwVar, ludVar);
            case 5:
                return new lt(jwVar, ludVar);
            case 6:
                return new jw(jwVar, ludVar);
            default:
                Objects.toString(ludVar.ea());
                return null;
        }
    }

    private void zb(RectF rectF, Matrix matrix) {
        if (sya() && this.sya.ok() != lud.zb.INVERT) {
            this.pmi.set(0.0f, 0.0f, 0.0f, 0.0f);
            this.f23010tn.ycx(this.pmi, matrix, true);
            if (rectF.intersect(this.pmi)) {
                return;
            }
            rectF.set(0.0f, 0.0f, 0.0f, 0.0f);
        }
    }

    private void sya(Canvas canvas, Matrix matrix, com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar, com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2) {
        com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23008ok);
        canvas.drawRect(this.syc, this.f23005jc);
        this.f23008ok.setAlpha((int) (ycxVar2.ul().intValue() * 2.55f));
        this.f23012ul.set(ycxVar.ul());
        this.f23012ul.transform(matrix);
        canvas.drawPath(this.f23012ul, this.f23008ok);
        canvas.restore();
    }

    public void zb(Canvas canvas, Matrix matrix, int i5) {
        ycx(i5);
    }

    private void zb(Canvas canvas, Matrix matrix, com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar, com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2) {
        com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23005jc);
        canvas.drawRect(this.syc, this.f23005jc);
        this.f23012ul.set(ycxVar.ul());
        this.f23012ul.transform(matrix);
        this.f23005jc.setAlpha((int) (ycxVar2.ul().intValue() * 2.55f));
        canvas.drawPath(this.f23012ul, this.f23008ok);
        canvas.restore();
    }

    private static boolean ycx(com.bytedance.adsdk.zb.jw jwVar, lud ludVar, String str) {
        com.bytedance.adsdk.zb.jc jcVarLt;
        if (jwVar == null || ludVar == null || str == null || (jcVarLt = jwVar.lt(ludVar.ul())) == null) {
            return false;
        }
        return str.equals(jcVarLt.jc());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(boolean z11) {
        if (z11 != this.tru) {
            this.tru = z11;
            ry();
        }
    }

    public void ycx(boolean z11) {
        if (z11 && this.f22999av == null) {
            this.f22999av = new com.bytedance.adsdk.zb.ycx.ycx();
        }
        this.bhi = z11;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        ry();
    }

    public BlurMaskFilter zb(float f11) {
        if (this.lud == f11) {
            return this.f23007lt;
        }
        BlurMaskFilter blurMaskFilter = new BlurMaskFilter(f11 / 2.0f, BlurMaskFilter.Blur.NORMAL);
        this.f23007lt = blurMaskFilter;
        this.lud = f11;
        return blurMaskFilter;
    }

    public void ycx(ycx ycxVar) {
        this.f23010tn = ycxVar;
    }

    public void ycx(com.bytedance.adsdk.zb.ycx.zb.ycx<?, ?> ycxVar) {
        if (ycxVar == null) {
            return;
        }
        this.f23004hf.add(ycxVar);
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        this.syc.set(0.0f, 0.0f, 0.0f, 0.0f);
        syc();
        this.ycx.set(matrix);
        if (z11) {
            List<ycx> list = this.oty;
            if (list != null) {
                for (int size = list.size() - 1; size >= 0; size--) {
                    this.ycx.preConcat(this.oty.get(size).f23000dj.dj());
                }
            } else {
                ycx ycxVar = this.f23001dv;
                if (ycxVar != null) {
                    this.ycx.preConcat(ycxVar.f23000dj.dj());
                }
            }
        }
        this.ycx.preConcat(this.f23000dj.dj());
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        Paint paint;
        Integer numUl;
        com.bytedance.adsdk.zb.lud.ycx(this.htf);
        if (this.tru && !this.sya.wwx()) {
            syc();
            com.bytedance.adsdk.zb.lud.ycx("Layer#parentMatrix");
            this.rmf.set(matrix);
            this.fby.reset();
            this.fby.set(matrix);
            for (int size = this.oty.size() - 1; size >= 0; size--) {
                this.fby.preConcat(this.oty.get(size).f23000dj.dj());
            }
            com.bytedance.adsdk.zb.lud.zb("Layer#parentMatrix");
            com.bytedance.adsdk.zb.ycx.zb.ycx<?, Integer> ycxVarYcx = this.f23000dj.ycx();
            int iIntValue = (int) ((((i5 / 255.0f) * ((ycxVarYcx == null || (numUl = ycxVarYcx.ul()) == null) ? 100 : numUl.intValue())) / 100.0f) * 255.0f);
            if (!sya() && !ul()) {
                this.fby.preConcat(this.f23000dj.dj());
                com.bytedance.adsdk.zb.lud.ycx("Layer#drawLayer");
                zb(canvas, this.fby, iIntValue);
                com.bytedance.adsdk.zb.lud.zb("Layer#drawLayer");
                sya(com.bytedance.adsdk.zb.lud.zb(this.htf));
                return;
            }
            com.bytedance.adsdk.zb.lud.ycx("Layer#computeBounds");
            ycx(this.syc, this.fby, false);
            zb(this.syc, matrix);
            this.fby.preConcat(this.f23000dj.dj());
            ycx(this.syc, this.fby);
            this.f23002dy.set(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight());
            canvas.getMatrix(this.f23006jw);
            if (!this.f23006jw.isIdentity()) {
                Matrix matrix2 = this.f23006jw;
                matrix2.invert(matrix2);
                this.f23006jw.mapRect(this.f23002dy);
            }
            if (!this.syc.intersect(this.f23002dy)) {
                this.syc.set(0.0f, 0.0f, 0.0f, 0.0f);
            }
            com.bytedance.adsdk.zb.lud.zb("Layer#computeBounds");
            if (this.syc.width() >= 1.0f && this.syc.height() >= 1.0f) {
                com.bytedance.adsdk.zb.lud.ycx("Layer#saveLayer");
                this.f23005jc.setAlpha(255);
                com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23005jc);
                com.bytedance.adsdk.zb.lud.zb("Layer#saveLayer");
                ycx(canvas);
                com.bytedance.adsdk.zb.lud.ycx("Layer#drawLayer");
                zb(canvas, this.fby, iIntValue);
                com.bytedance.adsdk.zb.lud.zb("Layer#drawLayer");
                if (ul()) {
                    ycx(canvas, this.fby);
                }
                if (sya()) {
                    com.bytedance.adsdk.zb.lud.ycx("Layer#drawMatte");
                    com.bytedance.adsdk.zb.lud.ycx("Layer#saveLayer");
                    com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23009ry, 19);
                    com.bytedance.adsdk.zb.lud.zb("Layer#saveLayer");
                    ycx(canvas);
                    this.f23010tn.ycx(canvas, matrix, iIntValue);
                    com.bytedance.adsdk.zb.lud.ycx("Layer#restoreLayer");
                    canvas.restore();
                    com.bytedance.adsdk.zb.lud.zb("Layer#restoreLayer");
                    com.bytedance.adsdk.zb.lud.zb("Layer#drawMatte");
                }
                com.bytedance.adsdk.zb.lud.ycx("Layer#restoreLayer");
                canvas.restore();
                com.bytedance.adsdk.zb.lud.zb("Layer#restoreLayer");
            }
            if (this.bhi && (paint = this.f22999av) != null) {
                paint.setStyle(Paint.Style.STROKE);
                this.f22999av.setColor(-251901);
                this.f22999av.setStrokeWidth(4.0f);
                canvas.drawRect(this.syc, this.f22999av);
                this.f22999av.setStyle(Paint.Style.FILL);
                this.f22999av.setColor(1357638635);
                canvas.drawRect(this.syc, this.f22999av);
            }
            sya(com.bytedance.adsdk.zb.lud.zb(this.htf));
            return;
        }
        com.bytedance.adsdk.zb.lud.zb(this.htf);
    }

    private void ycx(Canvas canvas) {
        com.bytedance.adsdk.zb.lud.ycx("Layer#clearLayer");
        RectF rectF = this.syc;
        canvas.drawRect(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f, this.xkz);
        com.bytedance.adsdk.zb.lud.zb("Layer#clearLayer");
    }

    private void ycx(RectF rectF, Matrix matrix) {
        this.wie.set(0.0f, 0.0f, 0.0f, 0.0f);
        if (ul()) {
            int size = this.thx.ycx().size();
            for (int i5 = 0; i5 < size; i5++) {
                com.bytedance.adsdk.zb.sya.zb.fby fbyVar = this.thx.ycx().get(i5);
                Path pathUl = this.thx.zb().get(i5).ul();
                if (pathUl != null) {
                    this.f23012ul.set(pathUl);
                    this.f23012ul.transform(matrix);
                    int i11 = AnonymousClass2.f23014zb[fbyVar.ycx().ordinal()];
                    if (i11 == 1 || i11 == 2) {
                        return;
                    }
                    if ((i11 == 3 || i11 == 4) && fbyVar.dj()) {
                        return;
                    }
                    this.f23012ul.computeBounds(this.f23011uh, false);
                    if (i5 == 0) {
                        this.wie.set(this.f23011uh);
                    } else {
                        RectF rectF2 = this.wie;
                        rectF2.set(Math.min(rectF2.left, this.f23011uh.left), Math.min(this.wie.top, this.f23011uh.top), Math.max(this.wie.right, this.f23011uh.right), Math.max(this.wie.bottom, this.f23011uh.bottom));
                    }
                }
            }
            if (rectF.intersect(this.wie)) {
                return;
            }
            rectF.set(0.0f, 0.0f, 0.0f, 0.0f);
        }
    }

    public void ycx(int i5) {
        this.aeu = (i5 / 255.0f) * ((this.f23000dj.ycx() != null ? this.f23000dj.ycx().ul().intValue() : 100) / 100.0f);
    }

    private void ycx(Canvas canvas, Matrix matrix) {
        com.bytedance.adsdk.zb.lud.ycx("Layer#saveLayer");
        com.bytedance.adsdk.zb.lt.lt.ycx(canvas, this.syc, this.f23003ea, 19);
        if (Build.VERSION.SDK_INT < 28) {
            ycx(canvas);
        }
        com.bytedance.adsdk.zb.lud.zb("Layer#saveLayer");
        for (int i5 = 0; i5 < this.thx.ycx().size(); i5++) {
            com.bytedance.adsdk.zb.sya.zb.fby fbyVar = this.thx.ycx().get(i5);
            com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar = this.thx.zb().get(i5);
            com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2 = this.thx.sya().get(i5);
            int i11 = AnonymousClass2.f23014zb[fbyVar.ycx().ordinal()];
            if (i11 != 1) {
                if (i11 == 2) {
                    if (i5 == 0) {
                        this.f23005jc.setColor(-16777216);
                        this.f23005jc.setAlpha(255);
                        canvas.drawRect(this.syc, this.f23005jc);
                    }
                    if (fbyVar.dj()) {
                        sya(canvas, matrix, ycxVar, ycxVar2);
                    } else {
                        ycx(canvas, matrix, ycxVar);
                    }
                } else if (i11 != 3) {
                    if (i11 == 4) {
                        if (fbyVar.dj()) {
                            zb(canvas, matrix, ycxVar, ycxVar2);
                        } else {
                            ycx(canvas, matrix, ycxVar, ycxVar2);
                        }
                    }
                } else if (fbyVar.dj()) {
                    lud(canvas, matrix, ycxVar, ycxVar2);
                } else {
                    dj(canvas, matrix, ycxVar, ycxVar2);
                }
            } else if (xkz()) {
                this.f23005jc.setAlpha(255);
                canvas.drawRect(this.syc, this.f23005jc);
            }
        }
        com.bytedance.adsdk.zb.lud.ycx("Layer#restoreLayer");
        canvas.restore();
        com.bytedance.adsdk.zb.lud.zb("Layer#restoreLayer");
    }

    private void ycx(Canvas canvas, Matrix matrix, com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar, com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2) {
        this.f23012ul.set(ycxVar.ul());
        this.f23012ul.transform(matrix);
        this.f23005jc.setAlpha((int) (ycxVar2.ul().intValue() * 2.55f));
        canvas.drawPath(this.f23012ul, this.f23005jc);
    }

    private void ycx(Canvas canvas, Matrix matrix, com.bytedance.adsdk.zb.ycx.zb.ycx<xkz, Path> ycxVar) {
        this.f23012ul.set(ycxVar.ul());
        this.f23012ul.transform(matrix);
        canvas.drawPath(this.f23012ul, this.f23008ok);
    }

    public void ycx(float f11) {
        this.f23000dj.ycx(f11);
        if (this.thx != null) {
            for (int i5 = 0; i5 < this.thx.zb().size(); i5++) {
                this.thx.zb().get(i5).ycx(f11);
            }
        }
        com.bytedance.adsdk.zb.ycx.zb.dj djVar = this.wwx;
        if (djVar != null) {
            djVar.ycx(f11);
        }
        ycx ycxVar = this.f23010tn;
        if (ycxVar != null) {
            ycxVar.ycx(f11);
        }
        for (int i11 = 0; i11 < this.f23004hf.size(); i11++) {
            this.f23004hf.get(i11).ycx(f11);
        }
    }
}
