package j10;

import android.content.Context;
import android.os.Build;
import com.amplitude.android.TrackingOptions;
import com.teslacoilsw.launcher.NovaApplication;
import h10.k1;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import k30.h0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import p10.c0;
import t70.i2;
import t70.k0;
import t70.m0;
import t70.y0;
import tx.r;
import w20.e0;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f68612a = new h();

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicBoolean f68613b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicBoolean f68614c = new AtomicBoolean(false);

    /* renamed from: d, reason: collision with root package name */
    public static final AtomicBoolean f68615d = new AtomicBoolean(false);

    /* renamed from: e, reason: collision with root package name */
    public static final y70.d f68616e;

    static {
        i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        f68616e = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(h hVar, Context context, Continuation continuation) {
        g gVar;
        hVar.getClass();
        if (continuation instanceof g) {
            gVar = (g) continuation;
            int i5 = gVar.f68611w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f68611w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(hVar, continuation);
            }
        }
        Object obj = gVar.f68609u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f68611w;
        if (i11 == 0) {
            ResultKt.b(obj);
            h0 h0Var = h0.f70974r;
            h0 h0VarP = lm.e.p(context);
            y70.d dVar = h0VarP.f70984j;
            a80.e eVar = y0.f88884a;
            m0.t(dVar, a80.d.f488c, null, new iv.b(h0VarP, null, 4), 2);
            e0.b(new ar.c(context, 28));
            if (f68614c.compareAndSet(false, true)) {
                zy.c cVar = zy.c.f98823a;
                zy.c.m("country", null);
                zy.c.m(TrackingOptions.AMP_TRACKING_OPTION_REGION, null);
                yx.b bVar = yx.b.f97678a;
                yx.b.a("country");
                yx.b.a(TrackingOptions.AMP_TRACKING_OPTION_REGION);
            }
            if (c0.v(context)) {
                c0.w(context);
            }
            r rVar = r.f89974e;
            gVar.f68608t = context;
            gVar.f68611w = 1;
            if (rVar.c(context, gVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            context = gVar.f68608t;
            ResultKt.b(obj);
        }
        List list = n.f68647a;
        if (Build.VERSION.SDK_INT >= 33) {
            List list2 = n.f68647a;
            ArrayList arrayList = new ArrayList();
            for (Object obj2 : list2) {
                if (o4.a.a(context, (String) obj2) == 0) {
                    arrayList.add(obj2);
                }
            }
            if (!arrayList.isEmpty()) {
                if (Build.VERSION.SDK_INT >= 33) {
                    context.revokeSelfPermissionsOnKill(arrayList);
                }
                Unit unit = Unit.f71706a;
            }
            arrayList.size();
        }
        return Unit.f71706a;
    }

    public final void b(NovaApplication novaApplication) {
        int i5 = 0;
        if (f68613b.compareAndSet(false, true)) {
            m mVar = m.f68628a;
            m.f68637j.add(new k1(2, this, h.class, "run", "run(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 6));
            Context applicationContext = novaApplication.getApplicationContext();
            m0.t(f68616e, null, null, new f(applicationContext, !(m.c(applicationContext) != i.f68617a), null, i5), 3);
        }
    }
}
