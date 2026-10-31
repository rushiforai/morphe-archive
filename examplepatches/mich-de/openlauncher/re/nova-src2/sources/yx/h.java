package yx;

import android.content.Context;
import android.content.SharedPreferences;
import com.android.billingclient.api.Purchase;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.messaging.FirebaseMessaging;
import e10.y2;
import fi.j;
import fi.t;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import kotlin.Pair;
import kotlin.jvm.functions.Function0;
import org.json.JSONException;
import org.json.JSONObject;
import r70.k;
import s90.s0;
import sp.l0;
import sp.m0;
import sp.r0;
import t5.d0;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: c, reason: collision with root package name */
    public static volatile Boolean f97706c;

    /* renamed from: d, reason: collision with root package name */
    public static volatile String f97707d;

    /* renamed from: a, reason: collision with root package name */
    public static final h f97704a = new h();

    /* renamed from: b, reason: collision with root package name */
    public static volatile g f97705b = g.f97700a;

    /* renamed from: e, reason: collision with root package name */
    public static volatile Function0 f97708e = new ww.e(18);

    /* renamed from: f, reason: collision with root package name */
    public static final ConcurrentLinkedQueue f97709f = new ConcurrentLinkedQueue();

    public static void a(boolean z11) {
        boolean z12 = !z11;
        try {
            if (rp.a.e()) {
                SharedPreferences.Editor editorEdit = rp.a.f86129a.c().edit();
                editorEdit.putBoolean("limit_data_sharing", z12);
                editorEdit.commit();
            } else {
                m0 m0Var = rp.a.f86129a;
                m0.a("e78");
            }
            if (z11) {
                if (!rp.a.e()) {
                    m0 m0Var2 = rp.a.f86129a;
                    m0.a("e67");
                } else {
                    m0 m0Var3 = rp.a.f86129a;
                    m0Var3.getClass();
                    m0Var3.g(new l0(m0Var3, m0Var3, 0));
                }
            }
        } catch (Throwable th2) {
            zy.c cVar = zy.c.f98823a;
            zy.c.j(th2);
        }
    }

    public static void b() {
        boolean zD = d();
        ConcurrentLinkedQueue concurrentLinkedQueue = f97709f;
        if (!zD) {
            concurrentLinkedQueue.clear();
            return;
        }
        while (true) {
            Pair pair = (Pair) concurrentLinkedQueue.poll();
            if (pair == null) {
                return;
            } else {
                f((String) pair.f71683a, (Map) pair.f71684b);
            }
        }
    }

    public static boolean d() {
        try {
            return ((Boolean) f97708e.invoke()).booleanValue();
        } catch (Throwable th2) {
            zy.c cVar = zy.c.f98823a;
            zy.c.j(th2);
            return false;
        }
    }

    public static void e() {
        FirebaseMessaging firebaseMessaging;
        t tVarC;
        try {
            d0 d0Var = FirebaseMessaging.f34752m;
            synchronized (FirebaseMessaging.class) {
                firebaseMessaging = FirebaseMessaging.getInstance(ul.g.c());
            }
            if (firebaseMessaging.f34756d.j()) {
                tVarC = Tasks.c(new IllegalStateException("API disabled. Please use {@link #register()} instead or enable this API by removing {@code <meta-data android:name=\"firebase_messaging_installation_id_enabled\" android:value=\"true\" />} from your app's manifest."));
            } else {
                j jVar = new j();
                firebaseMessaging.f34759g.execute(new s0(1, firebaseMessaging, jVar));
                tVarC = jVar.f55135a;
            }
            tVarC.f(new wm.b(new xu.c(6), 7));
        } catch (Throwable th2) {
            zy.c cVar = zy.c.f98823a;
            zy.c.j(th2);
        }
    }

    public static void f(String str, Map map) {
        if (map != null) {
            try {
                if (!map.isEmpty()) {
                    rp.a.b(str, new JSONObject(map));
                    return;
                }
            } catch (Throwable th2) {
                zy.c cVar = zy.c.f98823a;
                zy.c.j(th2);
                return;
            }
        }
        try {
            if (!rp.a.e()) {
                m0.a("e26");
            } else if (r0.l(str)) {
                m0.a("e27");
            } else {
                rp.a.f86129a.f(str, null);
            }
        } catch (Throwable th3) {
            m0.a("e30");
            r0.c(th3);
        }
    }

    public static void g(String str, Map map) {
        if (d()) {
            if (f97705b == g.f97702c) {
                if (!f97709f.isEmpty()) {
                    b();
                }
                f(str, map);
            } else {
                ConcurrentLinkedQueue concurrentLinkedQueue = f97709f;
                if (concurrentLinkedQueue.size() < 100) {
                    concurrentLinkedQueue.add(new Pair(str, map));
                }
            }
        }
    }

    public static void h(String str, double d5) {
        if (d5 > 0.0d && d() && f97705b == g.f97702c) {
            try {
                rp.b bVar = new rp.b(str, d5);
                try {
                    if (rp.a.e()) {
                        String[] strArr = bVar.f86131a;
                        int length = strArr.length;
                        boolean z11 = false;
                        int i5 = 0;
                        while (true) {
                            if (i5 >= length) {
                                z11 = true;
                                break;
                            }
                            String str2 = strArr[i5];
                            try {
                                if (!bVar.has(str2) || r0.l(bVar.get(str2).toString())) {
                                    break;
                                } else {
                                    i5++;
                                }
                            } catch (JSONException e3) {
                                r0.c(e3);
                            }
                        }
                        if (z11) {
                            rp.a.b("__ADMON_USER_LEVEL_REVENUE__", bVar);
                            return;
                        }
                    }
                    m0.a("e74");
                } catch (Throwable th2) {
                    m0.a("e76");
                    m0 m0Var = rp.a.f86129a;
                    r0.c(th2);
                }
            } catch (Throwable th3) {
                zy.c cVar = zy.c.f98823a;
                zy.c.j(th3);
            }
        }
    }

    public static void i(double d5, Purchase purchase, String str) {
        if (d() && f97705b == g.f97702c) {
            try {
                rp.a.f(d5, purchase, str);
            } catch (Throwable th2) {
                zy.c cVar = zy.c.f98823a;
                zy.c.j(th2);
            }
        }
    }

    public static void j(boolean z11) {
        f97706c = Boolean.valueOf(z11);
        if (f97705b == g.f97702c) {
            f97706c = null;
            a(z11);
        }
    }

    public final void c(Context context) {
        zy.c cVar = zy.c.f98823a;
        boolean zD = zy.c.d("singular_enabled", true);
        y2.f51877a.getClass();
        String str = (String) y2.k().l();
        ww.e eVar = new ww.e(19);
        synchronized (this) {
            if (zD) {
                try {
                    g gVar = f97705b;
                    g gVar2 = g.f97700a;
                    if (gVar == gVar2) {
                        f97705b = g.f97701b;
                        f97708e = eVar;
                        try {
                            rp.c cVar2 = new rp.c("instabridge_ffcbcb0b", "ddddafd404a9a4d918bae58070b136d7");
                            cVar2.f86136e = 43200L;
                            if (!k.U0(str) && !str.equals(y2.k().f51806a)) {
                                cVar2.f86134c = str;
                            }
                            if (!rp.a.d(context.getApplicationContext(), cVar2)) {
                                f97705b = gVar2;
                                zy.c.j(new IllegalStateException("Singular.init returned false"));
                                return;
                            }
                            f97705b = g.f97702c;
                            Boolean bool = f97706c;
                            if (bool != null) {
                                a(bool.booleanValue());
                            }
                            f97706c = null;
                            String str2 = f97707d;
                            if (str2 != null) {
                                try {
                                    rp.a.g(str2);
                                } catch (Throwable th2) {
                                    zy.c cVar3 = zy.c.f98823a;
                                    zy.c.j(th2);
                                }
                            }
                            f97707d = null;
                            b();
                            e();
                            mc0.d.f76206a.b("Singular initialized", new Object[0]);
                        } catch (Throwable th3) {
                            f97705b = g.f97700a;
                            zy.c cVar4 = zy.c.f98823a;
                            zy.c.j(th3);
                        }
                    }
                } catch (Throwable th4) {
                    throw th4;
                }
            }
        }
    }
}
