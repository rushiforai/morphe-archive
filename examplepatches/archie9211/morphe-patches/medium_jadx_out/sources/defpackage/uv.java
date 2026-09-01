package defpackage;

import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uv extends p4d implements b55 {
    public final /* synthetic */ Drawable b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ m45 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uv(Drawable drawable, m45 m45Var, m45 m45Var2, n92 n92Var) {
        super(2, n92Var);
        this.b = drawable;
        this.c = m45Var;
        this.d = m45Var2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new uv(this.b, this.c, this.d, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        uv uvVar = (uv) create((sb2) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        uvVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        ((AnimatedImageDrawable) this.b).registerAnimationCallback(new lpe(this.c, this.d));
        return c1e.a;
    }
}
