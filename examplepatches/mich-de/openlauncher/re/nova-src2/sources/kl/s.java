package kl;

import java.security.GeneralSecurityException;
import pl.b2;

/* loaded from: classes.dex */
public final class s extends bh.g {

    /* renamed from: c, reason: collision with root package name */
    public final p0 f71634c;

    public s(p0 p0Var) {
        this.f71634c = p0Var;
    }

    @Override // bh.g
    public final Integer W() {
        return this.f71634c.f71625f;
    }

    @Override // bh.g
    public final el.g a0() {
        p0 p0Var = this.f71634c;
        return new r(p0Var.f71620a, p0Var.f71624e);
    }

    public final tl.a o0() throws GeneralSecurityException {
        p0 p0Var = this.f71634c;
        b2 b2Var = p0Var.f71624e;
        Integer num = p0Var.f71625f;
        if (b2Var.equals(b2.RAW)) {
            return tl.a.a(new byte[0]);
        }
        if (b2Var.equals(b2.TINK)) {
            return c0.b(num.intValue());
        }
        if (b2Var.equals(b2.LEGACY) || b2Var.equals(b2.CRUNCHY)) {
            return c0.a(num.intValue());
        }
        throw new GeneralSecurityException("Unknown output prefix type");
    }
}
