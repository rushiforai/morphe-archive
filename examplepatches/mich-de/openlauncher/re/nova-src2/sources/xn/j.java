package xn;

import java.lang.ref.WeakReference;
import java.util.Iterator;
import un.k;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: d, reason: collision with root package name */
    public static final j f96197d;

    /* renamed from: a, reason: collision with root package name */
    public WeakReference f96198a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f96199b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f96200c;

    static {
        j jVar = new j();
        jVar.f96199b = false;
        jVar.f96200c = false;
        f96197d = jVar;
    }

    public final void a(boolean z11, boolean z12) {
        if ((z12 || z11) == (this.f96200c || this.f96199b)) {
            return;
        }
        Iterator it = c.c().b().iterator();
        while (it.hasNext()) {
            ((k) it.next()).f().h(z12 || z11);
        }
    }
}
