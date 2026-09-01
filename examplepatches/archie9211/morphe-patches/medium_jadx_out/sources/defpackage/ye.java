package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ye extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ int c;
    public /* synthetic */ qz8 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ye(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        Number number = (Number) obj;
        switch (i) {
            case 0:
                int iIntValue = number.intValue();
                ye yeVar = new ye(i2, 0, (n92) obj3);
                yeVar.c = iIntValue;
                yeVar.d = (qz8) obj2;
                return yeVar.invokeSuspend(c1eVar);
            case 1:
                int iIntValue2 = number.intValue();
                ye yeVar2 = new ye(i2, 1, (n92) obj3);
                yeVar2.c = iIntValue2;
                yeVar2.d = (qz8) obj2;
                return yeVar2.invokeSuspend(c1eVar);
            case 2:
                int iIntValue3 = number.intValue();
                ye yeVar3 = new ye(i2, 2, (n92) obj3);
                yeVar3.c = iIntValue3;
                yeVar3.d = (qz8) obj2;
                return yeVar3.invokeSuspend(c1eVar);
            case 3:
                int iIntValue4 = number.intValue();
                ye yeVar4 = new ye(i2, i2, (n92) obj3);
                yeVar4.c = iIntValue4;
                yeVar4.d = (qz8) obj2;
                return yeVar4.invokeSuspend(c1eVar);
            case 4:
                int iIntValue5 = number.intValue();
                ye yeVar5 = new ye(i2, 4, (n92) obj3);
                yeVar5.c = iIntValue5;
                yeVar5.d = (qz8) obj2;
                return yeVar5.invokeSuspend(c1eVar);
            default:
                int iIntValue6 = number.intValue();
                ye yeVar6 = new ye(i2, 5, (n92) obj3);
                yeVar6.c = iIntValue6;
                yeVar6.d = (qz8) obj2;
                return yeVar6.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        pz8 pz8Var = pz8.a;
        switch (i) {
            case 0:
                int i2 = this.c;
                qz8 qz8Var = this.d;
                br7.v(obj);
                if (i2 < 0) {
                    ygf.f("Total count should be provided");
                } else if (!(qz8Var instanceof nz8)) {
                    if (qz8Var instanceof oz8) {
                        oz8 oz8Var = (oz8) qz8Var;
                    } else if (!g76.L(qz8Var, pz8Var)) {
                        ygf.a();
                    }
                }
                break;
            case 1:
                int i3 = this.c;
                qz8 qz8Var2 = this.d;
                br7.v(obj);
                if (i3 < 0) {
                    ygf.f("Total count should be provided");
                } else if (!(qz8Var2 instanceof nz8)) {
                    if (qz8Var2 instanceof oz8) {
                        oz8 oz8Var2 = (oz8) qz8Var2;
                    } else if (!g76.L(qz8Var2, pz8Var)) {
                        ygf.a();
                    }
                }
                break;
            case 2:
                int i4 = this.c;
                qz8 qz8Var3 = this.d;
                br7.v(obj);
                if (i4 < 0) {
                    ygf.f("Total count should be provided");
                } else if (!(qz8Var3 instanceof nz8)) {
                    if (qz8Var3 instanceof oz8) {
                        oz8 oz8Var3 = (oz8) qz8Var3;
                    } else if (!g76.L(qz8Var3, pz8Var)) {
                        ygf.a();
                    }
                }
                break;
            case 3:
                int i5 = this.c;
                qz8 qz8Var4 = this.d;
                br7.v(obj);
                if (!(qz8Var4 instanceof nz8)) {
                    if (qz8Var4 instanceof oz8) {
                        oz8 oz8Var4 = (oz8) qz8Var4;
                    } else if (!g76.L(qz8Var4, pz8Var)) {
                        ygf.a();
                    }
                }
                break;
            case 4:
                int i6 = this.c;
                qz8 qz8Var5 = this.d;
                br7.v(obj);
                if (!(qz8Var5 instanceof nz8)) {
                    if (qz8Var5 instanceof oz8) {
                        oz8 oz8Var5 = (oz8) qz8Var5;
                    } else if (!g76.L(qz8Var5, pz8Var)) {
                        ygf.a();
                    }
                }
                break;
            default:
                int i7 = this.c;
                qz8 qz8Var6 = this.d;
                br7.v(obj);
                if (!(qz8Var6 instanceof nz8)) {
                    if (qz8Var6 instanceof oz8) {
                        oz8 oz8Var6 = (oz8) qz8Var6;
                    } else if (!g76.L(qz8Var6, pz8Var)) {
                        ygf.a();
                    }
                }
                break;
        }
        return null;
    }
}
