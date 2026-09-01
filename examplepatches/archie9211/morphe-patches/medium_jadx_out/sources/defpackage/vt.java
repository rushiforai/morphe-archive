package defpackage;

import android.graphics.Canvas;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vt extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vt(due dueVar, aq6 aq6Var, due dueVar2) {
        super(1);
        this.a = 0;
        this.b = dueVar;
        this.d = aq6Var;
        this.c = dueVar2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Throwable {
        xl3 xl3Var;
        int i = this.a;
        boolean zBooleanValue = false;
        Object[] objArr = 0;
        c1e c1eVar = c1e.a;
        nrdVar = null;
        nrd nrdVar = null;
        Object obj2 = this.c;
        Object obj3 = this.d;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                due dueVar = (due) obj4;
                aq6 aq6Var = (aq6) obj3;
                due dueVar2 = (due) obj2;
                e61 e61VarX = ((zl3) obj).b0().x();
                if (dueVar.getView().getVisibility() != 8) {
                    dueVar.y = true;
                    mx8 mx8Var = aq6Var.n;
                    mn mnVar = mx8Var instanceof mn ? (mn) mx8Var : null;
                    if (mnVar != null) {
                        Canvas canvasA = qm.a(e61VarX);
                        mnVar.getAndroidViewsHandler$ui().getClass();
                        dueVar2.draw(canvasA);
                    }
                    dueVar.y = false;
                }
                return c1eVar;
            case 1:
                return new dv((ejc) obj4, obj2, (ov) obj3, objArr == true ? 1 : 0);
            case 2:
                ssd ssdVar = (ssd) obj;
                dk3 dk3Var = (dk3) ssdVar;
                if (!((ap) ((mn) flb.w0((dk3) obj2)).m134getDragAndDropManager()).b.contains(dk3Var) || !kyd.L(dk3Var, o7f.y((md5) obj3))) {
                    return rsd.ContinueTraversal;
                }
                ((rya) obj4).a = ssdVar;
                return rsd.CancelTraversal;
            case 3:
                tjb tjbVar = (tjb) obj;
                upc upcVar = (upc) obj2;
                upc upcVar2 = (upc) obj4;
                tjbVar.c(upcVar2 != null ? ((Number) upcVar2.getValue()).floatValue() : 1.0f);
                tjbVar.k(upcVar != null ? ((Number) upcVar.getValue()).floatValue() : 1.0f);
                tjbVar.l(upcVar != null ? ((Number) upcVar.getValue()).floatValue() : 1.0f);
                upc upcVar3 = (upc) obj3;
                tjbVar.s(upcVar3 != null ? ((nrd) upcVar3.getValue()).a : nrd.b);
                return c1eVar;
            case 4:
                k54 k54Var = (k54) obj3;
                int i2 = pz3.a[((jz3) obj).ordinal()];
                if (i2 == 1) {
                    nrdVar = (nrd) obj4;
                } else {
                    if (i2 != 2 && i2 != 3) {
                        ygf.a();
                        return null;
                    }
                    esd esdVar = k54Var.a;
                }
                return new nrd(nrdVar != null ? nrdVar.a : nrd.b);
            case 5:
                es4 es4Var = (es4) obj;
                if (!g76.L(es4Var, (es4) obj4)) {
                    if (g76.L(es4Var, ((or4) obj2).c)) {
                        ygf.f("Focus search landed at the root.");
                        return null;
                    }
                    zBooleanValue = ((Boolean) ((x45) obj3).invoke(es4Var)).booleanValue();
                }
                return Boolean.valueOf(zBooleanValue);
            default:
                zl3 zl3Var = (zl3) obj;
                cq6 cq6Var = (cq6) obj4;
                g61 g61Var = cq6Var.a;
                xl3 xl3Var2 = cq6Var.b;
                cq6Var.b = (xl3) obj2;
                try {
                    m73 m73VarY = zl3Var.b0().y();
                    ip6 ip6VarA = zl3Var.b0().A();
                    e61 e61VarX2 = zl3Var.b0().x();
                    long jB = zl3Var.b0().B();
                    of5 of5Var = (of5) zl3Var.b0().c;
                    x45 x45Var = (x45) obj3;
                    m73 m73VarY2 = g61Var.b.y();
                    ip6 ip6VarA2 = g61Var.b.A();
                    e61 e61VarX3 = g61Var.b.x();
                    long jB2 = g61Var.b.B();
                    m50 m50Var = g61Var.b;
                    try {
                        of5 of5Var2 = (of5) m50Var.c;
                        m50Var.O(m73VarY);
                        m50Var.P(ip6VarA);
                        m50Var.M(e61VarX2);
                        m50Var.Q(jB);
                        m50Var.c = of5Var;
                        e61VarX2.h();
                        try {
                            x45Var.invoke(cq6Var);
                            e61VarX2.q();
                            m50 m50Var2 = g61Var.b;
                            m50Var2.O(m73VarY2);
                            m50Var2.P(ip6VarA2);
                            m50Var2.M(e61VarX3);
                            m50Var2.Q(jB2);
                            m50Var2.c = of5Var2;
                            cq6Var.b = xl3Var2;
                            return c1eVar;
                        } catch (Throwable th) {
                            xl3Var = xl3Var2;
                            try {
                                e61VarX2.q();
                                m50 m50Var3 = g61Var.b;
                                m50Var3.O(m73VarY2);
                                m50Var3.P(ip6VarA2);
                                m50Var3.M(e61VarX3);
                                m50Var3.Q(jB2);
                                m50Var3.c = of5Var2;
                                throw th;
                            } catch (Throwable th2) {
                                th = th2;
                                cq6Var.b = xl3Var;
                                throw th;
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        xl3Var = xl3Var2;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    xl3Var = xl3Var2;
                }
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vt(Object obj, Object obj2, Object obj3, int i) {
        super(1);
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
