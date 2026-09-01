package defpackage;

import com.google.gson.JsonIOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b2b {
    public final String a;
    public final Field b;
    public final String c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ Method e;
    public final /* synthetic */ jud f;
    public final /* synthetic */ jud g;
    public final /* synthetic */ boolean h;
    public final /* synthetic */ boolean i;

    public b2b(String str, Field field, boolean z, Method method, jud judVar, jud judVar2, boolean z2, boolean z3) {
        this.d = z;
        this.e = method;
        this.f = judVar;
        this.g = judVar2;
        this.h = z2;
        this.i = z3;
        this.a = str;
        this.b = field;
        this.c = field.getName();
    }

    public final void a(yd6 yd6Var, Object obj) throws IllegalAccessException {
        Object objInvoke;
        boolean z = this.d;
        Field field = this.b;
        Method method = this.e;
        if (z) {
            if (method == null) {
                g2b.b(obj, field);
            } else {
                g2b.b(obj, method);
            }
        }
        if (method != null) {
            try {
                objInvoke = method.invoke(obj, null);
            } catch (InvocationTargetException e) {
                throw new JsonIOException(ev6.x("Accessor ", w1b.d(method, false), " threw exception"), e.getCause());
            }
        } else {
            objInvoke = field.get(obj);
        }
        if (objInvoke == obj) {
            return;
        }
        yd6Var.L(this.a);
        this.f.c(yd6Var, objInvoke);
    }
}
