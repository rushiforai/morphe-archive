package aq;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.squareup.moshi.JsonDataException;
import com.squareup.moshi.JsonEncodingException;
import h6.c1;
import java.io.EOFException;
import java.math.BigDecimal;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class j0 extends r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15480a;

    public /* synthetic */ j0(int i5) {
        this.f15480a = i5;
    }

    @Override // aq.r
    public final Object a(u uVar) throws NumberFormatException, EOFException, JsonEncodingException {
        long jLongValueExact;
        switch (this.f15480a) {
            case 0:
                return uVar.s();
            case 1:
                v vVar = (v) uVar;
                int iV = vVar.f15521g;
                if (iV == 0) {
                    iV = vVar.V();
                }
                boolean z11 = false;
                if (iV == 5) {
                    vVar.f15521g = 0;
                    int[] iArr = vVar.f15515d;
                    int i5 = vVar.f15512a - 1;
                    iArr[i5] = iArr[i5] + 1;
                    z11 = true;
                } else {
                    if (iV != 6) {
                        throw new JsonDataException("Expected a boolean but was " + a80.m.y(vVar.w()) + " at path " + vVar.e());
                    }
                    vVar.f15521g = 0;
                    int[] iArr2 = vVar.f15515d;
                    int i11 = vVar.f15512a - 1;
                    iArr2[i11] = iArr2[i11] + 1;
                }
                return Boolean.valueOf(z11);
            case 2:
                return Byte.valueOf((byte) m0.g(uVar, "a byte", -128, 255));
            case 3:
                String strS = uVar.s();
                if (strS.length() <= 1) {
                    return Character.valueOf(strS.charAt(0));
                }
                throw new JsonDataException(b.c0.m("Expected a char but was ", c1.m(AbstractJsonLexerKt.STRING, "\"", strS), " at path ", uVar.e()));
            case 4:
                return Double.valueOf(uVar.h());
            case 5:
                float fH = (float) uVar.h();
                if (!Float.isInfinite(fH)) {
                    return Float.valueOf(fH);
                }
                throw new JsonDataException("JSON forbids NaN and infinities: " + fH + " at path " + uVar.e());
            case 6:
                return Integer.valueOf(uVar.l());
            case 7:
                v vVar2 = (v) uVar;
                int iV2 = vVar2.f15521g;
                if (iV2 == 0) {
                    iV2 = vVar2.V();
                }
                if (iV2 == 16) {
                    vVar2.f15521g = 0;
                    int[] iArr3 = vVar2.f15515d;
                    int i12 = vVar2.f15512a - 1;
                    iArr3[i12] = iArr3[i12] + 1;
                    jLongValueExact = vVar2.f15522h;
                } else {
                    if (iV2 == 17) {
                        m90.g gVar = vVar2.f15520f;
                        long j11 = vVar2.f15523i;
                        gVar.getClass();
                        vVar2.f15524j = gVar.M(j11, Charsets.f72000b);
                    } else if (iV2 == 9 || iV2 == 8) {
                        String strH0 = iV2 == 9 ? vVar2.h0(v.f15517l) : vVar2.h0(v.f15516k);
                        vVar2.f15524j = strH0;
                        try {
                            jLongValueExact = Long.parseLong(strH0);
                            vVar2.f15521g = 0;
                            int[] iArr4 = vVar2.f15515d;
                            int i13 = vVar2.f15512a - 1;
                            iArr4[i13] = iArr4[i13] + 1;
                        } catch (NumberFormatException unused) {
                        }
                    } else if (iV2 != 11) {
                        throw new JsonDataException("Expected a long but was " + a80.m.y(vVar2.w()) + " at path " + vVar2.e());
                    }
                    vVar2.f15521g = 11;
                    try {
                        jLongValueExact = new BigDecimal(vVar2.f15524j).longValueExact();
                        vVar2.f15524j = null;
                        vVar2.f15521g = 0;
                        int[] iArr5 = vVar2.f15515d;
                        int i14 = vVar2.f15512a - 1;
                        iArr5[i14] = iArr5[i14] + 1;
                    } catch (ArithmeticException | NumberFormatException unused2) {
                        throw new JsonDataException("Expected a long but was " + vVar2.f15524j + " at path " + vVar2.e());
                    }
                }
                return Long.valueOf(jLongValueExact);
            default:
                return Short.valueOf((short) m0.g(uVar, "a short", -32768, 32767));
        }
    }

    @Override // aq.r
    public final void e(x xVar, Object obj) {
        switch (this.f15480a) {
            case 0:
                xVar.l((String) obj);
                return;
            case 1:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                w wVar = (w) xVar;
                if (wVar.f15534f) {
                    throw new IllegalStateException("Boolean cannot be used as a map key in JSON at path " + wVar.c());
                }
                wVar.M();
                wVar.p();
                wVar.f15526h.m0(zBooleanValue ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
                int[] iArr = wVar.f15532d;
                int i5 = wVar.f15529a - 1;
                iArr[i5] = iArr[i5] + 1;
                return;
            case 2:
                xVar.h(((Byte) obj).intValue() & 255);
                return;
            case 3:
                xVar.l(((Character) obj).toString());
                return;
            case 4:
                double dDoubleValue = ((Double) obj).doubleValue();
                w wVar2 = (w) xVar;
                wVar2.getClass();
                if (Double.isNaN(dDoubleValue) || Double.isInfinite(dDoubleValue)) {
                    throw new IllegalArgumentException("Numeric values must be finite, but was " + dDoubleValue);
                }
                if (wVar2.f15534f) {
                    wVar2.f15534f = false;
                    wVar2.d(Double.toString(dDoubleValue));
                    return;
                }
                wVar2.M();
                wVar2.p();
                wVar2.f15526h.m0(Double.toString(dDoubleValue));
                int[] iArr2 = wVar2.f15532d;
                int i11 = wVar2.f15529a - 1;
                iArr2[i11] = iArr2[i11] + 1;
                return;
            case 5:
                Float f11 = (Float) obj;
                f11.getClass();
                w wVar3 = (w) xVar;
                wVar3.getClass();
                String string = f11.toString();
                if (string.equals("-Infinity") || string.equals("Infinity") || string.equals("NaN")) {
                    throw new IllegalArgumentException("Numeric values must be finite, but was " + f11);
                }
                if (wVar3.f15534f) {
                    wVar3.f15534f = false;
                    wVar3.d(string);
                    return;
                }
                wVar3.M();
                wVar3.p();
                wVar3.f15526h.m0(string);
                int[] iArr3 = wVar3.f15532d;
                int i12 = wVar3.f15529a - 1;
                iArr3[i12] = iArr3[i12] + 1;
                return;
            case 6:
                xVar.h(((Integer) obj).intValue());
                return;
            case 7:
                xVar.h(((Long) obj).longValue());
                return;
            default:
                xVar.h(((Short) obj).intValue());
                return;
        }
    }

    public final String toString() {
        switch (this.f15480a) {
            case 0:
                return "JsonAdapter(String)";
            case 1:
                return "JsonAdapter(Boolean)";
            case 2:
                return "JsonAdapter(Byte)";
            case 3:
                return "JsonAdapter(Character)";
            case 4:
                return "JsonAdapter(Double)";
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
