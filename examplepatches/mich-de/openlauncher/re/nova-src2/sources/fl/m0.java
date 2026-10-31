package fl;

import java.security.GeneralSecurityException;

/* loaded from: classes.dex */
public final class m0 extends b {

    /* renamed from: c, reason: collision with root package name */
    public final o0 f55383c;

    /* renamed from: d, reason: collision with root package name */
    public final t5.d0 f55384d;

    /* renamed from: e, reason: collision with root package name */
    public final tl.a f55385e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f55386f;

    public m0(o0 o0Var, t5.d0 d0Var, tl.a aVar, Integer num) {
        this.f55383c = o0Var;
        this.f55384d = d0Var;
        this.f55385e = aVar;
        this.f55386f = num;
    }

    public static m0 p0(j jVar, t5.d0 d0Var, Integer num) throws GeneralSecurityException {
        tl.a aVarB;
        j jVar2 = j.A;
        if (jVar != jVar2 && num == null) {
            throw new GeneralSecurityException("For given Variant " + jVar + " the value of idRequirement must be non-null");
        }
        if (jVar == jVar2 && num != null) {
            throw new GeneralSecurityException("For given Variant NO_PREFIX the value of idRequirement must be null");
        }
        if (d0Var.I() != 32) {
            throw new GeneralSecurityException("XChaCha20Poly1305 key must be constructed with key of length 32 bytes, not " + d0Var.I());
        }
        o0 o0Var = new o0(jVar);
        if (jVar == jVar2) {
            aVarB = kl.c0.f71572a;
        } else if (jVar == j.f55357z) {
            aVarB = kl.c0.a(num.intValue());
        } else {
            if (jVar != j.f55356y) {
                throw new IllegalStateException("Unknown Variant: " + jVar);
            }
            aVarB = kl.c0.b(num.intValue());
        }
        return new m0(o0Var, d0Var, aVarB, num);
    }

    @Override // bh.g
    public final Integer W() {
        return this.f55386f;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f55383c;
    }

    @Override // fl.b
    public final tl.a o0() {
        return this.f55385e;
    }
}
