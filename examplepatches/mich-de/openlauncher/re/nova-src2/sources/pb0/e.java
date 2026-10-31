package pb0;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.concurrent.ScheduledExecutorService;
import nb0.s;

/* loaded from: classes5.dex */
public final class e extends ib0.g {

    /* renamed from: a, reason: collision with root package name */
    public final rb0.h f82511a;

    /* renamed from: b, reason: collision with root package name */
    public final rb0.h f82512b;

    /* renamed from: c, reason: collision with root package name */
    public final g f82513c;

    public e(g gVar) {
        rb0.h hVar = new rb0.h();
        this.f82511a = hVar;
        ib0.i[] iVarArr = {hVar, new xb0.c()};
        rb0.h hVar2 = new rb0.h();
        hVar2.f85788a = new LinkedList(Arrays.asList(iVarArr));
        this.f82512b = hVar2;
        this.f82513c = gVar;
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f82512b.f85789b;
    }

    @Override // ib0.i
    public final void b() {
        this.f82512b.b();
    }

    @Override // ib0.g
    public final ib0.i c(mb0.a aVar) {
        if (this.f82512b.f85789b) {
            return xb0.e.f95758a;
        }
        g gVar = this.f82513c;
        s sVar = new s(2, this, aVar);
        rb0.h hVar = this.f82511a;
        ScheduledExecutorService scheduledExecutorService = gVar.f82527a;
        l lVar = new l(ub0.a.c(sVar), hVar);
        hVar.c(lVar);
        lVar.f82534a.c(new j(lVar, scheduledExecutorService.submit(lVar)));
        return lVar;
    }
}
