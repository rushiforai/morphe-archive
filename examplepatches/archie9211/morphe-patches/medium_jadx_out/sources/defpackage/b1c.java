package defpackage;

import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b1c {
    public final ra0 a;
    public final String b;
    public ArrayList c = new ArrayList();
    public final ArrayList d = new ArrayList();
    public int e;

    public b1c(ra0 ra0Var, String str) {
        this.a = ra0Var;
        this.b = str;
    }

    public final synchronized void a(i40 i40Var) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            i40Var.getClass();
            if (this.c.size() + this.d.size() >= 1000) {
                this.e++;
            } else {
                this.c.add(i40Var);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final synchronized void b(boolean z) {
        if (ec2.a.contains(this)) {
            return;
        }
        if (!z) {
            this.d.clear();
            this.e = 0;
            return;
        }
        try {
            this.c.addAll(this.d);
            this.d.clear();
            this.e = 0;
            return;
        } catch (Throwable th) {
            ec2.a(this, th);
            return;
        }
    }

    public final synchronized int c() {
        if (ec2.a.contains(this)) {
            return 0;
        }
        try {
            return this.c.size();
        } catch (Throwable th) {
            ec2.a(this, th);
            return 0;
        }
    }

    public final synchronized List d() {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            ArrayList arrayList = this.c;
            this.c = new ArrayList();
            return arrayList;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final int e(ff5 ff5Var, Context context, boolean z, boolean z2) {
        b1c b1cVar;
        Throwable th;
        b1c b1cVar2;
        Throwable th2;
        if (ec2.a.contains(this)) {
            return 0;
        }
        try {
            try {
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            th = th4;
            b1cVar = this;
        }
        synchronized (this) {
            try {
                int i = this.e;
                g34.b(this.c);
                this.d.addAll(this.c);
                this.c.clear();
                JSONArray jSONArray = new JSONArray();
                JSONArray jSONArray2 = new JSONArray();
                for (i40 i40Var : this.d) {
                    try {
                        if (z || !i40Var.c) {
                            jSONArray.put(i40Var.a);
                            jSONArray2.put(i40Var.b);
                        }
                    } catch (Throwable th5) {
                        th2 = th5;
                        b1cVar2 = this;
                        throw th2;
                    }
                }
                if (jSONArray.length() != 0) {
                    f(ff5Var, context, i, jSONArray, jSONArray2, z2);
                    return jSONArray.length();
                }
                try {
                    return 0;
                } catch (Throwable th6) {
                    th = th6;
                    b1cVar = this;
                }
            } catch (Throwable th7) {
                b1cVar2 = this;
                th2 = th7;
            }
            th = th;
            ec2.a(b1cVar, th);
            return 0;
        }
    }

    public final void f(ff5 ff5Var, Context context, int i, JSONArray jSONArray, JSONArray jSONArray2, boolean z) {
        JSONObject jSONObject;
        try {
            if (ec2.a.contains(this)) {
                return;
            }
            try {
                jSONObject = i50.a(h50.CUSTOM_APP_EVENTS, this.a, this.b, z, context);
                if (this.e > 0) {
                    jSONObject.put("num_skipped_events", i);
                }
            } catch (JSONException unused) {
                jSONObject = new JSONObject();
            }
            ff5Var.c = jSONObject;
            Bundle bundle = ff5Var.d;
            String string = jSONArray.toString();
            string.getClass();
            bundle.putString("custom_events", string);
            if (na4.b(ka4.IapLoggingLib5To7)) {
                bundle.putString("operational_parameters", jSONArray2.toString());
            }
            ff5Var.e = string;
            ff5Var.d = bundle;
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
