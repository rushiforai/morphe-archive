package db0;

import java.nio.charset.StandardCharsets;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class e0 {
    /* JADX WARN: Failed to find 'out' block for switch in B:12:0x0083. Please report as an issue. */
    public static long a(String str) {
        long j11;
        long j12;
        long j13;
        long j14;
        char c11;
        if (str == null || str.length() == 0) {
            return 0L;
        }
        byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
        Intrinsics.f(bytes, "getBytes(...)");
        int length = bytes.length;
        long jRotateLeft = 0 & 4294967295L;
        int i5 = length & (-16);
        long jRotateLeft2 = jRotateLeft;
        for (int i11 = 0; i11 < i5; i11 += 16) {
            long jX = vh.a.x(bytes, i11);
            long jX2 = vh.a.x(bytes, i11 + 8);
            jRotateLeft = ((Long.rotateLeft(jRotateLeft ^ (Long.rotateLeft(jX * (-8663945395140668459L), 31) * 5545529020109919103L), 27) + jRotateLeft2) * 5) + 1390208809;
            jRotateLeft2 = 944331445 + ((Long.rotateLeft((Long.rotateLeft(jX2 * 5545529020109919103L, 33) * (-8663945395140668459L)) ^ jRotateLeft2, 31) + jRotateLeft) * 5);
        }
        long j15 = 0;
        switch (length & 15) {
            case 1:
                j11 = jRotateLeft;
                j12 = 0;
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 2:
                j11 = jRotateLeft;
                j13 = 0;
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 3:
                j11 = jRotateLeft;
                j14 = 0;
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 4:
                j11 = jRotateLeft;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 5:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 6:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 7:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 8:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 9:
                j11 = jRotateLeft;
                c11 = ' ';
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 10:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 9] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 11:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 10] & 255) << 16;
                j15 |= (bytes[i5 + 9] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 12:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 11] & 255) << 24;
                j15 |= (bytes[i5 + 10] & 255) << 16;
                j15 |= (bytes[i5 + 9] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 13:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 12] & 255) << c11;
                j15 |= (bytes[i5 + 11] & 255) << 24;
                j15 |= (bytes[i5 + 10] & 255) << 16;
                j15 |= (bytes[i5 + 9] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 14:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 |= (bytes[i5 + 13] & 255) << 40;
                j15 |= (bytes[i5 + 12] & 255) << c11;
                j15 |= (bytes[i5 + 11] & 255) << 24;
                j15 |= (bytes[i5 + 10] & 255) << 16;
                j15 |= (bytes[i5 + 9] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
            case 15:
                j11 = jRotateLeft;
                c11 = ' ';
                j15 = (bytes[i5 + 14] & 255) << 48;
                j15 |= (bytes[i5 + 13] & 255) << 40;
                j15 |= (bytes[i5 + 12] & 255) << c11;
                j15 |= (bytes[i5 + 11] & 255) << 24;
                j15 |= (bytes[i5 + 10] & 255) << 16;
                j15 |= (bytes[i5 + 9] & 255) << 8;
                jRotateLeft2 ^= Long.rotateLeft((j15 | (bytes[i5 + 8] & 255)) * 5545529020109919103L, 33) * (-8663945395140668459L);
                j15 = bytes[i5 + 7] << 56;
                j15 |= (bytes[i5 + 6] & 255) << 48;
                j15 |= (bytes[i5 + 5] & 255) << 40;
                j15 |= (bytes[i5 + 4] & 255) << c11;
                j14 = j15 | ((bytes[i5 + 3] & 255) << 24);
                j13 = j14 | ((bytes[i5 + 2] & 255) << 16);
                j12 = j13 | ((bytes[i5 + 1] & 255) << 8);
                jRotateLeft = j11 ^ (Long.rotateLeft((j12 | (bytes[i5] & 255)) * (-8663945395140668459L), 31) * 5545529020109919103L);
                break;
        }
        long j16 = length;
        long j17 = jRotateLeft ^ j16;
        long j18 = j16 ^ jRotateLeft2;
        long j19 = j17 + j18;
        long j21 = j18 + j19;
        long j22 = (j19 ^ (j19 >>> 33)) * (-49064778989728563L);
        long j23 = (j22 ^ (j22 >>> 33)) * (-4265267296055464877L);
        long j24 = (j21 ^ (j21 >>> 33)) * (-49064778989728563L);
        long j25 = (j24 ^ (j24 >>> 33)) * (-4265267296055464877L);
        return (j25 ^ (j25 >>> 33)) + (j23 ^ (j23 >>> 33));
    }

    @NotNull
    public final KSerializer<f0> serializer() {
        return d0.f49139a;
    }
}
