package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentContainerView;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.medium.reader.R;
import j$.util.DesugarCollections;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class f25 {
    public q7 B;
    public q7 C;
    public q7 D;
    public boolean F;
    public boolean G;
    public boolean H;
    public boolean I;
    public boolean J;
    public ArrayList K;
    public ArrayList L;
    public ArrayList M;
    public i25 N;
    public boolean b;
    public ArrayList d;
    public ArrayList e;
    public iq8 g;
    public ArrayList m;
    public final t15 p;
    public final t15 q;
    public final t15 r;
    public final t15 s;
    public l15 v;
    public gx1 w;
    public j15 x;
    public j15 y;
    public final ArrayList a = new ArrayList();
    public final n0c c = new n0c(17);
    public final r15 f = new r15(this);
    public final ul0 h = new ul0(1, this);
    public final AtomicInteger i = new AtomicInteger();
    public final Map j = DesugarCollections.synchronizedMap(new HashMap());
    public final Map k = DesugarCollections.synchronizedMap(new HashMap());
    public final Map l = DesugarCollections.synchronizedMap(new HashMap());
    public final hx4 n = new hx4(this);
    public final CopyOnWriteArrayList o = new CopyOnWriteArrayList();
    public final v15 t = new v15(this);
    public int u = -1;
    public final w15 z = new w15(this);
    public final jzb A = new jzb();
    public ArrayDeque E = new ArrayDeque();
    public final jn O = new jn(8, this);

    /* JADX WARN: Type inference failed for: r0v13, types: [t15] */
    /* JADX WARN: Type inference failed for: r0v14, types: [t15] */
    /* JADX WARN: Type inference failed for: r0v15, types: [t15] */
    /* JADX WARN: Type inference failed for: r0v16, types: [t15] */
    public f25() {
        final int i = 0;
        this.p = new t72(this) { // from class: t15
            public final /* synthetic */ f25 b;

            {
                this.b = this;
            }

            @Override // defpackage.t72
            public final void accept(Object obj) {
                int i2 = i;
                f25 f25Var = this.b;
                switch (i2) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        if (f25Var.K()) {
                            f25Var.h(false, configuration);
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        if (f25Var.K() && num.intValue() == 80) {
                            f25Var.l(false);
                            break;
                        }
                        break;
                    case 2:
                        w58 w58Var = (w58) obj;
                        if (f25Var.K()) {
                            boolean z = w58Var.a;
                            f25Var.m(false);
                        }
                        break;
                    default:
                        g99 g99Var = (g99) obj;
                        if (f25Var.K()) {
                            boolean z2 = g99Var.a;
                            f25Var.r(false);
                        }
                        break;
                }
            }
        };
        final int i2 = 1;
        this.q = new t72(this) { // from class: t15
            public final /* synthetic */ f25 b;

            {
                this.b = this;
            }

            @Override // defpackage.t72
            public final void accept(Object obj) {
                int i22 = i2;
                f25 f25Var = this.b;
                switch (i22) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        if (f25Var.K()) {
                            f25Var.h(false, configuration);
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        if (f25Var.K() && num.intValue() == 80) {
                            f25Var.l(false);
                            break;
                        }
                        break;
                    case 2:
                        w58 w58Var = (w58) obj;
                        if (f25Var.K()) {
                            boolean z = w58Var.a;
                            f25Var.m(false);
                        }
                        break;
                    default:
                        g99 g99Var = (g99) obj;
                        if (f25Var.K()) {
                            boolean z2 = g99Var.a;
                            f25Var.r(false);
                        }
                        break;
                }
            }
        };
        final int i3 = 2;
        this.r = new t72(this) { // from class: t15
            public final /* synthetic */ f25 b;

            {
                this.b = this;
            }

            @Override // defpackage.t72
            public final void accept(Object obj) {
                int i22 = i3;
                f25 f25Var = this.b;
                switch (i22) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        if (f25Var.K()) {
                            f25Var.h(false, configuration);
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        if (f25Var.K() && num.intValue() == 80) {
                            f25Var.l(false);
                            break;
                        }
                        break;
                    case 2:
                        w58 w58Var = (w58) obj;
                        if (f25Var.K()) {
                            boolean z = w58Var.a;
                            f25Var.m(false);
                        }
                        break;
                    default:
                        g99 g99Var = (g99) obj;
                        if (f25Var.K()) {
                            boolean z2 = g99Var.a;
                            f25Var.r(false);
                        }
                        break;
                }
            }
        };
        final int i4 = 3;
        this.s = new t72(this) { // from class: t15
            public final /* synthetic */ f25 b;

            {
                this.b = this;
            }

            @Override // defpackage.t72
            public final void accept(Object obj) {
                int i22 = i4;
                f25 f25Var = this.b;
                switch (i22) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        if (f25Var.K()) {
                            f25Var.h(false, configuration);
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        if (f25Var.K() && num.intValue() == 80) {
                            f25Var.l(false);
                            break;
                        }
                        break;
                    case 2:
                        w58 w58Var = (w58) obj;
                        if (f25Var.K()) {
                            boolean z = w58Var.a;
                            f25Var.m(false);
                        }
                        break;
                    default:
                        g99 g99Var = (g99) obj;
                        if (f25Var.K()) {
                            boolean z2 = g99Var.a;
                            f25Var.r(false);
                        }
                        break;
                }
            }
        };
    }

    public static boolean I(int i) {
        return Log.isLoggable("FragmentManager", i);
    }

    public static boolean J(j15 j15Var) {
        boolean zJ = false;
        for (j15 j15Var2 : j15Var.u.c.K()) {
            if (j15Var2 != null) {
                zJ = J(j15Var2);
            }
            if (zJ) {
                return true;
            }
        }
        return false;
    }

    public static boolean L(j15 j15Var) {
        if (j15Var == null) {
            return true;
        }
        if (j15Var.D) {
            return j15Var.s == null || L(j15Var.v);
        }
        return false;
    }

    public static boolean M(j15 j15Var) {
        if (j15Var == null) {
            return true;
        }
        f25 f25Var = j15Var.s;
        return j15Var == f25Var.y && M(f25Var.x);
    }

    public static void e0(j15 j15Var) {
        if (I(2)) {
            Log.v("FragmentManager", "show: " + j15Var);
        }
        if (j15Var.z) {
            j15Var.z = false;
            j15Var.K = !j15Var.K;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:113:0x023d A[PHI: r15
      0x023d: PHI (r15v25 int) = (r15v24 int), (r15v27 int) binds: [B:105:0x022a, B:109:0x0234] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0179  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void A(java.util.ArrayList r27, java.util.ArrayList r28, int r29, int r30) {
        /*
            Method dump skipped, instruction units count: 1836
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f25.A(java.util.ArrayList, java.util.ArrayList, int, int):void");
    }

    public final int B(int i, String str, boolean z) {
        ArrayList arrayList = this.d;
        if (arrayList == null || arrayList.isEmpty()) {
            return -1;
        }
        if (str == null && i < 0) {
            if (z) {
                return 0;
            }
            return this.d.size() - 1;
        }
        int size = this.d.size() - 1;
        while (size >= 0) {
            km0 km0Var = (km0) this.d.get(size);
            if ((str != null && str.equals(km0Var.i)) || (i >= 0 && i == km0Var.s)) {
                break;
            }
            size--;
        }
        if (size < 0) {
            return size;
        }
        if (!z) {
            if (size == this.d.size() - 1) {
                return -1;
            }
            return size + 1;
        }
        while (size > 0) {
            km0 km0Var2 = (km0) this.d.get(size - 1);
            if ((str == null || !str.equals(km0Var2.i)) && (i < 0 || i != km0Var2.s)) {
                break;
            }
            size--;
        }
        return size;
    }

    public final j15 C(int i) {
        n0c n0cVar = this.c;
        ArrayList arrayList = (ArrayList) n0cVar.b;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            j15 j15Var = (j15) arrayList.get(size);
            if (j15Var != null && j15Var.w == i) {
                return j15Var;
            }
        }
        for (s25 s25Var : ((HashMap) n0cVar.c).values()) {
            if (s25Var != null) {
                j15 j15Var2 = s25Var.c;
                if (j15Var2.w == i) {
                    return j15Var2;
                }
            }
        }
        return null;
    }

    public final j15 D(String str) {
        n0c n0cVar = this.c;
        ArrayList arrayList = (ArrayList) n0cVar.b;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            j15 j15Var = (j15) arrayList.get(size);
            if (j15Var != null && str.equals(j15Var.y)) {
                return j15Var;
            }
        }
        for (s25 s25Var : ((HashMap) n0cVar.c).values()) {
            if (s25Var != null) {
                j15 j15Var2 = s25Var.c;
                if (str.equals(j15Var2.y)) {
                    return j15Var2;
                }
            }
        }
        return null;
    }

    public final ViewGroup E(j15 j15Var) {
        ViewGroup viewGroup = j15Var.F;
        if (viewGroup != null) {
            return viewGroup;
        }
        if (j15Var.x <= 0 || !this.w.U()) {
            return null;
        }
        View viewT = this.w.T(j15Var.x);
        if (viewT instanceof ViewGroup) {
            return (ViewGroup) viewT;
        }
        return null;
    }

    public final w15 F() {
        j15 j15Var = this.x;
        return j15Var != null ? j15Var.s.F() : this.z;
    }

    public final jzb G() {
        j15 j15Var = this.x;
        return j15Var != null ? j15Var.s.G() : this.A;
    }

    public final void H(j15 j15Var) {
        if (I(2)) {
            Log.v("FragmentManager", "hide: " + j15Var);
        }
        if (j15Var.z) {
            return;
        }
        j15Var.z = true;
        j15Var.K = true ^ j15Var.K;
        d0(j15Var);
    }

    public final boolean K() {
        j15 j15Var = this.x;
        if (j15Var == null) {
            return true;
        }
        return j15Var.t() && this.x.m().K();
    }

    public final boolean N() {
        return this.G || this.H;
    }

    public final void O(int i, boolean z) {
        l15 l15Var;
        if (this.v == null && i != -1) {
            ygf.f("No activity");
            return;
        }
        if (z || i != this.u) {
            this.u = i;
            n0c n0cVar = this.c;
            HashMap map = (HashMap) n0cVar.c;
            Iterator it2 = ((ArrayList) n0cVar.b).iterator();
            while (it2.hasNext()) {
                s25 s25Var = (s25) map.get(((j15) it2.next()).e);
                if (s25Var != null) {
                    s25Var.k();
                }
            }
            for (s25 s25Var2 : map.values()) {
                if (s25Var2 != null) {
                    s25Var2.k();
                    j15 j15Var = s25Var2.c;
                    if (j15Var.l && !j15Var.v()) {
                        if (j15Var.m && !((HashMap) n0cVar.d).containsKey(j15Var.e)) {
                            n0cVar.g0(j15Var.e, s25Var2.o());
                        }
                        n0cVar.V(s25Var2);
                    }
                }
            }
            f0();
            if (this.F && (l15Var = this.v) != null && this.u == 7) {
                l15Var.z.invalidateMenu();
                this.F = false;
            }
        }
    }

    public final void P() {
        if (this.v == null) {
            return;
        }
        this.G = false;
        this.H = false;
        this.N.g = false;
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null) {
                j15Var.u.P();
            }
        }
    }

    public final boolean Q() {
        return R(-1, 0);
    }

    public final boolean R(int i, int i2) {
        y(false);
        x(true);
        j15 j15Var = this.y;
        if (j15Var != null && i < 0 && j15Var.h().Q()) {
            return true;
        }
        boolean zS = S(this.K, this.L, null, i, i2);
        if (zS) {
            this.b = true;
            try {
                U(this.K, this.L);
            } finally {
                d();
            }
        }
        i0();
        u();
        ((HashMap) this.c.c).values().removeAll(Collections.singleton(null));
        return zS;
    }

    public final boolean S(ArrayList arrayList, ArrayList arrayList2, String str, int i, int i2) {
        int iB = B(i, str, (i2 & 1) != 0);
        if (iB < 0) {
            return false;
        }
        for (int size = this.d.size() - 1; size >= iB; size--) {
            arrayList.add((km0) this.d.remove(size));
            arrayList2.add(Boolean.TRUE);
        }
        return true;
    }

    public final void T(j15 j15Var) {
        if (I(2)) {
            Log.v("FragmentManager", "remove: " + j15Var + " nesting=" + j15Var.r);
        }
        boolean zV = j15Var.v();
        if (j15Var.A && zV) {
            return;
        }
        n0c n0cVar = this.c;
        synchronized (((ArrayList) n0cVar.b)) {
            ((ArrayList) n0cVar.b).remove(j15Var);
        }
        j15Var.k = false;
        if (J(j15Var)) {
            this.F = true;
        }
        j15Var.l = true;
        d0(j15Var);
    }

    public final void U(ArrayList arrayList, ArrayList arrayList2) {
        if (arrayList.isEmpty()) {
            return;
        }
        if (arrayList.size() != arrayList2.size()) {
            ygf.f("Internal error with the back stack records");
            return;
        }
        int size = arrayList.size();
        int i = 0;
        int i2 = 0;
        while (i < size) {
            if (!((km0) arrayList.get(i)).p) {
                if (i2 != i) {
                    A(arrayList, arrayList2, i2, i);
                }
                i2 = i + 1;
                if (((Boolean) arrayList2.get(i)).booleanValue()) {
                    while (i2 < size && ((Boolean) arrayList2.get(i2)).booleanValue() && !((km0) arrayList.get(i2)).p) {
                        i2++;
                    }
                }
                A(arrayList, arrayList2, i, i2);
                i = i2 - 1;
            }
            i++;
        }
        if (i2 != size) {
            A(arrayList, arrayList2, i2, size);
        }
    }

    public final void V(Bundle bundle) {
        hx4 hx4Var;
        s25 s25Var;
        Bundle bundle2;
        Bundle bundle3;
        for (String str : bundle.keySet()) {
            if (str.startsWith("result_") && (bundle3 = bundle.getBundle(str)) != null) {
                bundle3.setClassLoader(this.v.w.getClassLoader());
                this.k.put(str.substring(7), bundle3);
            }
        }
        HashMap map = new HashMap();
        for (String str2 : bundle.keySet()) {
            if (str2.startsWith("fragment_") && (bundle2 = bundle.getBundle(str2)) != null) {
                bundle2.setClassLoader(this.v.w.getClassLoader());
                map.put(str2.substring(9), bundle2);
            }
        }
        n0c n0cVar = this.c;
        HashMap map2 = (HashMap) n0cVar.d;
        HashMap map3 = (HashMap) n0cVar.c;
        map2.clear();
        map2.putAll(map);
        h25 h25Var = (h25) bundle.getParcelable("state");
        if (h25Var == null) {
            return;
        }
        map3.clear();
        Iterator it2 = h25Var.a.iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            hx4Var = this.n;
            if (!zHasNext) {
                break;
            }
            Bundle bundleG0 = n0cVar.g0((String) it2.next(), null);
            if (bundleG0 != null) {
                j15 j15Var = (j15) this.N.b.get(((q25) bundleG0.getParcelable("state")).b);
                if (j15Var != null) {
                    if (I(2)) {
                        Log.v("FragmentManager", "restoreSaveState: re-attaching retained " + j15Var);
                    }
                    s25Var = new s25(hx4Var, n0cVar, j15Var, bundleG0);
                } else {
                    s25Var = new s25(this.n, this.c, this.v.w.getClassLoader(), F(), bundleG0);
                }
                j15 j15Var2 = s25Var.c;
                j15Var2.b = bundleG0;
                j15Var2.s = this;
                if (I(2)) {
                    Log.v("FragmentManager", "restoreSaveState: active (" + j15Var2.e + "): " + j15Var2);
                }
                s25Var.m(this.v.w.getClassLoader());
                n0cVar.S(s25Var);
                s25Var.e = this.u;
            }
        }
        i25 i25Var = this.N;
        i25Var.getClass();
        for (j15 j15Var3 : new ArrayList(i25Var.b.values())) {
            if (map3.get(j15Var3.e) == null) {
                if (I(2)) {
                    Log.v("FragmentManager", "Discarding retained Fragment " + j15Var3 + " that was not found in the set of active Fragments " + h25Var.a);
                }
                this.N.i(j15Var3);
                j15Var3.s = this;
                s25 s25Var2 = new s25(hx4Var, n0cVar, j15Var3);
                s25Var2.e = 1;
                s25Var2.k();
                j15Var3.l = true;
                s25Var2.k();
            }
        }
        ArrayList<String> arrayList = h25Var.b;
        ((ArrayList) n0cVar.b).clear();
        if (arrayList != null) {
            for (String str3 : arrayList) {
                j15 j15VarE = n0cVar.E(str3);
                if (j15VarE == null) {
                    ygf.f(ev6.x("No instantiated fragment for (", str3, ")"));
                    return;
                }
                if (I(2)) {
                    Log.v("FragmentManager", "restoreSaveState: added (" + str3 + "): " + j15VarE);
                }
                n0cVar.s(j15VarE);
            }
        }
        if (h25Var.c != null) {
            this.d = new ArrayList(h25Var.c.length);
            int i = 0;
            while (true) {
                lm0[] lm0VarArr = h25Var.c;
                if (i >= lm0VarArr.length) {
                    break;
                }
                lm0 lm0Var = lm0VarArr[i];
                ArrayList arrayList2 = lm0Var.b;
                km0 km0Var = new km0(this);
                lm0Var.a(km0Var);
                km0Var.s = lm0Var.g;
                for (int i2 = 0; i2 < arrayList2.size(); i2++) {
                    String str4 = (String) arrayList2.get(i2);
                    if (str4 != null) {
                        ((v25) km0Var.a.get(i2)).b = n0cVar.E(str4);
                    }
                }
                km0Var.c(1);
                if (I(2)) {
                    StringBuilder sbC = ev6.C("restoreAllState: back stack #", i, " (index ");
                    sbC.append(km0Var.s);
                    sbC.append("): ");
                    sbC.append(km0Var);
                    Log.v("FragmentManager", sbC.toString());
                    PrintWriter printWriter = new PrintWriter(new a87());
                    km0Var.f("  ", printWriter, false);
                    printWriter.close();
                }
                this.d.add(km0Var);
                i++;
            }
        } else {
            this.d = null;
        }
        this.i.set(h25Var.d);
        String str5 = h25Var.e;
        if (str5 != null) {
            j15 j15VarE2 = n0cVar.E(str5);
            this.y = j15VarE2;
            q(j15VarE2);
        }
        ArrayList arrayList3 = h25Var.f;
        if (arrayList3 != null) {
            for (int i3 = 0; i3 < arrayList3.size(); i3++) {
                this.j.put((String) arrayList3.get(i3), (mm0) h25Var.g.get(i3));
            }
        }
        this.E = new ArrayDeque(h25Var.h);
    }

    public final Bundle W() {
        int i;
        ArrayList arrayList;
        lm0[] lm0VarArr;
        int size;
        Bundle bundle = new Bundle();
        Iterator it2 = e().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            g23 g23Var = (g23) it2.next();
            if (g23Var.e) {
                if (I(2)) {
                    Log.v("FragmentManager", "SpecialEffectsController: Forcing postponed operations");
                }
                g23Var.e = false;
                g23Var.c();
            }
        }
        Iterator it3 = e().iterator();
        while (it3.hasNext()) {
            ((g23) it3.next()).e();
        }
        y(true);
        this.G = true;
        this.N.g = true;
        n0c n0cVar = this.c;
        n0cVar.getClass();
        HashMap map = (HashMap) n0cVar.c;
        ArrayList arrayList2 = new ArrayList(map.size());
        for (s25 s25Var : map.values()) {
            if (s25Var != null) {
                j15 j15Var = s25Var.c;
                n0cVar.g0(j15Var.e, s25Var.o());
                arrayList2.add(j15Var.e);
                if (I(2)) {
                    Log.v("FragmentManager", "Saved state of " + j15Var + ": " + j15Var.b);
                }
            }
        }
        HashMap map2 = (HashMap) this.c.d;
        if (!map2.isEmpty()) {
            n0c n0cVar2 = this.c;
            synchronized (((ArrayList) n0cVar2.b)) {
                try {
                    if (((ArrayList) n0cVar2.b).isEmpty()) {
                        arrayList = null;
                    } else {
                        arrayList = new ArrayList(((ArrayList) n0cVar2.b).size());
                        for (j15 j15Var2 : (ArrayList) n0cVar2.b) {
                            arrayList.add(j15Var2.e);
                            if (I(2)) {
                                Log.v("FragmentManager", "saveAllState: adding fragment (" + j15Var2.e + "): " + j15Var2);
                            }
                        }
                    }
                } finally {
                }
            }
            ArrayList arrayList3 = this.d;
            if (arrayList3 == null || (size = arrayList3.size()) <= 0) {
                lm0VarArr = null;
            } else {
                lm0VarArr = new lm0[size];
                for (i = 0; i < size; i++) {
                    lm0VarArr[i] = new lm0((km0) this.d.get(i));
                    if (I(2)) {
                        StringBuilder sbC = ev6.C("saveAllState: adding back stack #", i, ": ");
                        sbC.append(this.d.get(i));
                        Log.v("FragmentManager", sbC.toString());
                    }
                }
            }
            h25 h25Var = new h25();
            h25Var.e = null;
            ArrayList arrayList4 = new ArrayList();
            h25Var.f = arrayList4;
            ArrayList arrayList5 = new ArrayList();
            h25Var.g = arrayList5;
            h25Var.a = arrayList2;
            h25Var.b = arrayList;
            h25Var.c = lm0VarArr;
            h25Var.d = this.i.get();
            j15 j15Var3 = this.y;
            if (j15Var3 != null) {
                h25Var.e = j15Var3.e;
            }
            arrayList4.addAll(this.j.keySet());
            arrayList5.addAll(this.j.values());
            h25Var.h = new ArrayList(this.E);
            bundle.putParcelable("state", h25Var);
            for (String str : this.k.keySet()) {
                bundle.putBundle(ka1.r("result_", str), (Bundle) this.k.get(str));
            }
            for (String str2 : map2.keySet()) {
                bundle.putBundle(ka1.r("fragment_", str2), (Bundle) map2.get(str2));
            }
        } else if (I(2)) {
            Log.v("FragmentManager", "saveAllState: no fragments!");
            return bundle;
        }
        return bundle;
    }

    public final void X() {
        synchronized (this.a) {
            try {
                if (this.a.size() == 1) {
                    this.v.x.removeCallbacks(this.O);
                    this.v.x.post(this.O);
                    i0();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void Y(j15 j15Var, boolean z) {
        ViewGroup viewGroupE = E(j15Var);
        if (viewGroupE == null || !(viewGroupE instanceof FragmentContainerView)) {
            return;
        }
        ((FragmentContainerView) viewGroupE).setDrawDisappearingViewsLast(!z);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void Z(java.lang.String r4, android.os.Bundle r5) {
        /*
            r3 = this;
            java.util.Map r0 = r3.l
            java.lang.Object r0 = r0.get(r4)
            b25 r0 = (defpackage.b25) r0
            if (r0 == 0) goto L1c
            vx6 r1 = defpackage.vx6.STARTED
            wx6 r2 = r0.a
            ky6 r2 = (defpackage.ky6) r2
            vx6 r2 = r2.d
            boolean r1 = r2.isAtLeast(r1)
            if (r1 == 0) goto L1c
            r0.a(r4, r5)
            goto L21
        L1c:
            java.util.Map r3 = r3.k
            r3.put(r4, r5)
        L21:
            r3 = 2
            boolean r3 = I(r3)
            if (r3 == 0) goto L43
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            java.lang.String r0 = "Setting fragment result with key "
            r3.<init>(r0)
            r3.append(r4)
            java.lang.String r4 = " and result "
            r3.append(r4)
            r3.append(r5)
            java.lang.String r3 = r3.toString()
            java.lang.String r4 = "FragmentManager"
            android.util.Log.v(r4, r3)
        L43:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f25.Z(java.lang.String, android.os.Bundle):void");
    }

    public final s25 a(j15 j15Var) {
        String str = j15Var.M;
        if (str != null) {
            u25.c(j15Var, str);
        }
        if (I(2)) {
            Log.v("FragmentManager", "add: " + j15Var);
        }
        s25 s25VarF = f(j15Var);
        j15Var.s = this;
        n0c n0cVar = this.c;
        n0cVar.S(s25VarF);
        if (!j15Var.A) {
            n0cVar.s(j15Var);
            j15Var.l = false;
            if (j15Var.G == null) {
                j15Var.K = false;
            }
            if (J(j15Var)) {
                this.F = true;
            }
        }
        return s25VarF;
    }

    public final void a0(String str, iy6 iy6Var, p25 p25Var) {
        wx6 lifecycle = iy6Var.getLifecycle();
        if (((ky6) lifecycle).d == vx6.DESTROYED) {
            return;
        }
        x15 x15Var = new x15(this, str, p25Var, lifecycle);
        b25 b25Var = (b25) this.l.put(str, new b25(lifecycle, p25Var, x15Var));
        if (b25Var != null) {
            b25Var.a.b(b25Var.c);
        }
        if (I(2)) {
            Log.v("FragmentManager", "Setting FragmentResultListener with key " + str + " lifecycleOwner " + lifecycle + " and listener " + p25Var);
        }
        lifecycle.a(x15Var);
    }

    public final void b(l15 l15Var, gx1 gx1Var, j15 j15Var) {
        i25 i25Var;
        if (this.v != null) {
            ygf.f("Already attached");
            return;
        }
        this.v = l15Var;
        this.w = gx1Var;
        this.x = j15Var;
        CopyOnWriteArrayList copyOnWriteArrayList = this.o;
        if (j15Var != null) {
            copyOnWriteArrayList.add(new y15(j15Var));
        } else if (l15Var != null) {
            copyOnWriteArrayList.add(l15Var);
        }
        if (this.x != null) {
            i0();
        }
        if (l15Var != null) {
            iq8 onBackPressedDispatcher = l15Var.z.getOnBackPressedDispatcher();
            this.g = onBackPressedDispatcher;
            onBackPressedDispatcher.a(j15Var != null ? j15Var : l15Var, this.h);
        }
        int i = 0;
        if (j15Var != null) {
            i25 i25Var2 = j15Var.s.N;
            HashMap map = i25Var2.c;
            i25Var = (i25) map.get(j15Var.e);
            if (i25Var == null) {
                i25Var = new i25(i25Var2.e);
                map.put(j15Var.e, i25Var);
            }
            this.N = i25Var;
        } else if (l15Var != null) {
            vue viewModelStore = l15Var.z.getViewModelStore();
            viewModelStore.getClass();
            og2 og2Var = og2.b;
            og2Var.getClass();
            o2b o2bVar = new o2b(viewModelStore, i25.h, og2Var);
            wg6 wg6VarB = n1b.a.b(i25.class);
            String strD = wg6VarB.d();
            if (strD == null) {
                ay0.e("Local and anonymous classes can not be ViewModels");
                return;
            } else {
                i25Var = (i25) o2bVar.o(wg6VarB, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
                this.N = i25Var;
            }
        } else {
            i25Var = new i25(false);
            this.N = i25Var;
        }
        i25Var.g = N();
        this.c.e = this.N;
        l15 l15Var2 = this.v;
        if (l15Var2 != null && j15Var == null) {
            epb savedStateRegistry = l15Var2.z.getSavedStateRegistry();
            savedStateRegistry.c("android:support:fragments", new ny1(3, this));
            Bundle bundleA = savedStateRegistry.a("android:support:fragments");
            if (bundleA != null) {
                V(bundleA);
            }
        }
        l15 l15Var3 = this.v;
        if (l15Var3 != null) {
            r7 activityResultRegistry = l15Var3.z.getActivityResultRegistry();
            String strConcat = "FragmentManager:".concat(j15Var != null ? ka1.v(new StringBuilder(), j15Var.e, ":") : "");
            this.B = activityResultRegistry.c(strConcat.concat("StartActivityForResult"), new g7(4), new u15(this, 1));
            int i2 = 2;
            this.C = activityResultRegistry.c(strConcat.concat("StartIntentSenderForResult"), new g7(7), new u15(this, i2));
            this.D = activityResultRegistry.c(strConcat.concat("RequestPermissions"), new g7(i2), new u15(this, i));
        }
        l15 l15Var4 = this.v;
        if (l15Var4 != null) {
            l15Var4.z.addOnConfigurationChangedListener(this.p);
        }
        l15 l15Var5 = this.v;
        if (l15Var5 != null) {
            l15Var5.z.addOnTrimMemoryListener(this.q);
        }
        l15 l15Var6 = this.v;
        if (l15Var6 != null) {
            l15Var6.z.addOnMultiWindowModeChangedListener(this.r);
        }
        l15 l15Var7 = this.v;
        if (l15Var7 != null) {
            l15Var7.z.addOnPictureInPictureModeChangedListener(this.s);
        }
        l15 l15Var8 = this.v;
        if (l15Var8 == null || j15Var != null) {
            return;
        }
        l15Var8.z.addMenuProvider(this.t);
    }

    public final void b0(j15 j15Var, vx6 vx6Var) {
        if (j15Var == this.c.E(j15Var.e) && (j15Var.t == null || j15Var.s == this)) {
            j15Var.N = vx6Var;
        } else {
            ywb.j("Fragment ", j15Var, " is not an active fragment of FragmentManager ", this);
        }
    }

    public final void c(j15 j15Var) {
        if (I(2)) {
            Log.v("FragmentManager", "attach: " + j15Var);
        }
        if (j15Var.A) {
            j15Var.A = false;
            if (j15Var.k) {
                return;
            }
            this.c.s(j15Var);
            if (I(2)) {
                Log.v("FragmentManager", "add from attach: " + j15Var);
            }
            if (J(j15Var)) {
                this.F = true;
            }
        }
    }

    public final void c0(j15 j15Var) {
        if (j15Var != null) {
            if (j15Var != this.c.E(j15Var.e) || (j15Var.t != null && j15Var.s != this)) {
                ywb.j("Fragment ", j15Var, " is not an active fragment of FragmentManager ", this);
                return;
            }
        }
        j15 j15Var2 = this.y;
        this.y = j15Var;
        q(j15Var2);
        q(this.y);
    }

    public final void d() {
        this.b = false;
        this.L.clear();
        this.K.clear();
    }

    public final void d0(j15 j15Var) {
        ViewGroup viewGroupE = E(j15Var);
        if (viewGroupE != null) {
            f15 f15Var = j15Var.J;
            if ((f15Var == null ? 0 : f15Var.e) + (f15Var == null ? 0 : f15Var.d) + (f15Var == null ? 0 : f15Var.c) + (f15Var == null ? 0 : f15Var.b) > 0) {
                if (viewGroupE.getTag(R.id.visible_removing_fragment_view_tag) == null) {
                    viewGroupE.setTag(R.id.visible_removing_fragment_view_tag, j15Var);
                }
                j15 j15Var2 = (j15) viewGroupE.getTag(R.id.visible_removing_fragment_view_tag);
                f15 f15Var2 = j15Var.J;
                boolean z = f15Var2 != null ? f15Var2.a : false;
                if (j15Var2.J == null) {
                    return;
                }
                j15Var2.f().a = z;
            }
        }
    }

    public final HashSet e() {
        g23 g23Var;
        HashSet hashSet = new HashSet();
        Iterator it2 = this.c.J().iterator();
        while (it2.hasNext()) {
            ViewGroup viewGroup = ((s25) it2.next()).c.F;
            if (viewGroup != null) {
                G().getClass();
                Object tag = viewGroup.getTag(R.id.special_effects_controller_view_tag);
                if (tag instanceof g23) {
                    g23Var = (g23) tag;
                } else {
                    g23Var = new g23(viewGroup);
                    viewGroup.setTag(R.id.special_effects_controller_view_tag, g23Var);
                }
                hashSet.add(g23Var);
            }
        }
        return hashSet;
    }

    public final s25 f(j15 j15Var) {
        String str = j15Var.e;
        n0c n0cVar = this.c;
        s25 s25Var = (s25) ((HashMap) n0cVar.c).get(str);
        if (s25Var != null) {
            return s25Var;
        }
        s25 s25Var2 = new s25(this.n, n0cVar, j15Var);
        s25Var2.m(this.v.w.getClassLoader());
        s25Var2.e = this.u;
        return s25Var2;
    }

    public final void f0() {
        for (s25 s25Var : this.c.J()) {
            j15 j15Var = s25Var.c;
            if (j15Var.H) {
                if (this.b) {
                    this.J = true;
                } else {
                    j15Var.H = false;
                    s25Var.k();
                }
            }
        }
    }

    public final void g(j15 j15Var) {
        if (I(2)) {
            Log.v("FragmentManager", "detach: " + j15Var);
        }
        if (j15Var.A) {
            return;
        }
        j15Var.A = true;
        if (j15Var.k) {
            if (I(2)) {
                Log.v("FragmentManager", "remove from detach: " + j15Var);
            }
            n0c n0cVar = this.c;
            synchronized (((ArrayList) n0cVar.b)) {
                ((ArrayList) n0cVar.b).remove(j15Var);
            }
            j15Var.k = false;
            if (J(j15Var)) {
                this.F = true;
            }
            d0(j15Var);
        }
    }

    public final void g0(RuntimeException runtimeException) {
        Log.e("FragmentManager", runtimeException.getMessage());
        Log.e("FragmentManager", "Activity state:");
        PrintWriter printWriter = new PrintWriter(new a87());
        l15 l15Var = this.v;
        if (l15Var == null) {
            try {
                v("  ", null, printWriter, new String[0]);
                throw runtimeException;
            } catch (Exception e) {
                Log.e("FragmentManager", "Failed dumping state", e);
                throw runtimeException;
            }
        }
        try {
            l15Var.z.dump("  ", null, printWriter, new String[0]);
            throw runtimeException;
        } catch (Exception e2) {
            Log.e("FragmentManager", "Failed dumping state", e2);
            throw runtimeException;
        }
    }

    public final void h(boolean z, Configuration configuration) {
        if (z && this.v != null) {
            g0(new IllegalStateException("Do not call dispatchConfigurationChanged() on host. Host implements OnConfigurationChangedProvider and automatically dispatches configuration changes to fragments."));
            throw null;
        }
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null) {
                j15Var.onConfigurationChanged(configuration);
                if (z) {
                    j15Var.u.h(true, configuration);
                }
            }
        }
    }

    public final void h0(z15 z15Var) {
        hx4 hx4Var = this.n;
        synchronized (((CopyOnWriteArrayList) hx4Var.b)) {
            try {
                int size = ((CopyOnWriteArrayList) hx4Var.b).size();
                int i = 0;
                while (true) {
                    if (i >= size) {
                        break;
                    }
                    if (((s15) ((CopyOnWriteArrayList) hx4Var.b).get(i)).a == z15Var) {
                        ((CopyOnWriteArrayList) hx4Var.b).remove(i);
                        break;
                    }
                    i++;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final boolean i() {
        if (this.u >= 1) {
            for (j15 j15Var : this.c.M()) {
                if (j15Var != null) {
                    if (!j15Var.z ? j15Var.u.i() : false) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final void i0() {
        synchronized (this.a) {
            try {
                if (!this.a.isEmpty()) {
                    this.h.f(true);
                    return;
                }
                ul0 ul0Var = this.h;
                ArrayList arrayList = this.d;
                ul0Var.f((arrayList != null ? arrayList.size() : 0) > 0 && M(this.x));
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final boolean j() {
        if (this.u < 1) {
            return false;
        }
        ArrayList arrayList = null;
        boolean z = false;
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null && L(j15Var)) {
                if (!j15Var.z ? j15Var.u.j() : false) {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add(j15Var);
                    z = true;
                }
            }
        }
        if (this.e != null) {
            for (int i = 0; i < this.e.size(); i++) {
                j15 j15Var2 = (j15) this.e.get(i);
                if (arrayList == null || !arrayList.contains(j15Var2)) {
                    j15Var2.getClass();
                }
            }
        }
        this.e = arrayList;
        return z;
    }

    public final void k() {
        boolean zIsChangingConfigurations = true;
        this.I = true;
        y(true);
        Iterator it2 = e().iterator();
        while (it2.hasNext()) {
            ((g23) it2.next()).e();
        }
        l15 l15Var = this.v;
        n0c n0cVar = this.c;
        if (l15Var != null) {
            zIsChangingConfigurations = ((i25) n0cVar.e).f;
        } else {
            Context context = l15Var.w;
            if (context instanceof Activity) {
                zIsChangingConfigurations = true ^ ((Activity) context).isChangingConfigurations();
            }
        }
        if (zIsChangingConfigurations) {
            Iterator it3 = this.j.values().iterator();
            while (it3.hasNext()) {
                Iterator it4 = ((mm0) it3.next()).a.iterator();
                while (it4.hasNext()) {
                    ((i25) n0cVar.e).g((String) it4.next(), false);
                }
            }
        }
        t(-1);
        l15 l15Var2 = this.v;
        if (l15Var2 != null) {
            l15Var2.z.removeOnTrimMemoryListener(this.q);
        }
        l15 l15Var3 = this.v;
        if (l15Var3 != null) {
            l15Var3.z.removeOnConfigurationChangedListener(this.p);
        }
        l15 l15Var4 = this.v;
        if (l15Var4 != null) {
            l15Var4.z.removeOnMultiWindowModeChangedListener(this.r);
        }
        l15 l15Var5 = this.v;
        if (l15Var5 != null) {
            l15Var5.z.removeOnPictureInPictureModeChangedListener(this.s);
        }
        l15 l15Var6 = this.v;
        if (l15Var6 != null && this.x == null) {
            l15Var6.z.removeMenuProvider(this.t);
        }
        this.v = null;
        this.w = null;
        this.x = null;
        if (this.g != null) {
            this.h.e();
            this.g = null;
        }
        q7 q7Var = this.B;
        if (q7Var != null) {
            q7Var.b();
            this.C.b();
            this.D.b();
        }
    }

    public final void l(boolean z) {
        if (z && this.v != null) {
            g0(new IllegalStateException("Do not call dispatchLowMemory() on host. Host implements OnTrimMemoryProvider and automatically dispatches low memory callbacks to fragments."));
            throw null;
        }
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null) {
                j15Var.E = true;
                if (z) {
                    j15Var.u.l(true);
                }
            }
        }
    }

    public final void m(boolean z) {
        if (z && this.v != null) {
            g0(new IllegalStateException("Do not call dispatchMultiWindowModeChanged() on host. Host implements OnMultiWindowModeChangedProvider and automatically dispatches multi-window mode changes to fragments."));
            throw null;
        }
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null && z) {
                j15Var.u.m(true);
            }
        }
    }

    public final void n() {
        for (j15 j15Var : this.c.K()) {
            if (j15Var != null) {
                j15Var.u();
                j15Var.u.n();
            }
        }
    }

    public final boolean o() {
        if (this.u >= 1) {
            for (j15 j15Var : this.c.M()) {
                if (j15Var != null) {
                    if (!j15Var.z ? j15Var.u.o() : false) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final void p() {
        if (this.u < 1) {
            return;
        }
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null && !j15Var.z) {
                j15Var.u.p();
            }
        }
    }

    public final void q(j15 j15Var) {
        if (j15Var != null) {
            if (j15Var != this.c.E(j15Var.e)) {
                return;
            }
            j15Var.s.getClass();
            boolean zM = M(j15Var);
            Boolean bool = j15Var.j;
            if (bool == null || bool.booleanValue() != zM) {
                j15Var.j = Boolean.valueOf(zM);
                g25 g25Var = j15Var.u;
                g25Var.i0();
                g25Var.q(g25Var.y);
            }
        }
    }

    public final void r(boolean z) {
        if (z && this.v != null) {
            g0(new IllegalStateException("Do not call dispatchPictureInPictureModeChanged() on host. Host implements OnPictureInPictureModeChangedProvider and automatically dispatches picture-in-picture mode changes to fragments."));
            throw null;
        }
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null && z) {
                j15Var.u.r(true);
            }
        }
    }

    public final boolean s() {
        if (this.u < 1) {
            return false;
        }
        boolean z = false;
        for (j15 j15Var : this.c.M()) {
            if (j15Var != null && L(j15Var)) {
                if (!j15Var.z ? j15Var.u.s() : false) {
                    z = true;
                }
            }
        }
        return z;
    }

    public final void t(int i) {
        try {
            this.b = true;
            for (s25 s25Var : ((HashMap) this.c.c).values()) {
                if (s25Var != null) {
                    s25Var.e = i;
                }
            }
            O(i, false);
            Iterator it2 = e().iterator();
            while (it2.hasNext()) {
                ((g23) it2.next()).e();
            }
            this.b = false;
            y(true);
        } catch (Throwable th) {
            this.b = false;
            throw th;
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        j15 j15Var = this.x;
        if (j15Var != null) {
            sb.append(j15Var.getClass().getSimpleName());
            sb.append("{");
            sb.append(Integer.toHexString(System.identityHashCode(this.x)));
            sb.append("}");
        } else {
            l15 l15Var = this.v;
            if (l15Var != null) {
                sb.append(l15Var.getClass().getSimpleName());
                sb.append("{");
                sb.append(Integer.toHexString(System.identityHashCode(this.v)));
                sb.append("}");
            } else {
                sb.append("null");
            }
        }
        sb.append("}}");
        return sb.toString();
    }

    public final void u() {
        if (this.J) {
            this.J = false;
            f0();
        }
    }

    public final void w(c25 c25Var, boolean z) {
        if (!z) {
            if (this.v == null) {
                if (this.I) {
                    ygf.f("FragmentManager has been destroyed");
                    return;
                } else {
                    ygf.f("FragmentManager has not been attached to a host.");
                    return;
                }
            }
            if (N()) {
                ygf.f("Can not perform this action after onSaveInstanceState");
                return;
            }
        }
        synchronized (this.a) {
            try {
                if (this.v == null) {
                    if (!z) {
                        throw new IllegalStateException("Activity has been destroyed");
                    }
                } else {
                    this.a.add(c25Var);
                    X();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void x(boolean z) {
        if (this.b) {
            ygf.f("FragmentManager is already executing transactions");
            return;
        }
        if (this.v == null) {
            if (this.I) {
                ygf.f("FragmentManager has been destroyed");
                return;
            } else {
                ygf.f("FragmentManager has not been attached to a host.");
                return;
            }
        }
        if (Looper.myLooper() != this.v.x.getLooper()) {
            ygf.f("Must be called from main thread of fragment host");
            return;
        }
        if (!z && N()) {
            ygf.f("Can not perform this action after onSaveInstanceState");
        } else if (this.K == null) {
            this.K = new ArrayList();
            this.L = new ArrayList();
        }
    }

    public final boolean y(boolean z) {
        boolean zA;
        ArrayList arrayList;
        x(z);
        boolean z2 = false;
        while (true) {
            ArrayList arrayList2 = this.K;
            ArrayList arrayList3 = this.L;
            synchronized (this.a) {
                if (this.a.isEmpty()) {
                    zA = false;
                } else {
                    try {
                        int size = this.a.size();
                        int i = 0;
                        zA = false;
                        while (true) {
                            arrayList = this.a;
                            if (i >= size) {
                                break;
                            }
                            zA |= ((c25) arrayList.get(i)).a(arrayList2, arrayList3);
                            i++;
                        }
                        arrayList.clear();
                        this.v.x.removeCallbacks(this.O);
                    } finally {
                    }
                }
            }
            if (!zA) {
                i0();
                u();
                ((HashMap) this.c.c).values().removeAll(Collections.singleton(null));
                return z2;
            }
            z2 = true;
            this.b = true;
            try {
                U(this.K, this.L);
            } finally {
                d();
            }
        }
    }

    public final void z(km0 km0Var, boolean z) {
        if (z && (this.v == null || this.I)) {
            return;
        }
        x(z);
        km0Var.a(this.K, this.L);
        this.b = true;
        try {
            U(this.K, this.L);
            d();
            i0();
            u();
            ((HashMap) this.c.c).values().removeAll(Collections.singleton(null));
        } catch (Throwable th) {
            d();
            throw th;
        }
    }

    public final void v(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int size;
        int size2;
        String str2;
        String strY = km4.y(str, "    ");
        n0c n0cVar = this.c;
        ArrayList arrayList = (ArrayList) n0cVar.b;
        String strY2 = km4.y(str, "    ");
        HashMap map = (HashMap) n0cVar.c;
        if (!map.isEmpty()) {
            printWriter.print(str);
            printWriter.println("Active Fragments:");
            for (s25 s25Var : map.values()) {
                printWriter.print(str);
                if (s25Var != null) {
                    j15 j15Var = s25Var.c;
                    printWriter.println(j15Var);
                    printWriter.print(strY2);
                    printWriter.print("mFragmentId=#");
                    printWriter.print(Integer.toHexString(j15Var.w));
                    printWriter.print(" mContainerId=#");
                    printWriter.print(Integer.toHexString(j15Var.x));
                    printWriter.print(" mTag=");
                    printWriter.println(j15Var.y);
                    printWriter.print(strY2);
                    printWriter.print("mState=");
                    printWriter.print(j15Var.a);
                    printWriter.print(" mWho=");
                    printWriter.print(j15Var.e);
                    printWriter.print(" mBackStackNesting=");
                    printWriter.println(j15Var.r);
                    printWriter.print(strY2);
                    printWriter.print("mAdded=");
                    printWriter.print(j15Var.k);
                    printWriter.print(" mRemoving=");
                    printWriter.print(j15Var.l);
                    printWriter.print(kSWQKWZ.qgGOMaNaOfARlw);
                    printWriter.print(j15Var.n);
                    printWriter.print(" mInLayout=");
                    printWriter.println(j15Var.o);
                    printWriter.print(strY2);
                    printWriter.print("mHidden=");
                    printWriter.print(j15Var.z);
                    printWriter.print(" mDetached=");
                    printWriter.print(j15Var.A);
                    printWriter.print(" mMenuVisible=");
                    printWriter.print(j15Var.D);
                    printWriter.print(" mHasMenu=");
                    printWriter.println(false);
                    printWriter.print(strY2);
                    printWriter.print("mRetainInstance=");
                    printWriter.print(j15Var.B);
                    printWriter.print(" mUserVisibleHint=");
                    printWriter.println(j15Var.I);
                    if (j15Var.s != null) {
                        printWriter.print(strY2);
                        printWriter.print("mFragmentManager=");
                        printWriter.println(j15Var.s);
                    }
                    if (j15Var.t != null) {
                        printWriter.print(strY2);
                        printWriter.print("mHost=");
                        printWriter.println(j15Var.t);
                    }
                    if (j15Var.v != null) {
                        printWriter.print(strY2);
                        printWriter.print("mParentFragment=");
                        printWriter.println(j15Var.v);
                    }
                    if (j15Var.f != null) {
                        printWriter.print(strY2);
                        printWriter.print("mArguments=");
                        printWriter.println(j15Var.f);
                    }
                    if (j15Var.b != null) {
                        printWriter.print(strY2);
                        printWriter.print("mSavedFragmentState=");
                        printWriter.println(j15Var.b);
                    }
                    if (j15Var.c != null) {
                        printWriter.print(strY2);
                        printWriter.print("mSavedViewState=");
                        printWriter.println(j15Var.c);
                    }
                    if (j15Var.d != null) {
                        printWriter.print(strY2);
                        printWriter.print("mSavedViewRegistryState=");
                        printWriter.println(j15Var.d);
                    }
                    Object objE = j15Var.g;
                    if (objE == null) {
                        f25 f25Var = j15Var.s;
                        objE = (f25Var == null || (str2 = j15Var.h) == null) ? null : f25Var.c.E(str2);
                    }
                    if (objE != null) {
                        printWriter.print(strY2);
                        printWriter.print("mTarget=");
                        printWriter.print(objE);
                        printWriter.print(" mTargetRequestCode=");
                        printWriter.println(j15Var.i);
                    }
                    printWriter.print(strY2);
                    printWriter.print("mPopDirection=");
                    f15 f15Var = j15Var.J;
                    printWriter.println(f15Var == null ? false : f15Var.a);
                    f15 f15Var2 = j15Var.J;
                    if ((f15Var2 == null ? 0 : f15Var2.b) != 0) {
                        printWriter.print(strY2);
                        printWriter.print("getEnterAnim=");
                        f15 f15Var3 = j15Var.J;
                        printWriter.println(f15Var3 == null ? 0 : f15Var3.b);
                    }
                    f15 f15Var4 = j15Var.J;
                    if ((f15Var4 == null ? 0 : f15Var4.c) != 0) {
                        printWriter.print(strY2);
                        printWriter.print("getExitAnim=");
                        f15 f15Var5 = j15Var.J;
                        printWriter.println(f15Var5 == null ? 0 : f15Var5.c);
                    }
                    f15 f15Var6 = j15Var.J;
                    if ((f15Var6 == null ? 0 : f15Var6.d) != 0) {
                        printWriter.print(strY2);
                        printWriter.print("getPopEnterAnim=");
                        f15 f15Var7 = j15Var.J;
                        printWriter.println(f15Var7 == null ? 0 : f15Var7.d);
                    }
                    f15 f15Var8 = j15Var.J;
                    if ((f15Var8 == null ? 0 : f15Var8.e) != 0) {
                        printWriter.print(strY2);
                        printWriter.print("getPopExitAnim=");
                        f15 f15Var9 = j15Var.J;
                        printWriter.println(f15Var9 == null ? 0 : f15Var9.e);
                    }
                    if (j15Var.F != null) {
                        printWriter.print(strY2);
                        printWriter.print("mContainer=");
                        printWriter.println(j15Var.F);
                    }
                    if (j15Var.G != null) {
                        printWriter.print(strY2);
                        printWriter.print("mView=");
                        printWriter.println(j15Var.G);
                    }
                    if (j15Var.i() != null) {
                        new hx4(j15Var, j15Var.getViewModelStore()).T0(strY2, printWriter);
                    }
                    printWriter.print(strY2);
                    printWriter.println("Child " + j15Var.u + ":");
                    j15Var.u.v(strY2.concat("  "), fileDescriptor, printWriter, strArr);
                } else {
                    printWriter.println("null");
                }
            }
        }
        int size3 = arrayList.size();
        if (size3 > 0) {
            printWriter.print(str);
            printWriter.println("Added Fragments:");
            for (int i = 0; i < size3; i++) {
                j15 j15Var2 = (j15) arrayList.get(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.println(j15Var2.toString());
            }
        }
        ArrayList arrayList2 = this.e;
        if (arrayList2 != null && (size2 = arrayList2.size()) > 0) {
            printWriter.print(str);
            printWriter.println(PdtluglzAX.UvTIbvmNkhAu);
            for (int i2 = 0; i2 < size2; i2++) {
                j15 j15Var3 = (j15) this.e.get(i2);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i2);
                printWriter.print(": ");
                printWriter.println(j15Var3.toString());
            }
        }
        ArrayList arrayList3 = this.d;
        if (arrayList3 != null && (size = arrayList3.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Back Stack:");
            for (int i3 = 0; i3 < size; i3++) {
                km0 km0Var = (km0) this.d.get(i3);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i3);
                printWriter.print(": ");
                printWriter.println(km0Var.toString());
                km0Var.f(strY, printWriter, true);
            }
        }
        printWriter.print(str);
        printWriter.println("Back Stack Index: " + this.i.get());
        synchronized (this.a) {
            try {
                int size4 = this.a.size();
                if (size4 > 0) {
                    printWriter.print(str);
                    printWriter.println("Pending Actions:");
                    for (int i4 = 0; i4 < size4; i4++) {
                        Object obj = (c25) this.a.get(i4);
                        printWriter.print(str);
                        printWriter.print("  #");
                        printWriter.print(i4);
                        printWriter.print(": ");
                        printWriter.println(obj);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print(kSWQKWZ.Snrz);
        printWriter.println(this.v);
        printWriter.print(str);
        printWriter.print("  mContainer=");
        printWriter.println(this.w);
        if (this.x != null) {
            printWriter.print(str);
            printWriter.print("  mParent=");
            printWriter.println(this.x);
        }
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.u);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.G);
        printWriter.print(" mStopped=");
        printWriter.print(this.H);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.I);
        if (this.F) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.F);
        }
    }
}
