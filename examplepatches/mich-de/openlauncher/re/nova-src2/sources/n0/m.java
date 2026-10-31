package n0;

import androidx.compose.ui.Modifier$Node;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes2.dex */
public final class m extends Modifier$Node implements a3.h, z2.f, b3.e0 {

    /* renamed from: d, reason: collision with root package name */
    public static final k f77450d = new k();

    /* renamed from: a, reason: collision with root package name */
    public n f77451a;

    /* renamed from: b, reason: collision with root package name */
    public j f77452b;

    /* renamed from: c, reason: collision with root package name */
    public g0.d1 f77453c;

    public final boolean B(i iVar, int i5) {
        if (i5 == 5 || i5 == 6) {
            if (this.f77453c == g0.d1.f56494b) {
                return false;
            }
        } else if (i5 == 3 || i5 == 4) {
            if (this.f77453c == g0.d1.f56493a) {
                return false;
            }
        } else if (i5 != 1 && i5 != 2) {
            throw new IllegalStateException("Lazy list does not support beyond bounds layout for the specified direction");
        }
        if (D(i5)) {
            if (iVar.f77428b >= this.f77451a.a() - 1) {
                return false;
            }
        } else if (iVar.f77427a <= 0) {
            return false;
        }
        return true;
    }

    public final boolean D(int i5) {
        if (i5 == 1) {
            return false;
        }
        if (i5 == 2) {
            return true;
        }
        if (i5 == 5) {
            return false;
        }
        if (i5 == 6) {
            return true;
        }
        if (i5 == 3) {
            int iOrdinal = b3.o.f(this).getLayoutDirection().ordinal();
            if (iOrdinal == 0) {
                return false;
            }
            if (iOrdinal == 1) {
                return true;
            }
            throw new NoWhenBranchMatchedException();
        }
        if (i5 != 4) {
            throw new IllegalStateException("Lazy list does not support beyond bounds layout for the specified direction");
        }
        int iOrdinal2 = b3.o.f(this).getLayoutDirection().ordinal();
        if (iOrdinal2 == 0) {
            return true;
        }
        if (iOrdinal2 == 1) {
            return false;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // a3.h
    public final a3.g getProvidedValues() {
        a3.k kVar = z2.h.f98070a;
        a3.l lVar = new a3.l(kVar);
        lVar.c(kVar, this);
        return lVar;
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        z2.i1 i1VarH = q0Var.H(j11);
        return t0Var.y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.k(i1VarH, 4));
    }
}
