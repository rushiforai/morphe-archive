package d00;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;
import com.instabridge.mobilesdk.MobileSdk;
import cw.r3;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import p1.e1;
import p1.s2;
import t70.k0;
import t70.m0;
import t70.y0;
import w20.e0;

/* loaded from: classes.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public static final y f48721a = new y();

    /* renamed from: b, reason: collision with root package name */
    public static final Object f48722b;

    /* renamed from: c, reason: collision with root package name */
    public static final String f48723c;

    /* renamed from: d, reason: collision with root package name */
    public static final AtomicBoolean f48724d;

    /* renamed from: e, reason: collision with root package name */
    public static final e1 f48725e;

    /* renamed from: f, reason: collision with root package name */
    public static final e1 f48726f;

    /* renamed from: g, reason: collision with root package name */
    public static final y70.d f48727g;

    /* renamed from: h, reason: collision with root package name */
    public static final AtomicBoolean f48728h;

    /* renamed from: i, reason: collision with root package name */
    public static volatile long f48729i;

    /* renamed from: j, reason: collision with root package name */
    public static volatile long f48730j;

    /* renamed from: k, reason: collision with root package name */
    public static final AtomicBoolean f48731k;

    static {
        String str = Build.MODEL;
        Pair pair = new Pair("X-Device-Model", str);
        int i5 = Build.VERSION.SDK_INT;
        f48722b = MapsKt.j0(pair, new Pair("X-Device-SDK", String.valueOf(i5)), new Pair("X-App-Package", "com.teslacoilsw.launcher"), new Pair("X-App-Version", "89400"));
        f48723c = Uri.parse("https://mobile.novalauncher.com/").buildUpon().appendQueryParameter("deviceModel", str).appendQueryParameter("deviceSdk", String.valueOf(i5)).appendQueryParameter("app_package", "com.teslacoilsw.launcher").appendQueryParameter("app_version", "89400").build().toString();
        f48724d = new AtomicBoolean(false);
        f48725e = androidx.compose.runtime.d.k(Boolean.FALSE);
        f48726f = androidx.compose.runtime.d.k(p.f48706a);
        f48727g = k0.a(CoroutineContext.Element.DefaultImpls.d(m0.d(), y0.f88884a));
        f48728h = new AtomicBoolean(false);
        f48731k = new AtomicBoolean(false);
    }

    public static Intent a(Context context) {
        if (!b()) {
            return null;
        }
        i.a();
        MobileSdk mobileSdk = MobileSdk.INSTANCE;
        s sVar = (s) ((s2) f48726f).getValue();
        r rVar = sVar instanceof r ? (r) sVar : null;
        return MobileSdk.createIntent$default(mobileSdk, context, null, rVar != null ? rVar.a() : null, false, false, 26, null);
    }

    public static boolean b() {
        return ((Boolean) ((s2) f48725e).getValue()).booleanValue();
    }

    public static void d(boolean z11) {
        if (b()) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            s sVar = (s) ((s2) f48726f).getValue();
            boolean z12 = (sVar instanceof p) || (sVar instanceof o);
            if ((z11 || z12 || jElapsedRealtime - f48730j >= 5000) && f48731k.compareAndSet(false, true)) {
                f48730j = jElapsedRealtime;
                e0.b(new r3(4));
                m0.t(f48727g, null, null, new v(), 3);
            }
        }
    }

    public static void e(Context context, boolean z11) {
        if (b()) {
            return;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if ((z11 || jElapsedRealtime - f48729i >= 3600000) && f48728h.compareAndSet(false, true)) {
            f48729i = jElapsedRealtime;
            m0.t(f48727g, null, null, new cy.t(context, null, 1), 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Context context, ContinuationImpl continuationImpl) {
        u uVar;
        if (continuationImpl instanceof u) {
            uVar = (u) continuationImpl;
            int i5 = uVar.f48715w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f48715w = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, continuationImpl);
            }
        }
        Object objE = uVar.f48713u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f48715w;
        if (i11 == 0) {
            ResultKt.b(objE);
            zy.c cVar = zy.c.f98823a;
            uVar.f48712t = context;
            uVar.f48715w = 1;
            objE = cVar.e("nova_mobile_enabled", uVar);
            if (objE != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objE);
            return objE;
        }
        context = uVar.f48712t;
        ResultKt.b(objE);
        if (!((Boolean) objE).booleanValue()) {
            return Boolean.FALSE;
        }
        MobileSdk mobileSdk = MobileSdk.INSTANCE;
        uVar.f48712t = null;
        uVar.f48715w = 2;
        Object objIsOfferAvailable = mobileSdk.isOfferAvailable(context, uVar);
        return objIsOfferAvailable == coroutineSingletons ? coroutineSingletons : objIsOfferAvailable;
    }
}
