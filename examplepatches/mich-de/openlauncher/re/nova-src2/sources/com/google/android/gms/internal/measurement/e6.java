package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class e6 extends t4 {

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f32492c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f32493d;

    /* renamed from: e, reason: collision with root package name */
    public final j8 f32494e;

    public e6(e6 e6Var) {
        super(e6Var.f33076a);
        ArrayList arrayList = new ArrayList(e6Var.f32492c.size());
        this.f32492c = arrayList;
        arrayList.addAll(e6Var.f32492c);
        ArrayList arrayList2 = new ArrayList(e6Var.f32493d.size());
        this.f32493d = arrayList2;
        arrayList2.addAll(e6Var.f32493d);
        this.f32494e = e6Var.f32494e;
    }

    @Override // com.google.android.gms.internal.measurement.t4
    public final f6 a(j8 j8Var, List list) {
        j6 j6Var;
        j8 j8VarD = this.f32494e.d();
        l6 l6Var = (l6) j8VarD.f32683c;
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f32492c;
            int size = arrayList.size();
            j6Var = f6.Qo;
            if (i5 >= size) {
                break;
            }
            if (i5 < list.size()) {
                j8VarD.g((String) arrayList.get(i5), ((l6) j8Var.f32683c).e(j8Var, (f6) list.get(i5)));
            } else {
                j8VarD.g((String) arrayList.get(i5), j6Var);
            }
            i5++;
        }
        Iterator it = this.f32493d.iterator();
        while (it.hasNext()) {
            f6 f6Var = (f6) it.next();
            f6 f6VarE = l6Var.e(j8VarD, f6Var);
            if (f6VarE instanceof g6) {
                f6VarE = l6Var.e(j8VarD, f6Var);
            }
            if (f6VarE instanceof x2) {
                return ((x2) f6VarE).f33215a;
            }
        }
        return j6Var;
    }

    @Override // com.google.android.gms.internal.measurement.t4, com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return new e6(this);
    }

    public e6(String str, ArrayList arrayList, List list, j8 j8Var) {
        super(str);
        this.f32492c = new ArrayList();
        this.f32494e = j8Var;
        if (!arrayList.isEmpty()) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                this.f32492c.add(((f6) it.next()).zzc());
            }
        }
        this.f32493d = new ArrayList(list);
    }
}
