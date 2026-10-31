package uo;

import java.text.ParseException;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes4.dex */
public class p extends g {

    /* renamed from: b, reason: collision with root package name */
    public final n f91494b;

    /* renamed from: c, reason: collision with root package name */
    public final String f91495c;

    /* renamed from: d, reason: collision with root package name */
    public final lp.b f91496d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicReference f91497e;

    public p(lp.b bVar, lp.b bVar2, lp.b bVar3) throws ParseException {
        String string;
        lp.b bVar4;
        r rVar = new r(bVar2);
        AtomicReference atomicReference = new AtomicReference();
        this.f91497e = atomicReference;
        try {
            n nVarC = n.c(bVar);
            boolean z11 = nVarC.o;
            this.f91494b = nVarC;
            this.f91436a = rVar;
            byte[] bytes = null;
            if (z11) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(nVarC.a().f75082a);
                sb2.append('.');
                r rVar2 = this.f91436a;
                lp.b bVarC = rVar2.f91500c;
                if (bVarC == null) {
                    byte[] bytes2 = rVar2.f91499b;
                    if (bytes2 == null) {
                        if (bVarC != null) {
                            bytes2 = bVarC.a();
                        } else {
                            String string2 = rVar2.toString();
                            bytes2 = string2 != null ? string2.getBytes(lp.f.f75086a) : null;
                        }
                    }
                    bVarC = lp.b.c(bytes2);
                }
                sb2.append(bVarC.f75082a);
                string = sb2.toString();
            } else {
                string = nVarC.a().f75082a + '.' + this.f91436a.toString();
            }
            this.f91495c = string;
            if (bVar3.f75082a.trim().isEmpty()) {
                throw new ParseException("The signature must not be empty", 0);
            }
            this.f91496d = bVar3;
            atomicReference.set(o.f91491a);
            if (z11 && (bVar4 = rVar.f91500c) == null) {
                if (bVar4 != null) {
                    bytes = bVar4.a();
                } else {
                    String string3 = rVar.toString();
                    if (string3 != null) {
                        bytes = string3.getBytes(lp.f.f75086a);
                    }
                }
                lp.b.c(bytes);
            }
        } catch (ParseException e3) {
            throw new ParseException("Invalid JWS header: " + e3.getMessage(), 0);
        }
    }
}
