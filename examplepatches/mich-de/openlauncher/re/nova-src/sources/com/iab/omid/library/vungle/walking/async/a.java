package com.iab.omid.library.vungle.walking.async;

import com.iab.omid.library.vungle.walking.async.b;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class a extends b {

    /* renamed from: c, reason: collision with root package name */
    public final HashSet<String> f35294c;

    /* renamed from: d, reason: collision with root package name */
    public final JSONObject f35295d;

    /* renamed from: e, reason: collision with root package name */
    public final long f35296e;

    public a(b.InterfaceC0131b interfaceC0131b, HashSet<String> hashSet, JSONObject jSONObject, long j11) {
        super(interfaceC0131b);
        this.f35294c = new HashSet<>(hashSet);
        this.f35295d = jSONObject;
        this.f35296e = j11;
    }
}
