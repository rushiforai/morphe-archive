package defpackage;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewConfiguration;
import com.medium.reader.R;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u12 {
    public final View a;
    public final l22 b;
    public final iy6 c;
    public final hpb d;
    public final wue e;
    public final ey5 f;
    public final pcb g;
    public final Configuration h;
    public final l78 i;
    public final bm j;
    public final jt k;
    public final um l;
    public final tm m;
    public final uy4 n;
    public final l78 o;
    public final li5 p;
    public final rt q;
    public final cq6 r;
    public final ax6 s;
    public final h61 t;
    public int u;
    public final ir v;
    public final t12 w;

    public u12(u12 u12Var, View view, l22 l22Var, iy6 iy6Var, hpb hpbVar, wue wueVar) {
        ey5 ey5Var;
        Configuration configuration;
        l78 l78VarU;
        bm bmVar;
        jt jtVar;
        um umVar;
        tm tmVar;
        uy4 z46Var;
        l78 k49Var;
        rt rtVar;
        boolean zL = g76.L(u12Var != null ? u12Var.a.getContext() : null, view.getContext());
        this.a = view;
        this.b = l22Var;
        this.c = iy6Var;
        this.d = hpbVar;
        this.e = wueVar;
        if (zL) {
            u12Var.getClass();
            ey5Var = u12Var.f;
        } else {
            ey5Var = new ey5();
        }
        this.f = ey5Var;
        this.g = u12Var != null ? u12Var.g : new pcb();
        if (zL) {
            u12Var.getClass();
            configuration = u12Var.h;
        } else {
            configuration = new Configuration(view.getContext().getResources().getConfiguration());
        }
        this.h = configuration;
        if (zL) {
            u12Var.getClass();
            l78VarU = u12Var.i;
        } else {
            l78VarU = qo7.u(new Configuration(configuration));
        }
        this.i = l78VarU;
        if (zL) {
            u12Var.getClass();
            bmVar = u12Var.j;
        } else {
            bmVar = new bm(view.getContext());
        }
        this.j = bmVar;
        if (zL) {
            u12Var.getClass();
            jtVar = u12Var.k;
        } else {
            jtVar = new jt(view.getContext());
        }
        this.k = jtVar;
        if (zL) {
            u12Var.getClass();
            umVar = u12Var.l;
        } else {
            umVar = new um(view.getContext());
        }
        this.l = umVar;
        if (zL) {
            u12Var.getClass();
            tmVar = u12Var.m;
        } else {
            tmVar = new tm(umVar);
        }
        this.m = tmVar;
        if (zL) {
            u12Var.getClass();
            z46Var = u12Var.n;
        } else {
            view.getContext();
            z46Var = new z46();
        }
        this.n = z46Var;
        if (zL) {
            u12Var.getClass();
            k49Var = u12Var.o;
        } else {
            k49Var = new k49(kyd.N(view.getContext()), uob.g);
        }
        this.o = k49Var;
        this.p = view == (u12Var != null ? u12Var.a : null) ? u12Var.p : new ha9(view);
        if (zL) {
            u12Var.getClass();
            rtVar = u12Var.q;
        } else {
            rtVar = new rt(ViewConfiguration.get(view.getContext()));
        }
        this.q = rtVar;
        this.r = u12Var != null ? u12Var.r : new cq6();
        this.s = new ax6();
        this.t = u12Var != null ? u12Var.t : new h61();
        this.v = new ir(5, this);
        this.w = new t12(this);
    }

    public final void a(mn mnVar, mz1 mz1Var, x12 x12Var, int i) {
        char c;
        char c2;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(123858079);
        int i2 = (p65Var.h(mnVar) ? 4 : 2) | i | (p65Var.h(mz1Var) ? 32 : 16) | (p65Var.h(this) ? 256 : 128);
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            Object tag = mnVar.getTag(R.id.inspection_slot_table_set);
            LinkedHashMap linkedHashMap = null;
            Set set = (!(tag instanceof Set) || ((tag instanceof th6) && !(tag instanceof ii6))) ? null : (Set) tag;
            if (set == null) {
                Object parent = mnVar.getParent();
                View view = parent instanceof View ? (View) parent : null;
                Object tag2 = view != null ? view.getTag(R.id.inspection_slot_table_set) : null;
                set = (!(tag2 instanceof Set) || ((tag2 instanceof th6) && !(tag2 instanceof ii6))) ? null : (Set) tag2;
            }
            if (set != null) {
                set.add(p65Var.x());
                p65Var.q = true;
                p65Var.C = true;
                p65Var.c.f();
                p65Var.H.f();
                igc igcVar = p65Var.I;
                fgc fgcVar = igcVar.a;
                igcVar.e = fgcVar.j;
                igcVar.f = fgcVar.k;
            }
            Object objM = p65Var.M();
            hpb hpbVar = this.d;
            uob uobVar = w12.a;
            if (objM == uobVar) {
                Object parent2 = mnVar.getParent();
                parent2.getClass();
                View view2 = (View) parent2;
                Object tag3 = view2.getTag(R.id.compose_view_saveable_id_tag);
                String strValueOf = tag3 instanceof String ? (String) tag3 : null;
                if (strValueOf == null) {
                    strValueOf = String.valueOf(view2.getId());
                }
                String strR = ka1.r("SaveableStateRegistry:", strValueOf);
                epb savedStateRegistry = hpbVar.getSavedStateRegistry();
                Bundle bundleA = savedStateRegistry.a(strR);
                if (bundleA != null) {
                    linkedHashMap = new LinkedHashMap();
                    for (String str : bundleA.keySet()) {
                        ArrayList parcelableArrayList = bundleA.getParcelableArrayList(str);
                        parcelableArrayList.getClass();
                        linkedHashMap.put(str, parcelableArrayList);
                    }
                }
                c = 2;
                c2 = 4;
                zu2 zu2Var = zu2.e;
                sn3 sn3Var = sob.a;
                rob robVar = new rob(linkedHashMap, zu2Var);
                if (savedStateRegistry.b(strR) != null) {
                    z = false;
                    ai3 ai3Var = new ai3(robVar, new bi3(z, savedStateRegistry, strR));
                    p65Var.j0(ai3Var);
                    objM = ai3Var;
                } else {
                    try {
                        savedStateRegistry.c(strR, new ny1(i3, robVar));
                        z = true;
                    } catch (IllegalArgumentException unused) {
                        z = false;
                    }
                    ai3 ai3Var2 = new ai3(robVar, new bi3(z, savedStateRegistry, strR));
                    p65Var.j0(ai3Var2);
                    objM = ai3Var2;
                }
            } else {
                c = 2;
                c2 = 4;
            }
            ai3 ai3Var3 = (ai3) objM;
            boolean zH = p65Var.h(ai3Var3);
            Object objM2 = p65Var.M();
            int i4 = 11;
            if (zH || objM2 == uobVar) {
                objM2 = new ce(i4, ai3Var3);
                p65Var.j0(objM2);
            }
            kyd.h(c1e.a, (x45) objM2, p65Var);
            sn3 sn3Var2 = z22.x;
            boolean zBooleanValue = ((Boolean) p65Var.j(sn3Var2)).booleanValue() | mnVar.getScrollCaptureInProgress$ui();
            boolean zF = p65Var.f(mnVar.getView());
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                mnVar.getView();
                objM3 = new xve();
                p65Var.j0(objM3);
            }
            o10 o10VarA = y57.a.a(this.c);
            o10 o10VarA2 = d67.a.a(hpbVar);
            o10 o10VarA3 = eo.d.a(this.f);
            o10 o10VarA4 = eo.e.a(this.g);
            o10 o10VarA5 = eo.b.a(mnVar.getContext());
            o10 o10VarA6 = m36.a.a(set);
            o10 o10VarA7 = eo.a.a(mnVar.getConfiguration());
            o10 o10VarA8 = sob.a.a(ai3Var3);
            o10 o10VarA9 = eo.f.a(mnVar.getView());
            o10 o10VarA10 = sn3Var2.a(Boolean.valueOf(zBooleanValue));
            o10 o10VarA11 = z22.u.a(mnVar.getViewConfiguration());
            o10 o10VarA12 = qr5.a.a((xve) objM3);
            o10[] o10VarArr = new o10[12];
            o10VarArr[0] = o10VarA;
            o10VarArr[1] = o10VarA2;
            o10VarArr[c] = o10VarA3;
            o10VarArr[3] = o10VarA4;
            o10VarArr[c2] = o10VarA5;
            o10VarArr[5] = o10VarA6;
            o10VarArr[6] = o10VarA7;
            o10VarArr[7] = o10VarA8;
            o10VarArr[8] = o10VarA9;
            o10VarArr[9] = o10VarA10;
            o10VarArr[10] = o10VarA11;
            o10VarArr[11] = o10VarA12;
            k40.d(o10VarArr, pxf.E(1317454175, new s12(mnVar, this, mz1Var), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s12(this, mnVar, mz1Var, i);
        }
    }

    public final void b() {
        int i = this.u - 1;
        this.u = i;
        if (i < 0) {
            Log.e("ComposeViewContext", "View count has dropped below 0");
            i = 0;
            this.u = 0;
        }
        if (i == 0) {
            View view = this.a;
            Context context = view.getContext();
            t12 t12Var = this.w;
            context.unregisterComponentCallbacks(t12Var);
            ax6 ax6Var = this.s;
            if (ax6Var.b == null) {
                ax6Var.a = null;
            }
            view.getViewTreeObserver().removeOnWindowFocusChangeListener(t12Var);
        }
    }

    public final void c() {
        int i = this.u + 1;
        this.u = i;
        if (i == 1) {
            View view = this.a;
            Context context = view.getContext();
            t12 t12Var = this.w;
            context.registerComponentCallbacks(t12Var);
            d(view.getResources().getConfiguration());
            boolean zHasWindowFocus = view.hasWindowFocus();
            ax6 ax6Var = this.s;
            ax6Var.c.setValue(Boolean.valueOf(zHasWindowFocus));
            k49 k49Var = ax6Var.b;
            ir irVar = this.v;
            if (k49Var == null) {
                ax6Var.a = irVar;
            }
            if (k49Var != null) {
                k49Var.setValue(irVar.invoke());
            }
            view.getViewTreeObserver().addOnWindowFocusChangeListener(t12Var);
        }
    }

    public final void d(Configuration configuration) {
        int iUpdateFrom = this.h.updateFrom(configuration);
        if (iUpdateFrom != 0) {
            Iterator it2 = this.f.a.entrySet().iterator();
            while (it2.hasNext()) {
                cy5 cy5Var = (cy5) ((WeakReference) ((Map.Entry) it2.next()).getValue()).get();
                if (cy5Var == null || Configuration.needNewResources(iUpdateFrom, cy5Var.b)) {
                    it2.remove();
                }
            }
            this.i.setValue(new Configuration(configuration));
            pcb pcbVar = this.g;
            synchronized (pcbVar) {
                pcbVar.a.c();
            }
            if ((268435456 & iUpdateFrom) != 0) {
                this.o.setValue(kyd.N(this.a.getContext()));
            }
            if (((-1342235264) & iUpdateFrom) != 0) {
                ax6 ax6Var = this.s;
                ir irVar = this.v;
                k49 k49Var = ax6Var.b;
                if (k49Var != null) {
                    k49Var.setValue(irVar.invoke());
                }
            }
        }
    }
}
