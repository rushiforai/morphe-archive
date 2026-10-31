package ads_mobile_sdk;

import android.content.Context;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public final class lk {

    /* renamed from: d, reason: collision with root package name */
    public static final HashMap f6257d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public static volatile lk f6258e;

    /* renamed from: b, reason: collision with root package name */
    public final Context f6259b;

    /* renamed from: c, reason: collision with root package name */
    public volatile ArrayList f6260c;

    public lk(Context context) {
        Context applicationContext = context != null ? context.getApplicationContext() : null;
        this.f6259b = applicationContext;
        f6257d.put("FireTVFOSDAT", mm0.a(applicationContext));
    }

    public final ArrayList a() {
        if (this.f6260c != null) {
            return this.f6260c;
        }
        synchronized (this) {
            if (this.f6260c != null) {
                return this.f6260c;
            }
            try {
                ArrayList arrayList = new ArrayList();
                for (Map.Entry entry : f6257d.entrySet()) {
                    if (((mm0) entry.getValue()).a()) {
                        lm0 lm0VarG = b.i8.g(this.f6259b, (String) entry.getKey());
                        if (lm0VarG != null) {
                            arrayList.add(lm0VarG);
                        }
                    }
                }
                this.f6260c = arrayList;
                return this.f6260c;
            } catch (Exception e3) {
                Log.e("OMIDLIB", "Error getting supported attestation mechanisms", e3);
                this.f6260c = new ArrayList();
                return this.f6260c;
            }
        }
    }

    public static lk a(Context context) {
        if (f6258e == null) {
            synchronized (lk.class) {
                try {
                    if (f6258e == null) {
                        f6258e = new lk(context);
                    }
                } finally {
                }
            }
        }
        return f6258e;
    }
}
