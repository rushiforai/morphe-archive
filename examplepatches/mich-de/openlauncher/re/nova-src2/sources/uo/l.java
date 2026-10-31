package uo;

import bn.s0;
import com.nimbusds.jose.JOSEException;
import java.nio.charset.StandardCharsets;
import java.util.Set;

/* loaded from: classes4.dex */
public final class l extends g {

    /* renamed from: b, reason: collision with root package name */
    public k f91470b;

    /* renamed from: c, reason: collision with root package name */
    public lp.b f91471c;

    /* renamed from: d, reason: collision with root package name */
    public lp.b f91472d;

    /* renamed from: e, reason: collision with root package name */
    public lp.b f91473e;

    /* renamed from: f, reason: collision with root package name */
    public lp.b f91474f;

    /* renamed from: g, reason: collision with root package name */
    public int f91475g;

    public l(k kVar, r rVar) {
        this.f91470b = kVar;
        this.f91436a = rVar;
        this.f91471c = null;
        this.f91473e = null;
        this.f91475g = 1;
    }

    public final synchronized void b(j jVar) {
        try {
            if (this.f91475g != 1) {
                throw new IllegalStateException("The JWE object must be in an unencrypted state");
            }
            c(jVar);
            try {
                try {
                    k kVar = this.f91470b;
                    r rVar = this.f91436a;
                    byte[] bytes = rVar.f91499b;
                    if (bytes == null) {
                        lp.b bVar = rVar.f91500c;
                        if (bVar != null) {
                            bytes = bVar.a();
                        } else {
                            String string = rVar.toString();
                            bytes = string != null ? string.getBytes(lp.f.f75086a) : null;
                        }
                    }
                    s0 s0VarA = jVar.a(kVar, bytes, this.f91470b.a().f75082a.getBytes(StandardCharsets.US_ASCII));
                    k kVar2 = (k) s0VarA.f18279b;
                    if (kVar2 != null) {
                        this.f91470b = kVar2;
                    }
                    this.f91471c = (lp.b) s0VarA.f18280c;
                    this.f91472d = (lp.b) s0VarA.f18281d;
                    this.f91473e = (lp.b) s0VarA.f18282e;
                    this.f91474f = (lp.b) s0VarA.f18283f;
                    this.f91475g = 2;
                } catch (JOSEException e3) {
                    throw e3;
                }
            } catch (Exception e11) {
                throw new JOSEException(e11.getMessage(), e11);
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void c(j jVar) throws JOSEException {
        xo.a aVar = (xo.a) jVar;
        Set set = aVar.f96202a;
        if (!set.contains((i) this.f91470b.f91410a)) {
            throw new JOSEException("The " + ((i) this.f91470b.f91410a) + " algorithm is not supported by the JWE encrypter: Supported algorithms: " + set);
        }
        Set set2 = aVar.f96203b;
        if (set2.contains(this.f91470b.o)) {
            return;
        }
        throw new JOSEException("The " + this.f91470b.o + " encryption method or key size is not supported by the JWE encrypter: Supported methods: " + set2);
    }

    public final String d() {
        int i5 = this.f91475g;
        if (i5 != 2 && i5 != 3) {
            throw new IllegalStateException("The JWE object must be in an encrypted or decrypted state");
        }
        StringBuilder sb2 = new StringBuilder(this.f91470b.a().f75082a);
        sb2.append('.');
        lp.b bVar = this.f91471c;
        if (bVar != null) {
            sb2.append(bVar);
        }
        sb2.append('.');
        lp.b bVar2 = this.f91472d;
        if (bVar2 != null) {
            sb2.append(bVar2);
        }
        sb2.append('.');
        sb2.append(this.f91473e);
        sb2.append('.');
        lp.b bVar3 = this.f91474f;
        if (bVar3 != null) {
            sb2.append(bVar3);
        }
        return sb2.toString();
    }
}
