package kc;

import com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback;
import nc.c;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class a extends IIgniteServiceCallback.Stub {

    /* renamed from: c, reason: collision with root package name */
    public final lc.b f71324c;

    public a(lc.b bVar) {
        this.f71324c = bVar;
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onError(String str) {
        this.f71324c.a(str);
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onProgress(String str) {
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onScheduled(String str) {
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onStart(String str) {
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onSuccess(String str) throws JSONException {
        String string;
        try {
            string = new JSONObject(str).getJSONObject("data").getString("token");
        } catch (Exception e3) {
            nc.a.a(c.ONE_DT_GENERAL_ERROR, e3);
            rc.a.b("%s : resolveClientToken : %s", "IgniteAuthenticationCallback", e3.toString());
            string = null;
        }
        this.f71324c.c(string);
    }
}
