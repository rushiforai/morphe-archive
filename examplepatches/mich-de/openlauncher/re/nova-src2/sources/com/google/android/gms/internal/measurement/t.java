package com.google.android.gms.internal.measurement;

import java.util.Comparator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class t implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33073a;

    public /* synthetic */ t(int i5) {
        this.f33073a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f33073a) {
            case 0:
                int iA = b.c9.a(obj);
                int iA2 = b.c9.a(obj2);
                if (iA != iA2) {
                    if (iA == 0 || iA2 == 0) {
                        throw null;
                    }
                    return iA - iA2;
                }
                int iF = b.c0.F(iA);
                if (iF == 0) {
                    return ((Boolean) obj).compareTo((Boolean) obj2);
                }
                if (iF == 1) {
                    return ((String) obj).compareTo((String) obj2);
                }
                if (iF == 2) {
                    return ((Long) obj).compareTo((Long) obj2);
                }
                if (iF == 3) {
                    return ((Double) obj).compareTo((Double) obj2);
                }
                throw null;
            default:
                return ((String) ((Map.Entry) obj).getKey()).compareTo((String) ((Map.Entry) obj2).getKey());
        }
    }
}
