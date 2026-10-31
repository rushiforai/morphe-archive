package sp;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: e, reason: collision with root package name */
    public static s f87658e;

    /* renamed from: a, reason: collision with root package name */
    public r30.c f87659a;

    /* renamed from: b, reason: collision with root package name */
    public r30.c f87660b;

    /* renamed from: c, reason: collision with root package name */
    public r30.c f87661c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f87662d;

    static {
        new b50.d(s.class.getSimpleName());
    }

    public static s c() {
        if (f87658e == null) {
            s sVar = new s();
            sVar.f87659a = null;
            sVar.f87662d = false;
            f87658e = sVar;
        }
        return f87658e;
    }

    public final boolean a(Application application) {
        try {
            if (this.f87662d) {
                return true;
            }
            boolean z11 = application.getSharedPreferences("singular-pref-session", 0).getBoolean("DID_SEND_START_SESSION_WITH_SDID", false);
            this.f87662d = z11;
            return z11;
        } catch (Throwable unused) {
            return false;
        }
    }

    public final r30.c b(p pVar, Context context) {
        String strC;
        r30.c cVar;
        if (this.f87661c == null) {
            r30.c cVar2 = null;
            if (context != null) {
                try {
                    SharedPreferences sharedPreferences = context.getSharedPreferences("singular-pref-session", 0);
                    String string = sharedPreferences.getString("custom-sdid", null);
                    int i5 = 1;
                    if (r0.l(string)) {
                        String string2 = sharedPreferences.getString("pref-singular-device-id", null);
                        int i11 = 2;
                        if (r0.l(string2)) {
                            boolean z11 = this.f87659a != null;
                            h0 h0Var = pVar.f87645a;
                            boolean z12 = h0Var != null ? h0Var.f87586b : h0.a().f87586b;
                            if (z11 && z12) {
                                SharedPreferences.Editor editorEdit = sharedPreferences.edit();
                                editorEdit.putString("custom-sdid", this.f87659a.f85475a);
                                editorEdit.commit();
                                cVar2 = this.f87659a;
                            } else {
                                h0 h0Var2 = pVar.f87645a;
                                if (h0Var2 == null || r0.l(h0Var2.c())) {
                                    p pVar2 = p.f87644b;
                                    strC = null;
                                } else {
                                    strC = pVar.f87645a.c();
                                }
                                if (!r0.l(strC)) {
                                    SharedPreferences.Editor editorEdit2 = sharedPreferences.edit();
                                    editorEdit2.putString("pref-singular-device-id", strC);
                                    editorEdit2.commit();
                                    cVar2 = new r30.c(strC, i11);
                                }
                            }
                        } else {
                            cVar = new r30.c(string2, i11);
                        }
                    } else {
                        cVar = new r30.c(string, i5);
                    }
                    cVar2 = cVar;
                } catch (Throwable th2) {
                    r0.c(th2);
                }
            }
            this.f87661c = cVar2;
        }
        return this.f87661c;
    }
}
