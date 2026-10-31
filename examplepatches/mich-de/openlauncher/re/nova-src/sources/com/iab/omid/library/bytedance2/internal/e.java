package com.iab.omid.library.bytedance2.internal;

import android.view.View;
import com.iab.omid.library.bytedance2.adsession.FriendlyObstructionPurpose;

/* loaded from: classes3.dex */
public class e {

    /* renamed from: a, reason: collision with root package name */
    private final com.iab.omid.library.bytedance2.weakreference.a f35057a;

    /* renamed from: b, reason: collision with root package name */
    private final String f35058b;

    /* renamed from: c, reason: collision with root package name */
    private final FriendlyObstructionPurpose f35059c;

    /* renamed from: d, reason: collision with root package name */
    private final String f35060d;

    public e(View view, FriendlyObstructionPurpose friendlyObstructionPurpose, String str) {
        this.f35057a = new com.iab.omid.library.bytedance2.weakreference.a(view);
        this.f35058b = view.getClass().getCanonicalName();
        this.f35059c = friendlyObstructionPurpose;
        this.f35060d = str;
    }

    public String a() {
        return this.f35060d;
    }

    public FriendlyObstructionPurpose b() {
        return this.f35059c;
    }

    public com.iab.omid.library.bytedance2.weakreference.a c() {
        return this.f35057a;
    }

    public String d() {
        return this.f35058b;
    }
}
