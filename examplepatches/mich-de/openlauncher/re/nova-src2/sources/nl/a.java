package nl;

import bh.g;
import java.security.GeneralSecurityException;
import t5.d0;

/* loaded from: classes3.dex */
public final class a extends g {

    /* renamed from: c, reason: collision with root package name */
    public final b f78357c;

    /* renamed from: d, reason: collision with root package name */
    public final d0 f78358d;

    public a(b bVar, d0 d0Var) {
        this.f78357c = bVar;
        this.f78358d = d0Var;
    }

    public static a o0(b bVar, d0 d0Var) throws GeneralSecurityException {
        if (bVar.f78359a == ((tl.a) d0Var.f88562b).f89442a.length) {
            return new a(bVar, d0Var);
        }
        throw new GeneralSecurityException("Key size mismatch");
    }

    @Override // bh.g
    public final Integer W() {
        return null;
    }

    @Override // bh.g
    public final el.g a0() {
        return this.f78357c;
    }
}
