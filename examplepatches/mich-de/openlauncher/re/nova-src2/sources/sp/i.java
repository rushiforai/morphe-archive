package sp;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.IOException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f87589f = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Context f87590a;

    /* renamed from: b, reason: collision with root package name */
    public final j0 f87591b;

    /* renamed from: c, reason: collision with root package name */
    public final gc.c f87592c;

    /* renamed from: d, reason: collision with root package name */
    public int f87593d = 15;

    /* renamed from: e, reason: collision with root package name */
    public final h f87594e = new h(this, 0);

    static {
        new b50.d(i.class.getSimpleName());
    }

    public i(gc.c cVar, Context context, j0 j0Var) {
        this.f87590a = context;
        this.f87591b = j0Var;
        this.f87592c = cVar;
        cVar.start();
    }

    public static void b(l lVar) {
        try {
            m0 m0Var = m0.f87615q;
            m0Var.getClass();
            JSONObject jSONObject = new JSONObject(m0Var.f87622g);
            if (jSONObject.length() != 0) {
                lVar.put("global_properties", jSONObject.toString());
            }
            if (lVar.containsKey("data_sharing_options")) {
                return;
            }
            SharedPreferences sharedPreferencesC = m0Var.c();
            Boolean boolValueOf = !sharedPreferencesC.contains("limit_data_sharing") ? null : Boolean.valueOf(sharedPreferencesC.getBoolean("limit_data_sharing", false));
            if (boolValueOf != null) {
                s60.b bVar = new s60.b();
                bVar.put("limit_data_sharing", boolValueOf);
                lVar.put("data_sharing_options", new JSONObject(bVar).toString());
            }
        } catch (Throwable th2) {
            r0.c(th2);
            m0.a("e7");
        }
    }

    public final void a(l lVar) {
        j0 j0Var = this.f87591b;
        try {
            boolean z11 = lVar instanceof f;
            Context context = this.f87590a;
            if (!z11 && !(lVar instanceof g)) {
                lVar.put("event_index", String.valueOf(r0.f(context)));
            }
            lVar.put("singular_install_id", r0.h(context).toString());
            b(lVar);
            j0Var.a(lVar.h());
            c();
        } catch (IOException unused) {
            m0.a("fe18");
        } catch (IndexOutOfBoundsException unused2) {
            m0.a("fe19");
        } catch (Throwable unused3) {
            m0.a("fe20");
        }
    }

    public final void c() {
        gc.c cVar = this.f87592c;
        if (cVar == null) {
            m0.a("ie18");
            return;
        }
        cVar.a().removeCallbacksAndMessages(null);
        this.f87593d = 15;
        cVar.a().post(this.f87594e);
    }
}
