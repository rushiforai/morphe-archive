package defpackage;

import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w94 extends vxa {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ w94(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.vxa
    public final void a(RecyclerView recyclerView, int i, int i2) {
        int i3 = this.a;
        Object obj = this.b;
        switch (i3) {
            case 0:
                y94 y94Var = (y94) obj;
                int iComputeHorizontalScrollOffset = recyclerView.computeHorizontalScrollOffset();
                int iComputeVerticalScrollOffset = recyclerView.computeVerticalScrollOffset();
                int i4 = y94Var.a;
                int iComputeVerticalScrollRange = y94Var.s.computeVerticalScrollRange();
                int i5 = y94Var.r;
                y94Var.t = iComputeVerticalScrollRange - i5 > 0 && i5 >= i4;
                int iComputeHorizontalScrollRange = y94Var.s.computeHorizontalScrollRange();
                int i6 = y94Var.q;
                boolean z = iComputeHorizontalScrollRange - i6 > 0 && i6 >= i4;
                y94Var.u = z;
                boolean z2 = y94Var.t;
                if (z2 || z) {
                    if (z2) {
                        float f = i5;
                        y94Var.l = (int) ((((f / 2.0f) + iComputeVerticalScrollOffset) * f) / iComputeVerticalScrollRange);
                        y94Var.k = Math.min(i5, (i5 * i5) / iComputeVerticalScrollRange);
                    }
                    if (y94Var.u) {
                        float f2 = iComputeHorizontalScrollOffset;
                        float f3 = i6;
                        y94Var.o = (int) ((((f3 / 2.0f) + f2) * f3) / iComputeHorizontalScrollRange);
                        y94Var.n = Math.min(i6, (i6 * i6) / iComputeHorizontalScrollRange);
                    }
                    int i7 = y94Var.v;
                    if (i7 == 0 || i7 == 1) {
                        y94Var.e(1);
                    }
                } else if (y94Var.v != 0) {
                    y94Var.e(0);
                }
                break;
            default:
                ((PostFragment) obj).q1();
                break;
        }
    }
}
