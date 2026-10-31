package com.iab.omid.library.vungle.walking;

import com.iab.omid.library.vungle.walking.async.b;
import com.iab.omid.library.vungle.walking.async.d;
import com.iab.omid.library.vungle.walking.async.e;
import com.iab.omid.library.vungle.walking.async.f;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class b implements b.InterfaceC0131b {

    /* renamed from: a, reason: collision with root package name */
    private JSONObject f35303a;

    /* renamed from: b, reason: collision with root package name */
    private final com.iab.omid.library.vungle.walking.async.c f35304b;

    public b(com.iab.omid.library.vungle.walking.async.c cVar) {
        this.f35304b = cVar;
    }

    @Override // com.iab.omid.library.vungle.walking.async.b.InterfaceC0131b
    public JSONObject a() {
        return this.f35303a;
    }

    public void b() {
        this.f35304b.b(new d(this));
    }

    @Override // com.iab.omid.library.vungle.walking.async.b.InterfaceC0131b
    public void a(JSONObject jSONObject) {
        this.f35303a = jSONObject;
    }

    public void b(JSONObject jSONObject, HashSet<String> hashSet, long j11) {
        this.f35304b.b(new f(this, hashSet, jSONObject, j11));
    }

    public void a(JSONObject jSONObject, HashSet<String> hashSet, long j11) {
        this.f35304b.b(new e(this, hashSet, jSONObject, j11));
    }
}
