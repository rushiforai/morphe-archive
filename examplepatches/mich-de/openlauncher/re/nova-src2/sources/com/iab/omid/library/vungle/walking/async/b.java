package com.iab.omid.library.vungle.walking.async;

import android.os.AsyncTask;
import java.util.concurrent.ThreadPoolExecutor;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class b extends AsyncTask<Object, Void, String> {

    /* renamed from: a, reason: collision with root package name */
    private a f35297a;

    /* renamed from: b, reason: collision with root package name */
    public final InterfaceC0131b f35298b;

    public interface a {
        void a(b bVar);
    }

    /* renamed from: com.iab.omid.library.vungle.walking.async.b$b, reason: collision with other inner class name */
    public interface InterfaceC0131b {
        JSONObject a();

        void a(JSONObject jSONObject);
    }

    public b(InterfaceC0131b interfaceC0131b) {
        this.f35298b = interfaceC0131b;
    }

    public void a(a aVar) {
        this.f35297a = aVar;
    }

    @Override // android.os.AsyncTask
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public void onPostExecute(String str) {
        a aVar = this.f35297a;
        if (aVar != null) {
            aVar.a(this);
        }
    }

    public void a(ThreadPoolExecutor threadPoolExecutor) {
        executeOnExecutor(threadPoolExecutor, new Object[0]);
    }
}
