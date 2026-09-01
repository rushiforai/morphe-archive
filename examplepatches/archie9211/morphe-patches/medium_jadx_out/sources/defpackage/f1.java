package defpackage;

import com.drew.imaging.avi.hzjl.bPUi;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class f1 extends c3 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(int i, ly lyVar, yv2 yv2Var, x67 x67Var, n98 n98Var, pqe pqeVar, boolean z) {
        super(i, lyVar, yv2Var, x67Var, n98Var, pqeVar, z);
        if (x67Var == null) {
            f0(0);
            throw null;
        }
        if (yv2Var == null) {
            f0(1);
            throw null;
        }
        if (pqeVar != null) {
        } else {
            f0(4);
            throw null;
        }
    }

    public static /* synthetic */ void f0(int i) {
        Object[] objArr = new Object[3];
        switch (i) {
            case 1:
                objArr[0] = "containingDeclaration";
                break;
            case 2:
                objArr[0] = bPUi.OfbLQZnPT;
                break;
            case 3:
                objArr[0] = "name";
                break;
            case 4:
                objArr[0] = "variance";
                break;
            case 5:
                objArr[0] = "source";
                break;
            case 6:
                objArr[0] = "supertypeLoopChecker";
                break;
            default:
                objArr[0] = "storageManager";
                break;
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractLazyTypeParameterDescriptor";
        objArr[2] = "<init>";
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }

    @Override // defpackage.zv2, defpackage.b2
    public final String toString() {
        String str = "";
        String str2 = this.g ? "reified " : "";
        if (z() != pqe.INVARIANT) {
            str = z() + " ";
        }
        return str2 + str + getName();
    }
}
