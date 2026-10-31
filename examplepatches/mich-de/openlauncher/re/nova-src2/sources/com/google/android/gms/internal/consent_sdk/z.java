package com.google.android.gms.internal.consent_sdk;

import ads_mobile_sdk.b71;
import ads_mobile_sdk.hb1;
import ads_mobile_sdk.mq2;
import ads_mobile_sdk.rg0;
import ads_mobile_sdk.wo2;
import android.util.Log;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigServerException;
import com.stripe.android.stripe3ds2.init.Warning;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class z implements b.n1 {

    /* renamed from: a, reason: collision with root package name */
    public Object f32326a;

    /* renamed from: b, reason: collision with root package name */
    public Object f32327b;

    /* renamed from: c, reason: collision with root package name */
    public Object f32328c;

    /* renamed from: d, reason: collision with root package name */
    public Object f32329d;

    /* renamed from: e, reason: collision with root package name */
    public Object f32330e;

    /* renamed from: f, reason: collision with root package name */
    public Object f32331f;

    /* renamed from: g, reason: collision with root package name */
    public Object f32332g;

    /* renamed from: h, reason: collision with root package name */
    public Object f32333h;

    /* renamed from: i, reason: collision with root package name */
    public Object f32334i;

    public z(b.m5 m5Var, hb1 hb1Var, b.m5 m5Var2, b.m5 m5Var3, rg0 rg0Var, b.m5 m5Var4, rg0 rg0Var2, b.m5 m5Var5, b.m5 m5Var6) {
        this.f32326a = m5Var;
        this.f32327b = hb1Var;
        this.f32328c = m5Var2;
        this.f32329d = m5Var3;
        this.f32330e = rg0Var;
        this.f32331f = m5Var4;
        this.f32332g = rg0Var2;
        this.f32333h = m5Var5;
        this.f32334i = m5Var6;
    }

    @Override // b.a7
    public wo2 a() {
        return (mq2) ((b.m5) this.f32334i).get();
    }

    public void b(int i5, long j11) {
        if (i5 == 0) {
            new FirebaseRemoteConfigServerException("Unable to fetch the latest version of the template.");
            f();
        } else {
            ((ScheduledExecutorService) this.f32331f).schedule(new xm.b(this, i5, j11), ((Random) this.f32332g).nextInt(4), TimeUnit.SECONDS);
        }
    }

    public sd.w c() {
        String strE = ((Long) this.f32327b) == null ? " eventTimeMs" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (((Long) this.f32330e) == null) {
            strE = strE.concat(" eventUptimeMs");
        }
        if (((Long) this.f32332g) == null) {
            strE = b.c0.E(strE, " timezoneOffsetSeconds");
        }
        if (strE.isEmpty()) {
            return new sd.w(((Long) this.f32327b).longValue(), (Integer) this.f32328c, (sd.q) this.f32329d, ((Long) this.f32330e).longValue(), (byte[]) this.f32331f, (String) this.f32326a, ((Long) this.f32332g).longValue(), (sd.z) this.f32333h, (sd.s) this.f32334i);
        }
        throw new IllegalStateException("Missing required properties:".concat(strE));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object d(SdkTransactionId sdkTransactionId, ContinuationImpl continuationImpl) throws JSONException {
        wv.d dVar;
        JSONObject jSONObjectPut;
        z zVar;
        String str;
        if (continuationImpl instanceof wv.d) {
            dVar = (wv.d) continuationImpl;
            int i5 = dVar.f94709y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f94709y = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new wv.d(this, continuationImpl);
            }
        }
        Object objA = dVar.f94707w;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = dVar.f94709y;
        if (i11 == 0) {
            ResultKt.b(objA);
            jSONObjectPut = new JSONObject().put("DV", "1.6");
            rv.d dVar2 = (rv.d) this.f32327b;
            String str2 = (String) this.f32326a;
            dVar.f94704t = this;
            dVar.f94705u = jSONObjectPut;
            dVar.f94706v = "DD";
            dVar.f94709y = 1;
            objA = dVar2.a(str2, sdkTransactionId, dVar);
            if (objA == obj) {
                return obj;
            }
            zVar = this;
            str = "DD";
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = dVar.f94706v;
            jSONObjectPut = dVar.f94705u;
            zVar = dVar.f94704t;
            ResultKt.b(objA);
        }
        JSONObject jSONObjectPut2 = jSONObjectPut.put(str, new JSONObject((Map) objA));
        bh.k kVar = (bh.k) zVar.f32328c;
        kVar.getClass();
        HashMap map = new HashMap();
        List listQ = ul.b.Q(rv.e.f86412b, rv.e.f86413c, rv.e.f86414d, rv.e.f86415e, rv.e.f86416f, rv.e.f86417g, rv.e.f86418h, rv.e.f86419i, rv.e.f86420j, rv.e.f86421k, rv.e.f86422l, rv.e.f86423m, rv.e.n, rv.e.o, rv.e.f86431w, rv.e.f86432x, rv.e.f86433y, rv.e.f86434z, rv.e.A, rv.e.f86424p, rv.e.f86425q, rv.e.f86426r, rv.e.f86427s, rv.e.f86428t, rv.e.f86429u, rv.e.f86430v);
        Iterator it = rv.e.C.iterator();
        while (it.hasNext()) {
            rv.e eVar = (rv.e) it.next();
            if (!listQ.contains(eVar)) {
                String str3 = eVar.f86435a;
                rv.f[] fVarArr = rv.f.f86436b;
                map.put(str3, "RE01");
            }
        }
        HashMap map2 = new HashMap();
        int i12 = kVar.f17909a;
        if (i12 < 26) {
            rv.e eVar2 = rv.e.f86412b;
            rv.f[] fVarArr2 = rv.f.f86436b;
            map2.put("A003", "RE02");
            map2.put("A053", "RE02");
            map2.put("A076", "RE02");
        }
        if (i12 < 23) {
            rv.e eVar3 = rv.e.f86412b;
            rv.f[] fVarArr3 = rv.f.f86436b;
            map2.put("A012", "RE02");
            map2.put("A022", "RE02");
            map2.put("A025", "RE02");
            map2.put("A027", "RE02");
            map2.put("A062", "RE02");
            map2.put("A063", "RE02");
            map2.put("A064", "RE02");
            map2.put("A103", "RE02");
            map2.put("A123", "RE02");
        }
        if (i12 > 23) {
            rv.e eVar4 = rv.e.f86412b;
            rv.f[] fVarArr4 = rv.f.f86436b;
            map2.put("A079", "RE02");
        }
        if (i12 < 22) {
            rv.e eVar5 = rv.e.f86412b;
            rv.f[] fVarArr5 = rv.f.f86436b;
            map2.put("A026", "RE02");
        }
        if (i12 < 28) {
            rv.e eVar6 = rv.e.f86412b;
            rv.f[] fVarArr6 = rv.f.f86436b;
            map2.put("A138", "RE02");
            map2.put("A139", "RE02");
            map2.put("A150", "RE02");
        }
        if (i12 < 29) {
            rv.e eVar7 = rv.e.f86412b;
            rv.f[] fVarArr7 = rv.f.f86436b;
            map2.put("A141", "RE02");
            map2.put("A142", "RE02");
            map2.put("A143", "RE02");
            map2.put("A152", "RE02");
        }
        if (i12 < 30) {
            rv.e eVar8 = rv.e.f86412b;
            rv.f[] fVarArr8 = rv.f.f86436b;
            map2.put("A145", "RE02");
            map2.put("A149", "RE02");
            map2.put("A151", "RE02");
        }
        if (i12 < 31) {
            rv.e eVar9 = rv.e.f86412b;
            rv.f[] fVarArr9 = rv.f.f86436b;
            map2.put("A153", "RE02");
            map2.put("A154", "RE02");
            map2.put("A155", "RE02");
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(map, map2);
        HashMap map3 = new HashMap();
        rv.e eVar10 = rv.e.f86412b;
        rv.f[] fVarArr10 = rv.f.f86436b;
        map3.put("A028", "RE03");
        map3.put("A029", "RE03");
        map3.put("A030", "RE03");
        map3.put("A031", "RE03");
        map3.put("A032", "RE03");
        map3.put("A033", "RE03");
        map3.put("A034", "RE03");
        map3.put("A035", "RE03");
        map3.put("A036", "RE03");
        map3.put("A037", "RE03");
        map3.put("A038", "RE03");
        map3.put("C011", "RE03");
        map3.put("C012", "RE03");
        map3.put("C009", "RE03");
        map3.put("A039", "RE03");
        map3.put("A040", "RE03");
        map3.put("A041", "RE03");
        map3.put("A001", "RE03");
        map3.put("A002", "RE03");
        map3.put("A003", "RE03");
        map3.put("A004", "RE03");
        map3.put("A017", "RE03");
        map3.put("A019", "RE03");
        map3.put("A020", "RE03");
        map3.put("A025", "RE03");
        map3.put("A027", "RE03");
        map3.put("A053", "RE03");
        map3.put("A076", "RE03");
        map3.put("A143", "RE03");
        map3.put("A146", "RE03");
        map3.put("A147", "RE03");
        map3.put("A148", "RE03");
        map3.put("A149", "RE03");
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, map3);
        HashMap map4 = new HashMap();
        map4.put("A140", "RE04");
        JSONObject jSONObjectPut3 = jSONObjectPut2.put("DPNA", new JSONObject(MapsKt.m0(linkedHashMapM02, map4)));
        ArrayList arrayListA = ((rv.b) zVar.f32329d).a();
        ArrayList arrayList = new ArrayList(b70.c.u0(arrayListA, 10));
        Iterator it2 = arrayListA.iterator();
        while (it2.hasNext()) {
            arrayList.add(((Warning) it2.next()).f45029a);
        }
        JSONObject jSONObjectPut4 = jSONObjectPut3.put("SW", new JSONArray((Collection) arrayList));
        Intrinsics.f(jSONObjectPut4, "put(...)");
        return jSONObjectPut4;
    }

    public void e(InputStream inputStream) throws JSONException, IOException {
        JSONObject jSONObject;
        boolean zIsEmpty;
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
        String strE = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        while (true) {
            String line = bufferedReader.readLine();
            if (line == null) {
                break;
            }
            strE = b.c0.E(strE, line);
            if (line.contains("}")) {
                int iIndexOf = strE.indexOf(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
                int iLastIndexOf = strE.lastIndexOf(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
                strE = (iIndexOf < 0 || iLastIndexOf < 0 || iIndexOf >= iLastIndexOf) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strE.substring(iIndexOf, iLastIndexOf + 1);
                if (!strE.isEmpty()) {
                    try {
                        jSONObject = new JSONObject(strE);
                    } catch (JSONException e3) {
                        new FirebaseRemoteConfigClientException("Unable to parse config update message.", e3.getCause());
                        f();
                        Log.e("FirebaseRemoteConfig", "Unable to parse latest config update message.", e3);
                    }
                    if (jSONObject.has("featureDisabled") && jSONObject.getBoolean("featureDisabled")) {
                        xm.k kVar = (xm.k) this.f32330e;
                        new FirebaseRemoteConfigServerException("The server is temporarily unavailable. Try again in a few minutes.");
                        kVar.a();
                        break;
                    }
                    synchronized (this) {
                        zIsEmpty = ((LinkedHashSet) this.f32326a).isEmpty();
                    }
                    if (zIsEmpty) {
                        break;
                    }
                    if (jSONObject.has("latestTemplateVersionNumber")) {
                        long jF = ((xm.i) this.f32328c).f96135g.f();
                        long j11 = jSONObject.getLong("latestTemplateVersionNumber");
                        if (j11 > jF) {
                            b(3, j11);
                        }
                    }
                    if (jSONObject.has("retryIntervalSeconds")) {
                        p(jSONObject.getInt("retryIntervalSeconds"));
                    }
                    strE = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                } else {
                    continue;
                }
            }
        }
        bufferedReader.close();
    }

    public synchronized void f() {
        Iterator it = ((LinkedHashSet) this.f32326a).iterator();
        while (it.hasNext()) {
            ((xm.k) it.next()).a();
        }
    }

    public void g(sd.q qVar) {
        this.f32329d = qVar;
    }

    public void h(Integer num) {
        this.f32328c = num;
    }

    public void i(long j11) {
        this.f32327b = Long.valueOf(j11);
    }

    public void j(long j11) {
        this.f32330e = Long.valueOf(j11);
    }

    public void k(sd.s sVar) {
        this.f32334i = sVar;
    }

    public void l(sd.z zVar) {
        this.f32333h = zVar;
    }

    public void m(byte[] bArr) {
        this.f32331f = bArr;
    }

    public void n(String str) {
        this.f32326a = str;
    }

    public void o(long j11) {
        this.f32332g = Long.valueOf(j11);
    }

    public synchronized void p(int i5) {
        ((xg.a) this.f32333h).getClass();
        Date date = new Date(new Date(System.currentTimeMillis()).getTime() + (i5 * 1000));
        xm.n nVar = (xm.n) this.f32334i;
        synchronized (nVar.f96169d) {
            nVar.f96166a.edit().putLong("realtime_backoff_end_time_in_millis", date.getTime()).apply();
        }
    }

    @Override // b.a7
    public b71 b() {
        return (b71) ((b.m5) this.f32333h).get();
    }

    public z() {
    }

    public z(HttpURLConnection httpURLConnection, xm.i iVar, xm.c cVar, LinkedHashSet linkedHashSet, xm.k kVar, ScheduledExecutorService scheduledExecutorService, xm.n nVar) {
        this.f32327b = httpURLConnection;
        this.f32328c = iVar;
        this.f32329d = cVar;
        this.f32326a = linkedHashSet;
        this.f32330e = kVar;
        this.f32331f = scheduledExecutorService;
        this.f32332g = new Random();
        this.f32334i = nVar;
        this.f32333h = xg.a.f95830a;
    }
}
