package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mm1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ou d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mm1(ou ouVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ouVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new mm1(this.d, n92Var, 0);
            case 1:
                return new mm1(this.d, n92Var, 1);
            case 2:
                return new mm1(this.d, n92Var, 2);
            case 3:
                return new mm1(this.d, n92Var, 3);
            case 4:
                return new mm1(this.d, n92Var, 4);
            case 5:
                return new mm1(this.d, n92Var, 5);
            case 6:
                return new mm1(this.d, n92Var, 6);
            case 7:
                return new mm1(this.d, n92Var, 7);
            case 8:
                return new mm1(this.d, n92Var, 8);
            default:
                return new mm1(this.d, n92Var, 9);
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
        return ((mm1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
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
                Float f = new Float(-30.0f);
                cud cudVarQ = f76.Q(300, 0, ao3.a, 2);
                this.c = 1;
                return ou.a(this.d, f, cudVarQ, null, this, 12) == tb2Var ? tb2Var : c1eVar;
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
                Float f2 = new Float(1.0f);
                cud cudVarQ2 = f76.Q(300, 0, ao3.a, 2);
                this.c = 1;
                return ou.a(this.d, f2, cudVarQ2, null, this, 12) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    Float f3 = new Float(0.0f);
                    this.c = 1;
                    return ou.a(this.d, f3, null, null, this, 14) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
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
                ou ouVar = this.d;
                Float f4 = new Float(((Number) ouVar.d()).floatValue() + 80.0f);
                cud cudVarQ3 = f76.Q(300, 0, null, 6);
                this.c = 1;
                return ou.a(ouVar, f4, cudVarQ3, null, this, 12) == tb2Var4 ? tb2Var4 : c1eVar;
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
                ou ouVar2 = this.d;
                Float f5 = new Float(((Number) ouVar2.d()).floatValue() + 80.0f);
                cud cudVarQ4 = f76.Q(300, 0, null, 6);
                this.c = 1;
                return ou.a(ouVar2, f5, cudVarQ4, null, this, 12) == tb2Var5 ? tb2Var5 : c1eVar;
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
                ou ouVar3 = this.d;
                Float f6 = new Float(((Number) ouVar3.d()).floatValue() + 80.0f);
                cud cudVarQ5 = f76.Q(300, 0, null, 6);
                this.c = 1;
                return ou.a(ouVar3, f6, cudVarQ5, null, this, 12) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
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
                Float f7 = new Float(0.0f);
                wlc wlcVarP = f76.P(0.5f, 200.0f, null, 4);
                this.c = 1;
                return ou.a(this.d, f7, wlcVarP, null, this, 12) == tb2Var7 ? tb2Var7 : c1eVar;
            case 7:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 != 0) {
                    if (i9 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Float f8 = new Float(0.0f);
                wlc wlcVarP2 = f76.P(0.5f, 200.0f, null, 4);
                this.c = 1;
                return ou.a(this.d, f8, wlcVarP2, null, this, 12) == tb2Var8 ? tb2Var8 : c1eVar;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Float f9 = new Float(0.0f);
                wlc wlcVarP3 = f76.P(0.0f, 0.0f, null, 7);
                this.c = 1;
                return ou.a(this.d, f9, wlcVarP3, null, this, 12) == tb2Var9 ? tb2Var9 : c1eVar;
            default:
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 != 0) {
                    if (i11 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Float f10 = new Float(0.0f);
                wlc wlcVarP4 = f76.P(0.0f, 0.0f, null, 7);
                this.c = 1;
                return ou.a(this.d, f10, wlcVarP4, null, this, 12) == tb2Var10 ? tb2Var10 : c1eVar;
        }
    }
}
