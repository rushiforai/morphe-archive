package com.bytedance.adsdk.ugeno.yoga.zb;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.ugeno.ycx.fby;
import com.bytedance.adsdk.ugeno.ycx.ul;
import com.bytedance.adsdk.ugeno.yoga.dj;
import com.bytedance.adsdk.ugeno.yoga.ea;
import com.bytedance.adsdk.ugeno.yoga.jc;
import com.bytedance.adsdk.ugeno.yoga.jw;
import com.bytedance.adsdk.ugeno.yoga.lt;
import com.bytedance.adsdk.ugeno.yoga.ry;
import com.bytedance.adsdk.ugeno.yoga.xkz;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class sya extends ViewGroup implements ul, com.bytedance.adsdk.ugeno.zb.zb {

    /* renamed from: dj, reason: collision with root package name */
    private fby f22624dj;
    private lud sya;
    private final Map<View, jc> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final jc f22625zb;

    public sya(Context context) {
        this(context, null, 0);
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        jc jcVarYcx;
        this.f22625zb.ycx((com.bytedance.adsdk.ugeno.yoga.ul) null);
        if (view instanceof com.bytedance.adsdk.ugeno.yoga.zb.zb) {
            throw null;
        }
        super.addView(view, i5, layoutParams);
        if (this.ycx.containsKey(view)) {
            return;
        }
        if (view instanceof sya) {
            jcVarYcx = ((sya) view).getYogaNode();
        } else {
            jcVarYcx = this.ycx.containsKey(view) ? this.ycx.get(view) : ea.ycx();
            jcVarYcx.ycx(view);
            jcVarYcx.ycx((com.bytedance.adsdk.ugeno.yoga.ul) new zb());
        }
        ycx((ycx) view.getLayoutParams(), jcVarYcx, view);
        this.ycx.put(view, jcVarYcx);
        if (view.getVisibility() == 8) {
            view.setTag(151060224, Integer.valueOf(this.f22625zb.ycx()));
        } else {
            jc jcVar = this.f22625zb;
            jcVar.ycx(jcVarYcx, jcVar.ycx());
        }
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof ycx;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.zb(canvas);
        }
    }

    public void dj(View view, int i5) {
        int iYcx;
        view.setVisibility(i5);
        try {
            jc jcVar = this.ycx.get(view);
            Object tag = view.getTag(151060224);
            if (i5 != 0) {
                if (i5 != 8 || (iYcx = this.f22625zb.ycx(jcVar)) == -1) {
                    return;
                }
                this.f22625zb.zb(iYcx);
                view.setTag(151060224, Integer.valueOf(iYcx));
                ycx(this.f22625zb);
                return;
            }
            if (tag == null || this.f22625zb.ycx(jcVar) != -1) {
                return;
            }
            int iIntValue = ((Integer) tag).intValue();
            if (iIntValue < this.f22625zb.ycx()) {
                this.f22625zb.ycx(this.ycx.get(view), iIntValue);
            } else {
                this.f22625zb.ycx(this.ycx.get(view), this.f22625zb.ycx());
            }
            ycx(this.f22625zb);
        } catch (Throwable unused) {
        }
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new ycx(-1, -1);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new ycx(layoutParams);
    }

    public float getBorderRadius() {
        return this.f22624dj.ycx();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getRipple() {
        return this.f22624dj.getRipple();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getRubIn() {
        return this.f22624dj.getRubIn();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getShine() {
        return this.f22624dj.getShine();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getStretch() {
        return this.f22624dj.getStretch();
    }

    public jc getYogaNode() {
        return this.f22625zb;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.ycx(canvas);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.lt();
        }
        if (!(getParent() instanceof sya)) {
            ycx(View.MeasureSpec.makeMeasureSpec(i12 - i5, 1073741824), View.MeasureSpec.makeMeasureSpec(i13 - i11, 1073741824));
        }
        ycx(this.f22625zb, 0.0f, 0.0f);
        lud ludVar2 = this.sya;
        if (ludVar2 != null) {
            ludVar2.ycx(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        if (!(getParent() instanceof sya)) {
            ycx(i5, i11);
        }
        lud ludVar = this.sya;
        if (ludVar != null) {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            setMeasuredDimension(iArrYcx[0], iArrYcx[1]);
        } else {
            setMeasuredDimension(Math.round(this.f22625zb.fby()), Math.round(this.f22625zb.jw()));
        }
        lud ludVar2 = this.sya;
        if (ludVar2 != null) {
            ludVar2.lud();
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.sya;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    @Override // android.view.ViewGroup
    public void removeAllViews() {
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            ycx(getChildAt(i5), false);
        }
        super.removeAllViews();
    }

    @Override // android.view.ViewGroup
    public void removeAllViewsInLayout() {
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            ycx(getChildAt(i5), true);
        }
        super.removeAllViewsInLayout();
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View view) {
        ycx(view, false);
        super.removeView(view);
    }

    @Override // android.view.ViewGroup
    public void removeViewAt(int i5) {
        ycx(getChildAt(i5), false);
        super.removeViewAt(i5);
    }

    @Override // android.view.ViewGroup
    public void removeViewInLayout(View view) {
        ycx(view, true);
        super.removeViewInLayout(view);
    }

    @Override // android.view.ViewGroup
    public void removeViews(int i5, int i11) {
        for (int i12 = i5; i12 < i5 + i11; i12++) {
            ycx(getChildAt(i12), false);
        }
        super.removeViews(i5, i11);
    }

    @Override // android.view.ViewGroup
    public void removeViewsInLayout(int i5, int i11) {
        for (int i12 = i5; i12 < i5 + i11; i12++) {
            ycx(getChildAt(i12), true);
        }
        super.removeViewsInLayout(i5, i11);
    }

    @Override // android.view.View
    public void setBackgroundColor(int i5) {
        this.f22624dj.ycx(i5);
    }

    public void setBorderRadius(float f11) {
        this.f22624dj.ycx(f11);
    }

    public void setRipple(float f11) {
        fby fbyVar = this.f22624dj;
        if (fbyVar != null) {
            fbyVar.zb(f11);
        }
    }

    public void setRubIn(float f11) {
        fby fbyVar = this.f22624dj;
        if (fbyVar != null) {
            fbyVar.lud(f11);
        }
    }

    public void setShine(float f11) {
        fby fbyVar = this.f22624dj;
        if (fbyVar != null) {
            fbyVar.sya(f11);
        }
    }

    public void setStretch(float f11) {
        fby fbyVar = this.f22624dj;
        if (fbyVar != null) {
            fbyVar.dj(f11);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.zb
    public void sya(View view, int i5) {
        dj(view, i5);
    }

    public jc ycx(View view) {
        return this.ycx.get(view);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.zb
    public void zb(int i5) {
        jc jcVar = this.f22625zb;
        if (jcVar != null) {
            zb(jcVar, i5);
            requestLayout();
        }
    }

    public sya(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.f22624dj = new fby(this);
        jc jcVarYcx = ea.ycx();
        this.f22625zb = jcVarYcx;
        this.ycx = new HashMap();
        jcVarYcx.ycx(this);
        jcVarYcx.ycx((com.bytedance.adsdk.ugeno.yoga.ul) new zb());
        ycx((ycx) generateDefaultLayoutParams(), jcVarYcx, this);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.zb
    public void ycx(int i5) {
        jc jcVar = this.f22625zb;
        if (jcVar != null) {
            ycx(jcVar, i5);
            requestLayout();
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.zb
    public void zb(View view, int i5) {
        jc jcVarYcx;
        if (view == null || (jcVarYcx = ycx(view)) == null) {
            return;
        }
        zb(jcVarYcx, i5);
        view.requestLayout();
    }

    @Override // com.bytedance.adsdk.ugeno.zb.zb
    public void ycx(View view, int i5) {
        jc jcVarYcx;
        if (view == null || (jcVarYcx = ycx(view)) == null) {
            return;
        }
        ycx(jcVarYcx, i5);
        view.requestLayout();
    }

    private void zb(jc jcVar, int i5) {
        if (i5 == -1) {
            jcVar.ul(100.0f);
        } else if (i5 == -2) {
            jcVar.lud();
        } else {
            jcVar.lt(i5);
        }
    }

    private void ycx(jc jcVar, int i5) {
        if (i5 == -1) {
            jcVar.lud(100.0f);
        } else if (i5 == -2) {
            jcVar.dj();
        } else {
            jcVar.dj(i5);
        }
    }

    public static class zb implements com.bytedance.adsdk.ugeno.yoga.ul {
        @Override // com.bytedance.adsdk.ugeno.yoga.ul
        public long ycx(jc jcVar, float f11, com.bytedance.adsdk.ugeno.yoga.fby fbyVar, float f12, com.bytedance.adsdk.ugeno.yoga.fby fbyVar2) {
            View view = (View) jcVar.jc();
            if (view == null || (view instanceof sya)) {
                return jw.ycx(0, 0);
            }
            view.measure(View.MeasureSpec.makeMeasureSpec((int) f11, ycx(fbyVar)), View.MeasureSpec.makeMeasureSpec((int) f12, ycx(fbyVar2)));
            return jw.ycx(view.getMeasuredWidth(), view.getMeasuredHeight());
        }

        private int ycx(com.bytedance.adsdk.ugeno.yoga.fby fbyVar) {
            if (fbyVar == com.bytedance.adsdk.ugeno.yoga.fby.AT_MOST) {
                return Integer.MIN_VALUE;
            }
            return fbyVar == com.bytedance.adsdk.ugeno.yoga.fby.EXACTLY ? 1073741824 : 0;
        }
    }

    public static class ycx extends ViewGroup.LayoutParams {

        /* renamed from: dj, reason: collision with root package name */
        private float f22626dj;

        /* renamed from: dy, reason: collision with root package name */
        private float f22627dy;

        /* renamed from: ea, reason: collision with root package name */
        private float f22628ea;
        private float fby;

        /* renamed from: jc, reason: collision with root package name */
        private float f22629jc;

        /* renamed from: jw, reason: collision with root package name */
        private float f22630jw;

        /* renamed from: lt, reason: collision with root package name */
        private float f22631lt;
        private float lud;

        /* renamed from: ok, reason: collision with root package name */
        private float f22632ok;
        private float pmi;

        /* renamed from: ry, reason: collision with root package name */
        private float f22633ry;
        private float sya;
        private float syc;

        /* renamed from: uh, reason: collision with root package name */
        private float f22634uh;

        /* renamed from: ul, reason: collision with root package name */
        private float f22635ul;
        private float wie;
        private float xkz;
        SparseArray<Float> ycx;

        /* renamed from: zb, reason: collision with root package name */
        SparseArray<String> f22636zb;

        public ycx(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
            if (layoutParams instanceof ycx) {
                ycx ycxVar = (ycx) layoutParams;
                this.ycx = ycxVar.ycx.clone();
                this.f22636zb = ycxVar.f22636zb.clone();
                return;
            }
            this.ycx = new SparseArray<>();
            this.f22636zb = new SparseArray<>();
            if (layoutParams.width >= 0) {
                this.ycx.put(15, Float.valueOf(((ViewGroup.LayoutParams) this).width));
            }
            if (layoutParams.height >= 0) {
                this.ycx.put(16, Float.valueOf(((ViewGroup.LayoutParams) this).height));
            }
        }

        public void dj(float f11) {
            this.f22629jc = f11;
            this.ycx.put(8, Float.valueOf(f11));
        }

        public void dy(float f11) {
            this.pmi = f11;
            this.ycx.put(27, Float.valueOf(f11));
        }

        public void ea(float f11) {
            this.sya = f11;
            this.ycx.put(17, Float.valueOf(f11));
        }

        public void fby(float f11) {
            this.xkz = f11;
            this.ycx.put(11, Float.valueOf(f11));
        }

        public void jc(float f11) {
            this.f22627dy = f11;
            this.ycx.put(13, Float.valueOf(f11));
        }

        public void jw(float f11) {
            this.syc = f11;
            this.ycx.put(12, Float.valueOf(f11));
        }

        public void lt(float f11) {
            this.f22632ok = f11;
            this.ycx.put(14, Float.valueOf(f11));
        }

        public void lud(float f11) {
            this.f22628ea = f11;
            this.ycx.put(9, Float.valueOf(f11));
        }

        public void ok(float f11) {
            this.f22626dj = f11;
            this.ycx.put(18, Float.valueOf(f11));
        }

        public void ry(float f11) {
            this.lud = f11;
            this.ycx.put(19, Float.valueOf(f11));
        }

        public void sya(float f11) {
            this.f22630jw = f11;
            this.ycx.put(7, Float.valueOf(f11));
        }

        public void syc(float f11) {
            this.wie = f11;
            this.ycx.put(25, Float.valueOf(f11));
        }

        public void ul(float f11) {
            this.f22633ry = f11;
            this.ycx.put(10, Float.valueOf(f11));
        }

        public void wie(float f11) {
            this.f22634uh = f11;
            this.ycx.put(28, Float.valueOf(f11));
        }

        public void xkz(float f11) {
            this.f22631lt = f11;
            this.ycx.put(20, Float.valueOf(f11));
        }

        public void ycx(float f11) {
            this.f22635ul = f11;
            this.ycx.put(5, Float.valueOf(f11));
        }

        public void zb(float f11) {
            this.fby = f11;
            this.ycx.put(6, Float.valueOf(f11));
        }

        public ycx(int i5, int i11) {
            super(i5, i11);
            this.ycx = new SparseArray<>();
            this.f22636zb = new SparseArray<>();
            if (i5 == -2 || i5 == -1 || i5 >= 0) {
                this.ycx.put(15, Float.valueOf(i5));
            }
            if (i11 == -2 || i11 == -1 || i11 >= 0) {
                this.ycx.put(16, Float.valueOf(i11));
            }
        }
    }

    private void ycx(jc jcVar) {
        if (jcVar.zb() != null) {
            ycx(jcVar.zb());
        } else {
            jcVar.ycx(Float.NaN, Float.NaN);
        }
    }

    private void ycx(View view, boolean z11) {
        try {
            jc jcVar = this.ycx.get(view);
            if (jcVar == null) {
                return;
            }
            jc jcVarZb = jcVar.zb();
            int i5 = 0;
            while (true) {
                if (i5 >= jcVarZb.ycx()) {
                    break;
                }
                if (jcVarZb.ycx(i5).equals(jcVar)) {
                    jcVarZb.zb(i5);
                    break;
                }
                i5++;
            }
            jcVar.ycx((Object) null);
            this.ycx.remove(view);
            if (z11) {
                this.f22625zb.ycx(Float.NaN, Float.NaN);
            }
        } catch (Throwable unused) {
        }
    }

    private void ycx(jc jcVar, float f11, float f12) {
        View view = (View) jcVar.jc();
        if (view != null && view != this) {
            if (view.getVisibility() == 8) {
                return;
            }
            int iRound = Math.round(jcVar.lt() + f11);
            int iRound2 = Math.round(jcVar.ul() + f12);
            view.measure(View.MeasureSpec.makeMeasureSpec(Math.round(jcVar.fby()), 1073741824), View.MeasureSpec.makeMeasureSpec(Math.round(jcVar.jw()), 1073741824));
            view.layout(iRound, iRound2, view.getMeasuredWidth() + iRound, view.getMeasuredHeight() + iRound2);
        }
        int iYcx = jcVar.ycx();
        for (int i5 = 0; i5 < iYcx; i5++) {
            if (equals(view)) {
                ycx(jcVar.ycx(i5), f11, f12);
            } else if (!(view instanceof sya)) {
                ycx(jcVar.ycx(i5), jcVar.lt() + f11, jcVar.ul() + f12);
            }
        }
    }

    private void ycx(int i5, int i11) {
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        int mode = View.MeasureSpec.getMode(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        if (mode2 == 1073741824) {
            this.f22625zb.lt(size2);
        }
        if (mode == 1073741824) {
            this.f22625zb.dj(size);
        }
        if (mode2 == Integer.MIN_VALUE) {
            this.f22625zb.ea(size2);
        }
        if (mode == Integer.MIN_VALUE) {
            this.f22625zb.jc(size);
        }
        this.f22625zb.ycx(Float.NaN, Float.NaN);
    }

    public static void ycx(ycx ycxVar, jc jcVar, View view) {
        if (view.getResources().getConfiguration().getLayoutDirection() == 1) {
            jcVar.ycx(com.bytedance.adsdk.ugeno.yoga.sya.LTR);
        }
        Drawable background = view.getBackground();
        if (background != null) {
            if (background.getPadding(new Rect())) {
                jcVar.zb(dj.LEFT, r0.left);
                jcVar.zb(dj.TOP, r0.top);
                jcVar.zb(dj.RIGHT, r0.right);
                jcVar.zb(dj.BOTTOM, r0.bottom);
            }
        }
        for (int i5 = 0; i5 < ycxVar.ycx.size(); i5++) {
            int iKeyAt = ycxVar.ycx.keyAt(i5);
            float fFloatValue = ycxVar.ycx.valueAt(i5).floatValue();
            if (iKeyAt == 4) {
                jcVar.sya(com.bytedance.adsdk.ugeno.yoga.ycx.ycx(Math.round(fFloatValue)));
            } else if (iKeyAt == 0) {
                jcVar.ycx(com.bytedance.adsdk.ugeno.yoga.ycx.ycx(Math.round(fFloatValue)));
            } else if (iKeyAt == 9) {
                jcVar.zb(com.bytedance.adsdk.ugeno.yoga.ycx.ycx(Math.round(fFloatValue)));
            } else if (iKeyAt == 25) {
                jcVar.ok(fFloatValue);
            } else if (iKeyAt == 8) {
                if (fFloatValue < 0.0f) {
                    jcVar.sya();
                } else {
                    jcVar.sya(fFloatValue);
                }
            } else if (iKeyAt == 1) {
                jcVar.ycx(com.bytedance.adsdk.ugeno.yoga.lud.ycx(Math.round(fFloatValue)));
            } else if (iKeyAt == 6) {
                jcVar.ycx(fFloatValue);
            } else if (iKeyAt == 7) {
                jcVar.zb(fFloatValue);
            } else if (iKeyAt == 16) {
                if (fFloatValue == -1.0f) {
                    jcVar.ul(100.0f);
                } else if (fFloatValue == -2.0f) {
                    jcVar.lud();
                } else {
                    jcVar.lt(fFloatValue);
                }
            } else if (iKeyAt == 18) {
                jcVar.ycx(dj.LEFT, fFloatValue);
            } else if (iKeyAt == 3) {
                jcVar.ycx(lt.ycx(Math.round(fFloatValue)));
            } else if (iKeyAt == 17) {
                jcVar.ycx(dj.TOP, fFloatValue);
            } else if (iKeyAt == 20) {
                jcVar.ycx(dj.RIGHT, fFloatValue);
            } else if (iKeyAt == 19) {
                jcVar.ycx(dj.BOTTOM, fFloatValue);
            } else if (iKeyAt == 28) {
                jcVar.jw(fFloatValue);
            } else if (iKeyAt == 27) {
                jcVar.fby(fFloatValue);
            } else if (iKeyAt == 22) {
                jcVar.zb(dj.LEFT, fFloatValue);
            } else if (iKeyAt == 21) {
                jcVar.zb(dj.TOP, fFloatValue);
            } else if (iKeyAt == 24) {
                jcVar.zb(dj.RIGHT, fFloatValue);
            } else if (iKeyAt == 23) {
                jcVar.zb(dj.BOTTOM, fFloatValue);
            } else if (iKeyAt == 11) {
                jcVar.sya(dj.LEFT, fFloatValue);
            } else if (iKeyAt == 10) {
                jcVar.sya(dj.TOP, fFloatValue);
            } else if (iKeyAt == 13) {
                jcVar.sya(dj.RIGHT, fFloatValue);
            } else if (iKeyAt == 12) {
                jcVar.sya(dj.BOTTOM, fFloatValue);
            } else if (iKeyAt == 14) {
                jcVar.ycx(ry.ycx(Math.round(fFloatValue)));
            } else if (iKeyAt == 15) {
                if (fFloatValue == -1.0f) {
                    jcVar.lud(100.0f);
                } else if (fFloatValue == -2.0f) {
                    jcVar.dj();
                } else {
                    jcVar.dj(fFloatValue);
                }
            } else if (iKeyAt == 2) {
                jcVar.ycx(xkz.ycx(Math.round(fFloatValue)));
            }
        }
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.sya = syaVar;
    }
}
