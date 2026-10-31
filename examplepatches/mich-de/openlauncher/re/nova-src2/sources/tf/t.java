package tf;

import androidx.compose.ui.node.LayoutNode;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import xk.l0;
import xk.r2;
import xk.v0;

/* loaded from: classes3.dex */
public class t {

    /* renamed from: e, reason: collision with root package name */
    public int f89133e;

    /* renamed from: f, reason: collision with root package name */
    public int f89134f;

    /* renamed from: g, reason: collision with root package name */
    public int f89135g;

    /* renamed from: h, reason: collision with root package name */
    public int f89136h;

    /* renamed from: l, reason: collision with root package name */
    public v0 f89140l;

    /* renamed from: m, reason: collision with root package name */
    public int f89141m;
    public v0 n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f89142p;

    /* renamed from: q, reason: collision with root package name */
    public int f89143q;

    /* renamed from: r, reason: collision with root package name */
    public v0 f89144r;

    /* renamed from: s, reason: collision with root package name */
    public v0 f89145s;

    /* renamed from: t, reason: collision with root package name */
    public int f89146t;

    /* renamed from: u, reason: collision with root package name */
    public int f89147u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f89148v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f89149w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f89150x;

    /* renamed from: y, reason: collision with root package name */
    public HashMap f89151y;

    /* renamed from: z, reason: collision with root package name */
    public HashSet f89152z;

    /* renamed from: a, reason: collision with root package name */
    public int f89129a = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: b, reason: collision with root package name */
    public int f89130b = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: c, reason: collision with root package name */
    public int f89131c = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: d, reason: collision with root package name */
    public int f89132d = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: i, reason: collision with root package name */
    public int f89137i = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: j, reason: collision with root package name */
    public int f89138j = LayoutNode.NotPlacedPlaceOrder;

    /* renamed from: k, reason: collision with root package name */
    public boolean f89139k = true;

    public t() {
        l0 l0Var = v0.f96030b;
        r2 r2Var = r2.f96007e;
        this.f89140l = r2Var;
        this.f89141m = 0;
        this.n = r2Var;
        this.o = 0;
        this.f89142p = LayoutNode.NotPlacedPlaceOrder;
        this.f89143q = LayoutNode.NotPlacedPlaceOrder;
        this.f89144r = r2Var;
        this.f89145s = r2Var;
        this.f89146t = 0;
        this.f89147u = 0;
        this.f89148v = false;
        this.f89149w = false;
        this.f89150x = false;
        this.f89151y = new HashMap();
        this.f89152z = new HashSet();
    }

    public void a(int i5) {
        Iterator it = this.f89151y.values().iterator();
        while (it.hasNext()) {
            if (((s) it.next()).f89127a.f57657c == i5) {
                it.remove();
            }
        }
    }

    public final void b(u uVar) {
        this.f89129a = uVar.f89153a;
        this.f89130b = uVar.f89154b;
        this.f89131c = uVar.f89155c;
        this.f89132d = uVar.f89156d;
        this.f89133e = uVar.f89157e;
        this.f89134f = uVar.f89158f;
        this.f89135g = uVar.f89159g;
        this.f89136h = uVar.f89160h;
        this.f89137i = uVar.f89161i;
        this.f89138j = uVar.f89162j;
        this.f89139k = uVar.f89163k;
        this.f89140l = uVar.f89164l;
        this.f89141m = uVar.f89165m;
        this.n = uVar.n;
        this.o = uVar.o;
        this.f89142p = uVar.f89166p;
        this.f89143q = uVar.f89167q;
        this.f89144r = uVar.f89168r;
        this.f89145s = uVar.f89169s;
        this.f89146t = uVar.f89170t;
        this.f89147u = uVar.f89171u;
        this.f89148v = uVar.f89172v;
        this.f89149w = uVar.f89173w;
        this.f89150x = uVar.f89174x;
        this.f89152z = new HashSet(uVar.f89176z);
        this.f89151y = new HashMap(uVar.f89175y);
    }

    public t c(int i5, int i11) {
        this.f89137i = i5;
        this.f89138j = i11;
        this.f89139k = true;
        return this;
    }
}
