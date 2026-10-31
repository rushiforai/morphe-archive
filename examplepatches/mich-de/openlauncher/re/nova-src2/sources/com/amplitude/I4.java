package com.amplitude;

import android.net.Uri;
import android.webkit.WebView;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import org.chromium.support_lib_boundary.WebMessagePortBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;

/* loaded from: classes2.dex */
public final class I4 extends AbstractC0489o0 {

    /* renamed from: g, reason: collision with root package name */
    public final String f20275g;

    /* renamed from: h, reason: collision with root package name */
    public final z4 f20276h;

    /* renamed from: i, reason: collision with root package name */
    public final String f20277i;

    /* renamed from: j, reason: collision with root package name */
    public final c80.a f20278j;

    /* renamed from: k, reason: collision with root package name */
    public String f20279k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f20280l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public I4(int i5, String injectScript, String sessionToken, K4 k42, K3 k32, z4 webMessageManager, t70.a2 mainDispatcher, t70.c0 workerDispatcher) {
        super(i5, k42, k32, mainDispatcher, workerDispatcher);
        Intrinsics.g(injectScript, "injectScript");
        Intrinsics.g(sessionToken, "sessionToken");
        Intrinsics.g(webMessageManager, "webMessageManager");
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        Intrinsics.g(workerDispatcher, "workerDispatcher");
        this.f20275g = injectScript;
        this.f20276h = webMessageManager;
        this.f20277i = "activate_recording_channel:".concat(sessionToken);
        this.f20278j = new c80.d();
    }

    @Override // com.amplitude.AbstractC0489o0
    public final void a() {
        this.f20702f = false;
        t70.m0.j(this.f20700d);
        C0515t0.a(this.f20699c);
        K3 k32 = this.f20698b;
        if (k32 != null) {
            k32.a(new A4(this));
        }
        t70.m0.t(this, null, null, new B4(this, null), 3);
    }

    @Override // com.amplitude.AbstractC0489o0
    public final String b() {
        return "Webview";
    }

    @Override // com.amplitude.AbstractC0489o0
    public final boolean c() {
        z4 z4Var = this.f20276h;
        return (z4Var.f20837a == null || z4Var.f20838b == null) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0205  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0177  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(WebView webView, ContinuationImpl continuationImpl) {
        G4 g42;
        String targetUrl;
        WebView webView2;
        I4 i42;
        I4 i43;
        I4 i44;
        I4 i45;
        I4 i46;
        WebView webView3;
        z4 z4Var;
        z4 z4Var2;
        String handshakeMessage;
        m7.k kVar;
        m7.k kVar2;
        Uri uriBuild;
        String scheme;
        String authority;
        String str;
        boolean z11;
        if (continuationImpl instanceof G4) {
            g42 = (G4) continuationImpl;
            int i5 = g42.f20256h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g42.f20256h = i5 - Integer.MIN_VALUE;
            } else {
                g42 = new G4(this, continuationImpl);
            }
        }
        Object objA = g42.f20254f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g42.f20256h;
        if (i11 == 0) {
            ResultKt.b(objA);
            this.f20276h.getClass();
            if (WebViewFeature.a(WebViewFeature.CREATE_WEB_MESSAGE_CHANNEL) && WebViewFeature.a(WebViewFeature.POST_WEB_MESSAGE)) {
                if (this.f20702f) {
                    this.f20702f = false;
                    this.f20280l = false;
                    z4 z4Var3 = this.f20276h;
                    m7.k kVar3 = z4Var3.f20837a;
                    if (kVar3 != null) {
                        ((n7.r) kVar3).b().close();
                    }
                    z4Var3.f20837a = null;
                    z4Var3.f20838b = null;
                    z4Var3.f20839c = null;
                }
                if (!webView.getSettings().getJavaScriptEnabled()) {
                    webView.getSettings().setJavaScriptEnabled(true);
                }
                targetUrl = webView.getUrl();
                if (targetUrl != null && !r70.k.U0(targetUrl) && !targetUrl.equals("about:blank")) {
                    t70.m0.k(g42.getContext());
                    if (!targetUrl.equals(this.f20279k)) {
                        this.f20280l = false;
                        z4 z4Var4 = this.f20276h;
                        m7.k kVar4 = z4Var4.f20837a;
                        if (kVar4 != null) {
                            ((n7.r) kVar4).b().close();
                        }
                        z4Var4.f20837a = null;
                        z4Var4.f20838b = null;
                        z4Var4.f20839c = null;
                        g42.f20249a = this;
                        g42.f20250b = webView;
                        g42.f20251c = targetUrl;
                        g42.f20252d = this;
                        g42.f20256h = 1;
                        objA = r4.a(webView, "window.location.href", g42);
                        if (objA != coroutineSingletons) {
                            i43 = this;
                            webView2 = webView;
                            i44 = i43;
                        }
                        return coroutineSingletons;
                    }
                    webView2 = webView;
                    i42 = this;
                    t70.m0.k(g42.getContext());
                    if (Intrinsics.b(i42.f20279k, targetUrl) && !i42.f20280l) {
                        String str2 = i42.f20275g;
                        g42.f20249a = i42;
                        g42.f20250b = webView2;
                        g42.f20251c = targetUrl;
                        g42.f20252d = i42;
                        g42.f20253e = i42;
                        g42.f20256h = 2;
                        objA = r4.a(webView2, str2, g42);
                        if (objA != coroutineSingletons) {
                            i45 = i42;
                            i46 = i45;
                            webView3 = webView2;
                            str = (String) objA;
                            i42.getClass();
                            if (Intrinsics.b(str, InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
                            }
                            i45.f20280l = z11;
                            webView2 = webView3;
                            i42 = i46;
                        }
                        return coroutineSingletons;
                    }
                    t70.m0.k(g42.getContext());
                    if (Intrinsics.b(i42.f20279k, targetUrl)) {
                        z4Var = i42.f20276h;
                        if (z4Var.f20837a != null) {
                            Intrinsics.g(webView2, "webView");
                            if (WebViewFeature.a(WebViewFeature.CREATE_WEB_MESSAGE_CHANNEL)) {
                                m7.k[] kVarArrCreateWebMessageChannel = WebViewCompat.createWebMessageChannel(webView2);
                                z4Var.f20837a = kVarArrCreateWebMessageChannel[0];
                                z4Var.f20838b = kVarArrCreateWebMessageChannel[1];
                            }
                            z4 z4Var5 = i42.f20276h;
                            H4 h42 = new H4(i42);
                            z4Var5.getClass();
                            z4Var5.f20839c = h42;
                            C0515t0.a(i42.f20699c);
                            z4Var2 = i42.f20276h;
                            handshakeMessage = i42.f20277i;
                            z4Var2.getClass();
                            Intrinsics.g(targetUrl, "targetUrl");
                            Intrinsics.g(handshakeMessage, "handshakeMessage");
                            kVar = z4Var2.f20837a;
                            if (kVar != null) {
                                y4 y4Var = new y4(z4Var2);
                                n7.r rVar = (n7.r) kVar;
                                if (!n7.w.f77946g.b()) {
                                }
                                m7.j jVar = new m7.j(handshakeMessage, new m7.k[]{kVar2});
                                Uri uri = Uri.parse(targetUrl);
                                Uri.Builder builder = new Uri.Builder();
                                scheme = uri.getScheme();
                                if (scheme == null) {
                                }
                                Uri.Builder builderScheme = builder.scheme(scheme);
                                authority = uri.getAuthority();
                                if (authority == null) {
                                }
                                uriBuild = builderScheme.authority(authority).build();
                                Intrinsics.d(uriBuild);
                                WebViewCompat.postWebMessage(webView2, jVar, uriBuild);
                            }
                        }
                    }
                    return Unit.f71706a;
                }
                return Unit.f71706a;
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i42 = g42.f20253e;
            i45 = g42.f20252d;
            targetUrl = g42.f20251c;
            webView3 = g42.f20250b;
            i46 = g42.f20249a;
            ResultKt.b(objA);
            str = (String) objA;
            i42.getClass();
            if (Intrinsics.b(str, InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
                Intrinsics.b(str, "false");
                z11 = false;
            } else {
                z11 = true;
            }
            i45.f20280l = z11;
            webView2 = webView3;
            i42 = i46;
            t70.m0.k(g42.getContext());
            if (Intrinsics.b(i42.f20279k, targetUrl) && i42.f20280l) {
                z4Var = i42.f20276h;
                if (z4Var.f20837a != null || z4Var.f20838b == null) {
                    Intrinsics.g(webView2, "webView");
                    if (WebViewFeature.a(WebViewFeature.CREATE_WEB_MESSAGE_CHANNEL) && WebViewFeature.a(WebViewFeature.POST_WEB_MESSAGE) && (z4Var.f20837a == null || z4Var.f20838b == null)) {
                        try {
                            m7.k[] kVarArrCreateWebMessageChannel2 = WebViewCompat.createWebMessageChannel(webView2);
                            z4Var.f20837a = kVarArrCreateWebMessageChannel2[0];
                            z4Var.f20838b = kVarArrCreateWebMessageChannel2[1];
                        } catch (Exception unused) {
                        }
                    }
                    z4 z4Var52 = i42.f20276h;
                    H4 h422 = new H4(i42);
                    z4Var52.getClass();
                    z4Var52.f20839c = h422;
                    C0515t0.a(i42.f20699c);
                    z4Var2 = i42.f20276h;
                    handshakeMessage = i42.f20277i;
                    z4Var2.getClass();
                    Intrinsics.g(targetUrl, "targetUrl");
                    Intrinsics.g(handshakeMessage, "handshakeMessage");
                    kVar = z4Var2.f20837a;
                    if (kVar != null && (kVar2 = z4Var2.f20838b) != null) {
                        y4 y4Var2 = new y4(z4Var2);
                        n7.r rVar2 = (n7.r) kVar;
                        if (!n7.w.f77946g.b()) {
                            if (rVar2.f77935b == null) {
                                rVar2.f77935b = (WebMessagePortBoundaryInterface) u90.b.i(WebMessagePortBoundaryInterface.class, ((WebkitToCompatConverterBoundaryInterface) n7.x.f77964a.f77914b).convertWebMessagePort(rVar2.f77934a));
                            }
                            rVar2.f77935b.setWebMessageCallback(new u90.a(new n7.d(y4Var2, 3)));
                        } else {
                            rVar2.b().setWebMessageCallback(new n7.q(y4Var2));
                        }
                        m7.j jVar2 = new m7.j(handshakeMessage, new m7.k[]{kVar2});
                        try {
                            Uri uri2 = Uri.parse(targetUrl);
                            Uri.Builder builder2 = new Uri.Builder();
                            scheme = uri2.getScheme();
                            if (scheme == null) {
                                scheme = "https";
                            }
                            Uri.Builder builderScheme2 = builder2.scheme(scheme);
                            authority = uri2.getAuthority();
                            if (authority == null) {
                                authority = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            uriBuild = builderScheme2.authority(authority).build();
                            Intrinsics.d(uriBuild);
                        } catch (Exception unused2) {
                            uriBuild = Uri.parse("*");
                            Intrinsics.d(uriBuild);
                        }
                        WebViewCompat.postWebMessage(webView2, jVar2, uriBuild);
                    }
                }
            }
            return Unit.f71706a;
        }
        i44 = g42.f20252d;
        targetUrl = g42.f20251c;
        webView2 = g42.f20250b;
        i43 = g42.f20249a;
        ResultKt.b(objA);
        String str3 = (String) objA;
        if (str3 != null) {
            i43.getClass();
            String strC1 = (str3.length() == 0 || str3.equalsIgnoreCase("about:blank")) ? null : r70.k.c1(str3);
            if (strC1 != null) {
                String str4 = strC1.equals(targetUrl) ? strC1 : null;
                if (str4 != null) {
                    i44.f20279k = str4;
                    i42 = i43;
                    t70.m0.k(g42.getContext());
                    if (Intrinsics.b(i42.f20279k, targetUrl)) {
                        String str22 = i42.f20275g;
                        g42.f20249a = i42;
                        g42.f20250b = webView2;
                        g42.f20251c = targetUrl;
                        g42.f20252d = i42;
                        g42.f20253e = i42;
                        g42.f20256h = 2;
                        objA = r4.a(webView2, str22, g42);
                        if (objA != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    }
                    t70.m0.k(g42.getContext());
                    if (Intrinsics.b(i42.f20279k, targetUrl)) {
                    }
                    return Unit.f71706a;
                }
            }
        }
        return Unit.f71706a;
    }
}
