package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.openadsdk.core.lt.fby {

    /* renamed from: dj, reason: collision with root package name */
    private int f27024dj;
    private boolean sya;
    private Paint ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f27025zb;

    public ycx(Context context) {
        super(context);
        ycx();
    }

    private void ycx() {
        this.f27025zb = dc.ycx(getContext(), 8.0f);
        this.ycx = new Paint();
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        ycx(getText().toString(), getWidth());
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.fby, android.widget.TextView, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        this.f27024dj = getMeasuredHeight();
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams == null) {
            layoutParams = new ViewGroup.LayoutParams(-2, this.f27024dj);
        } else {
            layoutParams.height = this.f27024dj;
        }
        setLayoutParams(layoutParams);
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.fby, android.view.View
    public void setLayoutParams(ViewGroup.LayoutParams layoutParams) {
        super.setLayoutParams(layoutParams);
        int i5 = this.f27024dj;
        if (i5 == 0 || layoutParams == null) {
            return;
        }
        layoutParams.height = i5;
    }

    public void setMinTextSize(float f11) {
        if (f11 <= 0.0f) {
            return;
        }
        this.f27025zb = f11;
    }

    private void ycx(String str, int i5) {
        if (!this.sya && i5 > 0) {
            float textSize = getTextSize();
            this.ycx.set(getPaint());
            int paddingLeft = (i5 - getPaddingLeft()) - getPaddingRight();
            float fYcx = ycx(textSize, str);
            while (fYcx > paddingLeft) {
                textSize -= 1.0f;
                this.ycx.setTextSize(textSize);
                if (textSize <= this.f27025zb) {
                    break;
                } else {
                    fYcx = ycx(textSize, str);
                }
            }
            setTextSize(0, textSize);
            this.sya = true;
        }
    }

    private float ycx(float f11, String str) {
        this.ycx.setTextSize(f11);
        return this.ycx.measureText(str);
    }
}
