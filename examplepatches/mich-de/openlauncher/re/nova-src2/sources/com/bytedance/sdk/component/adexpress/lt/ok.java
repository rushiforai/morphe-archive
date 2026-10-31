package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.Xfermode;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class ok extends View {

    /* renamed from: dj, reason: collision with root package name */
    private int f23566dj;

    /* renamed from: ea, reason: collision with root package name */
    private Paint f23567ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private Bitmap f23568jc;

    /* renamed from: jw, reason: collision with root package name */
    private int[] f23569jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f23570lt;
    private int lud;

    /* renamed from: ok, reason: collision with root package name */
    private Xfermode f23571ok;

    /* renamed from: ry, reason: collision with root package name */
    private PorterDuff.Mode f23572ry;
    private int sya;
    private final List<ycx> syc;

    /* renamed from: ul, reason: collision with root package name */
    private int f23573ul;
    private LinearGradient xkz;
    Rect ycx;

    /* renamed from: zb, reason: collision with root package name */
    Rect f23574zb;

    public static class ycx {
        private final int ycx;

        /* renamed from: zb, reason: collision with root package name */
        private int f23575zb = 0;

        public ycx(int i5) {
            this.ycx = i5;
        }

        public void ycx() {
            this.f23575zb += this.ycx;
        }
    }

    public ok(Context context) {
        super(context);
        this.f23572ry = PorterDuff.Mode.DST_IN;
        this.syc = new ArrayList();
        ycx();
    }

    private void ycx() {
        this.sya = com.bytedance.sdk.component.utils.wwx.dj(getContext(), "tt_splash_unlock_image_arrow");
        this.f23566dj = Color.parseColor("#00ffffff");
        this.lud = Color.parseColor("#ffffffff");
        int color = Color.parseColor("#00ffffff");
        this.f23570lt = color;
        this.f23573ul = 10;
        this.fby = 40;
        this.f23569jw = new int[]{this.f23566dj, this.lud, color};
        setLayerType(1, null);
        this.f23567ea = new Paint(1);
        this.f23568jc = BitmapFactory.decodeResource(getResources(), this.sya);
        this.f23571ok = new PorterDuffXfermode(this.f23572ry);
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawBitmap(this.f23568jc, this.ycx, this.f23574zb, this.f23567ea);
        canvas.save();
        Iterator<ycx> it = this.syc.iterator();
        while (it.hasNext()) {
            ycx next = it.next();
            this.xkz = new LinearGradient(next.f23575zb, 0.0f, next.f23575zb + this.fby, this.f23573ul, this.f23569jw, (float[]) null, Shader.TileMode.CLAMP);
            this.f23567ea.setColor(-1);
            this.f23567ea.setShader(this.xkz);
            Canvas canvas2 = canvas;
            canvas2.drawRect(0.0f, 0.0f, getWidth(), getHeight(), this.f23567ea);
            this.f23567ea.setShader(null);
            next.ycx();
            if (next.f23575zb > getWidth()) {
                it.remove();
            }
            canvas = canvas2;
        }
        Canvas canvas3 = canvas;
        this.f23567ea.setXfermode(this.f23571ok);
        canvas3.drawBitmap(this.f23568jc, this.ycx, this.f23574zb, this.f23567ea);
        this.f23567ea.setXfermode(null);
        canvas3.restore();
        invalidate();
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        if (this.f23568jc == null) {
            return;
        }
        this.ycx = new Rect(0, 0, this.f23568jc.getWidth(), this.f23568jc.getHeight());
        this.f23574zb = new Rect(0, 0, getWidth(), getHeight());
    }

    public void ycx(int i5) {
        this.syc.add(new ycx(i5));
        postInvalidate();
    }
}
