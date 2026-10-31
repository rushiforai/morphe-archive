package ll;

import java.security.GeneralSecurityException;
import kl.c0;
import kl.p0;
import kl.s;
import pl.f1;

/* loaded from: classes3.dex */
public final class q implements el.f {
    public static q a(s sVar) throws GeneralSecurityException {
        p0 p0Var = sVar.f71634c;
        f1 f1Var = p0Var.f71623d;
        int iOrdinal = p0Var.f71624e.ordinal();
        if (iOrdinal == 1) {
            c0.b(p0Var.f71625f.intValue()).b();
        } else if (iOrdinal == 2) {
            c0.a(p0Var.f71625f.intValue()).b();
        } else if (iOrdinal != 3) {
            if (iOrdinal != 4) {
                throw new GeneralSecurityException("unknown output prefix type");
            }
            c0.a(p0Var.f71625f.intValue()).b();
        } else {
            c0.f71572a.b();
        }
        return new q();
    }
}
