package b6;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.util.Log;
import b.c0;
import b70.k;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.stripe.android.challenge.confirmation.BridgeSuccessParams;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.paymentsheet.analytics.EventReporter$Mode;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.model.o;
import java.lang.reflect.InvocationHandler;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import mk.m;
import ni.g0;
import ni.v;
import ni.z;
import org.chromium.support_lib_boundary.SpeculativeLoadingParametersBoundaryInterface;
import org.json.JSONException;
import org.json.JSONObject;
import sp.m0;
import tk.l;
import tk.s;

/* loaded from: classes2.dex */
public final class b implements z, g60.a, j30.e, k6.b, dr.b, ke.c, m, SpeculativeLoadingParametersBoundaryInterface, fi.i, l, sg.j, sp.a, u60.c {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ b f17563a = new b();

    public static final String f(PaymentSelection paymentSelection) {
        if (paymentSelection instanceof PaymentSelection.GooglePay) {
            return "googlepay";
        }
        if (paymentSelection instanceof PaymentSelection.Saved) {
            return "savedpm";
        }
        if ((paymentSelection instanceof PaymentSelection.Link) || (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) || (paymentSelection instanceof PaymentSelection.CustomPaymentMethod) || (paymentSelection instanceof PaymentSelection.New)) {
            return o.b(paymentSelection) ? "link" : "newpm";
        }
        if (paymentSelection == null) {
            return "unknown";
        }
        if (paymentSelection instanceof PaymentSelection.ShopPay) {
            return "shop_pay";
        }
        throw new NoWhenBranchMatchedException();
    }

    public static final Map h(List list) {
        if (list.isEmpty()) {
            list = null;
        }
        Map mapE0 = list != null ? k.e0(new Pair(n.f39151e, list)) : null;
        return mapE0 == null ? b70.h.f17594a : mapE0;
    }

    public static final String i(EventReporter$Mode eventReporter$Mode, String str) {
        return "mc_" + eventReporter$Mode + "_" + str;
    }

    public static ft.b l(String str) {
        Object next;
        i70.a aVar = ft.b.f55896z;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            if (r70.j.B0(((ft.b) next).f55897a, str, true)) {
                break;
            }
        }
        ft.b bVar = (ft.b) next;
        return bVar == null ? ft.b.f55894x : bVar;
    }

    public static String m(String str) {
        return c0.k("https://api.stripe.com/v1/", str);
    }

    public static String o(String str, Object... objArr) {
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        Locale locale = Locale.ENGLISH;
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        return m(String.format(locale, str, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length)));
    }

    public static List p(String str) {
        if (str == null || r70.k.U0(str)) {
            return ft.b.n;
        }
        ArrayList arrayListR = r(str);
        if (arrayListR.isEmpty()) {
            arrayListR = null;
        }
        return arrayListR == null ? ul.b.P(ft.b.f55894x) : arrayListR;
    }

    public static ArrayList r(String str) {
        Matcher matcher;
        i70.a aVar = ft.b.f55896z;
        ArrayList arrayList = new ArrayList();
        aVar.getClass();
        b70.a aVar2 = new b70.a(aVar);
        while (aVar2.hasNext()) {
            Object next = aVar2.next();
            ft.b bVar = (ft.b) next;
            Pattern pattern = (Pattern) bVar.f55905i.get(Integer.valueOf(str.length()));
            if (pattern == null) {
                pattern = bVar.f55904h;
            }
            if (pattern != null && (matcher = pattern.matcher(str)) != null && matcher.matches()) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Object next2 = it.next();
            if (((ft.b) next2).f55907k) {
                arrayList2.add(next2);
            }
        }
        return arrayList2;
    }

    @Override // tk.m
    public /* synthetic */ Object a() {
        return new s("StandardIntegrity");
    }

    @Override // sg.j
    public /* bridge */ /* synthetic */ Object b(qg.k kVar) {
        return null;
    }

    @Override // ke.c
    public long c(long j11) {
        return j11;
    }

    @Override // u60.c
    public boolean d(u60.j jVar) {
        String str = jVar.f90659a;
        return ("class-name".equals(str) || "boolean".equals(str)) ? false : true;
    }

    @Override // ni.z
    public void e(String preloadId) {
        Intrinsics.g(preloadId, "preloadId");
    }

    @Override // g60.a
    public Object g(c60.d dVar) {
        return dVar.I;
    }

    @Override // org.chromium.support_lib_boundary.SpeculativeLoadingParametersBoundaryInterface
    public Map getAdditionalHeaders() {
        return new HashMap();
    }

    @Override // org.chromium.support_lib_boundary.SpeculativeLoadingParametersBoundaryInterface
    public InvocationHandler getNoVarySearchData() {
        return null;
    }

    @Override // org.chromium.support_lib_boundary.SpeculativeLoadingParametersBoundaryInterface
    public boolean isJavaScriptEnabled() {
        return false;
    }

    @Override // ni.z
    public void j(String preloadId, v vVar) {
        Intrinsics.g(preloadId, "preloadId");
        Log.w("NovaAds", "Preload failed: " + preloadId + " code=" + vVar.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String() + " msg=" + vVar.getCom.bytedance.sdk.component.pglcrypt.PglCryptUtils.KEY_MESSAGE java.lang.String());
    }

    @Override // ni.z
    public void k(String preloadId, g0 responseInfo) {
        Intrinsics.g(preloadId, "preloadId");
        Intrinsics.g(responseInfo, "responseInfo");
    }

    @Override // sp.a
    public boolean n(m0 m0Var, int i5, String str) {
        if (i5 == 413) {
            m0.a("e102");
            return true;
        }
        if (i5 != 200) {
            m0.a("e103");
            return false;
        }
        try {
            if (new JSONObject(str).optString("status", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equalsIgnoreCase("ok")) {
                return true;
            }
        } catch (JSONException unused) {
            int i11 = sp.k.f87599b;
            m0.a("e21");
        }
        m0.a("e115");
        return false;
    }

    @Override // j30.e
    public void onCancel() {
        synchronized (this) {
            notifyAll();
        }
    }

    public sx.i q(Context context) {
        sx.i iVar;
        sx.i iVar2 = sx.i.f87783j;
        if (iVar2 != null) {
            return iVar2;
        }
        synchronized (this) {
            iVar = sx.i.f87783j;
            if (iVar == null) {
                iVar = new sx.i(context.getApplicationContext(), null, null, 14);
                sx.i.f87783j = iVar;
            }
        }
        return iVar;
    }

    @Override // dr.b
    public StripeModel s(JSONObject jSONObject) {
        String strOptString = jSONObject.optString("client_secret");
        Intrinsics.d(strOptString);
        if (r70.k.U0(strOptString)) {
            strOptString = null;
        }
        if (strOptString == null) {
            return null;
        }
        return new BridgeSuccessParams(strOptString);
    }

    public byte t(e80.h hVar, int i5) {
        return hVar.f52260a[hVar.f52261b + i5];
    }

    @Override // fi.i
    public Task then(Object obj) {
        Bundle bundle = (Bundle) obj;
        int i5 = og.a.f80378h;
        return (bundle == null || !bundle.containsKey("google.messenger")) ? Tasks.d(bundle) : Tasks.d(null);
    }

    @Override // mk.m
    public Object a(IBinder iBinder) {
        int i5 = lk.e.f74984b;
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.hsdp.protocol.IHsdpService");
        return iInterfaceQueryLocalInterface instanceof lk.f ? (lk.f) iInterfaceQueryLocalInterface : new lk.d(iBinder, "com.google.android.play.core.hsdp.protocol.IHsdpService", 6);
    }
}
