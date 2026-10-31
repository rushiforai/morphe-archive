package androidx.fragment.app;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.IntentSenderRequest;
import androidx.activity.result.contract.ActivityResultContracts$RequestMultiplePermissions;
import androidx.activity.result.contract.ActivityResultContracts$StartActivityForResult;
import e10.k4;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class h1 {
    public r0 A;
    public final a1 B;
    public final lm.e C;
    public j.h D;
    public j.h E;
    public j.h F;
    public ArrayDeque G;
    public boolean H;
    public boolean I;
    public boolean J;
    public boolean K;
    public boolean L;
    public ArrayList M;
    public ArrayList N;
    public ArrayList O;
    public k1 P;
    public final b1 Q;

    /* renamed from: b, reason: collision with root package name */
    public boolean f14570b;

    /* renamed from: e, reason: collision with root package name */
    public ArrayList f14573e;

    /* renamed from: g, reason: collision with root package name */
    public g.a0 f14575g;
    public final ArrayList n;
    public final x7.e o;

    /* renamed from: p, reason: collision with root package name */
    public final CopyOnWriteArrayList f14582p;

    /* renamed from: q, reason: collision with root package name */
    public final w0 f14583q;

    /* renamed from: r, reason: collision with root package name */
    public final w0 f14584r;

    /* renamed from: s, reason: collision with root package name */
    public final w0 f14585s;

    /* renamed from: t, reason: collision with root package name */
    public final w0 f14586t;

    /* renamed from: u, reason: collision with root package name */
    public final z0 f14587u;

    /* renamed from: v, reason: collision with root package name */
    public int f14588v;

    /* renamed from: w, reason: collision with root package name */
    public s0 f14589w;

    /* renamed from: x, reason: collision with root package name */
    public p0 f14590x;

    /* renamed from: y, reason: collision with root package name */
    public h0 f14591y;

    /* renamed from: z, reason: collision with root package name */
    public h0 f14592z;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14569a = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final o1 f14571c = new o1();

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f14572d = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public final u0 f14574f = new u0(this);

    /* renamed from: h, reason: collision with root package name */
    public a f14576h = null;

    /* renamed from: i, reason: collision with root package name */
    public boolean f14577i = false;

    /* renamed from: j, reason: collision with root package name */
    public final y0 f14578j = new y0(this);

    /* renamed from: k, reason: collision with root package name */
    public final AtomicInteger f14579k = new AtomicInteger();

    /* renamed from: l, reason: collision with root package name */
    public final Map f14580l = Collections.synchronizedMap(new HashMap());

    /* renamed from: m, reason: collision with root package name */
    public final Map f14581m = Collections.synchronizedMap(new HashMap());

    /* JADX WARN: Type inference failed for: r1v11, types: [androidx.fragment.app.w0] */
    /* JADX WARN: Type inference failed for: r1v12, types: [androidx.fragment.app.w0] */
    /* JADX WARN: Type inference failed for: r1v13, types: [androidx.fragment.app.w0] */
    /* JADX WARN: Type inference failed for: r1v14, types: [androidx.fragment.app.w0] */
    public h1() {
        Collections.synchronizedMap(new HashMap());
        this.n = new ArrayList();
        x7.e eVar = new x7.e();
        eVar.f95130a = this;
        eVar.f95131b = new CopyOnWriteArrayList();
        this.o = eVar;
        this.f14582p = new CopyOnWriteArrayList();
        final int i5 = 0;
        this.f14583q = new z4.a(this) { // from class: androidx.fragment.app.w0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ h1 f14706b;

            {
                this.f14706b = this;
            }

            @Override // z4.a
            public final void accept(Object obj) {
                switch (i5) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        h1 h1Var = this.f14706b;
                        if (h1Var.M()) {
                            h1Var.i(false, configuration);
                            break;
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        h1 h1Var2 = this.f14706b;
                        if (h1Var2.M() && num.intValue() == 80) {
                            h1Var2.m(false);
                            break;
                        }
                        break;
                    case 2:
                        n4.k kVar = (n4.k) obj;
                        h1 h1Var3 = this.f14706b;
                        if (h1Var3.M()) {
                            h1Var3.n(kVar.a(), false);
                            break;
                        }
                        break;
                    default:
                        n4.r0 r0Var = (n4.r0) obj;
                        h1 h1Var4 = this.f14706b;
                        if (h1Var4.M()) {
                            h1Var4.s(r0Var.a(), false);
                            break;
                        }
                        break;
                }
            }
        };
        final int i11 = 1;
        this.f14584r = new z4.a(this) { // from class: androidx.fragment.app.w0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ h1 f14706b;

            {
                this.f14706b = this;
            }

            @Override // z4.a
            public final void accept(Object obj) {
                switch (i11) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        h1 h1Var = this.f14706b;
                        if (h1Var.M()) {
                            h1Var.i(false, configuration);
                            break;
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        h1 h1Var2 = this.f14706b;
                        if (h1Var2.M() && num.intValue() == 80) {
                            h1Var2.m(false);
                            break;
                        }
                        break;
                    case 2:
                        n4.k kVar = (n4.k) obj;
                        h1 h1Var3 = this.f14706b;
                        if (h1Var3.M()) {
                            h1Var3.n(kVar.a(), false);
                            break;
                        }
                        break;
                    default:
                        n4.r0 r0Var = (n4.r0) obj;
                        h1 h1Var4 = this.f14706b;
                        if (h1Var4.M()) {
                            h1Var4.s(r0Var.a(), false);
                            break;
                        }
                        break;
                }
            }
        };
        final int i12 = 2;
        this.f14585s = new z4.a(this) { // from class: androidx.fragment.app.w0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ h1 f14706b;

            {
                this.f14706b = this;
            }

            @Override // z4.a
            public final void accept(Object obj) {
                switch (i12) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        h1 h1Var = this.f14706b;
                        if (h1Var.M()) {
                            h1Var.i(false, configuration);
                            break;
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        h1 h1Var2 = this.f14706b;
                        if (h1Var2.M() && num.intValue() == 80) {
                            h1Var2.m(false);
                            break;
                        }
                        break;
                    case 2:
                        n4.k kVar = (n4.k) obj;
                        h1 h1Var3 = this.f14706b;
                        if (h1Var3.M()) {
                            h1Var3.n(kVar.a(), false);
                            break;
                        }
                        break;
                    default:
                        n4.r0 r0Var = (n4.r0) obj;
                        h1 h1Var4 = this.f14706b;
                        if (h1Var4.M()) {
                            h1Var4.s(r0Var.a(), false);
                            break;
                        }
                        break;
                }
            }
        };
        final int i13 = 3;
        this.f14586t = new z4.a(this) { // from class: androidx.fragment.app.w0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ h1 f14706b;

            {
                this.f14706b = this;
            }

            @Override // z4.a
            public final void accept(Object obj) {
                switch (i13) {
                    case 0:
                        Configuration configuration = (Configuration) obj;
                        h1 h1Var = this.f14706b;
                        if (h1Var.M()) {
                            h1Var.i(false, configuration);
                            break;
                        }
                        break;
                    case 1:
                        Integer num = (Integer) obj;
                        h1 h1Var2 = this.f14706b;
                        if (h1Var2.M() && num.intValue() == 80) {
                            h1Var2.m(false);
                            break;
                        }
                        break;
                    case 2:
                        n4.k kVar = (n4.k) obj;
                        h1 h1Var3 = this.f14706b;
                        if (h1Var3.M()) {
                            h1Var3.n(kVar.a(), false);
                            break;
                        }
                        break;
                    default:
                        n4.r0 r0Var = (n4.r0) obj;
                        h1 h1Var4 = this.f14706b;
                        if (h1Var4.M()) {
                            h1Var4.s(r0Var.a(), false);
                            break;
                        }
                        break;
                }
            }
        };
        this.f14587u = new z0(this);
        this.f14588v = -1;
        this.A = null;
        this.B = new a1(this);
        this.C = new lm.e(2);
        this.G = new ArrayDeque();
        this.Q = new b1(this);
    }

    public static h0 F(View view) {
        while (view != null) {
            Object tag = view.getTag(2131428093);
            h0 h0Var = tag instanceof h0 ? (h0) tag : null;
            if (h0Var != null) {
                return h0Var;
            }
            Object parent = view.getParent();
            view = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    public static HashSet G(a aVar) {
        HashSet hashSet = new HashSet();
        for (int i5 = 0; i5 < aVar.f14661c.size(); i5++) {
            h0 h0Var = ((p1) aVar.f14661c.get(i5)).f14650b;
            if (h0Var != null && aVar.f14667i) {
                hashSet.add(h0Var);
            }
        }
        return hashSet;
    }

    public static boolean K(int i5) {
        return Log.isLoggable("FragmentManager", i5);
    }

    public static boolean L(h0 h0Var) {
        if (h0Var.mHasMenu && h0Var.mMenuVisible) {
            return true;
        }
        Iterator it = h0Var.mChildFragmentManager.f14571c.e().iterator();
        boolean zL = false;
        while (it.hasNext()) {
            h0 h0Var2 = (h0) it.next();
            if (h0Var2 != null) {
                zL = L(h0Var2);
            }
            if (zL) {
                return true;
            }
        }
        return false;
    }

    public static boolean N(h0 h0Var) {
        if (h0Var == null) {
            return true;
        }
        h1 h1Var = h0Var.mFragmentManager;
        return h0Var.equals(h1Var.f14592z) && N(h1Var.f14591y);
    }

    public final boolean A(boolean z11) {
        boolean zA;
        a aVar;
        z(z11);
        if (!this.f14577i && (aVar = this.f14576h) != null) {
            aVar.f14488u = false;
            aVar.j();
            if (K(3)) {
                Objects.toString(this.f14576h);
                Objects.toString(this.f14569a);
            }
            this.f14576h.l(false, false);
            this.f14569a.add(0, this.f14576h);
            Iterator it = this.f14576h.f14661c.iterator();
            while (it.hasNext()) {
                h0 h0Var = ((p1) it.next()).f14650b;
                if (h0Var != null) {
                    h0Var.mTransitioning = false;
                }
            }
            this.f14576h = null;
        }
        boolean z12 = false;
        while (true) {
            ArrayList arrayList = this.M;
            ArrayList arrayList2 = this.N;
            synchronized (this.f14569a) {
                if (this.f14569a.isEmpty()) {
                    zA = false;
                } else {
                    try {
                        int size = this.f14569a.size();
                        zA = false;
                        for (int i5 = 0; i5 < size; i5++) {
                            zA |= ((e1) this.f14569a.get(i5)).a(arrayList, arrayList2);
                        }
                    } finally {
                    }
                }
            }
            if (!zA) {
                f0();
                v();
                this.f14571c.f14644b.values().removeAll(Collections.singleton(null));
                return z12;
            }
            z12 = true;
            this.f14570b = true;
            try {
                V(this.M, this.N);
            } finally {
                d();
            }
        }
    }

    public final void B(a aVar, boolean z11) {
        if (z11 && (this.f14589w == null || this.K)) {
            return;
        }
        z(z11);
        a aVar2 = this.f14576h;
        if (aVar2 != null) {
            aVar2.f14488u = false;
            aVar2.j();
            if (K(3)) {
                Objects.toString(this.f14576h);
                Objects.toString(aVar);
            }
            this.f14576h.l(false, false);
            this.f14576h.a(this.M, this.N);
            Iterator it = this.f14576h.f14661c.iterator();
            while (it.hasNext()) {
                h0 h0Var = ((p1) it.next()).f14650b;
                if (h0Var != null) {
                    h0Var.mTransitioning = false;
                }
            }
            this.f14576h = null;
        }
        aVar.a(this.M, this.N);
        this.f14570b = true;
        try {
            V(this.M, this.N);
            d();
            f0();
            v();
            this.f14571c.f14644b.values().removeAll(Collections.singleton(null));
        } catch (Throwable th2) {
            d();
            throw th2;
        }
    }

    public final void C(int i5, int i11, ArrayList arrayList, ArrayList arrayList2) {
        boolean z11 = ((a) arrayList.get(i5)).f14674r;
        ArrayList arrayList3 = this.O;
        if (arrayList3 == null) {
            this.O = new ArrayList();
        } else {
            arrayList3.clear();
        }
        ArrayList arrayList4 = this.O;
        o1 o1Var = this.f14571c;
        arrayList4.addAll(o1Var.f());
        h0 h0VarR = this.f14592z;
        boolean z12 = false;
        for (int i12 = i5; i12 < i11; i12++) {
            a aVar = (a) arrayList.get(i12);
            h0VarR = !((Boolean) arrayList2.get(i12)).booleanValue() ? aVar.r(this.O, h0VarR) : aVar.u(this.O, h0VarR);
            z12 = z12 || aVar.f14667i;
        }
        this.O.clear();
        if (!z11 && this.f14588v >= 1) {
            for (int i13 = i5; i13 < i11; i13++) {
                Iterator it = ((a) arrayList.get(i13)).f14661c.iterator();
                while (it.hasNext()) {
                    h0 h0Var = ((p1) it.next()).f14650b;
                    if (h0Var != null && h0Var.mFragmentManager != null) {
                        o1Var.g(g(h0Var));
                    }
                }
            }
        }
        for (int i14 = i5; i14 < i11; i14++) {
            a aVar2 = (a) arrayList.get(i14);
            if (((Boolean) arrayList2.get(i14)).booleanValue()) {
                aVar2.i(-1);
                aVar2.q();
            } else {
                aVar2.i(1);
                aVar2.p();
            }
        }
        boolean zBooleanValue = ((Boolean) arrayList2.get(i11 - 1)).booleanValue();
        ArrayList arrayList5 = this.n;
        if (z12 && !arrayList5.isEmpty()) {
            LinkedHashSet<h0> linkedHashSet = new LinkedHashSet();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                linkedHashSet.addAll(G((a) it2.next()));
            }
            if (this.f14576h == null) {
                Iterator it3 = arrayList5.iterator();
                while (it3.hasNext()) {
                    k4 k4Var = (k4) it3.next();
                    for (h0 h0Var2 : linkedHashSet) {
                        k4Var.getClass();
                    }
                }
                Iterator it4 = arrayList5.iterator();
                while (it4.hasNext()) {
                    k4 k4Var2 = (k4) it4.next();
                    for (h0 h0Var3 : linkedHashSet) {
                        k4Var2.getClass();
                    }
                }
            }
        }
        for (int i15 = i5; i15 < i11; i15++) {
            a aVar3 = (a) arrayList.get(i15);
            if (zBooleanValue) {
                for (int size = aVar3.f14661c.size() - 1; size >= 0; size--) {
                    h0 h0Var4 = ((p1) aVar3.f14661c.get(size)).f14650b;
                    if (h0Var4 != null) {
                        g(h0Var4).j();
                    }
                }
            } else {
                Iterator it5 = aVar3.f14661c.iterator();
                while (it5.hasNext()) {
                    h0 h0Var5 = ((p1) it5.next()).f14650b;
                    if (h0Var5 != null) {
                        g(h0Var5).j();
                    }
                }
            }
        }
        P(this.f14588v, true);
        Iterator it6 = f(arrayList, i5, i11).iterator();
        while (it6.hasNext()) {
            f2 f2Var = (f2) it6.next();
            f2Var.r(zBooleanValue);
            f2Var.n();
            f2Var.f();
        }
        while (i5 < i11) {
            a aVar4 = (a) arrayList.get(i5);
            if (((Boolean) arrayList2.get(i5)).booleanValue() && aVar4.f14489v >= 0) {
                aVar4.f14489v = -1;
            }
            aVar4.t();
            i5++;
        }
        if (z12) {
            for (int i16 = 0; i16 < arrayList5.size(); i16++) {
                ((k4) arrayList5.get(i16)).a();
            }
        }
    }

    public final h0 D(int i5) {
        o1 o1Var = this.f14571c;
        ArrayList arrayList = o1Var.f14643a;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            h0 h0Var = (h0) arrayList.get(size);
            if (h0Var != null && h0Var.mFragmentId == i5) {
                return h0Var;
            }
        }
        for (n1 n1Var : o1Var.f14644b.values()) {
            if (n1Var != null) {
                h0 h0VarI = n1Var.i();
                if (h0VarI.mFragmentId == i5) {
                    return h0VarI;
                }
            }
        }
        return null;
    }

    public final h0 E(String str) {
        o1 o1Var = this.f14571c;
        ArrayList arrayList = o1Var.f14643a;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            h0 h0Var = (h0) arrayList.get(size);
            if (h0Var != null && str.equals(h0Var.mTag)) {
                return h0Var;
            }
        }
        for (n1 n1Var : o1Var.f14644b.values()) {
            if (n1Var != null) {
                h0 h0VarI = n1Var.i();
                if (str.equals(h0VarI.mTag)) {
                    return h0VarI;
                }
            }
        }
        return null;
    }

    public final ViewGroup H(h0 h0Var) {
        ViewGroup viewGroup = h0Var.mContainer;
        if (viewGroup != null) {
            return viewGroup;
        }
        if (h0Var.mContainerId <= 0 || !this.f14590x.c()) {
            return null;
        }
        View viewB = this.f14590x.b(h0Var.mContainerId);
        if (viewB instanceof ViewGroup) {
            return (ViewGroup) viewB;
        }
        return null;
    }

    public final r0 I() {
        r0 r0Var = this.A;
        if (r0Var != null) {
            return r0Var;
        }
        h0 h0Var = this.f14591y;
        return h0Var != null ? h0Var.mFragmentManager.I() : this.B;
    }

    public final lm.e J() {
        h0 h0Var = this.f14591y;
        return h0Var != null ? h0Var.mFragmentManager.J() : this.C;
    }

    public final boolean M() {
        h0 h0Var = this.f14591y;
        if (h0Var == null) {
            return true;
        }
        return h0Var.isAdded() && this.f14591y.getParentFragmentManager().M();
    }

    public final boolean O() {
        return this.I || this.J;
    }

    public final void P(int i5, boolean z11) {
        s0 s0Var;
        if (this.f14589w == null && i5 != -1) {
            throw new IllegalStateException("No activity");
        }
        if (z11 || i5 != this.f14588v) {
            this.f14588v = i5;
            o1 o1Var = this.f14571c;
            HashMap map = o1Var.f14644b;
            Iterator it = o1Var.f14643a.iterator();
            while (it.hasNext()) {
                n1 n1Var = (n1) map.get(((h0) it.next()).mWho);
                if (n1Var != null) {
                    n1Var.j();
                }
            }
            for (n1 n1Var2 : map.values()) {
                if (n1Var2 != null) {
                    n1Var2.j();
                    h0 h0VarI = n1Var2.i();
                    if (h0VarI.mRemoving && !h0VarI.isInBackStack()) {
                        if (h0VarI.mBeingSaved && !o1Var.f14645c.containsKey(h0VarI.mWho)) {
                            o1Var.i(h0VarI.mWho, n1Var2.m());
                        }
                        o1Var.h(n1Var2);
                    }
                }
            }
            d0();
            if (this.H && (s0Var = this.f14589w) != null && this.f14588v == 7) {
                ((l0) s0Var).f14610e.invalidateMenu();
                this.H = false;
            }
        }
    }

    public final void Q() {
        if (this.f14589w == null) {
            return;
        }
        this.I = false;
        this.J = false;
        this.P.f14608f = false;
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null) {
                h0Var.noteStateNotSaved();
            }
        }
    }

    public final boolean R() {
        return S(-1, 0);
    }

    public final boolean S(int i5, int i11) {
        A(false);
        z(true);
        h0 h0Var = this.f14592z;
        if (h0Var != null && i5 < 0 && h0Var.getChildFragmentManager().R()) {
            return true;
        }
        boolean zT = T(i5, i11, this.M, this.N);
        if (zT) {
            this.f14570b = true;
            try {
                V(this.M, this.N);
            } finally {
                d();
            }
        }
        f0();
        v();
        this.f14571c.f14644b.values().removeAll(Collections.singleton(null));
        return zT;
    }

    public final boolean T(int i5, int i11, ArrayList arrayList, ArrayList arrayList2) {
        boolean z11 = (i11 & 1) != 0;
        int size = -1;
        if (!this.f14572d.isEmpty()) {
            if (i5 < 0) {
                size = z11 ? 0 : this.f14572d.size() - 1;
            } else {
                int size2 = this.f14572d.size() - 1;
                while (size2 >= 0) {
                    a aVar = (a) this.f14572d.get(size2);
                    if (i5 >= 0 && i5 == aVar.f14489v) {
                        break;
                    }
                    size2--;
                }
                if (size2 < 0) {
                    size = size2;
                } else if (z11) {
                    size = size2;
                    while (size > 0) {
                        a aVar2 = (a) this.f14572d.get(size - 1);
                        if (i5 < 0 || i5 != aVar2.f14489v) {
                            break;
                        }
                        size--;
                    }
                } else if (size2 != this.f14572d.size() - 1) {
                    size = size2 + 1;
                }
            }
        }
        if (size < 0) {
            return false;
        }
        for (int size3 = this.f14572d.size() - 1; size3 >= size; size3--) {
            arrayList.add((a) this.f14572d.remove(size3));
            arrayList2.add(Boolean.TRUE);
        }
        return true;
    }

    public final void U(h0 h0Var) {
        if (K(2)) {
            Objects.toString(h0Var);
        }
        boolean zIsInBackStack = h0Var.isInBackStack();
        if (h0Var.mDetached && zIsInBackStack) {
            return;
        }
        o1 o1Var = this.f14571c;
        synchronized (o1Var.f14643a) {
            o1Var.f14643a.remove(h0Var);
        }
        h0Var.mAdded = false;
        if (L(h0Var)) {
            this.H = true;
        }
        h0Var.mRemoving = true;
        c0(h0Var);
    }

    public final void V(ArrayList arrayList, ArrayList arrayList2) {
        if (arrayList.isEmpty()) {
            return;
        }
        if (arrayList.size() != arrayList2.size()) {
            throw new IllegalStateException("Internal error with the back stack records");
        }
        int size = arrayList.size();
        int i5 = 0;
        int i11 = 0;
        while (i5 < size) {
            if (!((a) arrayList.get(i5)).f14674r) {
                if (i11 != i5) {
                    C(i11, i5, arrayList, arrayList2);
                }
                i11 = i5 + 1;
                if (((Boolean) arrayList2.get(i5)).booleanValue()) {
                    while (i11 < size && ((Boolean) arrayList2.get(i11)).booleanValue() && !((a) arrayList.get(i11)).f14674r) {
                        i11++;
                    }
                }
                C(i5, i11, arrayList, arrayList2);
                i5 = i11 - 1;
            }
            i5++;
        }
        if (i11 != size) {
            C(i11, size, arrayList, arrayList2);
        }
    }

    public final void W(Bundle bundle) {
        x7.e eVar;
        n1 n1Var;
        Bundle bundle2;
        Bundle bundle3;
        for (String str : bundle.keySet()) {
            if (str.startsWith("result_") && (bundle3 = bundle.getBundle(str)) != null) {
                bundle3.setClassLoader(this.f14589w.f14682b.getClassLoader());
                this.f14581m.put(str.substring(7), bundle3);
            }
        }
        HashMap map = new HashMap();
        for (String str2 : bundle.keySet()) {
            if (str2.startsWith("fragment_") && (bundle2 = bundle.getBundle(str2)) != null) {
                bundle2.setClassLoader(this.f14589w.f14682b.getClassLoader());
                map.put(str2.substring(9), bundle2);
            }
        }
        o1 o1Var = this.f14571c;
        HashMap map2 = o1Var.f14645c;
        HashMap map3 = o1Var.f14644b;
        map2.clear();
        map2.putAll(map);
        FragmentManagerState fragmentManagerState = (FragmentManagerState) bundle.getParcelable("state");
        if (fragmentManagerState == null) {
            return;
        }
        map3.clear();
        Iterator it = fragmentManagerState.f14458a.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            eVar = this.o;
            if (!zHasNext) {
                break;
            }
            Bundle bundleI = o1Var.i((String) it.next(), null);
            if (bundleI != null) {
                h0 h0Var = (h0) this.P.f14603a.get(((FragmentState) bundleI.getParcelable("state")).f14467b);
                if (h0Var != null) {
                    if (K(2)) {
                        h0Var.toString();
                    }
                    n1Var = new n1(eVar, o1Var, h0Var, bundleI);
                } else {
                    n1Var = new n1(this.o, this.f14571c, this.f14589w.f14682b.getClassLoader(), I(), bundleI);
                }
                h0 h0VarI = n1Var.i();
                h0VarI.mSavedFragmentState = bundleI;
                h0VarI.mFragmentManager = this;
                if (K(2)) {
                    h0VarI.toString();
                }
                n1Var.k(this.f14589w.f14682b.getClassLoader());
                o1Var.g(n1Var);
                n1Var.o(this.f14588v);
            }
        }
        k1 k1Var = this.P;
        k1Var.getClass();
        Iterator it2 = new ArrayList(k1Var.f14603a.values()).iterator();
        while (it2.hasNext()) {
            h0 h0Var2 = (h0) it2.next();
            if (map3.get(h0Var2.mWho) == null) {
                if (K(2)) {
                    h0Var2.toString();
                    Objects.toString(fragmentManagerState.f14458a);
                }
                this.P.g(h0Var2);
                h0Var2.mFragmentManager = this;
                n1 n1Var2 = new n1(eVar, o1Var, h0Var2);
                n1Var2.o(1);
                n1Var2.j();
                h0Var2.mRemoving = true;
                n1Var2.j();
            }
        }
        ArrayList<String> arrayList = fragmentManagerState.f14459b;
        o1Var.f14643a.clear();
        if (arrayList != null) {
            for (String str3 : arrayList) {
                h0 h0VarB = o1Var.b(str3);
                if (h0VarB == null) {
                    throw new IllegalStateException(b.c0.l("No instantiated fragment for (", str3, ")"));
                }
                if (K(2)) {
                    h0VarB.toString();
                }
                o1Var.a(h0VarB);
            }
        }
        if (fragmentManagerState.f14460c != null) {
            this.f14572d = new ArrayList(fragmentManagerState.f14460c.length);
            int i5 = 0;
            while (true) {
                BackStackRecordState[] backStackRecordStateArr = fragmentManagerState.f14460c;
                if (i5 >= backStackRecordStateArr.length) {
                    break;
                }
                a aVarA = backStackRecordStateArr[i5].a(this);
                if (K(2)) {
                    aVarA.toString();
                    PrintWriter printWriter = new PrintWriter(new a2());
                    aVarA.o("  ", printWriter, false);
                    printWriter.close();
                }
                this.f14572d.add(aVarA);
                i5++;
            }
        } else {
            this.f14572d = new ArrayList();
        }
        this.f14579k.set(fragmentManagerState.f14461d);
        String str4 = fragmentManagerState.f14462e;
        if (str4 != null) {
            h0 h0VarB2 = o1Var.b(str4);
            this.f14592z = h0VarB2;
            r(h0VarB2);
        }
        ArrayList arrayList2 = fragmentManagerState.f14463f;
        if (arrayList2 != null) {
            for (int i11 = 0; i11 < arrayList2.size(); i11++) {
                this.f14580l.put((String) arrayList2.get(i11), (BackStackState) fragmentManagerState.f14464g.get(i11));
            }
        }
        this.G = new ArrayDeque(fragmentManagerState.f14465h);
    }

    public final Bundle X() {
        BackStackRecordState[] backStackRecordStateArr;
        ArrayList arrayList;
        Bundle bundle = new Bundle();
        Iterator it = e().iterator();
        while (it.hasNext()) {
            ((f2) it.next()).j();
        }
        x();
        A(true);
        this.I = true;
        this.P.f14608f = true;
        o1 o1Var = this.f14571c;
        o1Var.getClass();
        HashMap map = o1Var.f14644b;
        ArrayList arrayList2 = new ArrayList(map.size());
        for (n1 n1Var : map.values()) {
            if (n1Var != null) {
                h0 h0VarI = n1Var.i();
                o1Var.i(h0VarI.mWho, n1Var.m());
                arrayList2.add(h0VarI.mWho);
                if (K(2)) {
                    h0VarI.toString();
                    Objects.toString(h0VarI.mSavedFragmentState);
                }
            }
        }
        HashMap map2 = this.f14571c.f14645c;
        if (!map2.isEmpty()) {
            o1 o1Var2 = this.f14571c;
            synchronized (o1Var2.f14643a) {
                try {
                    backStackRecordStateArr = null;
                    if (o1Var2.f14643a.isEmpty()) {
                        arrayList = null;
                    } else {
                        arrayList = new ArrayList(o1Var2.f14643a.size());
                        Iterator it2 = o1Var2.f14643a.iterator();
                        while (it2.hasNext()) {
                            h0 h0Var = (h0) it2.next();
                            arrayList.add(h0Var.mWho);
                            if (K(2)) {
                                h0Var.toString();
                            }
                        }
                    }
                } finally {
                }
            }
            int size = this.f14572d.size();
            if (size > 0) {
                backStackRecordStateArr = new BackStackRecordState[size];
                for (int i5 = 0; i5 < size; i5++) {
                    backStackRecordStateArr[i5] = new BackStackRecordState((a) this.f14572d.get(i5));
                    if (K(2)) {
                        Objects.toString(this.f14572d.get(i5));
                    }
                }
            }
            FragmentManagerState fragmentManagerState = new FragmentManagerState();
            fragmentManagerState.f14458a = arrayList2;
            fragmentManagerState.f14459b = arrayList;
            fragmentManagerState.f14460c = backStackRecordStateArr;
            fragmentManagerState.f14461d = this.f14579k.get();
            h0 h0Var2 = this.f14592z;
            if (h0Var2 != null) {
                fragmentManagerState.f14462e = h0Var2.mWho;
            }
            fragmentManagerState.f14463f.addAll(this.f14580l.keySet());
            fragmentManagerState.f14464g.addAll(this.f14580l.values());
            fragmentManagerState.f14465h = new ArrayList(this.G);
            bundle.putParcelable("state", fragmentManagerState);
            for (String str : this.f14581m.keySet()) {
                bundle.putBundle(b.c0.k("result_", str), (Bundle) this.f14581m.get(str));
            }
            for (String str2 : map2.keySet()) {
                bundle.putBundle(b.c0.k("fragment_", str2), (Bundle) map2.get(str2));
            }
        }
        return bundle;
    }

    public final void Y() {
        synchronized (this.f14569a) {
            try {
                if (this.f14569a.size() == 1) {
                    this.f14589w.f14683c.removeCallbacks(this.Q);
                    this.f14589w.f14683c.post(this.Q);
                    f0();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void Z(h0 h0Var, boolean z11) {
        ViewGroup viewGroupH = H(h0Var);
        if (viewGroupH == null || !(viewGroupH instanceof FragmentContainerView)) {
            return;
        }
        ((FragmentContainerView) viewGroupH).f14455d = !z11;
    }

    public final n1 a(h0 h0Var) {
        String str = h0Var.mPreviousWho;
        if (str != null) {
            e6.c.d(h0Var, str);
        }
        if (K(2)) {
            h0Var.toString();
        }
        n1 n1VarG = g(h0Var);
        h0Var.mFragmentManager = this;
        o1 o1Var = this.f14571c;
        o1Var.g(n1VarG);
        if (!h0Var.mDetached) {
            o1Var.a(h0Var);
            h0Var.mRemoving = false;
            if (h0Var.mView == null) {
                h0Var.mHiddenChanged = false;
            }
            if (L(h0Var)) {
                this.H = true;
            }
        }
        return n1VarG;
    }

    public final void a0(h0 h0Var, h6.t tVar) {
        if (h0Var.equals(this.f14571c.b(h0Var.mWho)) && (h0Var.mHost == null || h0Var.mFragmentManager == this)) {
            h0Var.mMaxState = tVar;
            return;
        }
        throw new IllegalArgumentException("Fragment " + h0Var + " is not an active fragment of FragmentManager " + this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void b(s0 s0Var, p0 p0Var, h0 h0Var) {
        if (this.f14589w != null) {
            throw new IllegalStateException("Already attached");
        }
        this.f14589w = s0Var;
        this.f14590x = p0Var;
        this.f14591y = h0Var;
        CopyOnWriteArrayList copyOnWriteArrayList = this.f14582p;
        if (h0Var != null) {
            copyOnWriteArrayList.add(new c1(h0Var));
        } else if (s0Var instanceof l1) {
            copyOnWriteArrayList.add((l1) s0Var);
        }
        if (this.f14591y != null) {
            f0();
        }
        if (s0Var instanceof g.b0) {
            g.b0 b0Var = (g.b0) s0Var;
            g.a0 onBackPressedDispatcher = b0Var.getOnBackPressedDispatcher();
            this.f14575g = onBackPressedDispatcher;
            h6.a0 a0Var = b0Var;
            if (h0Var != null) {
                a0Var = h0Var;
            }
            onBackPressedDispatcher.a(a0Var, this.f14578j);
        }
        if (h0Var != null) {
            k1 k1Var = h0Var.mFragmentManager.P;
            HashMap map = k1Var.f14604b;
            k1 k1Var2 = (k1) map.get(h0Var.mWho);
            if (k1Var2 == null) {
                k1Var2 = new k1(k1Var.f14606d);
                map.put(h0Var.mWho, k1Var2);
            }
            this.P = k1Var2;
        } else if (s0Var instanceof h6.o1) {
            h6.n1 store = ((h6.o1) s0Var).getViewModelStore();
            Intrinsics.g(store, "store");
            k6.a defaultCreationExtras = k6.a.f71149b;
            Intrinsics.g(defaultCreationExtras, "defaultCreationExtras");
            x7.n nVar = new x7.n(store, k1.f14602g, defaultCreationExtras);
            KClass modelClass = JvmClassMappingKt.e(k1.class);
            Intrinsics.g(modelClass, "modelClass");
            String strU = android.support.v4.media.session.b.U(modelClass);
            if (strU == null) {
                throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
            }
            this.P = (k1) nVar.m(modelClass, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strU));
        } else {
            this.P = new k1(false);
        }
        this.P.f14608f = O();
        this.f14571c.f14646d = this.P;
        Object obj = this.f14589w;
        if ((obj instanceof a7.h) && h0Var == null) {
            a7.e savedStateRegistry = ((a7.h) obj).getSavedStateRegistry();
            savedStateRegistry.b("android:support:fragments", new i0(this, 1));
            Bundle bundleA = savedStateRegistry.a("android:support:fragments");
            if (bundleA != null) {
                W(bundleA);
            }
        }
        Object obj2 = this.f14589w;
        if (obj2 instanceof j.j) {
            j.i activityResultRegistry = ((j.j) obj2).getActivityResultRegistry();
            String strK = b.c0.k("FragmentManager:", h0Var != null ? b.c0.q(new StringBuilder(), h0Var.mWho, ":") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            this.D = activityResultRegistry.d(b.c0.E(strK, "StartActivityForResult"), new ActivityResultContracts$StartActivityForResult(), new x0(this, 1));
            this.E = activityResultRegistry.d(b.c0.E(strK, "StartIntentSenderForResult"), new k.b() { // from class: androidx.fragment.app.FragmentManager$FragmentIntentSenderContract
                @Override // k.b
                public final Intent createIntent(Context context, Object obj3) {
                    Bundle bundleExtra;
                    IntentSenderRequest intentSenderRequestB = (IntentSenderRequest) obj3;
                    Intent intent = new Intent("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST");
                    Intent f13600b = intentSenderRequestB.getF13600b();
                    if (f13600b != null && (bundleExtra = f13600b.getBundleExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE")) != null) {
                        intent.putExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE", bundleExtra);
                        f13600b.removeExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE");
                        if (f13600b.getBooleanExtra("androidx.fragment.extra.ACTIVITY_OPTIONS_BUNDLE", false)) {
                            fk.l lVar = new fk.l(intentSenderRequestB.getF13599a());
                            lVar.w(null);
                            lVar.x(intentSenderRequestB.getF13602d(), intentSenderRequestB.getF13601c());
                            intentSenderRequestB = lVar.b();
                        }
                    }
                    intent.putExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST", intentSenderRequestB);
                    if (h1.K(2)) {
                        intent.toString();
                    }
                    return intent;
                }

                @Override // k.b
                public final Object parseResult(int i5, Intent intent) {
                    return new ActivityResult(i5, intent);
                }
            }, new x0(this, 2));
            this.F = activityResultRegistry.d(b.c0.E(strK, "RequestPermissions"), new ActivityResultContracts$RequestMultiplePermissions(), new x0(this, 0));
        }
        Object obj3 = this.f14589w;
        if (obj3 instanceof o4.e) {
            ((o4.e) obj3).addOnConfigurationChangedListener(this.f14583q);
        }
        Object obj4 = this.f14589w;
        if (obj4 instanceof o4.f) {
            ((o4.f) obj4).addOnTrimMemoryListener(this.f14584r);
        }
        Object obj5 = this.f14589w;
        if (obj5 instanceof n4.o0) {
            ((n4.o0) obj5).addOnMultiWindowModeChangedListener(this.f14585s);
        }
        Object obj6 = this.f14589w;
        if (obj6 instanceof n4.p0) {
            ((n4.p0) obj6).addOnPictureInPictureModeChangedListener(this.f14586t);
        }
        Object obj7 = this.f14589w;
        if ((obj7 instanceof a5.p) && h0Var == null) {
            ((a5.p) obj7).addMenuProvider(this.f14587u);
        }
    }

    public final void b0(h0 h0Var) {
        if (h0Var != null) {
            if (!h0Var.equals(this.f14571c.b(h0Var.mWho)) || (h0Var.mHost != null && h0Var.mFragmentManager != this)) {
                throw new IllegalArgumentException("Fragment " + h0Var + " is not an active fragment of FragmentManager " + this);
            }
        }
        h0 h0Var2 = this.f14592z;
        this.f14592z = h0Var;
        r(h0Var2);
        r(this.f14592z);
    }

    public final void c(h0 h0Var) {
        if (K(2)) {
            Objects.toString(h0Var);
        }
        if (h0Var.mDetached) {
            h0Var.mDetached = false;
            if (h0Var.mAdded) {
                return;
            }
            this.f14571c.a(h0Var);
            if (K(2)) {
                h0Var.toString();
            }
            if (L(h0Var)) {
                this.H = true;
            }
        }
    }

    public final void c0(h0 h0Var) {
        ViewGroup viewGroupH = H(h0Var);
        if (viewGroupH != null) {
            if (h0Var.getPopExitAnim() + h0Var.getPopEnterAnim() + h0Var.getExitAnim() + h0Var.getEnterAnim() > 0) {
                if (viewGroupH.getTag(2131429168) == null) {
                    viewGroupH.setTag(2131429168, h0Var);
                }
                ((h0) viewGroupH.getTag(2131429168)).setPopDirection(h0Var.getPopDirection());
            }
        }
    }

    public final void d() {
        this.f14570b = false;
        this.N.clear();
        this.M.clear();
    }

    public final void d0() {
        Iterator it = this.f14571c.d().iterator();
        while (it.hasNext()) {
            n1 n1Var = (n1) it.next();
            h0 h0VarI = n1Var.i();
            if (h0VarI.mDeferStart) {
                if (this.f14570b) {
                    this.L = true;
                } else {
                    h0VarI.mDeferStart = false;
                    n1Var.j();
                }
            }
        }
    }

    public final HashSet e() {
        HashSet hashSet = new HashSet();
        Iterator it = this.f14571c.d().iterator();
        while (it.hasNext()) {
            ViewGroup viewGroup = ((n1) it.next()).i().mContainer;
            if (viewGroup != null) {
                hashSet.add(f2.l(viewGroup, J()));
            }
        }
        return hashSet;
    }

    public final void e0(IllegalStateException illegalStateException) {
        Log.e("FragmentManager", illegalStateException.getMessage());
        Log.e("FragmentManager", "Activity state:");
        PrintWriter printWriter = new PrintWriter(new a2());
        s0 s0Var = this.f14589w;
        if (s0Var == null) {
            try {
                w("  ", null, printWriter, new String[0]);
                throw illegalStateException;
            } catch (Exception e3) {
                Log.e("FragmentManager", "Failed dumping state", e3);
                throw illegalStateException;
            }
        }
        try {
            ((l0) s0Var).f14610e.dump("  ", null, printWriter, new String[0]);
            throw illegalStateException;
        } catch (Exception e11) {
            Log.e("FragmentManager", "Failed dumping state", e11);
            throw illegalStateException;
        }
    }

    public final HashSet f(ArrayList arrayList, int i5, int i11) {
        ViewGroup viewGroup;
        HashSet hashSet = new HashSet();
        while (i5 < i11) {
            Iterator it = ((a) arrayList.get(i5)).f14661c.iterator();
            while (it.hasNext()) {
                h0 h0Var = ((p1) it.next()).f14650b;
                if (h0Var != null && (viewGroup = h0Var.mContainer) != null) {
                    hashSet.add(f2.k(viewGroup, this));
                }
            }
            i5++;
        }
        return hashSet;
    }

    public final void f0() {
        synchronized (this.f14569a) {
            try {
                if (!this.f14569a.isEmpty()) {
                    this.f14578j.setEnabled(true);
                    if (K(3)) {
                        toString();
                    }
                } else {
                    boolean z11 = this.f14572d.size() + (this.f14576h != null ? 1 : 0) > 0 && N(this.f14591y);
                    if (K(3)) {
                        toString();
                    }
                    this.f14578j.setEnabled(z11);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final n1 g(h0 h0Var) {
        String str = h0Var.mWho;
        o1 o1Var = this.f14571c;
        n1 n1Var = (n1) o1Var.f14644b.get(str);
        if (n1Var != null) {
            return n1Var;
        }
        n1 n1Var2 = new n1(this.o, o1Var, h0Var);
        n1Var2.k(this.f14589w.f14682b.getClassLoader());
        n1Var2.o(this.f14588v);
        return n1Var2;
    }

    public final void h(h0 h0Var) {
        if (K(2)) {
            Objects.toString(h0Var);
        }
        if (h0Var.mDetached) {
            return;
        }
        h0Var.mDetached = true;
        if (h0Var.mAdded) {
            if (K(2)) {
                h0Var.toString();
            }
            o1 o1Var = this.f14571c;
            synchronized (o1Var.f14643a) {
                o1Var.f14643a.remove(h0Var);
            }
            h0Var.mAdded = false;
            if (L(h0Var)) {
                this.H = true;
            }
            c0(h0Var);
        }
    }

    public final void i(boolean z11, Configuration configuration) {
        if (z11 && (this.f14589w instanceof o4.e)) {
            e0(new IllegalStateException("Do not call dispatchConfigurationChanged() on host. Host implements OnConfigurationChangedProvider and automatically dispatches configuration changes to fragments."));
            throw null;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null) {
                h0Var.performConfigurationChanged(configuration);
                if (z11) {
                    h0Var.mChildFragmentManager.i(true, configuration);
                }
            }
        }
    }

    public final boolean j(MenuItem menuItem) {
        if (this.f14588v < 1) {
            return false;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null && h0Var.performContextItemSelected(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public final boolean k(Menu menu, MenuInflater menuInflater) {
        if (this.f14588v < 1) {
            return false;
        }
        ArrayList arrayList = null;
        boolean z11 = false;
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null && h0Var.isMenuVisible() && h0Var.performCreateOptionsMenu(menu, menuInflater)) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(h0Var);
                z11 = true;
            }
        }
        if (this.f14573e != null) {
            for (int i5 = 0; i5 < this.f14573e.size(); i5++) {
                h0 h0Var2 = (h0) this.f14573e.get(i5);
                if (arrayList == null || !arrayList.contains(h0Var2)) {
                    h0Var2.onDestroyOptionsMenu();
                }
            }
        }
        this.f14573e = arrayList;
        return z11;
    }

    public final void l() {
        boolean zIsChangingConfigurations = true;
        this.K = true;
        A(true);
        x();
        s0 s0Var = this.f14589w;
        boolean z11 = s0Var instanceof h6.o1;
        o1 o1Var = this.f14571c;
        if (z11) {
            zIsChangingConfigurations = o1Var.f14646d.f14607e;
        } else {
            m0 m0Var = s0Var.f14682b;
            if (m0Var != null) {
                zIsChangingConfigurations = true ^ m0Var.isChangingConfigurations();
            }
        }
        if (zIsChangingConfigurations) {
            Iterator it = this.f14580l.values().iterator();
            while (it.hasNext()) {
                Iterator it2 = ((BackStackState) it.next()).f14449a.iterator();
                while (it2.hasNext()) {
                    o1Var.f14646d.f((String) it2.next(), false);
                }
            }
        }
        u(-1);
        Object obj = this.f14589w;
        if (obj instanceof o4.f) {
            ((o4.f) obj).removeOnTrimMemoryListener(this.f14584r);
        }
        Object obj2 = this.f14589w;
        if (obj2 instanceof o4.e) {
            ((o4.e) obj2).removeOnConfigurationChangedListener(this.f14583q);
        }
        Object obj3 = this.f14589w;
        if (obj3 instanceof n4.o0) {
            ((n4.o0) obj3).removeOnMultiWindowModeChangedListener(this.f14585s);
        }
        Object obj4 = this.f14589w;
        if (obj4 instanceof n4.p0) {
            ((n4.p0) obj4).removeOnPictureInPictureModeChangedListener(this.f14586t);
        }
        Object obj5 = this.f14589w;
        if ((obj5 instanceof a5.p) && this.f14591y == null) {
            ((a5.p) obj5).removeMenuProvider(this.f14587u);
        }
        this.f14589w = null;
        this.f14590x = null;
        this.f14591y = null;
        if (this.f14575g != null) {
            this.f14578j.remove();
            this.f14575g = null;
        }
        j.h hVar = this.D;
        if (hVar != null) {
            hVar.b();
            this.E.b();
            this.F.b();
        }
    }

    public final void m(boolean z11) {
        if (z11 && (this.f14589w instanceof o4.f)) {
            e0(new IllegalStateException("Do not call dispatchLowMemory() on host. Host implements OnTrimMemoryProvider and automatically dispatches low memory callbacks to fragments."));
            throw null;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null) {
                h0Var.performLowMemory();
                if (z11) {
                    h0Var.mChildFragmentManager.m(true);
                }
            }
        }
    }

    public final void n(boolean z11, boolean z12) {
        if (z12 && (this.f14589w instanceof n4.o0)) {
            e0(new IllegalStateException("Do not call dispatchMultiWindowModeChanged() on host. Host implements OnMultiWindowModeChangedProvider and automatically dispatches multi-window mode changes to fragments."));
            throw null;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null) {
                h0Var.performMultiWindowModeChanged(z11);
                if (z12) {
                    h0Var.mChildFragmentManager.n(z11, true);
                }
            }
        }
    }

    public final void o() {
        Iterator it = this.f14571c.e().iterator();
        while (it.hasNext()) {
            h0 h0Var = (h0) it.next();
            if (h0Var != null) {
                h0Var.onHiddenChanged(h0Var.isHidden());
                h0Var.mChildFragmentManager.o();
            }
        }
    }

    public final boolean p(MenuItem menuItem) {
        if (this.f14588v < 1) {
            return false;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null && h0Var.performOptionsItemSelected(menuItem)) {
                return true;
            }
        }
        return false;
    }

    public final void q(Menu menu) {
        if (this.f14588v < 1) {
            return;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null) {
                h0Var.performOptionsMenuClosed(menu);
            }
        }
    }

    public final void r(h0 h0Var) {
        if (h0Var != null) {
            if (h0Var.equals(this.f14571c.b(h0Var.mWho))) {
                h0Var.performPrimaryNavigationFragmentChanged();
            }
        }
    }

    public final void s(boolean z11, boolean z12) {
        if (z12 && (this.f14589w instanceof n4.p0)) {
            e0(new IllegalStateException("Do not call dispatchPictureInPictureModeChanged() on host. Host implements OnPictureInPictureModeChangedProvider and automatically dispatches picture-in-picture mode changes to fragments."));
            throw null;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null) {
                h0Var.performPictureInPictureModeChanged(z11);
                if (z12) {
                    h0Var.mChildFragmentManager.s(z11, true);
                }
            }
        }
    }

    public final boolean t(Menu menu) {
        boolean z11 = false;
        if (this.f14588v < 1) {
            return false;
        }
        for (h0 h0Var : this.f14571c.f()) {
            if (h0Var != null && h0Var.isMenuVisible() && h0Var.performPrepareOptionsMenu(menu)) {
                z11 = true;
            }
        }
        return z11;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(128);
        sb2.append("FragmentManager{");
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append(" in ");
        h0 h0Var = this.f14591y;
        if (h0Var != null) {
            sb2.append(h0Var.getClass().getSimpleName());
            sb2.append("{");
            sb2.append(Integer.toHexString(System.identityHashCode(this.f14591y)));
            sb2.append("}");
        } else {
            s0 s0Var = this.f14589w;
            if (s0Var != null) {
                sb2.append(s0Var.getClass().getSimpleName());
                sb2.append("{");
                sb2.append(Integer.toHexString(System.identityHashCode(this.f14589w)));
                sb2.append("}");
            } else {
                sb2.append(AbstractJsonLexerKt.NULL);
            }
        }
        sb2.append("}}");
        return sb2.toString();
    }

    public final void u(int i5) {
        try {
            this.f14570b = true;
            for (n1 n1Var : this.f14571c.f14644b.values()) {
                if (n1Var != null) {
                    n1Var.o(i5);
                }
            }
            P(i5, false);
            Iterator it = e().iterator();
            while (it.hasNext()) {
                ((f2) it.next()).i();
            }
            this.f14570b = false;
            A(true);
        } catch (Throwable th2) {
            this.f14570b = false;
            throw th2;
        }
    }

    public final void v() {
        if (this.L) {
            this.L = false;
            d0();
        }
    }

    public final void w(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int size;
        String strE = b.c0.E(str, "    ");
        o1 o1Var = this.f14571c;
        ArrayList arrayList = o1Var.f14643a;
        String strE2 = b.c0.E(str, "    ");
        HashMap map = o1Var.f14644b;
        if (!map.isEmpty()) {
            printWriter.print(str);
            printWriter.println("Active Fragments:");
            for (n1 n1Var : map.values()) {
                printWriter.print(str);
                if (n1Var != null) {
                    h0 h0VarI = n1Var.i();
                    printWriter.println(h0VarI);
                    h0VarI.dump(strE2, fileDescriptor, printWriter, strArr);
                } else {
                    printWriter.println(AbstractJsonLexerKt.NULL);
                }
            }
        }
        int size2 = arrayList.size();
        if (size2 > 0) {
            printWriter.print(str);
            printWriter.println("Added Fragments:");
            for (int i5 = 0; i5 < size2; i5++) {
                h0 h0Var = (h0) arrayList.get(i5);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i5);
                printWriter.print(": ");
                printWriter.println(h0Var.toString());
            }
        }
        ArrayList arrayList2 = this.f14573e;
        if (arrayList2 != null && (size = arrayList2.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Fragments Created Menus:");
            for (int i11 = 0; i11 < size; i11++) {
                h0 h0Var2 = (h0) this.f14573e.get(i11);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i11);
                printWriter.print(": ");
                printWriter.println(h0Var2.toString());
            }
        }
        int size3 = this.f14572d.size();
        if (size3 > 0) {
            printWriter.print(str);
            printWriter.println("Back Stack:");
            for (int i12 = 0; i12 < size3; i12++) {
                a aVar = (a) this.f14572d.get(i12);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i12);
                printWriter.print(": ");
                printWriter.println(aVar.toString());
                aVar.n(strE, printWriter);
            }
        }
        printWriter.print(str);
        printWriter.println("Back Stack Index: " + this.f14579k.get());
        synchronized (this.f14569a) {
            try {
                int size4 = this.f14569a.size();
                if (size4 > 0) {
                    printWriter.print(str);
                    printWriter.println("Pending Actions:");
                    for (int i13 = 0; i13 < size4; i13++) {
                        Object obj = (e1) this.f14569a.get(i13);
                        printWriter.print(str);
                        printWriter.print("  #");
                        printWriter.print(i13);
                        printWriter.print(": ");
                        printWriter.println(obj);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print("  mHost=");
        printWriter.println(this.f14589w);
        printWriter.print(str);
        printWriter.print("  mContainer=");
        printWriter.println(this.f14590x);
        if (this.f14591y != null) {
            printWriter.print(str);
            printWriter.print("  mParent=");
            printWriter.println(this.f14591y);
        }
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.f14588v);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.I);
        printWriter.print(" mStopped=");
        printWriter.print(this.J);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.K);
        if (this.H) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.H);
        }
    }

    public final void x() {
        Iterator it = e().iterator();
        while (it.hasNext()) {
            ((f2) it.next()).i();
        }
    }

    public final void y(e1 e1Var, boolean z11) {
        if (!z11) {
            if (this.f14589w == null) {
                if (!this.K) {
                    throw new IllegalStateException("FragmentManager has not been attached to a host.");
                }
                throw new IllegalStateException("FragmentManager has been destroyed");
            }
            if (O()) {
                throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
            }
        }
        synchronized (this.f14569a) {
            try {
                if (this.f14589w == null) {
                    if (!z11) {
                        throw new IllegalStateException("Activity has been destroyed");
                    }
                } else {
                    this.f14569a.add(e1Var);
                    Y();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void z(boolean z11) {
        if (this.f14570b) {
            throw new IllegalStateException("FragmentManager is already executing transactions");
        }
        if (this.f14589w == null) {
            if (!this.K) {
                throw new IllegalStateException("FragmentManager has not been attached to a host.");
            }
            throw new IllegalStateException("FragmentManager has been destroyed");
        }
        if (Looper.myLooper() != this.f14589w.f14683c.getLooper()) {
            throw new IllegalStateException("Must be called from main thread of fragment host");
        }
        if (!z11 && O()) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        }
        if (this.M == null) {
            this.M = new ArrayList();
            this.N = new ArrayList();
        }
    }
}
