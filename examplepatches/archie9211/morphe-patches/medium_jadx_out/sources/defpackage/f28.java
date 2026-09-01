package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f28 {
    public static final HashMap m = ei7.O(new f09("embedding.weight", "embed.weight"), new f09("dense1.weight", "fc1.weight"), new f09("dense2.weight", "fc2.weight"), new f09("dense3.weight", "fc3.weight"), new f09("dense1.bias", "fc1.bias"), new f09("dense2.bias", "fc2.bias"), new f09("dense3.bias", "fc3.bias"));
    public final dd7 a;
    public final dd7 b;
    public final dd7 c;
    public final dd7 d;
    public final dd7 e;
    public final dd7 f;
    public final dd7 g;
    public final dd7 h;
    public final dd7 i;
    public final dd7 j;
    public final dd7 k;
    public final HashMap l;

    public f28(HashMap map) {
        Object obj = map.get("embed.weight");
        if (obj == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.a = (dd7) obj;
        Object obj2 = map.get("convs.0.weight");
        if (obj2 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.b = rv8.U((dd7) obj2);
        Object obj3 = map.get("convs.1.weight");
        if (obj3 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.c = rv8.U((dd7) obj3);
        Object obj4 = map.get("convs.2.weight");
        if (obj4 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.d = rv8.U((dd7) obj4);
        Object obj5 = map.get("convs.0.bias");
        if (obj5 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.e = (dd7) obj5;
        Object obj6 = map.get("convs.1.bias");
        if (obj6 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.f = (dd7) obj6;
        Object obj7 = map.get("convs.2.bias");
        if (obj7 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.g = (dd7) obj7;
        Object obj8 = map.get("fc1.weight");
        if (obj8 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.h = rv8.T((dd7) obj8);
        Object obj9 = map.get("fc2.weight");
        if (obj9 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.i = rv8.T((dd7) obj9);
        Object obj10 = map.get("fc1.bias");
        if (obj10 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.j = (dd7) obj10;
        Object obj11 = map.get("fc2.bias");
        if (obj11 == null) {
            ygf.f("Required value was null.");
            throw null;
        }
        this.k = (dd7) obj11;
        this.l = new HashMap();
        for (String str : k80.S0(new String[]{h28.MTML_INTEGRITY_DETECT.toKey(), h28.MTML_APP_EVENT_PREDICTION.toKey()})) {
            String strY = km4.y(str, ".weight");
            String strY2 = km4.y(str, ".bias");
            dd7 dd7Var = (dd7) map.get(strY);
            dd7 dd7Var2 = (dd7) map.get(strY2);
            if (dd7Var != null) {
                this.l.put(strY, rv8.T(dd7Var));
            }
            if (dd7Var2 != null) {
                this.l.put(strY2, dd7Var2);
            }
        }
    }

    public final dd7 a(dd7 dd7Var, String[] strArr, String str) {
        HashMap map = this.l;
        if (!ec2.a.contains(this)) {
            try {
                str.getClass();
                dd7 dd7VarT = rv8.t(rv8.v(strArr, this.a), this.b);
                rv8.r(dd7VarT, this.e);
                rv8.M(dd7VarT);
                dd7 dd7VarT2 = rv8.t(dd7VarT, this.c);
                rv8.r(dd7VarT2, this.f);
                rv8.M(dd7VarT2);
                dd7 dd7VarH = rv8.H(dd7VarT2, 2);
                dd7 dd7VarT3 = rv8.t(dd7VarH, this.d);
                rv8.r(dd7VarT3, this.g);
                rv8.M(dd7VarT3);
                dd7 dd7VarH2 = rv8.H(dd7VarT, dd7VarT.a[1]);
                dd7 dd7VarH3 = rv8.H(dd7VarH, dd7VarH.a[1]);
                dd7 dd7VarH4 = rv8.H(dd7VarT3, dd7VarT3.a[1]);
                rv8.B(dd7VarH2);
                rv8.B(dd7VarH3);
                rv8.B(dd7VarH4);
                dd7 dd7VarU = rv8.u(rv8.s(new dd7[]{dd7VarH2, dd7VarH3, dd7VarH4, dd7Var}), this.h, this.j);
                rv8.M(dd7VarU);
                dd7 dd7VarU2 = rv8.u(dd7VarU, this.i, this.k);
                rv8.M(dd7VarU2);
                dd7 dd7Var2 = (dd7) map.get(str.concat(".weight"));
                dd7 dd7Var3 = (dd7) map.get(str.concat(".bias"));
                if (dd7Var2 != null && dd7Var3 != null) {
                    dd7 dd7VarU3 = rv8.u(dd7VarU2, dd7Var2, dd7Var3);
                    rv8.O(dd7VarU3);
                    return dd7VarU3;
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }
}
