package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class at3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ht3 d;
    public final /* synthetic */ Uri e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ at3(ht3 ht3Var, Uri uri, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ht3Var;
        this.e = uri;
        this.f = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new at3(this.d, this.e, this.f, n92Var, 0);
            default:
                return new at3(this.d, this.e, this.f, n92Var, 1);
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
        return ((at3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.f;
        Uri uri = this.e;
        ht3 ht3Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return ht3Var.j(uri, str, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    ht3Var.g.b(ht3Var.b, gp7.u(ht3Var.v), ht3Var.u);
                    this.c = 1;
                    return ht3Var.j(uri, str, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
