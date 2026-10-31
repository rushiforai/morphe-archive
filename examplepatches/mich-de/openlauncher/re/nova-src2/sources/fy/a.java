package fy;

import android.content.Context;
import android.os.Looper;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.firebase.crashlytics.internal.common.m;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.internal.Intrinsics;
import mc0.d;
import pg.b;
import pg.c;
import r70.k;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static volatile Context f56174a;

    /* renamed from: b, reason: collision with root package name */
    public static volatile Boolean f56175b;

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicBoolean f56176c = new AtomicBoolean(false);

    /* renamed from: d, reason: collision with root package name */
    public static volatile CountDownLatch f56177d = new CountDownLatch(1);

    public static boolean a(Context context) {
        if (b.f82559e.b(context, c.f82561a) != 0) {
            return c(context);
        }
        try {
            AdvertisingIdClient.Info infoB = b(context, 30000L);
            boolean zIsLimitAdTrackingEnabled = infoB.isLimitAdTrackingEnabled();
            String id2 = infoB.getId();
            boolean z11 = true;
            boolean z12 = id2 == null || k.U0(id2) || Intrinsics.b(infoB.getId(), "00000000-0000-0000-0000-000000000000");
            if (!zIsLimitAdTrackingEnabled && !z12) {
                z11 = false;
            }
            context.getSharedPreferences("user_cohort_prefs", 0).edit().putBoolean("lat_cohort_cached", z11).apply();
            zy.c cVar = zy.c.f98823a;
            zy.c.m("lat_cohort", z11 ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
            d.f76206a.b("UserCohort: latEnabled=" + zIsLimitAdTrackingEnabled + ", noAdId=" + z12 + ", isLatCohort=" + z11, new Object[0]);
            return z11;
        } catch (TimeoutException unused) {
            boolean zC = c(context);
            d.f76206a.n(a2.c.l("UserCohort: getAdvertisingIdInfo timed out after 30000ms, using cached=", zC), new Object[0]);
            return zC;
        } catch (Exception e3) {
            boolean zC2 = c(context);
            d.f76206a.p(e3, a2.c.l("UserCohort: failed to get ad info, using cached=", zC2), new Object[0]);
            return zC2;
        }
    }

    public static AdvertisingIdClient.Info b(Context context, long j11) {
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
        try {
            return (AdvertisingIdClient.Info) executorServiceNewSingleThreadExecutor.submit(new m(context, 1)).get(j11, TimeUnit.MILLISECONDS);
        } finally {
            executorServiceNewSingleThreadExecutor.shutdownNow();
        }
    }

    public static boolean c(Context context) {
        return context.getSharedPreferences("user_cohort_prefs", 0).getBoolean("lat_cohort_cached", false);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0032 A[PHI: r0
      0x0032: PHI (r0v11 java.lang.Boolean) = (r0v4 java.lang.Boolean), (r0v7 java.lang.Boolean) binds: [B:13:0x0030, B:19:0x0045] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean d() {
        boolean zBooleanValue;
        Boolean bool = f56175b;
        if (bool != null) {
            zBooleanValue = bool.booleanValue();
        } else {
            try {
                f56177d.await(Intrinsics.b(Looper.myLooper(), Looper.getMainLooper()) ? 10L : 5000L, TimeUnit.MILLISECONDS);
            } catch (InterruptedException unused) {
                d.f76206a.n("UserCohort: isLatCohort wait interrupted", new Object[0]);
            }
            Boolean boolValueOf = f56175b;
            if (boolValueOf == null) {
                Context context = f56174a;
                boolValueOf = context != null ? Boolean.valueOf(c(context)) : null;
                zBooleanValue = boolValueOf != null ? boolValueOf.booleanValue() : false;
            }
        }
        zy.c cVar = zy.c.f98823a;
        return zBooleanValue && zy.c.d("ux_opt_7f3a", true);
    }
}
