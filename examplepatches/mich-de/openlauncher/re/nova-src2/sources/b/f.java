package b;

import ads_mobile_sdk.a63;
import ads_mobile_sdk.ub3;
import android.app.Activity;
import android.content.Context;
import android.os.Trace;
import android.view.View;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;

/* loaded from: classes2.dex */
public final /* synthetic */ class f implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15835a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15836b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Serializable f15837c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f15838d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f15839e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f15840f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f15841g;

    public /* synthetic */ f(Object obj, Serializable serializable, Object obj2, Object obj3, Object obj4, Object obj5, int i5) {
        this.f15835a = i5;
        this.f15836b = obj;
        this.f15837c = serializable;
        this.f15838d = obj2;
        this.f15839e = obj3;
        this.f15840f = obj4;
        this.f15841g = obj5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        z1.b bVarC;
        int i5 = this.f15835a;
        Object obj = this.f15841g;
        Object obj2 = this.f15840f;
        Object obj3 = this.f15839e;
        Object obj4 = this.f15838d;
        Serializable serializable = this.f15837c;
        Object obj5 = this.f15836b;
        switch (i5) {
            case 0:
                a63 a63Var = (a63) obj5;
                HashMap map = (HashMap) serializable;
                Context context = (Context) obj4;
                View view = (View) obj3;
                Activity activity = (Activity) obj2;
                String str = (String) obj;
                ub3 ub3Var = a63Var.f869g;
                ub3Var.getClass();
                HashMap map2 = new HashMap();
                Iterator it = ub3Var.f10287a.iterator();
                while (it.hasNext()) {
                    ((j1) it.next()).b(map2);
                }
                map.putAll(map2);
                a63Var.m0a(map);
                map.put(InneractiveMediationDefs.GENDER_FEMALE, "c");
                map.put("ctx", context);
                map.put("view", view);
                map.put("act", activity);
                map.put("bds", str);
                return;
            case 1:
                a63 a63Var2 = (a63) obj5;
                HashMap map3 = (HashMap) serializable;
                Context context2 = (Context) obj4;
                View view2 = (View) obj3;
                Activity activity2 = (Activity) obj2;
                String str2 = (String) obj;
                ub3 ub3Var2 = a63Var2.f869g;
                ub3Var2.getClass();
                HashMap map4 = new HashMap();
                Iterator it2 = ub3Var2.f10287a.iterator();
                while (it2.hasNext()) {
                    ((j1) it2.next()).a(map4, context2, view2);
                }
                map3.putAll(map4);
                a63Var2.m0a(map3);
                map3.put(InneractiveMediationDefs.GENDER_FEMALE, "v");
                map3.put("ctx", context2);
                map3.put("view", view2);
                map3.put("act", activity2);
                map3.put("bds", str2);
                return;
            default:
                m3.p0 p0Var = (m3.p0) obj5;
                y3.n nVar = (y3.n) serializable;
                List list = (List) obj4;
                m3.g gVar = (m3.g) obj3;
                y3.c cVar = (y3.c) obj2;
                q3.o oVar = (q3.o) obj;
                Trace.beginSection("BackgroundTextMeasurement");
                try {
                    z1.f fVarK = z1.k.k();
                    z1.b bVar = fVarK instanceof z1.b ? (z1.b) fVarK : null;
                    if (bVar == null || (bVarC = bVar.C(null, null)) == null) {
                        throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
                    }
                    try {
                        z1.f fVarJ = bVarC.j();
                        try {
                            m3.p0 p0VarN = fg.a.N(p0Var, nVar);
                            if (list == null) {
                                list = EmptyList.f71733a;
                            }
                            new qp.i(gVar, p0VarN, list, cVar, oVar).b();
                            Unit unit = Unit.f71706a;
                            z1.f.q(fVarJ);
                            bVarC.w().e();
                            return;
                        } catch (Throwable th2) {
                            z1.f.q(fVarJ);
                            throw th2;
                        }
                    } finally {
                    }
                } finally {
                    Trace.endSection();
                }
        }
    }
}
