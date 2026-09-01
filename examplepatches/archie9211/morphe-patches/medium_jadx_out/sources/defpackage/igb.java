package defpackage;

import com.medium.proto.event.ResponsesViewed;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class igb extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ nib c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ igb(nib nibVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = nibVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nib nibVar = this.c;
        switch (i) {
            case 0:
                return new igb(nibVar, n92Var, 0);
            default:
                return new igb(nibVar, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((igb) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((igb) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        nib nibVar = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                ax2 ax2Var = nibVar.v;
                String str = nibVar.F;
                String str2 = nibVar.L;
                String str3 = nibVar.b;
                String str4 = nibVar.J;
                ax2Var.getClass();
                str.getClass();
                str3.getClass();
                str2.getClass();
                str4.getClass();
                rqd.a(ax2Var.b, new ResponsesViewed(null, str, null, 5, null), str3, str2, false, null, str4, 24);
                break;
            default:
                br7.v(obj);
                pu7 pu7Var = nibVar.y;
                pu7Var.getClass();
                pu7Var.e(ek6.RESPONSE_DRAFT_ID, ek6.RESPONSE_DRAFT_TEXT);
                nibVar.N.setValue(uid.b(nibVar.f(), "", 0L, 6));
                nibVar.A.d(AEVqIoD.IuniJMfgOlC, bib.a(nibVar.e(), nibVar.F, nibVar.L, null, null, false, null, false, null, 67));
                break;
        }
        return c1eVar;
    }
}
