package com.fyber.inneractive.sdk.network;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Base64;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.IOException;
import java.util.Map;

/* loaded from: classes3.dex */
public final class u0 extends v0 {

    /* renamed from: t, reason: collision with root package name */
    public static final String f28805t = IAlog.a(u0.class);

    public u0(com.fyber.inneractive.sdk.flow.nativead.t tVar, Context context, com.fyber.inneractive.sdk.cache.e eVar) {
        super(tVar, context, eVar);
    }

    @Override // com.fyber.inneractive.sdk.network.v0, com.fyber.inneractive.sdk.network.t0
    public final void a(o0 o0Var, String str, String str2) throws IOException {
        d0 d0Var = this.f28816s;
        if (d0Var == null) {
            IAlog.f("%s: failed to cache file: no cache helper", f28805t);
            return;
        }
        d0Var.b(str2);
        if (o0Var == null || TextUtils.isEmpty(o0Var.f28758b) || TextUtils.isEmpty(str)) {
            IAlog.f("%s: failed to cache file: empty result", f28805t);
            return;
        }
        boolean zA = this.f28816s.a(str, o0Var.f28758b);
        Uri uri = (Uri) this.f28816s.a().f27675a;
        o0Var.f28757a = uri;
        if (zA) {
            this.f28815r.a(uri);
        } else {
            IAlog.b("%s: Failed to cache file", f28805t);
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final void c() {
        this.f28777a = true;
    }

    @Override // com.fyber.inneractive.sdk.network.v0, com.fyber.inneractive.sdk.network.t0
    public final a i() {
        e0 e0Var = new e0(this.f28814q, this.f28815r, com.fyber.inneractive.sdk.nativead.b.f28680f.f28682b);
        this.f28816s = e0Var;
        com.fyber.inneractive.sdk.cache.n nVarA = e0Var.a();
        String str = nVarA.f27676b;
        Uri uri = (Uri) nVarA.f27675a;
        this.f28815r.c();
        return new a(uri, str);
    }

    @Override // com.fyber.inneractive.sdk.network.v0, com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) throws n0 {
        o0 o0Var = new o0();
        try {
            o0Var.f28758b = new String(Base64.encode(com.fyber.inneractive.sdk.util.v.a(lVar.f28735c), 0));
            return o0Var;
        } catch (Exception e3) {
            IAlog.b("%s : failed parse cacheable network request", f28805t, e3);
            throw new n0(e3);
        }
    }
}
