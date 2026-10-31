package yx;

import aa.o;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import b.c0;
import com.teslacoilsw.launcher.homereset.HomeReset;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import e10.a3;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: b, reason: collision with root package name */
    public static volatile a10.a f97698b;

    /* renamed from: a, reason: collision with root package name */
    public static final Handler f97697a = new Handler(Looper.getMainLooper());

    /* renamed from: c, reason: collision with root package name */
    public static final ExecutorService f97699c = Executors.newSingleThreadExecutor();

    public static boolean a(Context context) {
        SharedPreferences sharedPreferences = a3.f51435a.f51545a;
        e eVarB = b();
        boolean zC = HomeReset.c(context);
        e eVar = zC ? e.f97693b : e.f97694c;
        if (sharedPreferences.getLong("launcher_chooser_opened_at", 0L) > 0 && eVar == e.f97693b) {
            String string = sharedPreferences.getString("launcher_chooser_location", "unknown");
            String str = string != null ? string : "unknown";
            String string2 = sharedPreferences.getString("launcher_chooser_type", "role_manager");
            String str2 = string2 != null ? string2 : "role_manager";
            sharedPreferences.edit().remove("launcher_chooser_opened_at").remove("launcher_chooser_location").remove("launcher_chooser_type").putInt("launcher_default_retry_count", 0).apply();
            f97697a.post(new o(5));
            zy.c cVar = zy.c.f98823a;
            zy.c.i("launcher_default_success", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, str2), new Pair("location", str), new Pair("via", "state_change")));
            h hVar = h.f97704a;
            h.g("launcher_default_success", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, str2), new Pair("location", str), new Pair("via", "state_change")));
        }
        if (eVarB != eVar) {
            e(eVar);
        }
        return zC;
    }

    public static e b() {
        Object obj = null;
        String string = a3.f51435a.f51545a.getString("launcher_default_state", null);
        i70.a aVar = e.f97696e;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                break;
            }
            Object next = aVarF.next();
            if (Intrinsics.b(((e) next).name(), string)) {
                obj = next;
                break;
            }
        }
        e eVar = (e) obj;
        return eVar == null ? e.f97692a : eVar;
    }

    public static void c(int i5, String str) {
        zy.c cVar = zy.c.f98823a;
        zy.c.i("onboarding_page_view", MapsKt.j0(new Pair("page", str), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5))));
    }

    public static void d(String str) {
        a3.f51435a.f51545a.edit().putLong("launcher_chooser_opened_at", System.currentTimeMillis()).putString("launcher_chooser_location", str).putString("launcher_chooser_type", "role_manager").apply();
        zy.c cVar = zy.c.f98823a;
        zy.c.i("launcher_default_chooser_opened", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "role_manager"), new Pair("location", str)));
        a10.a aVar = f97698b;
        if (aVar != null) {
            f97697a.removeCallbacks(aVar);
        }
        f97698b = null;
        f97698b = new a10.a(9);
        Handler handler = f97697a;
        a10.a aVar2 = f97698b;
        Intrinsics.d(aVar2);
        handler.postDelayed(aVar2, 30000L);
    }

    public static void e(e eVar) {
        SharedPreferences sharedPreferences = a3.f51435a.f51545a;
        e eVarB = b();
        if (eVarB == eVar) {
            return;
        }
        sharedPreferences.edit().putString("launcher_default_state", eVar.name()).apply();
        e eVar2 = e.f97693b;
        if (eVar == eVar2) {
            zy.c.i("launcher_default_set_nova", null);
            sharedPreferences.edit().putLong("launcher_last_nova_retrack_timestamp", System.currentTimeMillis()).apply();
        } else if (eVarB == eVar2 && eVar == e.f97694c) {
            zy.c.i("launcher_default_set_other_from_nova", null);
        } else if (eVarB == e.f97692a && eVar == e.f97694c) {
            zy.c.i("launcher_default_set_other", null);
        }
    }
}
