package sp;

import android.app.Application;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import b.u4;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.InvalidPropertiesFormatException;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public abstract class l extends o0 implements b {

    /* renamed from: a, reason: collision with root package name */
    public boolean f87606a = false;

    static {
        new b50.d(l.class.getSimpleName());
    }

    public l(String str, long j11) {
        put("__TYPE__", str);
        put("__TIMESTAMP__", String.valueOf(j11));
    }

    public static l d(String str) throws IOException {
        if (str == null) {
            m0.a("fe9");
            throw new NullPointerException("api string cannot be null");
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            HashMap map = new HashMap();
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                map.put(next, (String) jSONObject.get(next));
            }
            String str2 = (String) map.get("__TYPE__");
            String str3 = (String) map.get("__TIMESTAMP__");
            long j11 = !r0.l(str3) ? Long.parseLong(str3) : -1L;
            Application application = m0.f87615q.f87616a;
            int i5 = application.getSharedPreferences("pref_retry_count", 0).getInt("rc-" + str3, 0);
            int i11 = i5 + 1;
            try {
                SharedPreferences.Editor editorEdit = application.getSharedPreferences("pref_retry_count", 0).edit();
                editorEdit.putInt("rc-" + str3, i11);
                editorEdit.commit();
            } catch (Throwable th2) {
                int i12 = r0.f87655b;
                r0.c(th2);
            }
            if (i5 > 0) {
                map.put("rc", String.valueOf(i5));
            }
            if ("CONFIG".equalsIgnoreCase(str2)) {
                d dVar = new d(j11);
                dVar.putAll(map);
                return dVar;
            }
            if ("EVENT".equalsIgnoreCase(str2)) {
                k kVar = new k(j11);
                kVar.putAll(map);
                return kVar;
            }
            if ("SESSION_START".equalsIgnoreCase(str2)) {
                j jVar = new j(j11);
                jVar.putAll(map);
                return jVar;
            }
            if ("GDPR_CONSENT".equalsIgnoreCase(str2)) {
                f fVar = new f(j11);
                fVar.putAll(map);
                return fVar;
            }
            if ("GDPR_UNDER_13".equalsIgnoreCase(str2)) {
                g gVar = new g("GDPR_UNDER_13", j11);
                gVar.putAll(map);
                return gVar;
            }
            if (!"CUSTOM_USER_ID".equalsIgnoreCase(str2)) {
                m0.a("fe10");
                throw new InvalidPropertiesFormatException(b.c0.k("Unknown type = ", str2));
            }
            e eVar = new e("CUSTOM_USER_ID", j11);
            eVar.putAll(map);
            return eVar;
        } catch (JSONException e3) {
            m0.a("fe13");
            throw new IOException(e3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final long e() {
        String str = (String) get("__TIMESTAMP__");
        if (r0.l(str)) {
            return -1L;
        }
        return Long.parseLong(str);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean f() {
        try {
            String str = (String) get("e");
            if (str != null) {
                return new JSONObject(str).getBoolean("is_admon_revenue");
            }
            return false;
        } catch (Throwable th2) {
            th2.getMessage();
            return false;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0245  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0251 A[Catch: all -> 0x0259, TRY_LEAVE, TryCatch #5 {all -> 0x0259, blocks: (B:116:0x024b, B:118:0x0251), top: B:183:0x024b }] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x025b  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0263  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x027a  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0285  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x02a6  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x02df  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x02e5  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0310  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x0318  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x0351 A[Catch: IOException | JSONException -> 0x037c, TryCatch #1 {IOException | JSONException -> 0x037c, blocks: (B:157:0x0346, B:159:0x0351, B:160:0x0368), top: B:176:0x0346 }] */
    /* JADX WARN: Removed duplicated region for block: B:190:0x0213 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:200:0x02d3 A[EDGE_INSN: B:200:0x02d3->B:144:0x02d3 BREAK  A[LOOP:2: B:135:0x029c->B:143:0x02cd], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01c8  */
    /* JADX WARN: Type inference failed for: r0v65, types: [boolean, int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean g(m0 m0Var) throws JSONException, IOException {
        String str;
        long jO;
        int i5;
        HashMap map;
        int i11;
        a aVar;
        StringBuilder sb2;
        TreeMap treeMap;
        ConnectivityManager connectivityManager;
        NetworkCapabilities networkCapabilities;
        ConnectivityManager connectivityManagerA;
        boolean zB;
        boolean z11;
        Iterator it;
        boolean zHasNext;
        String strM;
        String string;
        HttpURLConnection httpURLConnection;
        NetworkInfo activeNetworkInfo;
        a aVar2;
        String string2;
        boolean z12;
        try {
            if (s.c().b(p.b(), m0Var.f87616a) != null) {
                HashMap map2 = new HashMap(this);
                map2.remove("__TYPE__");
                map2.remove("__TIMESTAMP__");
                if (((String) map2.get("k")).equalsIgnoreCase("sdid")) {
                    put("mg", "1");
                } else if (this.f87606a || s.c().a(m0Var.f87616a)) {
                    p0 p0Var = new p0();
                    p0Var.e(m0Var, this.f87606a);
                    putAll(p0Var);
                    put("mg", "2");
                } else {
                    put("mg", "3");
                }
            } else {
                put("mg", "0");
            }
        } catch (Throwable unused) {
            put("mg", "5");
        }
        try {
            HashMap map3 = new HashMap(this);
            map3.remove("__TYPE__");
            map3.remove("__TIMESTAMP__");
            if (!map3.containsKey("k")) {
                p0 p0Var2 = new p0();
                p0Var2.e(m0Var, this.f87606a);
                putAll(p0Var2);
                put("msk", "0");
            }
        } catch (Throwable th2) {
            r0.c(th2);
            put("msk", "1");
        }
        rp.c cVar = m0Var.f87619d;
        Application application = m0Var.f87616a;
        if (cVar != null && cVar.f86141j.booleanValue() && containsKey("k")) {
            String str2 = (String) get("k");
            if (!r0.l(str2)) {
                if (q.f87647b.contains(str2)) {
                    remove("k");
                    remove("u");
                    z12 = true;
                } else {
                    z12 = false;
                }
                Iterator it2 = q.f87646a.iterator();
                boolean z13 = false;
                while (it2.hasNext()) {
                    String str3 = (String) it2.next();
                    if (containsKey(str3)) {
                        remove(str3);
                        z13 = true;
                    }
                }
                if (z12 || z13) {
                    p0 p0Var3 = new p0();
                    p0Var3.e(m0Var, this.f87606a);
                    putAll(p0Var3);
                }
                ?? BooleanValue = cVar.f86141j.booleanValue();
                int i12 = BooleanValue;
                if (z12) {
                    i12 = BooleanValue + 2;
                }
                if (z13) {
                    i12 += 4;
                }
                put("lim", String.valueOf(i12));
            }
        }
        h0 h0Var = p.b().f87645a;
        if (h0Var != null ? h0Var.f87587c : h0.a().f87587c) {
            u uVar = m0Var.o;
            if (uVar != null) {
                ConcurrentHashMap concurrentHashMap = uVar.f87688a;
                HashMap map4 = new HashMap();
                try {
                    if (!concurrentHashMap.isEmpty()) {
                        for (String str4 : concurrentHashMap.keySet()) {
                            if (concurrentHashMap.containsKey(str4)) {
                                str = null;
                                try {
                                    String string3 = ((Integer) concurrentHashMap.get(str4)).toString();
                                    if (!r0.l(string3)) {
                                        map4.put(str4, string3);
                                    }
                                } catch (Throwable unused2) {
                                    int i13 = u.f87687b;
                                    string2 = new JSONObject(map4).toString();
                                    put("errors", string2);
                                    String strConcat = "https://sdk-api-v1.singular.net/api/v1".concat(getPath());
                                    HashMap map5 = new HashMap(this);
                                    map5.remove("__TYPE__");
                                    map5.remove("__TIMESTAMP__");
                                    long jE = e();
                                    a aVarA = a();
                                    int i14 = q0.f87648a;
                                    jO = r0.f87657d.o();
                                    i5 = q0.f87648a + 1;
                                    q0.f87648a = i5;
                                    int i15 = q0.f87648a;
                                    map = new HashMap();
                                    String[] strArr = q0.f87649b;
                                    i11 = 0;
                                    while (i11 < 3) {
                                    }
                                    aVar = aVarA;
                                    sb2 = new StringBuilder();
                                    treeMap = new TreeMap(map5);
                                    treeMap.put("rt", "json");
                                    treeMap.put("lag", String.valueOf(r0.p(jE)));
                                    ConnectivityManager.NetworkCallback networkCallback = c0.f87571a;
                                    connectivityManager = (ConnectivityManager) application.getSystemService("connectivity");
                                    String str5 = "unknown";
                                    if (connectivityManager != null) {
                                    }
                                    treeMap.put("c", str5);
                                    connectivityManagerA = c0.a(application);
                                    if (connectivityManagerA == null) {
                                    }
                                    zB = c0.b(connectivityManagerA);
                                    activeNetworkInfo = connectivityManagerA.getActiveNetworkInfo();
                                    if (activeNetworkInfo == null) {
                                    }
                                    if (zB != z11) {
                                    }
                                    if (treeMap.containsKey("u")) {
                                        m0Var.f87621f.getClass();
                                        if (!r0.l(str)) {
                                        }
                                    }
                                    it = treeMap.entrySet().iterator();
                                    while (true) {
                                        zHasNext = it.hasNext();
                                        strM = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                        if (zHasNext) {
                                        }
                                        b.c0.C(sb2, strEncode, "=", strM);
                                    }
                                    string = sb2.toString();
                                    String str6 = m0Var.f87619d.f86133b;
                                    if (string != null) {
                                    }
                                    URL url = new URL(u4.m(strConcat, "?", strM));
                                    httpURLConnection = !url.getProtocol().equalsIgnoreCase("https") ? (HttpsURLConnection) url.openConnection() : (HttpURLConnection) url.openConnection();
                                    httpURLConnection.setConnectTimeout(10000);
                                    httpURLConnection.setReadTimeout(10000);
                                    httpURLConnection.setRequestMethod("POST");
                                    httpURLConnection.setDoInput(true);
                                    httpURLConnection.setUseCaches(false);
                                    httpURLConnection.setRequestProperty("User-Agent", r.f87651b);
                                    httpURLConnection.setRequestProperty("Content-Type", "application/json");
                                    String str7 = m0Var.f87619d.f86133b;
                                    JSONObject jSONObject = new JSONObject();
                                    if (map.size() > 0) {
                                    }
                                    OutputStreamWriter outputStreamWriter = new OutputStreamWriter(httpURLConnection.getOutputStream(), "UTF-8");
                                    outputStreamWriter.write(jSONObject.toString());
                                    outputStreamWriter.close();
                                    httpURLConnection.getRequestMethod();
                                    try {
                                        return q0.a(m0Var, aVar, jO, i5, httpURLConnection);
                                    } finally {
                                        httpURLConnection.disconnect();
                                    }
                                }
                            }
                        }
                    }
                    str = null;
                } catch (Throwable unused3) {
                    str = null;
                }
                string2 = new JSONObject(map4).toString();
            } else {
                str = null;
                string2 = null;
            }
            put("errors", string2);
        } else {
            str = null;
        }
        String strConcat2 = "https://sdk-api-v1.singular.net/api/v1".concat(getPath());
        HashMap map52 = new HashMap(this);
        map52.remove("__TYPE__");
        map52.remove("__TIMESTAMP__");
        long jE2 = e();
        a aVarA2 = a();
        int i142 = q0.f87648a;
        jO = r0.f87657d.o();
        i5 = q0.f87648a + 1;
        q0.f87648a = i5;
        int i152 = q0.f87648a;
        map = new HashMap();
        String[] strArr2 = q0.f87649b;
        i11 = 0;
        while (i11 < 3) {
            String str8 = strArr2[i11];
            if (map52.containsKey(str8)) {
                aVar2 = aVarA2;
                map.put(str8, map52.get(str8));
                map52.remove(str8);
            } else {
                aVar2 = aVarA2;
            }
            i11++;
            aVarA2 = aVar2;
        }
        aVar = aVarA2;
        sb2 = new StringBuilder();
        treeMap = new TreeMap(map52);
        treeMap.put("rt", "json");
        treeMap.put("lag", String.valueOf(r0.p(jE2)));
        ConnectivityManager.NetworkCallback networkCallback2 = c0.f87571a;
        connectivityManager = (ConnectivityManager) application.getSystemService("connectivity");
        String str52 = "unknown";
        if (connectivityManager != null) {
            try {
                Network activeNetwork = connectivityManager.getActiveNetwork();
                if (activeNetwork != null && (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) != null) {
                    if (networkCapabilities.hasTransport(1)) {
                        str52 = "wifi";
                    } else if (networkCapabilities.hasTransport(0)) {
                        str52 = "wwan";
                    }
                }
            } catch (Throwable th3) {
                r0.c(th3);
            }
        }
        treeMap.put("c", str52);
        connectivityManagerA = c0.a(application);
        if (connectivityManagerA == null) {
            ConnectivityManager.NetworkCallback networkCallback3 = c0.f87571a;
        }
        zB = c0.b(connectivityManagerA);
        try {
            activeNetworkInfo = connectivityManagerA.getActiveNetworkInfo();
        } catch (Throwable th4) {
            r0.c(th4);
        }
        if (activeNetworkInfo == null) {
            z11 = activeNetworkInfo.isConnected();
        }
        if (zB != z11) {
            treeMap.put("nc", "1");
        }
        if (treeMap.containsKey("u") || r0.l((String) treeMap.get("u"))) {
            m0Var.f87621f.getClass();
            if (!r0.l(str)) {
                m0Var.f87621f.getClass();
                treeMap.put("u", str);
                treeMap.put("k", "OAID");
            }
        }
        it = treeMap.entrySet().iterator();
        while (true) {
            zHasNext = it.hasNext();
            strM = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (zHasNext) {
                break;
            }
            Map.Entry entry = (Map.Entry) it.next();
            String strEncode = URLEncoder.encode((String) entry.getKey(), "UTF-8");
            String str9 = (String) entry.getValue();
            if (str9 != null) {
                strM = URLEncoder.encode(str9, "UTF-8");
            }
            if (sb2.length() > 0) {
                sb2.append("&");
            }
            b.c0.C(sb2, strEncode, "=", strM);
        }
        string = sb2.toString();
        String str62 = m0Var.f87619d.f86133b;
        if (string != null) {
            m0.a("e14");
        } else {
            String strQ = r0.q("?".concat(string), str62);
            strM = r0.l(strQ) ? string : u4.m(string, "&h=", strQ);
        }
        URL url2 = new URL(u4.m(strConcat2, "?", strM));
        httpURLConnection = !url2.getProtocol().equalsIgnoreCase("https") ? (HttpsURLConnection) url2.openConnection() : (HttpURLConnection) url2.openConnection();
        httpURLConnection.setConnectTimeout(10000);
        httpURLConnection.setReadTimeout(10000);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoInput(true);
        httpURLConnection.setUseCaches(false);
        httpURLConnection.setRequestProperty("User-Agent", r.f87651b);
        httpURLConnection.setRequestProperty("Content-Type", "application/json");
        String str72 = m0Var.f87619d.f86133b;
        try {
            JSONObject jSONObject2 = new JSONObject();
            if (map.size() > 0) {
                String string4 = new JSONObject(map).toString();
                String strQ2 = r0.q(string4, str72);
                jSONObject2.put("payload", string4);
                jSONObject2.put("signature", strQ2);
            }
            OutputStreamWriter outputStreamWriter2 = new OutputStreamWriter(httpURLConnection.getOutputStream(), "UTF-8");
            outputStreamWriter2.write(jSONObject2.toString());
            outputStreamWriter2.close();
        } catch (IOException | JSONException unused4) {
            m0.a("e118");
        }
        httpURLConnection.getRequestMethod();
        try {
            return q0.a(m0Var, aVar, jO, i5, httpURLConnection);
        } catch (IOException e3) {
            m0.a("e20");
            throw e3;
        }
    }

    public final String h() {
        return new JSONObject(this).toString();
    }
}
