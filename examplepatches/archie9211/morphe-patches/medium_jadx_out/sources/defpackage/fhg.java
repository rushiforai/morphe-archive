package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzqh;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fhg {
    public static final fhg b;
    public final AtomicReference a = new AtomicReference(new wig(new ajg(0)));

    static {
        try {
            fhg fhgVar = new fhg();
            fhgVar.f(new zfg(lgg.class, new z8g(2)));
            b = fhgVar;
        } catch (Exception e) {
            throw new zzqh(e);
        }
    }

    public final gr7 a(nig nigVar) {
        wig wigVar = (wig) this.a.get();
        wigVar.getClass();
        zig zigVar = new zig(nig.class, (qvg) nigVar.b);
        HashMap map = wigVar.b;
        if (map.containsKey(zigVar)) {
            return ((wfg) map.get(zigVar)).b.T(nigVar);
        }
        throw new GeneralSecurityException(ev6.x("No Key Parser for requested key type ", String.valueOf(zigVar), " available"));
    }

    public final bzf b(lig ligVar) throws GeneralSecurityException {
        wig wigVar = (wig) this.a.get();
        wigVar.getClass();
        zig zigVar = new zig(lig.class, (qvg) ligVar.b);
        HashMap map = wigVar.d;
        if (map.containsKey(zigVar)) {
            return ((shg) map.get(zigVar)).b.r(ligVar);
        }
        throw new GeneralSecurityException(ev6.x("No Parameters Parser for requested key type ", String.valueOf(zigVar), " available"));
    }

    public final xig c(gr7 gr7Var) throws GeneralSecurityException {
        wig wigVar = (wig) this.a.get();
        wigVar.getClass();
        cjg cjgVar = new cjg(gr7Var.getClass(), nig.class);
        HashMap map = wigVar.a;
        if (map.containsKey(cjgVar)) {
            return ((zfg) map.get(cjgVar)).b.l0(gr7Var);
        }
        throw new GeneralSecurityException(ev6.x("No Key serializer for ", String.valueOf(cjgVar), " available"));
    }

    public final xig d(bzf bzfVar) throws GeneralSecurityException {
        wig wigVar = (wig) this.a.get();
        wigVar.getClass();
        cjg cjgVar = new cjg(bzfVar.getClass(), lig.class);
        HashMap map = wigVar.c;
        if (map.containsKey(cjgVar)) {
            return ((uhg) map.get(cjgVar)).b.i(bzfVar);
        }
        throw new GeneralSecurityException(ev6.x("No Key Format serializer for ", String.valueOf(cjgVar), " available"));
    }

    public final synchronized void e(wfg wfgVar) {
        ajg ajgVar = new ajg((wig) this.a.get());
        ajgVar.a(wfgVar);
        this.a.set(new wig(ajgVar));
    }

    public final synchronized void f(zfg zfgVar) {
        ajg ajgVar = new ajg((wig) this.a.get());
        ajgVar.b(zfgVar);
        this.a.set(new wig(ajgVar));
    }

    public final synchronized void g(shg shgVar) {
        ajg ajgVar = new ajg((wig) this.a.get());
        ajgVar.c(shgVar);
        this.a.set(new wig(ajgVar));
    }

    public final synchronized void h(uhg uhgVar) {
        ajg ajgVar = new ajg((wig) this.a.get());
        ajgVar.d(uhgVar);
        this.a.set(new wig(ajgVar));
    }
}
