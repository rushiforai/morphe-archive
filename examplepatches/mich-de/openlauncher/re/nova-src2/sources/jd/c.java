package jd;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.sdk.openadsdk.api.init.PAGConfig;
import com.bytedance.sdk.openadsdk.api.init.PAGSdk;
import com.google.ads.mediation.pangle.PangleMediationAdapter;
import e10.z2;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class c implements PAGSdk.PAGInitCallback {

    /* renamed from: f, reason: collision with root package name */
    public static c f69475f;

    /* renamed from: a, reason: collision with root package name */
    public boolean f69476a = false;

    /* renamed from: b, reason: collision with root package name */
    public boolean f69477b = false;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f69478c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final e f69479d = new e();

    /* renamed from: e, reason: collision with root package name */
    public final a f69480e = new a();

    public final void a(Context context, String str, b bVar) {
        if (TextUtils.isEmpty(str)) {
            bg.a aVar = new bg.a(101, "Failed to initialize Pangle SDK. Missing or invalid App ID.", "com.google.ads.mediation.pangle");
            Log.w(PangleMediationAdapter.TAG, aVar.toString());
            bVar.a(aVar);
            return;
        }
        boolean z11 = this.f69476a;
        ArrayList arrayList = this.f69478c;
        if (z11) {
            arrayList.add(bVar);
            return;
        }
        if (this.f69477b) {
            bVar.b();
            return;
        }
        this.f69476a = true;
        arrayList.add(bVar);
        this.f69480e.getClass();
        PAGConfig pAGConfigBuild = new PAGConfig.Builder().appId(str).setAdxId("207").setUserData("[{\"name\":\"mediation\",\"value\":\"google\"},{\"name\":\"adapter_version\",\"value\":\"8.2.0.4.0\"}]").build();
        this.f69479d.getClass();
        PAGSdk.init(context, pAGConfigBuild, this);
    }

    @Override // com.bytedance.sdk.openadsdk.api.init.PAGSdk.PAGInitCallback
    public final void fail(int i5, String str) {
        this.f69476a = false;
        this.f69477b = false;
        bg.a aVarM = z2.M(i5, str);
        ArrayList arrayList = this.f69478c;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((b) it.next()).a(aVarM);
        }
        arrayList.clear();
    }

    @Override // com.bytedance.sdk.openadsdk.api.init.PAGSdk.PAGInitCallback
    public final void success() {
        this.f69476a = false;
        this.f69477b = true;
        ArrayList arrayList = this.f69478c;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((b) it.next()).b();
        }
        arrayList.clear();
    }
}
