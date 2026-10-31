package y7;

import java.util.Objects;

/* loaded from: classes2.dex */
public final class v implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final w f96776a;

    /* renamed from: b, reason: collision with root package name */
    public final x7.i f96777b;

    public v(w wVar, x7.i iVar) {
        this.f96776a = wVar;
        this.f96777b = iVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.f96776a.f96781d) {
            try {
                if (((v) this.f96776a.f96779b.remove(this.f96777b)) != null) {
                    u uVar = (u) this.f96776a.f96780c.remove(this.f96777b);
                    if (uVar != null) {
                        x7.i iVar = this.f96777b;
                        r7.g gVar = (r7.g) uVar;
                        o7.r rVarC = o7.r.c();
                        Objects.toString(iVar);
                        rVarC.getClass();
                        gVar.f85584h.execute(new r7.f(gVar, 0));
                    }
                } else {
                    o7.r rVarC2 = o7.r.c();
                    this.f96777b.toString();
                    rVarC2.getClass();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
