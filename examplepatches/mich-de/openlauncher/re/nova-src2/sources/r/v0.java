package r;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.RectF;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.method.TransformationMethod;
import android.util.Log;
import android.util.TypedValue;
import android.widget.TextView;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public final class v0 {

    /* renamed from: l, reason: collision with root package name */
    public static final RectF f84888l = new RectF();

    /* renamed from: m, reason: collision with root package name */
    public static final ConcurrentHashMap f84889m = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public int f84890a = 0;

    /* renamed from: b, reason: collision with root package name */
    public boolean f84891b = false;

    /* renamed from: c, reason: collision with root package name */
    public float f84892c = -1.0f;

    /* renamed from: d, reason: collision with root package name */
    public float f84893d = -1.0f;

    /* renamed from: e, reason: collision with root package name */
    public float f84894e = -1.0f;

    /* renamed from: f, reason: collision with root package name */
    public int[] f84895f = new int[0];

    /* renamed from: g, reason: collision with root package name */
    public boolean f84896g = false;

    /* renamed from: h, reason: collision with root package name */
    public TextPaint f84897h;

    /* renamed from: i, reason: collision with root package name */
    public final TextView f84898i;

    /* renamed from: j, reason: collision with root package name */
    public final Context f84899j;

    /* renamed from: k, reason: collision with root package name */
    public final s0 f84900k;

    public v0(TextView textView) {
        this.f84898i = textView;
        this.f84899j = textView.getContext();
        if (Build.VERSION.SDK_INT >= 29) {
            this.f84900k = new t0();
        } else {
            this.f84900k = new s0();
        }
    }

    public static int[] b(int[] iArr) {
        int length = iArr.length;
        if (length != 0) {
            Arrays.sort(iArr);
            ArrayList arrayList = new ArrayList();
            for (int i5 : iArr) {
                if (i5 > 0 && Collections.binarySearch(arrayList, Integer.valueOf(i5)) < 0) {
                    arrayList.add(Integer.valueOf(i5));
                }
            }
            if (length != arrayList.size()) {
                int size = arrayList.size();
                int[] iArr2 = new int[size];
                for (int i11 = 0; i11 < size; i11++) {
                    iArr2[i11] = ((Integer) arrayList.get(i11)).intValue();
                }
                return iArr2;
            }
        }
        return iArr;
    }

    public static Method d(String str) throws SecurityException {
        try {
            ConcurrentHashMap concurrentHashMap = f84889m;
            Method declaredMethod = (Method) concurrentHashMap.get(str);
            if (declaredMethod != null || (declaredMethod = TextView.class.getDeclaredMethod(str, null)) == null) {
                return declaredMethod;
            }
            declaredMethod.setAccessible(true);
            concurrentHashMap.put(str, declaredMethod);
            return declaredMethod;
        } catch (Exception e3) {
            Log.w("ACTVAutoSizeHelper", "Failed to retrieve TextView#" + str + "() method", e3);
            return null;
        }
    }

    public static Object e(Object obj, String str, Object obj2) {
        try {
            return d(str).invoke(obj, null);
        } catch (Exception e3) {
            Log.w("ACTVAutoSizeHelper", "Failed to invoke TextView#" + str + "() method", e3);
            return obj2;
        }
    }

    public final void a() {
        if (f()) {
            if (this.f84891b) {
                if (this.f84898i.getMeasuredHeight() <= 0 || this.f84898i.getMeasuredWidth() <= 0) {
                    return;
                }
                int measuredWidth = this.f84900k.b(this.f84898i) ? 1048576 : (this.f84898i.getMeasuredWidth() - this.f84898i.getTotalPaddingLeft()) - this.f84898i.getTotalPaddingRight();
                int height = (this.f84898i.getHeight() - this.f84898i.getCompoundPaddingBottom()) - this.f84898i.getCompoundPaddingTop();
                if (measuredWidth <= 0 || height <= 0) {
                    return;
                }
                RectF rectF = f84888l;
                synchronized (rectF) {
                    try {
                        rectF.setEmpty();
                        rectF.right = measuredWidth;
                        rectF.bottom = height;
                        float fC = c(rectF);
                        if (fC != this.f84898i.getTextSize()) {
                            g(fC, 0);
                        }
                    } finally {
                    }
                }
            }
            this.f84891b = true;
        }
    }

    public final int c(RectF rectF) {
        CharSequence transformation;
        int length = this.f84895f.length;
        if (length == 0) {
            throw new IllegalStateException("No available text sizes to choose from.");
        }
        int i5 = length - 1;
        int i11 = 0;
        int i12 = 1;
        while (i12 <= i5) {
            int i13 = (i12 + i5) / 2;
            int i14 = this.f84895f[i13];
            TextView textView = this.f84898i;
            CharSequence text = textView.getText();
            TransformationMethod transformationMethod = textView.getTransformationMethod();
            CharSequence charSequence = (transformationMethod == null || (transformation = transformationMethod.getTransformation(text, textView)) == null) ? text : transformation;
            int maxLines = textView.getMaxLines();
            TextPaint textPaint = this.f84897h;
            if (textPaint == null) {
                this.f84897h = new TextPaint();
            } else {
                textPaint.reset();
            }
            this.f84897h.set(textView.getPaint());
            this.f84897h.setTextSize(i14);
            StaticLayout staticLayoutA = r0.a(charSequence, (Layout.Alignment) e(textView, "getLayoutAlignment", Layout.Alignment.ALIGN_NORMAL), Math.round(rectF.right), maxLines, this.f84898i, this.f84897h, this.f84900k);
            if ((maxLines == -1 || (staticLayoutA.getLineCount() <= maxLines && staticLayoutA.getLineEnd(staticLayoutA.getLineCount() - 1) == charSequence.length())) && staticLayoutA.getHeight() <= rectF.bottom) {
                int i15 = i13 + 1;
                i11 = i12;
                i12 = i15;
            } else {
                i11 = i13 - 1;
                i5 = i11;
            }
        }
        return this.f84895f[i11];
    }

    public final boolean f() {
        return j() && this.f84890a != 0;
    }

    public final void g(float f11, int i5) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Context context = this.f84899j;
        float fApplyDimension = TypedValue.applyDimension(i5, f11, (context == null ? Resources.getSystem() : context.getResources()).getDisplayMetrics());
        TextView textView = this.f84898i;
        if (fApplyDimension != textView.getPaint().getTextSize()) {
            textView.getPaint().setTextSize(fApplyDimension);
            boolean zIsInLayout = textView.isInLayout();
            if (textView.getLayout() != null) {
                this.f84891b = false;
                try {
                    Method methodD = d("nullLayouts");
                    if (methodD != null) {
                        methodD.invoke(textView, null);
                    }
                } catch (Exception e3) {
                    Log.w("ACTVAutoSizeHelper", "Failed to invoke TextView#nullLayouts() method", e3);
                }
                if (zIsInLayout) {
                    textView.forceLayout();
                } else {
                    textView.requestLayout();
                }
                textView.invalidate();
            }
        }
    }

    public final boolean h() {
        if (j() && this.f84890a == 1) {
            if (!this.f84896g || this.f84895f.length == 0) {
                int iFloor = ((int) Math.floor((this.f84894e - this.f84893d) / this.f84892c)) + 1;
                int[] iArr = new int[iFloor];
                for (int i5 = 0; i5 < iFloor; i5++) {
                    iArr[i5] = Math.round((i5 * this.f84892c) + this.f84893d);
                }
                this.f84895f = b(iArr);
            }
            this.f84891b = true;
        } else {
            this.f84891b = false;
        }
        return this.f84891b;
    }

    public final boolean i() {
        boolean z11 = this.f84895f.length > 0;
        this.f84896g = z11;
        if (z11) {
            this.f84890a = 1;
            this.f84893d = r0[0];
            this.f84894e = r0[r1 - 1];
            this.f84892c = -1.0f;
        }
        return z11;
    }

    public final boolean j() {
        return !(this.f84898i instanceof q);
    }

    public final void k(float f11, float f12, float f13) {
        if (f11 <= 0.0f) {
            throw new IllegalArgumentException("Minimum auto-size text size (" + f11 + "px) is less or equal to (0px)");
        }
        if (f12 <= f11) {
            throw new IllegalArgumentException("Maximum auto-size text size (" + f12 + "px) is less or equal to minimum auto-size text size (" + f11 + "px)");
        }
        if (f13 <= 0.0f) {
            throw new IllegalArgumentException("The auto-size step granularity (" + f13 + "px) is less or equal to (0px)");
        }
        this.f84890a = 1;
        this.f84893d = f11;
        this.f84894e = f12;
        this.f84892c = f13;
        this.f84896g = false;
    }
}
