package c4;

import a5.h2;
import a5.l1;
import a5.t1;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.graphics.Insets;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import java.util.List;

/* loaded from: classes2.dex */
public final class w extends l1 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f19635c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f19636d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w(ViewGroup viewGroup, int i5) {
        super(1);
        this.f19635c = i5;
        this.f19636d = viewGroup;
    }

    @Override // a5.l1
    public final h2 f(h2 h2Var, List list) {
        int i5 = this.f19635c;
        ViewGroup viewGroup = this.f19636d;
        switch (i5) {
            case 0:
                x xVar = (x) viewGroup;
                if (xVar.f19640d) {
                    return h2Var;
                }
                View childAt = xVar.getChildAt(0);
                int iMax = Math.max(0, childAt.getLeft());
                int iMax2 = Math.max(0, childAt.getTop());
                int iMax3 = Math.max(0, xVar.getWidth() - childAt.getRight());
                int iMax4 = Math.max(0, xVar.getHeight() - childAt.getBottom());
                return (iMax == 0 && iMax2 == 0 && iMax3 == 0 && iMax4 == 0) ? h2Var : h2Var.f296a.n(iMax, iMax2, iMax3, iMax4);
            default:
                int i11 = EditShortcutFloatingView.f45599v;
                ((EditShortcutFloatingView) viewGroup).g0(h2Var);
                return h2Var;
        }
    }

    @Override // a5.l1
    public c10.a g(t1 t1Var, c10.a aVar) {
        switch (this.f19635c) {
            case 0:
                x xVar = (x) this.f19636d;
                if (xVar.f19640d) {
                    return aVar;
                }
                View childAt = xVar.getChildAt(0);
                int iMax = Math.max(0, childAt.getLeft());
                int iMax2 = Math.max(0, childAt.getTop());
                int iMax3 = Math.max(0, xVar.getWidth() - childAt.getRight());
                int iMax4 = Math.max(0, xVar.getHeight() - childAt.getBottom());
                if (iMax == 0 && iMax2 == 0 && iMax3 == 0 && iMax4 == 0) {
                    return aVar;
                }
                Insets insetsOf = Insets.of(iMax, iMax2, iMax3, iMax4);
                return new c10.a(1, h2.e((Insets) aVar.f19148b, insetsOf.left, insetsOf.top, insetsOf.right, insetsOf.bottom), h2.e((Insets) aVar.f19149c, insetsOf.left, insetsOf.top, insetsOf.right, insetsOf.bottom));
            default:
                return aVar;
        }
    }
}
