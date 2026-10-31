package b4;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewParent;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.LayoutNode;
import g2.z;

/* loaded from: classes.dex */
public abstract class o {

    /* renamed from: a, reason: collision with root package name */
    public static final n f17504a = new n();

    public static final boolean a(View view, View view2) {
        for (ViewParent parent = view2.getParent(); parent != null; parent = parent.getParent()) {
            if (parent == view.getParent()) {
                return true;
            }
        }
        return false;
    }

    public static final Rect b(g2.j jVar, View view, View view2) {
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        int[] iArr2 = new int[2];
        view2.getLocationOnScreen(iArr2);
        z zVarC = g2.g.c(((g2.l) jVar).f56876c);
        h2.c cVarD = zVarC != null ? g2.g.d(zVarC) : null;
        if (cVarD == null) {
            return null;
        }
        int i5 = (int) cVarD.f59018a;
        int i11 = iArr[0];
        int i12 = iArr2[0];
        int i13 = (int) cVarD.f59019b;
        int i14 = iArr[1];
        int i15 = iArr2[1];
        return new Rect((i5 + i11) - i12, (i13 + i14) - i15, (((int) cVarD.f59020c) + i11) - i12, (((int) cVarD.f59021d) + i14) - i15);
    }

    public static final View c(Modifier$Node modifier$Node) {
        View interopView = b3.o.f(modifier$Node.getNode()).getInteropView();
        if (interopView != null) {
            return interopView;
        }
        throw new IllegalStateException("Could not fetch interop view");
    }

    public static final void d(View view, LayoutNode layoutNode) {
        long jM = layoutNode.getCoordinates().M(0L);
        int iRound = Math.round(Float.intBitsToFloat((int) (jM >> 32)));
        int iRound2 = Math.round(Float.intBitsToFloat((int) (jM & 4294967295L)));
        view.layout(iRound, iRound2, view.getMeasuredWidth() + iRound, view.getMeasuredHeight() + iRound2);
    }
}
