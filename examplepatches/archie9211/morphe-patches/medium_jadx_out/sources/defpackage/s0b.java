package defpackage;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s0b extends d1b {
    public final Type a;
    public final s86 b;

    public s0b(Type type) {
        s86 q0bVar;
        type.getClass();
        this.a = type;
        if (type instanceof Class) {
            q0bVar = new q0b((Class) type);
        } else if (type instanceof TypeVariable) {
            q0bVar = new e1b((TypeVariable) type);
        } else {
            if (!(type instanceof ParameterizedType)) {
                lg8.u("Not a classifier type (", type.getClass(), "): ", type);
                throw null;
            }
            Type rawType = ((ParameterizedType) type).getRawType();
            rawType.getClass();
            q0bVar = new q0b((Class) rawType);
        }
        this.b = q0bVar;
    }

    @Override // defpackage.d1b, defpackage.o86
    public final f0b a(y05 y05Var) {
        y05Var.getClass();
        return null;
    }

    @Override // defpackage.d1b
    public final Type b() {
        return this.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0037  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.ArrayList c() {
        /*
            r5 = this;
            java.lang.reflect.Type r5 = r5.a
            java.util.List r5 = defpackage.e0b.c(r5)
            java.util.ArrayList r0 = new java.util.ArrayList
            r1 = 10
            int r1 = defpackage.cu1.k0(r5, r1)
            r0.<init>(r1)
            java.util.Iterator r5 = r5.iterator()
        L15:
            boolean r1 = r5.hasNext()
            if (r1 == 0) goto L64
            java.lang.Object r1 = r5.next()
            java.lang.reflect.Type r1 = (java.lang.reflect.Type) r1
            r1.getClass()
            boolean r2 = r1 instanceof java.lang.Class
            if (r2 == 0) goto L37
            r3 = r1
            java.lang.Class r3 = (java.lang.Class) r3
            boolean r4 = r3.isPrimitive()
            if (r4 == 0) goto L37
            b1b r1 = new b1b
            r1.<init>(r3)
            goto L60
        L37:
            boolean r3 = r1 instanceof java.lang.reflect.GenericArrayType
            if (r3 != 0) goto L5a
            if (r2 == 0) goto L47
            r2 = r1
            java.lang.Class r2 = (java.lang.Class) r2
            boolean r2 = r2.isArray()
            if (r2 == 0) goto L47
            goto L5a
        L47:
            boolean r2 = r1 instanceof java.lang.reflect.WildcardType
            if (r2 == 0) goto L54
            g1b r2 = new g1b
            java.lang.reflect.WildcardType r1 = (java.lang.reflect.WildcardType) r1
            r2.<init>(r1)
        L52:
            r1 = r2
            goto L60
        L54:
            s0b r2 = new s0b
            r2.<init>(r1)
            goto L52
        L5a:
            j0b r2 = new j0b
            r2.<init>(r1)
            goto L52
        L60:
            r0.add(r1)
            goto L15
        L64:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s0b.c():java.util.ArrayList");
    }

    public final boolean d() {
        Type type = this.a;
        if (type instanceof Class) {
            TypeVariable[] typeParameters = ((Class) type).getTypeParameters();
            typeParameters.getClass();
            if (!(typeParameters.length == 0)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        return ey3.a;
    }
}
