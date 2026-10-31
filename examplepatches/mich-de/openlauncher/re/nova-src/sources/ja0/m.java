package ja0;

import com.google.android.gms.internal.measurement.v6;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final v6 f69342a;

    /* renamed from: b, reason: collision with root package name */
    public final v6 f69343b;

    /* renamed from: c, reason: collision with root package name */
    public final int f69344c;

    /* renamed from: d, reason: collision with root package name */
    public final int f69345d;

    /* renamed from: e, reason: collision with root package name */
    public final int f69346e;

    /* renamed from: f, reason: collision with root package name */
    public final int f69347f;

    /* renamed from: g, reason: collision with root package name */
    public final int f69348g;

    /* renamed from: h, reason: collision with root package name */
    public final int f69349h;

    /* renamed from: i, reason: collision with root package name */
    public final int f69350i;

    /* renamed from: j, reason: collision with root package name */
    public final int f69351j;

    /* renamed from: k, reason: collision with root package name */
    public final int f69352k;

    /* renamed from: l, reason: collision with root package name */
    public final int f69353l;

    /* renamed from: m, reason: collision with root package name */
    public final int f69354m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f69355p;

    /* renamed from: q, reason: collision with root package name */
    public final k f69356q = new k(this, 0);

    /* renamed from: r, reason: collision with root package name */
    public final k f69357r = new k(this, 1);

    /* renamed from: s, reason: collision with root package name */
    public final i f69358s = new i(this, 3);

    /* renamed from: t, reason: collision with root package name */
    public final i f69359t = new i(this, 4);

    /* renamed from: u, reason: collision with root package name */
    public final i f69360u = new i(this, 5);

    /* renamed from: v, reason: collision with root package name */
    public final i f69361v = new i(this, 0);

    /* renamed from: w, reason: collision with root package name */
    public final i f69362w = new i(this, 1);

    /* renamed from: x, reason: collision with root package name */
    public final i f69363x = new i(this, 2);

    public m(fa0.d dVar, byte[] bArr) {
        v6 v6Var = new v6(bArr, 12);
        this.f69342a = v6Var;
        this.f69343b = new v6(bArr, 12);
        ka0.a.a(bArr);
        this.f69344c = v6Var.y(56);
        this.f69345d = v6Var.y(60);
        this.f69346e = v6Var.y(64);
        this.f69347f = v6Var.y(68);
        this.f69348g = v6Var.y(72);
        this.f69349h = v6Var.y(76);
        this.f69350i = v6Var.y(80);
        this.f69351j = v6Var.y(84);
        this.f69352k = v6Var.y(88);
        this.f69353l = v6Var.y(92);
        this.f69354m = v6Var.y(96);
        this.n = v6Var.y(100);
        this.o = v6Var.y(52);
        ka0.b bVarA = a(61440);
        if (bVarA != null) {
            this.f69355p = bVarA.f71309a.f69343b.y(bVarA.f71310b + 8);
        } else {
            this.f69355p = 0;
        }
    }

    public final ka0.b a(int i5) {
        Iterator it = new j(this, this.f69343b.y(this.o)).iterator();
        while (it.hasNext()) {
            ka0.b bVar = (ka0.b) it.next();
            if (bVar.f71309a.f69343b.z(bVar.f71310b) == i5) {
                return bVar;
            }
        }
        return null;
    }
}
