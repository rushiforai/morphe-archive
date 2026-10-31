package com.bytedance.sdk.component.adexpress.lud;

import android.app.Activity;
import android.content.Context;
import android.content.MutableContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.zb.ea;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.bytedance.sdk.component.adexpress.zb.ul;
import com.bytedance.sdk.component.adexpress.zb.xkz;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.jw.lt;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class ycx implements com.bytedance.sdk.component.adexpress.ycx, com.bytedance.sdk.component.adexpress.zb.dj<fby>, ea {

    /* renamed from: dj, reason: collision with root package name */
    protected boolean f23644dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.fby f23645ea;
    private Context fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f23646jc;

    /* renamed from: jw, reason: collision with root package name */
    private String f23647jw;
    protected fby lud;

    /* renamed from: ok, reason: collision with root package name */
    private ry f23649ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f23650ry;
    private int xkz;
    protected JSONObject ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected volatile ul f23652zb;
    protected boolean sya = false;

    /* renamed from: lt, reason: collision with root package name */
    protected int f23648lt = 8;

    /* renamed from: ul, reason: collision with root package name */
    protected AtomicBoolean f23651ul = new AtomicBoolean(false);
    private AtomicBoolean syc = new AtomicBoolean(false);

    public ycx(Context context, ry ryVar) {
        this.fby = context;
        this.f23649ok = ryVar;
        this.f23647jw = ryVar.dj();
        syc();
    }

    private void syc() {
        if (this.fby == null && com.bytedance.sdk.component.adexpress.dj.ycx() != null) {
            this.fby = com.bytedance.sdk.component.adexpress.dj.ycx();
        }
        Context context = this.fby;
        if (context != null) {
            fby fbyVarYcx = ycx(context, this.f23647jw);
            this.lud = fbyVarYcx;
            if (fbyVarYcx == null) {
                this.lud = new fby(new MutableContextWrapper(this.fby.getApplicationContext()), ycx());
            } else {
                this.sya = true;
            }
        }
    }

    public fby dj() {
        return this.lud;
    }

    public void ea() {
        ok();
        Activity activityYcx = com.bytedance.sdk.component.utils.zb.ycx(this.lud);
        if (activityYcx != null) {
            this.xkz = zb(activityYcx);
        }
    }

    public void fby() {
        if (this.f23651ul.get()) {
            return;
        }
        this.f23651ul.set(true);
        jc();
        if (this.lud.getParent() != null) {
            ((ViewGroup) this.lud.getParent()).removeView(this.lud);
        }
        this.syc.get();
        if (!this.f23644dj || this.syc.get()) {
            lud.ycx().lt(this.lud);
        } else {
            zb();
        }
    }

    public abstract void jc();

    public void jw() {
        if (dj() == null) {
            return;
        }
        try {
            dj().getWebView().resumeTimers();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "ee8+kDS5a/GJT8BviR+kLUk=", "VOAfkBCpZMI=", 249);
        }
    }

    public void lt() {
    }

    public void ok() {
    }

    public void ry() {
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public int sya() {
        return 0;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    /* renamed from: ul, reason: merged with bridge method [inline-methods] */
    public fby lud() {
        return dj();
    }

    public ry xkz() {
        return this.f23649ok;
    }

    public abstract void ycx(int i5);

    public void zb() {
        if (this.f23649ok.tn()) {
            lud.ycx().dj(this.lud);
        } else {
            lud.ycx().lud(this.lud);
        }
    }

    public fby.sya ycx() {
        return this.f23649ok.tn() ? fby.sya.ADS_V3 : fby.sya.ADS;
    }

    public fby ycx(Context context, String str) {
        if (this.f23649ok.tn()) {
            return lud.ycx().zb(context, str);
        }
        return lud.ycx().sya(context, str);
    }

    public boolean zb(xkz xkzVar) {
        return xkzVar.sya();
    }

    private int zb(Activity activity) {
        return activity.hashCode();
    }

    public void ycx(String str) {
        this.f23646jc = str;
    }

    public void zb(boolean z11) {
        this.syc.set(z11);
    }

    public void ycx(com.bytedance.sdk.component.adexpress.zb.fby fbyVar) {
        this.f23645ea = fbyVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public void ycx(ul ulVar) {
        String str;
        this.f23652zb = ulVar;
        if (dj() != null && dj().getWebView() != null) {
            if (TextUtils.isEmpty(this.f23646jc)) {
                this.f23652zb.ycx(102, "url is empty");
                return;
            }
            if (!this.f23649ok.av()) {
                if (!this.f23649ok.tn()) {
                    if (!com.bytedance.sdk.component.adexpress.ycx.zb.zb.ycx(this.ycx)) {
                        ul ulVar2 = this.f23652zb;
                        StringBuilder sb2 = new StringBuilder("data null is ");
                        sb2.append(this.ycx == null);
                        ulVar2.ycx(103, sb2.toString());
                        return;
                    }
                } else if (sya() == 9 && !com.bytedance.sdk.component.adexpress.ycx.zb.zb.zb(this.ycx)) {
                    ul ulVar3 = this.f23652zb;
                    StringBuilder sb3 = new StringBuilder("data null is ");
                    sb3.append(this.ycx == null);
                    ulVar3.ycx(103, sb3.toString());
                    return;
                }
            }
            WebView webView = this.lud.getWebView();
            this.f23649ok.lud().ycx(this.sya, webView instanceof lt ? ((lt) webView).getReuseCount() : 0);
            if (this.sya) {
                try {
                    int iOty = this.f23649ok.oty();
                    if (this.f23649ok.tn() && iOty == 1) {
                        this.f23649ok.sya();
                        str = "javascript:window.SDK_RESET_RENDER();" + ("window.SDK_INJECT_DATA=" + this.f23649ok.sya() + ";") + "window.SDK_TRIGGER_RENDER();";
                    } else {
                        str = "javascript:window.SDK_RESET_RENDER();window.SDK_TRIGGER_RENDER();";
                    }
                    lt();
                    this.lud.wie();
                    this.f23649ok.lud();
                    com.bytedance.sdk.component.utils.xkz.ycx(this.lud.getWebView(), str);
                    return;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "ee8+kDS5a/GJT8BviR+kLUk=", "SesjkQau", 193);
                    lud.ycx().lt(this.lud);
                    this.f23652zb.ycx(102, "load exception is " + e3.getMessage());
                    return;
                }
            }
            this.lud.wie();
            this.f23649ok.lud();
            this.lud.a_(this.f23646jc);
            return;
        }
        ul ulVar4 = this.f23652zb;
        StringBuilder sb4 = new StringBuilder("SSWebview null is ");
        sb4.append(dj() == null);
        sb4.append(" or Webview is null");
        ulVar4.ycx(102, sb4.toString());
    }

    public void ycx(boolean z11) {
        this.f23650ry = z11;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.ea
    public void ycx(final xkz xkzVar) {
        if (xkzVar == null) {
            if (this.f23652zb != null) {
                this.f23652zb.ycx(105, "renderResult is null");
                return;
            }
            return;
        }
        boolean zZb = zb(xkzVar);
        final float fDj = (float) xkzVar.dj();
        final float fLud = (float) xkzVar.lud();
        if (sya() == 0 && (fDj <= 0.0f || fLud <= 0.0f)) {
            if (this.f23652zb != null) {
                this.f23652zb.ycx(105, "width is " + fDj + "height is " + fLud);
                return;
            }
            return;
        }
        this.f23644dj = zZb;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            ycx(xkzVar, fDj, fLud);
        } else {
            new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lud.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.ycx(xkzVar, fDj, fLud);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(xkz xkzVar, float f11, float f12) {
        xkzVar.ea();
        boolean z11 = this.f23644dj;
        if (z11 && !this.f23650ry) {
            ycx(f11, f12);
            ycx(this.f23648lt);
            if (this.f23652zb != null) {
                this.f23652zb.ycx(dj(), xkzVar);
                return;
            }
            return;
        }
        if (!z11) {
            lud.ycx().lt(this.lud);
        }
        ycx(xkzVar.ea(), xkzVar.jc());
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.ea
    public void ycx(View view, int i5, com.bytedance.sdk.component.adexpress.sya syaVar) {
        com.bytedance.sdk.component.adexpress.zb.fby fbyVar = this.f23645ea;
        if (fbyVar != null) {
            fbyVar.ycx(view, i5, syaVar);
        }
    }

    private void ycx(float f11, float f12) {
        this.f23649ok.lud().lud();
        if (sya() != 9 && sya() != 11) {
            int iYcx = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.fby, f11);
            int iYcx2 = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.fby, f12);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) dj().getLayoutParams();
            if (layoutParams == null) {
                layoutParams = new FrameLayout.LayoutParams(iYcx, iYcx2);
            }
            layoutParams.width = iYcx;
            layoutParams.height = iYcx2;
            dj().setLayoutParams(layoutParams);
            return;
        }
        FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) dj().getLayoutParams();
        if (layoutParams2 == null) {
            layoutParams2 = new FrameLayout.LayoutParams(-1, -1);
        }
        layoutParams2.width = -1;
        layoutParams2.height = -1;
        dj().setLayoutParams(layoutParams2);
    }

    private void ycx(int i5, String str) {
        if (this.f23652zb != null) {
            this.f23652zb.ycx(i5, str);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.ycx
    public void ycx(Activity activity) {
        if (this.xkz == 0 || activity == null || activity.hashCode() != this.xkz) {
            return;
        }
        fby();
        ry();
    }

    public void ycx(JSONObject jSONObject) {
        this.ycx = jSONObject;
    }
}
