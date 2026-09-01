package defpackage;

import com.google.android.gms.internal.fido.zzhf;
import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h7g extends o7g {
    public final int a;
    public final nyf b;

    public h7g(nyf nyfVar) throws zzhf {
        nyfVar.getClass();
        this.b = nyfVar;
        ugf ugfVarV = nyfVar.entrySet().v();
        int i = 0;
        while (ugfVarV.hasNext()) {
            Map.Entry entry = (Map.Entry) ugfVarV.next();
            int iB = ((o7g) entry.getKey()).b();
            i = i < iB ? iB : i;
            int iB2 = ((o7g) entry.getValue()).b();
            if (i < iB2) {
                i = iB2;
            }
        }
        int i2 = i + 1;
        this.a = i2;
        if (i2 > 8) {
            throw new zzhf("Exceeded cutoff limit for max depth of cbor value");
        }
    }

    @Override // defpackage.o7g
    public final int a() {
        return o7g.d((byte) -96);
    }

    @Override // defpackage.o7g
    public final int b() {
        return this.a;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        int iCompareTo;
        o7g o7gVar = (o7g) obj;
        int iA = o7gVar.a();
        int iD = o7g.d((byte) -96);
        if (iD != iA) {
            return iD - o7gVar.a();
        }
        nyf nyfVar = ((h7g) o7gVar).b;
        nyf nyfVar2 = this.b;
        if (nyfVar2.d.size() != nyfVar.d.size()) {
            return nyfVar2.d.size() - nyfVar.d.size();
        }
        ugf ugfVarV = nyfVar2.entrySet().v();
        ugf ugfVarV2 = nyfVar.entrySet().v();
        do {
            if (!ugfVarV.hasNext() && !ugfVarV2.hasNext()) {
                return 0;
            }
            Map.Entry entry = (Map.Entry) ugfVarV.next();
            Map.Entry entry2 = (Map.Entry) ugfVarV2.next();
            int iCompareTo2 = ((o7g) entry.getKey()).compareTo((o7g) entry2.getKey());
            if (iCompareTo2 != 0) {
                return iCompareTo2;
            }
            iCompareTo = ((o7g) entry.getValue()).compareTo((o7g) entry2.getValue());
        } while (iCompareTo == 0);
        return iCompareTo;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && h7g.class == obj.getClass()) {
            return this.b.equals(((h7g) obj).b);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(o7g.d((byte) -96)), this.b});
    }

    public final String toString() {
        nyf nyfVar = this.b;
        if (nyfVar.isEmpty()) {
            return "{}";
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ugf ugfVarV = nyfVar.entrySet().v();
        while (ugfVarV.hasNext()) {
            Map.Entry entry = (Map.Entry) ugfVarV.next();
            linkedHashMap.put(((o7g) entry.getKey()).toString().replace("\n", "\n  "), ((o7g) entry.getValue()).toString().replace("\n", "\n  "));
        }
        y3b y3bVar = new y3b(27);
        StringBuilder sb = new StringBuilder("{\n  ");
        try {
            tp7.D(sb, linkedHashMap.entrySet().iterator(), y3bVar);
            sb.append("\n}");
            return sb.toString();
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }
}
