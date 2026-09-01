package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jfc {
    public static final rh4 a;
    public static final rh4 b;
    public static final rh4 c;
    public static final w8f d;
    public static final w8f e;
    public static final w8f f;
    public static final w8f g;
    public static final w8f h;
    public static final w8f i;

    static {
        ef3 ef3Var = ef3.Horizontal;
        a = new rh4(ef3Var, 1.0f);
        ef3 ef3Var2 = ef3.Vertical;
        b = new rh4(ef3Var2, 1.0f);
        ef3 ef3Var3 = ef3.Both;
        c = new rh4(ef3Var3, 1.0f);
        yq0 yq0Var = z46.q;
        int i2 = 8;
        d = new w8f(ef3Var, new f4e(i2, yq0Var), yq0Var);
        yq0 yq0Var2 = z46.p;
        e = new w8f(ef3Var, new f4e(i2, yq0Var2), yq0Var2);
        zq0 zq0Var = z46.n;
        int i3 = 9;
        f = new w8f(ef3Var2, new f4e(i3, zq0Var), zq0Var);
        zq0 zq0Var2 = z46.m;
        g = new w8f(ef3Var2, new f4e(i3, zq0Var2), zq0Var2);
        ar0 ar0Var = z46.h;
        int i4 = 10;
        h = new w8f(ef3Var3, new f4e(i4, ar0Var), ar0Var);
        ar0 ar0Var2 = z46.d;
        i = new w8f(ef3Var3, new f4e(i4, ar0Var2), ar0Var2);
    }

    public static final r28 a(r28 r28Var, float f2, float f3) {
        return r28Var.b(new w2e(f2, f3));
    }

    public static r28 b(r28 r28Var, float f2, float f3, int i2) {
        if ((i2 & 1) != 0) {
            f2 = Float.NaN;
        }
        if ((i2 & 2) != 0) {
            f3 = Float.NaN;
        }
        return a(r28Var, f2, f3);
    }

    public static final r28 c(r28 r28Var, float f2) {
        return r28Var.b(f2 == 1.0f ? b : new rh4(ef3.Vertical, f2));
    }

    public static final r28 d(r28 r28Var, float f2) {
        return r28Var.b(f2 == 1.0f ? a : new rh4(ef3.Horizontal, f2));
    }

    public static final r28 e(r28 r28Var, float f2) {
        return r28Var.b(new ifc(0.0f, f2, 0.0f, f2, true, 5));
    }

    public static r28 f(r28 r28Var, float f2, float f3, int i2) {
        return r28Var.b(new ifc(0.0f, (i2 & 1) != 0 ? Float.NaN : f2, 0.0f, (i2 & 2) != 0 ? Float.NaN : f3, true, 5));
    }

    public static r28 g(r28 r28Var, float f2) {
        return r28Var.b(new ifc(0.0f, f2, 0.0f, Float.NaN, false, 5));
    }

    public static final r28 h(r28 r28Var, float f2) {
        return r28Var.b(new ifc(f2, f2, f2, f2, false));
    }

    public static final r28 i(r28 r28Var, float f2, float f3) {
        return r28Var.b(new ifc(f2, f3, f2, f3, false));
    }

    public static r28 j(r28 r28Var, float f2, float f3, float f4, float f5, int i2) {
        return r28Var.b(new ifc(f2, (i2 & 2) != 0 ? Float.NaN : f3, (i2 & 4) != 0 ? Float.NaN : f4, (i2 & 8) != 0 ? Float.NaN : f5, false));
    }

    public static final r28 k() {
        return new ifc(104.0f, 0.0f, 104.0f, 0.0f, false, 10);
    }

    public static final r28 l(r28 r28Var, float f2) {
        return r28Var.b(new ifc(f2, f2, f2, f2, true));
    }

    public static final r28 m(r28 r28Var, float f2, float f3) {
        return r28Var.b(new ifc(f2, f3, f2, f3, true));
    }

    public static final r28 n(r28 r28Var, float f2, float f3, float f4, float f5) {
        return r28Var.b(new ifc(f2, f3, f4, f5, true));
    }

    public static r28 o(r28 r28Var, float f2, float f3, float f4, float f5, int i2) {
        if ((i2 & 1) != 0) {
            f2 = Float.NaN;
        }
        if ((i2 & 2) != 0) {
            f3 = Float.NaN;
        }
        if ((i2 & 4) != 0) {
            f4 = Float.NaN;
        }
        if ((i2 & 8) != 0) {
            f5 = Float.NaN;
        }
        return n(r28Var, f2, f3, f4, f5);
    }

    public static final r28 p(r28 r28Var, float f2) {
        return r28Var.b(new ifc(f2, 0.0f, f2, 0.0f, true, 10));
    }

    public static r28 q(r28 r28Var, float f2, float f3, int i2) {
        return r28Var.b(new ifc((i2 & 1) != 0 ? Float.NaN : f2, 0.0f, (i2 & 2) != 0 ? Float.NaN : f3, 0.0f, true, 10));
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public static r28 r(r28 r28Var, int i2) {
        zq0 zq0Var = z46.n;
        return r28Var.b(zq0Var.equals(zq0Var) ? f : zq0Var.equals(z46.m) ? g : new w8f(ef3.Vertical, new f4e(9, zq0Var), zq0Var));
    }

    public static r28 s(r28 r28Var, ar0 ar0Var, int i2) {
        ar0 ar0Var2 = z46.h;
        if ((i2 & 1) != 0) {
            ar0Var = ar0Var2;
        }
        return r28Var.b(ar0Var.equals(ar0Var2) ? h : ar0Var.equals(z46.d) ? i : new w8f(ef3.Both, new f4e(10, ar0Var), ar0Var));
    }

    public static r28 t(r28 r28Var, yq0 yq0Var, int i2) {
        yq0 yq0Var2 = z46.q;
        if ((i2 & 1) != 0) {
            yq0Var = yq0Var2;
        }
        return r28Var.b(yq0Var.equals(yq0Var2) ? d : yq0Var.equals(z46.p) ? e : new w8f(ef3.Horizontal, new f4e(8, yq0Var), yq0Var));
    }
}
