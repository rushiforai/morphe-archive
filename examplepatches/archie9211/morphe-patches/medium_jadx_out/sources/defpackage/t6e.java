package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class t6e implements zs5 {
    public final LinkedHashMap a;
    public final h21 b;
    public final String c;
    public final String d;
    public final w5d e;

    public t6e(LinkedHashMap linkedHashMap, h21 h21Var) {
        h21Var.getClass();
        this.a = linkedHashMap;
        this.b = h21Var;
        UUID uuidRandomUUID = UUID.randomUUID();
        uuidRandomUUID.getClass();
        String string = uuidRandomUUID.toString();
        string.getClass();
        this.c = string;
        this.d = "multipart/form-data; boundary=".concat(string);
        this.e = new w5d(new doc(22, this));
    }

    @Override // defpackage.zs5
    public final void a(xz0 xz0Var) {
        d(xz0Var);
    }

    @Override // defpackage.zs5
    public final String b() {
        return this.d;
    }

    @Override // defpackage.zs5
    public final long c() {
        return ((Number) this.e.getValue()).longValue();
    }

    public final void d(xz0 xz0Var) {
        StringBuilder sb = new StringBuilder("--");
        String str = this.c;
        sb.append(str);
        sb.append("\r\n");
        xz0Var.Y(sb.toString());
        xz0Var.Y("Content-Disposition: form-data; name=\"operations\"\r\n");
        xz0Var.Y("Content-Type: application/json\r\n");
        StringBuilder sb2 = new StringBuilder("Content-Length: ");
        h21 h21Var = this.b;
        sb2.append(h21Var.e());
        sb2.append("\r\n");
        xz0Var.Y(sb2.toString());
        xz0Var.Y("\r\n");
        xz0Var.C0(h21Var);
        kz0 kz0Var = new kz0();
        yz0 yz0Var = new yz0(kz0Var);
        LinkedHashMap linkedHashMap = this.a;
        Set setEntrySet = linkedHashMap.entrySet();
        ArrayList arrayList = new ArrayList(cu1.k0(setEntrySet, 10));
        int i = 0;
        for (Object obj : setEntrySet) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            arrayList.add(new f09(String.valueOf(i), d46.Q(((Map.Entry) obj).getKey())));
            i = i2;
        }
        f76.R(yz0Var, ei7.V(arrayList));
        h21 h21VarR = kz0Var.r(kz0Var.b);
        xz0Var.Y("\r\n--" + str + "\r\n");
        xz0Var.Y("Content-Disposition: form-data; name=\"map\"\r\n");
        xz0Var.Y("Content-Type: application/json\r\n");
        xz0Var.Y("Content-Length: " + h21VarR.e() + "\r\n");
        xz0Var.Y("\r\n");
        xz0Var.C0(h21VarR);
        Iterator it2 = linkedHashMap.values().iterator();
        if (!it2.hasNext()) {
            xz0Var.Y("\r\n--" + str + CspinKvYN.WSBIFAzESAsm);
            return;
        }
        if (it2.next() != null) {
            rd6.m();
            return;
        }
        xz0Var.Y("\r\n--" + str + "\r\n");
        xz0Var.Y("Content-Disposition: form-data; name=\"0\"");
        throw null;
    }
}
