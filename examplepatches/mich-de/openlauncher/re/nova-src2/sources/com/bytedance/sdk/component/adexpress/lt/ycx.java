package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.widget.TextSwitcher;
import android.widget.TextView;
import android.widget.ViewSwitcher;
import com.bytedance.sdk.component.utils.tru;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx extends TextSwitcher implements ViewSwitcher.ViewFactory, tru.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final int f23622dj;

    /* renamed from: ea, reason: collision with root package name */
    private int f23623ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f23624jc;

    /* renamed from: jw, reason: collision with root package name */
    private float f23625jw;

    /* renamed from: lt, reason: collision with root package name */
    private TextView f23626lt;
    private Context lud;

    /* renamed from: ok, reason: collision with root package name */
    private int f23627ok;

    /* renamed from: ry, reason: collision with root package name */
    private int f23628ry;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f23629ul;
    private Handler xkz;
    Animation.AnimationListener ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<String> f23630zb;

    public ycx(Context context, int i5, float f11, int i11, int i12) {
        super(context);
        this.f23630zb = new ArrayList();
        this.sya = 0;
        this.f23622dj = 1;
        this.xkz = new tru(Looper.getMainLooper(), this);
        this.ycx = new Animation.AnimationListener() { // from class: com.bytedance.sdk.component.adexpress.lt.ycx.1
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                if (ycx.this.f23626lt != null) {
                    ycx.this.f23626lt.setText(b.f42142b);
                }
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }
        };
        this.lud = context;
        this.fby = i5;
        this.f23625jw = f11;
        this.f23624jc = i11;
        this.f23628ry = i12;
        sya();
    }

    private void sya() {
        setFactory(this);
    }

    @Override // android.widget.ViewSwitcher.ViewFactory
    public View makeView() {
        TextView textView = new TextView(getContext());
        this.f23626lt = textView;
        textView.setTextColor(this.fby);
        this.f23626lt.setTextSize(this.f23625jw);
        this.f23626lt.setMaxLines(this.f23624jc);
        this.f23626lt.setTextAlignment(this.f23628ry);
        return this.f23626lt;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.xkz.sendEmptyMessageDelayed(1, this.f23629ul);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.xkz.removeMessages(1);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        try {
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb(this.f23630zb.get(this.f23623ea), this.f23625jw, false)[0], 1073741824), i5);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+zoRN0kk=", "euAkmAKoYMiOftJFmA==", "VOAAkAKvfNWF", 182);
            super.onMeasure(i5, i11);
        }
    }

    public void setAnimationDuration(int i5) {
        this.f23629ul = i5;
    }

    public void setAnimationText(List<String> list) {
        this.f23630zb = list;
    }

    public void setAnimationType(int i5) {
        this.f23627ok = i5;
    }

    public void setMaxLines(int i5) {
        this.f23624jc = i5;
    }

    public void setTextColor(int i5) {
        this.fby = i5;
    }

    public void setTextSize(float f11) {
        this.f23625jw = f11;
    }

    public void zb() {
        List<String> list = this.f23630zb;
        if (list == null || list.size() <= 0) {
            return;
        }
        int i5 = this.sya;
        this.sya = i5 + 1;
        this.f23623ea = i5;
        setText(this.f23630zb.get(i5));
        if (this.sya > this.f23630zb.size() - 1) {
            this.sya = 0;
        }
    }

    public void ycx() {
        int i5 = this.f23627ok;
        if (i5 == 1) {
            setInAnimation(getContext(), com.bytedance.sdk.component.utils.wwx.jw(this.lud, "tt_text_animation_y_in"));
            setOutAnimation(getContext(), com.bytedance.sdk.component.utils.wwx.jw(this.lud, "tt_text_animation_y_out"));
        } else if (i5 == 0) {
            setInAnimation(getContext(), com.bytedance.sdk.component.utils.wwx.jw(this.lud, "tt_text_animation_x_in"));
            setOutAnimation(getContext(), com.bytedance.sdk.component.utils.wwx.jw(this.lud, "tt_text_animation_x_in"));
            getInAnimation().setInterpolator(new LinearInterpolator());
            getOutAnimation().setInterpolator(new LinearInterpolator());
            getInAnimation().setAnimationListener(this.ycx);
            getOutAnimation().setAnimationListener(this.ycx);
        }
        this.xkz.sendEmptyMessage(1);
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        if (message.what != 1) {
            return;
        }
        zb();
        this.xkz.sendEmptyMessageDelayed(1, this.f23629ul);
    }
}
