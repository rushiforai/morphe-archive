package com.bytedance.adsdk.ugeno.jc.lt;

import android.content.Context;
import android.graphics.Canvas;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.widget.TextView;
import com.bytedance.adsdk.ugeno.core.IAnimation;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.ugeno.ycx.fby;
import com.bytedance.adsdk.ugeno.ycx.ul;

/* loaded from: classes2.dex */
public class ycx extends TextView implements IAnimation, ul {

    /* renamed from: dj, reason: collision with root package name */
    private float f22322dj;

    /* renamed from: lt, reason: collision with root package name */
    private float f22323lt;
    private float lud;
    private fby sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f22324ul;
    private lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f22325zb;

    public ycx(Context context) {
        super(context);
        this.f22322dj = -1.0f;
        this.f22323lt = 1.0f;
        this.f22324ul = 0.0f;
        this.sya = new fby(this);
    }

    @Override // android.view.View
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.zb(canvas);
        }
    }

    public float getBorderRadius() {
        return this.sya.ycx();
    }

    @Override // com.bytedance.adsdk.ugeno.core.IAnimation, com.bytedance.adsdk.ugeno.ycx.ul
    public float getRipple() {
        return this.f22325zb;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getRubIn() {
        return this.sya.getRubIn();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getShine() {
        return this.sya.getShine();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getStretch() {
        return this.sya.getStretch();
    }

    @Override // android.widget.TextView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ycx(canvas, this);
            this.ycx.ycx(canvas);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ycx(i5, i11, i12, i13);
        }
        if (z11 && this.f22322dj > 0.0f) {
            ycx(((i12 - i5) - getCompoundPaddingLeft()) - getCompoundPaddingRight(), ((i13 - i11) - getCompoundPaddingBottom()) - getCompoundPaddingTop());
        }
        super.onLayout(z11, i5, i11, i12, i13);
    }

    @Override // android.widget.TextView, android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.ycx;
        if (ludVar == null) {
            super.onMeasure(i5, i11);
        } else {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            super.onMeasure(iArrYcx[0], iArrYcx[1]);
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i12);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.ycx;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    @Override // android.view.View
    public void setBackgroundColor(int i5) {
        this.sya.ycx(i5);
    }

    public void setBorderRadius(float f11) {
        fby fbyVar = this.sya;
        if (fbyVar != null) {
            fbyVar.ycx(f11);
        }
    }

    @Override // android.widget.TextView
    public void setLineSpacing(float f11, float f12) {
        super.setLineSpacing(f11, f12);
        this.f22323lt = f12;
        this.f22324ul = f11;
    }

    public void setMinTextSize(float f11) {
        this.f22322dj = f11;
    }

    @Override // com.bytedance.adsdk.ugeno.core.IAnimation
    public void setRipple(float f11) {
        this.f22325zb = f11;
        fby fbyVar = this.sya;
        if (fbyVar != null) {
            fbyVar.zb(f11);
        }
        postInvalidate();
    }

    public void setRubIn(float f11) {
        fby fbyVar = this.sya;
        if (fbyVar != null) {
            fbyVar.lud(f11);
        }
    }

    public void setShine(float f11) {
        fby fbyVar = this.sya;
        if (fbyVar != null) {
            fbyVar.sya(f11);
        }
    }

    public void setStretch(float f11) {
        fby fbyVar = this.sya;
        if (fbyVar != null) {
            fbyVar.dj(f11);
        }
    }

    @Override // android.widget.TextView
    public void setTextSize(float f11) {
        super.setTextSize(f11);
        this.lud = getTextSize();
    }

    public void ycx(lud ludVar) {
        this.ycx = ludVar;
    }

    private void ycx(int i5, int i11) {
        CharSequence text = getText();
        if (text == null || text.length() == 0 || i11 <= 0 || i5 <= 0 || this.lud == 0.0f) {
            return;
        }
        TextPaint paint = getPaint();
        float fMax = this.lud;
        int iYcx = ycx(text, paint, i5, fMax);
        while (iYcx > i11) {
            float f11 = this.f22322dj;
            if (fMax <= f11) {
                break;
            }
            fMax = Math.max(fMax - 1.0f, f11);
            iYcx = ycx(text, paint, i5, fMax);
        }
        setTextSize(0, fMax);
        setLineSpacing(this.f22324ul, this.f22323lt);
    }

    @Override // android.widget.TextView
    public void setTextSize(int i5, float f11) {
        super.setTextSize(i5, f11);
        this.lud = getTextSize();
    }

    private int ycx(CharSequence charSequence, TextPaint textPaint, int i5, float f11) {
        TextPaint textPaint2 = new TextPaint(textPaint);
        textPaint2.setTextSize(f11);
        return new StaticLayout(charSequence, textPaint2, i5, Layout.Alignment.ALIGN_NORMAL, this.f22323lt, this.f22324ul, true).getHeight();
    }
}
