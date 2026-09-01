package defpackage;

import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mpe extends nu {
    public final /* synthetic */ m45 b;
    public final /* synthetic */ m45 c;

    public mpe(m45 m45Var, m45 m45Var2) {
        this.b = m45Var;
        this.c = m45Var2;
    }

    @Override // defpackage.nu
    public final void a(Drawable drawable) {
        m45 m45Var = this.c;
        if (m45Var != null) {
            m45Var.invoke();
        }
    }

    @Override // defpackage.nu
    public final void b(Drawable drawable) {
        m45 m45Var = this.b;
        if (m45Var != null) {
            m45Var.invoke();
        }
    }
}
