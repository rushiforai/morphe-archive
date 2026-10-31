package p10;

import android.app.Activity;
import android.content.Context;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.PropertyReference2Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KProperty;
import t70.p2;

/* loaded from: classes4.dex */
public final class r1 {

    /* renamed from: a, reason: collision with root package name */
    public static final r1 f81885a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f81886b;

    /* renamed from: c, reason: collision with root package name */
    public static final x5.b f81887c;

    /* renamed from: d, reason: collision with root package name */
    public static final x5.b f81888d;

    /* renamed from: e, reason: collision with root package name */
    public static final x5.b f81889e;

    /* renamed from: f, reason: collision with root package name */
    public static final x5.b f81890f;

    static {
        PropertyReference2Impl propertyReference2Impl = new PropertyReference2Impl(r1.class, "coinLedgerStore", "getCoinLedgerStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;");
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        f81886b = new KProperty[]{reflectionFactory.property2(propertyReference2Impl), reflectionFactory.property2(new PropertyReference2Impl(r1.class, "checkInStore", "getCheckInStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;")), reflectionFactory.property2(new PropertyReference2Impl(r1.class, "rewardedStore", "getRewardedStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;")), reflectionFactory.property2(new PropertyReference2Impl(r1.class, "streakStore", "getStreakStore(Landroid/content/Context;)Landroidx/datastore/core/DataStore;"))};
        f81885a = new r1();
        f81887c = v70.o.j("rewards_coin_ledger", null, null, 14);
        f81888d = v70.o.j("rewards_checkin", null, null, 14);
        f81889e = v70.o.j("rewards_rewarded", null, null, 14);
        f81890f = v70.o.j("rewards_streak", null, null, 14);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(r1 r1Var, Activity activity, Continuation continuation) {
        q1 q1Var;
        r1Var.getClass();
        if (continuation instanceof q1) {
            q1Var = (q1) continuation;
            int i5 = q1Var.f81881v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q1Var.f81881v = i5 - Integer.MIN_VALUE;
            } else {
                q1Var = new q1(r1Var, continuation);
            }
        }
        Object objD = q1Var.f81879t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q1Var.f81881v;
        if (i11 == 0) {
            ResultKt.b(objD);
            zy.c cVar = zy.c.f98823a;
            if (!zy.c.c("rewarded_ads_enabled")) {
                return Boolean.FALSE;
            }
            mx.e0 e0Var = new mx.e0(activity, (Continuation) null, 12);
            q1Var.f81881v = 1;
            objD = p2.d(90000L, e0Var, q1Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
        }
        Boolean bool = (Boolean) objD;
        return Boolean.valueOf(bool != null ? bool.booleanValue() : false);
    }

    public static s b(Context context) {
        return new s((t5.g) f81887c.getValue(context.getApplicationContext(), f81886b[0]));
    }

    public static y c(Context context) {
        Context applicationContext = context.getApplicationContext();
        return new y(new h2((t5.g) f81890f.getValue(applicationContext, f81886b[3])), new n00.d(applicationContext, 5));
    }

    public static boolean d(boolean z11, boolean z12) {
        return z11 && z12;
    }
}
