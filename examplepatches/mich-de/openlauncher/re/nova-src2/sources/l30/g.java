package l30;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import r.t1;
import vk.b0;
import wk.g0;
import wk.t;
import wk.u;

/* loaded from: classes4.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final wk.n f74639a;

    static {
        wk.d dVarA = wk.d.a();
        t tVar = dVarA.f94510a;
        if (!(tVar == null)) {
            throw new IllegalStateException(b0.p("Key strength was already set to %s", tVar));
        }
        t tVar2 = u.f94573c;
        dVarA.f94510a = tVar2;
        dVarA.b(tVar2);
        f74639a = new wk.n(dVarA);
    }

    public static void a(Context context, e eVar) {
        Context context2 = null;
        if (context != null) {
            while (true) {
                if (!(context instanceof Application)) {
                    if (!(context instanceof Activity)) {
                        if (!(context instanceof ContextWrapper)) {
                            context2 = context;
                            break;
                        }
                        Context baseContext = ((ContextWrapper) context).getBaseContext();
                        if (baseContext == context) {
                            break;
                        } else {
                            context = baseContext;
                        }
                    } else {
                        context2 = (Activity) context;
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        if (context2 != null) {
            wk.n nVar = f74639a;
            g0 g0Var = nVar.f94554a;
            wk.a aVar = g0Var.n;
            int iC = g0Var.c(context2);
            Object objG = g0Var.d(iC).g(iC, context2);
            if (objG == null) {
                aVar.c();
            } else {
                aVar.b();
            }
            Object obj = (f) objG;
            if (obj != null) {
                ((t1) obj).dismiss();
            }
            nVar.f94554a.put(context2, eVar);
        }
    }
}
