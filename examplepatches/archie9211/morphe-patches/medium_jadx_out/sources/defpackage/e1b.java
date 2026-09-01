package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.TypeVariable;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e1b extends u0b implements o86, s86 {
    public final TypeVariable a;

    public e1b(TypeVariable typeVariable) {
        typeVariable.getClass();
        this.a = typeVariable;
    }

    @Override // defpackage.o86
    public final f0b a(y05 y05Var) {
        Annotation[] declaredAnnotations;
        y05Var.getClass();
        TypeVariable typeVariable = this.a;
        AnnotatedElement annotatedElement = typeVariable instanceof AnnotatedElement ? (AnnotatedElement) typeVariable : null;
        if (annotatedElement == null || (declaredAnnotations = annotatedElement.getDeclaredAnnotations()) == null) {
            return null;
        }
        return vn7.w(declaredAnnotations, y05Var);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof e1b) {
            return g76.L(this.a, ((e1b) obj).a);
        }
        return false;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        Annotation[] declaredAnnotations;
        TypeVariable typeVariable = this.a;
        AnnotatedElement annotatedElement = typeVariable instanceof AnnotatedElement ? (AnnotatedElement) typeVariable : null;
        return (annotatedElement == null || (declaredAnnotations = annotatedElement.getDeclaredAnnotations()) == null) ? ey3.a : vn7.y(declaredAnnotations);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return e1b.class.getName() + ": " + this.a;
    }
}
