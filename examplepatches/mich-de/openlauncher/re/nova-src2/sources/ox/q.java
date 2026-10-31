package ox;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import b00.z0;
import com.google.android.gms.common.ConnectionResult;
import dx.n0;
import dx.q0;
import gx.b0;
import h6.a0;
import h6.g1;
import h6.y0;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.coroutines.Continuation;
import kw.s3;
import l10.z;
import mk.w;
import mx.h1;
import n0.i0;
import p0.y;
import p1.m2;
import t70.g2;
import t70.m0;

/* loaded from: classes4.dex */
public final class q implements sg.d {

    /* renamed from: a, reason: collision with root package name */
    public boolean f81101a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f81102b;

    /* renamed from: c, reason: collision with root package name */
    public Object f81103c;

    /* renamed from: d, reason: collision with root package name */
    public Object f81104d;

    /* renamed from: e, reason: collision with root package name */
    public Object f81105e;

    /* renamed from: f, reason: collision with root package name */
    public Object f81106f;

    public q(rg.e eVar, qg.c cVar, rg.a aVar) {
        Objects.requireNonNull(eVar);
        this.f81106f = eVar;
        this.f81104d = null;
        this.f81105e = null;
        this.f81101a = false;
        this.f81102b = cVar;
        this.f81103c = aVar;
    }

    public static final void b(q qVar, View view) {
        a0 a0VarC;
        cw.q qVar2 = (cw.q) qVar.f81103c;
        if (qVar2 == null) {
            return;
        }
        qVar2.f48267b = true;
        g2 g2Var = (g2) qVar.f81106f;
        Continuation continuation = null;
        if (g2Var != null) {
            g2Var.c(null);
        }
        qVar.f81106f = null;
        boolean zB = h1.b();
        boolean zD = fy.a.d();
        if (zB || zD || !px.c.f83110a.e(view.getContext()) || (a0VarC = y0.c(view)) == null) {
            return;
        }
        qVar.f81106f = m0.t(g1.e(a0VarC), null, null, new s3(a0VarC, qVar, qVar2, continuation, 25), 3);
    }

    public static final q c() {
        return new q("smart_group_icon");
    }

    public static final q g(ViewGroup viewGroup, String str, z0 z0Var) {
        q qVar = new q(str);
        qVar.f81103c = new cw.q(new z(z0Var, 8));
        qVar.f81104d = viewGroup;
        eb.f fVar = new eb.f(qVar, 5);
        qVar.f81105e = fVar;
        viewGroup.addOnAttachStateChangeListener(fVar);
        if (viewGroup.isAttachedToWindow()) {
            b(qVar, viewGroup);
        }
        return qVar;
    }

    @Override // sg.d
    public void a(ConnectionResult connectionResult) {
        ((rg.e) this.f81106f).n.post(new w((Object) this, (Object) connectionResult, false, 15));
    }

    public void d() {
        View view;
        g2 g2Var = (g2) this.f81106f;
        if (g2Var != null) {
            g2Var.c(null);
        }
        this.f81106f = null;
        eb.f fVar = (eb.f) this.f81105e;
        if (fVar != null && (view = (View) this.f81104d) != null) {
            view.removeOnAttachStateChangeListener(fVar);
        }
        this.f81105e = null;
        this.f81104d = null;
        cw.q qVar = (cw.q) this.f81103c;
        if (qVar != null) {
            qVar.f48267b = false;
            if (qVar.f48266a) {
                qVar.f48266a = false;
                ((z) qVar.f48268c).invoke(Boolean.FALSE);
            }
        }
    }

    public float e() {
        return ((m2) this.f81104d).m();
    }

    public boolean f() {
        cw.q qVar = (cw.q) this.f81103c;
        return qVar != null ? qVar.f48266a : this.f81101a;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x008d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void h(Context context) {
        boolean zContains;
        String str;
        List<dx.f> list;
        boolean zB = h1.b();
        boolean zD = fy.a.d();
        boolean z11 = false;
        z11 = false;
        z11 = false;
        z11 = false;
        if (!zB && !zD && px.c.f83110a.e(context)) {
            AtomicReference atomicReference = n0.f49747a;
            String str2 = (String) this.f81102b;
            dx.t.a(str2);
            b0 b0Var = (b0) n0.f49747a.get();
            if (b0Var != null) {
                q0 q0Var = (q0) ((dx.h) b0Var.f58030e.getValue()).f49705a.get(new dx.t(str2));
                Continuation continuation = null;
                if (q0Var == null || (list = q0Var.f49763b) == null) {
                    str = null;
                    if (str != null) {
                        zContains = false;
                    } else {
                        if (b0Var.f58041r) {
                            m0.t(b0Var.f58029d, null, null, new gx.s(b0Var, str, continuation, z11 ? 1 : 0), 3);
                        }
                        zContains = ((Set) b0Var.f58034i.f53134h.f93973a.getValue()).contains(str);
                    }
                    if (zContains) {
                        z11 = true;
                    }
                } else {
                    for (dx.f fVar : list) {
                        dx.c cVar = fVar instanceof dx.c ? (dx.c) fVar : null;
                        str = cVar != null ? cVar.f49688b : null;
                        if (str != null) {
                            break;
                        }
                    }
                    str = null;
                    if (str != null) {
                    }
                    if (zContains) {
                    }
                }
            }
        }
        this.f81101a = z11;
    }

    public void i() {
        this.f81101a = false;
    }

    public void j(ConnectionResult connectionResult) {
        rg.p pVar = (rg.p) ((rg.e) this.f81106f).f85883j.get((rg.a) this.f81103c);
        if (pVar != null) {
            pVar.k(connectionResult);
        }
    }

    public q(int i5, float f11, y yVar) {
        this.f81102b = yVar;
        this.f81103c = androidx.compose.runtime.d.g(i5);
        this.f81104d = androidx.compose.runtime.d.f(f11);
        this.f81106f = new i0(i5, 30, 100);
    }

    public q(String str) {
        this.f81102b = str;
    }
}
