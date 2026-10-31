package ads_mobile_sdk;

import b.k9;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public final class ru3 implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f9326a;

    public ru3(boolean z11) {
        this.f9326a = z11;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00d2, code lost:
    
        return java.lang.Integer.compare(r2.length, r14.f12665a.length);
     */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00ed A[RETURN] */
    @Override // java.util.Comparator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int compare(Object obj, Object obj2) {
        int[] iArr = {446703183, 1862618146, 1081639777, -1087935358, -803036955, 1104011716, 5522510, 2017461929, 496612959};
        int i5 = 0;
        int i11 = iArr[0];
        int i12 = iArr[1];
        int iC = k9.c((i12 & (~i11)) | iArr[2], (i11 & iArr[3]) | iArr[4], iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        vu3 vu3Var = (vu3) obj;
        vu3 vu3Var2 = (vu3) obj2;
        int i13 = vu3Var.f10911g;
        if (i13 != vu3Var2.f10911g) {
            throw new IllegalArgumentException();
        }
        int i14 = iC + i13;
        try {
            if (i13 == 0) {
                throw null;
            }
            boolean z11 = this.f9326a;
            switch (i14) {
                case 1:
                    if (z11) {
                        return vu3Var.b() != vu3Var2.b() ? 1 : 0;
                    }
                    throw new IllegalArgumentException();
                case 2:
                    return Long.compare(vu3Var.c(), vu3Var2.c());
                case 3:
                    zt3 zt3VarD = vu3Var.d();
                    zt3 zt3VarD2 = vu3Var2.d();
                    int i15 = 0;
                    while (true) {
                        byte[] bArr = zt3VarD.f12665a;
                        if (i5 >= bArr.length || i15 >= zt3VarD2.f12665a.length) {
                            break;
                        } else {
                            int iCompare = Integer.compare(zt3.a(zt3VarD.a(i5)), zt3.a(zt3VarD2.a(i15)));
                            if (iCompare != 0) {
                                return iCompare;
                            }
                            i5++;
                            i15++;
                        }
                    }
                    break;
                case 4:
                    List listE = vu3Var.e();
                    List listE2 = vu3Var2.e();
                    Iterator it = listE.iterator();
                    Iterator it2 = listE2.iterator();
                    while (it.hasNext()) {
                        if (it2.hasNext()) {
                            int iCompare2 = compare(it.next(), it2.next());
                            if (iCompare2 != 0) {
                                return iCompare2;
                            }
                        }
                    }
                    if (it2.hasNext()) {
                        return -1;
                    }
                    break;
                case 5:
                    if (z11) {
                        if (vu3Var.f() != vu3Var2.f()) {
                        }
                    }
                    throw new IllegalArgumentException();
                case 6:
                    return Double.compare(vu3Var.g(), vu3Var2.g());
            }
        } catch (su3 e3) {
            throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e3);
        }
    }
}
