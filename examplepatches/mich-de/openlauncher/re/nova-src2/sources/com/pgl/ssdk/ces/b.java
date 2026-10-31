package com.pgl.ssdk.ces;

import android.content.Context;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.pgl.ssdk.a4;
import com.pgl.ssdk.aa;
import com.pgl.ssdk.ab;
import com.pgl.ssdk.ac;
import com.pgl.ssdk.ad;
import com.pgl.ssdk.ae;
import com.pgl.ssdk.af;
import com.pgl.ssdk.ag;
import com.pgl.ssdk.ah;
import com.pgl.ssdk.ai;
import com.pgl.ssdk.aj;
import com.pgl.ssdk.ak;
import com.pgl.ssdk.al;
import com.pgl.ssdk.am;
import com.pgl.ssdk.an;
import com.pgl.ssdk.ao;
import com.pgl.ssdk.ar;
import com.pgl.ssdk.av;
import com.pgl.ssdk.aw;
import com.pgl.ssdk.ax;
import com.pgl.ssdk.ay;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.pgl.ssdk.ces.out.PglSSManager;
import com.pgl.ssdk.f;
import com.pgl.ssdk.u;
import com.pgl.ssdk.v;
import com.pgl.ssdk.w;
import com.pgl.ssdk.x;
import com.pgl.ssdk.y;
import com.pgl.ssdk.z;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class b {

    /* renamed from: a, reason: collision with root package name */
    private static volatile b f42326a = null;

    /* renamed from: b, reason: collision with root package name */
    private static boolean f42327b = false;

    /* renamed from: c, reason: collision with root package name */
    private static Map<String, Object> f42328c = null;

    /* renamed from: d, reason: collision with root package name */
    private static int f42329d = 1;

    /* renamed from: e, reason: collision with root package name */
    private static av.a f42330e;

    /* renamed from: f, reason: collision with root package name */
    public Context f42331f;

    /* renamed from: g, reason: collision with root package name */
    private String f42332g;

    /* renamed from: h, reason: collision with root package name */
    private int f42333h;

    /* renamed from: i, reason: collision with root package name */
    private String f42334i;

    /* renamed from: j, reason: collision with root package name */
    private String f42335j = null;

    /* renamed from: k, reason: collision with root package name */
    private String f42336k = null;

    /* renamed from: l, reason: collision with root package name */
    public int f42337l = 1;

    /* renamed from: m, reason: collision with root package name */
    public int f42338m = 0;
    public boolean n = true;

    public class a implements Runnable {
        public a() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                f.c();
            } catch (Throwable unused) {
            }
        }
    }

    /* renamed from: com.pgl.ssdk.ces.b$b, reason: collision with other inner class name */
    public class RunnableC0302b implements Runnable {

        /* renamed from: a, reason: collision with root package name */
        final /* synthetic */ String f42340a;

        public RunnableC0302b(String str) {
            this.f42340a = str;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (!TextUtils.isEmpty(this.f42340a) && this.f42340a.equals(PglSSManager.REPORT_SCENE_ADSHOW)) {
                ab.b(b.this.f42331f);
            }
            al.a(b.this.f42331f).a();
            aa.b(b.this.f42331f);
        }
    }

    private b(Context context, String str) {
        this.f42331f = context;
        this.f42332g = str;
    }

    public static b a(Context context, String str, int i5, int i11, String str2) {
        if (f42326a == null) {
            synchronized (b.class) {
                try {
                    if (f42326a == null) {
                        if (context == null) {
                            context = ab.a().getApplicationContext();
                        }
                        if (context == null) {
                            f42329d = 4;
                            return null;
                        }
                        a(i5);
                        av.a aVarB = av.b(context, "nms");
                        if (aVarB != null) {
                            f42329d = aVarB.f42319a;
                            f42330e = aVarB;
                            return null;
                        }
                        b bVar = new b(context, str);
                        f42326a = bVar;
                        bVar.f42333h = i11;
                        f42326a.f42334i = str2;
                        f42326a.b(context);
                        f42326a.e(a(context));
                        z.a(context);
                        f42329d = 0;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f42326a;
    }

    public static String b() {
        if (e() != null) {
            return e().f42335j;
        }
        return null;
    }

    public static String c() {
        b bVarE = e();
        if (bVarE == null || TextUtils.isEmpty(bVarE.f42336k)) {
            return null;
        }
        return bVarE.f42336k;
    }

    public static int d() {
        return f42329d;
    }

    public static b e() {
        return f42326a;
    }

    public static av.a f() {
        return f42330e;
    }

    public String g() {
        return a4.a();
    }

    public void h() {
        a4.a(this.f42331f, this.f42332g);
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (ay.a(aw.a(this.f42331f, "pgl_init_report", 0L), jCurrentTimeMillis)) {
            int i5 = f42326a.f42338m;
            if ((i5 > 0 && i5 < 100 && Math.random() * 100.0d < i5) || i5 == 100) {
                a("Start", null, TextUtils.isEmpty(a4.a()) ? 10000L : 0L);
            }
        } else {
            a("Start", null, TextUtils.isEmpty(a4.a()) ? 10000L : 0L);
            aw.b(this.f42331f, "pgl_init_report", jCurrentTimeMillis);
        }
        a("Start");
        if (this.n) {
            ar.a(new a(), 20000L);
        }
    }

    private void b(Context context) {
        if (context == null || f42327b) {
            return;
        }
        try {
            com.pgl.ssdk.ces.a.meta(101, null, "1");
            com.pgl.ssdk.ces.a.meta(102, null, this.f42332g);
            com.pgl.ssdk.ces.a.meta(114, null, Integer.valueOf(this.f42333h));
            StringBuilder sb2 = new StringBuilder();
            sb2.append(ab.h(context));
            com.pgl.ssdk.ces.a.meta(105, null, sb2.toString());
            com.pgl.ssdk.ces.a.meta(152, null, ab.i(context));
            com.pgl.ssdk.ces.a.meta(153, null, ab.d(context));
            com.pgl.ssdk.ces.a.meta(106, null, ab.f(context));
            com.pgl.ssdk.ces.a.meta(107, null, ab.e(context));
            com.pgl.ssdk.ces.a.meta(108, null, ab.c(context));
            com.pgl.ssdk.ces.a.meta(109, null, ab.d());
            com.pgl.ssdk.ces.a.meta(110, null, ab.c());
            com.pgl.ssdk.ces.a.meta(115, null, this.f42334i);
            f42327b = true;
        } catch (Throwable unused) {
        }
    }

    private void e(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        com.pgl.ssdk.ces.a.meta(104, null, str);
    }

    public Object a(int i5, Object obj) {
        if (i5 == 123) {
            return af.a(this.f42331f);
        }
        if (i5 == 121) {
            return ad.a();
        }
        if (i5 == 122) {
            return ad.b();
        }
        if (i5 == 126) {
            return ad.b(this.f42331f);
        }
        if (i5 == 128) {
            return ad.c(this.f42331f);
        }
        if (i5 == 120) {
            return ac.c();
        }
        if (i5 == 124) {
            return ag.c(this.f42331f);
        }
        if (i5 == 130) {
            return ag.a(this.f42331f);
        }
        if (i5 == 145) {
            return ah.c(this.f42331f);
        }
        if (i5 == 125) {
            return ag.b(this.f42331f);
        }
        if (i5 == 129) {
            return ae.f(this.f42331f);
        }
        if (i5 == 141) {
            return ae.e(this.f42331f);
        }
        if (i5 == 134) {
            return ak.a(this.f42331f).b();
        }
        if (i5 == 140) {
            return al.a(this.f42331f).e();
        }
        if (i5 == 144) {
            return al.a(this.f42331f).d();
        }
        if (i5 == 133) {
            return a(obj);
        }
        if (i5 == 135) {
            return v.g();
        }
        if (i5 == 201) {
            return ad.a(this.f42331f);
        }
        if (i5 == 202) {
            return ad.c();
        }
        if (i5 == 236) {
            return ax.a((String) obj);
        }
        if (i5 == 142) {
            return ab.g(this.f42331f);
        }
        if (i5 == 143) {
            return ah.a(this.f42331f);
        }
        if (i5 == 146) {
            return v.c();
        }
        if (i5 == 147) {
            return Boolean.valueOf(ab.j(this.f42331f));
        }
        if (i5 == 148) {
            return u.b(this.f42331f);
        }
        if (i5 == 149) {
            return w.a(this.f42331f);
        }
        if (i5 == 150) {
            return Integer.valueOf(x.a(this.f42331f));
        }
        if (i5 == 151) {
            return w.a();
        }
        if (i5 == 161) {
            return Boolean.valueOf(v.h());
        }
        if (i5 == 163) {
            return aj.a();
        }
        if (i5 == 169) {
            return Boolean.valueOf(aa.a(this.f42331f));
        }
        if (i5 == 170) {
            return Integer.valueOf(y.b((String) obj));
        }
        if (i5 == 203) {
            return ab.b();
        }
        if (i5 == 205) {
            return Integer.valueOf(ab.k(this.f42331f));
        }
        if (i5 == 204) {
            return Integer.valueOf(ae.a(this.f42331f));
        }
        if (i5 == 206) {
            return ah.b(this.f42331f);
        }
        return null;
    }

    public synchronized void c(String str) {
        if (!TextUtils.isEmpty(str) && !str.equals(this.f42335j)) {
            this.f42335j = str;
            com.pgl.ssdk.ces.a.meta(103, null, str);
        }
    }

    public synchronized void d(String str) {
        if (!TextUtils.isEmpty(str) && !str.equals(this.f42336k)) {
            com.pgl.ssdk.ces.a.meta(111, null, str);
            this.f42336k = str;
            a4.b();
        }
    }

    public static String a() {
        if (e() != null) {
            return e().f42332g;
        }
        return null;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private void b(String str) throws JSONException {
        int iIntValue;
        try {
            JSONObject jSONObject = new JSONObject(str);
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                Object obj = jSONObject.get(next);
                switch (next.hashCode()) {
                    case -417749689:
                        if (!next.equals("touch_trace_enabled") || !(obj instanceof Boolean)) {
                            break;
                        } else {
                            y.f42398g = ((Boolean) obj).booleanValue();
                            break;
                        }
                    case -257777372:
                        if (next.equals("init_prob") && (obj instanceof Integer) && (iIntValue = ((Integer) obj).intValue()) >= 0 && iIntValue <= 100) {
                            this.f42338m = iIntValue;
                            break;
                        } else {
                            break;
                        }
                        break;
                    case -93508180:
                        if (!next.equals("autoctl_detect_enable") || !(obj instanceof Boolean)) {
                            break;
                        } else {
                            ak.f42270b = ((Boolean) obj).booleanValue();
                            break;
                        }
                    case 449342513:
                        if (!next.equals("craw_ratio") || !(obj instanceof Integer) || ((Integer) obj).intValue() <= 0) {
                            break;
                        } else {
                            f.f42362b = ((Integer) obj).intValue();
                            break;
                        }
                        break;
                    case 944591168:
                        if (!next.equals("report_ratio") || !(obj instanceof Integer) || ((Integer) obj).intValue() <= 0) {
                            break;
                        } else {
                            this.f42337l = ((Integer) obj).intValue();
                            break;
                        }
                    case 1286849298:
                        if (!next.equals("app_switch") || !(obj instanceof Boolean)) {
                            break;
                        } else {
                            this.n = ((Boolean) obj).booleanValue();
                            break;
                        }
                        break;
                }
            }
        } catch (JSONException unused) {
        }
    }

    private static String a(Context context) {
        String strA = aw.a(context, "iid");
        if (!TextUtils.isEmpty(strA)) {
            return strA;
        }
        String string = UUID.randomUUID().toString();
        aw.b(context, "iid", string);
        return string;
    }

    private String a(Object obj) {
        Map<String, Object> map;
        if (!(obj instanceof String) || !"Start".equals((String) obj) || (map = f42328c) == null || map.isEmpty()) {
            return "{}";
        }
        try {
            return new JSONObject(f42328c).toString();
        } catch (Exception unused) {
            return "{}";
        }
    }

    public Map<String, String> a(String str, byte[] bArr) {
        HashMap map = new HashMap();
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (bArr == null) {
            bArr = new byte[0];
        }
        String str2 = (String) com.pgl.ssdk.ces.a.meta(Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, this.f42331f, new Object[]{str, bArr});
        if (!TextUtils.isEmpty(str2)) {
            map.put("X-Armors", str2);
        }
        return map;
    }

    public static void a(int i5) {
        an.a(i5);
    }

    public void a(MotionEvent motionEvent) {
        y.a(motionEvent, this.f42331f);
    }

    public void a(String str) {
        ar.b(new RunnableC0302b(str));
    }

    public void a(String str, String str2, String str3, String str4) {
        c(str2);
        d(str4);
        try {
            h();
        } catch (Throwable unused) {
        }
    }

    public void a(String str, Map<String, Object> map, long j11) {
        try {
            ar.a(new ao(this.f42331f, Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, new Object[]{str, map}), j11);
        } catch (Throwable unused) {
        }
    }

    public synchronized void a(Map<String, Object> map) {
        if (map != null) {
            if (!map.isEmpty()) {
                try {
                    for (String str : map.keySet()) {
                        Object obj = map.get(str);
                        if (obj != null) {
                            switch (str.hashCode()) {
                                case -2021683300:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_TRANSFER_HOST)) {
                                        if (obj instanceof String) {
                                            an.a((String) obj);
                                            break;
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                case -1195280656:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_SEC_CONFIG_STR)) {
                                        if (obj instanceof String) {
                                            b((String) obj);
                                            break;
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                case 156851746:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_ALLOWED_FIELDS)) {
                                        if (obj instanceof Set) {
                                            Set set = (Set) obj;
                                            com.pgl.ssdk.ces.a.meta(165, null, Boolean.valueOf(set.contains("boot")));
                                            com.pgl.ssdk.ces.a.meta(166, null, Boolean.valueOf(set.contains("mnc")));
                                            com.pgl.ssdk.ces.a.meta(167, null, Boolean.valueOf(set.contains("mcc")));
                                            break;
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                case 398905722:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_CHECKCLAZZ)) {
                                        if (obj instanceof String) {
                                            String strA = ai.a((String) obj);
                                            if (TextUtils.isEmpty(strA)) {
                                                break;
                                            } else {
                                                com.pgl.ssdk.ces.a.meta(159, null, strA);
                                                break;
                                            }
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                case 485444716:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_TARGET_IDC)) {
                                        if (obj instanceof String) {
                                            an.b((String) obj);
                                            break;
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                case 500804551:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_IPV6)) {
                                        if (obj instanceof String) {
                                            String str2 = (String) obj;
                                            if (TextUtils.isEmpty(str2)) {
                                                break;
                                            } else {
                                                am.a(str2);
                                                break;
                                            }
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                case 897152865:
                                    if (str.equals(PglSSConfig.CUSTOMINFO_KEY_ADS_URL_BACKUP)) {
                                        if (obj instanceof Set) {
                                            try {
                                                an.a((Set<String>) obj);
                                                break;
                                            } catch (Throwable unused) {
                                                break;
                                            }
                                        } else {
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                default:
                                    continue;
                            }
                        }
                    }
                    if (f42328c == null) {
                        f42328c = new HashMap();
                    }
                    f42328c.putAll(map);
                } catch (Throwable unused2) {
                }
            }
        }
    }
}
