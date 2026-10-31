package com.fyber.inneractive.sdk.bidder;

import android.text.TextUtils;
import b.u4;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveUserConfig;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.a1;
import java.util.ArrayList;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class d {
    public String A;
    public Boolean B;
    public String C;
    public InneractiveUserConfig.Gender D;
    public boolean E;
    public String F;
    public String G;
    public String H;
    public String I;
    public final boolean J;
    public Boolean K;
    public String L;

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.serverapi.c f27629a;

    /* renamed from: b, reason: collision with root package name */
    public String f27630b;

    /* renamed from: c, reason: collision with root package name */
    public final String f27631c;

    /* renamed from: d, reason: collision with root package name */
    public final String f27632d;

    /* renamed from: e, reason: collision with root package name */
    public final String f27633e;

    /* renamed from: f, reason: collision with root package name */
    public final String f27634f;

    /* renamed from: g, reason: collision with root package name */
    public String f27635g;

    /* renamed from: h, reason: collision with root package name */
    public String f27636h;

    /* renamed from: i, reason: collision with root package name */
    public String f27637i;

    /* renamed from: j, reason: collision with root package name */
    public String f27638j;

    /* renamed from: k, reason: collision with root package name */
    public String f27639k;

    /* renamed from: l, reason: collision with root package name */
    public Long f27640l;

    /* renamed from: m, reason: collision with root package name */
    public int f27641m;
    public int n;
    public final q o;

    /* renamed from: p, reason: collision with root package name */
    public String f27642p;

    /* renamed from: q, reason: collision with root package name */
    public String f27643q;

    /* renamed from: r, reason: collision with root package name */
    public final g0 f27644r;

    /* renamed from: s, reason: collision with root package name */
    public Boolean f27645s;

    /* renamed from: t, reason: collision with root package name */
    public Boolean f27646t;

    /* renamed from: u, reason: collision with root package name */
    public Boolean f27647u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f27648v;

    /* renamed from: w, reason: collision with root package name */
    public Boolean f27649w;

    /* renamed from: x, reason: collision with root package name */
    public Boolean f27650x;

    /* renamed from: y, reason: collision with root package name */
    public Boolean f27651y;

    /* renamed from: z, reason: collision with root package name */
    public int f27652z;

    public d(com.fyber.inneractive.sdk.serverapi.c cVar) {
        String str;
        this.f27629a = cVar;
        if (TextUtils.isEmpty(this.f27630b)) {
            com.fyber.inneractive.sdk.util.r.f31215a.execute(new c(this));
        }
        StringBuilder sb2 = new StringBuilder("2.2.0-Android-8.4.7");
        if (!TextUtils.isEmpty(InneractiveAdManager.getDevPlatform())) {
            sb2.append('-');
            sb2.append(InneractiveAdManager.getDevPlatform());
        }
        this.f27631c = sb2.toString();
        this.f27632d = com.fyber.inneractive.sdk.util.o.f31210a.getPackageName();
        this.f27633e = com.fyber.inneractive.sdk.util.k.g();
        this.f27634f = com.fyber.inneractive.sdk.util.k.i();
        this.f27641m = com.fyber.inneractive.sdk.util.o.c(com.fyber.inneractive.sdk.util.o.d());
        this.n = com.fyber.inneractive.sdk.util.o.c(com.fyber.inneractive.sdk.util.o.c());
        com.fyber.inneractive.sdk.serverapi.a aVar = com.fyber.inneractive.sdk.serverapi.b.f31093a;
        try {
            Class.forName("com.unity3d.player.UnityPlayer");
            str = "unity3d";
        } catch (Throwable unused) {
            str = "native";
        }
        this.o = !str.equals("native") ? !str.equals("unity3d") ? q.UNRECOGNIZED : q.UNITY3D : q.NATIVE;
        this.f27644r = (!com.fyber.inneractive.sdk.util.s.a() || IAConfigManager.Q.f27758r) ? g0.SECURE : g0.UNSECURE;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (TextUtils.isEmpty(iAConfigManager.o)) {
            this.G = iAConfigManager.f27755m;
        } else {
            this.G = u4.m(iAConfigManager.f27755m, "_", iAConfigManager.o);
        }
        this.J = InneractiveAdManager.isCurrentUserAChild();
        a();
        this.f27646t = com.fyber.inneractive.sdk.serverapi.b.g();
        this.B = com.fyber.inneractive.sdk.serverapi.b.i();
        this.f27649w = com.fyber.inneractive.sdk.serverapi.b.f();
        this.f27650x = com.fyber.inneractive.sdk.serverapi.b.l();
        this.f27651y = com.fyber.inneractive.sdk.serverapi.b.k();
    }

    public final void a() {
        String id2;
        this.f27629a.getClass();
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        this.f27635g = iAConfigManager.f27756p;
        if (!InneractiveAdManager.isCurrentUserAChild()) {
            this.f27629a.getClass();
            this.f27636h = com.fyber.inneractive.sdk.util.k.f();
            this.f27637i = this.f27629a.a();
            String str = this.f27629a.f31098b;
            String strSubstring = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            this.f27638j = str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str.substring(0, Math.min(3, str.length()));
            String str2 = this.f27629a.f31098b;
            if (str2 != null) {
                strSubstring = str2.substring(Math.min(3, str2.length()));
            }
            this.f27639k = strSubstring;
            this.f27629a.getClass();
            a1 a1VarA = a1.a();
            IAlog.a("ExchangeRequestParamsProvider: getNetwork : type: %s value: %s", a1VarA, a1VarA.b());
            this.f27643q = a1VarA.b();
            int i5 = com.fyber.inneractive.sdk.config.n.f27870a;
            String property = System.getProperty("ia.testEnvironmentConfiguration.device");
            if (TextUtils.isEmpty(property)) {
                com.fyber.inneractive.sdk.config.y yVar = com.fyber.inneractive.sdk.config.x.f27950a.f27966b;
                property = yVar != null ? yVar.f27951a : null;
            }
            this.A = property;
            this.F = iAConfigManager.f27753k.getZipCode();
        }
        this.D = iAConfigManager.f27753k.getGender();
        this.f27640l = com.fyber.inneractive.sdk.serverapi.b.e();
        try {
            id2 = TimeZone.getDefault().getID();
        } catch (Throwable unused) {
            id2 = null;
        }
        this.L = id2;
        this.f27629a.getClass();
        ArrayList arrayList = iAConfigManager.f27757q;
        if (arrayList != null && !arrayList.isEmpty()) {
            this.f27642p = com.fyber.inneractive.sdk.util.o.a(arrayList);
        }
        this.C = com.fyber.inneractive.sdk.serverapi.b.b();
        this.f27648v = com.fyber.inneractive.sdk.serverapi.b.h().booleanValue();
        this.f27652z = com.fyber.inneractive.sdk.serverapi.b.c().intValue();
        this.E = iAConfigManager.f27754l;
        this.f27645s = com.fyber.inneractive.sdk.serverapi.b.m();
        IAConfigManager iAConfigManager2 = IAConfigManager.Q;
        if (TextUtils.isEmpty(iAConfigManager2.o)) {
            this.G = iAConfigManager2.f27755m;
        } else {
            this.G = u4.m(iAConfigManager2.f27755m, "_", iAConfigManager2.o);
        }
        this.f27647u = com.fyber.inneractive.sdk.serverapi.b.n();
        iAConfigManager.F.n();
        com.fyber.inneractive.sdk.ignite.l lVar = iAConfigManager.F.o;
        this.H = lVar != null ? lVar.f69429a.i() : null;
        com.fyber.inneractive.sdk.ignite.l lVar2 = iAConfigManager.F.o;
        this.I = lVar2 != null ? lVar2.f69429a.d() : null;
        this.f27629a.getClass();
        this.f27641m = com.fyber.inneractive.sdk.util.o.c(com.fyber.inneractive.sdk.util.o.d());
        this.f27629a.getClass();
        this.n = com.fyber.inneractive.sdk.util.o.c(com.fyber.inneractive.sdk.util.o.c());
        this.K = com.fyber.inneractive.sdk.serverapi.b.j();
    }
}
