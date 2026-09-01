package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wn1 extends g0 {
    public final y28 c;
    public final List d;
    public final Collection e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wn1(y28 y28Var, List list, Collection collection, x67 x67Var) {
        super(x67Var);
        if (list == null) {
            l(1);
            throw null;
        }
        if (collection == null) {
            l(2);
            throw null;
        }
        if (x67Var == null) {
            l(3);
            throw null;
        }
        this.c = y28Var;
        this.d = DesugarCollections.unmodifiableList(new ArrayList(list));
        this.e = DesugarCollections.unmodifiableCollection(collection);
    }

    public static /* synthetic */ void l(int i) {
        String str = (i == 4 || i == 5 || i == 6 || i == 7) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 4 || i == 5 || i == 6 || i == 7) ? 2 : 3];
        switch (i) {
            case 1:
                objArr[0] = "parameters";
                break;
            case 2:
                objArr[0] = "supertypes";
                break;
            case 3:
                objArr[0] = "storageManager";
                break;
            case 4:
            case 5:
            case 6:
            case 7:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/types/ClassTypeConstructorImpl";
                break;
            default:
                objArr[0] = "classDescriptor";
                break;
        }
        if (i == 4) {
            objArr[1] = "getParameters";
        } else if (i == 5) {
            objArr[1] = "getDeclarationDescriptor";
        } else if (i == 6) {
            objArr[1] = "computeSupertypes";
        } else if (i != 7) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/types/ClassTypeConstructorImpl";
        } else {
            objArr[1] = "getSupertypeLoopChecker";
        }
        if (i != 4 && i != 5 && i != 6 && i != 7) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 4 && i != 5 && i != 6 && i != 7) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return true;
    }

    @Override // defpackage.z2
    public final Collection f() {
        Collection collection = this.e;
        if (collection != null) {
            return collection;
        }
        l(6);
        throw null;
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        List list = this.d;
        if (list != null) {
            return list;
        }
        l(4);
        throw null;
    }

    @Override // defpackage.z2
    public final uob h() {
        return uob.h;
    }

    @Override // defpackage.g0
    /* JADX INFO: renamed from: m */
    public final y28 a() {
        y28 y28Var = this.c;
        if (y28Var != null) {
            return y28Var;
        }
        l(5);
        throw null;
    }

    public final String toString() {
        return d93.g(this.c).a;
    }
}
