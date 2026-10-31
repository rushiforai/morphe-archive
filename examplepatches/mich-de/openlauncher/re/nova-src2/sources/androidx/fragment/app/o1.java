package androidx.fragment.app;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes.dex */
public final class o1 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14643a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f14644b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f14645c = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    public k1 f14646d;

    public final void a(h0 h0Var) {
        if (this.f14643a.contains(h0Var)) {
            throw new IllegalStateException("Fragment already added: " + h0Var);
        }
        synchronized (this.f14643a) {
            this.f14643a.add(h0Var);
        }
        h0Var.mAdded = true;
    }

    public final h0 b(String str) {
        n1 n1Var = (n1) this.f14644b.get(str);
        if (n1Var != null) {
            return n1Var.i();
        }
        return null;
    }

    public final h0 c(String str) {
        h0 h0VarFindFragmentByWho;
        for (n1 n1Var : this.f14644b.values()) {
            if (n1Var != null && (h0VarFindFragmentByWho = n1Var.i().findFragmentByWho(str)) != null) {
                return h0VarFindFragmentByWho;
            }
        }
        return null;
    }

    public final ArrayList d() {
        ArrayList arrayList = new ArrayList();
        for (n1 n1Var : this.f14644b.values()) {
            if (n1Var != null) {
                arrayList.add(n1Var);
            }
        }
        return arrayList;
    }

    public final ArrayList e() {
        ArrayList arrayList = new ArrayList();
        for (n1 n1Var : this.f14644b.values()) {
            if (n1Var != null) {
                arrayList.add(n1Var.i());
            } else {
                arrayList.add(null);
            }
        }
        return arrayList;
    }

    public final List f() {
        ArrayList arrayList;
        if (this.f14643a.isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        synchronized (this.f14643a) {
            arrayList = new ArrayList(this.f14643a);
        }
        return arrayList;
    }

    public final void g(n1 n1Var) {
        h0 h0VarI = n1Var.i();
        String str = h0VarI.mWho;
        HashMap map = this.f14644b;
        if (map.get(str) != null) {
            return;
        }
        map.put(h0VarI.mWho, n1Var);
        if (h0VarI.mRetainInstanceChangedWhileDetached) {
            if (h0VarI.mRetainInstance) {
                this.f14646d.e(h0VarI);
            } else {
                this.f14646d.g(h0VarI);
            }
            h0VarI.mRetainInstanceChangedWhileDetached = false;
        }
        if (h1.K(2)) {
            h0VarI.toString();
        }
    }

    public final void h(n1 n1Var) {
        h0 h0VarI = n1Var.i();
        if (h0VarI.mRetainInstance) {
            this.f14646d.g(h0VarI);
        }
        String str = h0VarI.mWho;
        HashMap map = this.f14644b;
        if (map.get(str) == n1Var && ((n1) map.put(h0VarI.mWho, null)) != null && h1.K(2)) {
            h0VarI.toString();
        }
    }

    public final Bundle i(String str, Bundle bundle) {
        HashMap map = this.f14645c;
        return bundle != null ? (Bundle) map.put(str, bundle) : (Bundle) map.remove(str);
    }
}
