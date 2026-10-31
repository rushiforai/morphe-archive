package e20;

import ads_mobile_sdk.d00;
import ads_mobile_sdk.ha2;
import ads_mobile_sdk.q31;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.os.Handler;
import c0.a2;
import c0.h2;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import p1.o2;
import t70.y0;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public boolean f52079a;

    /* renamed from: b, reason: collision with root package name */
    public Object f52080b;

    /* renamed from: c, reason: collision with root package name */
    public Object f52081c = c0.f.a(0.0f);

    /* renamed from: d, reason: collision with root package name */
    public Object f52082d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public Object f52083e;

    public r(boolean z11, Function0 function0) {
        this.f52079a = z11;
        this.f52080b = function0;
    }

    public static r a(d00 d00Var, q31 q31Var, ha2 ha2Var, ha2 ha2Var2, boolean z11) {
        if (d00Var == null) {
            throw new IllegalArgumentException("CreativeType is null");
        }
        if (q31Var == null) {
            throw new IllegalArgumentException("ImpressionType is null");
        }
        if (ha2Var == null) {
            throw new IllegalArgumentException("Impression owner is null");
        }
        if (ha2Var == ha2.f4272d) {
            throw new IllegalArgumentException("Impression owner is none");
        }
        d00 d00Var2 = d00.f2126b;
        ha2 ha2Var3 = ha2.f4270b;
        if (d00Var == d00Var2 && ha2Var == ha2Var3) {
            throw new IllegalArgumentException("ImpressionType/CreativeType can only be defined as DEFINED_BY_JAVASCRIPT if Impression Owner is JavaScript");
        }
        if (q31Var == q31.f8481b && ha2Var == ha2Var3) {
            throw new IllegalArgumentException("ImpressionType/CreativeType can only be defined as DEFINED_BY_JAVASCRIPT if Impression Owner is JavaScript");
        }
        r rVar = new r();
        rVar.f52082d = d00Var;
        rVar.f52083e = q31Var;
        rVar.f52080b = ha2Var;
        if (ha2Var2 == null) {
            rVar.f52081c = ha2.f4272d;
        } else {
            rVar.f52081c = ha2Var2;
        }
        rVar.f52079a = z11;
        return rVar;
    }

    public void b(k2.c cVar, float f11, long j11) {
        float fFloatValue = ((Number) ((c0.e) this.f52081c).e()).floatValue();
        if (fFloatValue > 0.0f) {
            long jB = i2.s.b(fFloatValue, j11);
            if (!this.f52079a) {
                cVar.mo81drawCircleVaOC9Bg(jB, f11, (120 & 4) != 0 ? cVar.mo93getCenterF1C5BW0() : 0L, 1.0f, (120 & 16) != 0 ? k2.j.f70871a : null, null, 3);
                return;
            }
            float fD = h2.e.d(cVar.mo94getSizeNHjbRc());
            float fB = h2.e.b(cVar.mo94getSizeNHjbRc());
            k2.d drawContext = cVar.getDrawContext();
            long jMo111getSizeNHjbRc = drawContext.mo111getSizeNHjbRc();
            drawContext.getCanvas().save();
            try {
                drawContext.getTransform().mo136clipRectN_I0leg(0.0f, 0.0f, fD, fB, 1);
                cVar.mo81drawCircleVaOC9Bg(jB, f11, (120 & 4) != 0 ? cVar.mo93getCenterF1C5BW0() : 0L, 1.0f, (120 & 16) != 0 ? k2.j.f70871a : null, null, 3);
            } finally {
                a2.c.x(drawContext, jMo111getSizeNHjbRc);
            }
        }
    }

    public int c() {
        return ((o2) this.f52080b).m();
    }

    public int d() {
        return ((o2) this.f52081c).m();
    }

    public void e(i0.h hVar, t70.j0 j0Var) {
        ArrayList arrayList = (ArrayList) this.f52082d;
        boolean z11 = hVar instanceof i0.f;
        if (z11) {
            arrayList.add(hVar);
        } else if (hVar instanceof i0.g) {
            arrayList.remove(((i0.g) hVar).a());
        } else if (hVar instanceof i0.d) {
            arrayList.add(hVar);
        } else if (hVar instanceof i0.e) {
            arrayList.remove(((i0.e) hVar).a());
        } else if (hVar instanceof i0.b) {
            arrayList.add(hVar);
        } else if (hVar instanceof i0.c) {
            arrayList.remove(((i0.c) hVar).a());
        } else if (!(hVar instanceof i0.a)) {
            return;
        } else {
            arrayList.remove(((i0.a) hVar).a());
        }
        i0.h hVar2 = (i0.h) b70.g.i1(arrayList);
        if (Intrinsics.b((i0.h) this.f52083e, hVar2)) {
            return;
        }
        Continuation continuation = null;
        if (hVar2 != null) {
            k1.e eVar = (k1.e) ((Function0) this.f52080b).invoke();
            float f11 = z11 ? eVar.f70825c : hVar instanceof i0.d ? eVar.f70824b : hVar instanceof i0.b ? eVar.f70823a : 0.0f;
            h2 h2Var = k1.k.f70842a;
            if (!(hVar2 instanceof i0.f) && ((hVar2 instanceof i0.d) || (hVar2 instanceof i0.b))) {
                h2Var = new h2(45, c0.b0.f18713d, 2);
            }
            t70.m0.t(j0Var, null, null, new a2(this, f11, h2Var, (Continuation) null), 3);
        } else {
            i0.h hVar3 = (i0.h) this.f52083e;
            h2 h2Var2 = k1.k.f70842a;
            if (!(hVar3 instanceof i0.f) && !(hVar3 instanceof i0.d) && (hVar3 instanceof i0.b)) {
                h2Var2 = new h2(PerAppFeatureCatalog.MAX_TOOLS, c0.b0.f18713d, 2);
            }
            t70.m0.t(j0Var, null, null, new h6.c(this, h2Var2, continuation, 24), 3);
        }
        this.f52083e = hVar2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object f(t70.j0 j0Var, ContinuationImpl continuationImpl) {
        p pVar;
        r rVar;
        r rVar2;
        if (continuationImpl instanceof p) {
            pVar = (p) continuationImpl;
            int i5 = pVar.f52075x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pVar.f52075x = i5 - Integer.MIN_VALUE;
            } else {
                pVar = new p(this, continuationImpl);
            }
        }
        Object objO = pVar.f52073v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pVar.f52075x;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objO);
            if (this.f52079a) {
                return Unit.f71706a;
            }
            vm.c cVar = (vm.c) this.f52080b;
            pVar.f52071t = this;
            pVar.f52072u = j0Var;
            pVar.f52075x = 1;
            objO = u1.o(((t5.g) cVar.f92857b).getData(), pVar);
            if (objO != coroutineSingletons) {
                rVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j0Var = pVar.f52072u;
            rVar2 = pVar.f52071t;
            ResultKt.b(objO);
            rVar2.f52079a = true;
            a80.e eVar = y0.f88884a;
            t70.m0.t(j0Var, a80.d.f488c, null, new a60.d(rVar2, continuation, 25), 2);
            return Unit.f71706a;
        }
        j0Var = pVar.f52072u;
        rVar = pVar.f52071t;
        ResultKt.b(objO);
        o oVar = (o) rVar.f52081c;
        List<v> list = (List) objO;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (v vVar : list) {
            arrayList.add(new Pair(new h(vVar.f52088b), new Long(vVar.f52087a)));
        }
        MapsKt.p0(oVar, arrayList);
        i2 i2Var = (i2) rVar.f52082d;
        Map mapS0 = MapsKt.s0((o) rVar.f52081c);
        pVar.f52071t = rVar;
        pVar.f52072u = j0Var;
        pVar.f52075x = 2;
        i2Var.getClass();
        i2Var.k(null, mapS0);
        if (Unit.f71706a != coroutineSingletons) {
            rVar2 = rVar;
            rVar2.f52079a = true;
            a80.e eVar2 = y0.f88884a;
            t70.m0.t(j0Var, a80.d.f488c, null, new a60.d(rVar2, continuation, 25), 2);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    public void g(MediaController mediaController) {
        PlaybackState playbackState;
        this.f52081c = mediaController;
        boolean z11 = false;
        if (mediaController != null && (playbackState = mediaController.getPlaybackState()) != null && playbackState.getState() == 3) {
            z11 = true;
        }
        h(z11);
        Handler handler = (Handler) this.f52082d;
        handler.removeCallbacksAndMessages(null);
        handler.postDelayed((a90.d) this.f52083e, 500L);
    }

    public void h(boolean z11) {
        Handler handler = (Handler) this.f52082d;
        if (this.f52079a == z11) {
            return;
        }
        this.f52079a = z11;
        if (!z11) {
            handler.removeCallbacksAndMessages(null);
        } else {
            handler.removeCallbacksAndMessages(null);
            handler.postDelayed((a90.d) this.f52083e, 500L);
        }
    }

    public void i(int i5, int i11) {
        if (i5 < 0.0f) {
            j0.b.a("Index should be non-negative (" + i5 + ')');
        }
        ((o2) this.f52080b).p(i5);
        ((n0.i0) this.f52083e).a(i5);
        ((o2) this.f52081c).p(i11);
    }
}
