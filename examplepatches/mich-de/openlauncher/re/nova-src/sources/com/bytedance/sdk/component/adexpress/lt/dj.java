package com.bytedance.sdk.component.adexpress.lt;

import a2.c;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.view.View;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class dj extends View {

    /* renamed from: dj, reason: collision with root package name */
    private int f23532dj;

    /* renamed from: ea, reason: collision with root package name */
    private Paint f23533ea;
    private List<Integer> fby;

    /* renamed from: jc, reason: collision with root package name */
    private Paint f23534jc;

    /* renamed from: jw, reason: collision with root package name */
    private List<Integer> f23535jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f23536lt;
    private float lud;

    /* renamed from: ok, reason: collision with root package name */
    private float f23537ok;

    /* renamed from: ry, reason: collision with root package name */
    private float f23538ry;
    private float sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f23539ul;
    private int xkz;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f23540zb;

    public dj(Context context) {
        this(context, null);
    }

    private void sya() {
        Paint paint = new Paint();
        this.f23534jc = paint;
        paint.setAntiAlias(true);
        this.f23534jc.setStrokeWidth(this.xkz);
        this.fby.add(255);
        this.f23535jw.add(0);
        Paint paint2 = new Paint();
        this.f23533ea = paint2;
        paint2.setAntiAlias(true);
        this.f23533ea.setColor(Color.parseColor("#0FFFFFFF"));
        this.f23533ea.setStyle(Paint.Style.FILL);
    }

    @Override // android.view.View
    public void invalidate() {
        if (hasWindowFocus()) {
            super.invalidate();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        this.f23534jc.setShader(new LinearGradient(this.f23537ok, 0.0f, this.f23538ry, getMeasuredHeight(), -1, 16777215, Shader.TileMode.CLAMP));
        int i5 = 0;
        while (true) {
            if (i5 >= this.fby.size()) {
                break;
            }
            Integer num = this.fby.get(i5);
            this.f23534jc.setAlpha(num.intValue());
            Integer num2 = this.f23535jw.get(i5);
            if (this.sya + num2.intValue() < this.lud) {
                canvas.drawCircle(this.f23537ok, this.f23538ry, this.sya + num2.intValue(), this.f23534jc);
            }
            if (num.intValue() > 0 && num2.intValue() < this.lud) {
                this.fby.set(i5, Integer.valueOf(num.intValue() - this.f23536lt > 0 ? num.intValue() - (this.f23536lt * 3) : 1));
                this.f23535jw.set(i5, Integer.valueOf(num2.intValue() + this.f23536lt));
            }
            i5++;
        }
        if (((Integer) c.e(1, this.f23535jw)).intValue() >= this.lud / this.f23532dj) {
            this.fby.add(255);
            this.f23535jw.add(0);
        }
        if (this.f23535jw.size() >= 3) {
            this.f23535jw.remove(0);
            this.fby.remove(0);
        }
        this.f23534jc.setAlpha(255);
        this.f23534jc.setColor(this.f23540zb);
        canvas.drawCircle(this.f23537ok, this.f23538ry, this.sya, this.f23533ea);
        if (this.f23539ul) {
            invalidate();
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(i11);
        setMeasuredDimension(Math.min(size, size2), Math.min(size, size2));
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        float f11 = i5 / 2.0f;
        this.f23537ok = f11;
        this.f23538ry = i11 / 2.0f;
        float f12 = f11 - (this.xkz / 2.0f);
        this.lud = f12;
        this.sya = f12 / 4.0f;
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            invalidate();
        }
    }

    public void setColor(int i5) {
        this.ycx = i5;
    }

    public void setCoreColor(int i5) {
        this.f23540zb = i5;
    }

    public void setCoreRadius(int i5) {
        this.sya = i5;
    }

    public void setDiffuseSpeed(int i5) {
        this.f23536lt = i5;
    }

    public void setDiffuseWidth(int i5) {
        this.f23532dj = i5;
    }

    public void setMaxWidth(int i5) {
        this.lud = i5;
    }

    public void ycx() {
        this.f23539ul = true;
        invalidate();
    }

    public void zb() {
        this.f23539ul = false;
        this.f23535jw.clear();
        this.fby.clear();
        this.fby.add(255);
        this.f23535jw.add(0);
        invalidate();
    }

    public dj(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, -1);
    }

    public dj(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.ycx = -1;
        this.f23540zb = -65536;
        this.sya = 18.0f;
        this.f23532dj = 3;
        this.lud = 50.0f;
        this.f23536lt = 2;
        this.f23539ul = false;
        this.fby = new ArrayList();
        this.f23535jw = new ArrayList();
        this.xkz = 24;
        sya();
    }
}
