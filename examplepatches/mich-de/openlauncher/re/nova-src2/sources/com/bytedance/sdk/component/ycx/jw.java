package com.bytedance.sdk.component.ycx;

import android.content.Context;
import android.text.TextUtils;
import android.webkit.WebView;
import java.util.LinkedHashSet;
import java.util.Set;

/* loaded from: classes2.dex */
public class jw {

    /* renamed from: dj, reason: collision with root package name */
    ul f24122dj;
    ea fby;

    /* renamed from: jw, reason: collision with root package name */
    ok f24125jw;

    /* renamed from: lt, reason: collision with root package name */
    boolean f24126lt;
    Context lud;

    /* renamed from: ry, reason: collision with root package name */
    boolean f24128ry;

    /* renamed from: ul, reason: collision with root package name */
    boolean f24129ul;
    WebView ycx;

    /* renamed from: zb, reason: collision with root package name */
    ycx f24130zb;
    String sya = "IESJSBridge";

    /* renamed from: jc, reason: collision with root package name */
    String f24124jc = "host";

    /* renamed from: ea, reason: collision with root package name */
    final Set<String> f24123ea = new LinkedHashSet();

    /* renamed from: ok, reason: collision with root package name */
    final Set<String> f24127ok = new LinkedHashSet();

    public jw(WebView webView) {
        this.ycx = webView;
    }

    public jw ycx(ycx ycxVar) {
        this.f24130zb = ycxVar;
        return this;
    }

    public jw zb(boolean z11) {
        this.f24129ul = z11;
        return this;
    }

    private void zb() {
        if ((this.ycx == null && !this.f24128ry && this.f24130zb == null) || ((TextUtils.isEmpty(this.sya) && this.ycx != null) || this.f24122dj == null)) {
            throw new IllegalArgumentException("Requested arguments aren't set properly when building JsBridge.");
        }
    }

    public jw ycx(String str) {
        this.sya = str;
        return this;
    }

    public jw ycx(jc jcVar) {
        this.f24122dj = ul.ycx(jcVar);
        return this;
    }

    public jw ycx(boolean z11) {
        this.f24126lt = z11;
        return this;
    }

    public syc ycx() {
        zb();
        return new syc(this);
    }

    public jw() {
    }
}
