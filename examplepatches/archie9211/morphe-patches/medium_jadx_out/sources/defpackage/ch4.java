package defpackage;

import java.io.Closeable;
import java.io.FileNotFoundException;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ch4 implements Closeable {
    public static final ig6 a;
    public static final g59 b;

    static {
        ig6 ig6Var;
        try {
            Class.forName("java.nio.file.Files");
            ig6Var = new mg8();
        } catch (ClassNotFoundException unused) {
            ig6Var = new ig6();
        }
        a = ig6Var;
        String str = g59.b;
        String property = System.getProperty("java.io.tmpdir");
        property.getClass();
        b = cd7.r(property);
        ClassLoader classLoader = ncb.class.getClassLoader();
        classLoader.getClass();
        new ncb(classLoader);
    }

    public abstract void B(g59 g59Var);

    public abstract void D(g59 g59Var);

    public final void I(g59 g59Var) {
        g59Var.getClass();
        D(g59Var);
    }

    public final boolean L(g59 g59Var) {
        g59Var.getClass();
        return R(g59Var) != null;
    }

    public abstract List N(g59 g59Var);

    public final w73 Q(g59 g59Var) throws FileNotFoundException {
        g59Var.getClass();
        w73 w73VarR = R(g59Var);
        if (w73VarR != null) {
            return w73VarR;
        }
        fm3.g("no such file: ", g59Var);
        return null;
    }

    public abstract w73 R(g59 g59Var);

    public abstract we6 T(g59 g59Var);

    public abstract bfc U(g59 g59Var, boolean z);

    public abstract bfc f(g59 g59Var);

    public abstract ikc g0(g59 g59Var);

    public abstract void m(g59 g59Var, g59 g59Var2);

    public final void p(g59 g59Var) {
        m70 m70Var = new m70();
        while (g59Var != null && !L(g59Var)) {
            m70Var.addFirst(g59Var);
            g59Var = g59Var.c();
        }
        Iterator<E> it2 = m70Var.iterator();
        while (it2.hasNext()) {
            B((g59) it2.next());
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
