package defpackage;

import com.medium.proto.event.EditorHeaderToggle;
import com.medium.proto.event.EditorInserSection;
import com.medium.proto.event.EditorListToggle;
import com.medium.proto.event.EditorPreToggle;
import com.medium.proto.event.EditorQuoteToggle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ws3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ht3 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ws3(ht3 ht3Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ht3Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ht3 ht3Var = this.d;
        switch (i) {
            case 0:
                return new ws3(ht3Var, n92Var, 0);
            case 1:
                return new ws3(ht3Var, n92Var, 1);
            case 2:
                return new ws3(ht3Var, n92Var, 2);
            case 3:
                return new ws3(ht3Var, n92Var, 3);
            case 4:
                return new ws3(ht3Var, n92Var, 4);
            case 5:
                return new ws3(ht3Var, n92Var, 5);
            default:
                return new ws3(ht3Var, n92Var, 6);
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
        return ((ws3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ht3 ht3Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ty2 ty2Var = ht3Var.g;
                String str = ht3Var.b;
                String strU = gp7.u(ht3Var.v);
                String str2 = ht3Var.u;
                ty2Var.getClass();
                str.getClass();
                str2.getClass();
                rqd.a(ty2Var.a, new EditorPreToggle(null, null, 3, null), str, strU, false, null, str2, 24);
                r6c r6cVar = ht3Var.q;
                ds3 ds3Var = new ds3(iw1.a);
                this.c = 1;
                return r6cVar.a(ds3Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
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
                ty2 ty2Var2 = ht3Var.g;
                String str3 = ht3Var.b;
                String strU2 = gp7.u(ht3Var.v);
                String str4 = ht3Var.u;
                ty2Var2.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(ty2Var2.a, new EditorListToggle(null, null, 3, null), str3, strU2, false, null, str4, 24);
                r6c r6cVar2 = ht3Var.q;
                ds3 ds3Var2 = new ds3(lw1.a);
                this.c = 1;
                return r6cVar2.a(ds3Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = ht3Var.q;
                ds3 ds3Var3 = new ds3(xw1.a);
                this.c = 1;
                return r6cVar3.a(ds3Var3, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ty2 ty2Var3 = ht3Var.g;
                String str5 = ht3Var.b;
                String strU3 = gp7.u(ht3Var.v);
                String str6 = ht3Var.u;
                ty2Var3.getClass();
                str5.getClass();
                str6.getClass();
                rqd.a(ty2Var3.a, new EditorQuoteToggle(null, null, 3, null), str5, strU3, false, null, str6, 24);
                r6c r6cVar4 = ht3Var.q;
                ds3 ds3Var4 = new ds3(mw1.a);
                this.c = 1;
                return r6cVar4.a(ds3Var4, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar5 = ht3Var.q;
                ds3 ds3Var5 = new ds3(vw1.a);
                this.c = 1;
                return r6cVar5.a(ds3Var5, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ty2 ty2Var4 = ht3Var.g;
                String str7 = ht3Var.b;
                String strU4 = gp7.u(ht3Var.v);
                String str8 = ht3Var.u;
                ty2Var4.getClass();
                str7.getClass();
                str8.getClass();
                rqd.a(ty2Var4.a, new EditorInserSection(null, null, 3, null), str7, strU4, false, null, str8, 24);
                r6c r6cVar6 = ht3Var.q;
                ds3 ds3Var6 = new ds3(ww1.a);
                this.c = 1;
                return r6cVar6.a(ds3Var6, this) == tb2Var6 ? tb2Var6 : c1eVar;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ty2 ty2Var5 = ht3Var.g;
                String str9 = ht3Var.b;
                String strU5 = gp7.u(ht3Var.v);
                String str10 = ht3Var.u;
                ty2Var5.getClass();
                str9.getClass();
                str10.getClass();
                rqd.a(ty2Var5.a, new EditorHeaderToggle(null, null, 3, null), str9, strU5, false, null, str10, 24);
                r6c r6cVar7 = ht3Var.q;
                ds3 ds3Var7 = new ds3(kw1.a);
                this.c = 1;
                return r6cVar7.a(ds3Var7, this) == tb2Var7 ? tb2Var7 : c1eVar;
        }
    }
}
