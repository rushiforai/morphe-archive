package sp;

import android.content.SharedPreferences;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: b, reason: collision with root package name */
    public static p f87644b;

    /* renamed from: a, reason: collision with root package name */
    public h0 f87645a;

    static {
        new b50.d(p.class.getSimpleName());
    }

    public static void a() {
        try {
            d dVar = new d(r0.f87657d.o());
            m0 m0Var = m0.f87615q;
            c cVar = new c();
            cVar.put("sdk", m0Var.f87621f.f87679s);
            cVar.e(m0Var, false);
            cVar.put("a", m0Var.f87619d.f86132a);
            dVar.putAll(cVar);
            m0.f87615q.f87617b.a(dVar);
        } catch (Throwable th2) {
            r0.c(th2);
        }
    }

    public static p b() {
        if (f87644b == null) {
            f87644b = new p();
        }
        return f87644b;
    }

    public static void c(long j11) {
        try {
            SharedPreferences.Editor editorEdit = m0.f87615q.f87616a.getSharedPreferences("singular-pref-config-manager", 0).edit();
            editorEdit.putLong("config_manager_config_request_last_enqueued", j11);
            editorEdit.commit();
        } catch (Throwable th2) {
            r0.c(th2);
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(9:3|(4:31|4|(1:6)(2:9|10)|30)|12|13|28|14|18|(1:20)|24) */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0048, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0049, code lost:
    
        sp.r0.c(r0);
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0052 A[Catch: all -> 0x005f, TRY_LEAVE, TryCatch #2 {, blocks: (B:12:0x0033, B:20:0x0052, B:17:0x0049, B:11:0x002c, B:14:0x0037, B:4:0x0002, B:6:0x0019, B:9:0x0020), top: B:31:0x0002, inners: #0, #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized void d() {
        h0 h0VarA;
        long j11;
        try {
            String string = m0.f87615q.f87616a.getSharedPreferences("singular-pref-config-manager", 0).getString("config_manager_config", null);
            h0VarA = r0.l(string) ? h0.a() : new h0(new JSONObject(string));
        } finally {
            this.f87645a = h0VarA;
            j11 = -1;
            j11 = m0.f87615q.f87616a.getSharedPreferences("singular-pref-config-manager", 0).getLong("config_manager_config_request_last_enqueued", -1L);
            if (j11 < 0) {
            }
        }
        this.f87645a = h0VarA;
        j11 = -1;
        j11 = m0.f87615q.f87616a.getSharedPreferences("singular-pref-config-manager", 0).getLong("config_manager_config_request_last_enqueued", -1L);
        if (j11 < 0) {
            a();
            c(r0.f87657d.o());
        }
    }
}
