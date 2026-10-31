package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public class oty extends LinearLayout {

    /* renamed from: dj, reason: collision with root package name */
    private ycx f23576dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.adsdk.zb.lt f23577lt;
    private LinearLayout lud;
    private TextView sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.jc f23578ul;
    private TextView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.utils.dv f23579zb;

    public interface ycx {
    }

    public oty(Context context, View view, com.bytedance.sdk.component.adexpress.dynamic.dj.jc jcVar) {
        super(context);
        this.f23578ul = jcVar;
        ycx(context, view);
    }

    public TextView getTopTextView() {
        return this.ycx;
    }

    public LinearLayout getWriggleLayout() {
        return this.lud;
    }

    public View getWriggleProgressIv() {
        return this.f23577lt;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (isShown()) {
            if (this.f23579zb == null) {
                this.f23579zb = new com.bytedance.sdk.component.utils.dv(getContext().getApplicationContext(), 2);
            }
            new Object() { // from class: com.bytedance.sdk.component.adexpress.lt.oty.2
            };
            com.bytedance.sdk.component.adexpress.dynamic.dj.jc jcVar = this.f23578ul;
            if (jcVar != null) {
                jcVar.sya();
                this.f23578ul.lud();
                this.f23578ul.lt();
                this.f23578ul.fby();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        try {
            com.bytedance.adsdk.zb.lt ltVar = this.f23577lt;
            if (ltVar != null) {
                ltVar.lud();
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+zoRN0kk=", "bPwkkgSwbOCVQ9NYrR+pJVr6JJoNimDClw==", "VOAJkBe9as+FTvFPgxyXIVXqIoI=", Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
    }

    public void setOnShakeViewListener(ycx ycxVar) {
        this.f23576dj = ycxVar;
    }

    public void setShakeText(String str) {
        this.sya.setText(str);
    }

    private void ycx(Context context, View view) {
        setClipChildren(false);
        addView(view);
        this.lud = (LinearLayout) findViewById(2097610722);
        this.ycx = (TextView) findViewById(2097610719);
        this.sya = (TextView) findViewById(2097610718);
        com.bytedance.adsdk.zb.lt ltVar = (com.bytedance.adsdk.zb.lt) findViewById(2097610706);
        this.f23577lt = ltVar;
        ltVar.setAnimation("lottie_json/twist_multi_angle.json");
        this.f23577lt.setImageAssetsFolder("images/");
        this.f23577lt.ycx(true);
    }

    public void ycx() {
        postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.lt.oty.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    oty.this.f23577lt.ycx();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+zoRN0kk=", "bPwkkgSwbOCVQ9NYrR+pJVr6JJoNimDClw6G", "Sfsj", 73);
                }
            }
        }, 500L);
    }
}
