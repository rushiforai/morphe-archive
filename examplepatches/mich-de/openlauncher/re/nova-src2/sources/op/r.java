package op;

import android.content.Context;
import java.time.Duration;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import pp.e0;
import pp.x;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final Context f80577a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f80578b;

    /* renamed from: c, reason: collision with root package name */
    public final qp.i f80579c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f80580d;

    /* renamed from: e, reason: collision with root package name */
    public LocalDate f80581e;

    /* renamed from: f, reason: collision with root package name */
    public long f80582f;

    /* renamed from: g, reason: collision with root package name */
    public long f80583g;

    public r(Context context, String installationId, boolean z11) {
        Intrinsics.g(context, "context");
        Intrinsics.g(installationId, "installationId");
        this.f80577a = context;
        this.f80578b = z11;
        this.f80579c = new qp.i(context, installationId);
        LocalDate MIN = LocalDate.MIN;
        Intrinsics.f(MIN, "MIN");
        this.f80581e = MIN;
        this.f80582f = Long.MIN_VALUE;
        Random.f71890a.getClass();
        this.f80583g = Random.f71891b.g(10, 60) * 60000;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(r rVar, LocalDate localDate, ContinuationImpl continuationImpl) throws Throwable {
        q qVar;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f80576w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f80576w = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(rVar, continuationImpl);
            }
        }
        Object objY = qVar.f80574u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f80576w;
        if (i11 == 0) {
            ResultKt.b(objY);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            iv.b bVar = new iv.b(localDate, null, 14);
            qVar.f80573t = rVar;
            qVar.f80576w = 1;
            objY = m0.y(dVar, bVar, qVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            rVar = qVar.f80573t;
            ResultKt.b(objY);
        }
        List<np.d> list = (List) objY;
        Duration duration = Duration.ZERO;
        if (!list.isEmpty()) {
            for (np.d dVar2 : list) {
                Context context = rVar.f80577a;
                Intrinsics.d(duration);
                np.f.a(context, dVar2);
            }
        }
        return Unit.f71706a;
    }

    public final void b(pp.o oVar) {
        if (this.f80578b) {
            qp.i iVar = this.f80579c;
            iVar.getClass();
            synchronized (iVar.f84309c) {
                np.d dVar = (np.d) iVar.f84310d;
                if (dVar != null) {
                    dVar.a(oVar);
                    Unit unit = Unit.f71706a;
                }
            }
        }
    }

    public final void c(x xVar) {
        if (this.f80578b) {
            qp.i iVar = this.f80579c;
            iVar.getClass();
            synchronized (iVar.f84309c) {
                ((ArrayList) iVar.f84311e).add(xVar);
                np.d dVar = (np.d) iVar.f84310d;
                if (dVar != null) {
                    dVar.b(xVar);
                    Unit unit = Unit.f71706a;
                }
            }
        }
    }

    public final void d(e0 e0Var) {
        if (this.f80578b) {
            qp.i iVar = this.f80579c;
            iVar.getClass();
            synchronized (iVar.f84309c) {
                try {
                    np.d dVar = (np.d) iVar.f84310d;
                    if (dVar != null) {
                        np.d.c(dVar, e0Var);
                    }
                    ((ArrayList) iVar.f84311e).add(e0Var);
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final void e(x7.f fVar) {
        if (this.f80578b) {
            qp.i iVar = this.f80579c;
            iVar.getClass();
            synchronized (iVar.f84309c) {
                try {
                    np.d dVar = (np.d) iVar.f84310d;
                    if (dVar != null) {
                        if (fVar instanceof o) {
                            dVar.A = ((o) fVar).f80571b;
                        } else if (fVar instanceof p) {
                            dVar.B = ((p) fVar).f80572b;
                        } else {
                            if (!(fVar instanceof n)) {
                                throw new NoWhenBranchMatchedException();
                            }
                            g gVar = (g) dVar.C.get(((n) fVar).c0());
                            if (gVar != null) {
                                gVar.a(((n) fVar).b0());
                            } else {
                                dVar.C.put(((n) fVar).c0(), ((n) fVar).b0());
                            }
                        }
                        Unit unit = Unit.f71706a;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }
}
