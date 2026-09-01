package defpackage;

import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class klf implements njg {
    public final vmg a;

    public klf(vmg vmgVar) {
        this.a = vmgVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r1v5, types: [java.lang.Iterable] */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.util.ArrayList] */
    @Override // defpackage.njg
    public final void b(byte[] bArr, byte[] bArr2) throws GeneralSecurityException {
        List list;
        vmg vmgVar = this.a;
        HashMap map = vmgVar.a;
        ?? xhgVar = (List) map.get(vmg.b);
        if (bArr.length >= 5) {
            int length = bArr.length;
            list = (List) map.get(new cmf(bArr, 5 > length ? length : 5));
        } else {
            list = null;
        }
        if (xhgVar == 0 && list == null) {
            xhgVar = new ArrayList();
        } else if (xhgVar == 0) {
            xhgVar = list;
        } else if (list != null) {
            xhgVar = new xhg(vmgVar, list, xhgVar, 1);
        }
        Iterator it2 = xhgVar.iterator();
        while (it2.hasNext()) {
            try {
                ((llf) it2.next()).a.b(bArr, bArr2);
                return;
            } catch (GeneralSecurityException unused) {
            }
        }
        ygf.l("invalid signature");
    }
}
