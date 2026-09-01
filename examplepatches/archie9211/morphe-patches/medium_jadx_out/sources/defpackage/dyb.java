package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dyb extends co6 implements b55 {
    public static final dyb b;
    public static final dyb c;
    public static final dyb d;
    public static final dyb e;
    public static final dyb f;
    public static final dyb g;
    public static final dyb h;
    public static final dyb i;
    public static final dyb j;
    public final /* synthetic */ int a;

    static {
        int i2 = 2;
        b = new dyb(i2, 0);
        c = new dyb(i2, 1);
        d = new dyb(i2, 2);
        e = new dyb(i2, 3);
        f = new dyb(i2, 4);
        g = new dyb(i2, 5);
        h = new dyb(i2, 6);
        i = new dyb(i2, 7);
        j = new dyb(i2, 8);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dyb(int i2, int i3) {
        super(i2);
        this.a = i3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        String str;
        j55 j55Var;
        switch (this.a) {
            case 0:
                return (m3c) obj;
            case 1:
                return (String) obj;
            case 2:
                List list = (List) obj;
                List list2 = (List) obj2;
                if (list == null) {
                    return list2;
                }
                ArrayList arrayList = new ArrayList(list);
                arrayList.addAll(list2);
                return arrayList;
            case 3:
                Float f2 = (Float) obj;
                ((Number) obj2).floatValue();
                return f2;
            case 4:
                return (String) obj;
            case 5:
                Boolean bool = (Boolean) obj;
                ((Boolean) obj2).getClass();
                return bool;
            case 6:
                i4 i4Var = (i4) obj;
                i4 i4Var2 = (i4) obj2;
                if (i4Var == null || (str = i4Var.a) == null) {
                    str = i4Var2.a;
                }
                if (i4Var == null || (j55Var = i4Var.b) == null) {
                    j55Var = i4Var2.b;
                }
                return new i4(str, j55Var);
            case 7:
                return obj == null ? obj2 : obj;
            default:
                zxb zxbVar = (zxb) obj2;
                Object objValueOf = Float.valueOf(0.0f);
                txb txbVar = ((zxb) obj).d;
                iyb iybVar = eyb.u;
                Object objG = txbVar.a.g(iybVar);
                if (objG == null) {
                    objG = objValueOf;
                }
                float fFloatValue = ((Number) objG).floatValue();
                Object objG2 = zxbVar.d.a.g(iybVar);
                if (objG2 != null) {
                    objValueOf = objG2;
                }
                return Integer.valueOf(Float.compare(fFloatValue, ((Number) objValueOf).floatValue()));
        }
    }
}
