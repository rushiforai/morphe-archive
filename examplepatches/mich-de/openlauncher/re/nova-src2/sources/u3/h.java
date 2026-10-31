package u3;

import android.text.style.ClickableSpan;
import android.view.View;
import m3.n;
import m3.o;

/* loaded from: classes2.dex */
public final class h extends ClickableSpan {

    /* renamed from: a, reason: collision with root package name */
    public final n f90544a;

    public h(n nVar) {
        this.f90544a = nVar;
    }

    @Override // android.text.style.ClickableSpan
    public final void onClick(View view) {
        n nVar = this.f90544a;
        o oVarA = nVar.a();
        if (oVarA != null) {
            oVarA.a(nVar);
        }
    }
}
