package defpackage;

import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class h implements bf5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;

    public /* synthetic */ h(List list, int i) {
        this.a = i;
        this.b = list;
    }

    @Override // defpackage.bf5
    public final void a(if5 if5Var) {
        JSONObject jSONObject;
        JSONObject jSONObject2;
        int i = this.a;
        List list = this.b;
        switch (i) {
            case 0:
                if (!ec2.a.contains(i.class)) {
                    try {
                        if (if5Var.c == null && (jSONObject2 = if5Var.d) != null && jSONObject2.getBoolean("success")) {
                            Iterator it2 = list.iterator();
                            while (it2.hasNext()) {
                                xz5.N(((z36) it2.next()).a);
                                break;
                            }
                            break;
                        }
                    } catch (JSONException unused) {
                        return;
                    } catch (Throwable th) {
                        ec2.a(i.class, th);
                    }
                }
                break;
            default:
                try {
                    if (if5Var.c == null && (jSONObject = if5Var.d) != null && jSONObject.getBoolean("success")) {
                        Iterator it3 = list.iterator();
                        while (it3.hasNext()) {
                            xz5.N(((z36) it3.next()).a);
                            break;
                        }
                        break;
                    }
                } catch (JSONException unused2) {
                    return;
                }
                break;
        }
    }
}
