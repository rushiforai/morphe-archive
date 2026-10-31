package com.fyber.inneractive.sdk.measurement;

import android.text.TextUtils;
import b.c0;
import com.fyber.inneractive.sdk.model.vast.x;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes3.dex */
public final class h implements com.fyber.inneractive.sdk.response.i {

    /* renamed from: a, reason: collision with root package name */
    public URL f28519a;

    /* renamed from: b, reason: collision with root package name */
    public String f28520b;

    /* renamed from: d, reason: collision with root package name */
    public String f28522d;

    /* renamed from: e, reason: collision with root package name */
    public String f28523e;

    /* renamed from: f, reason: collision with root package name */
    public String f28524f;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f28521c = new HashMap();

    /* renamed from: g, reason: collision with root package name */
    public boolean f28525g = false;

    public final void a(x xVar, String str) {
        List arrayList = (List) this.f28521c.get(xVar);
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.f28521c.put(xVar, arrayList);
        }
        if (TextUtils.isEmpty(str)) {
            return;
        }
        arrayList.add(str);
    }

    public final boolean b() {
        if (!this.f28525g || this.f28519a == null) {
            return false;
        }
        String str = this.f28520b;
        if (str != null) {
            return !TextUtils.isEmpty(str) && this.f28520b.equalsIgnoreCase("omid");
        }
        return true;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Verification{mJavaScriptResource=");
        sb2.append(this.f28519a);
        sb2.append(", mTrackingEvents=");
        sb2.append(this.f28521c);
        sb2.append(", mVerificationParameters='");
        sb2.append(this.f28522d);
        sb2.append("', mVendor='");
        return c0.q(sb2, this.f28523e, "'}");
    }

    @Override // com.fyber.inneractive.sdk.response.i
    public final List a(x xVar) {
        HashMap map;
        if (xVar == null || (map = this.f28521c) == null) {
            return null;
        }
        return (List) map.get(xVar);
    }

    public final String a() {
        if (!this.f28525g) {
            return "JavaScriptResource = ";
        }
        if (TextUtils.isEmpty(this.f28520b)) {
            return "apiFramework = ";
        }
        if (!this.f28520b.equalsIgnoreCase("omid")) {
            return c0.k("apiFramework = ", this.f28520b);
        }
        return c0.k("JavaScriptResource_url = ", TextUtils.isEmpty(this.f28524f) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : this.f28524f);
    }
}
