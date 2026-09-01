package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bwb extends p4d implements x45 {
    public final /* synthetic */ int b = 0;
    public int c;
    public final /* synthetic */ hwb d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ dsd f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bwb(dsd dsdVar, hwb hwbVar, Object obj, n92 n92Var) {
        super(1, n92Var);
        this.f = dsdVar;
        this.d = hwbVar;
        this.e = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        dsd dsdVar = this.f;
        Object obj = this.e;
        hwb hwbVar = this.d;
        switch (i) {
            case 0:
                return new bwb(dsdVar, hwbVar, obj, n92Var);
            default:
                return new bwb(hwbVar, obj, dsdVar, n92Var);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
        }
        return ((bwb) create(n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                dsd dsdVar = this.f;
                if (i2 == 0) {
                    br7.v(obj);
                    uk8 uk8Var = new uk8(this.d, this.e, dsdVar, null, 23);
                    this.c = 1;
                    if (o7f.s(uk8Var, this) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                dsdVar.i();
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                dsd dsdVar2 = this.f;
                if (i3 == 0) {
                    br7.v(obj);
                    hwb hwbVar = this.d;
                    hwbVar.x0();
                    k49 k49Var = hwbVar.c;
                    hwbVar.n = Long.MIN_VALUE;
                    hwbVar.D0(0.0f);
                    Object value = hwbVar.d.getValue();
                    Object obj2 = this.e;
                    float f = obj2.equals(value) ? -4.0f : obj2.equals(k49Var.getValue()) ? -5.0f : -3.0f;
                    dsdVar2.p(obj2);
                    dsdVar2.n(0L);
                    k49Var.setValue(obj2);
                    hwbVar.D0(0.0f);
                    hwbVar.t0(obj2);
                    dsdVar2.j(f);
                    if (f == -3.0f) {
                        this.c = 1;
                        if (hwbVar.G0(this) == tb2Var2) {
                        }
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                dsdVar2.i();
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bwb(hwb hwbVar, Object obj, dsd dsdVar, n92 n92Var) {
        super(1, n92Var);
        this.d = hwbVar;
        this.e = obj;
        this.f = dsdVar;
    }
}
