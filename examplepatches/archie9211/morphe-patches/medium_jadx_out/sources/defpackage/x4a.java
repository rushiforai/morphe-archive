package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x4a extends o4a {
    public lqe n;
    public final x4a o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x4a(q4a q4aVar, ly lyVar, c28 c28Var, g93 g93Var, boolean z, boolean z2, boolean z3, e41 e41Var, x4a x4aVar, jkc jkcVar) {
        super(c28Var, g93Var, q4aVar, lyVar, n98.g("<set-" + q4aVar.getName() + ">"), z, z2, z3, e41Var, jkcVar);
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (c28Var == null) {
            f0(2);
            throw null;
        }
        if (g93Var == null) {
            f0(3);
            throw null;
        }
        if (e41Var == null) {
            f0(4);
            throw null;
        }
        if (jkcVar == null) {
            f0(5);
            throw null;
        }
        this.o = x4aVar != null ? x4aVar : this;
    }

    public static /* synthetic */ void f0(int i) {
        String str;
        int i2;
        switch (i) {
            case 10:
            case 11:
            case 12:
            case 13:
                str = "@NotNull method %s.%s must not return null";
                break;
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 10:
            case 11:
            case 12:
            case 13:
                i2 = 2;
                break;
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
            case 9:
                objArr[0] = "annotations";
                break;
            case 2:
                objArr[0] = "modality";
                break;
            case 3:
                objArr[0] = "visibility";
                break;
            case 4:
                objArr[0] = "kind";
                break;
            case 5:
                objArr[0] = "source";
                break;
            case 6:
                objArr[0] = "parameter";
                break;
            case 7:
                objArr[0] = "setterDescriptor";
                break;
            case 8:
                objArr[0] = "type";
                break;
            case 10:
            case 11:
            case 12:
            case 13:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertySetterDescriptorImpl";
                break;
            default:
                objArr[0] = "correspondingProperty";
                break;
        }
        switch (i) {
            case 10:
                objArr[1] = "getOverriddenDescriptors";
                break;
            case 11:
                objArr[1] = "getValueParameters";
                break;
            case 12:
                objArr[1] = "getReturnType";
                break;
            case 13:
                objArr[1] = "getOriginal";
                break;
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertySetterDescriptorImpl";
                break;
        }
        switch (i) {
            case 6:
                objArr[2] = "initialize";
                break;
            case 7:
            case 8:
            case 9:
                objArr[2] = "createSetterParameter";
                break;
            case 10:
            case 11:
            case 12:
            case 13:
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 10:
            case 11:
            case 12:
            case 13:
                throw new IllegalStateException(str2);
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    public static lqe z0(x4a x4aVar, mn6 mn6Var, ly lyVar) {
        if (mn6Var == null) {
            f0(8);
            throw null;
        }
        if (lyVar != null) {
            return new lqe(x4aVar, null, 0, lyVar, olc.g, mn6Var, false, false, false, null, jkc.g0);
        }
        f0(9);
        throw null;
    }

    @Override // defpackage.bw2
    /* JADX INFO: renamed from: A0, reason: merged with bridge method [inline-methods] */
    public final x4a x0() {
        x4a x4aVar = this.o;
        if (x4aVar != null) {
            return x4aVar;
        }
        f0(13);
        throw null;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.w(this, obj);
    }

    @Override // defpackage.c41
    public final List I() {
        lqe lqeVar = this.n;
        if (lqeVar == null) {
            lg8.d();
            return null;
        }
        List listSingletonList = Collections.singletonList(lqeVar);
        if (listSingletonList != null) {
            return listSingletonList;
        }
        f0(11);
        throw null;
    }

    @Override // defpackage.c41
    public final mn6 getReturnType() {
        return f93.e(this).w();
    }

    @Override // defpackage.f41, defpackage.c41
    public final Collection i() {
        return y0(false);
    }
}
