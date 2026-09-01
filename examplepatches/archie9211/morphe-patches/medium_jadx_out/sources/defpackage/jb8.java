package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jb8 extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public int c;
    public float d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jb8(float f, hwb hwbVar, ba8 ba8Var, n92 n92Var) {
        super(2, n92Var);
        this.d = f;
        this.e = hwbVar;
        this.f = ba8Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                return new jb8(this.d, (hwb) this.e, (ba8) obj2, n92Var);
            case 1:
                return new jb8((ms) this.e, this.d, (ww) obj2, n92Var);
            default:
                jb8 jb8Var = new jb8((dsd) obj2, n92Var);
                jb8Var.e = obj;
                return jb8Var;
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
        return ((jb8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        float fS;
        sb2 sb2Var;
        int i = this.b;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                hwb hwbVar = (hwb) this.e;
                float f = this.d;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    if (f > 0.0f) {
                        this.c = 1;
                        if (hwbVar.B0(f, hwbVar.c.getValue(), this) != tb2Var) {
                        }
                    }
                    return tb2Var;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (f != 0.0f) {
                    return c1eVar;
                }
                ba8 ba8Var = (ba8) obj2;
                this.c = 2;
                dsd dsdVar = hwbVar.f;
                if (dsdVar == null || ((g76.L(hwbVar.d.getValue(), ba8Var) && g76.L(hwbVar.c.getValue(), ba8Var)) || (objA = a88.a(hwbVar.m, new bwb(hwbVar, ba8Var, dsdVar, (n92) null), this)) != tb2Var)) {
                    objA = c1eVar;
                }
                if (objA != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    return ou.a((ou) ((ms) this.e).c, new Float(this.d), (ww) obj2, null, this, 12) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    sb2 sb2Var2 = (sb2) this.e;
                    fS = tr7.s(sb2Var2.Q());
                    sb2Var = sb2Var2;
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    fS = this.d;
                    sb2Var = (sb2) this.e;
                    br7.v(obj);
                }
                while (o7f.B(sb2Var)) {
                    b4a b4aVar = new b4a(fS, i2, (dsd) obj2);
                    this.e = sb2Var;
                    this.d = fS;
                    this.c = 1;
                    if (gr7.o(getContext()).a(b4aVar, this) == tb2Var3) {
                        return tb2Var3;
                    }
                }
                return c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jb8(ms msVar, float f, ww wwVar, n92 n92Var) {
        super(2, n92Var);
        this.e = msVar;
        this.d = f;
        this.f = wwVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jb8(dsd dsdVar, n92 n92Var) {
        super(2, n92Var);
        this.f = dsdVar;
    }
}
