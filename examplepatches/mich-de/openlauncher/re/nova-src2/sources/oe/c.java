package oe;

import ai.u1;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class c extends u1 {

    /* renamed from: b, reason: collision with root package name */
    public long f80333b;

    /* renamed from: c, reason: collision with root package name */
    public long[] f80334c;

    /* renamed from: d, reason: collision with root package name */
    public long[] f80335d;

    public static Serializable E(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        if (i5 == 0) {
            return Double.valueOf(Double.longBitsToDouble(aVar.H()));
        }
        if (i5 == 1) {
            return Boolean.valueOf(aVar.N() == 1);
        }
        if (i5 == 2) {
            return G(aVar);
        }
        if (i5 != 3) {
            if (i5 == 8) {
                return F(aVar);
            }
            if (i5 != 10) {
                if (i5 != 11) {
                    return null;
                }
                Date date = new Date((long) Double.longBitsToDouble(aVar.H()));
                aVar.Z(2);
                return date;
            }
            int iQ = aVar.Q();
            ArrayList arrayList = new ArrayList(iQ);
            for (int i11 = 0; i11 < iQ; i11++) {
                Serializable serializableE = E(aVar.N(), aVar);
                if (serializableE != null) {
                    arrayList.add(serializableE);
                }
            }
            return arrayList;
        }
        HashMap map = new HashMap();
        while (true) {
            String strG = G(aVar);
            int iN = aVar.N();
            if (iN == 9) {
                return map;
            }
            Serializable serializableE2 = E(iN, aVar);
            if (serializableE2 != null) {
                map.put(strG, serializableE2);
            }
        }
    }

    public static HashMap F(com.google.android.gms.internal.consent_sdk.a aVar) {
        int iQ = aVar.Q();
        HashMap map = new HashMap(iQ);
        for (int i5 = 0; i5 < iQ; i5++) {
            String strG = G(aVar);
            Serializable serializableE = E(aVar.N(), aVar);
            if (serializableE != null) {
                map.put(strG, serializableE);
            }
        }
        return map;
    }

    public static String G(com.google.android.gms.internal.consent_sdk.a aVar) {
        int iS = aVar.S();
        int i5 = aVar.f31984b;
        aVar.Z(iS);
        return new String((byte[]) aVar.f31986d, i5, iS);
    }
}
