package b;

import ads_mobile_sdk.oc3;
import ads_mobile_sdk.rm2;
import ads_mobile_sdk.ub3;
import ads_mobile_sdk.w53;
import ads_mobile_sdk.wi0;
import ads_mobile_sdk.yk0;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.Callable;

/* loaded from: classes2.dex */
public final /* synthetic */ class p7 implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15975a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15976b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f15977c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f15978d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f15979e;

    public /* synthetic */ p7(oc3 oc3Var, rm2 rm2Var, byte[] bArr, byte[] bArr2) {
        this.f15976b = oc3Var;
        this.f15977c = rm2Var;
        this.f15978d = bArr;
        this.f15979e = bArr2;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        String strA;
        switch (this.f15975a) {
            case 0:
                oc3 oc3Var = (oc3) this.f15976b;
                oc3Var.f7830a.a((rm2) this.f15977c, (byte[]) this.f15978d, (byte[]) this.f15979e);
                return null;
            default:
                w53 w53Var = (w53) this.f15976b;
                Context context = (Context) this.f15977c;
                View view = (View) this.f15978d;
                Activity activity = (Activity) this.f15979e;
                ai.y0 y0VarA = w53Var.f11048a.a();
                if (y0VarA == null) {
                    w53Var.f11051d.b(yk0.EVENT_ID_DG_ENGINE_NULL_HANDLE);
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                synchronized (y0VarA) {
                    try {
                        wi0 wi0Var = (wi0) y0VarA.f13476d;
                        ub3 ub3Var = wi0Var.f11289b;
                        Context context2 = wi0Var.f11288a;
                        ub3Var.getClass();
                        HashMap map = new HashMap();
                        Iterator it = ub3Var.f10287a.iterator();
                        while (it.hasNext()) {
                            ((j1) it.next()).a(map, context2, null);
                        }
                        wi0Var.a(map);
                        map.put(InneractiveMediationDefs.GENDER_FEMALE, "v");
                        map.put("ctx", context);
                        map.put("aid", null);
                        map.put("view", view);
                        map.put("act", activity);
                        byte[] bArrA = y0VarA.a(map);
                        if (y0VarA.f13474b) {
                            map.clear();
                        }
                        strA = ai.y0.a(bArrA);
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (strA != null) {
                    return strA;
                }
                w53Var.f11051d.b(yk0.EVENT_ID_DG_ENGINE_NULL_VIEW_SIGNALS);
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public /* synthetic */ p7(w53 w53Var, Context context, String str, View view, Activity activity) {
        this.f15976b = w53Var;
        this.f15977c = context;
        this.f15978d = view;
        this.f15979e = activity;
    }
}
