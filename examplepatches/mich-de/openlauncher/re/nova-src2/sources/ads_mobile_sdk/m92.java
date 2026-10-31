package ads_mobile_sdk;

import a70.d;
import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.view.ViewGroup;
import android.view.ViewParent;
import b.s5;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.gson.Gson;
import hn.n;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;
import kotlin.text.Regex;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import w.f;
import w.h;
import w.i;

/* loaded from: classes.dex */
public final class m92 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final Context f7042a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f7043b;

    /* renamed from: c, reason: collision with root package name */
    public final rw0 f7044c;

    /* renamed from: d, reason: collision with root package name */
    public final k8 f7045d;

    /* renamed from: e, reason: collision with root package name */
    public final y2 f7046e;

    /* renamed from: f, reason: collision with root package name */
    public final g0 f7047f;

    /* renamed from: g, reason: collision with root package name */
    public final d92 f7048g;

    /* renamed from: h, reason: collision with root package name */
    public final b.m5 f7049h;

    /* renamed from: i, reason: collision with root package name */
    public final rr1 f7050i;

    /* renamed from: j, reason: collision with root package name */
    public final qw2 f7051j;

    /* renamed from: k, reason: collision with root package name */
    public final i80 f7052k;

    /* renamed from: l, reason: collision with root package name */
    public final zm0 f7053l;

    /* renamed from: m, reason: collision with root package name */
    public final z1 f7054m;
    public final z03 n;
    public final t42 o;

    /* renamed from: p, reason: collision with root package name */
    public final zg2 f7055p;

    /* renamed from: q, reason: collision with root package name */
    public final j01 f7056q;

    /* renamed from: r, reason: collision with root package name */
    public final ci3 f7057r;

    /* renamed from: s, reason: collision with root package name */
    public final hv f7058s;

    public m92(Context applicationContext, jr0 flags, rw0 gmaUtil, k8 adSpamClient, y2 adEventEmitter, g0 activityTracker, d92 onePieceExpandableContentPresenter, b.m5 twoPieceExpandableContentPresenter, rr1 mraidResizeHandler, qw2 requestType, i80 customTabsConnection, zm0 firebaseAnalyticsEventHandler, z1 adConfiguration, z03 safeBrowsingManager, t42 offlineOpenHandler, zg2 postClickLifecycleMonitor, j01 hsdpDeepLinkServiceWrapper, ci3 traceLogger, hv commonConfiguration) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(onePieceExpandableContentPresenter, "onePieceExpandableContentPresenter");
        Intrinsics.g(twoPieceExpandableContentPresenter, "twoPieceExpandableContentPresenter");
        Intrinsics.g(mraidResizeHandler, "mraidResizeHandler");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(customTabsConnection, "customTabsConnection");
        Intrinsics.g(firebaseAnalyticsEventHandler, "firebaseAnalyticsEventHandler");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        Intrinsics.g(offlineOpenHandler, "offlineOpenHandler");
        Intrinsics.g(postClickLifecycleMonitor, "postClickLifecycleMonitor");
        Intrinsics.g(hsdpDeepLinkServiceWrapper, "hsdpDeepLinkServiceWrapper");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        this.f7042a = applicationContext;
        this.f7043b = flags;
        this.f7044c = gmaUtil;
        this.f7045d = adSpamClient;
        this.f7046e = adEventEmitter;
        this.f7047f = activityTracker;
        this.f7048g = onePieceExpandableContentPresenter;
        this.f7049h = twoPieceExpandableContentPresenter;
        this.f7050i = mraidResizeHandler;
        this.f7051j = requestType;
        this.f7052k = customTabsConnection;
        this.f7053l = firebaseAnalyticsEventHandler;
        this.f7054m = adConfiguration;
        this.n = safeBrowsingManager;
        this.o = offlineOpenHandler;
        this.f7055p = postClickLifecycleMonitor;
        this.f7056q = hsdpDeepLinkServiceWrapper;
        this.f7057r = traceLogger;
        this.f7058s = commonConfiguration;
    }

    public final void a(w.l lVar, Activity activity, Uri uri, String str, Map map) {
        h hVar = new h(lVar);
        jr0 jr0Var = this.f7043b;
        jr0Var.getClass();
        if (((Boolean) jr0Var.a("gads:cct_v2_partial_custom_tab_config:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
            String str2 = (String) map.get("cct_init_h");
            String str3 = (String) map.get("cct_bp");
            if (str2 != null && !r70.k.U0(str2) && Integer.parseInt(str2) > 0) {
                hVar.c(Integer.parseInt(str2));
            }
            if (str3 != null && !r70.k.U0(str3) && Integer.parseInt(str3) >= 0 && Integer.parseInt(str3) <= 2) {
                hVar.b(Integer.parseInt(str3));
            }
        }
        i iVarA = hVar.a();
        iVarA.f93407a.setPackage(str);
        iVarA.a(activity, uri);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(tx0 tx0Var, Map map, ContinuationImpl continuationImpl) {
        e92 e92Var;
        m92 m92Var;
        Uri uriBuild;
        if (continuationImpl instanceof e92) {
            e92Var = (e92) continuationImpl;
            int i5 = e92Var.f2809f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e92Var.f2809f = i5 - Integer.MIN_VALUE;
            } else {
                e92Var = new e92(this, continuationImpl);
            }
        }
        Object objA = e92Var.f2807d;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = e92Var.f2809f;
        Object obj2 = null;
        if (i11 == 0) {
            ResultKt.b(objA);
            String str = (String) map.get("u");
            if (str == null || r70.k.U0(str)) {
                zi3.a(6, "Blank URL for browser open GMSG.", null);
                return null;
            }
            Uri uri = Uri.parse(str);
            rm0 rm0Var = rm0.f9230b;
            Bundle bundle = this.f7054m.f12397q;
            e92Var.f2804a = this;
            e92Var.f2805b = map;
            e92Var.f2806c = tx0Var;
            e92Var.f2809f = 1;
            objA = this.f7053l.a(uri, rm0Var, bundle, e92Var);
            if (objA == obj) {
                return obj;
            }
            m92Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tx0Var = e92Var.f2806c;
            map = e92Var.f2805b;
            m92Var = e92Var.f2804a;
            ResultKt.b(objA);
        }
        k8 k8Var = m92Var.f7045d;
        Context context = m92Var.f7042a;
        Uri uriA = k8Var.a((Uri) objA, tx0Var);
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(268435456);
        intent.setData(uriA);
        intent.setAction("android.intent.action.VIEW");
        List<ResolveInfo> listQueryIntentActivities = context.getPackageManager().queryIntentActivities(intent, SQLiteDatabase.OPEN_FULLMUTEX);
        Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
        ResolveInfo resolveInfoA = m92Var.a(intent, listQueryIntentActivities);
        if (resolveInfoA != null) {
            Intent intent2 = new Intent(intent);
            ActivityInfo activityInfo = resolveInfoA.activityInfo;
            intent2.setClassName(activityInfo.packageName, activityInfo.name);
            return intent2;
        }
        if (!"http".equalsIgnoreCase(uriA.getScheme())) {
            if ("https".equalsIgnoreCase(uriA.getScheme())) {
                uriBuild = uriA.buildUpon().scheme("http").build();
            }
            return intent;
        }
        uriBuild = uriA.buildUpon().scheme("https").build();
        Intrinsics.d(uriBuild);
        Intent intent3 = new Intent("android.intent.action.VIEW");
        intent3.addFlags(268435456);
        intent3.setData(uriBuild);
        intent3.setAction("android.intent.action.VIEW");
        List<ResolveInfo> listQueryIntentActivities2 = context.getPackageManager().queryIntentActivities(intent3, SQLiteDatabase.OPEN_FULLMUTEX);
        Intrinsics.f(listQueryIntentActivities2, "queryIntentActivities(...)");
        ResolveInfo resolveInfoA2 = m92Var.a(intent3, listQueryIntentActivities2);
        if (resolveInfoA2 != null) {
            Intent intent4 = new Intent(intent3);
            ActivityInfo activityInfo2 = resolveInfoA2.activityInfo;
            intent4.setClassName(activityInfo2.packageName, activityInfo2.name);
            List<ResolveInfo> listQueryIntentActivities3 = context.getPackageManager().queryIntentActivities(intent4, SQLiteDatabase.OPEN_FULLMUTEX);
            Intrinsics.f(listQueryIntentActivities3, "queryIntentActivities(...)");
            if (m92Var.a(intent4, listQueryIntentActivities3) != null) {
                return intent4;
            }
        }
        if (!listQueryIntentActivities.isEmpty()) {
            if (Boolean.parseBoolean((String) map.get("use_running_process"))) {
                List<ActivityManager.RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService(ActivityManager.class)).getRunningAppProcesses();
                Iterator<T> it = listQueryIntentActivities.iterator();
                loop0: while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Object next = it.next();
                    ResolveInfo resolveInfo = (ResolveInfo) next;
                    Intrinsics.d(runningAppProcesses);
                    if (!(runningAppProcesses instanceof Collection) || !runningAppProcesses.isEmpty()) {
                        Iterator<T> it2 = runningAppProcesses.iterator();
                        while (it2.hasNext()) {
                            if (Intrinsics.b(resolveInfo.activityInfo.packageName, ((ActivityManager.RunningAppProcessInfo) it2.next()).processName)) {
                                obj2 = next;
                                break loop0;
                            }
                        }
                    }
                }
                ResolveInfo resolveInfo2 = (ResolveInfo) obj2;
                if (resolveInfo2 != null) {
                    Intent intent5 = new Intent(intent);
                    ActivityInfo activityInfo3 = resolveInfo2.activityInfo;
                    intent5.setClassName(activityInfo3.packageName, activityInfo3.name);
                    return intent5;
                }
            }
            if (Boolean.parseBoolean((String) map.get("use_first_package"))) {
                ResolveInfo resolveInfo3 = listQueryIntentActivities.get(0);
                Intrinsics.f(resolveInfo3, "get(...)");
                Intent intent6 = new Intent(intent);
                ActivityInfo activityInfo4 = resolveInfo3.activityInfo;
                intent6.setClassName(activityInfo4.packageName, activityInfo4.name);
                return intent6;
            }
        }
        return intent;
    }

    public final ResolveInfo a(Intent intent, List list) {
        Object next;
        ResolveInfo resolveInfoResolveActivity = this.f7042a.getPackageManager().resolveActivity(intent, SQLiteDatabase.OPEN_FULLMUTEX);
        if (resolveInfoResolveActivity != null) {
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((ResolveInfo) next).activityInfo.name, resolveInfoResolveActivity.activityInfo.name)) {
                    break;
                }
            }
            if (next != null) {
                return resolveInfoResolveActivity;
            }
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x01cd, code lost:
    
        if (r4.a(r15, true, r5, r8, r9, r10, r11) != r3) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x022e, code lost:
    
        if (r4.a(r15, true, r5, r8, r9, r10, r11) != r3) goto L69;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0151  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Map map, boolean z11, boolean z12, boolean z13, tx0 tx0Var, ContinuationImpl continuationImpl) {
        f92 f92Var;
        Activity activityB;
        tx0 tx0Var2;
        boolean z14;
        boolean z15;
        String str;
        boolean z16;
        Map map2;
        m92 m92Var;
        String strB;
        Uri uri;
        Activity activity;
        String str2;
        Map map3;
        boolean z17;
        boolean z18;
        String str3;
        m92 m92Var2;
        boolean z19;
        Map map4;
        boolean z21;
        m92 m92Var3;
        boolean z22;
        Map map5;
        boolean z23;
        m92 m92Var4;
        boolean z24;
        if (continuationImpl instanceof f92) {
            f92Var = (f92) continuationImpl;
            int i5 = f92Var.f3264m;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f92Var.f3264m = i5 - Integer.MIN_VALUE;
            } else {
                f92Var = new f92(this, continuationImpl);
            }
        }
        f92 f92Var2 = f92Var;
        Object obj = f92Var2.f3262k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        Continuation continuation = null;
        switch (f92Var2.f3264m) {
            case 0:
                ResultKt.b(obj);
                String str4 = (String) map.get("u");
                if (str4 != null && !r70.k.U0(str4)) {
                    activityB = this.f7047f.b();
                    if (activityB == null) {
                        zi3.a(6, "Chrome Custom Tabs can only be launched from an Activity context.", null);
                        return Unit.f71706a;
                    }
                    Uri uri2 = Uri.parse(str4);
                    rm0 rm0Var = rm0.f9230b;
                    Bundle bundle = this.f7054m.f12397q;
                    f92Var2.f3252a = this;
                    f92Var2.f3253b = map;
                    tx0Var2 = tx0Var;
                    f92Var2.f3254c = tx0Var2;
                    f92Var2.f3255d = str4;
                    f92Var2.f3256e = activityB;
                    f92Var2.f3259h = z11;
                    z14 = z12;
                    f92Var2.f3260i = z14;
                    z15 = z13;
                    f92Var2.f3261j = z15;
                    f92Var2.f3264m = 1;
                    Comparable comparableA = this.f7053l.a(uri2, rm0Var, bundle, f92Var2);
                    if (comparableA != coroutineSingletons) {
                        str = str4;
                        obj = comparableA;
                        z16 = z11;
                        map2 = map;
                        m92Var = this;
                        Uri uriA = m92Var.f7045d.a((Uri) obj, tx0Var2);
                        strB = f.b(activityB, null);
                        if (strB != null) {
                            zi3.a(6, "Unable to get package name for Custom Tabs.", null);
                            return Unit.f71706a;
                        }
                        String string = uriA.toString();
                        f92Var2.f3252a = m92Var;
                        f92Var2.f3253b = map2;
                        f92Var2.f3254c = tx0Var2;
                        f92Var2.f3255d = str;
                        f92Var2.f3256e = activityB;
                        f92Var2.f3257f = uriA;
                        f92Var2.f3258g = strB;
                        f92Var2.f3259h = z16;
                        f92Var2.f3260i = z14;
                        f92Var2.f3261j = z15;
                        f92Var2.f3264m = 2;
                        m92Var.a(tx0Var2, string, f92Var2);
                        Boolean bool = Boolean.FALSE;
                        if (bool != coroutineSingletons) {
                            uri = uriA;
                            activity = activityB;
                            obj = bool;
                            str2 = strB;
                            map3 = map2;
                            z17 = z14;
                            z18 = z16;
                            str3 = str;
                            m92Var2 = m92Var;
                            z19 = z15;
                            if (!((Boolean) obj).booleanValue()) {
                                return Unit.f71706a;
                            }
                            jr0 jr0Var = m92Var2.f7043b;
                            z03 z03Var = m92Var2.n;
                            Boolean bool2 = Boolean.FALSE;
                            jn jnVar = jn.a$10;
                            if (((Boolean) jr0Var.a("gads:cct_v2_optimization:enabled", bool2, jnVar)).booleanValue()) {
                                i80 i80Var = m92Var2.f7052k;
                                if (i80Var.f4667d == null) {
                                    t70.j0 j0Var = i80Var.f4665b;
                                    androidx.room.c cVar = new androidx.room.c(i80Var, continuation, 7);
                                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                                    Intrinsics.g(j0Var, "<this>");
                                    Intrinsics.g(context, "context");
                                    m0.t(j0Var, context, null, new ar.a(cVar, null), 2);
                                }
                                m92Var2.a(i80Var.f4667d, activity, uri, str2, map3);
                                map5 = map3;
                                f92Var2.f3252a = m92Var2;
                                f92Var2.f3253b = map5;
                                f92Var2.f3254c = tx0Var2;
                                f92Var2.f3255d = null;
                                f92Var2.f3256e = null;
                                f92Var2.f3257f = null;
                                f92Var2.f3258g = null;
                                f92Var2.f3259h = z18;
                                f92Var2.f3260i = z17;
                                f92Var2.f3261j = z19;
                                f92Var2.f3264m = 3;
                                z03Var.getClass();
                                if (z03.a(z03Var, str3, f92Var2) != coroutineSingletons) {
                                    boolean z25 = z18;
                                    z23 = z17;
                                    m92Var4 = m92Var2;
                                    z24 = z25;
                                    boolean z26 = z19;
                                    f92Var2.f3252a = null;
                                    f92Var2.f3253b = null;
                                    f92Var2.f3254c = null;
                                    f92Var2.f3264m = 4;
                                    break;
                                }
                            } else {
                                map4 = map3;
                                if (((Boolean) m92Var2.f7043b.a("gads:cct_v2_connection:enabled", bool2, jnVar)).booleanValue()) {
                                    f.a(activity, str2, new g92(m92Var2, activity, uri, str2, map4));
                                    f92Var2.f3252a = m92Var2;
                                    f92Var2.f3253b = map4;
                                    f92Var2.f3254c = tx0Var2;
                                    f92Var2.f3255d = null;
                                    f92Var2.f3256e = null;
                                    f92Var2.f3257f = null;
                                    f92Var2.f3258g = null;
                                    f92Var2.f3259h = z18;
                                    f92Var2.f3260i = z17;
                                    f92Var2.f3261j = z19;
                                    f92Var2.f3264m = 5;
                                    z03Var.getClass();
                                    if (z03.a(z03Var, str3, f92Var2) != coroutineSingletons) {
                                        boolean z27 = z18;
                                        z21 = z17;
                                        m92Var3 = m92Var2;
                                        z22 = z27;
                                        boolean z28 = z19;
                                        f92Var2.f3252a = null;
                                        f92Var2.f3253b = null;
                                        f92Var2.f3254c = null;
                                        f92Var2.f3264m = 6;
                                        break;
                                    }
                                } else {
                                    zi3.a(6, "launchCustomTabs invoked when neither experiment arm is enabled.", null);
                                    return Unit.f71706a;
                                }
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                zi3.a(6, "Blank URL for browser open GMSG.", null);
                return Unit.f71706a;
            case 1:
                boolean z29 = f92Var2.f3261j;
                boolean z31 = f92Var2.f3260i;
                z16 = f92Var2.f3259h;
                Activity activity2 = f92Var2.f3256e;
                str = f92Var2.f3255d;
                tx0Var2 = f92Var2.f3254c;
                map2 = f92Var2.f3253b;
                m92 m92Var5 = f92Var2.f3252a;
                ResultKt.b(obj);
                z15 = z29;
                m92Var = m92Var5;
                z14 = z31;
                activityB = activity2;
                Uri uriA2 = m92Var.f7045d.a((Uri) obj, tx0Var2);
                strB = f.b(activityB, null);
                if (strB != null) {
                }
                break;
            case 2:
                z19 = f92Var2.f3261j;
                z17 = f92Var2.f3260i;
                z18 = f92Var2.f3259h;
                String str5 = f92Var2.f3258g;
                Uri uri3 = f92Var2.f3257f;
                Activity activity3 = f92Var2.f3256e;
                str3 = f92Var2.f3255d;
                tx0 tx0Var3 = f92Var2.f3254c;
                Map map6 = f92Var2.f3253b;
                m92Var2 = f92Var2.f3252a;
                ResultKt.b(obj);
                str2 = str5;
                uri = uri3;
                activity = activity3;
                tx0Var2 = tx0Var3;
                map3 = map6;
                if (!((Boolean) obj).booleanValue()) {
                }
                break;
            case 3:
                z19 = f92Var2.f3261j;
                boolean z32 = f92Var2.f3260i;
                z24 = f92Var2.f3259h;
                tx0 tx0Var4 = f92Var2.f3254c;
                Map map7 = f92Var2.f3253b;
                m92 m92Var6 = f92Var2.f3252a;
                ResultKt.b(obj);
                tx0Var2 = tx0Var4;
                map5 = map7;
                z23 = z32;
                m92Var4 = m92Var6;
                boolean z262 = z19;
                f92Var2.f3252a = null;
                f92Var2.f3253b = null;
                f92Var2.f3254c = null;
                f92Var2.f3264m = 4;
                break;
            case 4:
                ResultKt.b(obj);
                return Unit.f71706a;
            case 5:
                z19 = f92Var2.f3261j;
                boolean z33 = f92Var2.f3260i;
                z22 = f92Var2.f3259h;
                tx0 tx0Var5 = f92Var2.f3254c;
                Map map8 = f92Var2.f3253b;
                m92 m92Var7 = f92Var2.f3252a;
                ResultKt.b(obj);
                z21 = z33;
                m92Var3 = m92Var7;
                tx0Var2 = tx0Var5;
                map4 = map8;
                boolean z282 = z19;
                f92Var2.f3252a = null;
                f92Var2.f3253b = null;
                f92Var2.f3254c = null;
                f92Var2.f3264m = 6;
                break;
            case 6:
                ResultKt.b(obj);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    public static int b(Map map) {
        String str = (String) map.get("o");
        if (str == null) {
            return -1;
        }
        int iHashCode = str.hashCode();
        return iHashCode != 99 ? iHashCode != 108 ? (iHashCode == 112 && str.equals("p")) ? 7 : -1 : str.equals("l") ? 6 : -1 : !str.equals("c") ? -1 : 14;
    }

    public final Map b(String str) {
        int length = str.length();
        b70.h hVar = b70.h.f17594a;
        if (length == 0) {
            return hVar;
        }
        try {
            Object objFromJson = new Gson().fromJson(str, (Class<Object>) com.google.gson.r.class);
            Intrinsics.f(objFromJson, "fromJson(...)");
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            Iterator it = ((hn.m) ((com.google.gson.r) objFromJson).f34795a.entrySet()).iterator();
            while (((hn.l) it).hasNext()) {
                n nVarB = ((hn.l) it).b();
                String str2 = (String) nVarB.getKey();
                com.google.gson.p pVar = (com.google.gson.p) nVarB.getValue();
                Intrinsics.d(str2);
                String strO = pVar.o();
                Intrinsics.f(strO, "getAsString(...)");
                linkedHashMap.put(str2, strO);
            }
            return linkedHashMap;
        } catch (Exception e3) {
            mu0.b("Failed to parse extra query params", e3);
            this.f7057r.a("OpenGmsgHandler.parseHsdpExtraQueryParams", (Throwable) e3);
            return hVar;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:74:0x015e, code lost:
    
        if (r0.n(r11) != r5) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x018f, code lost:
    
        if (r0.a(r11) == r5) goto L92;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x01a3 A[Catch: all -> 0x01a8, Exception -> 0x01aa, TryCatch #6 {Exception -> 0x01aa, blocks: (B:98:0x019b, B:100:0x01a3, B:108:0x01b4), top: B:202:0x019b }] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01ae  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x01b4 A[Catch: all -> 0x01a8, Exception -> 0x01aa, TRY_LEAVE, TryCatch #6 {Exception -> 0x01aa, blocks: (B:98:0x019b, B:100:0x01a3, B:108:0x01b4), top: B:202:0x019b }] */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0237 A[Catch: all -> 0x0071, TryCatch #12 {all -> 0x0071, blocks: (B:144:0x022f, B:146:0x0237, B:154:0x0265, B:156:0x0288, B:157:0x0290, B:150:0x0240, B:153:0x0253, B:25:0x0068), top: B:204:0x0068 }] */
    /* JADX WARN: Removed duplicated region for block: B:147:0x023c  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x023f  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0240 A[Catch: all -> 0x0071, TryCatch #12 {all -> 0x0071, blocks: (B:144:0x022f, B:146:0x0237, B:154:0x0265, B:156:0x0288, B:157:0x0290, B:150:0x0240, B:153:0x0253, B:25:0x0068), top: B:204:0x0068 }] */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0288 A[Catch: all -> 0x0071, TryCatch #12 {all -> 0x0071, blocks: (B:144:0x022f, B:146:0x0237, B:154:0x0265, B:156:0x0288, B:157:0x0290, B:150:0x0240, B:153:0x0253, B:25:0x0068), top: B:204:0x0068 }] */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0290 A[Catch: all -> 0x0071, TRY_LEAVE, TryCatch #12 {all -> 0x0071, blocks: (B:144:0x022f, B:146:0x0237, B:154:0x0265, B:156:0x0288, B:157:0x0290, B:150:0x0240, B:153:0x0253, B:25:0x0068), top: B:204:0x0068 }] */
    /* JADX WARN: Removed duplicated region for block: B:167:0x02ab A[Catch: all -> 0x02b7, TryCatch #16 {all -> 0x02b7, blocks: (B:165:0x02a4, B:167:0x02ab, B:169:0x02af, B:171:0x02b3, B:174:0x02ba, B:176:0x02be, B:178:0x02c2, B:180:0x02c6, B:181:0x02c7, B:182:0x02cc, B:183:0x02cd, B:184:0x02d4, B:185:0x02d5, B:186:0x02dc, B:187:0x02dd), top: B:208:0x02a4 }] */
    /* JADX WARN: Removed duplicated region for block: B:187:0x02dd A[Catch: all -> 0x02b7, TRY_LEAVE, TryCatch #16 {all -> 0x02b7, blocks: (B:165:0x02a4, B:167:0x02ab, B:169:0x02af, B:171:0x02b3, B:174:0x02ba, B:176:0x02be, B:178:0x02c2, B:180:0x02c6, B:181:0x02c7, B:182:0x02cc, B:183:0x02cd, B:184:0x02d4, B:185:0x02d5, B:186:0x02dc, B:187:0x02dd), top: B:208:0x02a4 }] */
    /* JADX WARN: Removed duplicated region for block: B:224:0x017c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /* JADX WARN: Type inference failed for: r10v4, types: [ads_mobile_sdk.j01] */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v18, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r3v10, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v22 */
    /* JADX WARN: Type inference failed for: r3v23, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v28 */
    /* JADX WARN: Type inference failed for: r3v29 */
    /* JADX WARN: Type inference failed for: r3v31 */
    /* JADX WARN: Type inference failed for: r3v32, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v33 */
    /* JADX WARN: Type inference failed for: r3v34, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v40 */
    /* JADX WARN: Type inference failed for: r3v41 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /* JADX WARN: Type inference failed for: r6v27, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r9v11 */
    /* JADX WARN: Type inference failed for: r9v12, types: [ads_mobile_sdk.cc2] */
    /* JADX WARN: Type inference failed for: r9v14 */
    /* JADX WARN: Type inference failed for: r9v15, types: [ads_mobile_sdk.cc2] */
    /* JADX WARN: Type inference failed for: r9v16, types: [ads_mobile_sdk.cc2] */
    /* JADX WARN: Type inference failed for: r9v18 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Map map, boolean z11, boolean z12, tx0 tx0Var, ContinuationImpl continuationImpl) {
        h92 h92Var;
        ug2 ug2Var;
        ?? r22;
        th3 th3Var;
        Throwable th2;
        th3 th3Var2;
        m92 m92Var;
        String str;
        String str2;
        boolean zB;
        ?? r32;
        Throwable th3;
        boolean z13;
        boolean z14;
        String str3;
        m92 m92Var2;
        th3 th3Var3;
        tx0 tx0Var2;
        Throwable th4;
        th3 th3Var4;
        tx0 tx0Var3;
        boolean z15;
        th3 th3Var5;
        th3 th3Var6;
        ?? r33;
        th3 th3Var7;
        th3 th3Var8;
        m92 m92Var3;
        th3 th3Var9;
        th3 th3Var10;
        th3 th3Var11;
        ?? E;
        jr0 jr0Var;
        th3 th3Var12;
        Throwable th5;
        th3 th3Var13;
        ?? E2;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof h92) {
            h92Var = (h92) continuationImpl;
            int i5 = h92Var.f4267i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h92Var.f4267i = i5 - Integer.MIN_VALUE;
            } else {
                h92Var = new h92(this, continuationImpl);
            }
        }
        h92 h92Var2 = h92Var;
        Object obj = h92Var2.f4265g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h92Var2.f4267i;
        String str4 = "newBuilder(...)";
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var2 = this.f7043b;
            jr0Var2.getClass();
            if (((Boolean) jr0Var2.a("gads:hsdp_service:enabled", Boolean.FALSE, jnVar)).booleanValue() && (ug2Var = this.f7054m.f12408v0) != null && ug2Var.f10330d && Intrinsics.b(map.get("hf"), "2") && map.get("hstp") != null) {
                wv0 wv0Var = wv0.CUI_NAME_HSDP_SERVICE;
                WeakHashMap weakHashMap = ji3.f5253a;
                th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
                try {
                    try {
                        r22 = (String) map.get("hstp");
                        str = (String) map.get("hsr");
                        str2 = (String) map.get("hseqp");
                        zB = Intrinsics.b(map.get("hsat"), InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                        try {
                        } catch (Throwable th6) {
                            th = th6;
                            th3Var2 = r22;
                            th3Var5 = r22;
                            th3Var2.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                    } catch (Exception e3) {
                        e = e3;
                        th3Var = th3VarA;
                        th2 = null;
                    }
                    if (r22 != 0 && str != null && str2 != null) {
                        try {
                            Map mapB = b(str2);
                            ?? r102 = this.f7056q;
                            try {
                                h92Var2.f4259a = this;
                                h92Var2.f4260b = tx0Var;
                                h92Var2.f4261c = th3VarA;
                                h92Var2.f4262d = th3VarA;
                                z13 = z11;
                                h92Var2.f4263e = z13;
                                z14 = z12;
                                h92Var2.f4264f = z14;
                                h92Var2.f4267i = 1;
                                str3 = "newBuilder(...)";
                                th3 th3Var14 = th3VarA;
                                th3 = null;
                                th4 = null;
                                try {
                                    if (r102.a(r22, str, mapB, zB, h92Var2) != coroutineSingletons) {
                                        m92Var2 = this;
                                        th3Var3 = th3Var14;
                                        tx0Var2 = tx0Var;
                                        th3Var4 = th3Var14;
                                        if (((Boolean) m92Var2.f7043b.a("gads:hsdp_service_trigger_on_ad_clicked:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                                            y2 y2Var = m92Var2.f7046e;
                                            h92Var2.f4259a = m92Var2;
                                            h92Var2.f4260b = tx0Var2;
                                            h92Var2.f4261c = th3Var3;
                                            h92Var2.f4262d = th3Var4;
                                            h92Var2.f4263e = z14;
                                            h92Var2.f4267i = 2;
                                        }
                                        tx0 tx0Var4 = tx0Var2;
                                        m92Var = m92Var2;
                                        th3Var2 = th3Var3;
                                        tx0Var3 = tx0Var4;
                                        z15 = z14;
                                        th3Var7 = th3Var4;
                                        r33 = th4;
                                        if (z15) {
                                        }
                                        th3Var8 = th3Var2;
                                        m92Var3 = m92Var;
                                        th3Var13 = th3Var7;
                                        th5 = r33;
                                        th3 th3Var15 = ji3.b().f4777a;
                                        if (th3Var15 == null) {
                                        }
                                        if (E2 != null) {
                                        }
                                        Boolean bool = Boolean.TRUE;
                                        CloseableKt.a(th3Var13, th5);
                                        return bool;
                                    }
                                    return coroutineSingletons;
                                } catch (Exception e11) {
                                    e = e11;
                                    str4 = str3;
                                    th3Var = th3Var14;
                                    th2 = th3;
                                    m92Var = this;
                                    th3 th3Var16 = th3Var;
                                    th3Var2 = th3Var16;
                                    th3Var11 = th3Var16;
                                    th3 th3Var17 = ji3.b().f4777a;
                                    if (th3Var17 != null) {
                                    }
                                    if (E != 0) {
                                    }
                                    th3 th3VarA2 = ji3.a();
                                    th3VarA2.e().f1799m = false;
                                    th3VarA2.a(e);
                                    jr0Var = m92Var.f7043b;
                                    jr0Var.getClass();
                                    if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                                    }
                                    th3Var10 = th3Var2;
                                    r32 = th3Var11;
                                    Unit unit = Unit.f71706a;
                                    CloseableKt.a(r32, th2);
                                    return Boolean.FALSE;
                                }
                            } catch (Exception e12) {
                                e = e12;
                                th3Var = th3VarA;
                                th3 = null;
                            }
                        } catch (Exception e13) {
                            e = e13;
                            th3Var = th3VarA;
                            th3 = null;
                        }
                    } else {
                        th3Var = th3VarA;
                        th2 = null;
                        try {
                            mu0.b("HSDP service parameters missing.", null);
                            th3 th3Var18 = ji3.b().f4777a;
                            cc2 cc2VarE = th3Var18 != null ? th3Var18.e() : null;
                            if (cc2VarE != null) {
                                s5 s5VarO = n01.o();
                                Intrinsics.f(s5VarO, "newBuilder(...)");
                                s5VarO.c(4);
                                s5VarO.b();
                                ((n01) s5VarO.f1095b).b("HSDP service parameters missing.");
                                cc2VarE.I = (n01) s5VarO.a();
                            }
                            r32 = th3Var;
                            th3Var10 = th3Var;
                        } catch (Exception e14) {
                            e = e14;
                        }
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(r32, th2);
                    }
                    m92Var = this;
                    th3 th3Var162 = th3Var;
                    th3Var2 = th3Var162;
                    th3Var11 = th3Var162;
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(r32, th2);
                } catch (Throwable th7) {
                    th = th7;
                    r22 = th3VarA;
                }
                th3 th3Var172 = ji3.b().f4777a;
                if (th3Var172 != null) {
                }
                if (E != 0) {
                }
                th3 th3VarA22 = ji3.a();
                th3VarA22.e().f1799m = false;
                th3VarA22.a(e);
                jr0Var = m92Var.f7043b;
                jr0Var.getClass();
                if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                }
                th3Var10 = th3Var2;
                r32 = th3Var11;
            }
            return Boolean.FALSE;
        }
        if (i11 == 1) {
            boolean z16 = h92Var2.f4264f;
            boolean z17 = h92Var2.f4263e;
            ?? r62 = h92Var2.f4262d;
            th3Var3 = (th3) h92Var2.f4261c;
            tx0Var2 = (tx0) h92Var2.f4260b;
            m92 m92Var4 = h92Var2.f4259a;
            try {
                ResultKt.b(obj);
                z14 = z16;
                z13 = z17;
                th3Var4 = r62;
                str3 = "newBuilder(...)";
                m92Var2 = m92Var4;
                th4 = null;
                try {
                    try {
                        if (((Boolean) m92Var2.f7043b.a("gads:hsdp_service_trigger_on_ad_clicked:enabled", Boolean.TRUE, jnVar)).booleanValue() && z13) {
                            y2 y2Var2 = m92Var2.f7046e;
                            try {
                                h92Var2.f4259a = m92Var2;
                                h92Var2.f4260b = tx0Var2;
                                h92Var2.f4261c = th3Var3;
                                h92Var2.f4262d = th3Var4;
                                h92Var2.f4263e = z14;
                                h92Var2.f4267i = 2;
                            } catch (Exception e15) {
                                e = e15;
                                th2 = th4;
                                m92Var = m92Var2;
                                th3Var2 = th3Var3;
                                th3Var6 = th3Var4;
                                str4 = str3;
                                th3Var12 = th3Var6;
                                th3Var11 = th3Var12;
                                th3 th3Var1722 = ji3.b().f4777a;
                                if (th3Var1722 != null) {
                                }
                                if (E != 0) {
                                }
                                th3 th3VarA222 = ji3.a();
                                th3VarA222.e().f1799m = false;
                                th3VarA222.a(e);
                                jr0Var = m92Var.f7043b;
                                jr0Var.getClass();
                                if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                                }
                                th3Var10 = th3Var2;
                                r32 = th3Var11;
                                Unit unit222 = Unit.f71706a;
                                CloseableKt.a(r32, th2);
                                return Boolean.FALSE;
                            }
                        }
                        tx0 tx0Var42 = tx0Var2;
                        m92Var = m92Var2;
                        th3Var2 = th3Var3;
                        tx0Var3 = tx0Var42;
                        z15 = z14;
                        th3Var7 = th3Var4;
                        r33 = th4;
                        if (z15) {
                        }
                        th3Var8 = th3Var2;
                        m92Var3 = m92Var;
                        th3Var13 = th3Var7;
                        th5 = r33;
                        th3 th3Var152 = ji3.b().f4777a;
                        if (th3Var152 == null) {
                        }
                        if (E2 != null) {
                        }
                        Boolean bool2 = Boolean.TRUE;
                        CloseableKt.a(th3Var13, th5);
                        return bool2;
                    } catch (Throwable th8) {
                        th = th8;
                        th3Var2 = th3Var3;
                        th3Var5 = th3Var4;
                    }
                } catch (Exception e16) {
                    e = e16;
                    str4 = str3;
                    th2 = th4;
                    m92Var = m92Var2;
                    th3Var2 = th3Var3;
                    th3Var12 = th3Var4;
                    th3Var11 = th3Var12;
                    th3 th3Var17222 = ji3.b().f4777a;
                    if (th3Var17222 != null) {
                    }
                    if (E != 0) {
                    }
                    th3 th3VarA2222 = ji3.a();
                    th3VarA2222.e().f1799m = false;
                    th3VarA2222.a(e);
                    jr0Var = m92Var.f7043b;
                    jr0Var.getClass();
                    if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                    }
                    th3Var10 = th3Var2;
                    r32 = th3Var11;
                    Unit unit2222 = Unit.f71706a;
                    CloseableKt.a(r32, th2);
                    return Boolean.FALSE;
                }
            } catch (Exception e17) {
                e = e17;
                r32 = r62;
                th3Var2 = th3Var3;
                m92Var = m92Var4;
            } catch (Throwable th9) {
                th = th9;
                r32 = r62;
                th3Var8 = th3Var3;
                th3Var9 = r32;
                th3Var2 = th3Var8;
                th3Var5 = th3Var9;
                th3Var2.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        } else {
            if (i11 == 2) {
                z15 = h92Var2.f4263e;
                r32 = h92Var2.f4262d;
                th3Var2 = (th3) h92Var2.f4261c;
                tx0Var3 = (tx0) h92Var2.f4260b;
                m92Var = h92Var2.f4259a;
                try {
                    try {
                        ResultKt.b(obj);
                        th3Var7 = r32;
                        str3 = "newBuilder(...)";
                        r33 = 0;
                        if (z15) {
                            try {
                                et0 et0Var = tx0Var3.o;
                                if (et0Var != null) {
                                    h92Var2.f4259a = m92Var;
                                    h92Var2.f4260b = th3Var2;
                                    h92Var2.f4261c = th3Var7;
                                    h92Var2.f4262d = r33;
                                    h92Var2.f4267i = 3;
                                }
                            } catch (Exception e18) {
                                e = e18;
                                th2 = r33;
                                th3Var6 = th3Var7;
                                str4 = str3;
                                th3Var12 = th3Var6;
                                th3Var11 = th3Var12;
                                th3 th3Var172222 = ji3.b().f4777a;
                                if (th3Var172222 != null) {
                                }
                                if (E != 0) {
                                }
                                th3 th3VarA22222 = ji3.a();
                                th3VarA22222.e().f1799m = false;
                                th3VarA22222.a(e);
                                jr0Var = m92Var.f7043b;
                                jr0Var.getClass();
                                if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                                }
                                th3Var10 = th3Var2;
                                r32 = th3Var11;
                                Unit unit22222 = Unit.f71706a;
                                CloseableKt.a(r32, th2);
                                return Boolean.FALSE;
                            } catch (Throwable th10) {
                                th = th10;
                                r32 = th3Var7;
                                th3Var5 = r32;
                                th3Var2.b(th);
                                if (!(th instanceof b.a4)) {
                                }
                            }
                        }
                        th3Var8 = th3Var2;
                        m92Var3 = m92Var;
                        th3Var13 = th3Var7;
                        th5 = r33;
                        th3 th3Var1522 = ji3.b().f4777a;
                        if (th3Var1522 == null) {
                        }
                        if (E2 != null) {
                        }
                        Boolean bool22 = Boolean.TRUE;
                        CloseableKt.a(th3Var13, th5);
                        return bool22;
                    } catch (Exception e19) {
                        e = e19;
                    }
                } catch (Throwable th11) {
                    th = th11;
                    th3Var5 = r32;
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } else {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r32 = h92Var2.f4261c;
                th3Var8 = (th3) h92Var2.f4260b;
                m92Var3 = h92Var2.f4259a;
                try {
                    ResultKt.b(obj);
                    th3Var13 = r32;
                    str3 = "newBuilder(...)";
                    th5 = null;
                    try {
                        try {
                            th3 th3Var15222 = ji3.b().f4777a;
                            E2 = th3Var15222 == null ? th3Var15222.e() : th5;
                            if (E2 != null) {
                                str4 = str3;
                            } else {
                                s5 s5VarO2 = n01.o();
                                str4 = str3;
                                try {
                                    Intrinsics.f(s5VarO2, str4);
                                    s5VarO2.c(4);
                                    E2.I = (n01) s5VarO2.a();
                                } catch (Exception e21) {
                                    e = e21;
                                    m92Var = m92Var3;
                                    th3Var2 = th3Var8;
                                    th2 = th5;
                                    th3Var12 = th3Var13;
                                    th3Var11 = th3Var12;
                                    th3 th3Var1722222 = ji3.b().f4777a;
                                    if (th3Var1722222 != null) {
                                    }
                                    if (E != 0) {
                                    }
                                    th3 th3VarA222222 = ji3.a();
                                    th3VarA222222.e().f1799m = false;
                                    th3VarA222222.a(e);
                                    jr0Var = m92Var.f7043b;
                                    jr0Var.getClass();
                                    if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                                    }
                                    th3Var10 = th3Var2;
                                    r32 = th3Var11;
                                    Unit unit222222 = Unit.f71706a;
                                    CloseableKt.a(r32, th2);
                                    return Boolean.FALSE;
                                }
                            }
                            Boolean bool222 = Boolean.TRUE;
                            CloseableKt.a(th3Var13, th5);
                            return bool222;
                        } catch (Exception e22) {
                            e = e22;
                            str4 = str3;
                        }
                    } catch (Throwable th12) {
                        th = th12;
                        th3Var9 = th3Var13;
                    }
                } catch (Exception e23) {
                    e = e23;
                    m92Var = m92Var3;
                    th3Var2 = th3Var8;
                } catch (Throwable th13) {
                    th = th13;
                    th3Var9 = r32;
                    th3Var2 = th3Var8;
                    th3Var5 = th3Var9;
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            }
            th2 = null;
            th3Var11 = r32;
            th3 th3Var17222222 = ji3.b().f4777a;
            E = th3Var17222222 != null ? th3Var17222222.e() : th2;
            if (E != 0) {
                s5 s5VarO3 = n01.o();
                Intrinsics.f(s5VarO3, str4);
                s5VarO3.c(4);
                String message = e.getMessage();
                if (message == null) {
                    message = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                s5VarO3.b();
                ((n01) s5VarO3.f1095b).b(message);
                E.I = (n01) s5VarO3.a();
            }
            th3 th3VarA2222222 = ji3.a();
            th3VarA2222222.e().f1799m = false;
            th3VarA2222222.a(e);
            jr0Var = m92Var.f7043b;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                m92Var.f7057r.a("HsdpServiceUnsampled.open", e);
            } else {
                m92Var.f7057r.a("HsdpService.open", (Throwable) e);
            }
            th3Var10 = th3Var2;
            r32 = th3Var11;
            try {
                Unit unit2222222 = Unit.f71706a;
                CloseableKt.a(r32, th2);
                return Boolean.FALSE;
            } catch (Throwable th14) {
                th = th14;
                th3Var8 = th3Var10;
                th3Var9 = r32;
                th3Var2 = th3Var8;
                th3Var5 = th3Var9;
                th3Var2.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        }
        th3Var2 = th3Var8;
        th3Var5 = th3Var9;
        try {
            th3Var2.b(th);
            if (!(th instanceof b.a4)) {
                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                    th3Var2.a(th);
                }
                if (!(th instanceof TimeoutCancellationException)) {
                    if (!(th instanceof CancellationException)) {
                        if (th instanceof dv0) {
                            throw th;
                        }
                        throw new iu0(th);
                    }
                    throw new du0(th);
                }
                throw new lw0(th);
            }
            throw th;
        } finally {
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00df, code lost:
    
        if (ads_mobile_sdk.z03.a(r10, r15, r14) == r3) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x010d, code lost:
    
        if (r2.a(r5, r4, r10, r8, r9, r12, r11, r7, r13, r14) == r3) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x010f, code lost:
    
        return r3;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Map map, boolean z11, boolean z12, tx0 tx0Var, ContinuationImpl continuationImpl) {
        l92 l92Var;
        boolean zB;
        String str;
        String str2;
        int i5;
        boolean z13;
        boolean z14;
        tx0 tx0Var2;
        int i11;
        pk3 pk3Var;
        tx0 tx0Var3;
        boolean z15;
        String str3;
        boolean z16;
        if (continuationImpl instanceof l92) {
            l92Var = (l92) continuationImpl;
            int i12 = l92Var.f6136m;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                l92Var.f6136m = i12 - Integer.MIN_VALUE;
            } else {
                l92Var = new l92(this, continuationImpl);
            }
        }
        l92 l92Var2 = l92Var;
        Object obj = l92Var2.f6134k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = l92Var2.f6136m;
        if (i13 == 0) {
            ResultKt.b(obj);
            zB = Intrinsics.b(map.get("custom_close"), "1");
            int iB = b(map);
            str = (String) map.get("u");
            String str4 = (String) map.get("html");
            str2 = (String) map.get("baseurl");
            jr0 jr0Var = this.f7043b;
            jr0Var.getClass();
            i5 = (((Boolean) jr0Var.a("gads:lockscreen_custom_webview:enabled", Boolean.TRUE, jn.a$10)).booleanValue() && Intrinsics.b(map.get("is_allowed_for_lock_screen"), "1")) ? 1 : 0;
            pk3 pk3Var2 = (pk3) this.f7049h.get();
            if (str != null) {
                tx0Var2 = tx0Var;
                l92Var2.f6127d = tx0Var2;
                l92Var2.f6128e = str;
                l92Var2.f6129f = str4;
                l92Var2.f6130g = str2;
                l92Var2.f6131h = pk3Var2;
                z13 = z11;
                l92Var2.f6124a = z13;
                z14 = z12;
                l92Var2.f6125b = z14;
                l92Var2.f6126c = zB;
                l92Var2.f6132i = iB;
                l92Var2.f6133j = i5;
                l92Var2.f6136m = 1;
                z03 z03Var = this.n;
                z03Var.getClass();
            } else {
                z13 = z11;
                z14 = z12;
                tx0Var2 = tx0Var;
            }
            tx0 tx0Var4 = tx0Var2;
            i11 = iB;
            pk3Var = pk3Var2;
            tx0Var3 = tx0Var4;
            z15 = z14;
            str3 = str4;
            z16 = z13;
        } else {
            if (i13 != 1) {
                if (i13 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            i5 = l92Var2.f6133j;
            i11 = l92Var2.f6132i;
            zB = l92Var2.f6126c;
            boolean z17 = l92Var2.f6125b;
            z16 = l92Var2.f6124a;
            pk3 pk3Var3 = l92Var2.f6131h;
            str2 = l92Var2.f6130g;
            String str5 = l92Var2.f6129f;
            str = l92Var2.f6128e;
            tx0 tx0Var5 = l92Var2.f6127d;
            ResultKt.b(obj);
            z15 = z17;
            str3 = str5;
            pk3Var = pk3Var3;
            tx0Var3 = tx0Var5;
        }
        boolean z18 = zB;
        String str6 = str;
        boolean z19 = i5 != 0;
        l92Var2.f6127d = null;
        l92Var2.f6128e = null;
        l92Var2.f6129f = null;
        l92Var2.f6130g = null;
        l92Var2.f6131h = null;
        l92Var2.f6136m = 2;
    }

    @Override // b.gb
    public final int b() {
        return 4;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(tx0 webView, String str, ContinuationImpl continuationImpl) {
        i92 i92Var;
        if (continuationImpl instanceof i92) {
            i92Var = (i92) continuationImpl;
            int i5 = i92Var.f4688c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i92Var.f4688c = i5 - Integer.MIN_VALUE;
            } else {
                i92Var = new i92(this, continuationImpl);
            }
        }
        Object obj = i92Var.f4686a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = i92Var.f4688c;
        boolean z11 = true;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return;
        }
        ResultKt.b(obj);
        t42 t42Var = this.o;
        t42Var.getClass();
        z1 z1Var = t42Var.f9777a;
        Intrinsics.g(webView, "webView");
        if (str == null || z1Var.f12404t0 == null) {
            return;
        }
        WeakHashMap weakHashMap = ji3.f5253a;
        th3 th3VarA = ji3.a(wv0.CUI_NAME_OFFLINE_OPEN, EmptyList.f71733a, true);
        try {
            if (t42Var.f9779c.f8456l.get()) {
                n42 n42Var = t42Var.f9780d;
                String str2 = t42Var.f9778b.f4554h;
                n42Var.getClass();
                m0.t(n42Var.f7424a, null, null, new m8.i(n42Var, new b10.k(n42Var, str2, (Continuation) null, 3), (Continuation) null), 3);
            } else {
                e42 e42Var = z1Var.f12404t0;
                boolean z12 = e42Var != null ? e42Var.f2738c : false;
                ug2 ug2Var = z1Var.f12408v0;
                if (ug2Var == null || !ug2Var.f10327a || ug2Var.f10328b.length() <= 0 || !ug2Var.f10329c) {
                    z11 = false;
                }
                if (z12 && z11) {
                    jr0 jr0Var = t42Var.f9781e;
                    jr0Var.getClass();
                    ((Boolean) jr0Var.a("gads:skip_offline_notification_flow:enabled", Boolean.FALSE, jn.a$10)).getClass();
                }
            }
            th3VarA.close();
        } catch (Throwable th2) {
            try {
                th3VarA.b(th2);
                if (!(th2 instanceof b.a4)) {
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        th3VarA.a(th2);
                    }
                    if (!(th2 instanceof TimeoutCancellationException)) {
                        if (!(th2 instanceof CancellationException)) {
                            if (!(th2 instanceof dv0)) {
                                throw new iu0(th2);
                            }
                            throw th2;
                        }
                        throw new du0(th2);
                    }
                    throw new lw0(th2);
                }
                throw th2;
            } catch (Throwable th3) {
                try {
                    throw th3;
                } catch (Throwable th4) {
                    CloseableKt.a(th3VarA, th3);
                    throw th4;
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:132:0x03ba, code lost:
    
        if (r1.a(r25, r17, r18, r19, r24, r12) == r13) goto L272;
     */
    /* JADX WARN: Code restructure failed: missing block: B:227:0x0617, code lost:
    
        if (ads_mobile_sdk.z03.a(r12, r10, r3) != r13) goto L229;
     */
    /* JADX WARN: Code restructure failed: missing block: B:271:0x06e4, code lost:
    
        if (r0 == r13) goto L272;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x013f, code lost:
    
        if (r0.b(r2, r12) == r13) goto L272;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0271, code lost:
    
        if (r0 == r13) goto L272;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x028e, code lost:
    
        if (r1.b(r25, r3, r4, r24, r12) == r13) goto L272;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:124:0x036d  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0384  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x04f3  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x05db  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x05ec  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0627  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x062e  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x065a  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x066b  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x066e  */
    /* JADX WARN: Removed duplicated region for block: B:258:0x06b4  */
    /* JADX WARN: Removed duplicated region for block: B:260:0x06b7  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0278  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /* JADX WARN: Type inference failed for: r12v1 */
    /* JADX WARN: Type inference failed for: r12v10 */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v2, types: [int] */
    /* JADX WARN: Type inference failed for: r1v0, types: [ads_mobile_sdk.m92, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v14, types: [boolean] */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) throws Throwable {
        j92 j92Var;
        String str;
        jn jnVar;
        boolean z11;
        boolean zEqualsIgnoreCase;
        String str2;
        boolean z12;
        boolean z13;
        int i5;
        tx0 tx0Var2;
        Context context;
        String str3;
        Object obj;
        jn jnVar2;
        Map map2;
        boolean z14;
        int i11;
        j92 j92Var2;
        ?? r12;
        Intent uri;
        int i12;
        String str4;
        boolean z15;
        boolean z16;
        Intent intent;
        int i13;
        String str5;
        m92 m92Var;
        m92 m92Var2;
        boolean z17;
        Intent launchIntentForPackage;
        boolean z18;
        jr0 jr0Var;
        j92 j92Var3;
        boolean z19;
        Iterator it;
        Throwable th2;
        Object objY;
        String str6;
        Intent intent2;
        tx0 tx0Var3;
        m92 m92Var3;
        String str7;
        int i14;
        Map map3;
        int i15;
        Uri data;
        m92 m92Var4;
        String string;
        Uri data2;
        Boolean bool;
        int i16;
        Intent intent3;
        boolean z21;
        tx0 tx0Var4;
        m92 m92Var5;
        Map map4;
        boolean z22;
        m92 m92Var6;
        Intent intent4;
        tx0 tx0Var5;
        ?? r13 = this;
        jn jnVar3 = jn.a$10;
        if (continuation instanceof j92) {
            j92Var = (j92) continuation;
            int i17 = j92Var.f5192k;
            if ((i17 & Integer.MIN_VALUE) != 0) {
                j92Var.f5192k = i17 - Integer.MIN_VALUE;
            } else {
                j92Var = new j92(r13, continuation);
            }
        }
        j92 j92Var4 = j92Var;
        Object objB = j92Var4.f5190i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (j92Var4.f5192k) {
            case 0:
                ResultKt.b(objB);
                str = (String) map.get("a");
                if (str != null && !r70.k.U0(str)) {
                    cz.b bVar = mu0.f7335a;
                    mu0.b("Handling \"" + str + "\" open GMSG", null);
                    z03 z03Var = r13.n;
                    if (!z03Var.a()) {
                        str6 = (String) map.get("u");
                        if (str6 == null) {
                            str6 = "NO_URL";
                        }
                        j92Var4.f5182a = str6;
                        j92Var4.f5192k = 1;
                        break;
                    } else {
                        boolean z23 = r13.f7058s.f4565u;
                        if (!r70.j.B0((String) map.get("sc"), "0", false) && !r70.j.B0((String) map.get("ig_cl"), InneractiveMediationDefs.SHOW_HOUSE_AD_YES, false)) {
                            qw2 qw2Var = qw2.f8864i;
                            qw2 qw2Var2 = r13.f7051j;
                            if (qw2Var2 != qw2Var && qw2Var2 != qw2.f8862g) {
                                jnVar = jnVar3;
                                z11 = true;
                            }
                            zEqualsIgnoreCase = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39151e.equalsIgnoreCase(str);
                            rr1 rr1Var = r13.f7050i;
                            if (!zEqualsIgnoreCase) {
                                rr1Var.a(false);
                                j92Var4.f5192k = 2;
                                c92 c92Var = (c92) r13.f7048g.get();
                                Optional optional = c92Var.Q;
                                boolean zB = Intrinsics.b(map.get("custom_close"), "1");
                                int iB = b(map);
                                d dVar = c92Var.H;
                                jy0 jy0Var = (jy0) OptionalsKt.b(optional);
                                if (jy0Var != null) {
                                    c92Var.f2984q = jy0Var;
                                    jy0 jy0Var2 = (jy0) OptionalsKt.b(optional);
                                    if (jy0Var2 == null) {
                                        objY = Unit.f71706a;
                                    } else {
                                        c92Var.G = jy0Var2;
                                        if (!((tx0) dVar.getValue()).n.get() && ((tx0) dVar.getValue()).e().f3488a != es3.f2967d) {
                                            c92Var.f2986s = zB;
                                            c92Var.J = iB;
                                            c92Var.f2988u = false;
                                            c92Var.O = z11;
                                            ((tx0) dVar.getValue()).n.set(true);
                                            ViewParent parent = c92Var.g().getParent();
                                            if (parent != null && (parent instanceof ViewGroup)) {
                                                ViewGroup.LayoutParams layoutParams = c92Var.g().getLayoutParams();
                                                Intrinsics.f(layoutParams, "getLayoutParams(...)");
                                                ViewGroup viewGroup = (ViewGroup) parent;
                                                int iIndexOfChild = viewGroup.indexOfChild(c92Var.g());
                                                Context context2 = ((tx0) dVar.getValue()).getContext();
                                                Intrinsics.f(context2, "getContext(...)");
                                                c92Var.R = new sq3(layoutParams, iIndexOfChild, viewGroup, context2);
                                                objY = m0.y(c92Var.f2972c, new mx.e(parent, c92Var, (Continuation) null, 2), j92Var4);
                                                if (objY != coroutineSingletons) {
                                                    objY = Unit.f71706a;
                                                }
                                            } else {
                                                zi3.a(6, "Could not get parent of webview for one-piece expandable", null);
                                                objY = Unit.f71706a;
                                            }
                                        } else {
                                            zi3.a(6, "Tried to one-piece expand an expanded webview", null);
                                            objY = Unit.f71706a;
                                        }
                                    }
                                } else {
                                    objY = Unit.f71706a;
                                }
                                if (objY != coroutineSingletons) {
                                    objY = Unit.f71706a;
                                    break;
                                }
                            } else if ("webapp".equalsIgnoreCase(str)) {
                                rr1Var.a(false);
                                j92Var4.f5192k = 3;
                                break;
                            } else {
                                rr1Var.a(true);
                                if ("intent_async".equalsIgnoreCase(str) && map.containsKey("event_id")) {
                                    str2 = "open_app";
                                    z12 = z23;
                                    z13 = z11;
                                    i5 = 1;
                                } else {
                                    str2 = "open_app";
                                    z12 = z23;
                                    z13 = z11;
                                    i5 = 0;
                                }
                                boolean zEqualsIgnoreCase2 = "chrome_custom_tab".equalsIgnoreCase(str);
                                Context context3 = r13.f7042a;
                                if (!zEqualsIgnoreCase2) {
                                    tx0Var2 = tx0Var;
                                    context = context3;
                                    str3 = "android.intent.action.VIEW";
                                    obj = "u";
                                    jnVar2 = jnVar;
                                    map2 = map;
                                    z14 = z12;
                                    i11 = i5;
                                    j92Var2 = j92Var4;
                                    r12 = z13;
                                } else {
                                    Boolean bool2 = Boolean.FALSE;
                                    int i18 = i5;
                                    jr0 jr0Var2 = r13.f7043b;
                                    boolean z24 = z13;
                                    if (((Boolean) jr0Var2.a("gads:cct_v2_optimization:enabled", bool2, jnVar)).booleanValue()) {
                                        z18 = z12;
                                        String strB = f.b(context3, null);
                                        if (strB != null && !Intrinsics.b(context3.getPackageName(), strB)) {
                                            str3 = "android.intent.action.VIEW";
                                            obj = "u";
                                            th2 = null;
                                            if (r13.f7047f.b() != null) {
                                                zi3.a(6, "Chrome Custom Tabs can only be launched from an Activity context.", th2);
                                            } else {
                                                Boolean bool3 = Boolean.FALSE;
                                                if (!((Boolean) jr0Var2.a("gads:cct_v2_connection:enabled", bool3, jnVar)).booleanValue() && !((Boolean) jr0Var2.a("gads:cct_v2_optimization:enabled", bool3, jnVar)).booleanValue()) {
                                                    zi3.a(6, "None of the CCT Connection and optimization experiments are enabled.", null);
                                                } else {
                                                    j92Var4.f5192k = 4;
                                                    break;
                                                }
                                            }
                                            tx0Var2 = tx0Var;
                                            j92Var2 = j92Var4;
                                            i11 = i18;
                                            r12 = z24;
                                            z14 = z18;
                                            context = context3;
                                            jnVar2 = jnVar;
                                            map2 = map;
                                        } else {
                                            tx0Var2 = tx0Var;
                                            str3 = "android.intent.action.VIEW";
                                            obj = "u";
                                            j92Var2 = j92Var4;
                                            i11 = i18;
                                            r12 = z24;
                                            z14 = z18;
                                            context = context3;
                                            map2 = map;
                                            jnVar2 = jnVar;
                                            zi3.a(6, "Chrome Custom Tabs is not supported.", null);
                                        }
                                    } else {
                                        z18 = z12;
                                        PackageManager packageManager = context3.getPackageManager();
                                        obj = "u";
                                        Intent intent5 = new Intent("android.intent.action.VIEW", Uri.parse("http://"));
                                        str3 = "android.intent.action.VIEW";
                                        ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(intent5, 0);
                                        if (resolveInfoResolveActivity != null) {
                                            List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent5, SQLiteDatabase.OPEN_FULLMUTEX);
                                            Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
                                            if (!(listQueryIntentActivities instanceof Collection) || !listQueryIntentActivities.isEmpty()) {
                                                Iterator it2 = listQueryIntentActivities.iterator();
                                                while (it2.hasNext()) {
                                                    if (Intrinsics.b(resolveInfoResolveActivity.activityInfo.name, ((ResolveInfo) it2.next()).activityInfo.name)) {
                                                        it = it2;
                                                        th2 = null;
                                                        if (Intrinsics.b(resolveInfoResolveActivity.activityInfo.packageName, f.b(context3, null))) {
                                                            if (r13.f7047f.b() != null) {
                                                            }
                                                            tx0Var2 = tx0Var;
                                                            j92Var2 = j92Var4;
                                                            i11 = i18;
                                                            r12 = z24;
                                                            z14 = z18;
                                                            context = context3;
                                                            jnVar2 = jnVar;
                                                            map2 = map;
                                                        } else {
                                                            boolean z25 = z24;
                                                            jr0Var = jr0Var2;
                                                            j92Var3 = j92Var4;
                                                            z19 = z25;
                                                        }
                                                    } else {
                                                        boolean z26 = z24;
                                                        jr0Var = jr0Var2;
                                                        j92Var3 = j92Var4;
                                                        z19 = z26;
                                                        it = it2;
                                                    }
                                                    int i19 = i18;
                                                    Context context4 = context3;
                                                    boolean z27 = z19;
                                                    j92Var4 = j92Var3;
                                                    jr0Var2 = jr0Var;
                                                    z24 = z27;
                                                    context3 = context4;
                                                    i18 = i19;
                                                    it2 = it;
                                                }
                                            }
                                        }
                                        tx0Var2 = tx0Var;
                                        j92Var2 = j92Var4;
                                        i11 = i18;
                                        r12 = z24;
                                        z14 = z18;
                                        context = context3;
                                        map2 = map;
                                        jnVar2 = jnVar;
                                        zi3.a(6, "Chrome Custom Tabs is not supported.", null);
                                    }
                                }
                                if (str2.equalsIgnoreCase(str)) {
                                    String str8 = (String) map2.get("p");
                                    if (str8 == null) {
                                        zi3.a(6, "Package name missing from open app action: " + map2, null);
                                        launchIntentForPackage = null;
                                    } else {
                                        launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage(str8);
                                    }
                                    intent = launchIntentForPackage;
                                    str5 = str;
                                    i13 = r12;
                                    m92Var4 = r13;
                                    z15 = false;
                                    z16 = true;
                                    m92Var = m92Var4;
                                    if (intent != null && (data = intent.getData()) != null) {
                                        z03 z03Var2 = m92Var.n;
                                        String string2 = data.toString();
                                        Intrinsics.f(string2, "toString(...)");
                                        j92Var2.f5182a = m92Var;
                                        j92Var2.f5183b = tx0Var2;
                                        j92Var2.f5184c = map2;
                                        j92Var2.f5185d = str5;
                                        j92Var2.f5186e = intent;
                                        j92Var2.f5187f = i13;
                                        j92Var2.f5189h = z14;
                                        j92Var2.f5188g = i11;
                                        j92Var2.f5192k = 7;
                                        z03Var2.getClass();
                                        break;
                                    }
                                    tx0Var3 = tx0Var2;
                                    m92Var3 = m92Var;
                                    str7 = str5;
                                    i14 = i13;
                                    map3 = map2;
                                    i15 = i11;
                                    if (str2.equalsIgnoreCase(str7)) {
                                        string = (intent == null || (data2 = intent.getData()) == null) ? null : data2.toString();
                                    } else {
                                        string = (String) map3.get("p");
                                    }
                                    j92Var2.f5182a = m92Var3;
                                    j92Var2.f5183b = tx0Var3;
                                    j92Var2.f5184c = map3;
                                    j92Var2.f5185d = intent;
                                    j92Var2.f5186e = null;
                                    j92Var2.f5187f = i14;
                                    j92Var2.f5189h = z14;
                                    j92Var2.f5188g = i15;
                                    j92Var2.f5192k = 8;
                                    m92Var3.a(tx0Var3, string, j92Var2);
                                    bool = Boolean.FALSE;
                                    if (bool != coroutineSingletons) {
                                        i16 = i14;
                                        objB = bool;
                                        intent3 = intent;
                                        z21 = z14;
                                        tx0Var4 = tx0Var3;
                                        m92Var5 = m92Var3;
                                        map4 = map3;
                                        if (!((Boolean) objB).booleanValue()) {
                                            return Unit.f71706a;
                                        }
                                        if (((Boolean) m92Var5.f7043b.a("gads:post_click_lifecycle_monitoring:enabled", Boolean.FALSE, jnVar2)).booleanValue()) {
                                            m92Var5.f7055p.e();
                                        }
                                        boolean z28 = i16 != 0 ? z16 : z15;
                                        j92Var2.f5182a = m92Var5;
                                        j92Var2.f5183b = tx0Var4;
                                        j92Var2.f5184c = map4;
                                        j92Var2.f5185d = intent3;
                                        j92Var2.f5187f = i16;
                                        j92Var2.f5189h = z21;
                                        j92Var2.f5188g = i15;
                                        j92Var2.f5192k = 9;
                                        j92 j92Var5 = j92Var2;
                                        objB = m92Var5.a(map4, z28, z21, tx0Var4, j92Var5);
                                        j92Var4 = j92Var5;
                                        if (objB != coroutineSingletons) {
                                            z22 = z21;
                                            m92Var6 = m92Var5;
                                            intent4 = intent3;
                                            tx0Var5 = tx0Var4;
                                            if (!((Boolean) objB).booleanValue()) {
                                                return Unit.f71706a;
                                            }
                                            boolean z29 = i15 != 0 ? z16 : z15;
                                            boolean z31 = i16 != 0 ? z16 : z15;
                                            j92Var4.f5182a = null;
                                            j92Var4.f5183b = null;
                                            j92Var4.f5184c = null;
                                            j92Var4.f5185d = null;
                                            j92Var4.f5192k = 10;
                                            Object objA = m92Var6.a(map4, m92Var6.f7044c.a(intent4), z29, z31, z22, tx0Var5, j92Var4);
                                            if (objA != CoroutineSingletons.f71806a) {
                                                objA = Unit.f71706a;
                                                break;
                                            }
                                        }
                                    }
                                } else if ("app".equalsIgnoreCase(str) && InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equalsIgnoreCase((String) map2.get("system_browser"))) {
                                    j92Var2.f5182a = r13;
                                    j92Var2.f5183b = tx0Var2;
                                    j92Var2.f5184c = map2;
                                    j92Var2.f5185d = str;
                                    j92Var2.f5187f = r12;
                                    j92Var2.f5189h = z14;
                                    j92Var2.f5188g = i11;
                                    j92Var2.f5192k = 5;
                                    objB = r13.b(tx0Var2, map2, j92Var2);
                                    if (objB != coroutineSingletons) {
                                        m92Var2 = r13;
                                        z17 = z14;
                                        i13 = r12;
                                        intent2 = (Intent) objB;
                                        String str9 = str;
                                        intent = intent2;
                                        str5 = str9;
                                        z14 = z17;
                                        m92Var4 = m92Var2;
                                        z15 = false;
                                        z16 = true;
                                        m92Var = m92Var4;
                                        if (intent != null) {
                                        }
                                        tx0Var3 = tx0Var2;
                                        m92Var3 = m92Var;
                                        str7 = str5;
                                        i14 = i13;
                                        map3 = map2;
                                        i15 = i11;
                                        if (str2.equalsIgnoreCase(str7)) {
                                        }
                                        j92Var2.f5182a = m92Var3;
                                        j92Var2.f5183b = tx0Var3;
                                        j92Var2.f5184c = map3;
                                        j92Var2.f5185d = intent;
                                        j92Var2.f5186e = null;
                                        j92Var2.f5187f = i14;
                                        j92Var2.f5189h = z14;
                                        j92Var2.f5188g = i15;
                                        j92Var2.f5192k = 8;
                                        m92Var3.a(tx0Var3, string, j92Var2);
                                        bool = Boolean.FALSE;
                                        if (bool != coroutineSingletons) {
                                        }
                                    }
                                } else if ("chrome_custom_tab".equalsIgnoreCase(str)) {
                                    LinkedHashMap linkedHashMapU0 = MapsKt.u0(map2);
                                    linkedHashMapU0.put("use_first_package", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                                    linkedHashMapU0.put("use_running_process", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                                    j92Var2.f5182a = r13;
                                    j92Var2.f5183b = tx0Var2;
                                    j92Var2.f5184c = map2;
                                    j92Var2.f5185d = str;
                                    j92Var2.f5187f = r12;
                                    j92Var2.f5189h = z14;
                                    j92Var2.f5188g = i11;
                                    j92Var2.f5192k = 6;
                                    objB = r13.b(tx0Var2, linkedHashMapU0, j92Var2);
                                    if (objB != coroutineSingletons) {
                                        m92Var2 = r13;
                                        z17 = z14;
                                        i13 = r12;
                                        intent2 = (Intent) objB;
                                        String str92 = str;
                                        intent = intent2;
                                        str5 = str92;
                                        z14 = z17;
                                        m92Var4 = m92Var2;
                                        z15 = false;
                                        z16 = true;
                                        m92Var = m92Var4;
                                        if (intent != null) {
                                            z03 z03Var22 = m92Var.n;
                                            String string22 = data.toString();
                                            Intrinsics.f(string22, "toString(...)");
                                            j92Var2.f5182a = m92Var;
                                            j92Var2.f5183b = tx0Var2;
                                            j92Var2.f5184c = map2;
                                            j92Var2.f5185d = str5;
                                            j92Var2.f5186e = intent;
                                            j92Var2.f5187f = i13;
                                            j92Var2.f5189h = z14;
                                            j92Var2.f5188g = i11;
                                            j92Var2.f5192k = 7;
                                            z03Var22.getClass();
                                        }
                                        tx0Var3 = tx0Var2;
                                        m92Var3 = m92Var;
                                        str7 = str5;
                                        i14 = i13;
                                        map3 = map2;
                                        i15 = i11;
                                        if (str2.equalsIgnoreCase(str7)) {
                                        }
                                        j92Var2.f5182a = m92Var3;
                                        j92Var2.f5183b = tx0Var3;
                                        j92Var2.f5184c = map3;
                                        j92Var2.f5185d = intent;
                                        j92Var2.f5186e = null;
                                        j92Var2.f5187f = i14;
                                        j92Var2.f5189h = z14;
                                        j92Var2.f5188g = i15;
                                        j92Var2.f5192k = 8;
                                        m92Var3.a(tx0Var3, string, j92Var2);
                                        bool = Boolean.FALSE;
                                        if (bool != coroutineSingletons) {
                                        }
                                    }
                                } else {
                                    String str10 = (String) map2.get("intent_url");
                                    k8 k8Var = r13.f7045d;
                                    if (str10 == null || r70.k.U0(str10)) {
                                        uri = null;
                                    } else {
                                        try {
                                            uri = Intent.parseUri(str10, 0);
                                            try {
                                                Uri data3 = uri.getData();
                                                if (data3 != null) {
                                                    uri.setDataAndType(k8Var.a(data3, tx0Var2), uri.getType());
                                                }
                                            } catch (URISyntaxException e3) {
                                                e = e3;
                                                zi3.a("Error parsing the intent url (" + str10 + "): " + e);
                                                uri = uri;
                                                if (uri != null) {
                                                }
                                                intent = uri;
                                                i13 = r12;
                                                i11 = i12;
                                                str5 = str4;
                                                m92Var = this;
                                                if (intent != null) {
                                                }
                                                tx0Var3 = tx0Var2;
                                                m92Var3 = m92Var;
                                                str7 = str5;
                                                i14 = i13;
                                                map3 = map2;
                                                i15 = i11;
                                                if (str2.equalsIgnoreCase(str7)) {
                                                }
                                                j92Var2.f5182a = m92Var3;
                                                j92Var2.f5183b = tx0Var3;
                                                j92Var2.f5184c = map3;
                                                j92Var2.f5185d = intent;
                                                j92Var2.f5186e = null;
                                                j92Var2.f5187f = i14;
                                                j92Var2.f5189h = z14;
                                                j92Var2.f5188g = i15;
                                                j92Var2.f5192k = 8;
                                                m92Var3.a(tx0Var3, string, j92Var2);
                                                bool = Boolean.FALSE;
                                                if (bool != coroutineSingletons) {
                                                }
                                                return coroutineSingletons;
                                            }
                                        } catch (URISyntaxException e11) {
                                            e = e11;
                                            uri = null;
                                        }
                                    }
                                    if (uri != null) {
                                        String str11 = (String) map2.get(obj);
                                        if (str11 != null && !r70.k.U0(str11)) {
                                            String str12 = (String) map2.get(InneractiveMediationDefs.GENDER_MALE);
                                            String str13 = (String) map2.get("p");
                                            String str14 = (String) map2.get("c");
                                            i12 = i11;
                                            String str15 = (String) map2.get(InneractiveMediationDefs.GENDER_FEMALE);
                                            str4 = str;
                                            Intent intent6 = new Intent();
                                            Uri uriA = k8Var.a(Uri.parse(str11), tx0Var2);
                                            if (str12 != null && !r70.k.U0(str12)) {
                                                intent6.setDataAndType(uriA, str12);
                                            } else {
                                                intent6.setData(uriA);
                                            }
                                            intent6.setAction(str3);
                                            if (str13 != null && !r70.k.U0(str13)) {
                                                intent6.setPackage(str13);
                                            }
                                            if (str14 == null || r70.k.U0(str14)) {
                                                z15 = false;
                                                z16 = true;
                                            } else {
                                                z15 = false;
                                                String[] strArr = (String[]) new Regex("/").i(2, str14).toArray(new String[0]);
                                                if (strArr.length < 2) {
                                                    zi3.a(6, "Could not parse component name from open GMSG: ".concat(str14), null);
                                                    intent6 = null;
                                                    z16 = true;
                                                    uri = intent6;
                                                } else {
                                                    z16 = true;
                                                    intent6.setClassName(strArr[0], strArr[1]);
                                                }
                                            }
                                            if (str15 != null && !r70.k.U0(str15)) {
                                                try {
                                                    intent6.addFlags(Integer.parseInt(str15));
                                                } catch (NumberFormatException e12) {
                                                    zi3.a("Could not parse intent flags (" + str15 + "): " + e12);
                                                }
                                            }
                                            uri = intent6;
                                        } else {
                                            i12 = i11;
                                            str4 = str;
                                            z15 = false;
                                            z16 = true;
                                            zi3.a(6, "Blank URL and invalid intent URL for an open GMSG: " + map2, null);
                                        }
                                    } else {
                                        i12 = i11;
                                        str4 = str;
                                        z15 = false;
                                        z16 = true;
                                    }
                                    intent = uri;
                                    i13 = r12;
                                    i11 = i12;
                                    str5 = str4;
                                    m92Var = this;
                                    if (intent != null) {
                                    }
                                    tx0Var3 = tx0Var2;
                                    m92Var3 = m92Var;
                                    str7 = str5;
                                    i14 = i13;
                                    map3 = map2;
                                    i15 = i11;
                                    if (str2.equalsIgnoreCase(str7)) {
                                    }
                                    j92Var2.f5182a = m92Var3;
                                    j92Var2.f5183b = tx0Var3;
                                    j92Var2.f5184c = map3;
                                    j92Var2.f5185d = intent;
                                    j92Var2.f5186e = null;
                                    j92Var2.f5187f = i14;
                                    j92Var2.f5189h = z14;
                                    j92Var2.f5188g = i15;
                                    j92Var2.f5192k = 8;
                                    m92Var3.a(tx0Var3, string, j92Var2);
                                    bool = Boolean.FALSE;
                                    if (bool != coroutineSingletons) {
                                    }
                                }
                            }
                        }
                        jnVar = jnVar3;
                        z11 = false;
                        zEqualsIgnoreCase = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39151e.equalsIgnoreCase(str);
                        rr1 rr1Var2 = r13.f7050i;
                        if (!zEqualsIgnoreCase) {
                        }
                    }
                    return coroutineSingletons;
                }
                zi3.a(6, "Action is missing from an open GMSG: " + map, null);
                return Unit.f71706a;
            case 1:
                str6 = (String) j92Var4.f5182a;
                ResultKt.b(objB);
                zi3.a(6, "Safe browsing blocked auto click: " + str6, null);
                return Unit.f71706a;
            case 2:
                ResultKt.b(objB);
                return Unit.f71706a;
            case 3:
                ResultKt.b(objB);
                return Unit.f71706a;
            case 4:
                ResultKt.b(objB);
                return Unit.f71706a;
            case 5:
                int i21 = j92Var4.f5188g;
                z17 = j92Var4.f5189h;
                i13 = j92Var4.f5187f;
                str = (String) j92Var4.f5185d;
                Map map5 = j92Var4.f5184c;
                tx0 tx0Var6 = j92Var4.f5183b;
                m92Var2 = (m92) j92Var4.f5182a;
                ResultKt.b(objB);
                jnVar2 = jnVar3;
                str2 = "open_app";
                tx0Var2 = tx0Var6;
                j92Var2 = j92Var4;
                i11 = i21;
                map2 = map5;
                intent2 = (Intent) objB;
                String str922 = str;
                intent = intent2;
                str5 = str922;
                z14 = z17;
                m92Var4 = m92Var2;
                z15 = false;
                z16 = true;
                m92Var = m92Var4;
                if (intent != null) {
                }
                tx0Var3 = tx0Var2;
                m92Var3 = m92Var;
                str7 = str5;
                i14 = i13;
                map3 = map2;
                i15 = i11;
                if (str2.equalsIgnoreCase(str7)) {
                }
                j92Var2.f5182a = m92Var3;
                j92Var2.f5183b = tx0Var3;
                j92Var2.f5184c = map3;
                j92Var2.f5185d = intent;
                j92Var2.f5186e = null;
                j92Var2.f5187f = i14;
                j92Var2.f5189h = z14;
                j92Var2.f5188g = i15;
                j92Var2.f5192k = 8;
                m92Var3.a(tx0Var3, string, j92Var2);
                bool = Boolean.FALSE;
                if (bool != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 6:
                int i22 = j92Var4.f5188g;
                z17 = j92Var4.f5189h;
                i13 = j92Var4.f5187f;
                str = (String) j92Var4.f5185d;
                Map map6 = j92Var4.f5184c;
                tx0 tx0Var7 = j92Var4.f5183b;
                m92Var2 = (m92) j92Var4.f5182a;
                ResultKt.b(objB);
                jnVar2 = jnVar3;
                str2 = "open_app";
                tx0Var2 = tx0Var7;
                j92Var2 = j92Var4;
                i11 = i22;
                map2 = map6;
                intent2 = (Intent) objB;
                String str9222 = str;
                intent = intent2;
                str5 = str9222;
                z14 = z17;
                m92Var4 = m92Var2;
                z15 = false;
                z16 = true;
                m92Var = m92Var4;
                if (intent != null) {
                }
                tx0Var3 = tx0Var2;
                m92Var3 = m92Var;
                str7 = str5;
                i14 = i13;
                map3 = map2;
                i15 = i11;
                if (str2.equalsIgnoreCase(str7)) {
                }
                j92Var2.f5182a = m92Var3;
                j92Var2.f5183b = tx0Var3;
                j92Var2.f5184c = map3;
                j92Var2.f5185d = intent;
                j92Var2.f5186e = null;
                j92Var2.f5187f = i14;
                j92Var2.f5189h = z14;
                j92Var2.f5188g = i15;
                j92Var2.f5192k = 8;
                m92Var3.a(tx0Var3, string, j92Var2);
                bool = Boolean.FALSE;
                if (bool != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 7:
                i15 = j92Var4.f5188g;
                boolean z32 = j92Var4.f5189h;
                int i23 = j92Var4.f5187f;
                intent = j92Var4.f5186e;
                String str16 = (String) j92Var4.f5185d;
                Map map7 = j92Var4.f5184c;
                tx0Var3 = j92Var4.f5183b;
                m92Var3 = (m92) j92Var4.f5182a;
                ResultKt.b(objB);
                jnVar2 = jnVar3;
                i14 = i23;
                str7 = str16;
                map3 = map7;
                z16 = true;
                j92Var2 = j92Var4;
                z14 = z32;
                str2 = "open_app";
                z15 = false;
                if (str2.equalsIgnoreCase(str7)) {
                }
                j92Var2.f5182a = m92Var3;
                j92Var2.f5183b = tx0Var3;
                j92Var2.f5184c = map3;
                j92Var2.f5185d = intent;
                j92Var2.f5186e = null;
                j92Var2.f5187f = i14;
                j92Var2.f5189h = z14;
                j92Var2.f5188g = i15;
                j92Var2.f5192k = 8;
                m92Var3.a(tx0Var3, string, j92Var2);
                bool = Boolean.FALSE;
                if (bool != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 8:
                i15 = j92Var4.f5188g;
                boolean z33 = j92Var4.f5189h;
                int i24 = j92Var4.f5187f;
                Intent intent7 = (Intent) j92Var4.f5185d;
                map3 = j92Var4.f5184c;
                tx0 tx0Var8 = j92Var4.f5183b;
                m92 m92Var7 = (m92) j92Var4.f5182a;
                ResultKt.b(objB);
                jnVar2 = jnVar3;
                i16 = i24;
                m92Var5 = m92Var7;
                z16 = true;
                j92Var2 = j92Var4;
                intent3 = intent7;
                tx0Var4 = tx0Var8;
                z21 = z33;
                z15 = false;
                map4 = map3;
                if (!((Boolean) objB).booleanValue()) {
                }
                break;
            case 9:
                i15 = j92Var4.f5188g;
                boolean z34 = j92Var4.f5189h;
                int i25 = j92Var4.f5187f;
                intent4 = (Intent) j92Var4.f5185d;
                map4 = j92Var4.f5184c;
                tx0 tx0Var9 = j92Var4.f5183b;
                m92Var6 = (m92) j92Var4.f5182a;
                ResultKt.b(objB);
                z22 = z34;
                i16 = i25;
                z16 = true;
                z15 = false;
                tx0Var5 = tx0Var9;
                if (!((Boolean) objB).booleanValue()) {
                }
                break;
            case 10:
                ResultKt.b(objB);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0082, code lost:
    
        if (r10.a(r0) == r1) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00ad, code lost:
    
        if (r9.a(r7, "openIntentAsync", r0) == r1) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:33:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Map map, boolean z11, boolean z12, boolean z13, boolean z14, tx0 tx0Var, ContinuationImpl continuationImpl) {
        k92 k92Var;
        Map map2;
        boolean z15;
        tx0 tx0Var2;
        if (continuationImpl instanceof k92) {
            k92Var = (k92) continuationImpl;
            int i5 = k92Var.f5619h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k92Var.f5619h = i5 - Integer.MIN_VALUE;
            } else {
                k92Var = new k92(this, continuationImpl);
            }
        }
        Object obj = k92Var.f5617f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k92Var.f5619h;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (z11 && z13) {
                k92Var.f5612a = map;
                k92Var.f5613b = tx0Var;
                k92Var.f5614c = z11;
                k92Var.f5615d = z12;
                k92Var.f5616e = z14;
                k92Var.f5619h = 1;
                if (this.f7046e.n(k92Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
        } else if (i11 == 1) {
            z14 = k92Var.f5616e;
            z12 = k92Var.f5615d;
            z11 = k92Var.f5614c;
            tx0Var = k92Var.f5613b;
            map = k92Var.f5612a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            z15 = k92Var.f5615d;
            z11 = k92Var.f5614c;
            tx0Var2 = k92Var.f5613b;
            map2 = k92Var.f5612a;
            ResultKt.b(obj);
            if (z15) {
                return Unit.f71706a;
            }
            com.google.gson.r rVar = new com.google.gson.r();
            rVar.r((String) map2.get("event_id"), Boolean.valueOf(z11));
            Unit unit = Unit.f71706a;
            k92Var.f5612a = null;
            k92Var.f5613b = null;
            k92Var.f5619h = 3;
        }
        if (z11 && z14 && (r10 = tx0Var.o) != null) {
            k92Var.f5612a = map;
            k92Var.f5613b = tx0Var;
            k92Var.f5614c = z11;
            k92Var.f5615d = z12;
            k92Var.f5619h = 2;
        }
        map2 = map;
        z15 = z12;
        tx0Var2 = tx0Var;
        if (z15) {
        }
    }
}
