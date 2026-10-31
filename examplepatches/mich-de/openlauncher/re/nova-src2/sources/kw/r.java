package kw;

import androidx.compose.ui.node.LayoutNode;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements z2.z0 {

    /* renamed from: a, reason: collision with root package name */
    public static final r f72586a = new r();

    @Override // z2.z0
    public final z2.s0 e(z2.t0 Layout, List list, long j11) {
        Intrinsics.g(Layout, "$this$Layout");
        List list2 = (List) list.get(0);
        List list3 = (List) list.get(1);
        if (list2.size() != 1) {
            throw new IllegalArgumentException("startContentMeasurables should only emit one composable");
        }
        if (list3.size() != 1) {
            throw new IllegalArgumentException("textContentMeasurables should only emit one composable");
        }
        z2.i1 i1VarH = ((z2.q0) b70.g.W0(list2)).H(y3.a.a(j11, 0, LayoutNode.NotPlacedPlaceOrder, 0, 0, 12));
        int iH = y3.a.h(j11) - i1VarH.f98081a;
        z2.i1 i1VarH2 = ((z2.q0) b70.g.W0(list3)).H(y3.a.a(j11, iH, iH, 0, 0, 12));
        if (i1VarH2.O(z2.c.f98028a) == Integer.MIN_VALUE) {
            throw new IllegalArgumentException("textContentPlaceable should have a first baseline");
        }
        int iO = (int) (i1VarH2.O(r12) * 1.2d);
        int iAbs = Math.abs(i1VarH.f98082b - iO) / 2;
        int i5 = i1VarH.f98081a + i1VarH2.f98081a;
        int i11 = i1VarH.f98082b;
        return Layout.y(i5, iO > i11 ? Math.max(i11 + iAbs, i1VarH2.f98082b) : Math.max(i11, i1VarH2.f98082b + iAbs), b70.h.f17594a, new f1.c(iO, i1VarH, iAbs, i1VarH2));
    }
}
