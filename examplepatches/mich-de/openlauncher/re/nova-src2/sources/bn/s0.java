package bn;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import androidx.core.app.FrameMetricsAggregator;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.measurement.gc;
import com.google.android.gms.internal.measurement.ye;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import io.sentry.android.core.SentryAndroidOptions;
import io.sentry.g3;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;
import w70.m1;

/* loaded from: classes3.dex */
public final class s0 implements dn.b, jf.f, mi.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18278a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f18279b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f18280c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f18281d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f18282e;

    /* renamed from: f, reason: collision with root package name */
    public Object f18283f;

    public /* synthetic */ s0(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i5) {
        this.f18278a = i5;
        this.f18279b = obj;
        this.f18280c = obj2;
        this.f18281d = obj3;
        this.f18282e = obj4;
        this.f18283f = obj5;
    }

    public static s0 g(SharedPreferences sharedPreferences, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        s0 s0Var = new s0(sharedPreferences, scheduledThreadPoolExecutor);
        synchronized (((ArrayDeque) s0Var.f18282e)) {
            try {
                ((ArrayDeque) s0Var.f18282e).clear();
                String string = ((SharedPreferences) s0Var.f18279b).getString((String) s0Var.f18280c, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                if (!TextUtils.isEmpty(string) && string.contains((String) s0Var.f18281d)) {
                    String[] strArrSplit = string.split((String) s0Var.f18281d, -1);
                    if (strArrSplit.length == 0) {
                        Log.e("FirebaseMessaging", "Corrupted queue. Please check the queue contents and item separator provided");
                    }
                    for (String str : strArrSplit) {
                        if (!TextUtils.isEmpty(str)) {
                            ((ArrayDeque) s0Var.f18282e).add(str);
                        }
                    }
                    return s0Var;
                }
                return s0Var;
            } finally {
            }
        }
    }

    @Override // jf.f
    public int a(long j11) {
        long[] jArr = (long[]) this.f18280c;
        int iB = wf.v.b(jArr, j11, false);
        if (iB < jArr.length) {
            return iB;
        }
        return -1;
    }

    public io.sentry.android.core.c d() {
        FrameMetricsAggregator frameMetricsAggregator;
        int i5;
        int i11;
        SparseIntArray sparseIntArray;
        if (!i() || (frameMetricsAggregator = (FrameMetricsAggregator) this.f18279b) == null) {
            return null;
        }
        SparseIntArray[] sparseIntArrayArr = (SparseIntArray[]) frameMetricsAggregator.f14217a.f80407b;
        int i12 = 0;
        if (sparseIntArrayArr.length <= 0 || (sparseIntArray = sparseIntArrayArr[0]) == null) {
            i5 = 0;
            i11 = 0;
        } else {
            int i13 = 0;
            i5 = 0;
            i11 = 0;
            while (i12 < sparseIntArray.size()) {
                int iKeyAt = sparseIntArray.keyAt(i12);
                int iValueAt = sparseIntArray.valueAt(i12);
                i13 += iValueAt;
                if (iKeyAt > 700) {
                    i11 += iValueAt;
                } else if (iKeyAt > 16) {
                    i5 += iValueAt;
                }
                i12++;
            }
            i12 = i13;
        }
        return new io.sentry.android.core.c(i12, i5, i11);
    }

    @Override // ni.d
    public void e() {
        qx.r rVar = (qx.r) ((qx.m0) this.f18279b).invoke();
        if (rVar != null) {
            qx.l lVar = (qx.l) this.f18280c;
            qx.z0 z0Var = (qx.z0) this.f18281d;
            rVar.f();
            LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("placement", lVar.name()));
            String str = rVar.f84590f;
            if (str != null) {
                linkedHashMapK0.put("location_in_app", str);
            }
            zy.c cVar = zy.c.f98823a;
            zy.c.i("ad_impression_banner", linkedHashMapK0);
            z0Var.invoke(rVar);
        }
    }

    @Override // ni.d
    public void f(ni.m mVar) {
        long j11 = mVar.f78293b;
        String str = mVar.f78294c;
        double d5 = j11 / 1000000.0d;
        zy.c cVar = zy.c.f98823a;
        Pair pair = new Pair("placement", ((qx.l) this.f18280c).name());
        Pair pair2 = new Pair("ad_type", "banner");
        sx.j jVar = (sx.j) this.f18282e;
        sx.o oVar = jVar.f87792a;
        Pair pair3 = new Pair("network", oVar != null ? oVar.f87816a : InneractiveMediationNameConsts.ADMOB);
        String str2 = jVar.f87793b;
        if (str2 == null) {
            str2 = "unknown";
        }
        zy.c.i("paid_ad_impression", MapsKt.j0(pair, pair2, pair3, new Pair("tier", str2), new Pair("value", Double.valueOf(d5)), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, str), new Pair("precision", mVar.f78292a)));
        yx.h hVar = yx.h.f97704a;
        yx.h.h(str, d5);
        ((qx.y0) this.f18283f).invoke(jVar, Double.valueOf(d5));
    }

    @Override // w60.a
    public Object get() {
        switch (this.f18278a) {
            case 0:
                return new r0((ul.g) ((b5.f) this.f18279b).f17550a, (om.e) ((dn.c) this.f18280c).get(), (en.k) ((dn.c) this.f18281d).get(), (m) ((dn.c) this.f18282e).get(), (CoroutineContext) ((dn.c) this.f18283f).get());
            default:
                return new en.c((h1) ((dn.c) this.f18280c).get(), (om.e) ((dn.c) this.f18281d).get(), (b) ((dn.c) this.f18282e).get(), (en.e) ((dn.c) this.f18283f).get(), (en.l) ((dn.c) this.f18279b).get());
        }
    }

    @Override // jf.f
    public List h(long j11) {
        qf.e eVar = (qf.e) this.f18279b;
        Map map = (Map) this.f18281d;
        HashMap map2 = (HashMap) this.f18282e;
        HashMap map3 = (HashMap) this.f18283f;
        ArrayList arrayList = new ArrayList();
        eVar.g(j11, eVar.f84015h, arrayList);
        TreeMap treeMap = new TreeMap();
        eVar.i(j11, false, eVar.f84015h, treeMap);
        eVar.h(j11, map, map2, eVar.f84015h, treeMap);
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            android.util.Pair pair = (android.util.Pair) it.next();
            String str = (String) map3.get(pair.second);
            if (str != null) {
                byte[] bArrDecode = Base64.decode(str, 0);
                Bitmap bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length);
                qf.f fVar = (qf.f) map2.get(pair.first);
                fVar.getClass();
                arrayList2.add(new jf.b(null, null, null, bitmapDecodeByteArray, fVar.f84023c, 0, fVar.f84025e, fVar.f84022b, 0, Integer.MIN_VALUE, -3.4028235E38f, fVar.f84026f, fVar.f84027g, false, -16777216, fVar.f84030j, 0.0f));
            }
        }
        for (Map.Entry entry : treeMap.entrySet()) {
            qf.f fVar2 = (qf.f) map2.get(entry.getKey());
            fVar2.getClass();
            jf.a aVar = (jf.a) entry.getValue();
            CharSequence charSequence = aVar.f69489a;
            charSequence.getClass();
            SpannableStringBuilder spannableStringBuilder = (SpannableStringBuilder) charSequence;
            for (qf.a aVar2 : (qf.a[]) spannableStringBuilder.getSpans(0, spannableStringBuilder.length(), qf.a.class)) {
                spannableStringBuilder.replace(spannableStringBuilder.getSpanStart(aVar2), spannableStringBuilder.getSpanEnd(aVar2), (CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
            for (int i5 = 0; i5 < spannableStringBuilder.length(); i5++) {
                if (spannableStringBuilder.charAt(i5) == ' ') {
                    int i11 = i5 + 1;
                    int i12 = i11;
                    while (i12 < spannableStringBuilder.length() && spannableStringBuilder.charAt(i12) == ' ') {
                        i12++;
                    }
                    int i13 = i12 - i11;
                    if (i13 > 0) {
                        spannableStringBuilder.delete(i5, i13 + i5);
                    }
                }
            }
            if (spannableStringBuilder.length() > 0 && spannableStringBuilder.charAt(0) == ' ') {
                spannableStringBuilder.delete(0, 1);
            }
            for (int i14 = 0; i14 < spannableStringBuilder.length() - 1; i14++) {
                if (spannableStringBuilder.charAt(i14) == '\n') {
                    int i15 = i14 + 1;
                    if (spannableStringBuilder.charAt(i15) == ' ') {
                        spannableStringBuilder.delete(i15, i14 + 2);
                    }
                }
            }
            if (spannableStringBuilder.length() > 0 && spannableStringBuilder.charAt(spannableStringBuilder.length() - 1) == ' ') {
                spannableStringBuilder.delete(spannableStringBuilder.length() - 1, spannableStringBuilder.length());
            }
            for (int i16 = 0; i16 < spannableStringBuilder.length() - 1; i16++) {
                if (spannableStringBuilder.charAt(i16) == ' ') {
                    int i17 = i16 + 1;
                    if (spannableStringBuilder.charAt(i17) == '\n') {
                        spannableStringBuilder.delete(i16, i17);
                    }
                }
            }
            if (spannableStringBuilder.length() > 0 && spannableStringBuilder.charAt(spannableStringBuilder.length() - 1) == '\n') {
                spannableStringBuilder.delete(spannableStringBuilder.length() - 1, spannableStringBuilder.length());
            }
            float f11 = fVar2.f84023c;
            int i18 = fVar2.f84024d;
            aVar.f69493e = f11;
            aVar.f69494f = i18;
            aVar.f69495g = fVar2.f84025e;
            aVar.f69496h = fVar2.f84022b;
            aVar.f69500l = fVar2.f84026f;
            float f12 = fVar2.f84029i;
            int i19 = fVar2.f84028h;
            aVar.f69499k = f12;
            aVar.f69498j = i19;
            aVar.f69502p = fVar2.f84030j;
            arrayList2.add(aVar.a());
        }
        return arrayList2;
    }

    public boolean i() {
        SentryAndroidOptions sentryAndroidOptions = (SentryAndroidOptions) this.f18280c;
        return (((FrameMetricsAggregator) this.f18279b) == null || !sentryAndroidOptions.isEnableFramesTracking() || sentryAndroidOptions.isEnablePerformanceV2()) ? false : true;
    }

    public boolean j() {
        ApplicationInfo applicationInfo;
        Bundle bundle;
        ul.g gVar = (ul.g) this.f18280c;
        gVar.a();
        Context context = gVar.f91320a;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (bundle = (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)).metaData) == null || !bundle.containsKey("firebase_messaging_installation_id_enabled")) {
                return false;
            }
            return applicationInfo.metaData.getBoolean("firebase_messaging_installation_id_enabled");
        } catch (PackageManager.NameNotFoundException unused) {
            return false;
        }
    }

    public void k(String str, Runnable runnable) {
        try {
            if (Looper.getMainLooper().getThread().getId() == Thread.currentThread().getId()) {
                runnable.run();
                return;
            }
            gu.j jVar = (gu.j) this.f18283f;
            ((Handler) jVar.f57836b).post(new io.sentry.android.core.t0(1, this, runnable, str));
        } catch (Throwable unused) {
            if (str != null) {
                ((SentryAndroidOptions) this.f18280c).getLogger().g(g3.WARNING, "Failed to execute ".concat(str), new Object[0]);
            }
        }
    }

    public void l(String key, Object obj) {
        Intrinsics.g(key, "key");
        ((LinkedHashMap) this.f18279b).put(key, obj);
        m1 m1Var = (m1) ((LinkedHashMap) this.f18281d).get(key);
        if (m1Var != null) {
            ((i2) m1Var).j(obj);
        }
        m1 m1Var2 = (m1) ((LinkedHashMap) this.f18282e).get(key);
        if (m1Var2 != null) {
            ((i2) m1Var2).j(obj);
        }
    }

    @Override // ni.d
    public void onAdClicked() {
        String str;
        Pair pair = new Pair("placement", ((qx.l) this.f18280c).name());
        Pair pair2 = new Pair("ad_type", "banner");
        sx.j jVar = (sx.j) this.f18282e;
        sx.o oVar = jVar.f87792a;
        Pair pair3 = new Pair("network", oVar != null ? oVar.f87816a : InneractiveMediationNameConsts.ADMOB);
        String str2 = jVar.f87793b;
        if (str2 == null) {
            str2 = "unknown";
        }
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(pair, pair2, pair3, new Pair("tier", str2));
        qx.r rVar = (qx.r) ((qx.m0) this.f18279b).invoke();
        if (rVar != null && (str = rVar.f84590f) != null) {
            linkedHashMapK0.put("location_in_app", str);
        }
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ad_click", linkedHashMapK0);
    }

    @Override // jf.f
    public long p(int i5) {
        return ((long[]) this.f18280c)[i5];
    }

    @Override // jf.f
    public int r() {
        return ((long[]) this.f18280c).length;
    }

    public s0(Context context, ul.g gVar, om.e eVar, i iVar, ja.d dVar) {
        this.f18278a = 10;
        this.f18279b = new kh.c(context, null, kh.c.f71525l, qg.b.f84048kp, qg.e.f84049c);
        this.f18280c = gVar;
        this.f18281d = eVar;
        this.f18282e = iVar;
        this.f18283f = dVar;
    }

    public s0(cl.e1 e1Var, ye yeVar, HashMap map) {
        this.f18278a = 1;
        this.f18279b = new ConcurrentHashMap();
        e1Var.getClass();
        this.f18280c = e1Var;
        yeVar.getClass();
        this.f18281d = yeVar;
        this.f18283f = map;
        vk.b0.c(!map.isEmpty());
        this.f18282e = gc.f32570c;
    }

    public s0(Map initialState) {
        this.f18278a = 6;
        Intrinsics.g(initialState, "initialState");
        this.f18279b = MapsKt.u0(initialState);
        this.f18280c = new LinkedHashMap();
        this.f18281d = new LinkedHashMap();
        this.f18282e = new LinkedHashMap();
        this.f18283f = new j6.a(this);
    }

    public s0(h60.c cVar) {
        this.f18278a = 4;
        this.f18279b = cVar.f59476a;
        this.f18280c = cVar.f59478c;
        this.f18281d = cVar.f59479d;
        this.f18282e = cVar.f59480e;
        this.f18283f = cVar.f59482g;
    }

    public s0(qf.e eVar, HashMap map, HashMap map2, HashMap map3) {
        this.f18278a = 7;
        this.f18279b = eVar;
        this.f18282e = map2;
        this.f18283f = map3;
        this.f18281d = Collections.unmodifiableMap(map);
        TreeSet treeSet = new TreeSet();
        int i5 = 0;
        eVar.d(treeSet, false);
        long[] jArr = new long[treeSet.size()];
        Iterator it = treeSet.iterator();
        while (it.hasNext()) {
            jArr[i5] = ((Long) it.next()).longValue();
            i5++;
        }
        this.f18280c = jArr;
    }

    public s0(dn.c cVar, dn.c cVar2, dn.c cVar3, dn.c cVar4, dn.c cVar5) {
        this.f18278a = 2;
        this.f18280c = cVar;
        this.f18281d = cVar2;
        this.f18282e = cVar3;
        this.f18283f = cVar4;
        this.f18279b = cVar5;
    }

    public s0(SentryAndroidOptions sentryAndroidOptions) {
        this.f18278a = 5;
        gu.j jVar = new gu.j(23, (byte) 0);
        this.f18279b = null;
        this.f18281d = new ConcurrentHashMap();
        this.f18282e = new WeakHashMap();
        if (io.sentry.android.core.q0.b("androidx.core.app.FrameMetricsAggregator", sentryAndroidOptions.getLogger()) != null) {
            this.f18279b = new FrameMetricsAggregator();
        }
        this.f18280c = sentryAndroidOptions;
        this.f18283f = jVar;
    }

    public s0(SharedPreferences sharedPreferences, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        this.f18278a = 11;
        this.f18282e = new ArrayDeque();
        this.f18279b = sharedPreferences;
        this.f18280c = "topic_operation_queue";
        this.f18281d = ",";
        this.f18283f = scheduledThreadPoolExecutor;
    }

    public s0(Context context, View view) {
        this.f18278a = 9;
        this.f18279b = context;
        this.f18281d = view;
        q.k kVar = new q.k(context);
        this.f18280c = kVar;
        kVar.f83236e = new q.c(this, 10);
        q.u uVar = new q.u(context, kVar, view, false, 2130969827, 0);
        this.f18282e = uVar;
        uVar.f83299f = 5;
        uVar.f83303j = new q.t(this, 1);
    }

    public s0(ke.h hVar) {
        this.f18278a = 3;
        this.f18279b = hVar;
        this.f18280c = new HashMap();
        this.f18281d = new HashSet();
        this.f18282e = new HashMap();
    }
}
