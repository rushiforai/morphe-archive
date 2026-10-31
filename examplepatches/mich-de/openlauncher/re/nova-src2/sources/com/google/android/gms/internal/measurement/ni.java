package com.google.android.gms.internal.measurement;

import java.util.Set;

/* loaded from: classes3.dex */
public final class ni extends c {

    /* renamed from: b, reason: collision with root package name */
    public final h f32861b;

    /* renamed from: c, reason: collision with root package name */
    public final h f32862c;

    /* renamed from: d, reason: collision with root package name */
    public final int[] f32863d;

    /* renamed from: e, reason: collision with root package name */
    public final int f32864e;

    /* JADX WARN: Removed duplicated region for block: B:25:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ni(h hVar, h hVar2) {
        this.f32861b = hVar;
        this.f32862c = hVar2;
        int iA = hVar2.a();
        if (!(iA <= 28)) {
            throw new IllegalArgumentException("metadata size too large");
        }
        int[] iArr = new int[iA];
        this.f32863d = iArr;
        long j11 = 0;
        int i5 = 0;
        int i11 = 0;
        while (i5 < iA) {
            th thVarD = d(i5);
            long j12 = thVarD.f33096e | j11;
            if (j12 == j11) {
                int i12 = 0;
                while (true) {
                    if (i12 >= i11) {
                        i12 = -1;
                        break;
                    } else if (thVarD.equals(d(iArr[i12] & 31))) {
                        break;
                    } else {
                        i12++;
                    }
                }
                if (i12 != -1) {
                    iArr[i12] = thVarD.f33094c ? iArr[i12] | (1 << (i5 + 4)) : i5;
                } else {
                    iArr[i11] = i5;
                    i11++;
                }
            }
            i5++;
            j11 = j12;
        }
        this.f32864e = i11;
    }

    @Override // com.google.android.gms.internal.measurement.c
    public final void a(ki kiVar, fi fiVar) {
        for (int i5 = 0; i5 < this.f32864e; i5++) {
            int i11 = this.f32863d[i5];
            th thVarD = d(i11 & 31);
            if (thVarD.f33094c) {
                kiVar.b(thVarD, new mi(this, thVarD, i11), fiVar);
            } else {
                h hVar = this.f32861b;
                int iA = hVar.a();
                if (i11 >= iA) {
                    hVar = this.f32862c;
                    i11 -= iA;
                }
                kiVar.a(thVarD, thVarD.f33093b.cast(hVar.i(i11)), fiVar);
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.c
    public final int b() {
        return this.f32864e;
    }

    @Override // com.google.android.gms.internal.measurement.c
    public final Set c() {
        return new androidx.datastore.preferences.protobuf.e1(this, 4);
    }

    public final th d(int i5) {
        h hVar = this.f32861b;
        int iA = hVar.a();
        return i5 >= iA ? this.f32862c.h(i5 - iA) : hVar.h(i5);
    }
}
