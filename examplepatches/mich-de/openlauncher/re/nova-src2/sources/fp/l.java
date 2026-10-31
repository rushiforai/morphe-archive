package fp;

import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import cp.z;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes4.dex */
public abstract class l extends z {

    /* renamed from: a, reason: collision with root package name */
    public final n f55521a;

    public l(n nVar) {
        this.f55521a = nVar;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) {
        if (aVar.f0() == 9) {
            aVar.V();
            return null;
        }
        Object objD = d();
        Map map = this.f55521a.f55524a;
        try {
            aVar.b();
            while (aVar.p()) {
                k kVar = (k) map.get(aVar.P());
                if (kVar == null) {
                    aVar.l0();
                } else {
                    f(objD, aVar, kVar);
                }
            }
            aVar.f();
            return e(objD);
        } catch (IllegalAccessException e3) {
            g90.k kVar2 = hp.c.f59955a;
            throw new RuntimeException("Unexpected IllegalAccessException occurred (Gson 2.13.1). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e3);
        } catch (IllegalStateException e11) {
            throw new JsonSyntaxException(e11);
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException, IllegalArgumentException, InvocationTargetException {
        if (obj == null) {
            bVar.p();
            return;
        }
        bVar.c();
        try {
            Iterator it = this.f55521a.f55525b.iterator();
            while (it.hasNext()) {
                ((k) it.next()).a(bVar, obj);
            }
            bVar.f();
        } catch (IllegalAccessException e3) {
            g90.k kVar = hp.c.f59955a;
            throw new RuntimeException("Unexpected IllegalAccessException occurred (Gson 2.13.1). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e3);
        }
    }

    public abstract Object d();

    public abstract Object e(Object obj);

    public abstract void f(Object obj, kp.a aVar, k kVar);
}
