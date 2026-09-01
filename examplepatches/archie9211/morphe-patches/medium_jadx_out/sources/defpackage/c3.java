package defpackage;

import java.util.List;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class c3 extends bw2 implements swd {
    public final pqe f;
    public final boolean g;
    public final int h;
    public final u67 i;
    public final u67 j;
    public final x67 k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c3(int i, ly lyVar, yv2 yv2Var, x67 x67Var, n98 n98Var, pqe pqeVar, boolean z) {
        super(yv2Var, lyVar, n98Var, jkc.g0);
        int i2 = 0;
        if (x67Var == null) {
            f0(0);
            throw null;
        }
        int i3 = 1;
        if (yv2Var == null) {
            f0(1);
            throw null;
        }
        if (lyVar == null) {
            f0(2);
            throw null;
        }
        if (n98Var == null) {
            f0(3);
            throw null;
        }
        if (pqeVar == null) {
            f0(4);
            throw null;
        }
        this.f = pqeVar;
        this.g = z;
        this.h = i;
        this.i = new u67(x67Var, new a3(this, i2, x67Var));
        this.j = new u67(x67Var, new a3(this, i3, n98Var));
        this.k = x67Var;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.o(this, obj);
    }

    @Override // defpackage.swd
    public final x67 N() {
        x67 x67Var = this.k;
        if (x67Var != null) {
            return x67Var;
        }
        f0(14);
        throw null;
    }

    @Override // defpackage.swd
    public final boolean R() {
        return false;
    }

    @Override // defpackage.co1
    public final hec T() {
        hec hecVar = (hec) this.j.invoke();
        if (hecVar != null) {
            return hecVar;
        }
        f0(10);
        throw null;
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final co1 x0() {
        return this;
    }

    @Override // defpackage.swd
    public final int getIndex() {
        return this.h;
    }

    @Override // defpackage.swd
    public final List getUpperBounds() {
        return ((b3) n()).b();
    }

    @Override // defpackage.co1
    public final zvd n() {
        zvd zvdVar = (zvd) this.i.invoke();
        if (zvdVar != null) {
            return zvdVar;
        }
        f0(9);
        throw null;
    }

    @Override // defpackage.swd
    public final boolean t() {
        return this.g;
    }

    @Override // defpackage.bw2
    public final aw2 x0() {
        return this;
    }

    public List y0(List list) {
        return list;
    }

    @Override // defpackage.swd
    public final pqe z() {
        pqe pqeVar = this.f;
        if (pqeVar != null) {
            return pqeVar;
        }
        f0(7);
        throw null;
    }

    public abstract List z0();

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final yv2 x0() {
        return this;
    }

    public static /* synthetic */ void f0(int i) {
        String str;
        int i2;
        switch (i) {
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 13:
            case 14:
                str = "@NotNull method %s.%s must not return null";
                break;
            case 12:
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 13:
            case 14:
                i2 = 2;
                break;
            case 12:
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
                objArr[0] = "containingDeclaration";
                break;
            case 2:
                objArr[0] = "annotations";
                break;
            case 3:
                objArr[0] = "name";
                break;
            case 4:
                objArr[0] = gYpYQDQkhfs.MJTXynSCa;
                break;
            case 5:
                objArr[0] = "source";
                break;
            case 6:
                objArr[0] = "supertypeLoopChecker";
                break;
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 13:
            case 14:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractTypeParameterDescriptor";
                break;
            case 12:
                objArr[0] = "bounds";
                break;
            default:
                objArr[0] = "storageManager";
                break;
        }
        switch (i) {
            case 7:
                objArr[1] = "getVariance";
                break;
            case 8:
                objArr[1] = "getUpperBounds";
                break;
            case 9:
                objArr[1] = "getTypeConstructor";
                break;
            case 10:
                objArr[1] = "getDefaultType";
                break;
            case 11:
                objArr[1] = "getOriginal";
                break;
            case 12:
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractTypeParameterDescriptor";
                break;
            case 13:
                objArr[1] = "processBoundsWithoutCycles";
                break;
            case 14:
                objArr[1] = "getStorageManager";
                break;
        }
        switch (i) {
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 13:
            case 14:
                break;
            case 12:
                objArr[2] = "processBoundsWithoutCycles";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 13:
            case 14:
                throw new IllegalStateException(str2);
            case 12:
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final swd x0() {
        return this;
    }
}
