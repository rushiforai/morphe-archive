package mh;

import com.google.android.gms.internal.fido.zzhf;
import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class q0 extends s0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f76372a;

    /* renamed from: b, reason: collision with root package name */
    public final o f76373b;

    public q0(o oVar) throws zzhf {
        oVar.getClass();
        this.f76373b = oVar;
        a0 a0VarE = oVar.entrySet().e();
        int i5 = 0;
        while (a0VarE.hasNext()) {
            Map.Entry entry = (Map.Entry) a0VarE.next();
            int iA = ((s0) entry.getKey()).a();
            i5 = i5 < iA ? iA : i5;
            int iA2 = ((s0) entry.getValue()).a();
            if (i5 < iA2) {
                i5 = iA2;
            }
        }
        int i11 = i5 + 1;
        this.f76372a = i11;
        if (i11 > 8) {
            throw new zzhf("Exceeded cutoff limit for max depth of cbor value");
        }
    }

    @Override // mh.s0
    public final int a() {
        return this.f76372a;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        int iCompareTo;
        s0 s0Var = (s0) obj;
        int iZza = s0Var.zza();
        int iC = s0.c((byte) -96);
        if (iC != iZza) {
            return iC - s0Var.zza();
        }
        o oVar = ((q0) s0Var).f76373b;
        o oVar2 = this.f76373b;
        if (oVar2.f76364d.size() != oVar.f76364d.size()) {
            return oVar2.f76364d.size() - oVar.f76364d.size();
        }
        a0 a0VarE = oVar2.entrySet().e();
        a0 a0VarE2 = oVar.entrySet().e();
        do {
            if (!a0VarE.hasNext() && !a0VarE2.hasNext()) {
                return 0;
            }
            Map.Entry entry = (Map.Entry) a0VarE.next();
            Map.Entry entry2 = (Map.Entry) a0VarE2.next();
            int iCompareTo2 = ((s0) entry.getKey()).compareTo((s0) entry2.getKey());
            if (iCompareTo2 != 0) {
                return iCompareTo2;
            }
            iCompareTo = ((s0) entry.getValue()).compareTo((s0) entry2.getValue());
        } while (iCompareTo == 0);
        return iCompareTo;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && q0.class == obj.getClass()) {
            return this.f76373b.equals(((q0) obj).f76373b);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(s0.c((byte) -96)), this.f76373b});
    }

    public final String toString() {
        o oVar = this.f76373b;
        if (oVar.isEmpty()) {
            return "{}";
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        a0 a0VarE = oVar.entrySet().e();
        while (a0VarE.hasNext()) {
            Map.Entry entry = (Map.Entry) a0VarE.next();
            linkedHashMap.put(((s0) entry.getKey()).toString().replace("\n", "\n  "), ((s0) entry.getValue()).toString().replace("\n", "\n  "));
        }
        br.c cVar = new br.c();
        StringBuilder sb2 = new StringBuilder("{\n  ");
        try {
            a.g(sb2, linkedHashMap.entrySet().iterator(), cVar);
            sb2.append("\n}");
            return sb2.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    @Override // mh.s0
    public final int zza() {
        return s0.c((byte) -96);
    }
}
