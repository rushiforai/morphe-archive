package com.bytedance.sdk.openadsdk.component.jw;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.core.widget.pmi;
import com.bytedance.sdk.openadsdk.core.widget.wie;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;

/* loaded from: classes2.dex */
public class dj extends sya {

    /* renamed from: dy, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.lt.dj f24780dy;

    /* renamed from: ry, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.lt.sya f24781ry;
    private final com.bytedance.sdk.openadsdk.core.lt.fby syc;
    private final com.bytedance.sdk.openadsdk.core.lt.lud wie;
    private final wie xkz;

    public static final class ycx extends Drawable {

        /* renamed from: dj, reason: collision with root package name */
        private final boolean f24783dj;
        private static final int lud = Color.parseColor("#b0000000");

        /* renamed from: lt, reason: collision with root package name */
        private static final int f24782lt = Color.parseColor("#40000000");
        private final RectF ycx = new RectF();

        /* renamed from: zb, reason: collision with root package name */
        private final Paint f24784zb = new Paint();
        private final Path sya = new Path();

        public ycx(Context context) {
            this.f24783dj = com.bytedance.sdk.component.adexpress.dj.zb.ycx(context);
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.drawPath(this.sya, this.f24784zb);
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -3;
        }

        @Override // android.graphics.drawable.Drawable
        public void onBoundsChange(Rect rect) {
            float[] fArr;
            super.onBoundsChange(rect);
            this.ycx.set(rect);
            this.sya.reset();
            int iHeight = rect.height() / 2;
            Path path = this.sya;
            RectF rectF = this.ycx;
            if (this.f24783dj) {
                float f11 = iHeight;
                fArr = new float[]{f11, f11, 0.0f, 0.0f, 0.0f, 0.0f, f11, f11};
            } else {
                float f12 = iHeight;
                fArr = new float[]{0.0f, 0.0f, f12, f12, f12, f12, 0.0f, 0.0f};
            }
            path.addRoundRect(rectF, fArr, Path.Direction.CW);
            float f13 = rect.right;
            boolean z11 = this.f24783dj;
            this.f24784zb.setShader(new LinearGradient(0.0f, 0.0f, f13, 0.0f, new int[]{z11 ? f24782lt : lud, z11 ? lud : f24782lt}, (float[]) null, Shader.TileMode.CLAMP));
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int i5) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter colorFilter) {
        }
    }

    public dj(Context context, tn tnVar) {
        super(context);
        setId(520093753);
        setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        setBackgroundColor(0);
        int iZb = dc.zb(context, 8.0f);
        int iZb2 = dc.zb(context, 9.0f);
        int iZb3 = dc.zb(context, 10.0f);
        int iZb4 = dc.zb(context, 40.0f);
        com.bytedance.sdk.openadsdk.core.widget.sya syaVar = new com.bytedance.sdk.openadsdk.core.widget.sya(context);
        this.f24794ok = syaVar;
        syaVar.setPadding(iZb2, 0, iZb2, 0);
        this.f24794ok.setScaleType(ImageView.ScaleType.FIT_CENTER);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(dc.zb(context, 32.0f), dc.zb(context, 14.0f));
        layoutParams.addRule(12);
        layoutParams.addRule(11);
        layoutParams.setMargins(0, 0, iZb3, iZb3);
        this.f24794ok.setLayoutParams(layoutParams);
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar2 = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
        this.f24781ry = syaVar2;
        syaVar2.setBackgroundColor(-1);
        syaVar2.setId(520093758);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, dc.zb(context, 107.0f));
        layoutParams2.addRule(12);
        syaVar2.setLayoutParams(layoutParams2);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        ludVar.setOrientation(0);
        ludVar.setGravity(16);
        FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-2, -2);
        layoutParams3.gravity = 17;
        ludVar.setLayoutParams(layoutParams3);
        syaVar2.addView(ludVar);
        pmi pmiVar = new pmi(context);
        this.f24793lt = pmiVar;
        pmiVar.setId(520093759);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(iZb4, iZb4);
        layoutParams4.rightMargin = iZb;
        layoutParams4.setMarginEnd(iZb);
        this.f24793lt.setLayoutParams(layoutParams4);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.f24795ul = fbyVar;
        fbyVar.setId(520093761);
        this.f24795ul.setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar2 = this.f24795ul;
        TextUtils.TruncateAt truncateAt = TextUtils.TruncateAt.END;
        fbyVar2.setEllipsize(truncateAt);
        this.f24795ul.setMaxLines(2);
        this.f24795ul.setTextColor(Color.parseColor("#161823"));
        this.f24795ul.setTextSize(30.0f);
        ludVar.addView(this.f24793lt);
        ludVar.addView(this.f24795ul);
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar3 = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams5.addRule(2, syaVar2.getId());
        layoutParams5.addRule(10);
        syaVar3.setLayoutParams(layoutParams5);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        this.ycx = djVar;
        djVar.setId(520093754);
        this.ycx.setScaleType(ImageView.ScaleType.CENTER_CROP);
        syaVar3.addView(this.ycx, new FrameLayout.LayoutParams(-1, -1));
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar4 = new com.bytedance.sdk.openadsdk.core.lt.sya(context);
        this.f24796zb = syaVar4;
        syaVar4.setId(520093755);
        FrameLayout.LayoutParams layoutParams6 = new FrameLayout.LayoutParams(-1, -1);
        layoutParams6.gravity = 17;
        syaVar3.addView(this.f24796zb, layoutParams6);
        com.bytedance.sdk.openadsdk.core.lt.dj djVar2 = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        this.sya = djVar2;
        djVar2.setId(520093756);
        syaVar3.addView(this.sya, new FrameLayout.LayoutParams(-1, -1));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar3 = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.lud = fbyVar3;
        fbyVar3.setId(520093717);
        this.lud.setBackground(ea.ycx(context, Color.parseColor("#b3000000"), 24));
        this.lud.setEllipsize(truncateAt);
        this.lud.setGravity(17);
        this.lud.setSingleLine(true);
        this.lud.setText(wwx.ycx(context, "tt_video_download_apk"));
        this.lud.setTextColor(-1);
        this.lud.setTextSize(1, 16.0f);
        this.lud.setTag("open_ad_click_button_tag");
        FrameLayout.LayoutParams layoutParams7 = new FrameLayout.LayoutParams(dc.zb(context, 236.0f), dc.zb(context, 48.0f));
        layoutParams7.gravity = 81;
        layoutParams7.bottomMargin = dc.zb(context, 32.0f);
        syaVar3.addView(this.lud, layoutParams7);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar2 = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        this.wie = ludVar2;
        ludVar2.setOrientation(0);
        ludVar2.setGravity(16);
        ludVar2.setBackground(new ycx(context));
        ludVar2.setPadding(dc.zb(context, 16.0f), dc.zb(context, 8.0f), dc.zb(context, 16.0f), dc.zb(context, 8.0f));
        RelativeLayout.LayoutParams layoutParams8 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams8.addRule(10);
        layoutParams8.topMargin = dc.zb(context, 90.0f);
        ludVar2.setLayoutParams(layoutParams8);
        pmi pmiVar2 = new pmi(context);
        this.f24780dy = pmiVar2;
        ludVar2.addView(pmiVar2, new LinearLayout.LayoutParams(dc.zb(context, 36.0f), dc.zb(context, 36.0f)));
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar3 = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        ludVar3.setOrientation(1);
        LinearLayout.LayoutParams layoutParams9 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams9.leftMargin = dc.zb(context, 8.0f);
        ludVar2.addView(ludVar3, layoutParams9);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar4 = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.syc = fbyVar4;
        fbyVar4.setTextColor(-1);
        ludVar3.addView(fbyVar4, new LinearLayout.LayoutParams(-2, -2));
        wie wieVar = new wie(context, true);
        this.xkz = wieVar;
        ludVar3.addView(wieVar, new LinearLayout.LayoutParams(-2, -2));
        PAGLogoView pAGLogoViewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(context, tnVar);
        this.f24789dj = pAGLogoViewCreatePAGLogoViewByMaterial;
        pAGLogoViewCreatePAGLogoViewByMaterial.setId(520093757);
        FrameLayout.LayoutParams layoutParams10 = new FrameLayout.LayoutParams(-2, dc.zb(context, 14.0f));
        layoutParams10.gravity = 83;
        syaVar3.addView(this.f24789dj, layoutParams10);
        addView(syaVar3);
        addView(this.f24794ok);
        addView(syaVar2);
        addView(this.fby);
        addView(ludVar2);
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.dj getAdIconView() {
        return this.f24780dy;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.fby getAdTitleTextView() {
        return this.syc;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.lud getOverlayLayout() {
        return this.wie;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public wie getScoreBar() {
        return this.xkz;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public View getUserInfo() {
        return this.f24781ry;
    }
}
