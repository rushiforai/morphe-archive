package ads_mobile_sdk;

import android.os.Bundle;
import hn.n;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import ni.w;

/* loaded from: classes2.dex */
public final class i8 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f4657a;

    /* renamed from: b, reason: collision with root package name */
    public String f4658b;

    /* renamed from: c, reason: collision with root package name */
    public hv f4659c;

    /* renamed from: d, reason: collision with root package name */
    public com.google.gson.r f4660d;

    /* renamed from: e, reason: collision with root package name */
    public ni.l f4661e;

    /* renamed from: f, reason: collision with root package name */
    public List f4662f;

    /* renamed from: g, reason: collision with root package name */
    public final Map f4663g;

    public i8(jr0 flags) {
        Intrinsics.g(flags, "flags");
        this.f4657a = flags;
        this.f4662f = Collections.synchronizedList(new ArrayList());
        this.f4663g = Collections.synchronizedMap(new LinkedHashMap());
    }

    public final void a(z1 z1Var, int i5) {
        String str = z1Var.f12373d;
        if (str.length() == 0) {
            return;
        }
        Map adapterKeyToAdapterResponseInfo = this.f4663g;
        Intrinsics.f(adapterKeyToAdapterResponseInfo, "adapterKeyToAdapterResponseInfo");
        if (adapterKeyToAdapterResponseInfo.containsKey(str)) {
            return;
        }
        ni.l lVar = new ni.l(z1Var.f12377f, 0L, null, d62.b(z1Var.f12371c), z1Var.f12381h, z1Var.f12383i, z1Var.f12385j, z1Var.f12387k);
        this.f4662f.add(i5, lVar);
        Intrinsics.f(adapterKeyToAdapterResponseInfo, "adapterKeyToAdapterResponseInfo");
        adapterKeyToAdapterResponseInfo.put(str, lVar);
    }

    public final ni.g0 a() {
        if (this.f4659c == null) {
            return null;
        }
        ni.l lVar = this.f4661e;
        String strB = lVar != null ? lVar.getAdapterClassName() : null;
        String str = this.f4658b;
        Bundle bundleA = a(null);
        ni.l lVar2 = this.f4661e;
        List adapterResponses = this.f4662f;
        Intrinsics.f(adapterResponses, "adapterResponses");
        return new ni.g0(strB, str, bundleA, lVar2, adapterResponses);
    }

    public final Bundle a(com.google.gson.r rVar) {
        hv hvVar = this.f4659c;
        if (hvVar != null) {
            com.google.gson.r rVar2 = hvVar.f4561q;
            com.google.gson.r rVar3 = this.f4660d;
            if (rVar3 == null) {
                rVar3 = new com.google.gson.r();
            }
            com.google.gson.r rVarC = rVar2.c();
            Iterator it = ((hn.m) rVar3.f34795a.entrySet()).iterator();
            while (((hn.l) it).hasNext()) {
                n nVarB = ((hn.l) it).b();
                rVarC.p((String) nVarB.getKey(), (com.google.gson.p) nVarB.getValue());
            }
            if (rVar != null) {
                jr0 jr0Var = this.f4657a;
                jr0Var.getClass();
                if (((Boolean) jr0Var.a("gads:enable_ad_specific_response_info_extras:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                    Iterator it2 = ((hn.m) rVar.f34795a.entrySet()).iterator();
                    while (((hn.l) it2).hasNext()) {
                        n nVarB2 = ((hn.l) it2).b();
                        rVarC.p((String) nVarB2.getKey(), (com.google.gson.p) nVarB2.getValue());
                    }
                }
            }
            Bundle bundleB = d62.b(rVarC);
            if (bundleB.containsKey("ad_value") && (bundleB.get("ad_value") instanceof Integer)) {
                bundleB.putDouble("ad_value", bundleB.getInt("ad_value"));
            }
            return bundleB;
        }
        Intrinsics.m("commonConfiguration");
        throw null;
    }

    public final void a(z1 z1Var, long j11, w wVar) {
        String str = z1Var.f12373d;
        Map map = this.f4663g;
        ni.l lVar = (ni.l) map.get(str);
        if (lVar == null) {
            return;
        }
        ni.l lVar2 = new ni.l(lVar.getAdapterClassName(), Duration.h(j11), wVar, lVar.getCredentials(), lVar.getName(), lVar.getId(), lVar.getInstanceName(), lVar.getInstanceId());
        map.put(str, lVar2);
        this.f4662f.set(this.f4662f.indexOf(lVar), lVar2);
    }
}
