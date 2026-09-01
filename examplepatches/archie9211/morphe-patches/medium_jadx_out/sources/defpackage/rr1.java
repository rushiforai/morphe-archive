package defpackage;

import com.medium.android.donkey.write.EditPostFragment;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rr1 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ upc b;

    public /* synthetic */ rr1(upc upcVar, int i) {
        this.a = i;
        this.b = upcVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        va8 va8Var;
        String str;
        int i = this.a;
        upc upcVar = this.b;
        switch (i) {
            case 0:
                return ((Boolean) upcVar.getValue()).booleanValue() ? z46.m : z46.n;
            case 1:
                return new vj3(((Boolean) upcVar.getValue()).booleanValue() ? 0.0f : 12.0f);
            case 2:
                return new vj3(((Boolean) upcVar.getValue()).booleanValue() ? 4.0f : 0.0f);
            case 3:
                int i2 = EditPostFragment.Q0;
                ps3 ps3Var = (ps3) upcVar.getValue();
                if (ps3Var instanceof ns3) {
                    return ((ns3) ps3Var).d;
                }
                if (ps3Var instanceof os3) {
                    return null;
                }
                ygf.a();
                return null;
            case 4:
                int i3 = EditPostFragment.Q0;
                ps3 ps3Var2 = (ps3) upcVar.getValue();
                if (ps3Var2 instanceof ns3) {
                    return ((ns3) ps3Var2).a;
                }
                if (ps3Var2 instanceof os3) {
                    return "";
                }
                ygf.a();
                return null;
            case 5:
                int i4 = EditPostFragment.Q0;
                ps3 ps3Var3 = (ps3) upcVar.getValue();
                if (ps3Var3 instanceof ns3) {
                    return ((ns3) ps3Var3).e;
                }
                if (ps3Var3 instanceof os3) {
                    return null;
                }
                ygf.a();
                return null;
            case 6:
                List list = (List) upcVar.getValue();
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    if (g76.L(((ba8) obj).b.a, "composable")) {
                        arrayList.add(obj);
                    }
                }
                return arrayList;
            case 7:
                return Float.valueOf(((Number) upcVar.getValue()).floatValue());
            case 8:
                return Float.valueOf(((Number) upcVar.getValue()).floatValue());
            case 9:
                ba8 ba8Var = (ba8) upcVar.getValue();
                return (ba8Var == null || (va8Var = ba8Var.b) == null || (str = (String) va8Var.b.g) == null) ? "main_route" : str;
            case 10:
                ip8 ip8Var = (ip8) upcVar.getValue();
                long j = ip8Var.a;
                return ip8Var;
            case 11:
                ax axVar = jxb.a;
                ip8 ip8Var2 = (ip8) upcVar.getValue();
                long j2 = ip8Var2.a;
                return ip8Var2;
            default:
                Boolean bool = (Boolean) upcVar.getValue();
                bool.getClass();
                return bool;
        }
    }
}
