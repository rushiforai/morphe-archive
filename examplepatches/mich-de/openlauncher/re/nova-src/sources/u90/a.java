package u90;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes5.dex */
public final class a implements InvocationHandler {

    /* renamed from: a, reason: collision with root package name */
    public final Object f90709a;

    public a(Object obj) {
        this.f90709a = obj;
    }

    public final Object a() {
        return this.f90709a;
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        boolean z11 = obj instanceof a;
        Object obj2 = this.f90709a;
        return z11 ? obj2.equals(((a) obj).f90709a) : obj2.equals(obj);
    }

    public final int hashCode() {
        return this.f90709a.hashCode();
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) throws Throwable {
        Object obj2 = this.f90709a;
        try {
            return Class.forName(method.getDeclaringClass().getName(), true, obj2.getClass().getClassLoader()).getDeclaredMethod(method.getName(), method.getParameterTypes()).invoke(obj2, objArr);
        } catch (InvocationTargetException e3) {
            throw e3.getTargetException();
        } catch (ReflectiveOperationException e11) {
            throw new RuntimeException("Reflection failed for method " + method, e11);
        }
    }
}
