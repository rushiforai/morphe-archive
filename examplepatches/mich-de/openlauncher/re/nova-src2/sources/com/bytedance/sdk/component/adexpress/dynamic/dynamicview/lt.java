package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import a5.k;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends lud {
    private static String htf = "";
    private volatile boolean thx;

    /* renamed from: uh, reason: collision with root package name */
    protected com.bytedance.sdk.component.adexpress.dynamic.sya.jw f23399uh;
    private Runnable ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Runnable f23400zb;

    public static class sya implements com.bytedance.sdk.component.lud.fby {
        private final WeakReference<Context> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final int f23403zb;

        public sya(Context context, int i5) {
            this.ycx = new WeakReference<>(context);
            this.f23403zb = i5;
        }

        @Override // com.bytedance.sdk.component.lud.fby
        public Bitmap ycx(Bitmap bitmap) {
            Context context = this.ycx.get();
            if (context != null) {
                return com.bytedance.sdk.component.adexpress.dj.ycx.ycx(context, bitmap, this.f23403zb);
            }
            return null;
        }
    }

    public static class ycx implements com.bytedance.sdk.component.lud.dy {
        private final com.bytedance.sdk.component.adexpress.dynamic.dj.fby sya;
        private final WeakReference<View> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final WeakReference<DynamicRootView> f23404zb;

        public ycx(View view, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
            this.ycx = new WeakReference<>(view);
            this.f23404zb = new WeakReference<>(dynamicRootView);
            this.sya = fbyVar;
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(int i5, String str, Throwable th2) {
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(com.bytedance.sdk.component.lud.ea eaVar) {
            Drawable bitmapDrawable;
            View view = this.ycx.get();
            Object objZb = eaVar.zb();
            if (objZb instanceof Bitmap) {
                bitmapDrawable = new BitmapDrawable((Bitmap) objZb);
            } else if (objZb instanceof Drawable) {
                if (Build.VERSION.SDK_INT >= 28) {
                    Drawable drawable = (Drawable) objZb;
                    if (k.u(drawable)) {
                        k.i(drawable).start();
                    }
                }
                bitmapDrawable = (Drawable) objZb;
            } else {
                bitmapDrawable = null;
            }
            if (!com.bytedance.sdk.component.adexpress.dj.zb()) {
                DynamicRootView dynamicRootView = this.f23404zb.get();
                if (dynamicRootView == null) {
                    return;
                }
                if ("open_ad".equals(dynamicRootView.getRenderRequest().dj()) || "splash_ad".equals(dynamicRootView.getRenderRequest().dj())) {
                    view.setBackground(bitmapDrawable);
                    return;
                } else {
                    view.setBackground(bitmapDrawable);
                    return;
                }
            }
            if (view == null) {
                return;
            }
            view.setBackground(bitmapDrawable);
            com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = this.sya;
            if (fbyVar == null || fbyVar.jc() == null || 6 != this.sya.jc().ycx() || view.getBackground() == null) {
                return;
            }
            view.getBackground().setAutoMirrored(true);
        }
    }

    public static class zb implements com.bytedance.sdk.component.lud.dy {
        private final WeakReference<View> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final WeakReference<lud> f23405zb;

        public zb(View view, lud ludVar) {
            this.ycx = new WeakReference<>(view);
            this.f23405zb = new WeakReference<>(ludVar);
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(int i5, String str, Throwable th2) {
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(com.bytedance.sdk.component.lud.ea eaVar) {
            Object objZb;
            lud ludVar;
            View view = this.ycx.get();
            if (view == null || (objZb = eaVar.zb()) == null || eaVar.sya() == null || (ludVar = this.f23405zb.get()) == null || !(objZb instanceof Bitmap)) {
                return;
            }
            view.setBackground(ludVar.ycx((Bitmap) objZb));
        }
    }

    public lt(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context, dynamicRootView, fbyVar);
        this.thx = true;
        setTag(Integer.valueOf(getClickArea()));
        String strZb = fbyVar.jc().zb();
        if ("logo-union".equals(strZb)) {
            dynamicRootView.setLogoUnionHeight(this.fby - ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, this.f23413ok.ycx() + this.f23413ok.zb())));
        } else if ("scoreCountWithIcon".equals(strZb)) {
            dynamicRootView.setScoreCountWithIcon(this.fby - ((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(context, this.f23413ok.ycx() + this.f23413ok.zb())));
        }
    }

    private static String getBuildModel() {
        try {
            htf = com.bytedance.sdk.component.utils.oty.ycx();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU/HIIU=", "XOs5txa1ZcOtRdNYgA==", 347);
            htf = Build.MODEL;
        }
        if (TextUtils.isEmpty(htf)) {
            htf = Build.MODEL;
        }
        return htf;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Drawable sya(String str) {
        try {
            JSONArray jSONArray = new JSONArray(str);
            ArrayList arrayList = new ArrayList();
            String string = b.f42142b;
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                if (jSONArray.getString(i5).startsWith("#")) {
                    arrayList.add(jSONArray.getString(i5));
                } else if (jSONArray.getString(i5).endsWith("deg")) {
                    string = jSONArray.getString(i5);
                }
            }
            if (arrayList.size() <= 0) {
                return null;
            }
            int[] iArr = new int[arrayList.size()];
            for (int i11 = 0; i11 < arrayList.size(); i11++) {
                iArr[i11] = com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(((String) arrayList.get(i11)).substring(0, 7));
            }
            GradientDrawable gradientDrawableYcx = ycx(ycx(string), iArr);
            gradientDrawableYcx.setShape(0);
            gradientDrawableYcx.setCornerRadius(com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.syc()));
            return gradientDrawableYcx;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU/HIIU=", "XOs5uAKobNWJS9t+iR+0LUnKP5QUvWvLhQ==", 332);
            return null;
        }
    }

    private String zb(String str) {
        try {
            Map<String, String> mapEa = this.xkz.getRenderRequest().ea();
            if (mapEa != null && mapEa.size() > 0) {
                return mapEa.get(str);
            }
            return null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU/HIIU=", "XOs5vA69bsKrT84=", 75);
            return null;
        }
    }

    public FrameLayout.LayoutParams getWidgetLayoutParams() {
        return new FrameLayout.LayoutParams(this.f23416ul, this.fby);
    }

    public boolean jw() {
        int iDy;
        int iWie;
        Drawable backgroundDrawable;
        DynamicRootView dynamicRootView;
        JSONObject jSONObjectOptJSONObject;
        final View view = this.syc;
        if (view == null) {
            view = this;
        }
        setContentDescription(this.f23414ry.ycx(this.f23413ok.tru()));
        String strUfy = this.f23413ok.ufy();
        String strDv = null;
        String strYcx = (TextUtils.isEmpty(strUfy) || (dynamicRootView = this.xkz) == null || dynamicRootView.getRenderRequest() == null || this.xkz.getRenderRequest().sya() == null || (jSONObjectOptJSONObject = this.xkz.getRenderRequest().sya().optJSONObject("creative")) == null) ? null : ycx(jSONObjectOptJSONObject.opt(strUfy));
        if (TextUtils.isEmpty(strYcx)) {
            strYcx = this.f23413ok.thx();
        }
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        if (syaVarSya != null) {
            iDy = syaVarSya.dy();
            iWie = syaVarSya.wie();
        } else {
            iDy = 0;
            iWie = 0;
        }
        if (this.f23413ok.htf()) {
            int iUh = this.f23413ok.uh();
            String str = this.f23413ok.f23373zb;
            com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lud().ycx(str).ycx(this.f23416ul).zb(this.fby).dj(iDy).lud(iWie).ycx(zb(str)).sya(2).ycx(new sya(this.f23409ea, iUh)).ycx(new zb(view, this));
        } else if (!TextUtils.isEmpty(strYcx)) {
            if (!strYcx.startsWith("http:") && !strYcx.startsWith("https:")) {
                DynamicRootView dynamicRootView2 = this.xkz;
                if (dynamicRootView2 != null && dynamicRootView2.getRenderRequest() != null) {
                    strDv = this.xkz.getRenderRequest().dv();
                }
                strYcx = com.bytedance.sdk.component.adexpress.dynamic.lud.jw.zb(strYcx, strDv);
            }
            com.bytedance.sdk.component.lud.jc jcVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lud().ycx(strYcx).ycx(this.f23416ul).zb(this.fby).dj(iDy).lud(iWie).ycx(zb(strYcx)).sya(1);
            ycx(jcVarSya);
            jcVarSya.ycx(new ycx(view, this.xkz, this.f23414ry));
        }
        if (getBackground() == null && (backgroundDrawable = getBackgroundDrawable()) != null) {
            view.setBackground(backgroundDrawable);
        }
        if (this.f23413ok.av() > 0.0d) {
            postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (lt.this.f23413ok.kgy() > 0) {
                            lt ltVar = lt.this;
                            Drawable drawableSya = ltVar.sya(ltVar.xkz.getBgMaterialCenterCalcColor().get(Integer.valueOf(lt.this.f23413ok.kgy())));
                            if (drawableSya == null) {
                                lt ltVar2 = lt.this;
                                drawableSya = ltVar2.ycx(true, ltVar2.xkz.getBgMaterialCenterCalcColor().get(Integer.valueOf(lt.this.f23413ok.kgy())));
                            }
                            if (drawableSya != null) {
                                view.setBackground(drawableSya);
                                return;
                            }
                            View view2 = view;
                            lt ltVar3 = lt.this;
                            view2.setBackground(ltVar3.ycx(true, ltVar3.xkz.getBgColor()));
                        }
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU/HIIVH7Q==", "Sfsj", 168);
                    }
                }
            }, (long) (this.f23413ok.av() * 1000.0d));
        }
        View view2 = this.syc;
        if (view2 != null) {
            view2.setPadding((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.sya()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.zb()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.dj()), (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.ycx()));
        }
        if (this.f23408dy || this.f23413ok.xkz() > 0.0d) {
            setShouldInvisible(true);
            view.setVisibility(4);
            setVisibility(4);
        }
        return true;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        View view = this.syc;
        if (view == null) {
            view = this;
        }
        double dHtf = this.f23414ry.jc().lud().htf();
        if (dHtf < 90.0d && dHtf > 0.0d) {
            com.bytedance.sdk.component.utils.jw.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt.2
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.setVisibility(8);
                }
            }, (long) (dHtf * 1000.0d));
        }
        ycx(this.f23414ry.jc().lud().uh(), view);
        if (!TextUtils.isEmpty(this.f23413ok.dc())) {
            ycx();
        }
        super.onAttachedToWindow();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud, android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        try {
            removeCallbacks(this.ycx);
            removeCallbacks(this.f23400zb);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU/HIIU=", "VOAJkBe9as+FTvFPgxyXIVXqIoI=", TTAdConstant.MATE_IS_NULL_CODE);
        }
    }

    private String ycx(Object obj) {
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof JSONArray) {
            return ycx(((JSONArray) obj).opt(0));
        }
        if (obj instanceof JSONObject) {
            return ycx((Object) ((JSONObject) obj).optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
        }
        return null;
    }

    private static void ycx(com.bytedance.sdk.component.lud.jc jcVar) {
        if ("SMARTISAN".equals(Build.BRAND) && "SM901".equals(getBuildModel())) {
            jcVar.ycx(Bitmap.Config.ARGB_8888);
        }
    }

    private void ycx(double d5, final View view) {
        if (d5 > 0.0d) {
            com.bytedance.sdk.component.utils.jw.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt.3
                @Override // java.lang.Runnable
                public void run() {
                    if (lt.this.f23414ry.jc().lud().vbt() != null) {
                        return;
                    }
                    view.setVisibility(0);
                    lt.this.setVisibility(0);
                }
            }, (long) (d5 * 1000.0d));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(ViewGroup viewGroup) {
        if (viewGroup == null || viewGroup.getChildCount() <= 0) {
            return;
        }
        for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
            if (viewGroup.getChildAt(i5) instanceof com.bytedance.sdk.component.adexpress.dynamic.sya.jw) {
                viewGroup.removeViewAt(i5);
            }
        }
    }

    private void ycx() {
        if (this.thx) {
            int iZr = this.f23413ok.zr();
            int iBba = this.f23413ok.bba();
            Runnable runnable = new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt.4
                @Override // java.lang.Runnable
                public void run() {
                    DynamicRootView dynamicRootView = lt.this.xkz;
                    if (dynamicRootView == null || dynamicRootView.getRenderRequest() == null) {
                        lt ltVar = lt.this;
                        lt ltVar2 = lt.this;
                        ltVar.f23399uh = new com.bytedance.sdk.component.adexpress.dynamic.sya.jw(ltVar2.f23409ea, ltVar2, ltVar2.f23413ok);
                    } else {
                        com.bytedance.sdk.component.adexpress.zb.ry renderRequest = lt.this.xkz.getRenderRequest();
                        com.bytedance.sdk.component.adexpress.dynamic.dj.jc jcVar = new com.bytedance.sdk.component.adexpress.dynamic.dj.jc();
                        jcVar.ycx(renderRequest.syc());
                        jcVar.zb(renderRequest.dy());
                        jcVar.sya(renderRequest.wie());
                        jcVar.ycx(renderRequest.pmi());
                        jcVar.zb(renderRequest.uh());
                        jcVar.sya(renderRequest.htf());
                        jcVar.dj(renderRequest.thx());
                        jcVar.lud(renderRequest.wwx());
                        lt ltVar3 = lt.this;
                        lt ltVar4 = lt.this;
                        ltVar3.f23399uh = new com.bytedance.sdk.component.adexpress.dynamic.sya.jw(ltVar4.f23409ea, ltVar4, ltVar4.f23413ok, jcVar, renderRequest);
                    }
                    lt ltVar5 = lt.this;
                    ltVar5.zb(ltVar5.f23399uh);
                    if (lt.this.getParent() instanceof ViewGroup) {
                        ((ViewGroup) lt.this.getParent()).setClipChildren(false);
                    }
                    lt.this.setClipChildren(false);
                    lt.this.f23399uh.setTag(2);
                    lt ltVar6 = lt.this;
                    ltVar6.ycx((ViewGroup) ltVar6);
                    lt ltVar7 = lt.this;
                    ltVar7.addView(ltVar7.f23399uh, new FrameLayout.LayoutParams(-1, -1));
                    lt.this.f23399uh.sya();
                }
            };
            this.ycx = runnable;
            postDelayed(runnable, iZr * 1000);
            if (this.f23413ok.mp() || iBba >= Integer.MAX_VALUE || iZr >= iBba) {
                return;
            }
            Runnable runnable2 = new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lt.5
                @Override // java.lang.Runnable
                public void run() {
                    lt ltVar = lt.this;
                    if (ltVar.f23399uh != null) {
                        ltVar.thx = false;
                        lt.this.f23399uh.dj();
                        lt.this.f23399uh.setVisibility(4);
                        lt ltVar2 = lt.this;
                        ltVar2.removeView(ltVar2.f23399uh);
                    }
                }
            };
            this.f23400zb = runnable2;
            postDelayed(runnable2, iBba * 1000);
        }
    }
}
