package com.fyber.inneractive.sdk.player.exoplayer2.extractor.flv;

import com.fyber.inneractive.sdk.player.exoplayer2.r;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class c extends e {

    /* renamed from: b, reason: collision with root package name */
    public long f29175b;

    public c() {
        super(null);
        this.f29175b = -9223372036854775807L;
    }

    public final void a(n nVar, long j11) throws r {
        if (nVar.j() != 2) {
            throw new r();
        }
        int iO = nVar.o();
        int i5 = nVar.f30462b;
        nVar.e(i5 + iO);
        if ("onMetaData".equals(new String(nVar.f30461a, i5, iO)) && nVar.j() == 8) {
            HashMap mapA = a(nVar);
            if (mapA.containsKey("duration")) {
                double dDoubleValue = ((Double) mapA.get("duration")).doubleValue();
                if (dDoubleValue > 0.0d) {
                    this.f29175b = (long) (dDoubleValue * 1000000.0d);
                }
            }
        }
    }

    public static Serializable a(int i5, n nVar) {
        if (i5 == 8) {
            return a(nVar);
        }
        if (i5 == 10) {
            int iM = nVar.m();
            ArrayList arrayList = new ArrayList(iM);
            for (int i11 = 0; i11 < iM; i11++) {
                arrayList.add(a(nVar.j(), nVar));
            }
            return arrayList;
        }
        if (i5 == 11) {
            Date date = new Date((long) Double.longBitsToDouble(nVar.g()));
            nVar.e(nVar.f30462b + 2);
            return date;
        }
        if (i5 == 0) {
            return Double.valueOf(Double.longBitsToDouble(nVar.g()));
        }
        if (i5 == 1) {
            return Boolean.valueOf(nVar.j() == 1);
        }
        if (i5 == 2) {
            int iO = nVar.o();
            int i12 = nVar.f30462b;
            nVar.e(i12 + iO);
            return new String(nVar.f30461a, i12, iO);
        }
        if (i5 != 3) {
            return null;
        }
        HashMap map = new HashMap();
        while (true) {
            int iO2 = nVar.o();
            int i13 = nVar.f30462b;
            nVar.e(i13 + iO2);
            String str = new String(nVar.f30461a, i13, iO2);
            int iJ = nVar.j();
            if (iJ == 9) {
                return map;
            }
            map.put(str, a(iJ, nVar));
        }
    }

    public static HashMap a(n nVar) {
        int iM = nVar.m();
        HashMap map = new HashMap(iM);
        for (int i5 = 0; i5 < iM; i5++) {
            int iO = nVar.o();
            int i11 = nVar.f30462b;
            nVar.e(i11 + iO);
            map.put(new String(nVar.f30461a, i11, iO), a(nVar.j(), nVar));
        }
        return map;
    }
}
