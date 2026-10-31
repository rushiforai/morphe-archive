package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class wie extends View {

    /* renamed from: dj, reason: collision with root package name */
    private Drawable f26346dj;

    /* renamed from: lt, reason: collision with root package name */
    private float f26347lt;
    private Drawable lud;
    private int sya;
    private final Path ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f26348zb;

    public wie(Context context) {
        this(context, false);
    }

    private void ycx() {
        Context context = getContext();
        this.f26346dj = wwx.sya(context, this.f26348zb ? "tt_star_thick_dark" : "tt_star_thick");
        this.lud = wwx.sya(context, "tt_star");
    }

    private void zb() {
        int width = getWidth();
        int height = getHeight();
        if (this.f26347lt <= 0.0f || width <= 0 || height <= 0) {
            return;
        }
        this.ycx.reset();
        this.ycx.addRect(new RectF(0.0f, 0.0f, width * this.f26347lt, height), Path.Direction.CCW);
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.sya <= 0) {
            return;
        }
        int iSave = canvas.save();
        for (int i5 = 0; i5 < 5; i5++) {
            this.f26346dj.draw(canvas);
            canvas.translate(this.sya, 0.0f);
        }
        canvas.restoreToCount(iSave);
        canvas.clipPath(this.ycx);
        for (int i11 = 0; i11 < 5; i11++) {
            this.lud.draw(canvas);
            canvas.translate(this.sya, 0.0f);
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(this.sya * 5, 1073741824), View.MeasureSpec.makeMeasureSpec(this.sya, 1073741824));
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        zb();
    }

    public wie(Context context, boolean z11) {
        super(context);
        this.ycx = new Path();
        this.f26348zb = z11;
        ycx();
    }

    public void ycx(double d5, int i5) {
        int iYcx = (int) dc.ycx(getContext(), i5, false);
        this.sya = iYcx;
        this.f26346dj.setBounds(0, 0, iYcx, iYcx);
        Drawable drawable = this.lud;
        int i11 = this.sya;
        drawable.setBounds(0, 0, i11, i11);
        this.f26347lt = ((float) d5) / 5.0f;
        zb();
        requestLayout();
    }
}
