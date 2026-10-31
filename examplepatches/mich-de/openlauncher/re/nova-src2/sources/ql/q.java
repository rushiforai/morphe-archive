package ql;

import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kl.j0;

/* loaded from: classes3.dex */
public final class q implements el.i {

    /* renamed from: a, reason: collision with root package name */
    public final j0 f84197a;

    public q(j0 j0Var) {
        this.f84197a = j0Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [kl.h0] */
    @Override // el.i
    public final void a(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        List list;
        Map map = this.f84197a.f71604a;
        List h0Var = (List) map.get(j0.f71603b);
        if (bArr.length >= 5) {
            list = (List) map.get(new tl.a(bArr, 5 > bArr.length ? bArr.length : 5));
        } else {
            list = null;
        }
        if (h0Var == null && list == null) {
            h0Var = new ArrayList();
        } else if (h0Var == null) {
            h0Var = list;
        } else if (list != null) {
            h0Var = new kl.h0(list, h0Var);
        }
        Iterator it = h0Var.iterator();
        while (it.hasNext()) {
            try {
                ((p) it.next()).f84196a.a(bArr, bArr2);
                return;
            } catch (GeneralSecurityException unused) {
            }
        }
        throw new GeneralSecurityException("invalid signature");
    }
}
