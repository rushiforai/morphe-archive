package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Formattable;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class xg {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33226a;

    /* renamed from: b, reason: collision with root package name */
    public int f33227b;

    /* renamed from: c, reason: collision with root package name */
    public int f33228c;

    /* renamed from: d, reason: collision with root package name */
    public int f33229d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f33230e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f33231f;

    /* renamed from: g, reason: collision with root package name */
    public Object f33232g;

    public xg(g gVar, Object[] objArr, StringBuilder sb2) {
        this.f33226a = 1;
        this.f33227b = 0;
        this.f33228c = -1;
        fb.b(gVar, "context");
        this.f33230e = gVar;
        this.f33229d = 0;
        this.f33231f = objArr;
        this.f33232g = sb2;
    }

    public static void f(StringBuilder sb2, Object obj, String str) {
        sb2.append("[INVALID: format=");
        sb2.append(str);
        sb2.append(", type=");
        sb2.append(obj.getClass().getCanonicalName());
        sb2.append(", value=");
        sb2.append(gi.a(obj));
        sb2.append("]");
    }

    public void a() {
        if (this.f33228c == 0) {
            return;
        }
        HashMap map = ((vg) this.f33232g).f33161d;
        int[] iArr = (int[]) this.f33230e;
        vg vgVar = (vg) map.get(Integer.valueOf(iArr[this.f33227b]));
        while (true) {
            int i5 = (vgVar.f33159b - vgVar.f33158a) + 1;
            int i11 = this.f33228c;
            if (i5 > i11) {
                return;
            }
            int i12 = this.f33227b + i5;
            this.f33227b = i12;
            this.f33232g = vgVar;
            int i13 = i11 - i5;
            this.f33228c = i13;
            if (i13 > 0) {
                vgVar = (vg) vgVar.f33161d.get(Integer.valueOf(iArr[i12]));
            }
        }
    }

    public void b() {
        vg vgVar = ((vg) this.f33232g).f33160c;
        if (vgVar != null) {
            this.f33232g = vgVar;
        } else {
            this.f33232g = (vg) this.f33231f;
            int i5 = this.f33228c;
            if (i5 > 0) {
                this.f33228c = i5 - 1;
            }
            if (this.f33229d > 0) {
                this.f33227b++;
            }
        }
        a();
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0092  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void c(Object obj, di diVar, ei eiVar) throws IOException {
        String simpleName;
        boolean zIsValidCodePoint;
        StringBuilder sb2 = (StringBuilder) this.f33232g;
        int i5 = diVar.f32483b;
        String string = diVar.f32485d;
        int iF = b.c0.F(i5);
        if (iF != 0) {
            if (iF == 1) {
                zIsValidCodePoint = obj instanceof Boolean;
            } else if (iF != 2) {
                if (iF != 3) {
                    if (iF != 4) {
                        throw null;
                    }
                    zIsValidCodePoint = (obj instanceof Double) || (obj instanceof Float) || (obj instanceof BigDecimal);
                } else if ((obj instanceof Integer) || (obj instanceof Long) || (obj instanceof Byte) || (obj instanceof Short) || (obj instanceof BigInteger)) {
                }
            } else if (!(obj instanceof Character)) {
                if ((obj instanceof Integer) || (obj instanceof Byte) || (obj instanceof Short)) {
                    zIsValidCodePoint = Character.isValidCodePoint(((Number) obj).intValue());
                }
            }
            if (!zIsValidCodePoint) {
                f(sb2, obj, string);
                return;
            }
        }
        int iOrdinal = diVar.ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                if (eiVar.a()) {
                    sb2.append(obj);
                    return;
                }
            } else if (iOrdinal != 2) {
                if (iOrdinal != 3) {
                    if (iOrdinal == 5) {
                        if (!eiVar.a()) {
                            int i11 = eiVar.f32516a;
                            int i12 = i11 & 128;
                            ei eiVar2 = i12 != 0 ? (i12 == i11 && eiVar.f32517b == -1 && eiVar.f32518c == -1) ? eiVar : new ei(i12, -1, -1) : ei.f32515e;
                            if (eiVar2.equals(eiVar)) {
                                Number number = (Number) obj;
                                Locale locale = gi.f32581a;
                                boolean zC = eiVar.c();
                                long jLongValue = number.longValue();
                                if (number instanceof Long) {
                                    gi.b(sb2, jLongValue, zC);
                                    return;
                                }
                                if (number instanceof Integer) {
                                    gi.b(sb2, jLongValue & 4294967295L, zC);
                                    return;
                                }
                                if (number instanceof Byte) {
                                    gi.b(sb2, jLongValue & 255, zC);
                                    return;
                                }
                                if (number instanceof Short) {
                                    gi.b(sb2, jLongValue & 65535, zC);
                                    return;
                                } else {
                                    if (!(number instanceof BigInteger)) {
                                        throw new IllegalStateException("unsupported number type: ".concat(String.valueOf(number.getClass())));
                                    }
                                    String string2 = ((BigInteger) number).toString(16);
                                    if (zC) {
                                        string2 = string2.toUpperCase(gi.f32581a);
                                    }
                                    sb2.append(string2);
                                    return;
                                }
                            }
                        }
                    }
                }
            } else if (eiVar.a()) {
                if (obj instanceof Character) {
                    sb2.append(obj);
                    return;
                }
                int iIntValue = ((Number) obj).intValue();
                if ((iIntValue >>> 16) == 0) {
                    sb2.append((char) iIntValue);
                    return;
                } else {
                    sb2.append(Character.toChars(iIntValue));
                    return;
                }
            }
        } else {
            if (obj instanceof Formattable) {
                Formattable formattable = (Formattable) obj;
                Locale locale2 = gi.f32581a;
                int i13 = eiVar.f32516a;
                int i14 = i13 & 162;
                if (i14 != 0) {
                    i14 = ((i13 & 32) == 0 ? 0 : 1) | ((i13 & 128) != 0 ? 2 : 0) | ((i13 & 2) == 0 ? 0 : 4);
                }
                int length = sb2.length();
                Formatter formatter = new Formatter(sb2, gi.f32581a);
                try {
                    formattable.formatTo(formatter, i14, eiVar.f32517b, eiVar.f32518c);
                    return;
                } catch (RuntimeException e3) {
                    sb2.setLength(length);
                    try {
                        Appendable appendableOut = formatter.out();
                        try {
                            simpleName = e3.toString();
                        } catch (RuntimeException e11) {
                            simpleName = e11.getClass().getSimpleName();
                        }
                        appendableOut.append(gi.c(formattable, simpleName));
                        return;
                    } catch (IOException unused) {
                        return;
                    }
                }
            }
            if (eiVar.a()) {
                sb2.append(gi.a(obj));
                return;
            }
        }
        if (!eiVar.a()) {
            int i15 = diVar.f32482a;
            if (eiVar.c()) {
                i15 &= 65503;
            }
            StringBuilder sb3 = new StringBuilder("%");
            eiVar.d(sb3);
            sb3.append((char) i15);
            string = sb3.toString();
        }
        sb2.append(String.format(gi.f32581a, string, obj));
    }

    public void d(vg vgVar, StringBuilder sb2) {
        for (vg vgVar2 : vgVar.f33161d.values()) {
            sb2.append("  ");
            sb2.append(vgVar);
            sb2.append(" -> ");
            sb2.append(vgVar2);
            sb2.append(" [label=\"");
            int[] iArr = (int[]) this.f33230e;
            sb2.append(Arrays.toString(Arrays.copyOfRange(iArr, vgVar2.f33158a, Math.min(iArr.length, vgVar2.f33159b + 1))));
            sb2.append("\"]\n");
            d(vgVar2, sb2);
        }
    }

    public boolean e(int i5, int i11, int i12, int i13) {
        if (i5 >= 0 && i12 >= 0) {
            int[] iArr = (int[]) this.f33230e;
            int length = iArr.length;
            int iMin = Math.min(length, i11);
            if (iMin - i5 == Math.min(length, i13) - i12) {
                for (int i14 = i5; i14 <= iMin; i14++) {
                    if (iArr[i14] != iArr[(i12 + i14) - i5]) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public String toString() {
        switch (this.f33226a) {
            case 0:
                StringBuilder sb2 = new StringBuilder("digraph {\n");
                d((vg) this.f33231f, sb2);
                sb2.append("}");
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    public xg(int[] iArr) {
        this.f33226a = 0;
        this.f33230e = iArr;
        vg vgVar = new vg(-1, -1);
        this.f33231f = vgVar;
        this.f33232g = vgVar;
    }
}
