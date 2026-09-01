package defpackage;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import kotlin.reflect.full.IllegalPropertyDelegateAccessException;

/* JADX INFO: loaded from: classes5.dex */
public final class ui6 implements m45 {
    public final /* synthetic */ int a;
    public final wi6 b;

    public /* synthetic */ ui6(wi6 wi6Var, int i) {
        this.a = i;
        this.b = wi6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws IllegalPropertyDelegateAccessException {
        int i = this.a;
        wi6 wi6Var = this.b;
        switch (i) {
            case 0:
                return new vi6(wi6Var);
            default:
                Object objC = wi6Var.C();
                try {
                    Object obj = mj6.n;
                    Object objD = wi6Var.B() ? wi6Var.D() : null;
                    if (objD == obj) {
                        objD = null;
                    }
                    wi6Var.B();
                    AccessibleObject accessibleObject = ((AccessibleObject) objC) != null ? (AccessibleObject) objC : null;
                    if (accessibleObject != null) {
                        accessibleObject.setAccessible(ht2.s0(wi6Var));
                    }
                    if (objC == null) {
                        return null;
                    }
                    if (objC instanceof Field) {
                        return ((Field) objC).get(objD);
                    }
                    if (!(objC instanceof Method)) {
                        throw new AssertionError("delegate field/method " + objC + " neither field nor method");
                    }
                    int length = ((Method) objC).getParameterTypes().length;
                    if (length == 0) {
                        return ((Method) objC).invoke(null, null);
                    }
                    if (length == 1) {
                        Method method = (Method) objC;
                        if (objD == null) {
                            Class<?> cls = ((Method) objC).getParameterTypes()[0];
                            cls.getClass();
                            objD = bpe.e(cls);
                        }
                        return method.invoke(null, objD);
                    }
                    if (length == 2) {
                        Method method2 = (Method) objC;
                        Class<?> cls2 = ((Method) objC).getParameterTypes()[1];
                        cls2.getClass();
                        return method2.invoke(null, objD, bpe.e(cls2));
                    }
                    throw new AssertionError("delegate method " + objC + " should take 0, 1, or 2 parameters");
                } catch (IllegalAccessException e) {
                    throw new IllegalPropertyDelegateAccessException("Cannot obtain the delegate of a non-accessible property. Use \"isAccessible = true\" to make the property accessible", e);
                }
        }
    }
}
