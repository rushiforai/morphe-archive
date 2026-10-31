package ql;

import java.security.GeneralSecurityException;

/* loaded from: classes3.dex */
public final class k extends i0 {

    /* renamed from: c, reason: collision with root package name */
    public final h f84175c;

    /* renamed from: d, reason: collision with root package name */
    public final tl.a f84176d;

    /* renamed from: e, reason: collision with root package name */
    public final tl.a f84177e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f84178f;

    public k(h hVar, tl.a aVar, tl.a aVar2, Integer num) {
        this.f84175c = hVar;
        this.f84176d = aVar;
        this.f84177e = aVar2;
        this.f84178f = num;
    }

    public static k p0(g gVar, tl.a aVar, Integer num) throws GeneralSecurityException {
        tl.a aVarA;
        byte[] bArr = aVar.f89442a;
        h hVar = new h(gVar);
        g gVar2 = g.f84164e;
        if (!gVar.equals(gVar2) && num == null) {
            throw new GeneralSecurityException("For given Variant " + gVar + " the value of idRequirement must be non-null");
        }
        if (gVar.equals(gVar2) && num != null) {
            throw new GeneralSecurityException("For given Variant NO_PREFIX the value of idRequirement must be null");
        }
        if (bArr.length != 32) {
            throw new GeneralSecurityException("Ed25519 key must be constructed with key of length 32 bytes, not " + bArr.length);
        }
        if (gVar == gVar2) {
            aVarA = kl.c0.f71572a;
        } else if (gVar == g.f84162c || gVar == g.f84163d) {
            aVarA = kl.c0.a(num.intValue());
        } else {
            if (gVar != g.f84161b) {
                throw new IllegalStateException("Unknown Variant: " + gVar);
            }
            aVarA = kl.c0.b(num.intValue());
        }
        return new k(hVar, aVar, aVarA, num);
    }

    @Override // bh.g
    public final Integer W() {
        return this.f84178f;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f84175c;
    }

    @Override // ql.i0
    public final tl.a o0() {
        return this.f84177e;
    }
}
