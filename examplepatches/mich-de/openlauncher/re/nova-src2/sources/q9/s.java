package q9;

import android.content.Context;
import e10.d0;
import e10.y2;
import h6.c1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import qx.w0;

/* loaded from: classes.dex */
public final class s implements o {

    /* renamed from: a, reason: collision with root package name */
    public final z f83881a;

    /* renamed from: c, reason: collision with root package name */
    public final p f83883c;

    /* renamed from: h, reason: collision with root package name */
    public kz.b f83888h;

    /* renamed from: i, reason: collision with root package name */
    public final t f83889i;

    /* renamed from: j, reason: collision with root package name */
    public final int f83890j;

    /* renamed from: k, reason: collision with root package name */
    public int f83891k;

    /* renamed from: l, reason: collision with root package name */
    public ya.v f83892l;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f83882b = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public boolean f83884d = false;

    /* renamed from: e, reason: collision with root package name */
    public int f83885e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f83886f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f83887g = new ArrayList();

    public s(Context context, p pVar, z zVar) {
        this.f83883c = pVar;
        o9.l lVar = (o9.l) o9.k.Y(context);
        this.f83889i = new t(context);
        this.f83881a = zVar;
        this.f83890j = y2.f51877a.W().l() == d0.f51460c ? 1 : lVar.f79934x.d();
        pVar.a(this);
    }

    @Override // q9.o
    public final void a() {
        ArrayList arrayList = this.f83882b;
        arrayList.clear();
        for (ga.a aVar : this.f83883c.f83863c) {
            ya.v vVar = this.f83892l;
            if (vVar == null || vVar.b(aVar, null)) {
                arrayList.add(aVar);
            }
        }
        Collections.sort(arrayList, this.f83889i);
        b();
    }

    /* JADX WARN: Removed duplicated region for block: B:148:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:183:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b() {
        int size;
        int i5;
        int i11;
        Random random;
        kz.b bVar;
        this.f83885e = 0;
        this.f83887g.clear();
        this.f83886f.clear();
        this.f83885e = this.f83882b.size();
        z zVar = this.f83881a;
        if (zVar != null) {
            ArrayList arrayList = this.f83886f;
            if (zVar.f83901a == 2) {
                j jVar = new j();
                jVar.f83842b = 2097152;
                arrayList.add(jVar);
            }
            size = arrayList.size();
            if (this.f83881a.f83901a != 2) {
            }
            bVar = this.f83888h;
            if (bVar == null) {
                bVar.notifyDataSetChanged();
                return;
            }
            return;
        }
        if (this.f83884d) {
            ArrayList arrayList2 = this.f83886f;
            j jVar2 = new j();
            jVar2.f83842b = 8388608;
            jVar2.f83841a = 0;
            arrayList2.add(jVar2);
            size = 1;
        } else {
            size = 0;
        }
        px.c cVar = px.c.f83110a;
        boolean zF = px.c.f();
        if (!qx.l.f84545g.h() || zF || qx.h.b() < 2) {
            i5 = 0;
        } else {
            i5 = 5;
            int iG = zy.c.g("app_drawer_inline_ad_interval", 5);
            if (iG > 0) {
                i5 = iG;
            }
        }
        qx.l lVar = qx.l.f84548j;
        boolean z11 = lVar.h() && lVar.a() == qx.i.f84512d;
        String str = null;
        if (z11) {
            w0 w0VarA = ox.f.f81065a.a(lVar);
            synchronized (w0VarA.f84637d) {
                try {
                    ArrayList arrayList3 = w0VarA.f84640g;
                    if (arrayList3 == null || !arrayList3.isEmpty()) {
                        Iterator it = arrayList3.iterator();
                        i11 = 0;
                        while (it.hasNext()) {
                            qx.r rVar = (qx.r) it.next();
                            if (!rVar.e() && !rVar.f84589e && (i11 = i11 + 1) < 0) {
                                ul.b.d0();
                                throw null;
                            }
                        }
                    } else {
                        i11 = 0;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        } else {
            i11 = 0;
        }
        Random random2 = new Random();
        qx.h.b();
        zy.c cVar2 = zy.c.f98823a;
        int iG2 = zy.c.g("max_inline_ad_slots", 50);
        int i12 = iG2 > 0 ? iG2 : 50;
        Iterator it2 = this.f83882b.iterator();
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        r rVar2 = null;
        int iNextInt = -1;
        while (it2.hasNext()) {
            ga.a aVar = (ga.a) it2.next();
            if (i5 <= 0 || i13 >= i12 || i14 < i5 - 1 || i15 != 0 || iNextInt >= 0) {
                random = random2;
            } else {
                if (z11) {
                    if (i13 < i11) {
                        iNextInt = random2.nextInt(this.f83890j);
                        random = random2;
                    }
                    random = random2;
                } else {
                    ArrayList arrayList4 = this.f83886f;
                    j jVar3 = new j();
                    random = random2;
                    jVar3.f83842b = 4194304;
                    jVar3.f83841a = size;
                    jVar3.f83846f = i13;
                    arrayList4.add(jVar3);
                    i13++;
                    size++;
                }
                i14 = 0;
            }
            if (iNextInt < 0 || i15 != iNextInt || i13 >= i12 || i13 >= i11) {
                i14 = i14;
            } else {
                ArrayList arrayList5 = this.f83886f;
                int i16 = size + 1;
                int i17 = i13 + 1;
                int i18 = i14;
                j jVar4 = new j();
                jVar4.f83842b = 4194304;
                jVar4.f83841a = size;
                jVar4.f83846f = i13;
                arrayList5.add(jVar4);
                i15++;
                if (i15 >= this.f83890j) {
                    i14 = i18 + 1;
                    i13 = i17;
                    size = i16;
                    i15 = 0;
                } else {
                    i13 = i17;
                    i14 = i18;
                    size = i16;
                }
                iNextInt = -1;
            }
            String str2 = aVar.f57280z;
            if (!str2.equals(str)) {
                r rVar3 = new r();
                rVar3.f83878a = str2;
                this.f83887g.add(rVar3);
                str = str2;
                rVar2 = rVar3;
            }
            int i19 = size + 1;
            j jVar5 = new j();
            jVar5.f83842b = aVar instanceof ga.c ? SQLiteDatabase.OPEN_FULLMUTEX : 2;
            jVar5.f83841a = size;
            jVar5.f83845e = aVar;
            if (rVar2.f83879b == null) {
                rVar2.f83879b = jVar5;
            }
            this.f83886f.add(jVar5);
            i15++;
            if (i15 >= this.f83890j) {
                i14++;
                i15 = 0;
            }
            size = i19;
            random2 = random;
        }
        if (iNextInt >= 0 && i13 < i12 && i13 < i11) {
            ArrayList arrayList6 = this.f83886f;
            j jVar6 = new j();
            jVar6.f83842b = 4194304;
            jVar6.f83841a = size;
            jVar6.f83846f = i13;
            arrayList6.add(jVar6);
            i13++;
        }
        if (i5 > 0 && i13 > 0) {
            HashMap map = new HashMap();
            map.put("placement", "APP_DRAWER");
            c1.x(i5, map, "interval", i13, "slot_count");
            zy.c cVar3 = zy.c.f98823a;
            zy.c.i("ad_inline_drawer_mounted", map);
        }
        if (this.f83890j != 0) {
            Iterator it3 = this.f83886f.iterator();
            int i21 = 0;
            int i22 = 0;
            int i23 = -1;
            while (it3.hasNext()) {
                j jVar7 = (j) it3.next();
                jVar7.f83843c = 0;
                int i24 = jVar7.f83842b;
                if (i24 == 8388608) {
                    if (i21 % this.f83890j == 0) {
                        i23++;
                        i22 = 0;
                    }
                    jVar7.f83843c = i23;
                    jVar7.f83844d = i22;
                    i21++;
                    i22++;
                } else if (m.g(i24, 16)) {
                    i21 = 0;
                } else {
                    int i25 = jVar7.f83842b;
                    if (i25 == 4194304) {
                        if (qx.l.f84548j.a() == qx.i.f84512d) {
                            if (i21 % this.f83890j == 0) {
                                i23++;
                                i22 = 0;
                            }
                            jVar7.f83843c = i23;
                            jVar7.f83844d = i22;
                            i21++;
                            i22++;
                        } else {
                            i23++;
                        }
                    } else if (m.g(i25, 65538)) {
                        if (i21 % this.f83890j == 0) {
                            i23++;
                            i22 = 0;
                        }
                        jVar7.f83843c = i23;
                        jVar7.f83844d = i22;
                        i21++;
                        i22++;
                    }
                }
            }
            this.f83891k = i23 + 1;
            float size2 = 1.0f / this.f83887g.size();
            Iterator it4 = this.f83887g.iterator();
            float f11 = 0.0f;
            while (it4.hasNext()) {
                r rVar4 = (r) it4.next();
                if (m.g(rVar4.f83879b.f83842b, 65538)) {
                    rVar4.f83880c = f11;
                    f11 += size2;
                } else {
                    rVar4.f83880c = 0.0f;
                }
            }
        }
        bVar = this.f83888h;
        if (bVar == null) {
        }
    }
}
