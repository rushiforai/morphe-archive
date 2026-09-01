package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.squareup.moshi.JsonDataException;
import com.squareup.moshi.JsonEncodingException;
import java.io.EOFException;
import java.math.BigDecimal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hnc extends jb6 {
    public final /* synthetic */ int a;

    public /* synthetic */ hnc(int i) {
        this.a = i;
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) throws EOFException, JsonEncodingException {
        long j;
        switch (this.a) {
            case 0:
                return hd6Var.q();
            case 1:
                return Boolean.valueOf(hd6Var.nextBoolean());
            case 2:
                return Byte.valueOf((byte) vc2.M(hd6Var, "a byte", -128, 255));
            case 3:
                String strQ = hd6Var.q();
                if (strQ.length() <= 1) {
                    return Character.valueOf(strQ.charAt(0));
                }
                throw new JsonDataException(lv8.r("Expected a char but was ", wgd.t('\"', "\"", strQ), " at path ", hd6Var.D()));
            case 4:
                return Double.valueOf(hd6Var.nextDouble());
            case 5:
                float fNextDouble = (float) hd6Var.nextDouble();
                if (!Float.isInfinite(fNextDouble)) {
                    return Float.valueOf(fNextDouble);
                }
                throw new JsonDataException("JSON forbids NaN and infinities: " + fNextDouble + " at path " + hd6Var.D());
            case 6:
                return Integer.valueOf(hd6Var.nextInt());
            case 7:
                sd6 sd6Var = (sd6) hd6Var;
                int iU = sd6Var.g;
                if (iU == 0) {
                    iU = sd6Var.U();
                }
                if (iU == 16) {
                    sd6Var.g = 0;
                    int[] iArr = sd6Var.d;
                    int i = sd6Var.a - 1;
                    iArr[i] = iArr[i] + 1;
                    j = sd6Var.h;
                } else {
                    if (iU == 17) {
                        kz0 kz0Var = sd6Var.f;
                        long j2 = sd6Var.i;
                        kz0Var.getClass();
                        sd6Var.j = kz0Var.F0(j2, wk1.a);
                    } else if (iU == 9 || iU == 8) {
                        String strZ0 = iU == 9 ? sd6Var.z0(sd6.l) : sd6Var.z0(sd6.k);
                        sd6Var.j = strZ0;
                        try {
                            long j3 = Long.parseLong(strZ0);
                            sd6Var.g = 0;
                            int[] iArr2 = sd6Var.d;
                            int i2 = sd6Var.a - 1;
                            iArr2[i2] = iArr2[i2] + 1;
                            j = j3;
                        } catch (NumberFormatException unused) {
                            sd6Var.g = 11;
                            long jLongValueExact = new BigDecimal(sd6Var.j).longValueExact();
                            sd6Var.j = null;
                            sd6Var.g = 0;
                            int[] iArr3 = sd6Var.d;
                            int i3 = sd6Var.a - 1;
                            iArr3[i3] = iArr3[i3] + 1;
                            j = jLongValueExact;
                        }
                    } else if (iU != 11) {
                        StringBuilder sb = new StringBuilder("Expected a long but was ");
                        sb.append(sd6Var.I());
                        rd6.q(sb, sd6Var.D());
                        return null;
                    }
                    sd6Var.g = 11;
                    try {
                        long jLongValueExact2 = new BigDecimal(sd6Var.j).longValueExact();
                        sd6Var.j = null;
                        sd6Var.g = 0;
                        int[] iArr32 = sd6Var.d;
                        int i32 = sd6Var.a - 1;
                        iArr32[i32] = iArr32[i32] + 1;
                        j = jLongValueExact2;
                    } catch (ArithmeticException | NumberFormatException unused2) {
                        rd6.i("Expected a long but was ", sd6Var.j, " at path ", sd6Var.D());
                        return null;
                    }
                }
                return Long.valueOf(j);
            default:
                return Short.valueOf((short) vc2.M(hd6Var, "a short", -32768, 32767));
        }
    }

    @Override // defpackage.jb6
    public final void e(zd6 zd6Var, Object obj) {
        switch (this.a) {
            case 0:
                zd6Var.Q((String) obj);
                break;
            case 1:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                ud6 ud6Var = (ud6) zd6Var;
                if (!ud6Var.e) {
                    ud6Var.j0();
                    ud6Var.R();
                    ud6Var.g.R0(zBooleanValue ? "true" : "false");
                    int[] iArr = ud6Var.d;
                    int i = ud6Var.a - 1;
                    iArr[i] = iArr[i] + 1;
                } else {
                    ygf.f("Boolean cannot be used as a map key in JSON at path ".concat(ud6Var.B()));
                }
                break;
            case 2:
                zd6Var.N(((Byte) obj).intValue() & 255);
                break;
            case 3:
                zd6Var.Q(((Character) obj).toString());
                break;
            case 4:
                double dDoubleValue = ((Double) obj).doubleValue();
                ud6 ud6Var2 = (ud6) zd6Var;
                ud6Var2.getClass();
                if (Double.isNaN(dDoubleValue) || Double.isInfinite(dDoubleValue)) {
                    rd6.c(dDoubleValue, "Numeric values must be finite, but was ");
                } else if (!ud6Var2.e) {
                    ud6Var2.j0();
                    ud6Var2.R();
                    ud6Var2.g.R0(Double.toString(dDoubleValue));
                    int[] iArr2 = ud6Var2.d;
                    int i2 = ud6Var2.a - 1;
                    iArr2[i2] = iArr2[i2] + 1;
                } else {
                    ud6Var2.e = false;
                    ud6Var2.D(Double.toString(dDoubleValue));
                }
                break;
            case 5:
                Float f = (Float) obj;
                f.getClass();
                ud6 ud6Var3 = (ud6) zd6Var;
                ud6Var3.getClass();
                String string = f.toString();
                if (string.equals("-Infinity") || string.equals("Infinity") || string.equals("NaN")) {
                    ik4.h("Numeric values must be finite, but was ", f);
                } else if (!ud6Var3.e) {
                    ud6Var3.j0();
                    ud6Var3.R();
                    ud6Var3.g.R0(string);
                    int[] iArr3 = ud6Var3.d;
                    int i3 = ud6Var3.a - 1;
                    iArr3[i3] = iArr3[i3] + 1;
                } else {
                    ud6Var3.e = false;
                    ud6Var3.D(string);
                }
                break;
            case 6:
                zd6Var.N(((Integer) obj).intValue());
                break;
            case 7:
                zd6Var.N(((Long) obj).longValue());
                break;
            default:
                zd6Var.N(((Short) obj).intValue());
                break;
        }
    }

    public final String toString() {
        switch (this.a) {
            case 0:
                return "JsonAdapter(String)";
            case 1:
                return "JsonAdapter(Boolean)";
            case 2:
                return "JsonAdapter(Byte)";
            case 3:
                return "JsonAdapter(Character)";
            case 4:
                return ZVsviyDAr.vKPgLgQrqGV;
            case 5:
                return "JsonAdapter(Float)";
            case 6:
                return "JsonAdapter(Integer)";
            case 7:
                return "JsonAdapter(Long)";
            default:
                return "JsonAdapter(Short)";
        }
    }
}
