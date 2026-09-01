package defpackage;

import android.text.style.ClickableSpan;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y02 extends ClickableSpan {
    public final d07 a;

    public y02(d07 d07Var) {
        this.a = d07Var;
    }

    @Override // android.text.style.ClickableSpan
    public final void onClick(View view) {
        d07 d07Var = this.a;
        e07 e07VarA = d07Var.a();
        if (e07VarA != null) {
            e07VarA.a(d07Var);
        }
    }
}
