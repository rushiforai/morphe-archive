package ai;

import android.os.Bundle;
import com.google.android.gms.measurement.internal.zzr;
import java.util.concurrent.Callable;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class r1 implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13275a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f13276b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f13277c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f13278d;

    public /* synthetic */ r1(t1 t1Var, zzr zzrVar, Bundle bundle, int i5) {
        this.f13275a = i5;
        this.f13276b = zzrVar;
        this.f13277c = bundle;
        this.f13278d = t1Var;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f13275a) {
            case 0:
                t1 t1Var = (t1) this.f13278d;
                t1Var.f13334a.V();
                return t1Var.f13334a.d0((Bundle) this.f13277c, (zzr) this.f13276b);
            case 1:
                t1 t1Var2 = (t1) this.f13278d;
                t1Var2.f13334a.V();
                return t1Var2.f13334a.d0((Bundle) this.f13277c, (zzr) this.f13276b);
            default:
                return Boolean.valueOf(((com.google.android.gms.internal.consent_sdk.j0) this.f13276b).c((String) this.f13277c, (JSONObject) this.f13278d));
        }
    }

    public /* synthetic */ r1(com.google.android.gms.internal.consent_sdk.j0 j0Var, String str, JSONObject jSONObject) {
        this.f13275a = 2;
        this.f13276b = j0Var;
        this.f13277c = str;
        this.f13278d = jSONObject;
    }
}
