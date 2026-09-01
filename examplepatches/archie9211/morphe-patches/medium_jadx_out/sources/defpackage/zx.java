package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zx implements yx {
    public final mn6 a;
    public final Map b;
    public final jkc c;

    public zx(hec hecVar, Map map, jkc jkcVar) {
        if (hecVar == null) {
            a(0);
            throw null;
        }
        this.a = hecVar;
        this.b = map;
        this.c = jkcVar;
    }

    public static /* synthetic */ void a(int i) {
        String str = (i == 3 || i == 4 || i == 5) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 3 || i == 4 || i == 5) ? 2 : 3];
        if (i == 1) {
            objArr[0] = "valueArguments";
        } else if (i == 2) {
            objArr[0] = "source";
        } else if (i == 3 || i == 4 || i == 5) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/annotations/AnnotationDescriptorImpl";
        } else {
            objArr[0] = "annotationType";
        }
        if (i == 3) {
            objArr[1] = "getType";
        } else if (i == 4) {
            objArr[1] = "getAllValueArguments";
        } else if (i != 5) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/annotations/AnnotationDescriptorImpl";
        } else {
            objArr[1] = "getSource";
        }
        if (i != 3 && i != 4 && i != 5) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 3 && i != 4 && i != 5) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.yx
    public final jkc d() {
        return this.c;
    }

    @Override // defpackage.yx
    public final y05 e() {
        y28 y28VarD = f93.d(this);
        if (y28VarD != null) {
            if (l24.f(y28VarD)) {
                y28VarD = null;
            }
            if (y28VarD != null) {
                return f93.c(y28VarD);
            }
        }
        return null;
    }

    @Override // defpackage.yx
    public final Map f() {
        return this.b;
    }

    @Override // defpackage.yx
    public final mn6 getType() {
        mn6 mn6Var = this.a;
        if (mn6Var != null) {
            return mn6Var;
        }
        a(3);
        throw null;
    }

    public final String toString() {
        return w83.c.w(this, null);
    }
}
