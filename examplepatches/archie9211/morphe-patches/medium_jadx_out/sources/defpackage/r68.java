package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r68 extends ih7 {
    public final p89 d;
    public Object e;

    public r68(p89 p89Var, Object obj, Object obj2) {
        super(obj, 0, obj2);
        this.d = p89Var;
        this.e = obj2;
    }

    @Override // defpackage.ih7, java.util.Map.Entry
    public final Object getValue() {
        return this.e;
    }

    @Override // defpackage.ih7, java.util.Map.Entry
    public final Object setValue(Object obj) {
        Object obj2 = this.e;
        this.e = obj;
        n89 n89Var = (n89) this.d.b;
        m89 m89Var = n89Var.d;
        Object obj3 = this.b;
        if (!m89Var.containsKey(obj3)) {
            return obj2;
        }
        boolean z = n89Var.c;
        if (!z) {
            m89Var.put(obj3, obj);
        } else {
            if (!z) {
                ywb.n();
                return null;
            }
            atd atdVar = n89Var.a[n89Var.b];
            Object obj4 = atdVar.a[atdVar.c];
            m89Var.put(obj3, obj);
            n89Var.c(obj4 != null ? obj4.hashCode() : 0, m89Var.b, obj4, 0);
        }
        n89Var.g = m89Var.d;
        return obj2;
    }
}
