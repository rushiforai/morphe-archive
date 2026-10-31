package m90;

import java.io.FileNotFoundException;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public static final u f76144a;

    static {
        u uVar;
        try {
            Class.forName("java.nio.file.Files");
            uVar = new v();
        } catch (ClassNotFoundException unused) {
            uVar = new u();
        }
        f76144a = uVar;
        String str = z.f76176b;
        String property = System.getProperty("java.io.tmpdir");
        Intrinsics.f(property, "getProperty(...)");
        br.a.u(property, false);
        ClassLoader classLoader = n90.g.class.getClassLoader();
        Intrinsics.f(classLoader, "getClassLoader(...)");
        new n90.g(classLoader);
    }

    public abstract h0 a(z zVar);

    public abstract void b(z zVar, z zVar2);

    public final void c(z zVar) {
        ArrayDeque arrayDeque = new ArrayDeque();
        while (zVar != null && !g(zVar)) {
            arrayDeque.addFirst(zVar);
            zVar = zVar.c();
        }
        Iterator<E> it = arrayDeque.iterator();
        while (it.hasNext()) {
            z dir = (z) it.next();
            Intrinsics.g(dir, "dir");
            d(dir);
        }
    }

    public abstract void d(z zVar);

    public abstract void e(z zVar);

    public final void f(z path) {
        Intrinsics.g(path, "path");
        e(path);
    }

    public final boolean g(z path) {
        Intrinsics.g(path, "path");
        return j(path) != null;
    }

    public abstract List h(z zVar);

    public final h4.e i(z path) throws FileNotFoundException {
        Intrinsics.g(path, "path");
        h4.e eVarJ = j(path);
        if (eVarJ != null) {
            return eVarJ;
        }
        throw new FileNotFoundException("no such file: " + path);
    }

    public abstract h4.e j(z zVar);

    public abstract t k(z zVar);

    public abstract t l(z zVar);

    public abstract h0 m(z zVar);

    public abstract j0 n(z zVar);
}
