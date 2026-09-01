package defpackage;

import coil3.network.HttpException;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xd8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ b55 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xd8(b55 b55Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = b55Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        b55 b55Var = this.e;
        switch (i) {
            case 0:
                xd8 xd8Var = new xd8(b55Var, n92Var, 0);
                xd8Var.d = obj;
                return xd8Var;
            case 1:
                xd8 xd8Var2 = new xd8(b55Var, n92Var, 1);
                xd8Var2.d = obj;
                return xd8Var2;
            case 2:
                xd8 xd8Var3 = new xd8(b55Var, n92Var, 2);
                xd8Var3.d = obj;
                return xd8Var3;
            default:
                xd8 xd8Var4 = new xd8(b55Var, n92Var, 3);
                xd8Var4.d = obj;
                return xd8Var4;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((xd8) create((ne8) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((xd8) create((b78) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((xd8) create((b78) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((xd8) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        b55 b55Var = this.e;
        switch (i) {
            case 0:
                ne8 ne8Var = (ne8) this.d;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                int i3 = ne8Var.a;
                if ((200 > i3 || i3 >= 300) && i3 != 304) {
                    throw new HttpException("HTTP " + ne8Var.a);
                }
                this.d = null;
                this.c = 1;
                Object objInvoke = b55Var.invoke(ne8Var, this);
                return objInvoke == tb2Var ? tb2Var : objInvoke;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    b78 b78Var = (b78) this.d;
                    this.c = 1;
                    obj = b55Var.invoke(b78Var, this);
                    if (obj == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                b78 b78Var2 = (b78) obj;
                b78Var2.getClass();
                b78Var2.b.a.set(true);
                return b78Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    b78 b78Var3 = new b78(new LinkedHashMap(((b78) this.d).a()), false);
                    this.d = b78Var3;
                    this.c = 1;
                    return b55Var.invoke(b78Var3, this) == tb2Var3 ? tb2Var3 : b78Var3;
                }
                if (i5 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                b78 b78Var4 = (b78) this.d;
                br7.v(obj);
                return b78Var4;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    sb2 sb2Var = (sb2) this.d;
                    this.c = 1;
                    if (b55Var.invoke(sb2Var, this) == tb2Var4) {
                        return tb2Var4;
                    }
                } else {
                    if (i6 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1e.a;
        }
    }
}
