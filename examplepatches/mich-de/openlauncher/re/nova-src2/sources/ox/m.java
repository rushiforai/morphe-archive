package ox;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes4.dex */
public final class m extends q9.u {

    /* renamed from: a, reason: collision with root package name */
    public final String f81091a;

    public m(String str) {
        this.f81091a = str;
    }

    @Override // q9.u
    public final int a(int i5) {
        return i5;
    }

    @Override // q9.u
    public final boolean b(int i5) {
        return i5 == 8388608;
    }

    @Override // q9.u
    public final void c(q9.l lVar, int i5) {
        View view = lVar.itemView;
        p pVar = view instanceof p ? (p) view : null;
        if (pVar == null) {
            return;
        }
        int i11 = p.f81095f;
        pVar.c(this.f81091a, null);
    }

    @Override // q9.u
    public final q9.l d(int i5, LayoutInflater layoutInflater, ViewGroup viewGroup) {
        int i11 = ((o9.l) o9.k.Y(viewGroup.getContext())).f79934x.f77138d0;
        p pVar = new p(viewGroup.getContext());
        pVar.setLayoutParams(new ViewGroup.LayoutParams(-1, i11));
        return new q9.l(pVar);
    }
}
