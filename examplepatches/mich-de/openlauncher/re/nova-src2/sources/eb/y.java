package eb;

import android.view.ViewGroup;
import androidx.recyclerview.widget.s2;
import b00.b1;
import java.util.List;

/* loaded from: classes2.dex */
public final class y implements na.a {

    /* renamed from: a, reason: collision with root package name */
    public final g f52529a;

    public y(g gVar) {
        this.f52529a = gVar;
    }

    @Override // na.a
    public final s2 b(ViewGroup viewGroup) {
        x xVar = new x(viewGroup.getContext());
        xVar.f52528b = 0;
        xVar.animate().setUpdateListener(new b1(xVar, 2));
        return new w(xVar);
    }

    @Override // na.a
    public final void c(s2 s2Var, Object obj, int i5, List list) {
        x xVar = (x) s2Var.itemView;
        this.f52529a.getAsInt();
        if (xVar.f52528b != 0) {
            xVar.f52528b = 0;
            xVar.requestLayout();
        }
    }
}
