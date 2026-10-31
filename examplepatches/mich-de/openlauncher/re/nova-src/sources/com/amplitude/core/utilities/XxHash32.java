package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0002\b\b\bÂ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J \u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0004ø\u0001\u0000¢\u0006\u0004\b\u000e\u0010\u000fJ%\u0010\u0010\u001a\u00020\u00042\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016J\"\u0010\u0017\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0019\u001a\u00020\u0004H\u0002ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0003\u001a\u00020\u0004X\u0082Tø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u0016\u0010\u0006\u001a\u00020\u0004X\u0082Tø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u0016\u0010\u0007\u001a\u00020\u0004X\u0082Tø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u0016\u0010\b\u001a\u00020\u0004X\u0082Tø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005R\u0016\u0010\t\u001a\u00020\u0004X\u0082Tø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001c"}, d2 = {"Lcom/amplitude/core/utilities/XxHash32;", b.f42142b, "()V", "PRIME32_1", "Lkotlin/UInt;", "I", "PRIME32_2", "PRIME32_3", "PRIME32_4", "PRIME32_5", "hash", "value", b.f42142b, "seed", "hash-8fN1j4Y", "(Ljava/lang/String;I)I", "readLittleEndianUInt", "bytes", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "readLittleEndianUInt-xfHcF5w", "([BI)I", "round", "acc", "input", "round-YcLip9I", "(II)I", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
final class XxHash32 {

    @NotNull
    public static final XxHash32 INSTANCE = new XxHash32();
    private static final int PRIME32_1 = -1640531535;
    private static final int PRIME32_2 = -2048144777;
    private static final int PRIME32_3 = -1028477379;
    private static final int PRIME32_4 = 668265263;
    private static final int PRIME32_5 = 374761393;

    private XxHash32() {
    }

    /* renamed from: readLittleEndianUInt-xfHcF5w, reason: not valid java name */
    private final int m132readLittleEndianUIntxfHcF5w(byte[] bytes, int index) {
        int i5 = ((bytes[index + 3] & 255) << 24) | (bytes[index] & 255) | ((bytes[index + 1] & 255) << 8) | ((bytes[index + 2] & 255) << 16);
        UInt.Companion companion = UInt.f71696b;
        return i5;
    }

    /* renamed from: round-YcLip9I, reason: not valid java name */
    private final int m133roundYcLip9I(int acc, int input) {
        int i5 = input * PRIME32_2;
        UInt.Companion companion = UInt.f71696b;
        return Integer.rotateLeft(acc + i5, 13) * PRIME32_1;
    }

    /* renamed from: hash-8fN1j4Y, reason: not valid java name */
    public final int m134hash8fN1j4Y(@NotNull String value, int seed) {
        int iRotateLeft;
        Intrinsics.g(value, "value");
        byte[] bytes = value.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        int length = bytes.length;
        int i5 = 0;
        if (length >= 16) {
            UInt.Companion companion = UInt.f71696b;
            int iM133roundYcLip9I = 606290984 + seed;
            int iM133roundYcLip9I2 = seed + PRIME32_2;
            int iM133roundYcLip9I3 = seed - PRIME32_1;
            while (i5 <= length - 16) {
                iM133roundYcLip9I = m133roundYcLip9I(iM133roundYcLip9I, m132readLittleEndianUIntxfHcF5w(bytes, i5));
                iM133roundYcLip9I2 = m133roundYcLip9I(iM133roundYcLip9I2, m132readLittleEndianUIntxfHcF5w(bytes, i5 + 4));
                seed = m133roundYcLip9I(seed, m132readLittleEndianUIntxfHcF5w(bytes, i5 + 8));
                iM133roundYcLip9I3 = m133roundYcLip9I(iM133roundYcLip9I3, m132readLittleEndianUIntxfHcF5w(bytes, i5 + 12));
                i5 += 16;
            }
            iRotateLeft = Integer.rotateLeft(iM133roundYcLip9I3, 18) + Integer.rotateLeft(seed, 12) + Integer.rotateLeft(iM133roundYcLip9I2, 7) + Integer.rotateLeft(iM133roundYcLip9I, 1);
        } else {
            iRotateLeft = seed + PRIME32_5;
            UInt.Companion companion2 = UInt.f71696b;
        }
        UInt.Companion companion3 = UInt.f71696b;
        int iRotateLeft2 = iRotateLeft + length;
        while (i5 <= length - 4) {
            iRotateLeft2 = PRIME32_4 * Integer.rotateLeft((m132readLittleEndianUIntxfHcF5w(bytes, i5) * PRIME32_3) + iRotateLeft2, 17);
            i5 += 4;
        }
        while (i5 < length) {
            iRotateLeft2 = Integer.rotateLeft(((bytes[i5] & 255) * PRIME32_5) + iRotateLeft2, 11) * PRIME32_1;
            i5++;
        }
        int i11 = ((iRotateLeft2 >>> 15) ^ iRotateLeft2) * PRIME32_2;
        int i12 = (i11 ^ (i11 >>> 13)) * PRIME32_3;
        return i12 ^ (i12 >>> 16);
    }
}
