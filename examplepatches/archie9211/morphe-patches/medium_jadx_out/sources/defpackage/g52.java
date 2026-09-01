package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g52 {
    public Object a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public g52(h52 h52Var) {
        this(pwe.b);
        this.b = 1;
        this.c = h52Var;
    }

    public final void a(fj6 fj6Var, Object obj) {
        m21 m21VarH;
        fj6Var.getClass();
        Object obj2 = this.a;
        Object obj3 = this.c;
        int i = this.b;
        fj6Var.getClass();
        switch (i) {
            case 2:
                if (((a93) obj3).a) {
                    ygf.f("Cannot modify readonly DescriptorRendererOptions");
                }
                break;
        }
        this.a = obj;
        switch (i) {
            case 0:
                ze3 ze3Var = (ze3) obj;
                q21 q21Var = ((h52) obj3).b;
                String name = fj6Var.getName();
                m50 m50Var = ze3Var.a;
                m50 m50Var2 = ze3Var.c;
                m50 m50Var3 = ze3Var.b;
                vj3 vj3Var = (vj3) m50Var3.b;
                String str = (String) m50Var3.c;
                if (vj3Var == null && str == null && ((vj3) m50Var2.b) == null && ((String) m50Var2.c) == null) {
                    m21VarH = m50Var.h();
                } else {
                    q21 q21Var2 = new q21(new char[0]);
                    if (((vj3) m50Var3.b) != null || str != null) {
                        q21Var2.I("min", m50Var3.h());
                    }
                    if (((vj3) m50Var2.b) != null || ((String) m50Var2.c) != null) {
                        q21Var2.I("max", m50Var2.h());
                    }
                    q21Var2.I("value", m50Var.h());
                    m21VarH = q21Var2;
                }
                q21Var.I(name, m21VarH);
                break;
            case 1:
                ((h52) obj3).b.J(fj6Var.getName(), ((pwe) obj).a);
                break;
            default:
                fj6Var.getClass();
                break;
        }
    }

    public final String toString() {
        return "ObservableProperty(value=" + this.a + ')';
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public g52(Object obj, a93 a93Var) {
        this(obj);
        this.b = 2;
        this.c = a93Var;
    }

    public g52(Object obj) {
        this.a = obj;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public g52(h52 h52Var, ze3 ze3Var) {
        this(ze3Var);
        this.b = 0;
        this.c = h52Var;
    }
}
