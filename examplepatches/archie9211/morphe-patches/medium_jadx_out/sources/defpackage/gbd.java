package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;
import sprig.view.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gbd extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public /* synthetic */ Object e;
    public Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gbd(bo4 bo4Var, g4e g4eVar, nhc nhcVar, Resources resources, n92 n92Var) {
        super(2, n92Var);
        this.b = 10;
        this.f = bo4Var;
        this.g = g4eVar;
        this.d = nhcVar;
        this.e = resources;
    }

    private final Object i(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            jhf jhfVar = (jhf) this.f;
            rbb rbbVar = (rbb) this.d;
            String str = (String) this.e;
            a.d dVar = (a.d) this.g;
            this.c = 1;
            if (jhfVar.a("/sdk/1/completeSessionReplay", "POST", rbbVar, fy3.a, str, dVar, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    private final Object n(Object obj) {
        xbg xbgVar;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.c;
        if (i == 0) {
            br7.v(obj);
            xbgVar = (xbg) this.d;
            iwf iwfVar = (iwf) this.e;
            jrf jrfVar = (jrf) this.g;
            this.f = xbgVar;
            this.c = 1;
            obj = iwfVar.a(jrfVar);
            if (obj != tb2Var) {
            }
        }
        if (i != 1) {
            br7.v(obj);
            return obj;
        }
        xbgVar = (xbg) this.f;
        br7.v(obj);
        this.f = null;
        this.c = 2;
        Object objInvoke = ((ycg) obj).a.invoke(xbgVar.a, this);
        return objInvoke == tb2Var ? tb2Var : objInvoke;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                return new gbd((jcd) this.f, (nhc) this.d, (Resources) this.e, (nbd) obj2, n92Var, 0);
            case 1:
                return new gbd((eed) this.f, (nhc) this.d, (Resources) this.e, (zdd) obj2, n92Var, 1);
            case 2:
                return new gbd((eed) this.f, (nhc) this.d, (Resources) this.e, (bed) obj2, n92Var, 2);
            case 3:
                return new gbd((ued) this.f, (nhc) this.d, (Resources) this.e, (a1a) obj2, n92Var, 3);
            case 4:
                return new gbd((fqd) this.f, (nhc) this.d, (Resources) this.e, (qlb) obj2, n92Var, 4);
            case 5:
                return new gbd((xpd) this.e, (fqd) obj2, n92Var, 5);
            case 6:
                gbd gbdVar = new gbd((xqd) obj2, n92Var);
                gbdVar.e = obj;
                return gbdVar;
            case 7:
                gbd gbdVar2 = new gbd((mtd) this.d, (int[]) this.e, (String[]) obj2, n92Var, 7);
                gbdVar2.f = obj;
                return gbdVar2;
            case 8:
                return new gbd((String) this.f, (o2b) this.d, (String) this.e, (EntityType) obj2, n92Var, 8);
            case 9:
                return new gbd((u3e) this.f, (nhc) this.d, (Resources) this.e, (t3e) obj2, n92Var, 9);
            case 10:
                return new gbd((bo4) this.f, (g4e) obj2, (nhc) this.d, (Resources) this.e, n92Var);
            case 11:
                return new gbd((q9e) this.f, (nhc) this.d, (Resources) this.e, (m8e) obj2, n92Var, 11);
            case 12:
                return new gbd((q9e) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 12);
            case 13:
                gbd gbdVar3 = new gbd((afe) this.e, (String) obj2, n92Var, 13);
                gbdVar3.d = obj;
                return gbdVar3;
            case 14:
                gbd gbdVar4 = new gbd((gge) this.e, (String) obj2, n92Var, 14);
                gbdVar4.d = obj;
                return gbdVar4;
            case 15:
                return new gbd((cie) this.f, (nhc) this.d, (Resources) this.e, (md3) obj2, n92Var, 15);
            case 16:
                return new gbd((cie) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 16);
            case 17:
                return new gbd((ime) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 17);
            case 18:
                return new gbd((doe) this.f, (nhc) this.d, (Resources) this.e, (a1a) obj2, n92Var, 18);
            case 19:
                return new gbd((t1f) this.f, (rya) this.d, (rya) this.e, (rya) obj2, n92Var, 19);
            case 20:
                return new gbd((rya) this.f, (swa) this.d, (iy6) this.e, (x15) obj2, n92Var, 20);
            case 21:
                return new gbd((k37) this.f, (c8f) this.d, (g7f) this.e, (Context) obj2, n92Var, 21);
            case 22:
                return new gbd((kbf) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 22);
            case 23:
                return new gbd((bo4) this.f, (ubf) this.d, (j78) this.e, (j78) obj2, n92Var, 23);
            case 24:
                return new gbd((ref) this.f, (nhc) this.d, (Resources) this.e, (md3) obj2, n92Var, 24);
            case 25:
                return new gbd((ref) this.f, (String) this.d, (String) this.e, (SourceParameter) obj2, n92Var, 25);
            case 26:
                return new gbd((sff) this.f, (nhc) this.d, (Resources) this.e, (md3) obj2, n92Var, 26);
            case 27:
                return new gbd((jhf) this.f, (rbb) this.d, (String) this.e, (a.d) obj2, n92Var, 27);
            case 28:
                return new gbd((xbg) this.d, (iwf) this.e, (jrf) obj2, n92Var, 28);
            default:
                gbd gbdVar5 = new gbd((nig) this.d, (String) this.e, (arf) obj2, n92Var, 29);
                gbdVar5.f = obj;
                return gbdVar5;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((gbd) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 10:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 11:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 12:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 13:
                return ((gbd) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                return ((gbd) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 15:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 16:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 17:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 18:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 19:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 20:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 21:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 22:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 23:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 24:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 25:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 26:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 27:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 28:
                return ((gbd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((gbd) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:222:0x058c, code lost:
    
        if (defpackage.r6c.m(r1, r10, r23) != r0) goto L224;
     */
    /* JADX WARN: Code restructure failed: missing block: B:314:0x0747, code lost:
    
        if (defpackage.r6c.m(r7, r0, r23) != r8) goto L316;
     */
    /* JADX WARN: Code restructure failed: missing block: B:403:0x091b, code lost:
    
        if (r1.x(r13, r23) == r0) goto L404;
     */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:259:0x0637  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x065b  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x0664  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x067a  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x068e  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x06af  */
    /* JADX WARN: Removed duplicated region for block: B:436:0x099f  */
    /* JADX WARN: Removed duplicated region for block: B:473:0x0a4d  */
    /* JADX WARN: Removed duplicated region for block: B:602:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:436:0x099f -> B:427:0x096a). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r24) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 3002
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gbd.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gbd(xqd xqdVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 6;
        this.g = xqdVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gbd(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.g = obj2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gbd(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.g = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gbd(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.d = obj2;
        this.e = obj3;
        this.g = obj4;
    }
}
