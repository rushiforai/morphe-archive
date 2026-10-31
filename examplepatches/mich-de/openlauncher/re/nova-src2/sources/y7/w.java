package y7;

import java.util.HashMap;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final vm.c f96778a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f96779b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f96780c = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    public final Object f96781d = new Object();

    static {
        o7.r.e("WorkTimer");
    }

    public w(vm.c cVar) {
        this.f96778a = cVar;
    }

    public final void a(x7.i iVar) {
        synchronized (this.f96781d) {
            try {
                if (((v) this.f96779b.remove(iVar)) != null) {
                    o7.r rVarC = o7.r.c();
                    Objects.toString(iVar);
                    rVarC.getClass();
                    this.f96780c.remove(iVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
