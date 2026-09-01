package defpackage;

import java.security.GeneralSecurityException;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class plg {
    public static final plg b;
    public final HashMap a = new HashMap();

    static {
        nlg nlgVar = nlg.a;
        plg plgVar = new plg();
        try {
            plgVar.a(nlgVar, dlg.class);
            b = plgVar;
        } catch (GeneralSecurityException e) {
            throw new IllegalStateException("unexpected error.", e);
        }
    }

    public final synchronized void a(nlg nlgVar, Class cls) {
        try {
            HashMap map = this.a;
            nlg nlgVar2 = (nlg) map.get(cls);
            if (nlgVar2 != null && !nlgVar2.equals(nlgVar)) {
                String string = cls.toString();
                StringBuilder sb = new StringBuilder(string.length() + 60);
                sb.append("Different key creator for parameters class ");
                sb.append(string);
                sb.append(" already inserted");
                throw new GeneralSecurityException(sb.toString());
            }
            map.put(cls, nlgVar);
        } catch (Throwable th) {
            throw th;
        }
    }
}
