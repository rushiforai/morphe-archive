package com.vungle.ads.internal;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.Json;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final e f46843a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f46844b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f46845c;

    /* renamed from: d, reason: collision with root package name */
    public static final f f46846d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f46847e;

    /* renamed from: f, reason: collision with root package name */
    public static final b f46848f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f46849g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ h[] f46850h;

    static {
        e eVar = new e();
        f46843a = eVar;
        d dVar = new d();
        f46844b = dVar;
        g gVar = new g();
        f46845c = gVar;
        f fVar = new f();
        f46846d = fVar;
        c cVar = new c();
        f46847e = cVar;
        b bVar = new b();
        f46848f = bVar;
        a aVar = new a();
        f46849g = aVar;
        f46850h = new h[]{eVar, dVar, gVar, fVar, cVar, bVar, aVar};
    }

    public /* synthetic */ h(String str, int i5, int i11) {
        this(str, i5);
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f46850h.clone();
    }

    public final boolean a() {
        return ul.b.Q(f46848f, f46849g).contains(this);
    }

    public abstract boolean a(h hVar);

    public final h b(h adState) {
        Intrinsics.g(adState, "adState");
        if (this != adState && !a(adState)) {
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Cannot transition from ");
            sbA.append(name());
            sbA.append(" to ");
            sbA.append(adState.name());
            String string = sbA.toString();
            Json json = s.f47459p;
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AdInternal", "Illegal state transition", new IllegalStateException(string));
        }
        return adState;
    }

    public h(String str, int i5) {
    }
}
