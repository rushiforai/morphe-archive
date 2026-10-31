package b;

import ads_mobile_sdk.a63;
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
public final /* synthetic */ class j implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15894a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ub f15895b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Context f15896c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f15897d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ View f15898e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Activity f15899f;

    public /* synthetic */ j(ub ubVar, Context context, String str, View view, Activity activity, int i5) {
        this.f15894a = i5;
        this.f15895b = ubVar;
        this.f15896c = context;
        this.f15897d = str;
        this.f15898e = view;
        this.f15899f = activity;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        String strA;
        switch (this.f15894a) {
            case 0:
                a63 a63Var = (a63) this.f15895b;
                Context context = this.f15896c;
                String str = this.f15897d;
                View view = this.f15898e;
                Activity activity = this.f15899f;
                HashMap map = new HashMap();
                a63Var.f870h.a(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_STATE, new f(a63Var, map, context, view, activity, str, 1));
                String strA2 = a63Var.a(map);
                map.clear();
                return strA2;
            case 1:
                a63 a63Var2 = (a63) this.f15895b;
                Context context2 = this.f15896c;
                String str2 = this.f15897d;
                View view2 = this.f15898e;
                Activity activity2 = this.f15899f;
                HashMap map2 = new HashMap();
                a63Var2.f870h.a(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_STATE, new f(a63Var2, map2, context2, view2, activity2, str2, 0));
                String strA3 = a63Var2.a(map2);
                map2.clear();
                return strA3;
            default:
                w53 w53Var = (w53) this.f15895b;
                Context context3 = this.f15896c;
                String str3 = this.f15897d;
                View view3 = this.f15898e;
                Activity activity3 = this.f15899f;
                ai.y0 y0VarA = w53Var.f11048a.a();
                if (y0VarA == null) {
                    w53Var.f11051d.b(yk0.EVENT_ID_DG_ENGINE_NULL_HANDLE);
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                synchronized (y0VarA) {
                    try {
                        wi0 wi0Var = (wi0) y0VarA.f13476d;
                        ub3 ub3Var = wi0Var.f11289b;
                        ub3Var.getClass();
                        HashMap map3 = new HashMap();
                        Iterator it = ub3Var.f10287a.iterator();
                        while (it.hasNext()) {
                            ((j1) it.next()).b(map3);
                        }
                        wi0Var.a(map3);
                        map3.put(InneractiveMediationDefs.GENDER_FEMALE, "c");
                        map3.put("ctx", context3);
                        map3.put("cs", str3);
                        map3.put("aid", null);
                        map3.put("view", view3);
                        map3.put("act", activity3);
                        byte[] bArrA = y0VarA.a(map3);
                        if (y0VarA.f13474b) {
                            map3.clear();
                        }
                        strA = ai.y0.a(bArrA);
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (strA != null) {
                    return strA;
                }
                w53Var.f11051d.b(yk0.EVENT_ID_DG_ENGINE_NULL_CLICK_SIGNALS);
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }
}
