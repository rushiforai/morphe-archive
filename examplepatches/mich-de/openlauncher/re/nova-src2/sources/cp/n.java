package cp;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final ep.e f47766a = ep.e.f52864c;

    /* renamed from: b, reason: collision with root package name */
    public final int f47767b = 1;

    /* renamed from: c, reason: collision with root package name */
    public final a f47768c = h.f47744a;

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f47769d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f47770e = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f47771f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public boolean f47772g = false;

    /* renamed from: h, reason: collision with root package name */
    public final int f47773h;

    /* renamed from: i, reason: collision with root package name */
    public final int f47774i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f47775j;

    /* renamed from: k, reason: collision with root package name */
    public final i f47776k;

    /* renamed from: l, reason: collision with root package name */
    public int f47777l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f47778m;
    public x n;
    public final u o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayDeque f47779p;

    public n() {
        i iVar = m.f47754j;
        this.f47773h = 2;
        this.f47774i = 2;
        this.f47775j = true;
        this.f47776k = m.f47754j;
        this.f47777l = 0;
        this.f47778m = true;
        this.n = m.f47755k;
        this.o = m.f47756l;
        this.f47779p = new ArrayDeque();
    }

    public final m a() {
        fp.q qVar;
        fp.q qVar2;
        ArrayList arrayList = this.f47770e;
        int size = arrayList.size();
        ArrayList arrayList2 = this.f47771f;
        ArrayList arrayList3 = new ArrayList(arrayList2.size() + size + 3);
        arrayList3.addAll(arrayList);
        Collections.reverse(arrayList3);
        ArrayList arrayList4 = new ArrayList(arrayList2);
        Collections.reverse(arrayList4);
        arrayList3.addAll(arrayList4);
        boolean z11 = ip.c.f67954a;
        int i5 = this.f47773h;
        int i11 = this.f47774i;
        if (i5 != 2 || i11 != 2) {
            fp.b bVar = new fp.b(fp.e.f55497b, i5, i11);
            fp.q qVar3 = fp.s.f55542a;
            int i12 = 0;
            fp.q qVar4 = new fp.q(Date.class, bVar, i12);
            if (z11) {
                ip.b bVar2 = ip.c.f67956c;
                bVar2.getClass();
                qVar = new fp.q(bVar2.f55498a, new fp.b(bVar2, i5, i11), i12);
                ip.b bVar3 = ip.c.f67955b;
                bVar3.getClass();
                qVar2 = new fp.q(bVar3.f55498a, new fp.b(bVar3, i5, i11), i12);
            } else {
                qVar = null;
                qVar2 = null;
            }
            arrayList3.add(qVar4);
            if (z11) {
                arrayList3.add(qVar);
                arrayList3.add(qVar2);
            }
        }
        return new m(this.f47766a, this.f47768c, new HashMap(this.f47769d), this.f47772g, this.f47775j, this.f47776k, this.f47777l, this.f47778m, this.f47767b, new ArrayList(arrayList), new ArrayList(arrayList2), arrayList3, this.n, this.o, new ArrayList(this.f47779p));
    }
}
