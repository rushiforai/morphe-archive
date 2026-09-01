package defpackage;

import java.util.Date;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yb6 implements uy3 {
    public static final wb6 f;
    public static final wb6 g;
    public final HashMap a;
    public final HashMap b;
    public final vb6 c;
    public boolean d;
    public static final vb6 e = new vb6(0);
    public static final xb6 h = new xb6();

    /* JADX WARN: Type inference failed for: r0v1, types: [wb6] */
    /* JADX WARN: Type inference failed for: r0v2, types: [wb6] */
    static {
        final int i = 0;
        f = new eqe() { // from class: wb6
            @Override // defpackage.ty3
            public final void a(Object obj, Object obj2) {
                switch (i) {
                    case 0:
                        ((fqe) obj2).b((String) obj);
                        break;
                    default:
                        ((fqe) obj2).c(((Boolean) obj).booleanValue());
                        break;
                }
            }
        };
        final int i2 = 1;
        g = new eqe() { // from class: wb6
            @Override // defpackage.ty3
            public final void a(Object obj, Object obj2) {
                switch (i2) {
                    case 0:
                        ((fqe) obj2).b((String) obj);
                        break;
                    default:
                        ((fqe) obj2).c(((Boolean) obj).booleanValue());
                        break;
                }
            }
        };
    }

    public yb6() {
        HashMap map = new HashMap();
        this.a = map;
        HashMap map2 = new HashMap();
        this.b = map2;
        this.c = e;
        this.d = false;
        map2.put(String.class, f);
        map.remove(String.class);
        map2.put(Boolean.class, g);
        map.remove(Boolean.class);
        map2.put(Date.class, h);
        map.remove(Date.class);
    }

    public final uy3 a(Class cls, lm8 lm8Var) {
        this.a.put(cls, lm8Var);
        this.b.remove(cls);
        return this;
    }
}
