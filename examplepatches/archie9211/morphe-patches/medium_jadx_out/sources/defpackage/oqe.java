package defpackage;

import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class oqe extends bw2 implements nqe {
    public mn6 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oqe(yv2 yv2Var, ly lyVar, n98 n98Var, mn6 mn6Var, jkc jkcVar) {
        super(yv2Var, lyVar, n98Var, jkcVar);
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
        this.f = mn6Var;
    }

    public static /* synthetic */ void f0(int i) {
        String str;
        int i2;
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                str = "@NotNull method %s.%s must not return null";
                break;
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                i2 = 2;
                break;
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
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
            case 7:
            case 8:
            case 9:
            case 10:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/VariableDescriptorImpl";
                break;
            default:
                objArr[0] = "containingDeclaration";
                break;
        }
        switch (i) {
            case 4:
                objArr[1] = "getType";
                break;
            case 5:
                objArr[1] = "getOriginal";
                break;
            case 6:
                objArr[1] = "getValueParameters";
                break;
            case 7:
                objArr[1] = "getOverriddenDescriptors";
                break;
            case 8:
                objArr[1] = "getTypeParameters";
                break;
            case 9:
                objArr[1] = "getContextReceiverParameters";
                break;
            case 10:
                objArr[1] = "getReturnType";
                break;
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/VariableDescriptorImpl";
                break;
        }
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                throw new IllegalStateException(str2);
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    @Override // defpackage.c41
    public final List I() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        f0(6);
        throw null;
    }

    @Override // defpackage.c41
    public yq6 M() {
        return null;
    }

    @Override // defpackage.c41
    public yq6 P() {
        return null;
    }

    @Override // defpackage.c41
    public mn6 getReturnType() {
        mn6 type = getType();
        if (type != null) {
            return type;
        }
        f0(10);
        throw null;
    }

    @Override // defpackage.b2, defpackage.iwa
    public final mn6 getType() {
        mn6 mn6Var = this.f;
        if (mn6Var != null) {
            return mn6Var;
        }
        f0(4);
        throw null;
    }

    @Override // defpackage.c41
    public List getTypeParameters() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        f0(8);
        throw null;
    }

    public boolean u() {
        return false;
    }
}
