package w6;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import we.i;
import we.j;
import wf.v;

/* loaded from: classes2.dex */
public final class b implements i {
    public static xv.d b(String str) {
        Object next;
        i70.a aVar = xv.d.f96435j;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (Intrinsics.b(str, ((xv.d) next).f96436a)) {
                break;
            }
        }
        return (xv.d) next;
    }

    @Override // we.i
    public j a(we.h hVar) {
        int i5 = v.f94376a;
        if (i5 < 23 || i5 < 31) {
            return new vp.a().a(hVar);
        }
        int iF = wf.j.f(hVar.f94247c.f54883l);
        wf.a.u("DMCodecAdapterFactory", "Creating an asynchronous MediaCodec adapter for track type " + v.t(iF));
        return new og.i(iF).a(hVar);
    }
}
