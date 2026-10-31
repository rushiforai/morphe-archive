package o9;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.PointF;
import android.util.AttributeSet;

/* loaded from: classes.dex */
public final class w0 {

    /* renamed from: a, reason: collision with root package name */
    public final x0 f80208a;

    /* renamed from: b, reason: collision with root package name */
    public final float f80209b;

    /* renamed from: c, reason: collision with root package name */
    public final float f80210c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f80211d;

    /* renamed from: e, reason: collision with root package name */
    public final PointF[] f80212e;

    /* renamed from: f, reason: collision with root package name */
    public float f80213f;

    /* renamed from: g, reason: collision with root package name */
    public final PointF[] f80214g;

    /* renamed from: h, reason: collision with root package name */
    public final float[] f80215h;

    /* renamed from: i, reason: collision with root package name */
    public final float[] f80216i;

    /* renamed from: j, reason: collision with root package name */
    public final float[] f80217j;

    public w0(x0 x0Var, Context context, AttributeSet attributeSet) {
        PointF[] pointFArr = new PointF[5];
        this.f80212e = pointFArr;
        this.f80214g = new PointF[]{new PointF(f, f), new PointF(f, f), new PointF(typedArrayObtainStyledAttributes.getFloat(26, f), typedArrayObtainStyledAttributes.getFloat(27, f)), new PointF(typedArrayObtainStyledAttributes.getFloat(18, f), typedArrayObtainStyledAttributes.getFloat(19, f)), new PointF(f, f)};
        float[] fArr = new float[5];
        this.f80215h = fArr;
        float[] fArr2 = new float[5];
        this.f80216i = fArr2;
        float[] fArr3 = new float[5];
        this.f80217j = fArr3;
        this.f80208a = x0Var;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.I);
        this.f80209b = typedArrayObtainStyledAttributes.getFloat(15, 0.0f);
        this.f80210c = typedArrayObtainStyledAttributes.getFloat(14, 0.0f);
        this.f80211d = typedArrayObtainStyledAttributes.getBoolean(6, false);
        float f11 = typedArrayObtainStyledAttributes.getFloat(13, 0.0f);
        float f12 = typedArrayObtainStyledAttributes.getFloat(12, 0.0f);
        pointFArr[0] = new PointF(f11, f12);
        pointFArr[1] = new PointF(f11, f12);
        pointFArr[4] = new PointF(f11, f12);
        pointFArr[2] = new PointF(typedArrayObtainStyledAttributes.getFloat(32, pointFArr[0].x), typedArrayObtainStyledAttributes.getFloat(31, pointFArr[0].y));
        pointFArr[3] = new PointF(typedArrayObtainStyledAttributes.getFloat(24, pointFArr[0].x), typedArrayObtainStyledAttributes.getFloat(23, pointFArr[0].y));
        float f13 = typedArrayObtainStyledAttributes.getFloat(3, 0.0f);
        float f14 = typedArrayObtainStyledAttributes.getFloat(25, f13);
        float f15 = typedArrayObtainStyledAttributes.getFloat(17, f13);
        float f16 = typedArrayObtainStyledAttributes.getFloat(4, f13);
        float f17 = typedArrayObtainStyledAttributes.getFloat(5, f13);
        float f18 = typedArrayObtainStyledAttributes.getFloat(0, f13);
        this.f80213f = f13;
        float f19 = typedArrayObtainStyledAttributes.getFloat(8, 0.0f);
        fArr2[0] = f19;
        fArr2[1] = typedArrayObtainStyledAttributes.getFloat(10, f19);
        fArr2[4] = typedArrayObtainStyledAttributes.getFloat(1, fArr2[0]);
        fArr2[2] = typedArrayObtainStyledAttributes.getFloat(29, fArr2[0]);
        fArr2[3] = typedArrayObtainStyledAttributes.getFloat(21, fArr2[0]);
        float f21 = typedArrayObtainStyledAttributes.getFloat(9, 0.0f);
        fArr3[0] = f21;
        fArr3[1] = typedArrayObtainStyledAttributes.getFloat(11, f21);
        fArr3[4] = typedArrayObtainStyledAttributes.getFloat(2, fArr3[0]);
        fArr3[2] = typedArrayObtainStyledAttributes.getFloat(30, fArr3[0]);
        fArr3[3] = typedArrayObtainStyledAttributes.getFloat(22, fArr3[0]);
        float f22 = typedArrayObtainStyledAttributes.getFloat(7, 0.0f);
        fArr[0] = f22;
        fArr[1] = f22;
        fArr[4] = f22;
        fArr[3] = typedArrayObtainStyledAttributes.getFloat(20, f22);
        fArr[2] = typedArrayObtainStyledAttributes.getFloat(28, fArr[0]);
        typedArrayObtainStyledAttributes.recycle();
    }

    public static void a(w0 w0Var, w0 w0Var2) {
        for (int i5 = 0; i5 < 5; i5++) {
            float[] fArr = w0Var.f80216i;
            fArr[i5] = fArr[i5] + w0Var2.f80216i[i5];
            float[] fArr2 = w0Var.f80217j;
            fArr2[i5] = fArr2[i5] + w0Var2.f80217j[i5];
            PointF pointF = w0Var.f80214g[i5];
            float f11 = pointF.x;
            PointF pointF2 = w0Var2.f80214g[i5];
            pointF.x = f11 + pointF2.x;
            pointF.y += pointF2.y;
            PointF pointF3 = w0Var.f80212e[i5];
            float f12 = pointF3.x;
            PointF pointF4 = w0Var2.f80212e[i5];
            pointF3.x = f12 + pointF4.x;
            pointF3.y += pointF4.y;
            float[] fArr3 = w0Var.f80215h;
            fArr3[i5] = fArr3[i5] + w0Var2.f80215h[i5];
        }
        w0Var.f80213f += w0Var2.f80213f;
    }

    public static void b(w0 w0Var, float f11) {
        for (int i5 = 0; i5 < 5; i5++) {
            float[] fArr = w0Var.f80216i;
            fArr[i5] = fArr[i5] * f11;
            float[] fArr2 = w0Var.f80217j;
            fArr2[i5] = fArr2[i5] * f11;
            PointF pointF = w0Var.f80214g[i5];
            pointF.x *= f11;
            pointF.y *= f11;
            PointF pointF2 = w0Var.f80212e[i5];
            pointF2.x *= f11;
            pointF2.y *= f11;
            float[] fArr3 = w0Var.f80215h;
            fArr3[i5] = fArr3[i5] * f11;
        }
        w0Var.f80213f *= f11;
    }

    public w0(x0 x0Var) {
        this.f80212e = new PointF[5];
        this.f80214g = new PointF[5];
        this.f80215h = new float[5];
        this.f80216i = new float[5];
        this.f80217j = new float[5];
        this.f80208a = x0Var;
        this.f80209b = 0.0f;
        this.f80210c = 0.0f;
        this.f80211d = false;
        for (int i5 = 0; i5 < 5; i5++) {
            this.f80216i[i5] = 0.0f;
            this.f80217j[i5] = 0.0f;
            this.f80214g[i5] = new PointF();
            this.f80212e[i5] = new PointF();
        }
    }
}
