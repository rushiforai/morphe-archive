package wm;

import android.content.Context;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.concurrent.Executor;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import x7.h;
import xm.i;
import xm.j;
import xm.l;
import xm.n;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final Context f94598a;

    /* renamed from: b, reason: collision with root package name */
    public final vl.b f94599b;

    /* renamed from: c, reason: collision with root package name */
    public final Executor f94600c;

    /* renamed from: d, reason: collision with root package name */
    public final xm.c f94601d;

    /* renamed from: e, reason: collision with root package name */
    public final xm.c f94602e;

    /* renamed from: f, reason: collision with root package name */
    public final xm.c f94603f;

    /* renamed from: g, reason: collision with root package name */
    public final i f94604g;

    /* renamed from: h, reason: collision with root package name */
    public final j f94605h;

    /* renamed from: i, reason: collision with root package name */
    public final n f94606i;

    /* renamed from: j, reason: collision with root package name */
    public final i50.c f94607j;

    /* renamed from: k, reason: collision with root package name */
    public final h f94608k;

    public c(Context context, vl.b bVar, Executor executor, xm.c cVar, xm.c cVar2, xm.c cVar3, i iVar, j jVar, n nVar, i50.c cVar4, h hVar) {
        this.f94598a = context;
        this.f94599b = bVar;
        this.f94600c = executor;
        this.f94601d = cVar;
        this.f94602e = cVar2;
        this.f94603f = cVar3;
        this.f94604g = iVar;
        this.f94605h = jVar;
        this.f94606i = nVar;
        this.f94607j = cVar4;
        this.f94608k = hVar;
    }

    public static ArrayList e(JSONArray jSONArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            HashMap map = new HashMap();
            JSONObject jSONObject = jSONArray.getJSONObject(i5);
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                map.put(next, jSONObject.getString(next));
            }
            arrayList.add(map);
        }
        return arrayList;
    }

    public final boolean a(String str) {
        Pattern pattern = j.f96138f;
        Pattern pattern2 = j.f96137e;
        j jVar = this.f94605h;
        xm.c cVar = jVar.f96141c;
        String strC = j.c(cVar, str);
        if (strC != null) {
            if (pattern2.matcher(strC).matches()) {
                jVar.a(str, cVar.c());
                return true;
            }
            if (pattern.matcher(strC).matches()) {
                jVar.a(str, cVar.c());
                return false;
            }
        }
        String strC2 = j.c(jVar.f96142d, str);
        if (strC2 != null) {
            if (pattern2.matcher(strC2).matches()) {
                return true;
            }
            if (pattern.matcher(strC2).matches()) {
                return false;
            }
        }
        j.d(str, "Boolean");
        return false;
    }

    public final long b(String str) {
        Long lValueOf;
        j jVar = this.f94605h;
        xm.c cVar = jVar.f96141c;
        xm.e eVarC = cVar.c();
        Long lValueOf2 = null;
        if (eVarC == null) {
            lValueOf = null;
        } else {
            try {
                lValueOf = Long.valueOf(eVarC.f96110b.getLong(str));
            } catch (JSONException unused) {
            }
        }
        if (lValueOf != null) {
            jVar.a(str, cVar.c());
            return lValueOf.longValue();
        }
        xm.e eVarC2 = jVar.f96142d.c();
        if (eVarC2 != null) {
            try {
                lValueOf2 = Long.valueOf(eVarC2.f96110b.getLong(str));
            } catch (JSONException unused2) {
            }
        }
        if (lValueOf2 != null) {
            return lValueOf2.longValue();
        }
        j.d(str, "Long");
        return 0L;
    }

    public final String c(String str) {
        j jVar = this.f94605h;
        xm.c cVar = jVar.f96141c;
        String strC = j.c(cVar, str);
        if (strC != null) {
            jVar.a(str, cVar.c());
            return strC;
        }
        String strC2 = j.c(jVar.f96142d, str);
        if (strC2 != null) {
            return strC2;
        }
        j.d(str, "String");
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final void d(boolean z11) {
        HttpURLConnection httpURLConnection;
        i50.c cVar = this.f94607j;
        synchronized (cVar) {
            l lVar = (l) cVar.f61380c;
            synchronized (lVar.f96160q) {
                try {
                    lVar.f96150e = z11;
                    if (z11 && (httpURLConnection = lVar.f96151f) != null) {
                        httpURLConnection.disconnect();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (!z11) {
                synchronized (cVar) {
                    if (!((LinkedHashSet) cVar.f61379b).isEmpty()) {
                        ((l) cVar.f61380c).e(0L);
                    }
                }
            }
        }
    }
}
