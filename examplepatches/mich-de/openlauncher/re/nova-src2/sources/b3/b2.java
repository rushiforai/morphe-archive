package b3;

import androidx.compose.ui.node.LayoutNode;
import java.util.Comparator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b2 implements Comparator {

    /* renamed from: b, reason: collision with root package name */
    public static final b2 f17170b = new b2(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17171a;

    public /* synthetic */ b2(int i5) {
        this.f17171a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f17171a) {
            case 0:
                LayoutNode layoutNode = (LayoutNode) obj;
                LayoutNode layoutNode2 = (LayoutNode) obj2;
                int iH = Intrinsics.h(layoutNode2.getDepth(), layoutNode.getDepth());
                return iH != 0 ? iH : Intrinsics.h(layoutNode.hashCode(), layoutNode2.hashCode());
            default:
                LayoutNode layoutNode3 = (LayoutNode) obj;
                LayoutNode layoutNode4 = (LayoutNode) obj2;
                int iH2 = Intrinsics.h(layoutNode3.getDepth(), layoutNode4.getDepth());
                return iH2 != 0 ? iH2 : Intrinsics.h(layoutNode3.hashCode(), layoutNode4.hashCode());
        }
    }
}
