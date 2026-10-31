package vl;

import ai.b2;
import android.os.Bundle;
import com.google.android.gms.measurement.api.AppMeasurementSdk;
import com.google.firebase.abt.AbtException;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import nm.c;
import sg.w;
import xk.d1;
import yl.d;
import yl.e;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final c f92849a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f92850b = null;

    public b(c cVar) {
        this.f92849a = cVar;
    }

    public static boolean a(ArrayList arrayList, a aVar) {
        String strC = aVar.c();
        String strD = aVar.d();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            a aVar2 = (a) it.next();
            if (aVar2.c().equals(strC) && aVar2.d().equals(strD)) {
                return true;
            }
        }
        return false;
    }

    public final ArrayList b() {
        e eVar = (e) ((d) this.f92849a.get());
        eVar.getClass();
        ArrayList arrayList = new ArrayList();
        for (Bundle bundle : eVar.f97388a.getConditionalUserProperties("frc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            d1 d1Var = zl.a.f98562a;
            w.h(bundle);
            yl.c cVar = new yl.c();
            String str = (String) b2.e(bundle, "origin", String.class, null);
            w.h(str);
            cVar.f97374a = str;
            String str2 = (String) b2.e(bundle, PendingUpgradeStore.KEY_NAME, String.class, null);
            w.h(str2);
            cVar.f97375b = str2;
            cVar.f97376c = b2.e(bundle, "value", Object.class, null);
            cVar.f97377d = (String) b2.e(bundle, "trigger_event_name", String.class, null);
            cVar.f97378e = ((Long) b2.e(bundle, "trigger_timeout", Long.class, 0L)).longValue();
            cVar.f97379f = (String) b2.e(bundle, "timed_out_event_name", String.class, null);
            cVar.f97380g = (Bundle) b2.e(bundle, "timed_out_event_params", Bundle.class, null);
            cVar.f97381h = (String) b2.e(bundle, "triggered_event_name", String.class, null);
            cVar.f97382i = (Bundle) b2.e(bundle, "triggered_event_params", Bundle.class, null);
            cVar.f97383j = ((Long) b2.e(bundle, "time_to_live", Long.class, 0L)).longValue();
            cVar.f97384k = (String) b2.e(bundle, "expired_event_name", String.class, null);
            cVar.f97385l = (Bundle) b2.e(bundle, "expired_event_params", Bundle.class, null);
            cVar.n = ((Boolean) b2.e(bundle, "active", Boolean.class, Boolean.FALSE)).booleanValue();
            cVar.f97386m = ((Long) b2.e(bundle, "creation_timestamp", Long.class, 0L)).longValue();
            cVar.o = ((Long) b2.e(bundle, "triggered_timestamp", Long.class, 0L)).longValue();
            arrayList.add(cVar);
        }
        return arrayList;
    }

    public final void c(ArrayList arrayList) throws AbtException {
        Object obj;
        String str;
        String str2;
        String str3;
        c cVar = this.f92849a;
        if (cVar.get() == null) {
            throw new AbtException("The Analytics SDK is not available. Please check that the Analytics SDK is included in your app dependencies.");
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(a.b((Map) it.next()));
        }
        if (arrayList2.isEmpty()) {
            if (cVar.get() == null) {
                throw new AbtException("The Analytics SDK is not available. Please check that the Analytics SDK is included in your app dependencies.");
            }
            Iterator it2 = b().iterator();
            while (it2.hasNext()) {
                ((e) ((d) cVar.get())).f97388a.clearConditionalUserProperty(((yl.c) it2.next()).f97375b, null, null);
            }
            return;
        }
        if (cVar.get() == null) {
            throw new AbtException("The Analytics SDK is not available. Please check that the Analytics SDK is included in your app dependencies.");
        }
        ArrayList arrayListB = b();
        ArrayList arrayList3 = new ArrayList();
        Iterator it3 = arrayListB.iterator();
        while (it3.hasNext()) {
            arrayList3.add(a.a((yl.c) it3.next()));
        }
        ArrayList arrayList4 = new ArrayList();
        Iterator it4 = arrayList3.iterator();
        while (it4.hasNext()) {
            a aVar = (a) it4.next();
            if (!a(arrayList2, aVar)) {
                arrayList4.add(aVar.e());
            }
        }
        Iterator it5 = arrayList4.iterator();
        while (it5.hasNext()) {
            ((e) ((d) cVar.get())).f97388a.clearConditionalUserProperty(((yl.c) it5.next()).f97375b, null, null);
        }
        ArrayList arrayList5 = new ArrayList();
        Iterator it6 = arrayList2.iterator();
        while (it6.hasNext()) {
            a aVar2 = (a) it6.next();
            if (!a(arrayList3, aVar2)) {
                arrayList5.add(aVar2);
            }
        }
        ArrayDeque arrayDeque = new ArrayDeque(b());
        if (this.f92850b == null) {
            this.f92850b = Integer.valueOf(((e) ((d) cVar.get())).f97388a.getMaxUserProperties("frc"));
        }
        int iIntValue = this.f92850b.intValue();
        Iterator it7 = arrayList5.iterator();
        while (it7.hasNext()) {
            a aVar3 = (a) it7.next();
            while (arrayDeque.size() >= iIntValue) {
                ((e) ((d) cVar.get())).f97388a.clearConditionalUserProperty(((yl.c) arrayDeque.pollFirst()).f97375b, null, null);
            }
            yl.c cVarE = aVar3.e();
            e eVar = (e) ((d) cVar.get());
            eVar.getClass();
            d1 d1Var = zl.a.f98562a;
            String str4 = cVarE.f97374a;
            if (!str4.isEmpty() && (((obj = cVarE.f97376c) == null || b2.f(obj) != null) && zl.a.a(str4) && zl.a.c(str4, cVarE.f97375b) && (((str = cVarE.f97384k) == null || (zl.a.b(str, cVarE.f97385l) && zl.a.d(str4, cVarE.f97384k, cVarE.f97385l))) && (((str2 = cVarE.f97381h) == null || (zl.a.b(str2, cVarE.f97382i) && zl.a.d(str4, cVarE.f97381h, cVarE.f97382i))) && ((str3 = cVarE.f97379f) == null || (zl.a.b(str3, cVarE.f97380g) && zl.a.d(str4, cVarE.f97379f, cVarE.f97380g))))))) {
                AppMeasurementSdk appMeasurementSdk = eVar.f97388a;
                Bundle bundle = new Bundle();
                bundle.putString("origin", cVarE.f97374a);
                String str5 = cVarE.f97375b;
                if (str5 != null) {
                    bundle.putString(PendingUpgradeStore.KEY_NAME, str5);
                }
                Object obj2 = cVarE.f97376c;
                if (obj2 != null) {
                    b2.d(bundle, obj2);
                }
                String str6 = cVarE.f97377d;
                if (str6 != null) {
                    bundle.putString("trigger_event_name", str6);
                }
                bundle.putLong("trigger_timeout", cVarE.f97378e);
                String str7 = cVarE.f97379f;
                if (str7 != null) {
                    bundle.putString("timed_out_event_name", str7);
                }
                Bundle bundle2 = cVarE.f97380g;
                if (bundle2 != null) {
                    bundle.putBundle("timed_out_event_params", bundle2);
                }
                String str8 = cVarE.f97381h;
                if (str8 != null) {
                    bundle.putString("triggered_event_name", str8);
                }
                Bundle bundle3 = cVarE.f97382i;
                if (bundle3 != null) {
                    bundle.putBundle("triggered_event_params", bundle3);
                }
                bundle.putLong("time_to_live", cVarE.f97383j);
                String str9 = cVarE.f97384k;
                if (str9 != null) {
                    bundle.putString("expired_event_name", str9);
                }
                Bundle bundle4 = cVarE.f97385l;
                if (bundle4 != null) {
                    bundle.putBundle("expired_event_params", bundle4);
                }
                bundle.putLong("creation_timestamp", cVarE.f97386m);
                bundle.putBoolean("active", cVarE.n);
                bundle.putLong("triggered_timestamp", cVarE.o);
                appMeasurementSdk.setConditionalUserProperty(bundle);
            }
            arrayDeque.offer(cVarE);
        }
    }
}
