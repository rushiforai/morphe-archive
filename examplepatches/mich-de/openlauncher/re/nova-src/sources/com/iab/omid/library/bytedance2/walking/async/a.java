package com.iab.omid.library.bytedance2.walking.async;

import com.iab.omid.library.bytedance2.walking.async.b;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class a extends b {

    /* renamed from: c, reason: collision with root package name */
    protected final HashSet<String> f35129c;

    /* renamed from: d, reason: collision with root package name */
    protected final JSONObject f35130d;

    /* renamed from: e, reason: collision with root package name */
    protected final long f35131e;

    public a(b.InterfaceC0125b interfaceC0125b, HashSet<String> hashSet, JSONObject jSONObject, long j11) {
        super(interfaceC0125b);
        this.f35129c = new HashSet<>(hashSet);
        this.f35130d = jSONObject;
        this.f35131e = j11;
    }
}
