package fl;

import java.security.GeneralSecurityException;

/* loaded from: classes.dex */
public final class v extends b {

    /* renamed from: c, reason: collision with root package name */
    public final x f55422c;

    /* renamed from: d, reason: collision with root package name */
    public final t5.d0 f55423d;

    /* renamed from: e, reason: collision with root package name */
    public final tl.a f55424e;

    /* renamed from: f, reason: collision with root package name */
    public final Integer f55425f;

    public v(x xVar, t5.d0 d0Var, tl.a aVar, Integer num) {
        this.f55422c = xVar;
        this.f55423d = d0Var;
        this.f55424e = aVar;
        this.f55425f = num;
    }

    public static v p0(j jVar, t5.d0 d0Var, Integer num) throws GeneralSecurityException {
        tl.a aVarB;
        j jVar2 = j.f55353v;
        if (jVar != jVar2 && num == null) {
            throw new GeneralSecurityException("For given Variant " + jVar + " the value of idRequirement must be non-null");
        }
        if (jVar == jVar2 && num != null) {
            throw new GeneralSecurityException("For given Variant NO_PREFIX the value of idRequirement must be null");
        }
        if (d0Var.I() != 32) {
            throw new GeneralSecurityException("ChaCha20Poly1305 key must be constructed with key of length 32 bytes, not " + d0Var.I());
        }
        x xVar = new x(jVar);
        if (jVar == jVar2) {
            aVarB = kl.c0.f71572a;
        } else if (jVar == j.f55352u) {
            aVarB = kl.c0.a(num.intValue());
        } else {
            if (jVar != j.f55351t) {
                throw new IllegalStateException("Unknown Variant: " + jVar);
            }
            aVarB = kl.c0.b(num.intValue());
        }
        return new v(xVar, d0Var, aVarB, num);
    }

    @Override // bh.g
    public final Integer W() {
        return this.f55425f;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f55422c;
    }

    @Override // fl.b
    public final tl.a o0() {
        return this.f55424e;
    }
}
