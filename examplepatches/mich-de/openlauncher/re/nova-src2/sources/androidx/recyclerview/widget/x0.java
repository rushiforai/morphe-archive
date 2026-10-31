package androidx.recyclerview.widget;

import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import java.util.List;

/* loaded from: classes.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f15169a;

    /* renamed from: b, reason: collision with root package name */
    public int f15170b;

    /* renamed from: c, reason: collision with root package name */
    public int f15171c;

    /* renamed from: d, reason: collision with root package name */
    public int f15172d;

    /* renamed from: e, reason: collision with root package name */
    public int f15173e;

    /* renamed from: f, reason: collision with root package name */
    public int f15174f;

    /* renamed from: g, reason: collision with root package name */
    public int f15175g;

    /* renamed from: h, reason: collision with root package name */
    public int f15176h;

    /* renamed from: i, reason: collision with root package name */
    public int f15177i;

    /* renamed from: j, reason: collision with root package name */
    public int f15178j;

    /* renamed from: k, reason: collision with root package name */
    public List f15179k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f15180l;

    public final void a(View view) {
        int layoutPosition;
        int size = this.f15179k.size();
        View view2 = null;
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        for (int i11 = 0; i11 < size; i11++) {
            View view3 = ((s2) this.f15179k.get(i11)).itemView;
            a2 a2Var = (a2) view3.getLayoutParams();
            if (view3 != view && !a2Var.f14880a.isRemoved() && (layoutPosition = (a2Var.f14880a.getLayoutPosition() - this.f15172d) * this.f15173e) >= 0 && layoutPosition < i5) {
                view2 = view3;
                if (layoutPosition == 0) {
                    break;
                } else {
                    i5 = layoutPosition;
                }
            }
        }
        if (view2 == null) {
            this.f15172d = -1;
        } else {
            this.f15172d = ((a2) view2.getLayoutParams()).f14880a.getLayoutPosition();
        }
    }

    public final View b(h2 h2Var) {
        List list = this.f15179k;
        if (list == null) {
            View view = h2Var.l(this.f15172d, Long.MAX_VALUE).itemView;
            this.f15172d += this.f15173e;
            return view;
        }
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            View view2 = ((s2) this.f15179k.get(i5)).itemView;
            a2 a2Var = (a2) view2.getLayoutParams();
            if (!a2Var.f14880a.isRemoved() && this.f15172d == a2Var.f14880a.getLayoutPosition()) {
                a(view2);
                return view2;
            }
        }
        return null;
    }
}
