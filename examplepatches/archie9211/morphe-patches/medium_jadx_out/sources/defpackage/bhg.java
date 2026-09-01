package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bhg {
    public static final bhg b = new bhg();
    public final ConcurrentHashMap a = new ConcurrentHashMap();

    public final void a(c1g c1gVar, Class cls) throws GeneralSecurityException {
        c1g c1gVar2 = (c1g) this.a.putIfAbsent(cls, c1gVar);
        if (c1gVar2 == null || c1gVar2.equals(c1gVar)) {
            return;
        }
        ygf.l("Different key creator for parameters class already inserted");
    }
}
