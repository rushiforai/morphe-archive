package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.view.View;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.ycx.lt;

/* loaded from: classes2.dex */
public class ry {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.jw.fby f24715dj;
    private boolean fby;

    /* renamed from: lt, reason: collision with root package name */
    private final String f24716lt;
    private ImageView lud;
    private final Context sya;

    /* renamed from: ul, reason: collision with root package name */
    private wwx f24717ul;
    private final tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    private RelativeLayout f24718zb;

    public ry(Context context, tn tnVar, String str, boolean z11) {
        this.sya = context;
        this.ycx = tnVar;
        this.f24716lt = str;
        this.fby = z11;
        lud();
    }

    private void lud() {
        RelativeLayout relativeLayoutYcx = ycx(this.sya, this.fby);
        this.f24718zb = relativeLayoutYcx;
        this.f24715dj = (com.bytedance.sdk.component.jw.fby) relativeLayoutYcx.findViewById(com.bytedance.sdk.openadsdk.utils.wie.f27225rl);
        wwx wwxVar = new wwx(this.sya, (RelativeLayout) this.f24718zb.findViewById(com.bytedance.sdk.openadsdk.utils.wie.nzi), this.ycx, this.f24715dj, this.f24716lt, this.fby);
        this.f24717ul = wwxVar;
        this.lud = wwxVar.lud();
    }

    private static RelativeLayout ycx(Context context, boolean z11) {
        RelativeLayout relativeLayout = new RelativeLayout(context);
        relativeLayout.setBackgroundColor(-1);
        relativeLayout.addView(new jw(context));
        fby.sya syaVar = fby.sya.LANDING_PAGE;
        new com.bytedance.sdk.component.jw.fby(context, syaVar);
        com.bytedance.sdk.component.jw.fby fbyVar = z11 ? new com.bytedance.sdk.component.jw.fby(context, fby.sya.PRIVACY) : new com.bytedance.sdk.component.jw.fby(context, syaVar);
        fbyVar.setId(com.bytedance.sdk.openadsdk.utils.wie.f27225rl);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(12);
        layoutParams.addRule(3, com.bytedance.sdk.openadsdk.utils.wie.nzi);
        if (z11) {
            relativeLayout.addView(fbyVar, layoutParams);
        }
        return relativeLayout;
    }

    public View dj() {
        return this.f24718zb;
    }

    public com.bytedance.sdk.component.jw.fby sya() {
        return this.f24715dj;
    }

    public void zb() {
        wwx wwxVar = this.f24717ul;
        if (wwxVar != null) {
            wwxVar.sya();
        }
    }

    public void zb(String str) {
        this.f24717ul.zb(str);
    }

    public void ycx() {
        wwx wwxVar = this.f24717ul;
        if (wwxVar != null) {
            wwxVar.zb();
        }
    }

    public void ycx(WebView webView, lt.ycx ycxVar) {
        wwx wwxVar = this.f24717ul;
        if (wwxVar != null) {
            wwxVar.ycx(webView, ycxVar);
        }
    }

    public void ycx(String str) {
        this.f24717ul.ycx(str);
    }

    public void ycx(boolean z11) {
        this.f24717ul.ycx(z11);
    }
}
