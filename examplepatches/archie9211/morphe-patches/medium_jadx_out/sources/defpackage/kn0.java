package defpackage;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class kn0 implements n92, ub2, Serializable {
    private final n92<Object> completion;

    public kn0(n92 n92Var) {
        this.completion = n92Var;
    }

    public n92<c1e> create(n92<?> n92Var) {
        n92Var.getClass();
        throw new UnsupportedOperationException("create(Continuation) has not been overridden");
    }

    public ub2 getCallerFrame() {
        n92<Object> n92Var = this.completion;
        if (n92Var instanceof ub2) {
            return (ub2) n92Var;
        }
        return null;
    }

    public final n92<Object> getCompletion() {
        return this.completion;
    }

    public StackTraceElement getStackTraceElement() {
        int iIntValue;
        String strC;
        Method method;
        Object objInvoke;
        Method method2;
        Object objInvoke2;
        uv2 uv2Var = (uv2) getClass().getAnnotation(uv2.class);
        String str = null;
        if (uv2Var == null || uv2Var.v() < 1) {
            return null;
        }
        try {
            Field declaredField = getClass().getDeclaredField("label");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(this);
            Integer num = obj instanceof Integer ? (Integer) obj : null;
            iIntValue = (num != null ? num.intValue() : 0) - 1;
        } catch (Exception unused) {
            iIntValue = -1;
        }
        int i = iIntValue >= 0 ? uv2Var.l()[iIntValue] : -1;
        ku3 ku3Var = g76.g;
        ku3 ku3Var2 = g76.h;
        if (ku3Var2 == null) {
            try {
                ku3 ku3Var3 = new ku3(Class.class.getDeclaredMethod("getModule", null), getClass().getClassLoader().loadClass("java.lang.Module").getDeclaredMethod("getDescriptor", null), getClass().getClassLoader().loadClass("java.lang.module.ModuleDescriptor").getDeclaredMethod("name", null), 20);
                g76.h = ku3Var3;
                ku3Var2 = ku3Var3;
            } catch (Exception unused2) {
                g76.h = ku3Var;
                ku3Var2 = ku3Var;
            }
        }
        if (ku3Var2 != ku3Var && (method = (Method) ku3Var2.b) != null && (objInvoke = method.invoke(getClass(), null)) != null && (method2 = (Method) ku3Var2.c) != null && (objInvoke2 = method2.invoke(objInvoke, null)) != null) {
            Method method3 = (Method) ku3Var2.d;
            Object objInvoke3 = method3 != null ? method3.invoke(objInvoke2, null) : null;
            if (objInvoke3 instanceof String) {
                str = (String) objInvoke3;
            }
        }
        if (str == null) {
            strC = uv2Var.c();
        } else {
            strC = str + '/' + uv2Var.c();
        }
        return new StackTraceElement(strC, uv2Var.m(), uv2Var.f(), i);
    }

    public abstract Object invokeSuspend(Object obj);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5 */
    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        ?? r2 = this;
        while (true) {
            kn0 kn0Var = (kn0) r2;
            n92<Object> n92Var = kn0Var.completion;
            n92Var.getClass();
            try {
                obj = kn0Var.invokeSuspend(obj);
                if (obj == tb2.COROUTINE_SUSPENDED) {
                    return;
                }
            } catch (Throwable th) {
                obj = new ajb(th);
            }
            kn0Var.releaseIntercepted();
            if (!(n92Var instanceof kn0)) {
                n92Var.resumeWith(obj);
                return;
            }
            r2 = n92Var;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("Continuation at ");
        Object stackTraceElement = getStackTraceElement();
        if (stackTraceElement == null) {
            stackTraceElement = getClass().getName();
        }
        sb.append(stackTraceElement);
        return sb.toString();
    }

    public n92<c1e> create(Object obj, n92<?> n92Var) {
        n92Var.getClass();
        throw new UnsupportedOperationException("create(Any?;Continuation) has not been overridden");
    }

    public void releaseIntercepted() {
    }
}
