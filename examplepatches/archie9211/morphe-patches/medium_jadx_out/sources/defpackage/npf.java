package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class npf {
    static {
        ymf ymfVarX = zmf.x();
        ymfVarX.h(-315576000000L);
        ymfVarX.i(-999999999);
        ymf ymfVarX2 = zmf.x();
        ymfVarX2.h(315576000000L);
        ymfVarX2.i(999999999);
        ymf ymfVarX3 = zmf.x();
        ymfVarX3.h(0L);
        ymfVarX3.i(0);
    }

    public static void a(zmf zmfVar) {
        long jV = zmfVar.v();
        int iW = zmfVar.w();
        if (jV >= -315576000000L && jV <= 315576000000L && iW >= -999999999 && iW < 1000000000) {
            if (jV >= 0 && iW >= 0) {
                return;
            }
            if (jV <= 0 && iW <= 0) {
                return;
            }
        }
        int length = String.valueOf(jV).length();
        StringBuilder sb = new StringBuilder(String.valueOf(iW).length() + length + NikonType2MakernoteDirectory.TAG_FLASH_USED + 89);
        wgd.y(sb, "Duration is not valid. See proto definition for valid values. Seconds (", jV, ") must be in range [-315,576,000,000, +315,576,000,000]. Nanos (");
        ay0.e(ho2.H(sb, iW, ") must be in range [-999,999,999, +999,999,999]. Nanos must have the same sign as seconds"));
    }

    public static long b(zmf zmfVar) {
        long j;
        a(zmfVar);
        long jV = zmfVar.v();
        int iNumberOfLeadingZeros = Long.numberOfLeadingZeros(-1001L) + Long.numberOfLeadingZeros(1000L) + Long.numberOfLeadingZeros(~jV) + Long.numberOfLeadingZeros(jV);
        if (iNumberOfLeadingZeros <= 65) {
            if (iNumberOfLeadingZeros >= 64) {
                long j2 = jV * 1000;
                if (jV == 0 || j2 / jV == 1000) {
                    j = j2;
                }
            }
            throw new ArithmeticException();
        }
        j = jV * 1000;
        long jW = zmfVar.w() / 1000000;
        long j3 = j + jW;
        if (((jW ^ j) < 0) || ((j ^ j3) >= 0)) {
            return j3;
        }
        throw new ArithmeticException();
    }

    public static zmf c(int i, long j) {
        if (i <= -1000000000 || i >= 1000000000) {
            long j2 = i / 1000000000;
            long j3 = j + j2;
            if (!((j2 ^ j) < 0) && !((j ^ j3) >= 0)) {
                throw new ArithmeticException();
            }
            i %= 1000000000;
            j = j3;
        }
        if (j > 0 && i < 0) {
            i += 1000000000;
            j--;
        }
        if (j < 0 && i > 0) {
            i -= 1000000000;
            j++;
        }
        ymf ymfVarX = zmf.x();
        ymfVarX.h(j);
        ymfVarX.i(i);
        zmf zmfVar = (zmf) ymfVarX.e();
        a(zmfVar);
        return zmfVar;
    }
}
