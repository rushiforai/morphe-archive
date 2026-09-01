package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class dn1 extends f0 {
    public final yv2 e;
    public final jkc f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dn1(x67 x67Var, yv2 yv2Var, n98 n98Var, jkc jkcVar) {
        super(x67Var, n98Var);
        if (x67Var == null) {
            u0(0);
            throw null;
        }
        if (yv2Var == null) {
            u0(1);
            throw null;
        }
        if (n98Var == null) {
            u0(2);
            throw null;
        }
        this.e = yv2Var;
        this.f = jkcVar;
    }

    public static /* synthetic */ void u0(int i) {
        String str = (i == 4 || i == 5) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 4 || i == 5) ? 2 : 3];
        if (i == 1) {
            objArr[0] = "containingDeclaration";
        } else if (i == 2) {
            objArr[0] = "name";
        } else if (i == 3) {
            objArr[0] = "source";
        } else if (i == 4 || i == 5) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/ClassDescriptorBase";
        } else {
            objArr[0] = "storageManager";
        }
        if (i == 4) {
            objArr[1] = "getContainingDeclaration";
        } else if (i != 5) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/ClassDescriptorBase";
        } else {
            objArr[1] = "getSource";
        }
        if (i != 4 && i != 5) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 4 && i != 5) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.aw2
    public final jkc d() {
        jkc jkcVar = this.f;
        if (jkcVar != null) {
            return jkcVar;
        }
        u0(5);
        throw null;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        yv2 yv2Var = this.e;
        if (yv2Var != null) {
            return yv2Var;
        }
        u0(4);
        throw null;
    }

    public boolean isExternal() {
        return false;
    }
}
