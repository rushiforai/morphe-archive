package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import a5.k;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea extends lt {
    private String ycx;

    public static class ycx implements com.bytedance.sdk.component.lud.fby {
        private final WeakReference<Context> ycx;

        public ycx(Context context) {
            this.ycx = new WeakReference<>(context);
        }

        @Override // com.bytedance.sdk.component.lud.fby
        public Bitmap ycx(Bitmap bitmap) {
            Context context = this.ycx.get();
            if (context != null) {
                return com.bytedance.sdk.component.adexpress.dj.ycx.ycx(context, bitmap, 25);
            }
            return null;
        }
    }

    public static class zb implements com.bytedance.sdk.component.lud.dy {
        private WeakReference<View> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private Resources f23397zb;

        public zb(View view, Resources resources) {
            this.ycx = new WeakReference<>(view);
            this.f23397zb = resources;
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(int i5, String str, Throwable th2) {
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(com.bytedance.sdk.component.lud.ea eaVar) {
            Object objZb;
            View view = this.ycx.get();
            if (view == null || (objZb = eaVar.zb()) == null || eaVar.sya() == null) {
                return;
            }
            if (objZb instanceof Bitmap) {
                view.setBackground(new BitmapDrawable(this.f23397zb, (Bitmap) objZb));
            } else if (objZb instanceof Drawable) {
                if (Build.VERSION.SDK_INT >= 28 && k.v(objZb)) {
                    k.j(objZb).start();
                }
                view.setBackground((Drawable) objZb);
            }
        }
    }

    public ea(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        if (!TextUtils.isEmpty(this.f23413ok.bh()) && fbyVar.uh()) {
            com.bytedance.sdk.component.adexpress.lt.jc jcVar = new com.bytedance.sdk.component.adexpress.lt.jc(context);
            jcVar.setAnimationsLoop(this.f23413ok.aq());
            jcVar.setImageLottieTosPath(this.f23413ok.bh());
            jcVar.setLottieAppNameMaxLength(this.f23413ok.xf());
            jcVar.setLottieAdTitleMaxLength(this.f23413ok.uu());
            jcVar.setLottieAdDescMaxLength(this.f23413ok.bjp());
            jcVar.setData(fbyVar.htf());
            this.syc = jcVar;
        } else if (this.f23413ok.syc() > 0.0f) {
            com.bytedance.sdk.component.adexpress.lt.dv dvVar = new com.bytedance.sdk.component.adexpress.lt.dv(context);
            this.syc = dvVar;
            dvVar.setXRound((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, this.f23413ok.syc()));
            ((com.bytedance.sdk.component.adexpress.lt.dv) this.syc).setYRound((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, this.f23413ok.syc()));
        } else if (fby() || !"arrowButton".equals(fbyVar.jc().zb())) {
            this.syc = new ImageView(context);
        } else {
            com.bytedance.sdk.component.adexpress.dynamic.animation.view.zb zbVar = new com.bytedance.sdk.component.adexpress.dynamic.animation.view.zb(context);
            zbVar.setBrickNativeValue(this.f23413ok);
            this.syc = zbVar;
        }
        this.ycx = getImageKey();
        this.syc.setTag(Integer.valueOf(getClickArea()));
        if ("arrowButton".equals(fbyVar.jc().zb())) {
            if (this.f23413ok.zb() > 0 || this.f23413ok.ycx() > 0) {
                int iMin = Math.min(this.f23416ul, this.fby);
                this.f23416ul = iMin;
                this.fby = Math.min(iMin, this.fby);
                this.f23411jw = (int) (com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, (this.f23413ok.ycx() / 2) + this.f23413ok.zb() + 0.5f) + this.f23411jw);
            } else {
                int iMax = Math.max(this.f23416ul, this.fby);
                this.f23416ul = iMax;
                this.fby = Math.max(iMax, this.fby);
            }
            this.f23413ok.ycx(this.f23416ul / 2);
        }
        addView(this.syc, new FrameLayout.LayoutParams(this.f23416ul, this.fby));
    }

    private String getImageKey() {
        Map<String, String> mapEa = this.xkz.getRenderRequest().ea();
        if (mapEa == null || mapEa.size() <= 0) {
            return null;
        }
        return mapEa.get(this.f23413ok.ea());
    }

    private boolean ycx() {
        String strOk = this.f23413ok.ok();
        if (this.f23413ok.htf()) {
            return true;
        }
        if (TextUtils.isEmpty(strOk)) {
            return false;
        }
        try {
            JSONObject jSONObject = new JSONObject(strOk);
            return Math.abs((((float) this.f23416ul) / (((float) this.fby) * 1.0f)) - (((float) jSONObject.optInt("width")) / (((float) jSONObject.optInt("height")) * 1.0f))) > 0.01f;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61au6NS9BYuhilPw==", "Uv0PmRau", 270);
            return false;
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.rmy
    public boolean jw() {
        int iWie;
        super.jw();
        if (!TextUtils.isEmpty(this.f23413ok.bh())) {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.CENTER_CROP);
            return true;
        }
        int iDy = 0;
        if ("arrowButton".equals(this.f23414ry.jc().zb())) {
            ((ImageView) this.syc).setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.f23409ea, "tt_white_righterbackicon_titlebar"));
            if (((ImageView) this.syc).getDrawable() != null) {
                ((ImageView) this.syc).getDrawable().setAutoMirrored(true);
            }
            this.syc.setPadding(0, 0, 0, 0);
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.FIT_XY);
            return true;
        }
        this.syc.setBackgroundColor(this.f23413ok.bhi());
        String strSya = this.f23414ry.jc().sya();
        if ("user".equals(strSya)) {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            ((ImageView) this.syc).setColorFilter(this.f23413ok.ul());
            ((ImageView) this.syc).setImageDrawable(com.bytedance.sdk.component.utils.wwx.sya(getContext(), "tt_user"));
            ImageView imageView = (ImageView) this.syc;
            int i5 = this.f23416ul;
            imageView.setPadding(i5 / 10, this.fby / 5, i5 / 10, 0);
        } else if (strSya != null && strSya.startsWith("@")) {
            try {
                ((ImageView) this.syc).setImageResource(Integer.parseInt(strSya.substring(1)));
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61au6NS9BYuhilPw==", "Wv49mRqSaNOJXNJumAisLQ==", 146);
            }
        }
        com.bytedance.sdk.component.lud.syc sycVarLud = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lud();
        String strEa = this.f23413ok.ea();
        if (!TextUtils.isEmpty(strEa) && !strEa.startsWith("http:") && !strEa.startsWith("https:")) {
            DynamicRootView dynamicRootView = this.xkz;
            strEa = com.bytedance.sdk.component.adexpress.dynamic.lud.jw.zb(strEa, (dynamicRootView == null || dynamicRootView.getRenderRequest() == null) ? null : this.xkz.getRenderRequest().dv());
        }
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        if (syaVarSya != null) {
            iDy = syaVarSya.dy();
            iWie = syaVarSya.wie();
        } else {
            iWie = 0;
        }
        com.bytedance.sdk.component.lud.jc jcVarLud = sycVarLud.ycx(strEa).ycx(this.ycx).ycx(this.f23416ul).zb(this.fby).dj(iDy).lud(iWie);
        String strXkz = this.xkz.getRenderRequest().xkz();
        if (!TextUtils.isEmpty(strXkz)) {
            jcVarLud.zb(strXkz);
        }
        if (ycx()) {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.FIT_CENTER);
            jcVarLud.ycx(Bitmap.Config.ARGB_4444).sya(2).ycx(new ycx(this.f23409ea)).ycx(new zb(this.syc, getResources()));
        } else {
            if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                jcVarLud.sya(1).ycx((ImageView) this.syc);
            }
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.FIT_XY);
        }
        if ((this.syc instanceof ImageView) && "cover".equals(getImageObjectFit())) {
            ((ImageView) this.syc).setScaleType(ImageView.ScaleType.CENTER_CROP);
        }
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable drawable = ((ImageView) this.syc).getDrawable();
        if (Build.VERSION.SDK_INT < 28 || !k.u(drawable)) {
            return;
        }
        k.i(drawable).start();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        Drawable drawable = ((ImageView) this.syc).getDrawable();
        if (Build.VERSION.SDK_INT < 28 || !k.u(drawable)) {
            return;
        }
        k.i(drawable).stop();
    }
}
