package defpackage;

import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i2g extends h5g {
    private static final i2g zzb;
    private q5g zzd = z7g.e;

    static {
        i2g i2gVar = new i2g();
        zzb = i2gVar;
        h5g.f(i2g.class, i2gVar);
    }

    public static e2g q() {
        return (e2g) zzb.k();
    }

    public static void r(i2g i2gVar, ArrayList arrayList) {
        q5g q5gVarC = i2gVar.zzd;
        if (!((e3g) q5gVarC).a) {
            int size = q5gVarC.size();
            q5gVarC = q5gVarC.c(size + size);
            i2gVar.zzd = q5gVarC;
        }
        int size2 = arrayList.size();
        if (q5gVarC instanceof ArrayList) {
            ((ArrayList) q5gVarC).ensureCapacity(q5gVarC.size() + size2);
        } else if (q5gVarC instanceof z7g) {
            z7g z7gVar = (z7g) q5gVarC;
            int i = z7gVar.c + size2;
            int length = z7gVar.b.length;
            if (i > length) {
                if (length != 0) {
                    while (length < i) {
                        length = wgd.n(length, 3, 2, 1, 10);
                    }
                    z7gVar.b = Arrays.copyOf(z7gVar.b, length);
                } else {
                    z7gVar.b = new Object[Math.max(i, 10)];
                }
            }
        }
        int size3 = q5gVarC.size();
        int size4 = arrayList.size();
        for (int i2 = 0; i2 < size4; i2++) {
            Object obj = arrayList.get(i2);
            if (obj == null) {
                String strW = ev6.w("Element at index ", q5gVarC.size() - size3, " is null.");
                int size5 = q5gVarC.size();
                while (true) {
                    size5--;
                    if (size5 < size3) {
                        z72.c(strW);
                        return;
                    }
                    q5gVarC.remove(size5);
                }
            } else {
                q5gVarC.add(obj);
            }
        }
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b", new Object[]{"zzd", c2g.class});
        }
        if (i2 == 3) {
            return new i2g();
        }
        if (i2 == 4) {
            return new e2g(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
