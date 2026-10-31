package o00;

import android.app.Activity;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import du.t;
import e10.y2;
import java.lang.annotation.Annotation;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.UUID;
import kotlin.KotlinNothingValueException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlin.text.CharDirectionality;
import kotlin.time.AbstractLongTimeSource;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SealedClassSerializer;
import p1.u;
import p1.z2;
import pp.a0;
import pp.c0;
import pp.e0;
import pp.p;
import pp.x;
import ps.d0;
import ps.g0;
import qx.i1;
import qx.l;
import qx.v0;
import qx.w0;
import t70.k0;
import t70.m0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78865a;

    public /* synthetic */ d(int i5) {
        this.f78865a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Activity activity;
        boolean z11 = false;
        Continuation continuation = null;
        int i5 = 1;
        switch (this.f78865a) {
            case 0:
                return androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            case 1:
                y2.f51877a.getClass();
                return ul.b.Q(y2.p0(), y2.q0(), y2.B0(), y2.v0(), y2.r0(), y2.s0(), y2.A0(), y2.z0(), y2.m0(), y2.t0(), y2.u0(), y2.o0(), y2.n0(), y2.x0(), y2.y0());
            case 2:
                z2 z2Var = os.g.f80777a;
                return null;
            case 3:
                throw new IllegalStateException("No Typography provided");
            case 4:
                throw new IllegalStateException("No Colors provided");
            case 5:
                throw new IllegalStateException("No Shapes provided");
            case 6:
                return null;
            case 7:
                return Unit.f71706a;
            case 8:
                i70.a aVar = l.f84550l;
                if (aVar == null || !aVar.isEmpty()) {
                    Iterator it = aVar.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            if (((l) it.next()).h()) {
                                ox.f fVar = ox.f.f81065a;
                                LinkedHashSet linkedHashSet = new LinkedHashSet();
                                i70.a aVar2 = l.f84550l;
                                ArrayList arrayList = new ArrayList();
                                Iterator it2 = aVar2.iterator();
                                while (it2.hasNext()) {
                                    Object next = it2.next();
                                    l lVar = (l) next;
                                    if (lVar.h() && ox.f.f81071g.contains(lVar)) {
                                        arrayList.add(next);
                                    }
                                }
                                Iterator it3 = arrayList.iterator();
                                while (it3.hasNext()) {
                                    l lVar2 = (l) it3.next();
                                    if (linkedHashSet.add(lVar2.c())) {
                                        i1 i1VarB = ox.f.f81065a.b(lVar2);
                                        WeakReference weakReference = ox.f.f81070f;
                                        if (weakReference == null || (activity = (Activity) weakReference.get()) == null || activity.isFinishing() || activity.isDestroyed()) {
                                            activity = null;
                                        }
                                        i1VarB.g(lVar2, activity);
                                    }
                                    ox.f.f81065a.a(lVar2);
                                }
                                l lVar3 = l.f84548j;
                                if (lVar3.h()) {
                                    w0 w0VarA = fVar.a(lVar3);
                                    if (w0VarA.f84635b.a() == qx.i.f84512d) {
                                        zy.c cVar = zy.c.f98823a;
                                        int iG = zy.c.g("icon_ad_batch_size", 4);
                                        if (k0.f(w0VarA.f84644k)) {
                                            synchronized (w0VarA.f84637d) {
                                                if (!w0VarA.f84641h && w0VarA.f84640g.isEmpty()) {
                                                    w0VarA.f84641h = true;
                                                    z11 = true;
                                                }
                                            }
                                            if (z11) {
                                                m0.t(w0VarA.f84644k, null, null, new v0(iG, w0VarA, continuation, i5), 3);
                                            }
                                        }
                                    } else {
                                        w0VarA.p(null);
                                    }
                                }
                            }
                        }
                    }
                }
                return Unit.f71706a;
            case 9:
                return Unit.f71706a;
            case 10:
                u.d("Unexpected call to default provider");
                throw new KotlinNothingValueException();
            case 11:
                zy.c cVar2 = zy.c.f98823a;
                return zy.c.h("rewards_video_coins_by_country");
            case 12:
                zy.c cVar3 = zy.c.f98823a;
                return Long.valueOf(zy.c.g("rewards_video_coins_floor", 4));
            case 13:
                zy.c cVar4 = zy.c.f98823a;
                return Double.valueOf(zy.c.f("rewards_checkin_video_ratio", 0.5d));
            case 14:
                zy.c cVar5 = zy.c.f98823a;
                return Double.valueOf(zy.c.f("rewards_streak_base_ratio", 0.7d));
            case 15:
                zy.c cVar6 = zy.c.f98823a;
                return Integer.valueOf(zy.c.g("rewards_streak_ramp_days", 7));
            case 16:
                zy.c cVar7 = zy.c.f98823a;
                return Integer.valueOf(zy.c.g("rewards_rewarded_daily_cap", 5));
            case 17:
                return Unit.f71706a;
            case 18:
                zy.c cVar8 = zy.c.f98823a;
                return Long.valueOf(zy.c.g("rewards_onboarding_bonus_coins", 50));
            case 19:
                ReflectionFactory reflectionFactory = Reflection.f71864a;
                return new SealedClassSerializer("com.novalauncher.novalytics.stats.events.MetricsEvent", reflectionFactory.getOrCreateKotlinClass(a0.class), new KClass[]{reflectionFactory.getOrCreateKotlinClass(pp.c.class), reflectionFactory.getOrCreateKotlinClass(pp.h.class), reflectionFactory.getOrCreateKotlinClass(x.class), reflectionFactory.getOrCreateKotlinClass(e0.class)}, new KSerializer[]{pp.a.f82686a, pp.d.f82703a, p.f82765a, c0.f82702a}, new Annotation[0]);
            case 20:
                p1.m0 m0Var = d0.f82853a;
                return null;
            case 21:
                p1.m0 m0Var2 = g0.f82876a;
                return null;
            case 22:
                return Unit.f71706a;
            case 23:
                throw new IllegalStateException("No ImageLoader provided");
            case 24:
                i70.a aVar3 = CharDirectionality.f71997c;
                int iD0 = b70.k.d0(b70.c.u0(aVar3, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                Iterator it4 = aVar3.iterator();
                while (it4.hasNext()) {
                    Object next2 = it4.next();
                    linkedHashMap.put(Integer.valueOf(((CharDirectionality) next2).f71998a), next2);
                }
                return linkedHashMap;
            case 25:
                return UUID.randomUUID().toString();
            case 26:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 27:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 28:
                return 0L;
            default:
                int i11 = FinancialConnectionsSheetLiteActivity.f42693r;
                return new t(i5);
        }
    }

    public /* synthetic */ d(AbstractLongTimeSource abstractLongTimeSource) {
        this.f78865a = 28;
    }
}
