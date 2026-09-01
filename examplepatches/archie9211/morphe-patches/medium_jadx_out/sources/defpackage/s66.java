package defpackage;

import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class s66 implements v41 {
    public final Method a;
    public final List b;
    public final Class c;

    public s66(Method method, List list) {
        this.a = method;
        this.b = list;
        Class<?> returnType = method.getReturnType();
        returnType.getClass();
        this.c = returnType;
    }

    @Override // defpackage.v41
    public final List a() {
        return this.b;
    }

    @Override // defpackage.v41
    public final Member b() {
        return null;
    }

    @Override // defpackage.v41
    public final boolean c() {
        return false;
    }

    public final void d(Object[] objArr) {
        objArr.getClass();
        List list = this.b;
        if (list.size() == objArr.length) {
            return;
        }
        StringBuilder sb = new StringBuilder("Callable expects ");
        sb.append(list.size());
        sb.append(" arguments, but ");
        ay0.e(ho2.H(sb, objArr.length, " were provided."));
    }

    @Override // defpackage.v41
    public final Type getReturnType() {
        return this.c;
    }
}
