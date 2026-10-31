package com.fyber.inneractive.sdk.web;

import android.webkit.WebResourceRequest;
import java.util.Collections;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class d1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f31276a;

    /* renamed from: b, reason: collision with root package name */
    public final String f31277b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f31278c;

    public d1(WebResourceRequest webResourceRequest) {
        this.f31276a = webResourceRequest.getUrl().toString();
        this.f31277b = webResourceRequest.getMethod();
        this.f31278c = new HashMap(webResourceRequest.getRequestHeaders() == null ? Collections.EMPTY_MAP : webResourceRequest.getRequestHeaders());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || d1.class != obj.getClass()) {
            return false;
        }
        d1 d1Var = (d1) obj;
        if (this.f31276a.equals(d1Var.f31276a) && this.f31277b.equals(d1Var.f31277b)) {
            return this.f31278c.equals(d1Var.f31278c);
        }
        return false;
    }

    public final int hashCode() {
        return this.f31278c.hashCode() + b.c0.e(this.f31276a.hashCode() * 31, 31, this.f31277b);
    }
}
