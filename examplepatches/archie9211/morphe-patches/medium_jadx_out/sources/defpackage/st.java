package defpackage;

import android.view.View;
import android.view.ViewGroup;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class st extends up1 {
    public final /* synthetic */ int d;
    public final /* synthetic */ ViewGroup e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ st(ViewGroup viewGroup, int i) {
        super(1);
        this.d = i;
        this.e = viewGroup;
    }

    @Override // defpackage.up1
    public final z4f f(z4f z4fVar, List list) {
        int i = this.d;
        ViewGroup viewGroup = this.e;
        switch (i) {
            case 0:
                return ((due) viewGroup).e(z4fVar);
            default:
                mb3 mb3Var = (mb3) viewGroup;
                if (mb3Var.m) {
                    return z4fVar;
                }
                View childAt = mb3Var.getChildAt(0);
                int iMax = Math.max(0, childAt.getLeft());
                int iMax2 = Math.max(0, childAt.getTop());
                int iMax3 = Math.max(0, mb3Var.getWidth() - childAt.getRight());
                int iMax4 = Math.max(0, mb3Var.getHeight() - childAt.getBottom());
                return (iMax == 0 && iMax2 == 0 && iMax3 == 0 && iMax4 == 0) ? z4fVar : z4fVar.a.r(iMax, iMax2, iMax3, iMax4);
        }
    }

    @Override // defpackage.up1
    public final mya g(f4f f4fVar, mya myaVar) {
        int i = this.d;
        int i2 = 26;
        ViewGroup viewGroup = this.e;
        switch (i) {
            case 0:
                l26 l26Var = (l26) ((due) viewGroup).z.F.d;
                if (!l26Var.S.n) {
                    return myaVar;
                }
                long jC0 = d46.c0(l26Var.I(0L));
                int i3 = (int) (jC0 >> 32);
                if (i3 < 0) {
                    i3 = 0;
                }
                int i4 = (int) (jC0 & 4294967295L);
                if (i4 < 0) {
                    i4 = 0;
                }
                long j = sgg.K(l26Var).j();
                int i5 = (int) (j >> 32);
                int i6 = (int) (j & 4294967295L);
                long j2 = l26Var.c;
                long jC02 = d46.c0(l26Var.I((((long) Float.floatToRawIntBits((int) (j2 >> 32))) << 32) | (((long) Float.floatToRawIntBits((int) (j2 & 4294967295L))) & 4294967295L)));
                int i7 = i5 - ((int) (jC02 >> 32));
                if (i7 < 0) {
                    i7 = 0;
                }
                int i8 = i6 - ((int) (jC02 & 4294967295L));
                int i9 = i8 >= 0 ? i8 : 0;
                return (i3 == 0 && i4 == 0 && i7 == 0 && i9 == 0) ? myaVar : new mya(zt.d((b36) myaVar.b, i3, i4, i7, i9), i2, zt.d((b36) myaVar.c, i3, i4, i7, i9));
            default:
                mb3 mb3Var = (mb3) viewGroup;
                if (mb3Var.m) {
                    return myaVar;
                }
                View childAt = mb3Var.getChildAt(0);
                int iMax = Math.max(0, childAt.getLeft());
                int iMax2 = Math.max(0, childAt.getTop());
                int iMax3 = Math.max(0, mb3Var.getWidth() - childAt.getRight());
                int iMax4 = Math.max(0, mb3Var.getHeight() - childAt.getBottom());
                if (iMax == 0 && iMax2 == 0 && iMax3 == 0 && iMax4 == 0) {
                    return myaVar;
                }
                b36 b36VarC = b36.c(iMax, iMax2, iMax3, iMax4);
                int i10 = b36VarC.a;
                b36 b36Var = (b36) myaVar.b;
                int i11 = b36VarC.b;
                int i12 = b36VarC.c;
                int i13 = b36VarC.d;
                return new mya(z4f.e(b36Var, i10, i11, i12, i13), i2, z4f.e((b36) myaVar.c, i10, i11, i12, i13));
        }
    }
}
