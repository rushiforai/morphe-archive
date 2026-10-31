package com.iab.omid.library.vungle.walking.async;

import com.iab.omid.library.vungle.walking.async.b;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public class e extends a {
    public e(b.InterfaceC0131b interfaceC0131b, HashSet<String> hashSet, JSONObject jSONObject, long j11) {
        super(interfaceC0131b, hashSet, jSONObject, j11);
    }

    private void b(String str) {
        com.iab.omid.library.vungle.internal.c cVarC = com.iab.omid.library.vungle.internal.c.c();
        if (cVarC != null) {
            for (com.iab.omid.library.vungle.adsession.a aVar : cVarC.b()) {
                if (this.f35294c.contains(aVar.c())) {
                    aVar.d().a(str, this.f35296e);
                }
            }
        }
    }

    @Override // android.os.AsyncTask
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public String doInBackground(Object... objArr) {
        return this.f35295d.toString();
    }

    @Override // com.iab.omid.library.vungle.walking.async.b, android.os.AsyncTask
    /* renamed from: a */
    public void onPostExecute(String str) {
        b(str);
        super.onPostExecute(str);
    }
}
