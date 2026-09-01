package defpackage;

import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pnc extends bwd {
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;

    public /* synthetic */ pnc(int i, Object obj) {
        this.c = i;
        this.d = obj;
    }

    @Override // defpackage.exd
    public boolean a() {
        switch (this.c) {
            case 1:
                return false;
            default:
                return super.a();
        }
    }

    @Override // defpackage.exd
    public boolean e() {
        switch (this.c) {
            case 1:
                return ((Map) this.d).isEmpty();
            default:
                return super.e();
        }
    }

    @Override // defpackage.bwd
    public final xwd g(zvd zvdVar) {
        int i = this.c;
        Object obj = this.d;
        zvdVar.getClass();
        switch (i) {
            case 0:
                if (!((ArrayList) obj).contains(zvdVar)) {
                    return null;
                }
                co1 co1VarA = zvdVar.a();
                co1VarA.getClass();
                return nxd.k((swd) co1VarA);
            default:
                return (xwd) ((Map) obj).get(zvdVar);
        }
    }
}
