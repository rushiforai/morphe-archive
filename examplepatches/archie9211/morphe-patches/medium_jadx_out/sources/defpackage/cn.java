package defpackage;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cn extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cn(Object obj, int i, Object obj2) {
        super(0);
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v32 */
    /* JADX WARN: Type inference failed for: r0v33, types: [q28] */
    /* JADX WARN: Type inference failed for: r0v35 */
    /* JADX WARN: Type inference failed for: r0v36, types: [q28] */
    /* JADX WARN: Type inference failed for: r0v37, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v38 */
    /* JADX WARN: Type inference failed for: r0v39 */
    /* JADX WARN: Type inference failed for: r0v40 */
    /* JADX WARN: Type inference failed for: r0v41 */
    /* JADX WARN: Type inference failed for: r0v65 */
    /* JADX WARN: Type inference failed for: r0v66 */
    /* JADX WARN: Type inference failed for: r1v13 */
    /* JADX WARN: Type inference failed for: r1v14 */
    /* JADX WARN: Type inference failed for: r1v15 */
    /* JADX WARN: Type inference failed for: r1v16, types: [o78] */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18 */
    /* JADX WARN: Type inference failed for: r1v19, types: [o78] */
    /* JADX WARN: Type inference failed for: r1v32 */
    /* JADX WARN: Type inference failed for: r1v33 */
    /* JADX WARN: Type inference failed for: r1v34 */
    /* JADX WARN: Type inference failed for: r1v35 */
    /* JADX WARN: Type inference failed for: r2v28 */
    @Override // defpackage.m45
    public final Object invoke() {
        zxb zxbVar;
        aq6 aq6Var;
        pi5 pi5Var;
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                sn snVar = (sn) obj;
                wrb wrbVar = (wrb) obj2;
                lrb lrbVar = wrbVar.e;
                lrb lrbVar2 = wrbVar.f;
                Float f = wrbVar.c;
                Float f2 = wrbVar.d;
                float fFloatValue = (lrbVar == null || f == null) ? 0.0f : ((Number) lrbVar.a.invoke()).floatValue() - f.floatValue();
                float fFloatValue2 = (lrbVar2 == null || f2 == null) ? 0.0f : ((Number) lrbVar2.a.invoke()).floatValue() - f2.floatValue();
                if (fFloatValue != 0.0f || fFloatValue2 != 0.0f) {
                    int iA = snVar.A(wrbVar.a);
                    byb bybVar = (byb) snVar.s().b(snVar.k);
                    if (bybVar != null) {
                        try {
                            y4 y4Var = snVar.m;
                            if (y4Var != null) {
                                y4Var.a.setBoundsInScreen(snVar.k(bybVar));
                            }
                            break;
                        } catch (IllegalStateException unused) {
                        }
                    }
                    byb bybVar2 = (byb) snVar.s().b(snVar.l);
                    if (bybVar2 != null) {
                        try {
                            y4 y4Var2 = snVar.n;
                            if (y4Var2 != null) {
                                y4Var2.a.setBoundsInScreen(snVar.k(bybVar2));
                            }
                            break;
                        } catch (IllegalStateException unused2) {
                        }
                    }
                    snVar.d.invalidate();
                    byb bybVar3 = (byb) snVar.s().b(iA);
                    if (bybVar3 != null && (zxbVar = bybVar3.a) != null && (aq6Var = zxbVar.c) != null) {
                        if (lrbVar != null) {
                            snVar.p.i(iA, lrbVar);
                        }
                        if (lrbVar2 != null) {
                            snVar.q.i(iA, lrbVar2);
                        }
                        snVar.w(aq6Var);
                    }
                }
                if (lrbVar != null) {
                    wrbVar.c = (Float) lrbVar.a.invoke();
                }
                if (lrbVar2 != null) {
                    wrbVar.d = (Float) lrbVar2.a.invoke();
                }
                break;
            case 3:
                break;
            case 4:
                m45 m45Var = (m45) obj2;
                if (m45Var == null || (r12 = (zwa) m45Var.invoke()) == null) {
                    eh8 eh8Var = (eh8) obj;
                    if (!eh8Var.O0().n) {
                        eh8Var = null;
                    }
                    if (eh8Var != null) {
                    }
                }
                break;
            case 5:
                ((c31) obj2).q.invoke((d31) obj);
                break;
            case 6:
                break;
            case 7:
                oa2 oa2Var = (oa2) obj2;
                tp8 tp8VarB = ((up8) oa2Var.d.getValue()).b();
                ((o32) obj).getClass();
                tp8VarB.c.add(new ky0(oa2Var.a));
                break;
            case 8:
                Locale locale = Locale.US;
                Throwable th = (Throwable) obj;
                th.getClass();
                StringWriter stringWriter = new StringWriter();
                th.printStackTrace(new PrintWriter(stringWriter));
                String string = stringWriter.toString();
                string.getClass();
                break;
            case 9:
                break;
            case 10:
                break;
            case 11:
                wue wueVar = (wue) ((vq6) obj).getValue();
                pi5Var = wueVar instanceof pi5 ? (pi5) wueVar : null;
                if (pi5Var == null || (r0 = pi5Var.getDefaultViewModelProviderFactory()) == null) {
                }
                break;
            case 12:
                ((rya) obj2).a = bo.K((bs4) obj, q99.a);
                break;
            case 13:
                ((rya) obj2).a = ((es4) obj).K0();
                break;
            case 14:
                ((vn5) obj2).d((q28) obj);
                break;
            case 15:
                hj0 hj0Var = ((aq6) obj2).F;
                rya ryaVar = (rya) obj;
                if ((((q28) hj0Var.g).d & 8) != 0) {
                    for (q28 q28Var = (ffd) hj0Var.f; q28Var != null; q28Var = q28Var.e) {
                        if ((q28Var.c & 8) != 0) {
                            ?? Q0 = q28Var;
                            ?? o78Var = 0;
                            while (Q0 != 0) {
                                if (Q0 instanceof xxb) {
                                    xxb xxbVar = (xxb) Q0;
                                    if (xxbVar.I()) {
                                        txb txbVar = new txb();
                                        ryaVar.a = txbVar;
                                        txbVar.d = true;
                                    }
                                    if (xxbVar.s0()) {
                                        ((txb) ryaVar.a).c = true;
                                    }
                                    xxbVar.r0((jyb) ryaVar.a);
                                } else if ((Q0.c & 8) != 0 && (Q0 instanceof b43)) {
                                    q28 q28Var2 = ((b43) Q0).p;
                                    int i2 = 0;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                    while (q28Var2 != null) {
                                        if ((q28Var2.c & 8) != 0) {
                                            i2++;
                                            o78Var = o78Var;
                                            if (i2 == 1) {
                                                Q0 = q28Var2;
                                            } else {
                                                if (o78Var == 0) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var.b(q28Var2);
                                            }
                                        }
                                        q28Var2 = q28Var2.f;
                                        Q0 = Q0;
                                        o78Var = o78Var;
                                    }
                                    if (i2 == 1) {
                                    }
                                }
                                Q0 = flb.q0(o78Var);
                            }
                        }
                    }
                }
                break;
            case 16:
                tjb tjbVar = eh8.N;
                ((x45) obj2).invoke(tjbVar);
                eh8 eh8Var2 = (eh8) obj;
                boolean zL = g76.L(eh8Var2.D, tjbVar.o);
                boolean z = eh8Var2.E;
                boolean z2 = tjbVar.p;
                boolean z3 = z != z2;
                if (!zL || z3) {
                    eh8Var2.D = tjbVar.o;
                    eh8Var2.E = z2;
                    if (eh8Var2.F && (z3 || (z2 && !zL))) {
                        eh8Var2.o.F();
                    }
                }
                eh8Var2.F = true;
                tjbVar.w = tjbVar.o.a(tjbVar.r, tjbVar.t, tjbVar.s);
                break;
            case 17:
                wue wueVar2 = (wue) ((vq6) obj).getValue();
                pi5Var = wueVar2 instanceof pi5 ? (pi5) wueVar2 : null;
                if (pi5Var == null || (r0 = pi5Var.getDefaultViewModelProviderFactory()) == null) {
                }
                break;
            case 18:
                break;
            case 19:
                wue wueVar3 = (wue) ((vq6) obj).getValue();
                pi5Var = wueVar3 instanceof pi5 ? (pi5) wueVar3 : null;
                if (pi5Var == null || (r0 = pi5Var.getDefaultViewModelProviderFactory()) == null) {
                }
                break;
            case 20:
                wue wueVar4 = (wue) ((vq6) obj).getValue();
                pi5Var = wueVar4 instanceof pi5 ? (pi5) wueVar4 : null;
                if (pi5Var == null || (r0 = pi5Var.getDefaultViewModelProviderFactory()) == null) {
                }
                break;
            case 21:
                wue wueVar5 = (wue) ((vq6) obj).getValue();
                pi5Var = wueVar5 instanceof pi5 ? (pi5) wueVar5 : null;
                if (pi5Var == null || (r0 = pi5Var.getDefaultViewModelProviderFactory()) == null) {
                }
                break;
            case 22:
                wue wueVar6 = (wue) ((vq6) obj).getValue();
                pi5Var = wueVar6 instanceof pi5 ? (pi5) wueVar6 : null;
                if (pi5Var == null || (r0 = pi5Var.getDefaultViewModelProviderFactory()) == null) {
                }
                break;
            case 23:
                ((x0) obj2).removeOnAttachStateChangeListener((q15) obj);
                break;
            default:
                ((wx6) obj2).b((di4) obj);
                break;
        }
        return c1eVar;
    }
}
