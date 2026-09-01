package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n36 extends v98 {
    public static final Parcelable.Creator<n36> CREATOR = new h74(15);
    public final h4 e;

    public n36(Parcel parcel) {
        super(0, parcel);
        this.e = h4.INSTAGRAM_APPLICATION_WEB;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // defpackage.ba7
    public final String e() {
        return "instagram_login";
    }

    @Override // defpackage.ba7
    public final int k(m87 m87Var) {
        boolean z;
        Object obj;
        m87Var.getClass();
        String strW = s42.W();
        Context contextE = d().e();
        if (contextE == null) {
            contextE = f94.a();
        }
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
        String strC = c(m87Var.g);
        String str3 = m87Var.j;
        String str4 = m87Var.l;
        boolean z2 = m87Var.m;
        boolean z3 = m87Var.o;
        boolean z4 = m87Var.p;
        x98 x98Var = x98.a;
        Set set3 = ec2.a;
        Intent intent = null;
        if (!set3.contains(x98.class)) {
            try {
                str.getClass();
                set2.getClass();
                dx2Var.getClass();
                str3.getClass();
                Context context = contextE;
                try {
                    Intent intentC = x98.a.c(new w98(1), str, set2, strW, z, dx2Var, strC, str3, false, str4, z2, ea7.INSTAGRAM, z3, z4, "", null, null);
                    obj = x98.class;
                    try {
                        if (!set3.contains(obj) && intentC != null) {
                            try {
                                ResolveInfo resolveInfoResolveActivity = context.getPackageManager().resolveActivity(intentC, 0);
                                if (resolveInfoResolveActivity != null) {
                                    String str5 = resolveInfoResolveActivity.activityInfo.packageName;
                                    str5.getClass();
                                    if (g94.a(context, str5)) {
                                        intent = intentC;
                                    }
                                }
                            } catch (Throwable th) {
                                ec2.a(obj, th);
                            }
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        ec2.a(obj, th);
                    }
                } catch (Throwable th3) {
                    th = th3;
                    obj = x98.class;
                }
            } catch (Throwable th4) {
                th = th4;
                obj = x98.class;
            }
        }
        Intent intent2 = intent;
        a("e2e", strW);
        n41.Login.toRequestCode();
        return t(intent2) ? 1 : 0;
    }

    @Override // defpackage.v98
    public final h4 p() {
        return this.e;
    }

    @Override // defpackage.ba7, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        super.writeToParcel(parcel, i);
    }

    public n36(p87 p87Var) {
        super(p87Var);
        this.e = h4.INSTAGRAM_APPLICATION_WEB;
    }
}
