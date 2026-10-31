package fx;

import android.app.Activity;
import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import dx.j;
import dx.n;
import dx.q0;
import dx.t;
import dx.v0;
import dx.w0;
import ex.r;
import ex.u;
import gx.d0;
import gx.f0;
import gx.p;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final u f56162a;

    /* renamed from: b, reason: collision with root package name */
    public final c f56163b;

    /* renamed from: c, reason: collision with root package name */
    public final p f56164c;

    public e(u uVar, c cVar, p pVar) {
        this.f56162a = uVar;
        this.f56163b = cVar;
        this.f56164c = pVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Activity activity, String placement, ContinuationImpl continuationImpl) {
        d dVar;
        dx.e eVar;
        Object objA;
        e eVar2;
        List<dx.f> list;
        n jVar;
        r rVar;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f56161x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f56161x = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f56159v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f56161x;
        if (i11 == 0) {
            ResultKt.b(obj);
            Intrinsics.g(placement, "placement");
            q0 q0Var = (q0) ((dx.h) this.f56164c.f58149b.f58030e.getValue()).f49705a.get(new t(placement));
            if (q0Var != null && (list = q0Var.f49763b) != null) {
                for (dx.f fVar : list) {
                    eVar = fVar instanceof dx.e ? (dx.e) fVar : null;
                    if (eVar != null) {
                        break;
                    }
                }
            }
            eVar = null;
            if (eVar == null) {
                return new v0(dx.i.f49709a);
            }
            dVar.f56157t = this;
            dVar.f56158u = activity;
            dVar.f56161x = 1;
            objA = this.f56162a.a(eVar, activity, new d0(null), dVar);
            if (objA != coroutineSingletons) {
                eVar2 = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            rVar = (r) dVar.f56157t;
            try {
                ResultKt.b(obj);
                w0 w0Var = (w0) obj;
                rVar.destroy();
                return w0Var;
            } catch (Throwable th2) {
                th = th2;
                rVar.destroy();
                throw th;
            }
        }
        activity = dVar.f56158u;
        eVar2 = (e) dVar.f56157t;
        ResultKt.b(obj);
        objA = ((Result) obj).f71688a;
        Throwable thA = Result.a(objA);
        if (thA != null) {
            AdErrorException adErrorException = thA instanceof AdErrorException ? (AdErrorException) thA : null;
            if (adErrorException == null || (jVar = adErrorException.f45528a) == null) {
                String message = thA.getMessage();
                if (message == null) {
                    message = "load failure";
                }
                jVar = new j(message);
            }
            return new v0(jVar);
        }
        f0 f0Var = (f0) objA;
        r rVar2 = f0Var instanceof r ? (r) f0Var : null;
        if (rVar2 == null) {
            return new v0(new j("loaded non-rewarded ad"));
        }
        try {
            c cVar = eVar2.f56163b;
            dVar.f56157t = rVar2;
            dVar.f56158u = null;
            dVar.f56161x = 2;
            Object objA2 = cVar.a(activity, rVar2, dVar);
            if (objA2 != coroutineSingletons) {
                r rVar3 = rVar2;
                obj = objA2;
                rVar = rVar3;
                w0 w0Var2 = (w0) obj;
                rVar.destroy();
                return w0Var2;
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            rVar = rVar2;
            rVar.destroy();
            throw th;
        }
    }
}
