package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vx5 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ vx5(int i, cv6 cv6Var) {
        this.a = 11;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        int i = this.a;
        Context context = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return dm2.y(g76.W(((rx5) obj).a, R.drawable.avatar_placeholder));
            case 1:
                return dm2.y(g76.W(((rx5) obj).a, R.drawable.avatar_placeholder));
            case 2:
                return c1eVar;
            case 3:
                vn1 vn1Var = (vn1) obj;
                vn1Var.getClass();
                vn1.a(vn1Var, "JsonPrimitive", new hc6(new e73(24)));
                vn1.a(vn1Var, "JsonNull", new hc6(new e73(25)));
                vn1.a(vn1Var, "JsonLiteral", new hc6(new e73(26)));
                vn1.a(vn1Var, "JsonObject", new hc6(new e73(27)));
                vn1.a(vn1Var, "JsonArray", new hc6(new e73(28)));
                return c1eVar;
            case 4:
                Map.Entry entry = (Map.Entry) obj;
                entry.getClass();
                String str = (String) entry.getKey();
                cc6 cc6Var = (cc6) entry.getValue();
                StringBuilder sb = new StringBuilder();
                iuc.a(str, sb);
                sb.append(':');
                sb.append(cc6Var);
                return sb.toString();
            case 5:
                return c1eVar;
            case 6:
                List list = (List) obj;
                return new ur6(((Number) list.get(0)).intValue(), ((Number) list.get(1)).intValue());
            case 7:
                ((Integer) obj).getClass();
                return ey3.a;
            case 8:
                ((Integer) obj).getClass();
                return -1;
            case 9:
                return c1eVar;
            case 10:
                List list2 = (List) obj;
                return new kv6(((Number) list2.get(0)).intValue(), ((Number) list2.get(1)).intValue());
            case 11:
                return c1eVar;
            case 12:
                ((dv6) obj).getClass();
                return Boolean.TRUE;
            case 13:
                ((Integer) obj).getClass();
                return null;
            case 14:
                return c1eVar;
            case 15:
                List list3 = (List) obj;
                return new pw6((int[]) list3.get(0), (int[]) list3.get(1));
            case 16:
                ((lw6) obj).getClass();
                return Boolean.TRUE;
            case 17:
                return c1eVar;
            case 18:
                return c1eVar;
            case 19:
                return c1eVar;
            case 20:
                x07 x07Var = (x07) obj;
                x07Var.getClass();
                ep7 ep7Var = x07Var.g;
                if (ep7Var instanceof x07) {
                    return (x07) ep7Var;
                }
                return null;
            case 21:
                x07 x07Var2 = (x07) obj;
                x07Var2.getClass();
                StringBuilder sb2 = new StringBuilder();
                sb2.append(x07Var2.e);
                sb2.append('=');
                sb2.append(x07Var2.f);
                return sb2.toString();
            case 22:
                return b09.w(((Integer) obj).intValue(), "catalog_skeleton_item_");
            case 23:
                rg1 rg1Var = (rg1) obj;
                rg1Var.getClass();
                return ka1.r("catalog_item_", rg1Var.a);
            case 24:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnb gnbVarB0 = anbVar.B0("SELECT * FROM lists_catalog_download_state");
                try {
                    int iY = il7.y(gnbVarB0, "id");
                    int iY2 = il7.y(gnbVarB0, "downloaded_item_count");
                    int iY3 = il7.y(gnbVarB0, "total_item_count");
                    int iY4 = il7.y(gnbVarB0, "downloading");
                    int iY5 = il7.y(gnbVarB0, "downloading_post_id");
                    ArrayList arrayList = new ArrayList();
                    while (gnbVarB0.w0()) {
                        arrayList.add(new p37(gnbVarB0.d0(iY), (int) gnbVarB0.getLong(iY2), (int) gnbVarB0.getLong(iY3), ((int) gnbVarB0.getLong(iY4)) != 0, gnbVarB0.isNull(iY5) ? null : gnbVarB0.d0(iY5)));
                        break;
                    }
                    return arrayList;
                } finally {
                }
            case 25:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                try {
                    anbVar2.B0("DELETE FROM lists_catalog_download_state").w0();
                    return c1eVar;
                } finally {
                }
            case 26:
                sn3 sn3Var = eo.b;
                i89 i89Var = (i89) ((t22) obj);
                i89Var.getClass();
                Context baseContext = (Context) m40.U(i89Var, sn3Var);
                while (true) {
                    if (baseContext instanceof ContextWrapper) {
                        if (baseContext instanceof Activity) {
                            context = baseContext;
                        } else {
                            baseContext = ((ContextWrapper) baseContext).getBaseContext();
                        }
                    }
                }
                return (Activity) context;
            case 27:
                String str2 = (String) obj;
                if (str2.length() <= 0) {
                    return str2;
                }
                return ((Object) mq7.G(str2.charAt(0))) + str2.substring(1);
            case 28:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            default:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
        }
    }

    public /* synthetic */ vx5(int i) {
        this.a = i;
    }
}
