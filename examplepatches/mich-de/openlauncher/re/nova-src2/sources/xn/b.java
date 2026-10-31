package xn;

import android.view.View;
import java.util.Iterator;
import un.k;

/* loaded from: classes.dex */
public final class b extends e {

    /* renamed from: d, reason: collision with root package name */
    public static final b f96181d = new b();

    @Override // xn.e
    public final void a(boolean z11) {
        Iterator it = c.c().b().iterator();
        while (it.hasNext()) {
            ((k) it.next()).f().f(z11);
        }
    }

    @Override // xn.e
    public final boolean b() {
        Iterator it = c.c().a().iterator();
        while (it.hasNext()) {
            View viewG = ((k) it.next()).g();
            if (viewG != null && viewG.hasWindowFocus()) {
                return true;
            }
        }
        return false;
    }
}
