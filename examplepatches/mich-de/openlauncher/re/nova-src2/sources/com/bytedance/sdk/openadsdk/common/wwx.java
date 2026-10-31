package com.bytedance.sdk.openadsdk.common;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.ApmHelper;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity;
import com.bytedance.sdk.openadsdk.common.thx;
import com.bytedance.sdk.openadsdk.common.wie;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.ycx.lt;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class wwx {

    /* renamed from: dv, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.lud f24727dv;

    /* renamed from: dy, reason: collision with root package name */
    private final com.bytedance.sdk.component.jw.fby f24728dy;

    /* renamed from: ea, reason: collision with root package name */
    private ImageView f24729ea;
    private final Context fby;
    private View htf;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.lt f24731jc;

    /* renamed from: jw, reason: collision with root package name */
    private ImageView f24732jw;

    /* renamed from: lt, reason: collision with root package name */
    private final RelativeLayout f24733lt;
    thx lud;

    /* renamed from: ok, reason: collision with root package name */
    private ImageView f24734ok;
    private htf oty;
    private final String pmi;

    /* renamed from: ry, reason: collision with root package name */
    private ImageView f24735ry;
    private boolean syc;

    /* renamed from: tn, reason: collision with root package name */
    private TextView f24736tn;
    private boolean tru;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f24737uh;

    /* renamed from: ul, reason: collision with root package name */
    private final tn f24738ul;
    private lt.ycx wie;
    private TextView wwx;
    wie ycx;

    /* renamed from: zb, reason: collision with root package name */
    TTAdDislikeToast f24739zb;
    final AtomicBoolean sya = new AtomicBoolean(false);

    /* renamed from: dj, reason: collision with root package name */
    final AtomicBoolean f24726dj = new AtomicBoolean(false);
    private boolean thx = false;

    /* renamed from: hf, reason: collision with root package name */
    private String f24730hf = "TTTitleNewStyleManager";
    private final String bhi = "is_new_style";
    private final int xkz = dc.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), 44.0f);

    public wwx(Context context, RelativeLayout relativeLayout, tn tnVar, com.bytedance.sdk.component.jw.fby fbyVar, String str, boolean z11) {
        this.fby = context;
        this.f24733lt = relativeLayout;
        this.f24738ul = tnVar;
        this.f24728dy = fbyVar;
        this.pmi = str;
        this.f24737uh = z11;
        this.lud = new thx(context, this.f24737uh);
        this.tru = str.equals("iab_private_browser") || str.equals("iab_landing_page") || str.equals("iab_history_landing_page");
        ea();
        ok();
    }

    private void ok() {
        View view = this.htf;
        if (view == null) {
            return;
        }
        view.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                if (wwx.this.thx) {
                    wwx.this.zb();
                    wwx.this.thx = false;
                }
            }
        });
    }

    private void ry() {
        try {
            if (this.ycx == null) {
                wie wieVar = new wie(this.fby, this.f24738ul);
                this.ycx = wieVar;
                wieVar.setDislikeSource("landing_page");
                this.ycx.setCallback(new wie.ycx() { // from class: com.bytedance.sdk.openadsdk.common.wwx.3
                    @Override // com.bytedance.sdk.openadsdk.common.wie.ycx
                    public void ycx(View view) {
                        wwx.this.sya.set(true);
                    }

                    @Override // com.bytedance.sdk.openadsdk.common.wie.ycx
                    public void zb(View view) {
                        wwx.this.sya.set(false);
                    }

                    @Override // com.bytedance.sdk.openadsdk.common.wie.ycx
                    public void ycx(FilterWord filterWord) {
                        if (wwx.this.f24726dj.get() || filterWord == null || filterWord.hasSecondOptions()) {
                            return;
                        }
                        wwx.this.f24726dj.set(true);
                    }
                });
            }
            FrameLayout frameLayout = (FrameLayout) this.f24733lt.getRootView().findViewById(16908290);
            frameLayout.addView(this.ycx);
            if (this.f24739zb == null) {
                TTAdDislikeToast tTAdDislikeToast = new TTAdDislikeToast(this.fby);
                this.f24739zb = tTAdDislikeToast;
                frameLayout.addView(tTAdDislikeToast);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGrg==", "UuAkgSe1esuJQdI=", 595);
            ApmHelper.reportCustomError("initDislike error", "TTTitleNewStyleManager", th2);
        }
    }

    private boolean syc() {
        return this.fby.getResources().getConfiguration().getLayoutDirection() == 1;
    }

    private void xkz() {
        this.f24739zb.show(TTAdDislikeToast.getDislikeTip());
    }

    @SuppressLint({"SetTextI18n"})
    private void ea() {
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.f24733lt.getLayoutParams();
        layoutParams.height = this.xkz;
        this.f24733lt.setLayoutParams(layoutParams);
        int iZb = dc.zb(this.fby, 8.0f);
        this.f24733lt.setPadding(iZb, 0, iZb, 0);
        this.f24732jw = (ImageView) this.f24733lt.findViewById(com.bytedance.sdk.openadsdk.utils.wie.f27240wk);
        this.f24729ea = (ImageView) this.f24733lt.findViewById(com.bytedance.sdk.openadsdk.utils.wie.dfk);
        this.f24734ok = (ImageView) this.f24733lt.findViewById(com.bytedance.sdk.openadsdk.utils.wie.vyl);
        this.f24735ry = (ImageView) this.f24733lt.findViewById(520093740);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = (com.bytedance.sdk.openadsdk.core.lt.lud) this.f24733lt.findViewById(com.bytedance.sdk.openadsdk.utils.wie.f27249zk);
        this.f24727dv = ludVar;
        this.wwx = (TextView) ludVar.findViewById(com.bytedance.sdk.openadsdk.utils.wie.ycx);
        this.f24736tn = (TextView) this.f24727dv.findViewById(com.bytedance.sdk.openadsdk.utils.wie.f27248zb);
        if (syc()) {
            this.wwx.setTextDirection(4);
            this.f24736tn.setTextDirection(4);
            this.wwx.setGravity(8388629);
            this.f24736tn.setGravity(8388629);
            this.f24729ea.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.fby, "tt_titlebar_forward"));
            this.f24734ok.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.fby, "tt_titlebar_backward"));
        }
        if (this.tru) {
            this.f24731jc = (com.bytedance.sdk.openadsdk.core.lt.lt) this.f24733lt.findViewById(com.bytedance.sdk.openadsdk.utils.wie.qn);
        } else {
            this.f24731jc = (com.bytedance.sdk.openadsdk.core.lt.lt) this.f24733lt.findViewById(com.bytedance.sdk.openadsdk.utils.wie.ufy);
        }
        this.f24734ok.setVisibility(0);
        this.f24729ea.setVisibility(0);
        this.f24732jw.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (wwx.this.fby instanceof Activity) {
                    ((Activity) wwx.this.fby).finish();
                }
            }
        });
        this.f24729ea.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (wwx.this.f24728dy == null || !wwx.this.f24728dy.jw()) {
                    return;
                }
                if (wwx.this.wie != null) {
                    wwx.this.wie.ycx();
                }
                wwx.this.f24728dy.jc();
            }
        });
        this.f24734ok.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (wwx.this.f24728dy == null || !wwx.this.f24728dy.ea()) {
                    return;
                }
                wwx.this.f24728dy.ok();
            }
        });
        this.f24735ry.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                wwx wwxVar = wwx.this;
                wwxVar.ycx(wwxVar.lud, view);
            }
        });
        ycx(true);
        this.f24729ea.setClickable(false);
        this.f24734ok.setClickable(false);
        ImageView imageView = this.f24729ea;
        int color = Color.parseColor("#A8FFFFFF");
        PorterDuff.Mode mode = PorterDuff.Mode.ADD;
        imageView.setColorFilter(color, mode);
        this.f24734ok.setColorFilter(Color.parseColor("#A8FFFFFF"), mode);
        this.htf = this.f24733lt;
        if (this.f24737uh) {
            this.f24732jw.setContentDescription(com.bytedance.sdk.component.utils.wwx.ycx(this.fby, "privacy_default_close"));
            this.f24729ea.setContentDescription(com.bytedance.sdk.component.utils.wwx.ycx(this.fby, "privacy_default_return"));
        } else {
            this.f24732jw.setContentDescription(com.bytedance.sdk.component.utils.wwx.ycx(this.fby, "landingpage_default_close"));
            this.f24729ea.setContentDescription(com.bytedance.sdk.component.utils.wwx.ycx(this.fby, "landingpage_default_return"));
        }
    }

    public com.bytedance.sdk.openadsdk.core.lt.lt dj() {
        return this.f24731jc;
    }

    public String fby() {
        return this.f24736tn.getText().toString();
    }

    public void jc() {
        if (this.f24726dj.get()) {
            xkz();
            return;
        }
        if (this.ycx == null) {
            ry();
        }
        wie wieVar = this.ycx;
        if (wieVar != null) {
            wieVar.ycx();
        }
    }

    public TextView jw() {
        return this.f24736tn;
    }

    public TextView lt() {
        return this.wwx;
    }

    public ImageView lud() {
        return this.f24732jw;
    }

    public void sya() {
        try {
            final RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.f24733lt.getLayoutParams();
            final com.bytedance.sdk.component.jw.fby fbyVar = this.f24728dy;
            if (this.syc) {
                return;
            }
            int i5 = layoutParams.height;
            int i11 = this.xkz;
            if (i5 == i11) {
                ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(i11, i11 / 2);
                valueAnimatorOfInt.setDuration(300L);
                valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.12
                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        View view;
                        try {
                            int iIntValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                            layoutParams.height = iIntValue;
                            wwx.this.f24733lt.setLayoutParams(layoutParams);
                            if (wwx.this.tru && (view = fbyVar) != null) {
                                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                                marginLayoutParams.topMargin = iIntValue;
                                fbyVar.setLayoutParams(marginLayoutParams);
                            }
                            wwx.this.f24733lt.requestLayout();
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGri2e", "VOAMmwqxaNOJRdlonBWhPF4=", 449);
                            String unused = wwx.this.f24730hf;
                        }
                    }
                });
                valueAnimatorOfInt.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.2
                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationCancel(Animator animator) {
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animator) {
                        wwx.this.syc = false;
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationRepeat(Animator animator) {
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator animator) {
                        wwx.this.syc = true;
                        wwx.this.ycx(8);
                        wwx.this.ycx(false);
                        wwx.this.thx = true;
                    }
                });
                valueAnimatorOfInt.start();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGrg==", "U+cpkQayXc6URtJ/jQM=", 479);
        }
    }

    public String ul() {
        return this.wwx.getText().toString();
    }

    public void dj(final String str) {
        com.bytedance.sdk.openadsdk.dy.dj.ycx("iab_more_options", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.common.wwx.4
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("scene", str);
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("iab_more_options").zb(jSONObject.toString());
            }
        });
    }

    public void zb() {
        try {
            final RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.f24733lt.getLayoutParams();
            final com.bytedance.sdk.component.jw.fby fbyVar = this.f24728dy;
            if (this.syc) {
                return;
            }
            int i5 = layoutParams.height;
            int i11 = this.xkz;
            if (i5 == i11 / 2) {
                ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(i11 / 2, i11);
                valueAnimatorOfInt.setDuration(300L);
                valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.10
                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        View view;
                        try {
                            int iIntValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                            layoutParams.height = iIntValue;
                            wwx.this.f24733lt.setLayoutParams(layoutParams);
                            if (wwx.this.tru && (view = fbyVar) != null) {
                                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                                marginLayoutParams.topMargin = iIntValue;
                                fbyVar.setLayoutParams(marginLayoutParams);
                            }
                            wwx.this.f24733lt.requestLayout();
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGri2Q", "VOAMmwqxaNOJRdlonBWhPF4=", 394);
                            String unused = wwx.this.f24730hf;
                        }
                    }
                });
                valueAnimatorOfInt.addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.openadsdk.common.wwx.11
                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationCancel(Animator animator) {
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    @SuppressLint({"SetTextI18n"})
                    public void onAnimationEnd(Animator animator) {
                        wwx.this.syc = false;
                        wwx.this.ycx(0);
                        wwx.this.ycx(true);
                        wwx.this.thx = false;
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationRepeat(Animator animator) {
                    }

                    @Override // android.animation.Animator.AnimatorListener
                    public void onAnimationStart(Animator animator) {
                        wwx.this.syc = true;
                    }
                });
                valueAnimatorOfInt.start();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGrg==", "SOYigje1fcuFaNZP", 424);
        }
    }

    public Bundle ycx() {
        if (this.f24728dy == null) {
            return null;
        }
        Bundle bundle = new Bundle();
        WebView webView = this.f24728dy.getWebView();
        if (webView == null) {
            return null;
        }
        bundle.putString("mainTitle", ul());
        bundle.putString("subTitle", fby());
        RelativeLayout relativeLayout = this.f24733lt;
        bundle.putBoolean("titleBarVisible", relativeLayout != null && relativeLayout.getVisibility() == 0);
        bundle.putString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, webView.getUrl());
        webView.saveState(bundle);
        return bundle;
    }

    public String sya(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        try {
            String host = Uri.parse(str).getHost();
            if (!TextUtils.isEmpty(host)) {
                return host.startsWith("www.") ? host.substring(4) : host;
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGrg==", "XOs5sQyxaM6O", 618);
        }
        return b.f42142b;
    }

    public void zb(String str) {
        String strSya = sya(str);
        TextView textView = this.f24736tn;
        if (!TextUtils.isEmpty(strSya)) {
            str = strSya;
        }
        textView.setText(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(final thx thxVar, View view) {
        thxVar.setOnMenuItemClickListener(new thx.ycx() { // from class: com.bytedance.sdk.openadsdk.common.wwx.9
            @Override // com.bytedance.sdk.openadsdk.common.thx.ycx
            public void dj() {
                com.bytedance.sdk.component.jw.fby fbyVar;
                if (!wwx.this.tru || (fbyVar = wwx.this.f24728dy) == null) {
                    return;
                }
                Intent intent = new Intent("android.intent.action.VIEW");
                String url = fbyVar.getUrl();
                if (!TextUtils.isEmpty(url)) {
                    intent.setData(Uri.parse(url));
                    com.bytedance.sdk.component.utils.zb.ycx(wwx.this.fby, intent, null);
                }
                wwx.this.dj("onSelectOpenInBrowser");
                thxVar.ycx();
            }

            @Override // com.bytedance.sdk.openadsdk.common.thx.ycx
            public void lt() {
                if (wwx.this.f24737uh || !com.bytedance.sdk.openadsdk.utils.zb.lud()) {
                    return;
                }
                IABLandingPageActivity.ycx(wwx.this.fby, wwx.this.f24738ul, oby.ycx(wwx.this.f24738ul));
                wwx.this.dj("onSelectPrivacy");
                thxVar.ycx();
            }

            @Override // com.bytedance.sdk.openadsdk.common.thx.ycx
            public void lud() {
                if (!wwx.this.f24737uh) {
                    wwx.this.jc();
                } else if (wwx.this.tru) {
                    if (wwx.this.oty == null) {
                        wwx.this.oty = new htf(wwx.this.fby);
                        wwx.this.oty.ycx(wwx.this.f24738ul);
                        wwx.this.oty.setCanceledOnTouchOutside(false);
                    }
                    wwx.this.oty.show();
                }
                wwx.this.dj("onSelectReport");
                thxVar.ycx();
            }

            @Override // com.bytedance.sdk.openadsdk.common.thx.ycx
            public void sya() {
                ClipboardManager clipboardManager;
                if (wwx.this.tru) {
                    String url = wwx.this.f24728dy.getUrl();
                    if (!TextUtils.isEmpty(url) && (clipboardManager = (ClipboardManager) wwx.this.fby.getSystemService("clipboard")) != null) {
                        clipboardManager.setPrimaryClip(ClipData.newPlainText("URL", url));
                    }
                    wwx.this.dj("onSelectCopyLink");
                    thxVar.ycx();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.common.thx.ycx
            public void ycx() {
                if (wwx.this.tru) {
                    if (wwx.this.f24738ul != null) {
                        com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx().ycx(wwx.this.f24738ul);
                    }
                    if (wwx.this.fby instanceof Activity) {
                        Intent intent = new Intent(wwx.this.fby, (Class<?>) TTHistoryActivity.class);
                        intent.putExtra("meta_index", av.ycx().ycx(wwx.this.f24738ul));
                        intent.putExtra("is_new_style", wwx.this.tru);
                        com.bytedance.sdk.component.utils.zb.ycx(wwx.this.fby, intent, null);
                    }
                    wwx.this.dj("onSelectHistory");
                    thxVar.ycx();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.common.thx.ycx
            public void zb() {
                com.bytedance.sdk.component.jw.fby fbyVar;
                if (!wwx.this.tru || (fbyVar = wwx.this.f24728dy) == null || fbyVar.getUrl() == null) {
                    return;
                }
                if (wwx.this.f24731jc != null) {
                    wwx.this.f24731jc.setVisibility(0);
                    wwx.this.f24731jc.setProgress(0);
                }
                fbyVar.fby();
                String url = fbyVar.getUrl();
                if (!TextUtils.isEmpty(url)) {
                    fbyVar.a_(url);
                }
                wwx.this.dj("onSelectRetry");
                thxVar.ycx();
            }
        });
        thxVar.ycx(view);
    }

    @SuppressLint({"SetTextI18n"})
    public void ycx(boolean z11) {
        if (this.wwx == null || this.f24736tn == null) {
            return;
        }
        String string = lt().getText().toString();
        String strReplaceAll = TextUtils.isEmpty(string) ? " " : string.replaceAll("[\n\r]+", " ");
        String string2 = jw().getText().toString();
        this.wwx.setText(strReplaceAll);
        this.f24736tn.setText(string2);
        if (z11) {
            this.wwx.setVisibility(0);
            com.bytedance.sdk.openadsdk.core.lt.lud ludVar = this.f24727dv;
            if (ludVar != null) {
                ViewGroup.LayoutParams layoutParams = ludVar.getLayoutParams();
                layoutParams.width = -2;
                this.f24727dv.setLayoutParams(layoutParams);
            }
            RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.f24733lt.getLayoutParams();
            layoutParams2.height = this.xkz;
            this.f24733lt.setLayoutParams(layoutParams2);
            return;
        }
        this.wwx.setVisibility(8);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar2 = this.f24727dv;
        if (ludVar2 != null) {
            ViewGroup.LayoutParams layoutParams3 = ludVar2.getLayoutParams();
            layoutParams3.width = -1;
            this.f24727dv.setLayoutParams(layoutParams3);
        }
        RelativeLayout.LayoutParams layoutParams4 = (RelativeLayout.LayoutParams) this.f24733lt.getLayoutParams();
        layoutParams4.height = this.xkz / 2;
        this.f24733lt.setLayoutParams(layoutParams4);
    }

    public void ycx(String str) {
        this.wwx.setText(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(int i5) {
        ImageView imageView = this.f24732jw;
        if (imageView != null) {
            imageView.setVisibility(i5);
        }
        ImageView imageView2 = this.f24729ea;
        if (imageView2 != null) {
            imageView2.setVisibility(i5);
        }
        ImageView imageView3 = this.f24734ok;
        if (imageView3 != null) {
            imageView3.setVisibility(i5);
        }
        ImageView imageView4 = this.f24735ry;
        if (imageView4 != null) {
            imageView4.setVisibility(i5);
        }
    }

    public void ycx(WebView webView, lt.ycx ycxVar) {
        this.wie = ycxVar;
        try {
            if (this.f24729ea != null) {
                if (webView.canGoBack()) {
                    this.f24729ea.setClickable(true);
                    this.f24729ea.clearColorFilter();
                } else {
                    this.f24729ea.setClickable(false);
                    this.f24729ea.setColorFilter(Color.parseColor("#A8FFFFFF"), PorterDuff.Mode.ADD);
                }
            }
            if (this.f24734ok != null) {
                if (webView.canGoForward()) {
                    this.f24734ok.setClickable(true);
                    this.f24734ok.clearColorFilter();
                } else {
                    this.f24734ok.setClickable(false);
                    this.f24734ok.setColorFilter(Color.parseColor("#A8FFFFFF"), PorterDuff.Mode.ADD);
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "b9oZnBewbOmFXeRJlR2lBVrgLJIGrg==", "WOYolgibZuWBSdx8ghWGJ0n5LIcH", 536);
        }
    }
}
