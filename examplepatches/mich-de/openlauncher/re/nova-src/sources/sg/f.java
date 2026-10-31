package sg;

import android.accounts.Account;
import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Scope;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class f extends e implements qg.c {

    /* renamed from: b, reason: collision with root package name */
    public final Set f87429b;

    public f(Context context, Looper looper, int i5, bm.t tVar, qg.g gVar, qg.h hVar) {
        g0 g0VarA = g0.a(context);
        pg.b bVar = pg.b.f82559e;
        w.h(gVar);
        w.h(hVar);
        q.c cVar = new q.c(gVar, 23);
        k kVar = new k();
        kVar.f87446a = hVar;
        super(context, looper, g0VarA, bVar, i5, cVar, kVar, (String) tVar.f18113e);
        Set set = (Set) tVar.f18111c;
        Iterator it = set.iterator();
        while (it.hasNext()) {
            if (!set.contains((Scope) it.next())) {
                throw new IllegalStateException("Expanding scopes is not permitted, use implied scopes instead");
            }
        }
        this.f87429b = set;
    }

    @Override // sg.e
    public final Account getAccount() {
        return null;
    }

    @Override // sg.e
    public final Executor getBindServiceExecutor() {
        return null;
    }

    @Override // sg.e
    public final Set getScopes() {
        return this.f87429b;
    }
}
