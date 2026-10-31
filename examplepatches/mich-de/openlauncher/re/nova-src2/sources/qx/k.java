package qx;

import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public final class k {
    public static long a(l lVar, e10.d0 d0Var, boolean z11) {
        int iOrdinal = lVar.ordinal();
        if (iOrdinal == 0) {
            return 2543737970L;
        }
        if (iOrdinal == 1) {
            int i5 = d0Var == null ? -1 : j.f84533a[d0Var.ordinal()];
            if (i5 == -1) {
                return 0L;
            }
            if (i5 == 1) {
                return 2543737973L;
            }
            if (i5 == 2) {
                return 2543737976L;
            }
            if (i5 == 3) {
                return 2543737979L;
            }
            throw new NoWhenBranchMatchedException();
        }
        if (iOrdinal == 2) {
            return 2543738006L;
        }
        if (iOrdinal == 3) {
            return 2543738003L;
        }
        if (iOrdinal != 4) {
            throw new NoWhenBranchMatchedException();
        }
        if (z11) {
            int i11 = d0Var == null ? -1 : j.f84533a[d0Var.ordinal()];
            if (i11 == -1) {
                return 0L;
            }
            if (i11 == 1) {
                return 2543737994L;
            }
            if (i11 == 2) {
                return 2543737997L;
            }
            if (i11 == 3) {
                return 2543738000L;
            }
            throw new NoWhenBranchMatchedException();
        }
        int i12 = d0Var == null ? -1 : j.f84533a[d0Var.ordinal()];
        if (i12 == -1) {
            return 0L;
        }
        if (i12 == 1) {
            return 2543737985L;
        }
        if (i12 == 2) {
            return 2543737988L;
        }
        if (i12 == 3) {
            return 2543737991L;
        }
        throw new NoWhenBranchMatchedException();
    }

    public static /* synthetic */ long b(l lVar, e10.d0 d0Var, int i5) {
        if ((i5 & 2) != 0) {
            d0Var = null;
        }
        return a(lVar, d0Var, false);
    }
}
