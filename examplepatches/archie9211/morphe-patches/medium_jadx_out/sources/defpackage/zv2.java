package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class zv2 extends b2 implements yv2 {
    public final n98 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zv2(ly lyVar, n98 n98Var) {
        super(lyVar);
        if (lyVar == null) {
            f0(0);
            throw null;
        }
        if (n98Var == null) {
            f0(1);
            throw null;
        }
        this.c = n98Var;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 2 || i == 3 || i == 5 || i == 6) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 2 || i == 3 || i == 5 || i == 6) ? 2 : 3];
        switch (i) {
            case 1:
                objArr[0] = "name";
                break;
            case 2:
            case 3:
            case 5:
            case 6:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/DeclarationDescriptorImpl";
                break;
            case 4:
                objArr[0] = CspinKvYN.zDveK;
                break;
            default:
                objArr[0] = "annotations";
                break;
        }
        if (i == 2) {
            objArr[1] = "getName";
        } else if (i == 3) {
            objArr[1] = "getOriginal";
        } else if (i == 5 || i == 6) {
            objArr[1] = "toString";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/DeclarationDescriptorImpl";
        }
        if (i != 2 && i != 3) {
            if (i == 4) {
                objArr[2] = "toString";
            } else if (i != 5 && i != 6) {
                objArr[2] = "<init>";
            }
        }
        String str2 = String.format(str, objArr);
        if (i != 2 && i != 3 && i != 5 && i != 6) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public static String w0(yv2 yv2Var) {
        try {
            return w83.e.v(yv2Var) + "[" + yv2Var.getClass().getSimpleName() + "@" + Integer.toHexString(System.identityHashCode(yv2Var)) + "]";
        } catch (Throwable unused) {
            return yv2Var.getClass().getSimpleName() + " " + yv2Var.getName();
        }
    }

    /* JADX INFO: renamed from: a */
    public yv2 x0() {
        return this;
    }

    @Override // defpackage.yv2
    public final n98 getName() {
        n98 n98Var = this.c;
        if (n98Var != null) {
            return n98Var;
        }
        f0(2);
        throw null;
    }

    @Override // defpackage.b2
    public String toString() {
        return w0(this);
    }
}
