package com.iab.omid.library.bytedance2.walking;

import com.iab.omid.library.bytedance2.walking.async.b;
import com.iab.omid.library.bytedance2.walking.async.d;
import com.iab.omid.library.bytedance2.walking.async.e;
import com.iab.omid.library.bytedance2.walking.async.f;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class b implements b.InterfaceC0125b {

    /* renamed from: a, reason: collision with root package name */
    private JSONObject f35138a;

    /* renamed from: b, reason: collision with root package name */
    private final com.iab.omid.library.bytedance2.walking.async.c f35139b;

    public b(com.iab.omid.library.bytedance2.walking.async.c cVar) {
        this.f35139b = cVar;
    }

    @Override // com.iab.omid.library.bytedance2.walking.async.b.InterfaceC0125b
    public JSONObject a() {
        return this.f35138a;
    }

    public void b() {
        this.f35139b.b(new d(this));
    }

    @Override // com.iab.omid.library.bytedance2.walking.async.b.InterfaceC0125b
    public void a(JSONObject jSONObject) {
        this.f35138a = jSONObject;
    }

    public void b(JSONObject jSONObject, HashSet<String> hashSet, long j11) {
        this.f35139b.b(new f(this, hashSet, jSONObject, j11));
    }

    public void a(JSONObject jSONObject, HashSet<String> hashSet, long j11) {
        this.f35139b.b(new e(this, hashSet, jSONObject, j11));
    }
}
