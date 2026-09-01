package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uo0 implements hhd {
    public final mz1 a;
    public final z78 b = new z78();
    public final k49 c = qo7.u(null);

    public uo0(mz1 mz1Var) {
        this.a = mz1Var;
    }

    @Override // defpackage.hhd
    public final Object a(ygd ygdVar, p4d p4dVar) {
        Object objA = z78.a(this.b, new il(this, new to0(ygdVar), null, 4), p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public final void b(final m45 m45Var, x12 x12Var, final int i) {
        final m45 m45Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(723898654);
        int i2 = (p65Var.f(this) ? 32 : 16) | i;
        final int i3 = 0;
        final int i4 = 1;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            to0 to0Var = (to0) this.c.getValue();
            if (to0Var == null) {
                mwa mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new b55(this, m45Var, i, i3) { // from class: so0
                        public final /* synthetic */ int a;
                        public final /* synthetic */ uo0 b;
                        public final /* synthetic */ m45 c;

                        {
                            this.a = i3;
                            this.b = this;
                        }

                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i5 = this.a;
                            c1e c1eVar = c1e.a;
                            m45 m45Var3 = this.c;
                            uo0 uo0Var = this.b;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i5) {
                                case 0:
                                    uo0Var.b(m45Var3, x12Var2, tr7.y(7));
                                    break;
                                default:
                                    uo0Var.b(m45Var3, x12Var2, tr7.y(7));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    return;
                }
                return;
            }
            m45Var2 = m45Var;
            this.a.s(to0Var, to0Var.a, m45Var2, p65Var, 384);
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            mwaVarS2.d = new b55(this, m45Var2, i, i4) { // from class: so0
                public final /* synthetic */ int a;
                public final /* synthetic */ uo0 b;
                public final /* synthetic */ m45 c;

                {
                    this.a = i4;
                    this.b = this;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i5 = this.a;
                    c1e c1eVar = c1e.a;
                    m45 m45Var3 = this.c;
                    uo0 uo0Var = this.b;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i5) {
                        case 0:
                            uo0Var.b(m45Var3, x12Var2, tr7.y(7));
                            break;
                        default:
                            uo0Var.b(m45Var3, x12Var2, tr7.y(7));
                            break;
                    }
                    return c1eVar;
                }
            };
        }
    }
}
