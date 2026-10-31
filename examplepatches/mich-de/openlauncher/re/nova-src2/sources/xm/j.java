package xm;

import android.util.Log;
import b.c0;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.Executor;
import java.util.regex.Pattern;
import org.json.JSONException;
import s90.r0;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: e, reason: collision with root package name */
    public static final Pattern f96137e;

    /* renamed from: f, reason: collision with root package name */
    public static final Pattern f96138f;

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f96139a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public final Executor f96140b;

    /* renamed from: c, reason: collision with root package name */
    public final c f96141c;

    /* renamed from: d, reason: collision with root package name */
    public final c f96142d;

    static {
        Charset.forName("UTF-8");
        f96137e = Pattern.compile("^(1|true|t|yes|y|on)$", 2);
        f96138f = Pattern.compile("^(0|false|f|no|n|off|)$", 2);
    }

    public j(Executor executor, c cVar, c cVar2) {
        this.f96140b = executor;
        this.f96141c = cVar;
        this.f96142d = cVar2;
    }

    public static HashSet b(c cVar) {
        HashSet hashSet = new HashSet();
        e eVarC = cVar.c();
        if (eVarC != null) {
            Iterator<String> itKeys = eVarC.f96110b.keys();
            while (itKeys.hasNext()) {
                hashSet.add(itKeys.next());
            }
        }
        return hashSet;
    }

    public static String c(c cVar, String str) {
        e eVarC = cVar.c();
        if (eVarC == null) {
            return null;
        }
        try {
            return eVarC.f96110b.getString(str);
        } catch (JSONException unused) {
            return null;
        }
    }

    public static void d(String str, String str2) {
        Log.w("FirebaseRemoteConfig", c0.n("No value of type '", str2, "' exists for parameter key '", str, "'."));
    }

    public final void a(String str, e eVar) {
        if (eVar == null) {
            return;
        }
        synchronized (this.f96139a) {
            try {
                Iterator it = this.f96139a.iterator();
                while (it.hasNext()) {
                    this.f96140b.execute(new r0(3, (wm.e) it.next(), str, eVar));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
