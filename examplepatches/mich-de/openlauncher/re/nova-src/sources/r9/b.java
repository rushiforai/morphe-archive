package r9;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import q9.l;
import q9.u;

/* loaded from: classes.dex */
public final class b extends u {

    /* renamed from: a, reason: collision with root package name */
    public final a f85745a = new a();

    /* renamed from: b, reason: collision with root package name */
    public View f85746b;

    @Override // q9.u
    public final boolean b(int i5) {
        return false;
    }

    @Override // q9.u
    public final void c(l lVar, int i5) {
        if (i5 == 0) {
            this.f85746b = lVar.itemView;
        }
    }

    @Override // q9.u
    public final l d(int i5, LayoutInflater layoutInflater, ViewGroup viewGroup) {
        return null;
    }
}
