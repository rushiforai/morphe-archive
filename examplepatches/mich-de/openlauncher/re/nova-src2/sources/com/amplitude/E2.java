package com.amplitude;

import java.util.LinkedHashMap;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UnsignedKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public final class E2 {

    /* renamed from: a, reason: collision with root package name */
    public final double f20223a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f20224b;

    public E2(Number sampleRate) {
        Intrinsics.g(sampleRate, "sampleRate");
        this.f20223a = sampleRate.doubleValue();
        this.f20224b = new LinkedHashMap();
    }

    public final boolean a(long j11) {
        int iRotateLeft;
        int i5;
        Boolean bool = (Boolean) this.f20224b.get(Long.valueOf(j11));
        if (bool != null) {
            return bool.booleanValue();
        }
        String value = String.valueOf(j11);
        Intrinsics.g(value, "value");
        byte[] bytes = value.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        int length = bytes.length;
        if (length >= 16) {
            UInt.Companion companion = UInt.f71696b;
            int i11 = 606290984;
            int iRotateLeft2 = 1640531535;
            i5 = 0;
            int iRotateLeft3 = 0;
            int iRotateLeft4 = -2048144777;
            while (i5 <= length - 16) {
                int iRotateLeft5 = Integer.rotateLeft((P4.a(bytes, i5) * (-2048144777)) + i11, 13) * (-1640531535);
                iRotateLeft4 = Integer.rotateLeft((P4.a(bytes, i5 + 4) * (-2048144777)) + iRotateLeft4, 13) * (-1640531535);
                iRotateLeft3 = Integer.rotateLeft((P4.a(bytes, i5 + 8) * (-2048144777)) + iRotateLeft3, 13) * (-1640531535);
                iRotateLeft2 = Integer.rotateLeft((P4.a(bytes, i5 + 12) * (-2048144777)) + iRotateLeft2, 13) * (-1640531535);
                i5 += 16;
                i11 = iRotateLeft5;
            }
            iRotateLeft = Integer.rotateLeft(iRotateLeft2, 18) + Integer.rotateLeft(iRotateLeft3, 12) + Integer.rotateLeft(iRotateLeft4, 7) + Integer.rotateLeft(i11, 1);
        } else {
            UInt.Companion companion2 = UInt.f71696b;
            iRotateLeft = 374761393;
            i5 = 0;
        }
        UInt.Companion companion3 = UInt.f71696b;
        int iRotateLeft6 = iRotateLeft + length;
        while (i5 <= length - 4) {
            iRotateLeft6 = 668265263 * Integer.rotateLeft((P4.a(bytes, i5) * (-1028477379)) + iRotateLeft6, 17);
            i5 += 4;
        }
        while (i5 < length) {
            iRotateLeft6 = Integer.rotateLeft(((bytes[i5] & 255) * 374761393) + iRotateLeft6, 11) * (-1640531535);
            i5++;
        }
        int i12 = ((iRotateLeft6 >>> 15) ^ iRotateLeft6) * (-2048144777);
        int i13 = (i12 ^ (i12 >>> 13)) * (-1028477379);
        ULong.Companion companion4 = ULong.f71699b;
        boolean z11 = UnsignedKt.b(Long.remainderUnsigned((((long) (i13 ^ (i13 >>> 16))) & 4294967295L) * 31, 1000000L)) / 1000000.0d < this.f20223a;
        this.f20224b.put(Long.valueOf(j11), Boolean.valueOf(z11));
        return z11;
    }
}
