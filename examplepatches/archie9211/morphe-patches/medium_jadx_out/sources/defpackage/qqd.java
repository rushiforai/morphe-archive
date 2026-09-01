package defpackage;

import com.squareup.wire.AndroidMessage;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qqd extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public int c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ String e;
    public /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Serializable j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qqd(rqd rqdVar, AndroidMessage androidMessage, String str, String str2, boolean z, String str3, String str4, n92 n92Var) {
        super(2, n92Var);
        this.f = rqdVar;
        this.g = androidMessage;
        this.e = str;
        this.h = str2;
        this.d = z;
        this.i = str3;
        this.j = str4;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Serializable serializable = this.j;
        Object obj2 = this.i;
        Object obj3 = this.h;
        Object obj4 = this.g;
        switch (i) {
            case 0:
                return new qqd((rqd) this.f, (AndroidMessage) obj4, this.e, (String) obj3, this.d, (String) obj2, (String) serializable, n92Var);
            default:
                qqd qqdVar = new qqd(this.d, (do4) obj4, (kle) obj3, (tjd) obj2, this.e, (xnc) serializable, n92Var);
                qqdVar.f = obj;
                return qqdVar;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((qqd) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Serializable serializable = this.j;
        Object obj2 = this.g;
        Object obj3 = this.i;
        Object obj4 = this.h;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return ((rqd) this.f).b((AndroidMessage) obj2, this.e, (String) obj4, this.d, (String) obj3, (String) serializable, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                kle kleVar = (kle) obj4;
                sb2 sb2Var = (sb2) this.f;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                n92 n92Var = null;
                if (this.d) {
                    vx0.c0(sb2Var, null, null, new cfd(kleVar, (tjd) obj3, n92Var, 15), 3);
                }
                to4 to4VarQ = kleVar.c.Q(new yj2(kleVar, this.e, (xnc) serializable, n92Var, 17));
                this.f = null;
                this.c = 1;
                return wgf.l((do4) obj2, to4VarQ, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qqd(boolean z, do4 do4Var, kle kleVar, tjd tjdVar, String str, xnc xncVar, n92 n92Var) {
        super(2, n92Var);
        this.d = z;
        this.g = do4Var;
        this.h = kleVar;
        this.i = tjdVar;
        this.e = str;
        this.j = xncVar;
    }
}
