package a5;

import android.view.MenuItem;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final Runnable f366a;

    /* renamed from: b, reason: collision with root package name */
    public final CopyOnWriteArrayList f367b = new CopyOnWriteArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f368c = new HashMap();

    public t(Runnable runnable) {
        this.f366a = runnable;
    }

    public final boolean a(MenuItem menuItem) {
        Iterator it = this.f367b.iterator();
        while (it.hasNext()) {
            if (((androidx.fragment.app.z0) ((u) it.next())).f14725a.p(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public final void b(u uVar) {
        this.f367b.remove(uVar);
        s sVar = (s) this.f368c.remove(uVar);
        if (sVar != null) {
            sVar.a();
        }
        this.f366a.run();
    }
}
