package com.fyber.inneractive.sdk.activities;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import b.c0;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdSpotManager;
import com.fyber.inneractive.sdk.flow.x;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h0;
import com.fyber.inneractive.sdk.util.o0;
import com.fyber.inneractive.sdk.util.v;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class InneractiveInternalBrowserActivity extends InneractiveBaseActivity {
    public static final String EXTRA_KEY_SPOT_ID = "spotId";
    public static final String URL_EXTRA = "extra_url";

    /* renamed from: j, reason: collision with root package name */
    public static String f27571j;

    /* renamed from: k, reason: collision with root package name */
    public static InternalBrowserListener f27572k;

    /* renamed from: b, reason: collision with root package name */
    public x f27573b;

    /* renamed from: c, reason: collision with root package name */
    public String f27574c;

    /* renamed from: d, reason: collision with root package name */
    public LinearLayout f27575d;

    /* renamed from: e, reason: collision with root package name */
    public WebView f27576e;

    /* renamed from: f, reason: collision with root package name */
    public ImageButton f27577f;

    /* renamed from: g, reason: collision with root package name */
    public ImageButton f27578g;

    /* renamed from: h, reason: collision with root package name */
    public ImageButton f27579h;

    /* renamed from: i, reason: collision with root package name */
    public ImageButton f27580i;

    public interface InternalBrowserListener {
        void onApplicationInBackground();

        void onInternalBrowserDismissed();
    }

    public static void a(InneractiveInternalBrowserActivity inneractiveInternalBrowserActivity, com.fyber.inneractive.sdk.click.b bVar) throws JSONException {
        r rVar;
        x xVar = inneractiveInternalBrowserActivity.f27573b;
        InneractiveAdRequest inneractiveAdRequest = xVar != null ? xVar.f28437a : null;
        com.fyber.inneractive.sdk.response.e eVar = xVar != null ? xVar.f28438b : null;
        JSONArray jSONArrayB = (xVar == null || (rVar = xVar.f28439c) == null) ? null : rVar.b();
        u uVar = u.FYBER_SUCCESS_CLICK;
        w wVar = new w(eVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        JSONObject jSONObject = new JSONObject();
        long j11 = bVar.f27701e;
        if (j11 != 0) {
            Object objValueOf = Long.valueOf(j11);
            try {
                jSONObject.put("time_passed", objValueOf);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", "time_passed", objValueOf);
            }
        }
        JSONArray jSONArray = new JSONArray();
        Iterator it = bVar.f27702f.iterator();
        while (it.hasNext()) {
            com.fyber.inneractive.sdk.click.j jVar = (com.fyber.inneractive.sdk.click.j) it.next();
            JSONObject jSONObject2 = new JSONObject();
            try {
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, jVar.f27719a);
                jSONObject2.put("success", jVar.f27720b);
                jSONObject2.put("opened_by", jVar.f27721c);
                jSONObject2.put("reason", jVar.f27722d);
            } catch (Exception unused2) {
            }
            jSONArray.put(jSONObject2);
        }
        try {
            jSONObject.put("urls", jSONArray);
        } catch (Exception unused3) {
            IAlog.f("Got exception adding param to json object: %s, %s", "urls", jSONArray);
        }
        Object obj = com.fyber.inneractive.sdk.util.g.VIDEO_CTA;
        try {
            jSONObject.put("origin", obj);
        } catch (Exception unused4) {
            IAlog.f("Got exception adding param to json object: %s, %s", "origin", obj);
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }

    public static void disableWebviewZoomControls(WebView webView) {
        webView.getSettings().setSupportZoom(true);
        webView.getSettings().setBuiltInZoomControls(true);
        new o0(webView).run();
    }

    public static void setHtmlExtra(String str) {
        f27571j = str;
    }

    public static void setInternalBrowserListener(InternalBrowserListener internalBrowserListener) {
        f27572k = internalBrowserListener;
    }

    @Override // android.app.Activity
    public void finish() {
        InternalBrowserListener internalBrowserListener = f27572k;
        super.finish();
        if (internalBrowserListener != null) {
            internalBrowserListener.onInternalBrowserDismissed();
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        finish();
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveBaseActivity, android.app.Activity
    public void onCreate(Bundle bundle) throws UnsupportedEncodingException {
        InneractiveAdSpot spot;
        getWindow().requestFeature(2);
        getWindow().setFeatureInt(2, -1);
        getWindow().addFlags(1024);
        super.onCreate(bundle);
        try {
            setContentView(a());
            if (getActionBar() != null) {
                getActionBar().hide();
            }
            String stringExtra = getIntent().getStringExtra("spotId");
            this.f27574c = stringExtra;
            if (!TextUtils.isEmpty(stringExtra) && (spot = InneractiveAdSpotManager.get().getSpot(this.f27574c)) != null) {
                this.f27573b = spot.getAdContent();
            }
            Intent intent = getIntent();
            WebSettings settings = this.f27576e.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            settings.setSupportZoom(true);
            settings.setBuiltInZoomControls(true);
            settings.setUseWideViewPort(true);
            settings.setLoadWithOverviewMode(true);
            disableWebviewZoomControls(this.f27576e);
            this.f27576e.setWebChromeClient(new f(this));
            String stringExtra2 = intent.getStringExtra("extra_url");
            if (!TextUtils.isEmpty(f27571j)) {
                String strQ = c0.q(new StringBuilder(), f27571j, "<title>DigitalTurbine Internal Browser</title>");
                f27571j = strQ;
                this.f27576e.loadDataWithBaseURL(stringExtra2, strQ, "text/html", "UTF-8", null);
            } else if (TextUtils.isEmpty(stringExtra2)) {
                IAlog.f("Empty url", new Object[0]);
                finish();
            } else if (!h0.d(stringExtra2)) {
                this.f27576e.loadUrl(stringExtra2);
            } else if (h0.c(stringExtra2)) {
                try {
                    stringExtra2 = URLDecoder.decode(stringExtra2, "utf-8");
                    this.f27576e.loadUrl(stringExtra2);
                } catch (Exception unused) {
                    IAlog.f("Failed to open Url: %s", stringExtra2);
                    finish();
                }
            } else {
                Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse(stringExtra2));
                intent2.addFlags(268435456);
                try {
                    startActivity(intent2);
                    InternalBrowserListener internalBrowserListener = f27572k;
                    if (internalBrowserListener != null) {
                        internalBrowserListener.onApplicationInBackground();
                    }
                } catch (ActivityNotFoundException unused2) {
                    IAlog.f("Failed to start activity for %s. Please ensure that your phone can handle this intent.", stringExtra2);
                }
                finish();
            }
            this.f27577f.setBackgroundColor(0);
            this.f27577f.setOnClickListener(new j(this));
            this.f27577f.setContentDescription("IABackButton");
            this.f27578g.setBackgroundColor(0);
            this.f27578g.setOnClickListener(new k(this));
            this.f27578g.setContentDescription("IAForwardButton");
            this.f27579h.setBackgroundColor(0);
            this.f27579h.setOnClickListener(new l(this));
            this.f27579h.setContentDescription("IARefreshButton");
            this.f27580i.setBackgroundColor(0);
            this.f27580i.setOnClickListener(new m(this));
            this.f27580i.setContentDescription("IACloseButton");
        } catch (Exception unused3) {
            finish();
        }
    }

    @Override // com.fyber.inneractive.sdk.activities.InneractiveBaseActivity, android.app.Activity
    public void onDestroy() {
        LinearLayout linearLayout = this.f27575d;
        if (linearLayout != null) {
            linearLayout.removeAllViews();
        }
        WebView webView = this.f27576e;
        if (webView != null) {
            webView.removeAllViews();
            v.a(this.f27576e);
            this.f27576e.destroy();
            this.f27576e = null;
        }
        super.onDestroy();
        setHtmlExtra(null);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        setVisible(false);
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
    }

    public final LinearLayout a() {
        this.f27575d = new LinearLayout(this);
        this.f27575d.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        this.f27575d.setOrientation(1);
        this.f27575d.setContentDescription("IAInternalBrowserView");
        RelativeLayout relativeLayout = new RelativeLayout(this);
        relativeLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        this.f27575d.addView(relativeLayout);
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setId(1);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, com.fyber.inneractive.sdk.util.o.b(getResources().getInteger(R.integer.ia_ib_toolbar_height_dp)));
        layoutParams.addRule(12);
        linearLayout.setLayoutParams(layoutParams);
        com.fyber.inneractive.sdk.util.o.a(linearLayout, com.fyber.inneractive.sdk.util.o.d(R.drawable.ia_ib_background));
        relativeLayout.addView(linearLayout);
        this.f27577f = a(com.fyber.inneractive.sdk.util.o.d(R.drawable.ia_ib_left_arrow));
        this.f27578g = a(com.fyber.inneractive.sdk.util.o.d(R.drawable.ia_ib_right_arrow));
        this.f27579h = a(com.fyber.inneractive.sdk.util.o.d(R.drawable.ia_ib_refresh));
        this.f27580i = a(com.fyber.inneractive.sdk.util.o.d(R.drawable.ia_ib_close));
        linearLayout.addView(this.f27577f);
        linearLayout.addView(this.f27578g);
        linearLayout.addView(this.f27579h);
        linearLayout.addView(this.f27580i);
        WebView webView = new WebView(IAConfigManager.Q.f27762v.a());
        this.f27576e = webView;
        webView.setWebViewClient(new g(this));
        this.f27576e.setId(R.id.ia_inneractive_webview_internal_browser);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams2.addRule(2, 1);
        this.f27576e.setLayoutParams(layoutParams2);
        relativeLayout.addView(this.f27576e);
        return this.f27575d;
    }

    public final ImageButton a(Drawable drawable) {
        ImageButton imageButton = new ImageButton(this);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(com.fyber.inneractive.sdk.util.o.b(getResources().getInteger(R.integer.ia_ib_button_size_dp)), com.fyber.inneractive.sdk.util.o.b(getResources().getInteger(R.integer.ia_ib_button_size_dp)), 1.0f);
        layoutParams.gravity = 16;
        imageButton.setLayoutParams(layoutParams);
        imageButton.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageButton.setImageDrawable(drawable);
        return imageButton;
    }
}
