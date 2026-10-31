package androidx.fragment.app;

import android.view.ViewGroup;
import b.u4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class d2 {

    /* renamed from: a, reason: collision with root package name */
    public int f14516a;

    /* renamed from: b, reason: collision with root package name */
    public int f14517b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f14518c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f14519d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f14520e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f14521f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f14522g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f14523h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f14524i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f14525j;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f14526k;

    /* renamed from: l, reason: collision with root package name */
    public final n1 f14527l;

    public d2(int i5, int i11, n1 n1Var) {
        fq.c.o(i5, "finalState");
        fq.c.o(i11, "lifecycleImpact");
        h0 fragment = n1Var.f14632c;
        Intrinsics.f(fragment, "fragmentStateManager.fragment");
        fq.c.o(i5, "finalState");
        fq.c.o(i11, "lifecycleImpact");
        Intrinsics.g(fragment, "fragment");
        this.f14516a = i5;
        this.f14517b = i11;
        this.f14518c = fragment;
        this.f14519d = new ArrayList();
        this.f14524i = true;
        ArrayList arrayList = new ArrayList();
        this.f14525j = arrayList;
        this.f14526k = arrayList;
        this.f14527l = n1Var;
    }

    public final void a(ViewGroup container) {
        Intrinsics.g(container, "container");
        this.f14523h = false;
        if (this.f14520e) {
            return;
        }
        this.f14520e = true;
        if (this.f14525j.isEmpty()) {
            b();
            return;
        }
        for (c2 c2Var : b70.g.I1(this.f14526k)) {
            c2Var.getClass();
            if (!c2Var.f14506b) {
                c2Var.b(container);
            }
            c2Var.f14506b = true;
        }
    }

    public final void b() {
        this.f14523h = false;
        if (!this.f14521f) {
            if (h1.K(2)) {
                toString();
            }
            this.f14521f = true;
            Iterator it = this.f14519d.iterator();
            while (it.hasNext()) {
                ((Runnable) it.next()).run();
            }
        }
        this.f14518c.mTransitioning = false;
        this.f14527l.j();
    }

    public final void c(c2 effect) {
        Intrinsics.g(effect, "effect");
        ArrayList arrayList = this.f14525j;
        if (arrayList.remove(effect) && arrayList.isEmpty()) {
            b();
        }
    }

    public final void d(int i5, int i11) {
        fq.c.o(i5, "finalState");
        fq.c.o(i11, "lifecycleImpact");
        int iF = b.c0.F(i11);
        h0 h0Var = this.f14518c;
        if (iF == 0) {
            if (this.f14516a != 1) {
                if (h1.K(2)) {
                    Objects.toString(h0Var);
                    if (i5 != 1 && i5 != 2 && i5 != 3 && i5 != 4) {
                        throw null;
                    }
                }
                this.f14516a = i5;
                return;
            }
            return;
        }
        if (iF != 1) {
            if (iF != 2) {
                return;
            }
            if (h1.K(2)) {
                Objects.toString(h0Var);
            }
            this.f14516a = 1;
            this.f14517b = 3;
            this.f14524i = true;
            return;
        }
        if (this.f14516a == 1) {
            if (h1.K(2)) {
                Objects.toString(h0Var);
            }
            this.f14516a = 2;
            this.f14517b = 2;
            this.f14524i = true;
        }
    }

    public final String toString() {
        StringBuilder sbK = u4.k("Operation {", Integer.toHexString(System.identityHashCode(this)), "} {finalState = ");
        int i5 = this.f14516a;
        sbK.append(i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? AbstractJsonLexerKt.NULL : "INVISIBLE" : "GONE" : "VISIBLE" : "REMOVED");
        sbK.append(" lifecycleImpact = ");
        int i11 = this.f14517b;
        sbK.append(i11 != 1 ? i11 != 2 ? i11 != 3 ? AbstractJsonLexerKt.NULL : "REMOVING" : "ADDING" : "NONE");
        sbK.append(" fragment = ");
        sbK.append(this.f14518c);
        sbK.append(AbstractJsonLexerKt.END_OBJ);
        return sbK.toString();
    }
}
