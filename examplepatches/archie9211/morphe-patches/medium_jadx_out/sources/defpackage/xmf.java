package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xmf extends k2 implements yae {
    public static final Parcelable.Creator<xmf> CREATOR = new rkf(11);
    public zpf a;
    public ivg b;
    public String c;
    public String d;
    public ArrayList e;
    public ArrayList f;
    public String g;
    public Boolean h;
    public gof i;
    public boolean j;
    public lxf k;
    public kwf l;
    public List m;

    public xmf(xj4 xj4Var, ArrayList arrayList) {
        vp7.p(xj4Var);
        xj4Var.a();
        this.c = xj4Var.b;
        this.d = "com.google.firebase.auth.internal.DefaultFirebaseUser";
        this.g = "2";
        g(arrayList);
    }

    @Override // defpackage.yae
    public final String b() {
        return this.b.b;
    }

    public final String d() {
        String str;
        Map map;
        zpf zpfVar = this.a;
        if (zpfVar == null || (str = zpfVar.b) == null || (map = (Map) gwf.a(str).a.get("firebase")) == null) {
            return null;
        }
        return (String) map.get("tenant");
    }

    public final boolean e() {
        String str;
        Boolean bool = this.h;
        if (bool == null || bool.booleanValue()) {
            zpf zpfVar = this.a;
            if (zpfVar != null) {
                Map map = (Map) gwf.a(zpfVar.b).a.get("firebase");
                str = map != null ? (String) map.get("sign_in_provider") : null;
            } else {
                str = "";
            }
            boolean z = true;
            if (this.e.size() > 1 || (str != null && str.equals("custom"))) {
                z = false;
            }
            this.h = Boolean.valueOf(z);
        }
        return this.h.booleanValue();
    }

    public final synchronized void g(ArrayList arrayList) {
        try {
            vp7.p(arrayList);
            this.e = new ArrayList(arrayList.size());
            this.f = new ArrayList(arrayList.size());
            for (int i = 0; i < arrayList.size(); i++) {
                yae yaeVar = (yae) arrayList.get(i);
                if (yaeVar.b().equals("firebase")) {
                    this.b = (ivg) yaeVar;
                } else {
                    this.f.add(yaeVar.b());
                }
                this.e.add((ivg) yaeVar);
            }
            if (this.b == null) {
                this.b = (ivg) this.e.get(0);
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final void h(ArrayList arrayList) {
        kwf kwfVar;
        if (arrayList.isEmpty()) {
            kwfVar = null;
        } else {
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                y48 y48Var = (y48) it2.next();
                if (y48Var instanceof d99) {
                    arrayList2.add((d99) y48Var);
                } else if (y48Var instanceof hqd) {
                    arrayList3.add((hqd) y48Var);
                }
            }
            kwfVar = new kwf(arrayList2, arrayList3);
        }
        this.l = kwfVar;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.U(parcel, 1, this.a, i);
        fo7.U(parcel, 2, this.b, i);
        fo7.V(parcel, 3, this.c);
        fo7.V(parcel, 4, this.d);
        fo7.Y(parcel, 5, this.e);
        fo7.W(parcel, 6, this.f);
        fo7.V(parcel, 7, this.g);
        boolean zE = e();
        fo7.a0(parcel, 8, 4);
        parcel.writeInt(zE ? 1 : 0);
        fo7.U(parcel, 9, this.i, i);
        boolean z = this.j;
        fo7.a0(parcel, 10, 4);
        parcel.writeInt(z ? 1 : 0);
        fo7.U(parcel, 11, this.k, i);
        fo7.U(parcel, 12, this.l, i);
        fo7.Y(parcel, 13, this.m);
        fo7.d0(iC0, parcel);
    }
}
