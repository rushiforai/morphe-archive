package io.sentry;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import java.util.Arrays;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class e implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final Long f67196a;

    /* renamed from: b, reason: collision with root package name */
    public Date f67197b;

    /* renamed from: c, reason: collision with root package name */
    public String f67198c;

    /* renamed from: d, reason: collision with root package name */
    public String f67199d;

    /* renamed from: e, reason: collision with root package name */
    public ConcurrentHashMap f67200e;

    /* renamed from: f, reason: collision with root package name */
    public String f67201f;

    /* renamed from: g, reason: collision with root package name */
    public String f67202g;

    /* renamed from: h, reason: collision with root package name */
    public g3 f67203h;

    /* renamed from: i, reason: collision with root package name */
    public ConcurrentHashMap f67204i;

    public e(Date date) {
        this.f67200e = new ConcurrentHashMap();
        this.f67197b = date;
        this.f67196a = null;
    }

    public final Date a() {
        Date date = this.f67197b;
        if (date != null) {
            return (Date) date.clone();
        }
        Long l9 = this.f67196a;
        if (l9 == null) {
            throw new IllegalStateException("No timestamp set for breadcrumb");
        }
        Date dateW = android.support.v4.media.session.b.W(l9.longValue());
        this.f67197b = dateW;
        return dateW;
    }

    public final void b(Object obj, String str) {
        this.f67200e.put(str, obj);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && e.class == obj.getClass()) {
            e eVar = (e) obj;
            if (a().getTime() == eVar.a().getTime() && i30.j.z(this.f67198c, eVar.f67198c) && i30.j.z(this.f67199d, eVar.f67199d) && i30.j.z(this.f67201f, eVar.f67201f) && i30.j.z(this.f67202g, eVar.f67202g) && this.f67203h == eVar.f67203h) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67197b, this.f67198c, this.f67199d, this.f67201f, this.f67202g, this.f67203h});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("timestamp");
        e3Var.x(iLogger, a());
        if (this.f67198c != null) {
            e3Var.o(PglCryptUtils.KEY_MESSAGE);
            e3Var.A(this.f67198c);
        }
        if (this.f67199d != null) {
            e3Var.o(TTConst.TRACK_TYPE);
            e3Var.A(this.f67199d);
        }
        e3Var.o("data");
        e3Var.x(iLogger, this.f67200e);
        if (this.f67201f != null) {
            e3Var.o("category");
            e3Var.A(this.f67201f);
        }
        if (this.f67202g != null) {
            e3Var.o("origin");
            e3Var.A(this.f67202g);
        }
        if (this.f67203h != null) {
            e3Var.o("level");
            e3Var.x(iLogger, this.f67203h);
        }
        ConcurrentHashMap concurrentHashMap = this.f67204i;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67204i, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }

    public e(long j11) {
        this.f67200e = new ConcurrentHashMap();
        this.f67196a = Long.valueOf(j11);
        this.f67197b = null;
    }

    public e(e eVar) {
        this.f67200e = new ConcurrentHashMap();
        this.f67197b = eVar.f67197b;
        this.f67196a = eVar.f67196a;
        this.f67198c = eVar.f67198c;
        this.f67199d = eVar.f67199d;
        this.f67201f = eVar.f67201f;
        this.f67202g = eVar.f67202g;
        ConcurrentHashMap concurrentHashMapY = com.google.android.gms.internal.consent_sdk.k0.y(eVar.f67200e);
        if (concurrentHashMapY != null) {
            this.f67200e = concurrentHashMapY;
        }
        this.f67204i = com.google.android.gms.internal.consent_sdk.k0.y(eVar.f67204i);
        this.f67203h = eVar.f67203h;
    }

    public e() {
        this(System.currentTimeMillis());
    }
}
