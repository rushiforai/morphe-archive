package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eib extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nib d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ eib(nib nibVar, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nibVar;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new eib(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new eib(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new eib(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new eib(this.d, this.e, this.f, n92Var, 3);
            default:
                return new eib(this.d, this.e, this.f, n92Var, 4);
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
        return ((eib) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        String str = this.f;
        String str2 = this.e;
        nib nibVar = this.d;
        c1e c1eVar = c1e.a;
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
                nib nibVar2 = this.d;
                b0f b0fVar = nibVar2.I;
                dib dibVar = new dib(nibVar2, this.e, this.f, null, 0);
                this.c = 1;
                return b0fVar.h(dibVar, this) == tb2Var ? tb2Var : c1eVar;
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
                nib nibVar3 = this.d;
                b0f b0fVar2 = nibVar3.I;
                dib dibVar2 = new dib(nibVar3, this.e, this.f, null, 1);
                this.c = 1;
                return b0fVar2.h(dibVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                b0f b0fVar3 = nibVar.I;
                this.c = 1;
                Object objA = b0fVar3.a.a(new jze(str2, str), this);
                if (objA != tb2Var3) {
                    objA = c1eVar;
                }
                return objA == tb2Var3 ? tb2Var3 : c1eVar;
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
                b0f b0fVar4 = nibVar.I;
                this.c = 1;
                Object objA2 = b0fVar4.a.a(new oze(str2, str), this);
                if (objA2 != tb2Var4) {
                    objA2 = c1eVar;
                }
                return objA2 == tb2Var4 ? tb2Var4 : c1eVar;
            default:
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
                nib nibVar4 = this.d;
                vob vobVar = nibVar4.A;
                Set set = (Set) no7.s(vobVar, "auto_expanded", ny3.a);
                String str3 = this.e;
                if (set.contains(str3)) {
                    return c1eVar;
                }
                vobVar.d("auto_expanded", qo7.w(set, str3));
                b0f b0fVar5 = nibVar4.I;
                dib dibVar3 = new dib(nibVar4, str3, this.f, null, 2);
                this.c = 1;
                return b0fVar5.h(dibVar3, this) == tb2Var5 ? tb2Var5 : c1eVar;
        }
    }
}
