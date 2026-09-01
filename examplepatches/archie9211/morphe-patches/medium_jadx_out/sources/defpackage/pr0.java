package defpackage;

import android.util.Log;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pr0 implements iy6 {
    public static final List w = Collections.EMPTY_LIST;
    public final View a;
    public WeakReference b;
    public int c;
    public int d;
    public int e;
    public int f;
    public pr0 g;
    public pr0 h;
    public int i;
    public ArrayList j;
    public List k;
    public int l;
    public yxa m;
    public boolean n;
    public int o;
    public int p;
    public RecyclerView q;
    public kxa r;
    public nr0 s;
    public final ete t;
    public or0 u;
    public final ly6 v;

    public pr0(ete eteVar) {
        View root = eteVar.getRoot();
        this.c = -1;
        this.d = -1;
        this.e = -1;
        this.f = -1;
        this.g = null;
        this.h = null;
        this.j = null;
        this.k = null;
        this.l = 0;
        this.m = null;
        this.n = false;
        this.o = 0;
        this.p = -1;
        if (root == null) {
            ay0.e("itemView may not be null");
            throw null;
        }
        this.a = root;
        this.t = eteVar;
        this.v = new ly6(this);
    }

    public final void a(int i) {
        this.i = i | this.i;
    }

    public final int b() {
        int i = this.f;
        return i == -1 ? this.c : i;
    }

    public final List c() {
        ArrayList arrayList;
        return ((this.i & 1024) != 0 || (arrayList = this.j) == null || arrayList.size() == 0) ? w : this.k;
    }

    public final boolean d() {
        return (this.i & 1) != 0;
    }

    public final boolean e() {
        return (this.i & 4) != 0;
    }

    public final boolean f() {
        if ((this.i & 16) != 0) {
            return false;
        }
        WeakHashMap weakHashMap = ute.a;
        return !this.a.hasTransientState();
    }

    public final boolean g() {
        return (this.i & 8) != 0;
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return this.v;
    }

    public final boolean h() {
        return this.m != null;
    }

    public final boolean i() {
        return (this.i & 256) != 0;
    }

    public final boolean j() {
        return (this.i & 2) != 0;
    }

    public final void k(int i, boolean z) {
        if (this.d == -1) {
            this.d = this.c;
        }
        int i2 = this.f;
        if (i2 == -1) {
            i2 = this.c;
            this.f = i2;
        }
        if (z) {
            this.f = i2 + i;
        }
        this.c += i;
        View view = this.a;
        if (view.getLayoutParams() != null) {
            ((txa) view.getLayoutParams()).c = true;
        }
    }

    public final void l() {
        if (RecyclerView.P0 && i()) {
            rd6.w("Attempting to reset temp-detached ViewHolder: ", this, ". ViewHolders should be fully detached before resetting.");
            return;
        }
        this.i = 0;
        this.c = -1;
        this.d = -1;
        this.f = -1;
        this.l = 0;
        this.g = null;
        this.h = null;
        ArrayList arrayList = this.j;
        if (arrayList != null) {
            arrayList.clear();
        }
        this.i &= -1025;
        this.o = 0;
        this.p = -1;
        RecyclerView.j(this);
    }

    public final void m(boolean z) {
        int i = this.l;
        int i2 = z ? i - 1 : i + 1;
        this.l = i2;
        if (i2 < 0) {
            this.l = 0;
            if (RecyclerView.P0) {
                fm3.d("isRecyclable decremented below 0: unmatched pair of setIsRecyable() calls for ", this);
                return;
            } else {
                Log.e("View", "isRecyclable decremented below 0: unmatched pair of setIsRecyable() calls for " + this);
            }
        } else if (!z && i2 == 1) {
            this.i |= 16;
        } else if (z && i2 == 0) {
            this.i &= -17;
        }
        if (RecyclerView.Q0) {
            Log.d("RecyclerView", "setIsRecyclable val:" + z + ":" + this);
        }
    }

    public final boolean n() {
        return (this.i & 128) != 0;
    }

    public final boolean o() {
        return (this.i & 32) != 0;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder((getClass().isAnonymousClass() ? "ViewHolder" : getClass().getSimpleName()) + "{" + Integer.toHexString(hashCode()) + " position=" + this.c + " id=-1, oldPos=" + this.d + ", pLpos:" + this.f);
        if (h()) {
            sb.append(" scrap ");
            sb.append(this.n ? "[changeScrap]" : "[attachedScrap]");
        }
        if (e()) {
            sb.append(" invalid");
        }
        if (!d()) {
            sb.append(" unbound");
        }
        if ((this.i & 2) != 0) {
            sb.append(" update");
        }
        if (g()) {
            sb.append(" removed");
        }
        if (n()) {
            sb.append(" ignored");
        }
        if (i()) {
            sb.append(" tmpDetached");
        }
        if (!f()) {
            sb.append(" not recyclable(" + this.l + ")");
        }
        if ((this.i & 512) != 0 || e()) {
            sb.append(" undefined adapter position");
        }
        if (this.a.getParent() == null) {
            sb.append(" no parent");
        }
        sb.append("}");
        return sb.toString();
    }
}
