package defpackage;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ia7 {
    public static final byte[] b;
    public static final byte[] c;
    public static final byte[] d;
    public final f66 a;

    static {
        Charset charset = wk1.a;
        byte[] bytes = ",".getBytes(charset);
        bytes.getClass();
        b = bytes;
        byte[] bytes2 = "[".getBytes(charset);
        bytes2.getClass();
        c = bytes2;
        byte[] bytes3 = "]".getBytes(charset);
        bytes3.getClass();
        d = bytes3;
    }

    public ia7(f66 f66Var) {
        f66Var.getClass();
        this.a = f66Var;
    }

    public final lbb a(vu2 vu2Var, wbb wbbVar, List list) {
        vu2Var.getClass();
        list.getClass();
        String string = UUID.randomUUID().toString();
        string.getClass();
        String str = vu2Var.h;
        String str2 = String.format(Locale.US, "%s?%s=%s", Arrays.copyOf(new Object[]{km4.y(vu2Var.a.getIntakeEndpoint(), "/api/v2/logs"), "ddsource", str}, 3));
        Map mapQ = ei7.Q(new f09("DD-API-KEY", vu2Var.b), new f09("DD-EVP-ORIGIN", str), new f09("DD-EVP-ORIGIN-VERSION", vu2Var.i), new f09("DD-REQUEST-ID", string));
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(((qsa) it2.next()).a);
        }
        byte[] bArr = b;
        bArr.getClass();
        byte[] bArr2 = c;
        bArr2.getClass();
        byte[] bArr3 = d;
        bArr3.getClass();
        f66 f66Var = this.a;
        f66Var.getClass();
        Iterator it3 = arrayList.iterator();
        int length = 0;
        while (it3.hasNext()) {
            length += ((byte[]) it3.next()).length;
        }
        byte[] bArr4 = new byte[bArr2.length + length + (!arrayList.isEmpty() ? (arrayList.size() - 1) * bArr.length : 0) + bArr3.length];
        nk7.n0(bArr2, bArr4, 0, bArr2.length, f66Var);
        int length2 = bArr2.length;
        Iterator it4 = bu1.s1(arrayList).iterator();
        while (true) {
            zm3 zm3Var = (zm3) it4;
            if (!zm3Var.b.hasNext()) {
                nk7.n0(bArr3, bArr4, length2, bArr3.length, f66Var);
                return new lbb(string, str2, mapQ, bArr4);
            }
            r06 r06Var = (r06) zm3Var.next();
            Object obj = r06Var.b;
            byte[] bArr5 = (byte[]) obj;
            nk7.n0(bArr5, bArr4, length2, bArr5.length, f66Var);
            length2 += ((byte[]) obj).length;
            if (r06Var.a != arrayList.size() - 1) {
                nk7.n0(bArr, bArr4, length2, bArr.length, f66Var);
                length2 += bArr.length;
            }
        }
    }
}
