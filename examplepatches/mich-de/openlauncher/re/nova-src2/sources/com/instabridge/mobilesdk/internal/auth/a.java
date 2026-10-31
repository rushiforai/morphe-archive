package com.instabridge.mobilesdk.internal.auth;

import c90.f;
import com.instabridge.mobilesdk.Brand;
import com.instabridge.mobilesdk.api.TokenProvider;
import com.instabridge.mobilesdk.internal.data.api.ApiClient;
import x80.m0;
import x80.x;
import x80.y;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35568a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f35569b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f35570c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Brand f35571d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f35572e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f35573f;

    public /* synthetic */ a(String str, String str2, Brand brand, String str3, Object obj, int i5) {
        this.f35568a = i5;
        this.f35569b = str;
        this.f35570c = str2;
        this.f35571d = brand;
        this.f35572e = str3;
        this.f35573f = obj;
    }

    @Override // x80.y
    public final m0 intercept(x xVar) {
        switch (this.f35568a) {
            case 0:
                return BrandSigninClient.build$lambda$2(this.f35569b, this.f35570c, this.f35571d, this.f35572e, (String) this.f35573f, (f) xVar);
            default:
                return ApiClient.build$lambda$2(this.f35569b, this.f35570c, this.f35571d, this.f35572e, (TokenProvider) this.f35573f, (f) xVar);
        }
    }
}
