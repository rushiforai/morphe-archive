package fp;

import aq.b0;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.nimbusds.jose.shaded.gson.JsonIOException;
import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import cp.z;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Calendar;
import java.util.Currency;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class g extends z {

    /* renamed from: b, reason: collision with root package name */
    public static final g f55504b = new g(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55505a;

    public /* synthetic */ g(int i5) {
        this.f55505a = i5;
    }

    public static cp.p d(kp.a aVar, int i5) {
        int iF = c0.F(i5);
        if (iF == 5) {
            return new cp.s(aVar.d0());
        }
        if (iF == 6) {
            return new cp.s(new ep.k(aVar.d0()));
        }
        if (iF == 7) {
            return new cp.s(Boolean.valueOf(aVar.A()));
        }
        if (iF != 8) {
            throw new IllegalStateException("Unexpected token: ".concat(fq.c.y(i5)));
        }
        aVar.V();
        return cp.q.f47781a;
    }

    public static void e(kp.b bVar, cp.p pVar) {
        if (pVar == null || (pVar instanceof cp.q)) {
            bVar.p();
            return;
        }
        boolean z11 = pVar instanceof cp.s;
        if (z11) {
            if (!z11) {
                throw new IllegalStateException("Not a JSON Primitive: " + pVar);
            }
            cp.s sVar = (cp.s) pVar;
            Serializable serializable = sVar.f47783a;
            if (serializable instanceof Number) {
                bVar.P(sVar.d());
                return;
            } else if (serializable instanceof Boolean) {
                bVar.V(serializable instanceof Boolean ? ((Boolean) serializable).booleanValue() : Boolean.parseBoolean(sVar.e()));
                return;
            } else {
                bVar.S(sVar.e());
                return;
            }
        }
        boolean z12 = pVar instanceof cp.o;
        if (z12) {
            bVar.b();
            if (!z12) {
                throw new IllegalStateException("Not a JSON Array: " + pVar);
            }
            Iterator it = ((cp.o) pVar).f47780a.iterator();
            while (it.hasNext()) {
                e(bVar, (cp.p) it.next());
            }
            bVar.e();
            return;
        }
        boolean z13 = pVar instanceof cp.r;
        if (!z13) {
            throw new IllegalArgumentException("Couldn't write " + pVar.getClass());
        }
        bVar.c();
        if (!z13) {
            throw new IllegalStateException("Not a JSON Object: " + pVar);
        }
        Iterator it2 = ((ep.m) ((cp.r) pVar).f47782a.entrySet()).iterator();
        while (((b0) it2).hasNext()) {
            ep.n nVarB = ((ep.l) it2).b();
            bVar.h((String) nVarB.getKey());
            e(bVar, (cp.p) nVarB.getValue());
        }
        bVar.f();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:112:0x01ef  */
    @Override // cp.z
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(kp.a aVar) {
        cp.p oVar;
        cp.p oVar2;
        boolean zA;
        switch (this.f55505a) {
            case 0:
                int iF0 = aVar.f0();
                int iF = c0.F(iF0);
                if (iF == 0) {
                    aVar.a();
                    oVar = new cp.o();
                } else if (iF != 2) {
                    oVar = null;
                } else {
                    aVar.b();
                    oVar = new cp.r();
                }
                if (oVar == null) {
                    return d(aVar, iF0);
                }
                ArrayDeque arrayDeque = new ArrayDeque();
                while (true) {
                    if (aVar.p()) {
                        String strP = oVar instanceof cp.r ? aVar.P() : null;
                        int iF02 = aVar.f0();
                        int iF2 = c0.F(iF02);
                        if (iF2 == 0) {
                            aVar.a();
                            oVar2 = new cp.o();
                        } else if (iF2 != 2) {
                            oVar2 = null;
                        } else {
                            aVar.b();
                            oVar2 = new cp.r();
                        }
                        boolean z11 = oVar2 != null;
                        if (oVar2 == null) {
                            oVar2 = d(aVar, iF02);
                        }
                        if (oVar instanceof cp.o) {
                            ((cp.o) oVar).f47780a.add(oVar2);
                        } else {
                            ((cp.r) oVar).f47782a.put(strP, oVar2);
                        }
                        if (z11) {
                            arrayDeque.addLast(oVar);
                            oVar = oVar2;
                        }
                    } else {
                        if (oVar instanceof cp.o) {
                            aVar.e();
                        } else {
                            aVar.f();
                        }
                        if (arrayDeque.isEmpty()) {
                            return oVar;
                        }
                        oVar = (cp.p) arrayDeque.removeLast();
                    }
                }
            case 1:
                aVar.l0();
                return null;
            case 2:
                ArrayList arrayList = new ArrayList();
                aVar.a();
                while (aVar.p()) {
                    try {
                        arrayList.add(Integer.valueOf(aVar.K()));
                    } catch (NumberFormatException e3) {
                        throw new JsonSyntaxException(e3);
                    }
                }
                aVar.e();
                int size = arrayList.size();
                AtomicIntegerArray atomicIntegerArray = new AtomicIntegerArray(size);
                for (int i5 = 0; i5 < size; i5++) {
                    atomicIntegerArray.set(i5, ((Integer) arrayList.get(i5)).intValue());
                }
                return atomicIntegerArray;
            case 3:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                try {
                    return Long.valueOf(aVar.M());
                } catch (NumberFormatException e11) {
                    throw new JsonSyntaxException(e11);
                }
            case 4:
                if (aVar.f0() != 9) {
                    return Float.valueOf((float) aVar.D());
                }
                aVar.V();
                return null;
            case 5:
                if (aVar.f0() != 9) {
                    return Double.valueOf(aVar.D());
                }
                aVar.V();
                return null;
            case 6:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD0 = aVar.d0();
                if (strD0.length() == 1) {
                    return Character.valueOf(strD0.charAt(0));
                }
                StringBuilder sbK = u4.k("Expecting character, got: ", strD0, "; at ");
                sbK.append(aVar.l(true));
                throw new JsonSyntaxException(sbK.toString());
            case 7:
                int iF03 = aVar.f0();
                if (iF03 != 9) {
                    return iF03 == 8 ? Boolean.toString(aVar.A()) : aVar.d0();
                }
                aVar.V();
                return null;
            case 8:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD02 = aVar.d0();
                try {
                    return ep.i.i(strD02);
                } catch (NumberFormatException e12) {
                    StringBuilder sbK2 = u4.k("Failed parsing '", strD02, "' as BigDecimal; at path ");
                    sbK2.append(aVar.l(true));
                    throw new JsonSyntaxException(sbK2.toString(), e12);
                }
            case 9:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD03 = aVar.d0();
                try {
                    ep.i.d(strD03);
                    return new BigInteger(strD03);
                } catch (NumberFormatException e13) {
                    StringBuilder sbK3 = u4.k("Failed parsing '", strD03, "' as BigInteger; at path ");
                    sbK3.append(aVar.l(true));
                    throw new JsonSyntaxException(sbK3.toString(), e13);
                }
            case 10:
                if (aVar.f0() != 9) {
                    return new ep.k(aVar.d0());
                }
                aVar.V();
                return null;
            case 11:
                if (aVar.f0() != 9) {
                    return new StringBuilder(aVar.d0());
                }
                aVar.V();
                return null;
            case 12:
                throw new UnsupportedOperationException("Attempted to deserialize a java.lang.Class. Forgot to register a type adapter?\nSee " + "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("java-lang-class-unsupported"));
            case 13:
                if (aVar.f0() != 9) {
                    return new StringBuffer(aVar.d0());
                }
                aVar.V();
                return null;
            case 14:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD04 = aVar.d0();
                if (strD04.equals(AbstractJsonLexerKt.NULL)) {
                    return null;
                }
                return new URL(strD04);
            case 15:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                try {
                    String strD05 = aVar.d0();
                    if (strD05.equals(AbstractJsonLexerKt.NULL)) {
                        return null;
                    }
                    return new URI(strD05);
                } catch (URISyntaxException e14) {
                    throw new JsonIOException(e14);
                }
            case 16:
                if (aVar.f0() != 9) {
                    return InetAddress.getByName(aVar.d0());
                }
                aVar.V();
                return null;
            case 17:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD06 = aVar.d0();
                try {
                    return UUID.fromString(strD06);
                } catch (IllegalArgumentException e15) {
                    StringBuilder sbK4 = u4.k("Failed parsing '", strD06, "' as UUID; at path ");
                    sbK4.append(aVar.l(true));
                    throw new JsonSyntaxException(sbK4.toString(), e15);
                }
            case 18:
                String strD07 = aVar.d0();
                try {
                    return Currency.getInstance(strD07);
                } catch (IllegalArgumentException e16) {
                    StringBuilder sbK5 = u4.k("Failed parsing '", strD07, "' as Currency; at path ");
                    sbK5.append(aVar.l(true));
                    throw new JsonSyntaxException(sbK5.toString(), e16);
                }
            case 19:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                aVar.b();
                int i11 = 0;
                int i12 = 0;
                int i13 = 0;
                int i14 = 0;
                int i15 = 0;
                int i16 = 0;
                while (true) {
                    char c11 = 4;
                    if (aVar.f0() == 4) {
                        aVar.f();
                        return new GregorianCalendar(i11, i12, i13, i14, i15, i16);
                    }
                    String strP2 = aVar.P();
                    int iK = aVar.K();
                    strP2.getClass();
                    switch (strP2.hashCode()) {
                        case -1181204563:
                            if (strP2.equals("dayOfMonth")) {
                                c11 = 0;
                                break;
                            } else {
                                c11 = 65535;
                                break;
                            }
                        case -1074026988:
                            if (strP2.equals("minute")) {
                                c11 = 1;
                                break;
                            }
                            break;
                        case -906279820:
                            if (strP2.equals("second")) {
                                c11 = 2;
                                break;
                            }
                            break;
                        case 3704893:
                            if (strP2.equals("year")) {
                                c11 = 3;
                                break;
                            }
                            break;
                        case 104080000:
                            if (!strP2.equals("month")) {
                            }
                            break;
                        case 985252545:
                            if (strP2.equals("hourOfDay")) {
                                c11 = 5;
                                break;
                            }
                            break;
                    }
                    switch (c11) {
                        case 0:
                            i13 = iK;
                            break;
                        case 1:
                            i15 = iK;
                            break;
                        case 2:
                            i16 = iK;
                            break;
                        case 3:
                            i11 = iK;
                            break;
                        case 4:
                            i12 = iK;
                            break;
                        case 5:
                            i14 = iK;
                            break;
                    }
                }
                break;
            case 20:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                StringTokenizer stringTokenizer = new StringTokenizer(aVar.d0(), "_");
                String strNextToken = stringTokenizer.hasMoreElements() ? stringTokenizer.nextToken() : null;
                String strNextToken2 = stringTokenizer.hasMoreElements() ? stringTokenizer.nextToken() : null;
                String strNextToken3 = stringTokenizer.hasMoreElements() ? stringTokenizer.nextToken() : null;
                return (strNextToken2 == null && strNextToken3 == null) ? new Locale(strNextToken) : strNextToken3 == null ? new Locale(strNextToken, strNextToken2) : new Locale(strNextToken, strNextToken2, strNextToken3);
            case 21:
                BitSet bitSet = new BitSet();
                aVar.a();
                int iF04 = aVar.f0();
                int i17 = 0;
                while (iF04 != 2) {
                    int iF3 = c0.F(iF04);
                    if (iF3 == 5 || iF3 == 6) {
                        int iK2 = aVar.K();
                        if (iK2 == 0) {
                            zA = false;
                        } else {
                            if (iK2 != 1) {
                                StringBuilder sbJ = u4.j(iK2, "Invalid bitset value ", ", expected 0 or 1; at path ");
                                sbJ.append(aVar.l(true));
                                throw new JsonSyntaxException(sbJ.toString());
                            }
                            zA = true;
                        }
                    } else {
                        if (iF3 != 7) {
                            throw new JsonSyntaxException("Invalid bitset value type: " + fq.c.y(iF04) + "; at path " + aVar.l(false));
                        }
                        zA = aVar.A();
                    }
                    if (zA) {
                        bitSet.set(i17);
                    }
                    i17++;
                    iF04 = aVar.f0();
                }
                aVar.e();
                return bitSet;
            case 22:
                int iF05 = aVar.f0();
                if (iF05 != 9) {
                    return iF05 == 6 ? Boolean.valueOf(Boolean.parseBoolean(aVar.d0())) : Boolean.valueOf(aVar.A());
                }
                aVar.V();
                return null;
            case 23:
                if (aVar.f0() != 9) {
                    return Boolean.valueOf(aVar.d0());
                }
                aVar.V();
                return null;
            case 24:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                try {
                    int iK3 = aVar.K();
                    if (iK3 <= 255 && iK3 >= -128) {
                        return Byte.valueOf((byte) iK3);
                    }
                    StringBuilder sbJ2 = u4.j(iK3, "Lossy conversion from ", " to byte; at path ");
                    sbJ2.append(aVar.l(true));
                    throw new JsonSyntaxException(sbJ2.toString());
                } catch (NumberFormatException e17) {
                    throw new JsonSyntaxException(e17);
                }
            case 25:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                try {
                    int iK4 = aVar.K();
                    if (iK4 <= 65535 && iK4 >= -32768) {
                        return Short.valueOf((short) iK4);
                    }
                    StringBuilder sbJ3 = u4.j(iK4, "Lossy conversion from ", " to short; at path ");
                    sbJ3.append(aVar.l(true));
                    throw new JsonSyntaxException(sbJ3.toString());
                } catch (NumberFormatException e18) {
                    throw new JsonSyntaxException(e18);
                }
            case 26:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                try {
                    return Integer.valueOf(aVar.K());
                } catch (NumberFormatException e19) {
                    throw new JsonSyntaxException(e19);
                }
            case 27:
                try {
                    return new AtomicInteger(aVar.K());
                } catch (NumberFormatException e21) {
                    throw new JsonSyntaxException(e21);
                }
            default:
                return new AtomicBoolean(aVar.A());
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        switch (this.f55505a) {
            case 0:
                e(bVar, (cp.p) obj);
                return;
            case 1:
                bVar.p();
                return;
            case 2:
                bVar.b();
                int length = ((AtomicIntegerArray) obj).length();
                for (int i5 = 0; i5 < length; i5++) {
                    bVar.M(r6.get(i5));
                }
                bVar.e();
                return;
            case 3:
                Number number = (Number) obj;
                if (number == null) {
                    bVar.p();
                    return;
                } else {
                    bVar.M(number.longValue());
                    return;
                }
            case 4:
                Number numberValueOf = (Number) obj;
                if (numberValueOf == null) {
                    bVar.p();
                    return;
                }
                if (!(numberValueOf instanceof Float)) {
                    numberValueOf = Float.valueOf(numberValueOf.floatValue());
                }
                bVar.P(numberValueOf);
                return;
            case 5:
                Number number2 = (Number) obj;
                if (number2 == null) {
                    bVar.p();
                    return;
                } else {
                    bVar.K(number2.doubleValue());
                    return;
                }
            case 6:
                Character ch = (Character) obj;
                bVar.S(ch == null ? null : String.valueOf(ch));
                return;
            case 7:
                bVar.S((String) obj);
                return;
            case 8:
                bVar.P((BigDecimal) obj);
                return;
            case 9:
                bVar.P((BigInteger) obj);
                return;
            case 10:
                bVar.P((ep.k) obj);
                return;
            case 11:
                StringBuilder sb2 = (StringBuilder) obj;
                bVar.S(sb2 == null ? null : sb2.toString());
                return;
            case 12:
                throw new UnsupportedOperationException("Attempted to serialize java.lang.Class: " + ((Class) obj).getName() + ". Forgot to register a type adapter?\nSee " + "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("java-lang-class-unsupported"));
            case 13:
                StringBuffer stringBuffer = (StringBuffer) obj;
                bVar.S(stringBuffer == null ? null : stringBuffer.toString());
                return;
            case 14:
                URL url = (URL) obj;
                bVar.S(url == null ? null : url.toExternalForm());
                return;
            case 15:
                URI uri = (URI) obj;
                bVar.S(uri == null ? null : uri.toASCIIString());
                return;
            case 16:
                InetAddress inetAddress = (InetAddress) obj;
                bVar.S(inetAddress == null ? null : inetAddress.getHostAddress());
                return;
            case 17:
                UUID uuid = (UUID) obj;
                bVar.S(uuid == null ? null : uuid.toString());
                return;
            case 18:
                bVar.S(((Currency) obj).getCurrencyCode());
                return;
            case 19:
                if (((Calendar) obj) == null) {
                    bVar.p();
                    return;
                }
                bVar.c();
                bVar.h("year");
                bVar.M(r6.get(1));
                bVar.h("month");
                bVar.M(r6.get(2));
                bVar.h("dayOfMonth");
                bVar.M(r6.get(5));
                bVar.h("hourOfDay");
                bVar.M(r6.get(11));
                bVar.h("minute");
                bVar.M(r6.get(12));
                bVar.h("second");
                bVar.M(r6.get(13));
                bVar.f();
                return;
            case 20:
                Locale locale = (Locale) obj;
                bVar.S(locale == null ? null : locale.toString());
                return;
            case 21:
                BitSet bitSet = (BitSet) obj;
                bVar.b();
                int length2 = bitSet.length();
                for (int i11 = 0; i11 < length2; i11++) {
                    bVar.M(bitSet.get(i11) ? 1L : 0L);
                }
                bVar.e();
                return;
            case 22:
                Boolean bool = (Boolean) obj;
                if (bool == null) {
                    bVar.p();
                    return;
                }
                bVar.c0();
                bVar.a();
                bVar.f72101a.write(bool.booleanValue() ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
                return;
            case 23:
                Boolean bool2 = (Boolean) obj;
                bVar.S(bool2 == null ? AbstractJsonLexerKt.NULL : bool2.toString());
                return;
            case 24:
                if (((Number) obj) == null) {
                    bVar.p();
                    return;
                } else {
                    bVar.M(r6.byteValue());
                    return;
                }
            case 25:
                if (((Number) obj) == null) {
                    bVar.p();
                    return;
                } else {
                    bVar.M(r6.shortValue());
                    return;
                }
            case 26:
                if (((Number) obj) == null) {
                    bVar.p();
                    return;
                } else {
                    bVar.M(r6.intValue());
                    return;
                }
            case 27:
                bVar.M(((AtomicInteger) obj).get());
                return;
            default:
                bVar.V(((AtomicBoolean) obj).get());
                return;
        }
    }

    public String toString() {
        switch (this.f55505a) {
            case 1:
                return "AnonymousOrNonStaticLocalClassAdapter";
            default:
                return super.toString();
        }
    }
}
