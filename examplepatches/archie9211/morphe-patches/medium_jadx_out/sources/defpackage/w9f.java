package defpackage;

import com.adobe.internal.xmp.XMPException;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w9f implements u9f {
    public y9f a = new y9f(null, null, null);

    public final t9f a(String str, td tdVar) throws XMPException {
        y9f y9fVarM = this.a;
        t9f t9fVar = new t9f();
        t9fVar.b = null;
        t9fVar.c = null;
        if (tdVar == null) {
            tdVar = new td(1, (byte) 0);
        }
        t9fVar.a = tdVar;
        boolean z = str != null && str.length() > 0;
        if (z) {
            if (!z) {
                ywb.e(101, "Schema namespace URI is required");
                return null;
            }
            y9fVarM = mo7.M(y9fVarM, str, null, false);
        }
        if (y9fVarM == null) {
            t9fVar.c = Collections.EMPTY_LIST.iterator();
            return t9fVar;
        }
        if (tdVar.c(256)) {
            t9fVar.c = new s9f(t9fVar, y9fVarM, null);
            return t9fVar;
        }
        t9fVar.c = new r9f(t9fVar, y9fVarM, null, 1);
        return t9fVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x008d, code lost:
    
        defpackage.ywb.e(102, "Language qualifier must be first");
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0092, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x013a, code lost:
    
        defpackage.ywb.e(102, "Alt-text array item has no language qualifier");
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x013f, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(java.lang.String r22) throws com.adobe.internal.xmp.XMPException {
        /*
            Method dump skipped, instruction units count: 572
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w9f.b(java.lang.String):void");
    }

    public final Object clone() {
        y9f y9fVarE = this.a.e();
        w9f w9fVar = new w9f();
        w9fVar.a = y9fVarE;
        return w9fVar;
    }
}
