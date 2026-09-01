package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class bw2 extends zv2 implements aw2 {
    public final yv2 d;
    public final jkc e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bw2(yv2 yv2Var, ly lyVar, n98 n98Var, jkc jkcVar) {
        super(lyVar, n98Var);
        if (yv2Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (n98Var == null) {
            f0(2);
            throw null;
        }
        if (jkcVar == null) {
            f0(3);
            throw null;
        }
        this.d = yv2Var;
        this.e = jkcVar;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 4 || i == 5 || i == 6) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 4 || i == 5 || i == 6) ? 2 : 3];
        switch (i) {
            case 1:
                objArr[0] = "annotations";
                break;
            case 2:
                objArr[0] = "name";
                break;
            case 3:
                objArr[0] = "source";
                break;
            case 4:
            case 5:
            case 6:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/DeclarationDescriptorNonRootImpl";
                break;
            default:
                objArr[0] = "containingDeclaration";
                break;
        }
        if (i == 4) {
            objArr[1] = "getOriginal";
        } else if (i == 5) {
            objArr[1] = "getContainingDeclaration";
        } else if (i != 6) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/DeclarationDescriptorNonRootImpl";
        } else {
            objArr[1] = "getSource";
        }
        if (i != 4 && i != 5 && i != 6) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 4 && i != 5 && i != 6) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.aw2
    public jkc d() {
        jkc jkcVar = this.e;
        if (jkcVar != null) {
            return jkcVar;
        }
        f0(6);
        throw null;
    }

    @Override // defpackage.yv2
    public yv2 h() {
        yv2 yv2Var = this.d;
        if (yv2Var != null) {
            return yv2Var;
        }
        f0(5);
        throw null;
    }

    @Override // defpackage.zv2, defpackage.yv2, defpackage.c41
    public aw2 x0() {
        return this;
    }
}
