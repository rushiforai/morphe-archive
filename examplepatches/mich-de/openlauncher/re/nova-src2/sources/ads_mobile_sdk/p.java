package ads_mobile_sdk;

import android.webkit.WebView;
import b.bd;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class p implements bd {

    /* renamed from: f, reason: collision with root package name */
    public static final p f8037f = new p(new zj());

    /* renamed from: b, reason: collision with root package name */
    public Date f8038b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f8039c;

    /* renamed from: d, reason: collision with root package name */
    public final zj f8040d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f8041e;

    public p(zj zjVar) {
        this.f8040d = zjVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // b.bd
    public final void a(boolean z11) throws JSONException {
        if (!this.f8041e && z11) {
            Date date = new Date();
            Date date2 = this.f8038b;
            if (date2 == null || date.after(date2)) {
                this.f8038b = date;
                if (this.f8039c) {
                    Iterator it = Collections.unmodifiableCollection(n6.f7447c.f7449b).iterator();
                    while (it.hasNext()) {
                        o6 o6Var = ((m6) it.next()).f7018d;
                        Date date3 = this.f8038b;
                        Date date4 = date3 != null ? (Date) date3.clone() : null;
                        o6Var.getClass();
                        if (date4 != null) {
                            JSONObject jSONObject = new JSONObject();
                            c72.a(jSONObject, "timestamp", Long.valueOf(date4.getTime()));
                            d62.f2192a.a((WebView) o6Var.f7769b.get(), "setLastActivity", jSONObject);
                        }
                    }
                }
            }
        }
        this.f8041e = z11;
    }
}
