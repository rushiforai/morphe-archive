package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vn5 {
    public final hp6 a;
    public boolean b;
    public boolean c;
    public boolean d;
    public boolean e;
    public final x68 f = new x68();
    public final jh8 g = new jh8();
    public final p68 h = new p68(10);

    public vn5(hp6 hp6Var) {
        this.a = hp6Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0077  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(long r19, java.util.List r21, boolean r22) {
        /*
            Method dump skipped, instruction units count: 267
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vn5.a(long, java.util.List, boolean):void");
    }

    public final boolean b(o72 o72Var, boolean z) {
        jh8 jh8Var = this.g;
        o78 o78Var = jh8Var.a;
        if (!jh8Var.a((ab7) o72Var.c, this.a, o72Var, z)) {
            return false;
        }
        boolean z2 = true;
        this.b = true;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        boolean z3 = false;
        for (int i2 = 0; i2 < i; i2++) {
            z3 = ((yg8) objArr[i2]).e(o72Var, z) || z3;
        }
        Object[] objArr2 = o78Var.a;
        int i3 = o78Var.c;
        boolean z4 = false;
        for (int i4 = 0; i4 < i3; i4++) {
            z4 = ((yg8) objArr2[i4]).d(o72Var) || z4;
        }
        jh8Var.b(o72Var);
        if (!z4 && !z3) {
            z2 = false;
        }
        this.b = false;
        if (this.e) {
            this.e = false;
            x68 x68Var = this.f;
            int i5 = x68Var.b;
            for (int i6 = 0; i6 < i5; i6++) {
                d((q28) x68Var.f(i6));
            }
            x68Var.d();
        }
        if (this.c) {
            this.c = false;
            c();
        }
        if (this.d) {
            this.d = false;
            jh8Var.a.i();
        }
        return z2;
    }

    public final void c() {
        if (this.b) {
            this.c = true;
            return;
        }
        jh8 jh8Var = this.g;
        o78 o78Var = jh8Var.a;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            ((yg8) objArr[i2]).c();
        }
        if (this.d) {
            this.d = true;
        } else {
            jh8Var.a.i();
        }
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final void d(q28 q28Var) {
        if (this.b) {
            this.e = true;
            this.f.a(q28Var);
            return;
        }
        jh8 jh8Var = this.g;
        x68 x68Var = jh8Var.b;
        x68Var.d();
        x68Var.a(jh8Var);
        while (x68Var.i()) {
            jh8 jh8Var2 = (jh8) x68Var.k(x68Var.b - 1);
            int i = 0;
            while (true) {
                o78 o78Var = jh8Var2.a;
                if (i < o78Var.c) {
                    yg8 yg8Var = (yg8) o78Var.a[i];
                    if (yg8Var.c.equals(q28Var)) {
                        jh8Var2.a.l(yg8Var);
                        yg8Var.c();
                    } else {
                        x68Var.a(yg8Var);
                        i++;
                    }
                }
            }
        }
    }
}
