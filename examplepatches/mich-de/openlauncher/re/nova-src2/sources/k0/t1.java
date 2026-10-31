package k0;

import androidx.compose.ui.node.LayoutNode;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class t1 {
    /* JADX WARN: Removed duplicated region for block: B:15:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final z2.s0 a(s1 s1Var, int i5, int i11, int i12, int i13, int i14, z2.t0 t0Var, List list, z2.i1[] i1VarArr, int i15, int i16, int[] iArr, int i17) {
        int i18;
        int i19;
        float f11;
        boolean z11;
        int iMax;
        int i21;
        int i22;
        int i23;
        int i24;
        List list2 = list;
        long j11 = i14;
        int i25 = i16 - i15;
        int[] iArr2 = new int[i25];
        int i26 = i15;
        int iMax2 = 0;
        int i27 = 0;
        boolean z12 = false;
        int i28 = 0;
        int iMin = 0;
        float f12 = 0.0f;
        while (true) {
            if (i26 >= i16) {
                break;
            }
            z2.q0 q0Var = (z2.q0) list2.get(i26);
            long j12 = j11;
            u1 u1VarA = r1.a(q0Var);
            float fB = r1.b(u1VarA);
            if (z12) {
                z12 = true;
            } else {
                d dVar = u1VarA != null ? u1VarA.f70756c : null;
                if (!(dVar != null ? dVar.m() : false)) {
                    z12 = false;
                }
            }
            if (fB > 0.0f) {
                f12 += fB;
                i27++;
                i22 = i26;
            } else {
                int i29 = i12 - i28;
                z2.i1 i1VarH = i1VarArr[i26];
                if (i1VarH == null) {
                    if (i12 == Integer.MAX_VALUE) {
                        i22 = i26;
                        i23 = i27;
                        i24 = LayoutNode.NotPlacedPlaceOrder;
                    } else {
                        i22 = i26;
                        i23 = i27;
                        i24 = i29 < 0 ? 0 : i29;
                    }
                    i1VarH = q0Var.H(s1Var.g(0, i24, i13, false));
                } else {
                    i22 = i26;
                    i23 = i27;
                }
                int iF = s1Var.f(i1VarH);
                int iH = s1Var.h(i1VarH);
                iArr2[i22 - i15] = iF;
                int i31 = i29 - iF;
                if (i31 < 0) {
                    i31 = 0;
                }
                iMin = Math.min(i14, i31);
                i28 += iF + iMin;
                iMax2 = Math.max(iMax2, iH);
                i1VarArr[i22] = i1VarH;
                i27 = i23;
            }
            i26 = i22 + 1;
            j11 = j12;
        }
        long j13 = j11;
        boolean z13 = true;
        if (i27 == 0) {
            i28 -= iMin;
            i18 = 0;
        } else {
            long j14 = (r24 - 1) * j13;
            long jRound = ((i12 != Integer.MAX_VALUE ? i12 : i5) - i28) - j14;
            if (jRound < 0) {
                jRound = 0;
            }
            float f13 = jRound / f12;
            int i32 = i15;
            while (i32 < i16) {
                jRound -= Math.round(r1.b(r1.a((z2.q0) list2.get(i32))) * f13);
                i32++;
                j14 = j14;
            }
            long j15 = j14;
            int i33 = i15;
            int i34 = 0;
            while (i33 < i16) {
                if (i1VarArr[i33] == null) {
                    z2.q0 q0Var2 = (z2.q0) list2.get(i33);
                    u1 u1VarA2 = r1.a(q0Var2);
                    float fB2 = r1.b(u1VarA2);
                    if (!(fB2 > 0.0f ? z13 : false)) {
                        l0.a.b("All weights <= 0 should have placeables");
                    }
                    i19 = i33;
                    int iSignum = Long.signum(jRound);
                    f11 = f13;
                    jRound -= iSignum;
                    int iMax3 = Math.max(0, Math.round(f11 * fB2) + iSignum);
                    z11 = z13;
                    z2.i1 i1VarH2 = q0Var2.H(s1Var.g((!(u1VarA2 != null ? u1VarA2.f70755b : z13) || iMax3 == Integer.MAX_VALUE) ? 0 : iMax3, iMax3, i13, z11));
                    int iF2 = s1Var.f(i1VarH2);
                    int iH2 = s1Var.h(i1VarH2);
                    iArr2[i19 - i15] = iF2;
                    i34 += iF2;
                    int iMax4 = Math.max(iMax2, iH2);
                    i1VarArr[i19] = i1VarH2;
                    iMax2 = iMax4;
                } else {
                    i19 = i33;
                    f11 = f13;
                    z11 = z13;
                }
                list2 = list;
                z13 = z11;
                i33 = i19 + 1;
                f13 = f11;
            }
            i18 = (int) (i34 + j15);
            int i35 = i12 - i28;
            if (i18 < 0) {
                i18 = 0;
            }
            if (i18 > i35) {
                i18 = i35;
            }
        }
        if (z12) {
            int iMax5 = 0;
            iMax = 0;
            for (int i36 = i15; i36 < i16; i36++) {
                z2.i1 i1Var = i1VarArr[i36];
                Intrinsics.d(i1Var);
                Object objK = i1Var.k();
                u1 u1Var = objK instanceof u1 ? (u1) objK : null;
                d dVar2 = u1Var != null ? u1Var.f70756c : null;
                Integer numJ = dVar2 != null ? dVar2.j(i1Var) : null;
                if (numJ != null) {
                    int iIntValue = numJ.intValue();
                    int iH3 = s1Var.h(i1Var);
                    iMax5 = Math.max(iMax5, iIntValue != Integer.MIN_VALUE ? numJ.intValue() : 0);
                    if (iIntValue == Integer.MIN_VALUE) {
                        iIntValue = iH3;
                    }
                    iMax = Math.max(iMax, iH3 - iIntValue);
                }
            }
            i21 = iMax5;
        } else {
            iMax = 0;
            i21 = 0;
        }
        int i37 = i28 + i18;
        int iMax6 = Math.max(i37 < 0 ? 0 : i37, i5);
        int iMax7 = Math.max(iMax2, Math.max(i11, iMax + i21));
        int[] iArr3 = new int[i25];
        s1Var.i(iMax6, iArr2, iArr3, t0Var);
        return s1Var.j(i1VarArr, t0Var, i21, iArr3, iMax6, iMax7, iArr, i17, i15, i16);
    }
}
