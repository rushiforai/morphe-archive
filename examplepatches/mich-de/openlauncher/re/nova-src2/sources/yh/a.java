package yh;

import a5.n1;
import ai.b3;
import ai.f3;
import ai.j2;
import ai.k1;
import ai.m1;
import ai.o0;
import ai.p4;
import ai.t2;
import ai.u;
import android.os.Bundle;
import android.os.SystemClock;
import b.kc;
import com.google.android.gms.measurement.internal.zzpl;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import sg.w;
import z.e;

/* loaded from: classes3.dex */
public final class a extends c {

    /* renamed from: a, reason: collision with root package name */
    public final m1 f97312a;

    /* renamed from: b, reason: collision with root package name */
    public final t2 f97313b;

    public a(m1 m1Var) {
        w.h(m1Var);
        this.f97312a = m1Var;
        t2 t2Var = m1Var.f13145m;
        m1.k(t2Var);
        this.f97313b = t2Var;
    }

    @Override // ai.u2
    public final void d(String str, String str2, Bundle bundle) {
        this.f97313b.H(str, str2, bundle);
    }

    @Override // ai.u2
    public final void e(Bundle bundle) {
        t2 t2Var = this.f97313b;
        ((m1) t2Var.f13368a).f13143k.getClass();
        t2Var.Q(bundle, System.currentTimeMillis());
    }

    @Override // ai.u2
    public final void f(String str) {
        m1 m1Var = this.f97312a;
        u uVar = m1Var.n;
        m1.i(uVar);
        m1Var.f13143k.getClass();
        uVar.F(SystemClock.elapsedRealtime(), str);
    }

    @Override // ai.u2
    public final void g(String str) {
        m1 m1Var = this.f97312a;
        u uVar = m1Var.n;
        m1.i(uVar);
        m1Var.f13143k.getClass();
        uVar.E(SystemClock.elapsedRealtime(), str);
    }

    @Override // ai.u2
    public final int h(String str) {
        t2 t2Var = this.f97313b;
        t2Var.getClass();
        w.e(str);
        ((m1) t2Var.f13368a).getClass();
        return 25;
    }

    @Override // ai.u2
    public final Map i(String str, String str2, boolean z11) {
        t2 t2Var = this.f97313b;
        m1 m1Var = (m1) t2Var.f13368a;
        k1 k1Var = m1Var.f13139g;
        o0 o0Var = m1Var.f13138f;
        m1.l(k1Var);
        if (k1Var.J()) {
            m1.l(o0Var);
            o0Var.f13190f.a("Cannot get user properties from analytics worker thread");
            return Collections.EMPTY_MAP;
        }
        if (kc.b()) {
            m1.l(o0Var);
            o0Var.f13190f.a("Cannot get user properties from main thread");
            return Collections.EMPTY_MAP;
        }
        AtomicReference atomicReference = new AtomicReference();
        k1 k1Var2 = m1Var.f13139g;
        m1.l(k1Var2);
        k1Var2.N(atomicReference, 5000L, "get user properties", new j2(t2Var, atomicReference, str, str2, z11));
        List<zzpl> list = (List) atomicReference.get();
        if (list == null) {
            m1.l(o0Var);
            o0Var.f13190f.b(Boolean.valueOf(z11), "Timed out waiting for handle get user properties, includeInternal");
            return Collections.EMPTY_MAP;
        }
        e eVar = new e(list.size());
        for (zzpl zzplVar : list) {
            Object objZza = zzplVar.zza();
            if (objZza != null) {
                eVar.put(zzplVar.f33786g, objZza);
            }
        }
        return eVar;
    }

    @Override // ai.u2
    public final void j(String str, String str2, Bundle bundle) {
        t2 t2Var = this.f97312a.f13145m;
        m1.k(t2Var);
        t2Var.R(str, str2, bundle);
    }

    @Override // ai.u2
    public final List k(String str, String str2) {
        t2 t2Var = this.f97313b;
        m1 m1Var = (m1) t2Var.f13368a;
        k1 k1Var = m1Var.f13139g;
        o0 o0Var = m1Var.f13138f;
        m1.l(k1Var);
        if (k1Var.J()) {
            m1.l(o0Var);
            o0Var.f13190f.a("Cannot get conditional user properties from analytics worker thread");
            return new ArrayList(0);
        }
        if (kc.b()) {
            m1.l(o0Var);
            o0Var.f13190f.a("Cannot get conditional user properties from main thread");
            return new ArrayList(0);
        }
        AtomicReference atomicReference = new AtomicReference();
        k1 k1Var2 = m1Var.f13139g;
        m1.l(k1Var2);
        k1Var2.N(atomicReference, 5000L, "get conditional user properties", new n1(t2Var, atomicReference, str, str2));
        List list = (List) atomicReference.get();
        if (list != null) {
            return p4.x0(list);
        }
        m1.l(o0Var);
        o0Var.f13190f.b(null, "Timed out waiting for get conditional user properties");
        return new ArrayList();
    }

    @Override // ai.u2
    public final String zzh() {
        f3 f3Var = ((m1) this.f97313b.f13368a).f13144l;
        m1.k(f3Var);
        b3 b3Var = f3Var.f12947c;
        if (b3Var != null) {
            return b3Var.f12867a;
        }
        return null;
    }

    @Override // ai.u2
    public final String zzi() {
        f3 f3Var = ((m1) this.f97313b.f13368a).f13144l;
        m1.k(f3Var);
        b3 b3Var = f3Var.f12947c;
        if (b3Var != null) {
            return b3Var.f12868b;
        }
        return null;
    }

    @Override // ai.u2
    public final String zzj() {
        return (String) this.f97313b.f13341g.get();
    }

    @Override // ai.u2
    public final String zzk() {
        return this.f97313b.S();
    }

    @Override // ai.u2
    public final long zzl() {
        p4 p4Var = this.f97312a.f13141i;
        m1.j(p4Var);
        return p4Var.B0();
    }
}
