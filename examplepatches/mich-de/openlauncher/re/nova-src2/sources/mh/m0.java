package mh;

import com.google.android.gms.internal.fido.zzhf;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class m0 extends s0 {

    /* renamed from: a, reason: collision with root package name */
    public final j f76358a;

    /* renamed from: b, reason: collision with root package name */
    public final int f76359b;

    public m0(u uVar) throws zzhf {
        uVar.getClass();
        this.f76358a = uVar;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            j jVar = this.f76358a;
            if (i5 >= jVar.size()) {
                break;
            }
            int iA = ((s0) jVar.get(i5)).a();
            if (i11 < iA) {
                i11 = iA;
            }
            i5++;
        }
        int i12 = i11 + 1;
        this.f76359b = i12;
        if (i12 > 8) {
            throw new zzhf("Exceeded cutoff limit for max depth of cbor value");
        }
    }

    @Override // mh.s0
    public final int a() {
        return this.f76359b;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        s0 s0Var = (s0) obj;
        int iZza = s0Var.zza();
        int iC = s0.c((byte) -128);
        if (iC != iZza) {
            return iC - s0Var.zza();
        }
        j jVar = ((m0) s0Var).f76358a;
        j jVar2 = this.f76358a;
        if (jVar2.size() != jVar.size()) {
            return jVar2.size() - jVar.size();
        }
        for (int i5 = 0; i5 < jVar2.size(); i5++) {
            int iCompareTo = ((s0) jVar2.get(i5)).compareTo((s0) jVar.get(i5));
            if (iCompareTo != 0) {
                return iCompareTo;
            }
        }
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && m0.class == obj.getClass()) {
            return this.f76358a.equals(((m0) obj).f76358a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(s0.c((byte) -128)), this.f76358a});
    }

    public final String toString() {
        j jVar = this.f76358a;
        if (jVar.isEmpty()) {
            return "[]";
        }
        ArrayList arrayList = new ArrayList();
        int size = jVar.size();
        for (int i5 = 0; i5 < size; i5++) {
            arrayList.add(((s0) jVar.get(i5)).toString().replace("\n", "\n  "));
        }
        StringBuilder sb2 = new StringBuilder("[\n  ");
        Iterator it = arrayList.iterator();
        try {
            if (it.hasNext()) {
                sb2.append(br.c.m(it.next()));
                while (it.hasNext()) {
                    sb2.append((CharSequence) ",\n  ");
                    sb2.append(br.c.m(it.next()));
                }
            }
            sb2.append("\n]");
            return sb2.toString();
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    @Override // mh.s0
    public final int zza() {
        return s0.c((byte) -128);
    }
}
