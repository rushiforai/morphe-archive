package sl;

import java.security.GeneralSecurityException;
import java.util.Arrays;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public final class m implements el.f {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f87520a = {0};

    public static m a(ll.a aVar) throws GeneralSecurityException {
        m mVar = new m();
        d.b(nl.a.o0(nl.b.b(aVar.f74985c.f74998a), aVar.f74986d));
        ll.d dVar = aVar.f74985c;
        dVar.getClass();
        aVar.f74987e.b();
        if (dVar.f75000c.equals(ll.c.f74995d)) {
            Arrays.copyOf(f87520a, 1);
        }
        return mVar;
    }

    public static m b(ll.h hVar) {
        m mVar = new m();
        new og.g("HMAC" + hVar.f75005c.f75030d, new SecretKeySpec(((tl.a) hVar.f75006d.f88562b).b(), "HMAC"));
        ll.m mVar2 = hVar.f75005c;
        mVar2.getClass();
        hVar.f75007e.b();
        if (mVar2.f75029c.equals(ll.l.f75024d)) {
            Arrays.copyOf(f87520a, 1);
        }
        return mVar;
    }
}
