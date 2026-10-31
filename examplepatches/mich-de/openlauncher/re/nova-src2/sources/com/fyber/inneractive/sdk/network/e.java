package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public final class e implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f28703a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ JSONArray f28704b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f28705c;

    public e(String str, JSONArray jSONArray, long j11) {
        this.f28703a = str;
        this.f28704b = jSONArray;
        this.f28705c = j11;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        IAlog.a("Event Request: Hitting URL finished: %s, body: %s", this.f28703a, this.f28704b);
        if (exc == null) {
            IAlog.a("Event Request: Hitting URL response code: %s", str);
        } else {
            IAlog.a("Event Request: Hitting URL failed: %s", exc);
        }
        IAlog.a("Event Request: Url hit took %s millis", Long.valueOf(System.currentTimeMillis() - this.f28705c));
    }
}
