package defpackage;

import android.content.Intent;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dk6 extends v98 {
    public static final Parcelable.Creator<dk6> CREATOR = new h74(17);

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.ba7
    public final String e() {
        return "katana_proxy_auth";
    }

    @Override // defpackage.ba7
    public final int k(m87 m87Var) {
        boolean z;
        m87Var.getClass();
        boolean z2 = f94.o && dm2.H() != null && m87Var.a.allowsCustomTabAuth();
        String strW = s42.W();
        d();
        String str = m87Var.d;
        Set set = m87Var.b;
        Set set2 = set;
        Iterator it2 = set.iterator();
        while (true) {
            if (!it2.hasNext()) {
                z = false;
                break;
            }
            String str2 = (String) it2.next();
            cd7 cd7Var = aa7.e;
            if (cd7.x(str2)) {
                z = true;
                break;
            }
        }
        dx2 dx2Var = m87Var.c;
        if (dx2Var == null) {
            dx2Var = dx2.NONE;
        }
        dx2 dx2Var2 = dx2Var;
        String strC = c(m87Var.g);
        String str3 = m87Var.j;
        String str4 = m87Var.l;
        boolean z3 = m87Var.m;
        boolean z4 = m87Var.o;
        boolean z5 = m87Var.p;
        String str5 = m87Var.q;
        pp1 pp1Var = m87Var.t;
        if (pp1Var != null) {
            pp1Var.name();
        }
        String str6 = m87Var.e;
        String str7 = m87Var.f;
        x98 x98Var = x98.a;
        ArrayList<Intent> arrayList = null;
        if (!ec2.a.contains(x98.class)) {
            try {
                str.getClass();
                set2.getClass();
                dx2Var2.getClass();
                str3.getClass();
                ArrayList arrayList2 = x98.b;
                ArrayList arrayList3 = new ArrayList();
                Iterator it3 = arrayList2.iterator();
                while (it3.hasNext()) {
                    boolean z6 = z4;
                    String str8 = str5;
                    String str9 = str6;
                    boolean z7 = z5;
                    boolean z8 = z3;
                    Intent intentC = x98.a.c((w98) it3.next(), str, set2, strW, z, dx2Var2, strC, str3, z2, str4, z8, ea7.FACEBOOK, z6, z7, str8, str9, str7);
                    if (intentC != null) {
                        arrayList3.add(intentC);
                    }
                    z3 = z8;
                    z4 = z6;
                    z5 = z7;
                    str5 = str8;
                    str6 = str9;
                }
                arrayList = arrayList3;
            } catch (Throwable th) {
                ec2.a(x98.class, th);
            }
        }
        a("e2e", strW);
        int i = 0;
        for (Intent intent : arrayList) {
            i++;
            n41.Login.toRequestCode();
            if (t(intent)) {
                return i;
            }
        }
        return 0;
    }
}
