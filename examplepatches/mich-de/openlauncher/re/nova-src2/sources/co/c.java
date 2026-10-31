package co;

import android.text.TextUtils;
import java.util.Collections;
import java.util.HashSet;
import org.json.JSONObject;
import un.k;
import xn.i;

/* loaded from: classes3.dex */
public final class c extends a {

    /* renamed from: c, reason: collision with root package name */
    public final HashSet f20148c;

    /* renamed from: d, reason: collision with root package name */
    public final JSONObject f20149d;

    /* renamed from: e, reason: collision with root package name */
    public final long f20150e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f20151f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(io.sentry.internal.debugmeta.c cVar, HashSet hashSet, JSONObject jSONObject, long j11, int i5) {
        super(cVar);
        this.f20151f = i5;
        this.f20148c = new HashSet(hashSet);
        this.f20149d = jSONObject;
        this.f20150e = j11;
    }

    @Override // co.a
    /* renamed from: a */
    public final void onPostExecute(String str) {
        xn.c cVar;
        switch (this.f20151f) {
            case 0:
                xn.c cVar2 = xn.c.f96182c;
                if (cVar2 != null) {
                    for (k kVar : Collections.unmodifiableCollection(cVar2.f96183a)) {
                        if (this.f20148c.contains(kVar.f91405h)) {
                            zn.a aVar = kVar.f91402e;
                            if (this.f20150e >= aVar.f98576f && aVar.f98575e != 3) {
                                aVar.f98575e = 3;
                                i.f96196a.a(aVar.i(), "setNativeViewHierarchy", str, aVar.f98571a);
                            }
                        }
                    }
                }
                super.onPostExecute(str);
                break;
            default:
                if (!TextUtils.isEmpty(str) && (cVar = xn.c.f96182c) != null) {
                    for (k kVar2 : Collections.unmodifiableCollection(cVar.f96183a)) {
                        if (this.f20148c.contains(kVar2.f91405h)) {
                            zn.a aVar2 = kVar2.f91402e;
                            if (this.f20150e >= aVar2.f98576f) {
                                aVar2.f98575e = 2;
                                i.f96196a.a(aVar2.i(), "setNativeViewHierarchy", str, aVar2.f98571a);
                            }
                        }
                    }
                }
                super.onPostExecute(str);
                break;
        }
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        switch (this.f20151f) {
            case 0:
                return this.f20149d.toString();
            default:
                io.sentry.internal.debugmeta.c cVar = this.f20147b;
                JSONObject jSONObject = (JSONObject) cVar.f67327a;
                JSONObject jSONObject2 = this.f20149d;
                if (ao.b.e(jSONObject2, jSONObject)) {
                    return null;
                }
                cVar.f67327a = jSONObject2;
                return jSONObject2.toString();
        }
    }

    @Override // co.a, android.os.AsyncTask
    public final /* bridge */ /* synthetic */ void onPostExecute(Object obj) {
        switch (this.f20151f) {
            case 0:
                onPostExecute((String) obj);
                break;
            default:
                onPostExecute((String) obj);
                break;
        }
    }
}
