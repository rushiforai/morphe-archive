package fe;

import android.content.Context;
import java.util.HashMap;
import xk.r2;

/* loaded from: classes3.dex */
public final /* synthetic */ class k implements vk.u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54870a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f54871b;

    public /* synthetic */ k(Context context, int i5) {
        this.f54870a = i5;
        this.f54871b = context;
    }

    @Override // vk.u
    public final Object get() {
        vf.p pVar;
        switch (this.f54870a) {
            case 0:
                return new c10.a(this.f54871b);
            case 1:
                Context context = this.f54871b;
                return new gf.j(new nx.l(context, 17), new ke.h());
            case 2:
                return new tf.o(this.f54871b);
            default:
                Context context2 = this.f54871b;
                r2 r2Var = vf.p.n;
                synchronized (vf.p.class) {
                    try {
                        if (vf.p.f92714t == null) {
                            vf.o oVar = new vf.o(context2);
                            vf.p.f92714t = new vf.p((Context) oVar.f92707c, (HashMap) oVar.f92708d, oVar.f92706b, (wf.q) oVar.f92709e, oVar.f92705a);
                        }
                        pVar = vf.p.f92714t;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return pVar;
        }
    }
}
