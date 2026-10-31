package ql;

import java.security.spec.ECPoint;

/* loaded from: classes3.dex */
public final class e extends i0 {

    /* renamed from: c, reason: collision with root package name */
    public final c f84145c;

    /* renamed from: d, reason: collision with root package name */
    public final ECPoint f84146d;

    /* renamed from: e, reason: collision with root package name */
    public final tl.a f84147e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f84148f;

    public e(c cVar, ECPoint eCPoint, tl.a aVar, Integer num) {
        this.f84145c = cVar;
        this.f84146d = eCPoint;
        this.f84147e = aVar;
        this.f84148f = num;
    }

    @Override // bh.g
    public final Integer W() {
        return this.f84148f;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f84145c;
    }

    @Override // ql.i0
    public final tl.a o0() {
        return this.f84147e;
    }
}
