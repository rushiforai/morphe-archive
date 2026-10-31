package be;

import a5.a0;
import a5.h2;
import android.app.Activity;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.http.UrlResponseInfo;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.core.graphics.Insets;
import bn.s0;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.play.core.review.ReviewInfo;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsTasks;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import e10.s2;
import e10.y2;
import io.sentry.android.core.ActivityLifecycleIntegration;
import io.sentry.android.core.SentryAndroidOptions;
import io.sentry.b3;
import io.sentry.f4;
import io.sentry.g3;
import io.sentry.g4;
import io.sentry.h4;
import io.sentry.i4;
import io.sentry.k4;
import io.sentry.protocol.u;
import io.sentry.t4;
import io.sentry.w3;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Pair;
import kotlin.reflect.KProperty;
import l1.a2;
import s90.a1;
import s90.b1;
import s90.g1;
import s90.p;
import s90.s;
import s90.x;
import s90.x0;
import tm.o;

/* loaded from: classes3.dex */
public final /* synthetic */ class f implements i, fi.c, k4, fi.e, x, b1, a0, ce.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17836a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f17837b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f17838c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f17839d;

    public /* synthetic */ f(int i5, Object obj, Object obj2, Object obj3) {
        this.f17836a = i5;
        this.f17837b = obj;
        this.f17838c = obj2;
        this.f17839d = obj3;
    }

    @Override // io.sentry.k4
    public void a(i4 i4Var) {
        io.sentry.android.core.c cVarD;
        int i5;
        f4 f4Var = (f4) this.f17837b;
        k4 k4Var = (k4) this.f17838c;
        AtomicReference atomicReference = (AtomicReference) this.f17839d;
        if (k4Var != null) {
            k4Var.a(i4Var);
        }
        io.sentry.android.core.f fVar = f4Var.f67239r.f67770g;
        if (fVar != null) {
            ActivityLifecycleIntegration activityLifecycleIntegration = (ActivityLifecycleIntegration) fVar.f66870a;
            WeakReference weakReference = (WeakReference) fVar.f66871b;
            String str = (String) fVar.f66872c;
            Activity activity = (Activity) weakReference.get();
            if (activity != null) {
                s0 s0Var = activityLifecycleIntegration.f66767q;
                u uVar = f4Var.f67224a;
                synchronized (s0Var) {
                    try {
                        if (s0Var.i()) {
                            io.sentry.android.core.c cVar = null;
                            s0Var.k(null, new io.sentry.android.core.b(s0Var, activity, 1));
                            io.sentry.android.core.c cVar2 = (io.sentry.android.core.c) ((WeakHashMap) s0Var.f18282e).remove(activity);
                            if (cVar2 != null && (cVarD = s0Var.d()) != null) {
                                cVar = new io.sentry.android.core.c(cVarD.f66852a - cVar2.f66852a, cVarD.f66853b - cVar2.f66853b, cVarD.f66854c - cVar2.f66854c);
                            }
                            if (cVar != null && ((i5 = cVar.f66852a) != 0 || cVar.f66853b != 0 || cVar.f66854c != 0)) {
                                io.sentry.protocol.j jVar = new io.sentry.protocol.j(Integer.valueOf(i5), "none");
                                io.sentry.protocol.j jVar2 = new io.sentry.protocol.j(Integer.valueOf(cVar.f66853b), "none");
                                io.sentry.protocol.j jVar3 = new io.sentry.protocol.j(Integer.valueOf(cVar.f66854c), "none");
                                HashMap map = new HashMap();
                                map.put("frames_total", jVar);
                                map.put("frames_slow", jVar2);
                                map.put("frames_frozen", jVar3);
                                ((ConcurrentHashMap) s0Var.f18281d).put(uVar, map);
                            }
                        }
                    } finally {
                    }
                }
            } else {
                SentryAndroidOptions sentryAndroidOptions = activityLifecycleIntegration.f66756d;
                if (sentryAndroidOptions != null) {
                    sentryAndroidOptions.getLogger().g(g3.WARNING, "Unable to track activity frames as the Activity %s has been destroyed.", str);
                }
            }
        }
        t4 t4Var = f4Var.f67238q;
        if (t4Var != null) {
            atomicReference.set(t4Var.f(f4Var));
        }
    }

    /* JADX WARN: Finally extract failed */
    @Override // be.i
    public Object apply(Object obj) {
        int i5;
        int i11 = this.f17836a;
        int i12 = 6;
        int i13 = 5;
        int i14 = 4;
        int i15 = 3;
        Object obj2 = this.f17839d;
        Object obj3 = this.f17838c;
        int i16 = 0;
        int i17 = 1;
        int i18 = 2;
        k kVar = (k) this.f17837b;
        switch (i11) {
            case 0:
                ArrayList arrayList = (ArrayList) obj3;
                td.i iVar = (td.i) obj2;
                Cursor cursor = (Cursor) obj;
                while (cursor.moveToNext()) {
                    long j11 = cursor.getLong(i16);
                    int i19 = cursor.getInt(7) != 0 ? i17 : i16;
                    ra.f fVar = new ra.f();
                    fVar.f85765g = new HashMap();
                    String string = cursor.getString(i17);
                    if (string == null) {
                        throw new NullPointerException("Null transportName");
                    }
                    fVar.f85760b = string;
                    fVar.f85763e = Long.valueOf(cursor.getLong(i18));
                    fVar.f85764f = Long.valueOf(cursor.getLong(i15));
                    if (i19 != 0) {
                        String string2 = cursor.getString(i14);
                        fVar.f85762d = new td.l(string2 == null ? k.f17846f : new qd.c(string2), cursor.getBlob(5));
                        i5 = i16;
                    } else {
                        String string3 = cursor.getString(i14);
                        qd.c cVar = string3 == null ? k.f17846f : new qd.c(string3);
                        Cursor cursorQuery = kVar.a().query("event_payloads", new String[]{"bytes"}, "event_id = ?", new String[]{String.valueOf(j11)}, null, null, "sequence_num");
                        try {
                            ArrayList arrayList2 = new ArrayList();
                            int length = i16;
                            while (cursorQuery.moveToNext()) {
                                byte[] blob = cursorQuery.getBlob(i16);
                                arrayList2.add(blob);
                                length += blob.length;
                            }
                            byte[] bArr = new byte[length];
                            int i21 = i16;
                            int length2 = i21;
                            while (i21 < arrayList2.size()) {
                                byte[] bArr2 = (byte[]) arrayList2.get(i21);
                                ArrayList arrayList3 = arrayList2;
                                System.arraycopy(bArr2, 0, bArr, length2, bArr2.length);
                                length2 += bArr2.length;
                                i21++;
                                arrayList2 = arrayList3;
                            }
                            i5 = 0;
                            cursorQuery.close();
                            fVar.f85762d = new td.l(cVar, bArr);
                        } catch (Throwable th2) {
                            cursorQuery.close();
                            throw th2;
                        }
                    }
                    if (!cursor.isNull(6)) {
                        fVar.f85761c = Integer.valueOf(cursor.getInt(6));
                    }
                    if (!cursor.isNull(8)) {
                        fVar.f85766h = Integer.valueOf(cursor.getInt(8));
                    }
                    if (!cursor.isNull(9)) {
                        fVar.f85767i = cursor.getString(9);
                    }
                    if (!cursor.isNull(10)) {
                        fVar.f85768j = cursor.getBlob(10);
                    }
                    if (!cursor.isNull(11)) {
                        fVar.f85769k = cursor.getBlob(11);
                    }
                    arrayList.add(new b(j11, iVar, fVar.c()));
                    i16 = i5;
                    i14 = 4;
                    i15 = 3;
                    i17 = 1;
                    i18 = 2;
                }
                return null;
            default:
                HashMap map = (HashMap) obj3;
                a2 a2Var = (a2) obj2;
                ArrayList arrayList4 = (ArrayList) a2Var.f73008b;
                Cursor cursor2 = (Cursor) obj;
                kVar.getClass();
                while (cursor2.moveToNext()) {
                    String string4 = cursor2.getString(0);
                    int i22 = cursor2.getInt(1);
                    wd.c cVar2 = wd.c.REASON_UNKNOWN;
                    if (i22 != 0) {
                        if (i22 == 1) {
                            cVar2 = wd.c.MESSAGE_TOO_OLD;
                        } else if (i22 == 2) {
                            cVar2 = wd.c.CACHE_FULL;
                        } else if (i22 == 3) {
                            cVar2 = wd.c.PAYLOAD_TOO_BIG;
                        } else if (i22 == 4) {
                            cVar2 = wd.c.MAX_RETRIES_REACHED;
                        } else if (i22 == i13) {
                            cVar2 = wd.c.INVALID_PAYLOD;
                        } else if (i22 == i12) {
                            cVar2 = wd.c.SERVER_ERROR;
                        }
                    }
                    long j12 = cursor2.getLong(2);
                    if (!map.containsKey(string4)) {
                        map.put(string4, new ArrayList());
                    }
                    ((List) map.get(string4)).add(new wd.d(j12, cVar2));
                    i12 = 6;
                    i13 = 5;
                }
                for (Map.Entry entry : map.entrySet()) {
                    int i23 = wd.e.f94202c;
                    new ArrayList();
                    arrayList4.add(new wd.e((String) entry.getKey(), Collections.unmodifiableList((List) entry.getValue())));
                }
                final long time = kVar.f17848b.getTime();
                SQLiteDatabase sQLiteDatabaseA = kVar.a();
                sQLiteDatabaseA.beginTransaction();
                try {
                    wd.g gVar = (wd.g) k.l(sQLiteDatabaseA.rawQuery("SELECT last_metrics_upload_ms FROM global_log_event_state LIMIT 1", new String[0]), new i() { // from class: be.h
                        @Override // be.i
                        public final Object apply(Object obj4) {
                            Cursor cursor3 = (Cursor) obj4;
                            cursor3.moveToNext();
                            return new wd.g(cursor3.getLong(0), time);
                        }
                    });
                    sQLiteDatabaseA.setTransactionSuccessful();
                    sQLiteDatabaseA.endTransaction();
                    a2Var.f73007a = gVar;
                    a2Var.f73009c = new wd.b(new wd.f(kVar.a().compileStatement("PRAGMA page_size").simpleQueryForLong() * kVar.a().compileStatement("PRAGMA page_count").simpleQueryForLong(), a.f17825f.f17826a));
                    a2Var.f73010d = (String) kVar.f17851e.get();
                    return new wd.a((wd.g) a2Var.f73007a, Collections.unmodifiableList(arrayList4), (wd.b) a2Var.f73009c, (String) a2Var.f73010d);
                } catch (Throwable th3) {
                    sQLiteDatabaseA.endTransaction();
                    throw th3;
                }
        }
    }

    public void b(h4 h4Var) {
        ConcurrentHashMap concurrentHashMap;
        o oVar = (o) this.f17837b;
        b3 b3Var = (b3) this.f17838c;
        io.sentry.x xVar = (io.sentry.x) this.f17839d;
        if (h4Var == null) {
            ((w3) oVar.f89493b).getLogger().g(g3.INFO, "Session is null on scope.withSession", new Object[0]);
            return;
        }
        oVar.getClass();
        String strC = null;
        g4 g4Var = b3Var.c() != null ? g4.Crashed : null;
        boolean z11 = g4.Crashed == g4Var || b3Var.d();
        io.sentry.protocol.o oVar2 = b3Var.f67685d;
        String str = (oVar2 == null || (concurrentHashMap = oVar2.f67590f) == null || !concurrentHashMap.containsKey("user-agent")) ? null : (String) b3Var.f67685d.f67590f.get("user-agent");
        Object objB = ex.i.B(xVar);
        if (objB instanceof io.sentry.hints.a) {
            strC = ((io.sentry.hints.a) objB).c();
            g4Var = g4.Abnormal;
        }
        if (!h4Var.c(g4Var, str, z11, strC) || h4Var.f67265g == g4.Ok) {
            return;
        }
        h4Var.b(android.support.v4.media.session.b.V());
    }

    @Override // ce.a
    public Object l() {
        zd.a aVar = (zd.a) this.f17837b;
        td.i iVar = (td.i) this.f17839d;
        td.h hVar = (td.h) this.f17838c;
        k kVar = (k) aVar.f98518d;
        kVar.getClass();
        ((Long) kVar.c(new g(kVar, hVar, iVar))).longValue();
        aVar.f98515a.t(iVar, 1, false);
        return null;
    }

    @Override // fi.e
    public void onComplete(Task task) {
        String str = (String) this.f17837b;
        com.google.android.play.core.review.b bVar = (com.google.android.play.core.review.b) this.f17838c;
        Activity activity = (Activity) this.f17839d;
        if (!task.q()) {
            mc0.d.f76206a.p(task.l(), "Review flow request failed", new Object[0]);
            return;
        }
        y2.f51877a.getClass();
        s2 s2Var = y2.f51975z2;
        KProperty kProperty = y2.f51881b[177];
        s2Var.getClass();
        s2Var.i(Long.valueOf(System.currentTimeMillis()));
        zy.c cVar = zy.c.f98823a;
        zy.c.i("review_flow_started", b70.k.e0(new Pair("trigger", str)));
        bVar.a(activity, (ReviewInfo) task.m()).b(new ge.d(29));
    }

    @Override // s90.x
    public Object run() throws Exception {
        switch (this.f17836a) {
            case 7:
                p pVar = (p) this.f17837b;
                UrlResponseInfo urlResponseInfo = (UrlResponseInfo) this.f17838c;
                ByteBuffer byteBuffer = (ByteBuffer) this.f17839d;
                pVar.getClass();
                pVar.f86994a.onReadCompleted(pVar.f86995b, s.b(urlResponseInfo), byteBuffer);
                break;
            default:
                p pVar2 = (p) this.f17837b;
                UrlResponseInfo urlResponseInfo2 = (UrlResponseInfo) this.f17838c;
                String str = (String) this.f17839d;
                pVar2.getClass();
                pVar2.f86994a.onRedirectReceived(pVar2.f86995b, s.b(urlResponseInfo2), str);
                break;
        }
        return null;
    }

    @Override // fi.c
    public Object then(Task task) {
        xm.e eVar;
        URL url;
        switch (this.f17836a) {
            case 2:
                return CrashlyticsTasks.lambda$race$0((fi.j) this.f17837b, (AtomicBoolean) this.f17838c, (fi.b) this.f17839d, task);
            case 12:
                wm.c cVar = (wm.c) this.f17837b;
                Task task2 = (Task) this.f17838c;
                Task task3 = (Task) this.f17839d;
                if (!task2.q() || task2.m() == null) {
                    return Tasks.d(Boolean.FALSE);
                }
                xm.e eVar2 = (xm.e) task2.m();
                return (task3.q() && (eVar = (xm.e) task3.m()) != null && eVar2.f96111c.equals(eVar.f96111c)) ? Tasks.d(Boolean.FALSE) : cVar.f94602e.d(eVar2).i(cVar.f94600c, new wm.b(cVar, 0));
            default:
                xm.l lVar = (xm.l) this.f17837b;
                Task task4 = (Task) this.f17838c;
                Task task5 = (Task) this.f17839d;
                if (!task4.q()) {
                    return Tasks.c(new FirebaseRemoteConfigClientException("Firebase Installations failed to get installation auth token for config update listener connection.", task4.l()));
                }
                if (!task5.q()) {
                    return Tasks.c(new FirebaseRemoteConfigClientException("Firebase Installations failed to get installation ID for config update listener connection.", task5.l()));
                }
                try {
                    try {
                        url = new URL(lVar.c(lVar.f96158m));
                    } catch (MalformedURLException unused) {
                        Log.e("FirebaseRemoteConfig", "URL is malformed");
                        url = null;
                    }
                    HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                    lVar.i(httpURLConnection, (String) task5.m(), ((om.b) task4.m()).f80504a);
                    return Tasks.d(httpURLConnection);
                } catch (IOException e3) {
                    return Tasks.c(new FirebaseRemoteConfigClientException("Failed to open HTTP stream connection", e3));
                }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0080  */
    @Override // a5.a0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public h2 u(View view, h2 h2Var) {
        LinearLayout linearLayout = (LinearLayout) this.f17837b;
        NovaAiChatActivity novaAiChatActivity = (NovaAiChatActivity) this.f17838c;
        LinearLayout linearLayout2 = (LinearLayout) this.f17839d;
        int i5 = NovaAiChatActivity.C;
        Insets insetsG = h2Var.f296a.g(7);
        linearLayout.setPadding(linearLayout.getPaddingLeft(), insetsG.top, linearLayout.getPaddingRight(), linearLayout.getPaddingBottom());
        int iG0 = novaAiChatActivity.g0(72) + insetsG.bottom;
        ViewGroup.LayoutParams layoutParams = linearLayout.getLayoutParams();
        ViewGroup.MarginLayoutParams marginLayoutParams = layoutParams instanceof ViewGroup.MarginLayoutParams ? (ViewGroup.MarginLayoutParams) layoutParams : null;
        if (marginLayoutParams != null && marginLayoutParams.bottomMargin != iG0) {
            marginLayoutParams.bottomMargin = iG0;
            linearLayout.requestLayout();
        }
        linearLayout2.setPadding(linearLayout2.getPaddingLeft(), linearLayout2.getPaddingTop(), linearLayout2.getPaddingRight(), novaAiChatActivity.g0(14) + insetsG.bottom);
        ViewGroup.LayoutParams layoutParams2 = linearLayout2.getLayoutParams();
        ViewGroup.LayoutParams layoutParams3 = layoutParams2 != null ? layoutParams2 : null;
        if (layoutParams3 != null && layoutParams3.height != iG0) {
            layoutParams3.height = iG0;
            linearLayout2.requestLayout();
        }
        BottomSheetBehavior bottomSheetBehavior = novaAiChatActivity.A;
        if (bottomSheetBehavior != null) {
            if ((bottomSheetBehavior.f34092f ? -1 : bottomSheetBehavior.f34090e) != iG0) {
            }
        } else if (bottomSheetBehavior != null) {
            bottomSheetBehavior.I(iG0);
        }
        return h2Var;
    }

    public /* synthetic */ f(zd.a aVar, td.i iVar, td.h hVar) {
        this.f17836a = 14;
        this.f17837b = aVar;
        this.f17839d = iVar;
        this.f17838c = hVar;
    }

    @Override // s90.b1
    /* renamed from: run, reason: collision with other method in class */
    public void mo109run() throws Exception {
        switch (this.f17836a) {
            case 9:
                x0 x0Var = (x0) this.f17837b;
                org.chromium.net.UrlResponseInfo urlResponseInfo = (org.chromium.net.UrlResponseInfo) this.f17838c;
                ByteBuffer byteBuffer = (ByteBuffer) this.f17839d;
                a1 a1Var = x0Var.f87058d;
                if (a1Var.f86858f.compareAndSet(5, 4)) {
                    x0Var.f87055a.onReadCompleted(a1Var, urlResponseInfo, byteBuffer);
                    break;
                }
                break;
            default:
                x0 x0Var2 = (x0) this.f17837b;
                x0Var2.f87055a.onRedirectReceived(x0Var2.f87058d, (g1) this.f17838c, (String) this.f17839d);
                break;
        }
    }
}
