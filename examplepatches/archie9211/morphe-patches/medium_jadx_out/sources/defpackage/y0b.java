package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class y0b extends u0b implements o86, c96 {
    @Override // defpackage.o86
    public final f0b a(y05 y05Var) {
        y05Var.getClass();
        Member memberB = b();
        memberB.getClass();
        Annotation[] declaredAnnotations = ((AnnotatedElement) memberB).getDeclaredAnnotations();
        if (declaredAnnotations != null) {
            return vn7.w(declaredAnnotations, y05Var);
        }
        return null;
    }

    public abstract Member b();

    public final n98 c() {
        String name = b().getName();
        return name != null ? n98.e(name) : olc.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x011e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.ArrayList d(java.lang.reflect.Type[] r13, java.lang.annotation.Annotation[][] r14, boolean r15) throws java.lang.IllegalAccessException, java.lang.reflect.InvocationTargetException {
        /*
            Method dump skipped, instruction units count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y0b.d(java.lang.reflect.Type[], java.lang.annotation.Annotation[][], boolean):java.util.ArrayList");
    }

    public final l6 e() {
        int modifiers = b().getModifiers();
        return Modifier.isPublic(modifiers) ? lwe.d : Modifier.isPrivate(modifiers) ? iwe.d : Modifier.isProtected(modifiers) ? Modifier.isStatic(modifiers) ? ua6.d : ta6.d : sa6.d;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof y0b) && g76.L(b(), ((y0b) obj).b());
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        Member memberB = b();
        memberB.getClass();
        Annotation[] declaredAnnotations = ((AnnotatedElement) memberB).getDeclaredAnnotations();
        return declaredAnnotations != null ? vn7.y(declaredAnnotations) : ey3.a;
    }

    public final int hashCode() {
        return b().hashCode();
    }

    public final String toString() {
        return getClass().getName() + ": " + b();
    }
}
