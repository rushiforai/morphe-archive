package ql;

import java.security.GeneralSecurityException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class i extends h0 {

    /* renamed from: c, reason: collision with root package name */
    public final k f84167c;

    /* renamed from: d, reason: collision with root package name */
    public final t5.d0 f84168d;

    public i(k kVar, t5.d0 d0Var) {
        this.f84167c = kVar;
        this.f84168d = d0Var;
    }

    public static i q0(k kVar, t5.d0 d0Var) throws GeneralSecurityException {
        tl.a aVar = (tl.a) d0Var.f88562b;
        if (aVar.f89442a.length == 32) {
            if (Arrays.equals(kVar.f84176d.b(), kl.a.q(kl.a.j(aVar.b())).D())) {
                return new i(kVar, d0Var);
            }
            throw new GeneralSecurityException("Ed25519 keys mismatch");
        }
        throw new GeneralSecurityException("Ed25519 key must be constructed with key of length 32 bytes, not " + aVar.f89442a.length);
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f84167c.f84175c;
    }

    @Override // ql.h0
    public final i0 p0() {
        return this.f84167c;
    }
}
