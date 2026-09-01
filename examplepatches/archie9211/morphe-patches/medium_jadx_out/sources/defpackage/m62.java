package defpackage;

import android.os.Handler;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m62 implements p3b {
    public final z52 a;
    public Handler b;
    public final gjc c = new gjc(new l62(this, 0));
    public boolean d = true;
    public final l62 e = new l62(this, 1);
    public final ArrayList f = new ArrayList();

    public m62(z52 z52Var) {
        this.a = z52Var;
    }

    @Override // defpackage.p3b
    public final void c() {
        gjc gjcVar = this.c;
        o19 o19Var = gjcVar.h;
        if (o19Var != null) {
            o19Var.b();
        }
        gjcVar.a();
    }

    @Override // defpackage.p3b
    public final void d() {
        this.c.e();
    }

    @Override // defpackage.p3b
    public final void b() {
    }
}
