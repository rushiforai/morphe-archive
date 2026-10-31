package wm;

import a5.a0;
import a5.h2;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.util.Log;
import android.view.Display;
import android.view.View;
import androidx.core.graphics.Insets;
import com.android.launcher3.folder.Folder;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.android.material.appbar.AppBarLayout;
import com.google.firebase.abt.AbtException;
import com.google.firebase.crashlytics.internal.CrashlyticsRemoteConfigListener;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;
import com.stripe.android.PaymentConfiguration;
import com.stripe.android.view.CardNumberEditText;
import com.stripe.android.view.PaymentAuthWebViewActivity;
import dq.o;
import dv.r;
import fi.i;
import ga.j;
import io.branch.search.internal.AbstractC3080b9;
import io.branch.search.internal.Af;
import io.branch.search.internal.C3371sd;
import io.branch.search.internal.C3411v2;
import io.branch.search.internal.M4;
import io.branch.search.internal.P4;
import io.branch.search.internal.U5;
import io.sentry.j2;
import io.sentry.m0;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;
import x7.l;
import xf.n;
import xm.h;
import ya.w;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements fi.c, w60.a, a0, i, w, fi.g, M4.f, j2, Af.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94596a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f94597b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f94596a = i5;
        this.f94597b = obj;
    }

    @Override // io.branch.search.internal.M4.f
    public void a(M4.e eVar) {
        P4.a((U5) this.f94597b, eVar);
    }

    public void b(Display display) {
        n nVar = (n) this.f94597b;
        nVar.getClass();
        if (display != null) {
            long refreshRate = (long) (1.0E9d / display.getRefreshRate());
            nVar.f95818k = refreshRate;
            nVar.f95819l = (refreshRate * 80) / 100;
        } else {
            wf.a.D("VideoFrameReleaseHelper", "Unable to query display refresh rate");
            nVar.f95818k = -9223372036854775807L;
            nVar.f95819l = -9223372036854775807L;
        }
    }

    @Override // w60.a
    public Object get() {
        int i5 = this.f94596a;
        Object obj = this.f94597b;
        switch (i5) {
            case 1:
                int i11 = CardNumberEditText.L;
                return (String) ((n00.d) obj).invoke();
            default:
                Context context = (Context) ((r) obj).f49639b;
                Intrinsics.g(context, "context");
                PaymentConfiguration paymentConfiguration = PaymentConfiguration.f42439c;
                if (paymentConfiguration == null) {
                    SharedPreferences sharedPreferences = new o(context).f49358a;
                    String string = sharedPreferences.getString("key_publishable_key", null);
                    paymentConfiguration = string != null ? new PaymentConfiguration(string, sharedPreferences.getString("key_account_id", null)) : null;
                    if (paymentConfiguration == null) {
                        throw new IllegalStateException("PaymentConfiguration was not initialized. Call PaymentConfiguration.init().");
                    }
                    PaymentConfiguration.f42439c = paymentConfiguration;
                }
                return paymentConfiguration;
        }
    }

    @Override // io.sentry.j2
    public void j(m0 m0Var) {
        C3371sd.a.a((AbstractC3080b9) this.f94597b, m0Var);
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        j jVar = (j) this.f94597b;
        Rect rect = Folder.f21093j0;
        return eVar == jVar;
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        ((xu.c) this.f94597b).invoke(obj);
    }

    @Override // fi.i
    public Task then(Object obj) {
        return Tasks.d((h) this.f94597b);
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        PaymentAuthWebViewActivity paymentAuthWebViewActivity = (PaymentAuthWebViewActivity) this.f94597b;
        int i5 = PaymentAuthWebViewActivity.f45487s;
        Intrinsics.g(view, "view");
        Insets insetsG = h2Var.f296a.g(7);
        Intrinsics.f(insetsG, "getInsets(...)");
        AppBarLayout appBarLayout = paymentAuthWebViewActivity.b0().f82829b;
        appBarLayout.setPaddingRelative(appBarLayout.getPaddingStart(), insetsG.top, appBarLayout.getPaddingEnd(), appBarLayout.getPaddingBottom());
        view.setPaddingRelative(view.getPaddingStart(), view.getPaddingTop(), view.getPaddingEnd(), insetsG.bottom);
        return h2.f295b;
    }

    @Override // io.branch.search.internal.Af.b
    public void a(List list) {
        C3411v2.a((C3411v2) this.f94597b, list);
    }

    @Override // fi.c
    public Object then(Task task) throws JSONException {
        boolean z11;
        c cVar = (c) this.f94597b;
        if (task.q()) {
            xm.c cVar2 = cVar.f94601d;
            synchronized (cVar2) {
                cVar2.f96101c = Tasks.d(null);
            }
            xm.o oVar = cVar2.f96100b;
            synchronized (oVar) {
                oVar.f96171a.deleteFile(oVar.f96172b);
            }
            xm.e eVar = (xm.e) task.m();
            if (eVar != null) {
                JSONArray jSONArray = eVar.f96112d;
                vl.b bVar = cVar.f94599b;
                if (bVar != null) {
                    try {
                        bVar.c(c.e(jSONArray));
                    } catch (AbtException e3) {
                        Log.w("FirebaseRemoteConfig", "Could not update ABT experiments.", e3);
                    } catch (JSONException e11) {
                        Log.e("FirebaseRemoteConfig", "Could not parse ABT experiments from the JSON response.", e11);
                    }
                }
                x7.h hVar = cVar.f94608k;
                try {
                    an.d dVarH = ((l) hVar.f95138c).h(eVar);
                    Iterator it = ((Set) hVar.f95140e).iterator();
                    while (it.hasNext()) {
                        ((Executor) hVar.f95139d).execute(new ym.a((CrashlyticsRemoteConfigListener) it.next(), dVarH, 1));
                    }
                } catch (FirebaseRemoteConfigException e12) {
                    Log.w("FirebaseRemoteConfig", "Exception publishing RolloutsState to subscribers. Continuing to listen for changes.", e12);
                }
            } else {
                Log.e("FirebaseRemoteConfig", "Activated configs written to disk are null.");
            }
            z11 = true;
        } else {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }
}
