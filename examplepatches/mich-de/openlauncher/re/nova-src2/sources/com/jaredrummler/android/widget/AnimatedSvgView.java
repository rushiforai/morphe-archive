package com.jaredrummler.android.widget;

import a5.a1;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PointF;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.WeakHashMap;
import p6.u;
import to.a;

/* loaded from: classes3.dex */
public class AnimatedSvgView extends View {

    /* renamed from: r, reason: collision with root package name */
    public static final DecelerateInterpolator f35978r = new DecelerateInterpolator();

    /* renamed from: a, reason: collision with root package name */
    public final int f35979a;

    /* renamed from: b, reason: collision with root package name */
    public final int f35980b;

    /* renamed from: c, reason: collision with root package name */
    public final int f35981c;

    /* renamed from: d, reason: collision with root package name */
    public final int f35982d;

    /* renamed from: e, reason: collision with root package name */
    public final int[] f35983e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f35984f;

    /* renamed from: g, reason: collision with root package name */
    public final float f35985g;

    /* renamed from: h, reason: collision with root package name */
    public final float f35986h;

    /* renamed from: i, reason: collision with root package name */
    public final PointF f35987i;

    /* renamed from: j, reason: collision with root package name */
    public final float f35988j;

    /* renamed from: k, reason: collision with root package name */
    public final float f35989k;

    /* renamed from: l, reason: collision with root package name */
    public final Paint f35990l;

    /* renamed from: m, reason: collision with root package name */
    public final int[] f35991m;
    public a[] n;
    public final String[] o;

    /* renamed from: p, reason: collision with root package name */
    public final float f35992p;

    /* renamed from: q, reason: collision with root package name */
    public int f35993q;

    public AnimatedSvgView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f35979a = 2000;
        this.f35980b = 1000;
        this.f35981c = 1200;
        this.f35982d = 1000;
        this.f35987i = new PointF(this.f35985g, this.f35986h);
        this.f35988j = 1.0f;
        this.f35989k = 1.0f;
        this.f35993q = 0;
        Paint paint = new Paint();
        this.f35990l = paint;
        paint.setAntiAlias(true);
        this.f35990l.setStyle(Paint.Style.FILL);
        this.f35984f = new int[]{-16777216};
        this.f35983e = new int[]{838860800};
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, so.a.f87562a);
            this.f35985g = typedArrayObtainStyledAttributes.getInt(4, EventBridgeChannel.QUEUE_CAPACITY);
            this.f35988j = typedArrayObtainStyledAttributes.getInt(4, EventBridgeChannel.QUEUE_CAPACITY);
            this.f35986h = typedArrayObtainStyledAttributes.getInt(5, EventBridgeChannel.QUEUE_CAPACITY);
            this.f35989k = typedArrayObtainStyledAttributes.getInt(5, EventBridgeChannel.QUEUE_CAPACITY);
            this.f35979a = typedArrayObtainStyledAttributes.getInt(9, 2000);
            this.f35980b = typedArrayObtainStyledAttributes.getInt(10, 1000);
            this.f35981c = typedArrayObtainStyledAttributes.getInt(1, 1200);
            this.f35982d = typedArrayObtainStyledAttributes.getInt(2, 1000);
            this.f35992p = TypedValue.applyDimension(1, typedArrayObtainStyledAttributes.getInt(7, 16), getResources().getDisplayMetrics());
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(3, 0);
            int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(8, 0);
            int resourceId3 = typedArrayObtainStyledAttributes.getResourceId(6, 0);
            int resourceId4 = typedArrayObtainStyledAttributes.getResourceId(0, 0);
            typedArrayObtainStyledAttributes.recycle();
            if (resourceId != 0) {
                this.o = getResources().getStringArray(resourceId);
                int iArgb = Color.argb(50, 0, 0, 0);
                String[] strArr = this.o;
                if (strArr == null) {
                    throw new RuntimeException("You need to set the glyphs first.");
                }
                int length = strArr.length;
                int[] iArr = new int[length];
                for (int i5 = 0; i5 < length; i5++) {
                    iArr[i5] = iArgb;
                }
                this.f35983e = iArr;
                String[] strArr2 = this.o;
                if (strArr2 == null) {
                    throw new RuntimeException("You need to set the glyphs first.");
                }
                int length2 = strArr2.length;
                int[] iArr2 = new int[length2];
                for (int i11 = 0; i11 < length2; i11++) {
                    iArr2[i11] = -16777216;
                }
                this.f35984f = iArr2;
            }
            if (resourceId2 != 0) {
                this.f35983e = getResources().getIntArray(resourceId2);
            }
            if (resourceId3 != 0) {
                this.f35984f = getResources().getIntArray(resourceId3);
            }
            if (resourceId4 != 0) {
                this.f35991m = getResources().getIntArray(resourceId4);
            }
            this.f35987i = new PointF(this.f35985g, this.f35986h);
        }
        setLayerType(1, null);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.f35993q == 0 || this.n == null) {
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        int i5 = 0;
        int i11 = 0;
        while (true) {
            if (i11 >= this.n.length) {
                break;
            }
            int i12 = this.f35979a;
            float fMax = Math.max(0.0f, Math.min(1.0f, ((jCurrentTimeMillis - ((((i12 - r11) * i11) * 1.0f) / r4.length)) * 1.0f) / this.f35980b));
            float interpolation = f35978r.getInterpolation(fMax);
            a aVar = this.n[i11];
            float f11 = interpolation * aVar.f89551c;
            aVar.f89550b.setColor(this.f35983e[i11]);
            this.n[i11].f89550b.setPathEffect(new DashPathEffect(new float[]{f11, this.n[i11].f89551c}, 0.0f));
            a aVar2 = this.n[i11];
            canvas.drawPath(aVar2.f89549a, aVar2.f89550b);
            this.n[i11].f89550b.setColor(this.f35984f[i11]);
            this.n[i11].f89550b.setPathEffect(new DashPathEffect(new float[]{0.0f, f11, fMax > 0.0f ? this.f35992p : 0.0f, this.n[i11].f89551c}, 0.0f));
            a aVar3 = this.n[i11];
            canvas.drawPath(aVar3.f89549a, aVar3.f89550b);
            i11++;
        }
        long j11 = this.f35981c;
        int i13 = this.f35982d;
        if (jCurrentTimeMillis > j11) {
            int i14 = this.f35993q;
            if (i14 < 2 && i14 != 2) {
                this.f35993q = 2;
            }
            float fMax2 = Math.max(0.0f, Math.min(1.0f, ((jCurrentTimeMillis - r3) * 1.0f) / i13));
            while (true) {
                a[] aVarArr = this.n;
                if (i5 >= aVarArr.length) {
                    break;
                }
                a aVar4 = aVarArr[i5];
                int i15 = this.f35991m[i5];
                int iAlpha = (int) ((Color.alpha(i15) / 255.0f) * fMax2 * 255.0f);
                int iRed = Color.red(i15);
                int iGreen = Color.green(i15);
                int iBlue = Color.blue(i15);
                Paint paint = this.f35990l;
                paint.setARGB(iAlpha, iRed, iGreen, iBlue);
                canvas.drawPath(aVar4.f89549a, paint);
                i5++;
            }
        }
        if (jCurrentTimeMillis < r3 + i13) {
            WeakHashMap weakHashMap = a1.f250a;
            postInvalidateOnAnimation();
        } else {
            if (this.f35993q == 3) {
                return;
            }
            this.f35993q = 3;
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        float f11;
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        int mode = View.MeasureSpec.getMode(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        if (size2 > 0 || size > 0 || mode2 != 0 || mode != 0) {
            if (size2 <= 0 && mode2 == 0) {
                f11 = (size * this.f35989k) / this.f35988j;
            } else if (size > 0 || mode != 0) {
                float f12 = size;
                float f13 = this.f35989k;
                float f14 = f12 * f13;
                float f15 = size2;
                float f16 = this.f35988j;
                if (f14 > f16 * f15) {
                    size = (int) ((f15 * f16) / f13);
                } else {
                    f11 = (f12 * f13) / f16;
                }
            } else {
                size = (int) ((size2 * this.f35988j) / this.f35989k);
            }
            size2 = (int) f11;
        } else {
            size = 0;
            size2 = 0;
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(size, 1073741824), View.MeasureSpec.makeMeasureSpec(size2, 1073741824));
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        PointF pointF = this.f35987i;
        float f11 = i5 / pointF.x;
        float f12 = i11 / pointF.y;
        Matrix matrix = new Matrix();
        RectF rectF = new RectF(f11, f11, f12, f12);
        matrix.setScale(f11, f12, rectF.centerX(), rectF.centerY());
        this.n = new a[this.o.length];
        int i14 = 0;
        while (true) {
            String[] strArr = this.o;
            if (i14 >= strArr.length) {
                return;
            }
            a[] aVarArr = this.n;
            a aVar = new a();
            aVarArr[i14] = aVar;
            try {
                aVar.f89549a = u.k(strArr[i14]);
                this.n[i14].f89549a.transform(matrix);
            } catch (Exception e3) {
                this.n[i14].f89549a = new Path();
                Log.e("AnimatedSvgView", "Couldn't parse path", e3);
            }
            PathMeasure pathMeasure = new PathMeasure(this.n[i14].f89549a, true);
            do {
                a aVar2 = this.n[i14];
                aVar2.f89551c = Math.max(aVar2.f89551c, pathMeasure.getLength());
            } while (pathMeasure.nextContour());
            this.n[i14].f89550b = new Paint();
            this.n[i14].f89550b.setStyle(Paint.Style.STROKE);
            this.n[i14].f89550b.setAntiAlias(true);
            this.n[i14].f89550b.setColor(-1);
            this.n[i14].f89550b.setStrokeWidth(TypedValue.applyDimension(1, 1.0f, getResources().getDisplayMetrics()));
            i14++;
        }
    }
}
