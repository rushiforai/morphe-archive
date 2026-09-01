package defpackage;

import android.content.Context;
import android.view.KeyEvent;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eu extends co6 implements m45 {
    public final /* synthetic */ Context a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ n65 c;
    public final /* synthetic */ qob d;
    public final /* synthetic */ int e;
    public final /* synthetic */ View f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public eu(Context context, x45 x45Var, n65 n65Var, qob qobVar, int i, View view) {
        super(0);
        this.a = context;
        this.b = x45Var;
        this.c = n65Var;
        this.d = qobVar;
        this.e = i;
        this.f = view;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        KeyEvent.Callback callback = this.f;
        callback.getClass();
        return new due(this.a, this.b, this.c, this.d, this.e, (mx8) callback).getLayoutNode();
    }
}
