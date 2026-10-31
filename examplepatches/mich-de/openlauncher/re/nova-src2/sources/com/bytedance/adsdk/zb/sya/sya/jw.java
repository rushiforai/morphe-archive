package com.bytedance.adsdk.zb.sya.sya;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.util.LongSparseArray;
import com.bytedance.adsdk.zb.htf;
import com.bytedance.adsdk.zb.sya.ycx.ea;
import com.bytedance.adsdk.zb.sya.zb;
import com.bytedance.adsdk.zb.sya.zb.dy;
import com.bytedance.adsdk.zb.ycx.zb.syc;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class jw extends com.bytedance.adsdk.zb.sya.sya.ycx {

    /* renamed from: dv, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f22961dv;

    /* renamed from: dy, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.jw f22962dy;

    /* renamed from: ea, reason: collision with root package name */
    private final Paint f22963ea;
    private final RectF fby;

    /* renamed from: hf, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f22964hf;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> htf;

    /* renamed from: jc, reason: collision with root package name */
    private final Paint f22965jc;

    /* renamed from: jw, reason: collision with root package name */
    private final Matrix f22966jw;

    /* renamed from: ok, reason: collision with root package name */
    private final Map<com.bytedance.adsdk.zb.sya.dj, List<com.bytedance.adsdk.zb.ycx.ycx.dj>> f22967ok;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> oty;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> pmi;

    /* renamed from: ry, reason: collision with root package name */
    private final LongSparseArray<String> f22968ry;
    private final syc syc;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> thx;

    /* renamed from: tn, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f22969tn;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Typeface, Typeface> tru;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> f22970uh;

    /* renamed from: ul, reason: collision with root package name */
    private final StringBuilder f22971ul;
    private final com.bytedance.adsdk.zb.ul wie;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> wwx;
    private final List<ycx> xkz;

    /* renamed from: com.bytedance.adsdk.zb.sya.sya.jw$3, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[zb.ycx.values().length];
            ycx = iArr;
            try {
                iArr[zb.ycx.LEFT_ALIGN.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[zb.ycx.RIGHT_ALIGN.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[zb.ycx.CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public static class ycx {
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private float f22972zb;

        private ycx() {
            this.ycx = b.f42142b;
            this.f22972zb = 0.0f;
        }

        public void ycx(String str, float f11) {
            this.ycx = str;
            this.f22972zb = f11;
        }
    }

    public jw(com.bytedance.adsdk.zb.jw jwVar, lud ludVar) {
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar2;
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVar;
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVar2;
        super(jwVar, ludVar);
        this.f22971ul = new StringBuilder(2);
        this.fby = new RectF();
        this.f22966jw = new Matrix();
        int i5 = 1;
        this.f22965jc = new Paint(i5) { // from class: com.bytedance.adsdk.zb.sya.sya.jw.1
            {
                setStyle(Paint.Style.FILL);
            }
        };
        this.f22963ea = new Paint(i5) { // from class: com.bytedance.adsdk.zb.sya.sya.jw.2
            {
                setStyle(Paint.Style.STROKE);
            }
        };
        this.f22967ok = new HashMap();
        this.f22968ry = new LongSparseArray<>();
        this.xkz = new ArrayList();
        this.f22962dy = jwVar;
        this.wie = ludVar.ycx();
        syc sycVarYcx = ludVar.uh().ycx();
        this.syc = sycVarYcx;
        sycVarYcx.ycx(this);
        ycx(sycVarYcx);
        ea eaVarHtf = ludVar.htf();
        if (eaVarHtf != null && (ycxVar2 = eaVarHtf.ycx) != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVarYcx = ycxVar2.ycx();
            this.pmi = ycxVarYcx;
            ycxVarYcx.ycx(this);
            ycx(this.pmi);
        }
        if (eaVarHtf != null && (ycxVar = eaVarHtf.f23023zb) != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVarYcx2 = ycxVar.ycx();
            this.htf = ycxVarYcx2;
            ycxVarYcx2.ycx(this);
            ycx(this.htf);
        }
        if (eaVarHtf != null && (zbVar2 = eaVarHtf.sya) != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx3 = zbVar2.ycx();
            this.wwx = ycxVarYcx3;
            ycxVarYcx3.ycx(this);
            ycx(this.wwx);
        }
        if (eaVarHtf == null || (zbVar = eaVarHtf.f23022dj) == null) {
            return;
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx4 = zbVar.ycx();
        this.f22961dv = ycxVarYcx4;
        ycxVarYcx4.ycx(this);
        ycx(this.f22961dv);
    }

    private boolean sya(int i5) {
        return Character.getType(i5) == 16 || Character.getType(i5) == 27 || Character.getType(i5) == 6 || Character.getType(i5) == 28 || Character.getType(i5) == 8 || Character.getType(i5) == 19;
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        super.ycx(rectF, matrix, z11);
        rectF.set(0.0f, 0.0f, this.wie.dj().width(), this.wie.dj().height());
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        super.zb(canvas, matrix, i5);
        com.bytedance.adsdk.zb.sya.zb zbVarUl = this.syc.ul();
        com.bytedance.adsdk.zb.sya.sya syaVar = this.wie.syc().get(zbVarUl.f23038zb);
        if (syaVar == null) {
            return;
        }
        canvas.save();
        canvas.concat(matrix);
        ycx(zbVarUl, matrix);
        if (this.f22962dy.oty()) {
            ycx(zbVarUl, matrix, syaVar, canvas);
        } else {
            ycx(zbVarUl, syaVar, canvas);
        }
        canvas.restore();
    }

    private void ycx(com.bytedance.adsdk.zb.sya.zb zbVar, Matrix matrix) {
        com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar = this.f22970uh;
        if (ycxVar != null) {
            this.f22965jc.setColor(ycxVar.ul().intValue());
        } else {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar2 = this.pmi;
            if (ycxVar2 != null) {
                this.f22965jc.setColor(ycxVar2.ul().intValue());
            } else {
                this.f22965jc.setColor(zbVar.fby);
            }
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar3 = this.thx;
        if (ycxVar3 != null) {
            this.f22963ea.setColor(ycxVar3.ul().intValue());
        } else {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVar4 = this.htf;
            if (ycxVar4 != null) {
                this.f22963ea.setColor(ycxVar4.ul().intValue());
            } else {
                this.f22963ea.setColor(zbVar.f23033jw);
            }
        }
        int iIntValue = ((this.f23000dj.ycx() == null ? 100 : this.f23000dj.ycx().ul().intValue()) * 255) / 100;
        this.f22965jc.setAlpha(iIntValue);
        this.f22963ea.setAlpha(iIntValue);
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar5 = this.f22969tn;
        if (ycxVar5 != null) {
            this.f22963ea.setStrokeWidth(ycxVar5.ul().floatValue());
            return;
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar6 = this.wwx;
        if (ycxVar6 != null) {
            this.f22963ea.setStrokeWidth(ycxVar6.ul().floatValue());
        } else {
            this.f22963ea.setStrokeWidth(com.bytedance.adsdk.zb.lt.lt.ycx() * zbVar.f23032jc);
        }
    }

    private ycx zb(int i5) {
        for (int size = this.xkz.size(); size < i5; size++) {
            this.xkz.add(new ycx());
        }
        return this.xkz.get(i5 - 1);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(com.bytedance.adsdk.zb.sya.zb zbVar, Matrix matrix, com.bytedance.adsdk.zb.sya.sya syaVar, Canvas canvas) {
        float fFloatValue;
        float fFloatValue2;
        int i5;
        jw jwVar = this;
        com.bytedance.adsdk.zb.sya.zb zbVar2 = zbVar;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar = jwVar.f22964hf;
        if (ycxVar != null) {
            fFloatValue = ycxVar.ul().floatValue();
        } else {
            fFloatValue = zbVar2.sya;
        }
        float f11 = fFloatValue / 100.0f;
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx(matrix);
        List<String> listYcx = jwVar.ycx(zbVar2.ycx);
        int size = listYcx.size();
        float f12 = zbVar2.lud / 10.0f;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar2 = jwVar.oty;
        if (ycxVar2 != null) {
            fFloatValue2 = ycxVar2.ul().floatValue();
        } else {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar3 = jwVar.f22961dv;
            if (ycxVar3 != null) {
                fFloatValue2 = ycxVar3.ul().floatValue();
            }
            float f13 = f12;
            int i11 = -1;
            i5 = 0;
            while (i5 < size) {
                String str = listYcx.get(i5);
                PointF pointF = zbVar2.f23036ry;
                List<ycx> listYcx2 = jwVar.ycx(str, pointF == null ? 0.0f : pointF.x, syaVar, f11, f13, true);
                int i12 = 0;
                while (i12 < listYcx2.size()) {
                    ycx ycxVar4 = listYcx2.get(i12);
                    i11++;
                    canvas.save();
                    jwVar.ycx(canvas, zbVar2, i11, ycxVar4.f22972zb);
                    float f14 = f11;
                    com.bytedance.adsdk.zb.sya.zb zbVar3 = zbVar2;
                    float f15 = f13;
                    jwVar.ycx(ycxVar4.ycx, zbVar3, syaVar, canvas, fYcx, f14, f15);
                    f11 = f14;
                    canvas.restore();
                    i12++;
                    jwVar = this;
                    f13 = f15;
                    zbVar2 = zbVar;
                }
                i5++;
                jwVar = this;
                f13 = f13;
                zbVar2 = zbVar;
            }
        }
        f12 += fFloatValue2;
        float f132 = f12;
        int i112 = -1;
        i5 = 0;
        while (i5 < size) {
        }
    }

    private void ycx(String str, com.bytedance.adsdk.zb.sya.zb zbVar, com.bytedance.adsdk.zb.sya.sya syaVar, Canvas canvas, float f11, float f12, float f13) {
        for (int i5 = 0; i5 < str.length(); i5++) {
            com.bytedance.adsdk.zb.sya.dj djVar = this.wie.xkz().get(com.bytedance.adsdk.zb.sya.dj.ycx(str.charAt(i5), syaVar.ycx(), syaVar.sya()));
            if (djVar != null) {
                ycx(djVar, f12, zbVar, canvas);
                canvas.translate((com.bytedance.adsdk.zb.lt.lt.ycx() * ((float) djVar.zb()) * f12) + f13, 0.0f);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x008d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(com.bytedance.adsdk.zb.sya.zb zbVar, com.bytedance.adsdk.zb.sya.sya syaVar, Canvas canvas) {
        float fFloatValue;
        float fFloatValue2;
        int size;
        int i5;
        Typeface typefaceYcx = ycx(syaVar);
        if (typefaceYcx != null) {
            String strZb = zbVar.ycx;
            htf htfVarDv = this.f22962dy.dv();
            if (htfVarDv != null) {
                strZb = htfVarDv.zb(jw(), strZb);
            }
            this.f22965jc.setTypeface(typefaceYcx);
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar = this.f22964hf;
            if (ycxVar != null) {
                fFloatValue = ycxVar.ul().floatValue();
            } else {
                fFloatValue = zbVar.sya;
            }
            this.f22965jc.setTextSize(com.bytedance.adsdk.zb.lt.lt.ycx() * fFloatValue);
            this.f22963ea.setTypeface(this.f22965jc.getTypeface());
            this.f22963ea.setTextSize(this.f22965jc.getTextSize());
            float f11 = zbVar.lud / 10.0f;
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar2 = this.oty;
            if (ycxVar2 != null) {
                fFloatValue2 = ycxVar2.ul().floatValue();
            } else {
                com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar3 = this.f22961dv;
                if (ycxVar3 != null) {
                    fFloatValue2 = ycxVar3.ul().floatValue();
                }
                float fYcx = ((com.bytedance.adsdk.zb.lt.lt.ycx() * f11) * fFloatValue) / 100.0f;
                List<String> listYcx = ycx(strZb);
                size = listYcx.size();
                int i11 = -1;
                i5 = 0;
                while (i5 < size) {
                    String str = listYcx.get(i5);
                    PointF pointF = zbVar.f23036ry;
                    com.bytedance.adsdk.zb.sya.sya syaVar2 = syaVar;
                    List<ycx> listYcx2 = ycx(str, pointF == null ? 0.0f : pointF.x, syaVar2, 0.0f, fYcx, false);
                    for (int i12 = 0; i12 < listYcx2.size(); i12++) {
                        ycx ycxVar4 = listYcx2.get(i12);
                        i11++;
                        canvas.save();
                        ycx(canvas, zbVar, i11, ycxVar4.f22972zb);
                        ycx(ycxVar4.ycx, zbVar, canvas, fYcx);
                        canvas.restore();
                    }
                    i5++;
                    syaVar = syaVar2;
                }
            }
            f11 += fFloatValue2;
            float fYcx2 = ((com.bytedance.adsdk.zb.lt.lt.ycx() * f11) * fFloatValue) / 100.0f;
            List<String> listYcx3 = ycx(strZb);
            size = listYcx3.size();
            int i112 = -1;
            i5 = 0;
            while (i5 < size) {
            }
        }
    }

    private void ycx(Canvas canvas, com.bytedance.adsdk.zb.sya.zb zbVar, int i5, float f11) {
        PointF pointF = zbVar.f23035ok;
        PointF pointF2 = zbVar.f23036ry;
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
        float f12 = (i5 * zbVar.f23034lt * fYcx) + (pointF == null ? 0.0f : (zbVar.f23034lt * 0.6f * fYcx) + pointF.y);
        float f13 = pointF == null ? 0.0f : pointF.x;
        float f14 = pointF2 != null ? pointF2.x : 0.0f;
        int i11 = AnonymousClass3.ycx[zbVar.f23030dj.ordinal()];
        if (i11 == 1) {
            canvas.translate(f13, f12);
        } else if (i11 == 2) {
            canvas.translate((f13 + f14) - f11, f12);
        } else {
            if (i11 != 3) {
                return;
            }
            canvas.translate(((f14 / 2.0f) + f13) - (f11 / 2.0f), f12);
        }
    }

    private Typeface ycx(com.bytedance.adsdk.zb.sya.sya syaVar) {
        Typeface typefaceUl;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Typeface, Typeface> ycxVar = this.tru;
        if (ycxVar != null && (typefaceUl = ycxVar.ul()) != null) {
            return typefaceUl;
        }
        Typeface typefaceYcx = this.f22962dy.ycx(syaVar);
        return typefaceYcx != null ? typefaceYcx : syaVar.dj();
    }

    private List<String> ycx(String str) {
        return Arrays.asList(str.replaceAll("\r\n", "\r").replaceAll("\u0003", "\r").replaceAll("\n", "\r").split("\r"));
    }

    private void ycx(String str, com.bytedance.adsdk.zb.sya.zb zbVar, Canvas canvas, float f11) {
        int length = 0;
        while (length < str.length()) {
            String strYcx = ycx(str, length);
            length += strYcx.length();
            ycx(strYcx, zbVar, canvas);
            canvas.translate(this.f22965jc.measureText(strYcx) + f11, 0.0f);
        }
    }

    private List<ycx> ycx(String str, float f11, com.bytedance.adsdk.zb.sya.sya syaVar, float f12, float f13, boolean z11) {
        float fMeasureText;
        int i5 = 0;
        int i11 = 0;
        boolean z12 = false;
        int i12 = 0;
        float f14 = 0.0f;
        float f15 = 0.0f;
        float f16 = 0.0f;
        for (int i13 = 0; i13 < str.length(); i13++) {
            char cCharAt = str.charAt(i13);
            if (z11) {
                com.bytedance.adsdk.zb.sya.dj djVar = this.wie.xkz().get(com.bytedance.adsdk.zb.sya.dj.ycx(cCharAt, syaVar.ycx(), syaVar.sya()));
                if (djVar != null) {
                    fMeasureText = (com.bytedance.adsdk.zb.lt.lt.ycx() * ((float) djVar.zb()) * f12) + f13;
                }
            } else {
                fMeasureText = this.f22965jc.measureText(str.substring(i13, i13 + 1)) + f13;
            }
            if (cCharAt == ' ') {
                z12 = true;
                f16 = fMeasureText;
            } else if (z12) {
                z12 = false;
                i12 = i13;
                f15 = fMeasureText;
            } else {
                f15 += fMeasureText;
            }
            f14 += fMeasureText;
            if (f11 > 0.0f && f14 >= f11 && cCharAt != ' ') {
                i5++;
                ycx ycxVarZb = zb(i5);
                if (i12 == i11) {
                    ycxVarZb.ycx(str.substring(i11, i13).trim(), (f14 - fMeasureText) - ((r9.length() - r7.length()) * f16));
                    i11 = i13;
                    i12 = i11;
                    f14 = fMeasureText;
                    f15 = f14;
                } else {
                    ycxVarZb.ycx(str.substring(i11, i12 - 1).trim(), ((f14 - f15) - ((r7.length() - r13.length()) * f16)) - f16);
                    f14 = f15;
                    i11 = i12;
                }
            }
        }
        if (f14 > 0.0f) {
            i5++;
            zb(i5).ycx(str.substring(i11), f14);
        }
        return this.xkz.subList(0, i5);
    }

    private void ycx(com.bytedance.adsdk.zb.sya.dj djVar, float f11, com.bytedance.adsdk.zb.sya.zb zbVar, Canvas canvas) {
        List<com.bytedance.adsdk.zb.ycx.ycx.dj> listYcx = ycx(djVar);
        for (int i5 = 0; i5 < listYcx.size(); i5++) {
            Path pathDj = listYcx.get(i5).dj();
            pathDj.computeBounds(this.fby, false);
            this.f22966jw.reset();
            this.f22966jw.preTranslate(0.0f, com.bytedance.adsdk.zb.lt.lt.ycx() * (-zbVar.f23037ul));
            this.f22966jw.preScale(f11, f11);
            pathDj.transform(this.f22966jw);
            if (zbVar.f23031ea) {
                ycx(pathDj, this.f22965jc, canvas);
                ycx(pathDj, this.f22963ea, canvas);
            } else {
                ycx(pathDj, this.f22963ea, canvas);
                ycx(pathDj, this.f22965jc, canvas);
            }
        }
    }

    private void ycx(Path path, Paint paint, Canvas canvas) {
        if (paint.getColor() == 0) {
            return;
        }
        if (paint.getStyle() == Paint.Style.STROKE && paint.getStrokeWidth() == 0.0f) {
            return;
        }
        canvas.drawPath(path, paint);
    }

    private void ycx(String str, com.bytedance.adsdk.zb.sya.zb zbVar, Canvas canvas) {
        if (zbVar.f23031ea) {
            ycx(str, this.f22965jc, canvas);
            ycx(str, this.f22963ea, canvas);
        } else {
            ycx(str, this.f22963ea, canvas);
            ycx(str, this.f22965jc, canvas);
        }
    }

    private void ycx(String str, Paint paint, Canvas canvas) {
        if (paint.getColor() == 0) {
            return;
        }
        if (paint.getStyle() == Paint.Style.STROKE && paint.getStrokeWidth() == 0.0f) {
            return;
        }
        canvas.drawText(str, 0, str.length(), 0.0f, 0.0f, paint);
    }

    private List<com.bytedance.adsdk.zb.ycx.ycx.dj> ycx(com.bytedance.adsdk.zb.sya.dj djVar) {
        if (this.f22967ok.containsKey(djVar)) {
            return this.f22967ok.get(djVar);
        }
        List<dy> listYcx = djVar.ycx();
        int size = listYcx.size();
        ArrayList arrayList = new ArrayList(size);
        for (int i5 = 0; i5 < size; i5++) {
            arrayList.add(new com.bytedance.adsdk.zb.ycx.ycx.dj(this.f22962dy, this, listYcx.get(i5), this.wie));
        }
        this.f22967ok.put(djVar, arrayList);
        return arrayList;
    }

    private String ycx(String str, int i5) {
        int iCodePointAt = str.codePointAt(i5);
        int iCharCount = Character.charCount(iCodePointAt) + i5;
        while (iCharCount < str.length()) {
            int iCodePointAt2 = str.codePointAt(iCharCount);
            if (!sya(iCodePointAt2)) {
                break;
            }
            iCharCount += Character.charCount(iCodePointAt2);
            iCodePointAt = (iCodePointAt * 31) + iCodePointAt2;
        }
        long j11 = iCodePointAt;
        if (this.f22968ry.indexOfKey(j11) >= 0) {
            return this.f22968ry.get(j11);
        }
        this.f22971ul.setLength(0);
        while (i5 < iCharCount) {
            int iCodePointAt3 = str.codePointAt(i5);
            this.f22971ul.appendCodePoint(iCodePointAt3);
            i5 += Character.charCount(iCodePointAt3);
        }
        String string = this.f22971ul.toString();
        this.f22968ry.put(j11, string);
        return string;
    }
}
