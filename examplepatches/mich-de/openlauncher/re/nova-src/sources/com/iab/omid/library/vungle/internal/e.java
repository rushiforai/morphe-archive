package com.iab.omid.library.vungle.internal;

import android.view.View;
import com.iab.omid.library.vungle.adsession.FriendlyObstructionPurpose;

/* loaded from: classes3.dex */
public class e {

    /* renamed from: a, reason: collision with root package name */
    private final com.iab.omid.library.vungle.weakreference.a f35211a;

    /* renamed from: b, reason: collision with root package name */
    private final String f35212b;

    /* renamed from: c, reason: collision with root package name */
    private final FriendlyObstructionPurpose f35213c;

    /* renamed from: d, reason: collision with root package name */
    private final String f35214d;

    public e(View view, FriendlyObstructionPurpose friendlyObstructionPurpose, String str) {
        this.f35211a = new com.iab.omid.library.vungle.weakreference.a(view);
        this.f35212b = view.getClass().getCanonicalName();
        this.f35213c = friendlyObstructionPurpose;
        this.f35214d = str;
    }

    public String a() {
        return this.f35214d;
    }

    public FriendlyObstructionPurpose b() {
        return this.f35213c;
    }

    public com.iab.omid.library.vungle.weakreference.a c() {
        return this.f35211a;
    }

    public String d() {
        return this.f35212b;
    }
}
