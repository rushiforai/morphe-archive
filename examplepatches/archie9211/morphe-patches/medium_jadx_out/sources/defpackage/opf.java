package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class opf {
    public static final bt a;

    static {
        cpf cpfVarX = dpf.x();
        cpfVarX.h(-62135596800L);
        cpfVarX.i(0);
        cpf cpfVarX2 = dpf.x();
        cpfVarX2.h(253402300799L);
        cpfVarX2.i(999999999);
        cpf cpfVarX3 = dpf.x();
        cpfVarX3.h(0L);
        cpfVarX3.i(0);
        a = new bt(8);
        try {
            Class.forName("j$.time.Instant").getMethod("now", null);
        } catch (Exception unused) {
        }
        try {
            Class.forName("j$.time.Instant").getMethod("getEpochSecond", null);
        } catch (Exception unused2) {
        }
        try {
            Class.forName("j$.time.Instant").getMethod("getNano", null);
        } catch (Exception unused3) {
        }
    }

    public static void a(dpf dpfVar) {
        long jV = dpfVar.v();
        boolean z = jV >= -62135596800L && jV <= 253402300799L;
        int iW = dpfVar.w();
        if (!z || iW < 0 || iW >= 1000000000) {
            int length = String.valueOf(jV).length();
            StringBuilder sb = new StringBuilder(String.valueOf(iW).length() + length + NikonType2MakernoteDirectory.TAG_FLASH_USED + 37);
            wgd.y(sb, "Timestamp is not valid. See proto definition for valid values. Seconds (", jV, ") must be in range [-62,135,596,800, +253,402,300,799]. Nanos (");
            ay0.e(ho2.H(sb, iW, ") must be in range [0, +999,999,999]."));
        }
    }

    public static dpf b(int i, long j) {
        if (j < -62135596800L || j > 253402300799L) {
            StringBuilder sb = new StringBuilder(String.valueOf(j).length() + 117);
            sb.append("Timestamp is not valid. Input seconds is too large. Seconds (");
            sb.append(j);
            sb.append(") must be in range [-62,135,596,800, +253,402,300,799]. ");
            throw new IllegalArgumentException(sb.toString());
        }
        if (i <= -1000000000 || i >= 1000000000) {
            long j2 = i / 1000000000;
            long j3 = j + j2;
            if (!((j ^ j3) >= 0) && !(((j2 ^ j) > 0 ? 1 : ((j2 ^ j) == 0 ? 0 : -1)) < 0)) {
                throw new ArithmeticException();
            }
            i %= 1000000000;
            j = j3;
        }
        if (i < 0) {
            i += 1000000000;
            long j4 = j - 1;
            if (!((1 ^ j) >= 0) && !((j ^ j4) >= 0)) {
                throw new ArithmeticException();
            }
            j = j4;
        }
        cpf cpfVarX = dpf.x();
        cpfVarX.h(j);
        cpfVarX.i(i);
        dpf dpfVar = (dpf) cpfVarX.e();
        a(dpfVar);
        return dpfVar;
    }
}
