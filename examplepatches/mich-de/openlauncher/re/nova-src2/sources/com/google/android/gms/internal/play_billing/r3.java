package com.google.android.gms.internal.play_billing;

import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class r3 implements x3 {

    /* renamed from: j, reason: collision with root package name */
    public static final int[] f33503j = new int[0];

    /* renamed from: k, reason: collision with root package name */
    public static final Unsafe f33504k = j4.i();

    /* renamed from: a, reason: collision with root package name */
    public final int[] f33505a;

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f33506b;

    /* renamed from: c, reason: collision with root package name */
    public final int f33507c;

    /* renamed from: d, reason: collision with root package name */
    public final int f33508d;

    /* renamed from: e, reason: collision with root package name */
    public final g2 f33509e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f33510f;

    /* renamed from: g, reason: collision with root package name */
    public final int f33511g;

    /* renamed from: h, reason: collision with root package name */
    public final int f33512h;

    /* renamed from: i, reason: collision with root package name */
    public final u2 f33513i;

    public r3(int[] iArr, Object[] objArr, int i5, int i11, g2 g2Var, int[] iArr2, int i12, int i13, u2 u2Var, u2 u2Var2) {
        this.f33505a = iArr;
        this.f33506b = objArr;
        this.f33507c = i5;
        this.f33508d = i11;
        this.f33510f = iArr2;
        this.f33511g = i12;
        this.f33512h = i13;
        this.f33513i = u2Var;
        this.f33509e = g2Var;
    }

    public static Field D(Class cls, String str) {
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException e3) {
            Field[] declaredFields = cls.getDeclaredFields();
            for (Field field : declaredFields) {
                if (str.equals(field.getName())) {
                    return field;
                }
            }
            String name = cls.getName();
            String string = Arrays.toString(declaredFields);
            StringBuilder sbW = b.c0.w("Field ", str, " for ", name, " not found. Known fields are ");
            sbW.append(string);
            throw new RuntimeException(sbW.toString(), e3);
        }
    }

    public static boolean p(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof x2) {
            return ((x2) obj).h();
        }
        return true;
    }

    public static final int r(byte[] bArr, int i5, int i11, o4 o4Var, Class cls, com.google.android.gms.internal.measurement.q0 q0Var) throws zzgc {
        o4 o4Var2 = o4.f33469c;
        switch (o4Var.ordinal()) {
            case 0:
                int i12 = i5 + 8;
                q0Var.f32979c = Double.valueOf(Double.longBitsToDouble(cl.l0.i0(i5, bArr)));
                return i12;
            case 1:
                int i13 = i5 + 4;
                q0Var.f32979c = Float.valueOf(Float.intBitsToFloat(cl.l0.U(i5, bArr)));
                return i13;
            case 2:
            case 3:
                int iE0 = cl.l0.e0(bArr, i5, q0Var);
                q0Var.f32979c = Long.valueOf(q0Var.f32978b);
                return iE0;
            case 4:
            case 12:
            case 13:
                int iB0 = cl.l0.b0(bArr, i5, q0Var);
                q0Var.f32979c = Integer.valueOf(q0Var.f32977a);
                return iB0;
            case 5:
            case 15:
                int i14 = i5 + 8;
                q0Var.f32979c = Long.valueOf(cl.l0.i0(i5, bArr));
                return i14;
            case 6:
            case 14:
                int i15 = i5 + 4;
                q0Var.f32979c = Integer.valueOf(cl.l0.U(i5, bArr));
                return i15;
            case 7:
                int iE02 = cl.l0.e0(bArr, i5, q0Var);
                q0Var.f32979c = Boolean.valueOf(q0Var.f32978b != 0);
                return iE02;
            case 8:
                return cl.l0.Z(bArr, i5, q0Var);
            case 9:
            default:
                throw new RuntimeException("unsupported field type.");
            case 10:
                x3 x3VarA = u3.f33553c.a(cls);
                x2 x2VarZze = x3VarA.zze();
                int iG0 = cl.l0.g0(x2VarZze, x3VarA, bArr, i5, i11, q0Var);
                x3VarA.b(x2VarZze);
                q0Var.f32979c = x2VarZze;
                return iG0;
            case 11:
                return cl.l0.S(bArr, i5, q0Var);
            case 16:
                int iB02 = cl.l0.b0(bArr, i5, q0Var);
                q0Var.f32979c = Integer.valueOf(com.google.android.gms.internal.consent_sdk.k0.H(q0Var.f32977a));
                return iB02;
            case 17:
                int iE03 = cl.l0.e0(bArr, i5, q0Var);
                long j11 = q0Var.f32978b;
                q0Var.f32979c = Long.valueOf((j11 >>> 1) ^ (-(1 & j11)));
                return iE03;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:170:0x0369  */
    /* JADX WARN: Removed duplicated region for block: B:186:0x03b9  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x03d3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static r3 t(w3 w3Var, u2 u2Var, u2 u2Var2) {
        int i5;
        int iCharAt;
        int i11;
        int[] iArr;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17;
        char cCharAt;
        int i18;
        char cCharAt2;
        int i19;
        char cCharAt3;
        int i21;
        char cCharAt4;
        int i22;
        char cCharAt5;
        int i23;
        char cCharAt6;
        int i24;
        char cCharAt7;
        int i25;
        char cCharAt8;
        Object[] objArr;
        int i26;
        int i27;
        int i28;
        int i29;
        int iObjectFieldOffset;
        int iObjectFieldOffset2;
        int i31;
        int i32;
        int i33;
        int i34;
        int i35;
        int i36;
        int i37;
        Field fieldD;
        char cCharAt9;
        int i38;
        int i39;
        int i40;
        int i41;
        Field fieldD2;
        Field fieldD3;
        int i42;
        char cCharAt10;
        int i43;
        int i44;
        char cCharAt11;
        int i45;
        int i46;
        char cCharAt12;
        int i47;
        char cCharAt13;
        if (!(w3Var instanceof w3)) {
            w3Var.getClass();
            throw new ClassCastException();
        }
        String str = w3Var.f33570b;
        int length = str.length();
        if (str.charAt(0) >= 55296) {
            int i48 = 1;
            while (true) {
                i5 = i48 + 1;
                if (str.charAt(i48) < 55296) {
                    break;
                }
                i48 = i5;
            }
        } else {
            i5 = 1;
        }
        int i49 = i5 + 1;
        int iCharAt2 = str.charAt(i5);
        if (iCharAt2 >= 55296) {
            int i51 = iCharAt2 & 8191;
            int i52 = 13;
            while (true) {
                i47 = i49 + 1;
                cCharAt13 = str.charAt(i49);
                if (cCharAt13 < 55296) {
                    break;
                }
                i51 |= (cCharAt13 & 8191) << i52;
                i52 += 13;
                i49 = i47;
            }
            iCharAt2 = i51 | (cCharAt13 << i52);
            i49 = i47;
        }
        if (iCharAt2 == 0) {
            i13 = 0;
            i15 = 0;
            iCharAt = 0;
            i12 = 0;
            i14 = 0;
            i16 = 0;
            iArr = f33503j;
            i11 = 0;
        } else {
            int i53 = i49 + 1;
            int iCharAt3 = str.charAt(i49);
            if (iCharAt3 >= 55296) {
                int i54 = iCharAt3 & 8191;
                int i55 = 13;
                while (true) {
                    i25 = i53 + 1;
                    cCharAt8 = str.charAt(i53);
                    if (cCharAt8 < 55296) {
                        break;
                    }
                    i54 |= (cCharAt8 & 8191) << i55;
                    i55 += 13;
                    i53 = i25;
                }
                iCharAt3 = i54 | (cCharAt8 << i55);
                i53 = i25;
            }
            int i56 = i53 + 1;
            int iCharAt4 = str.charAt(i53);
            if (iCharAt4 >= 55296) {
                int i57 = iCharAt4 & 8191;
                int i58 = 13;
                while (true) {
                    i24 = i56 + 1;
                    cCharAt7 = str.charAt(i56);
                    if (cCharAt7 < 55296) {
                        break;
                    }
                    i57 |= (cCharAt7 & 8191) << i58;
                    i58 += 13;
                    i56 = i24;
                }
                iCharAt4 = i57 | (cCharAt7 << i58);
                i56 = i24;
            }
            int i59 = i56 + 1;
            int iCharAt5 = str.charAt(i56);
            if (iCharAt5 >= 55296) {
                int i61 = iCharAt5 & 8191;
                int i62 = 13;
                while (true) {
                    i23 = i59 + 1;
                    cCharAt6 = str.charAt(i59);
                    if (cCharAt6 < 55296) {
                        break;
                    }
                    i61 |= (cCharAt6 & 8191) << i62;
                    i62 += 13;
                    i59 = i23;
                }
                iCharAt5 = i61 | (cCharAt6 << i62);
                i59 = i23;
            }
            int i63 = i59 + 1;
            int iCharAt6 = str.charAt(i59);
            if (iCharAt6 >= 55296) {
                int i64 = iCharAt6 & 8191;
                int i65 = 13;
                while (true) {
                    i22 = i63 + 1;
                    cCharAt5 = str.charAt(i63);
                    if (cCharAt5 < 55296) {
                        break;
                    }
                    i64 |= (cCharAt5 & 8191) << i65;
                    i65 += 13;
                    i63 = i22;
                }
                iCharAt6 = i64 | (cCharAt5 << i65);
                i63 = i22;
            }
            int i66 = i63 + 1;
            iCharAt = str.charAt(i63);
            if (iCharAt >= 55296) {
                int i67 = iCharAt & 8191;
                int i68 = 13;
                while (true) {
                    i21 = i66 + 1;
                    cCharAt4 = str.charAt(i66);
                    if (cCharAt4 < 55296) {
                        break;
                    }
                    i67 |= (cCharAt4 & 8191) << i68;
                    i68 += 13;
                    i66 = i21;
                }
                iCharAt = i67 | (cCharAt4 << i68);
                i66 = i21;
            }
            int i69 = i66 + 1;
            int iCharAt7 = str.charAt(i66);
            if (iCharAt7 >= 55296) {
                int i71 = iCharAt7 & 8191;
                int i72 = 13;
                while (true) {
                    i19 = i69 + 1;
                    cCharAt3 = str.charAt(i69);
                    if (cCharAt3 < 55296) {
                        break;
                    }
                    i71 |= (cCharAt3 & 8191) << i72;
                    i72 += 13;
                    i69 = i19;
                }
                iCharAt7 = i71 | (cCharAt3 << i72);
                i69 = i19;
            }
            int i73 = i69 + 1;
            int iCharAt8 = str.charAt(i69);
            if (iCharAt8 >= 55296) {
                int i74 = iCharAt8 & 8191;
                int i75 = 13;
                while (true) {
                    i18 = i73 + 1;
                    cCharAt2 = str.charAt(i73);
                    if (cCharAt2 < 55296) {
                        break;
                    }
                    i74 |= (cCharAt2 & 8191) << i75;
                    i75 += 13;
                    i73 = i18;
                }
                iCharAt8 = i74 | (cCharAt2 << i75);
                i73 = i18;
            }
            int i76 = i73 + 1;
            int iCharAt9 = str.charAt(i73);
            if (iCharAt9 >= 55296) {
                int i77 = iCharAt9 & 8191;
                int i78 = 13;
                while (true) {
                    i17 = i76 + 1;
                    cCharAt = str.charAt(i76);
                    if (cCharAt < 55296) {
                        break;
                    }
                    i77 |= (cCharAt & 8191) << i78;
                    i78 += 13;
                    i76 = i17;
                }
                iCharAt9 = i77 | (cCharAt << i78);
                i76 = i17;
            }
            int i79 = iCharAt3 + iCharAt3 + iCharAt4;
            i11 = iCharAt3;
            i49 = i76;
            iArr = new int[iCharAt9 + iCharAt7 + iCharAt8];
            int i81 = iCharAt7;
            i12 = iCharAt5;
            i13 = i81;
            i14 = iCharAt6;
            i15 = i79;
            i16 = iCharAt9;
        }
        Unsafe unsafe = f33504k;
        Object[] objArr2 = w3Var.f33571c;
        Class<?> cls = w3Var.f33569a.getClass();
        int i82 = i16 + i13;
        int i83 = iCharAt + iCharAt;
        int[] iArr2 = new int[iCharAt * 3];
        Object[] objArr3 = new Object[i83];
        int i84 = i82;
        int i85 = i16;
        int i86 = 0;
        int i87 = 0;
        while (i49 < length) {
            int i88 = i49 + 1;
            int iCharAt10 = str.charAt(i49);
            int i89 = length;
            if (iCharAt10 >= 55296) {
                int i91 = iCharAt10 & 8191;
                int i92 = i88;
                int i93 = 13;
                while (true) {
                    i46 = i92 + 1;
                    cCharAt12 = str.charAt(i92);
                    objArr = objArr2;
                    if (cCharAt12 < 55296) {
                        break;
                    }
                    i91 |= (cCharAt12 & 8191) << i93;
                    i93 += 13;
                    i92 = i46;
                    objArr2 = objArr;
                }
                iCharAt10 = i91 | (cCharAt12 << i93);
                i26 = i46;
            } else {
                objArr = objArr2;
                i26 = i88;
            }
            int i94 = i26 + 1;
            int iCharAt11 = str.charAt(i26);
            if (iCharAt11 >= 55296) {
                int i95 = iCharAt11 & 8191;
                int i96 = i94;
                int i97 = 13;
                while (true) {
                    i44 = i96 + 1;
                    cCharAt11 = str.charAt(i96);
                    i45 = i95;
                    if (cCharAt11 < 55296) {
                        break;
                    }
                    i95 = i45 | ((cCharAt11 & 8191) << i97);
                    i97 += 13;
                    i96 = i44;
                }
                iCharAt11 = i45 | (cCharAt11 << i97);
                i27 = i44;
            } else {
                i27 = i94;
            }
            int i98 = iCharAt10;
            if ((iCharAt11 & 1024) != 0) {
                iArr[i87] = i86;
                i87++;
            }
            int i99 = iCharAt11 & 255;
            Object[] objArr4 = objArr3;
            int i100 = iCharAt11 & 2048;
            if (i99 >= 51) {
                int i101 = i27 + 1;
                int iCharAt12 = str.charAt(i27);
                if (iCharAt12 >= 55296) {
                    int i102 = iCharAt12 & 8191;
                    int i103 = i101;
                    int i104 = 13;
                    while (true) {
                        i42 = i103 + 1;
                        cCharAt10 = str.charAt(i103);
                        i43 = i102;
                        if (cCharAt10 < 55296) {
                            break;
                        }
                        i102 = i43 | ((cCharAt10 & 8191) << i104);
                        i104 += 13;
                        i103 = i42;
                    }
                    iCharAt12 = i43 | (cCharAt10 << i104);
                    i40 = i42;
                } else {
                    i40 = i101;
                }
                int i105 = iCharAt12;
                int i106 = i99 - 51;
                int i107 = i40;
                if (i106 == 9 || i106 == 17) {
                    objArr4[c9.d(i86, 3, 1)] = objArr[i15];
                    i41 = i100;
                    i15++;
                } else if (i106 != 12) {
                    i41 = i100;
                } else if (w3Var.a() == 1 || i100 != 0) {
                    objArr4[c9.d(i86, 3, 1)] = objArr[i15];
                    i15++;
                    i41 = i100;
                } else {
                    i41 = 0;
                }
                int i108 = i105 + i105;
                Object obj = objArr[i108];
                int i109 = i41;
                if (obj instanceof Field) {
                    fieldD2 = (Field) obj;
                } else {
                    fieldD2 = D(cls, (String) obj);
                    objArr[i108] = fieldD2;
                }
                i28 = i11;
                int iObjectFieldOffset3 = (int) unsafe.objectFieldOffset(fieldD2);
                int i110 = i108 + 1;
                Object obj2 = objArr[i110];
                if (obj2 instanceof Field) {
                    fieldD3 = (Field) obj2;
                } else {
                    fieldD3 = D(cls, (String) obj2);
                    objArr[i110] = fieldD3;
                }
                iObjectFieldOffset2 = (int) unsafe.objectFieldOffset(fieldD3);
                i29 = i82;
                i37 = iObjectFieldOffset3;
                i36 = i109;
                i33 = i107;
                i31 = i86;
                i35 = 0;
            } else {
                i28 = i11;
                int i111 = i15 + 1;
                Field fieldD4 = D(cls, (String) objArr[i15]);
                if (i99 == 9 || i99 == 17) {
                    i29 = i82;
                    objArr4[c9.d(i86, 3, 1)] = fieldD4.getType();
                } else {
                    if (i99 == 27) {
                        i29 = i82;
                        i38 = 3;
                        i39 = 1;
                        i15 += 2;
                    } else if (i99 == 49) {
                        i15 += 2;
                        i29 = i82;
                        i38 = 3;
                        i39 = 1;
                    } else {
                        if (i99 == 12 || i99 == 30 || i99 == 44) {
                            i29 = i82;
                            if (w3Var.a() == 1 || i100 != 0) {
                                i15 += 2;
                                objArr4[c9.d(i86, 3, 1)] = objArr[i111];
                            } else {
                                i15 = i111;
                                i100 = 0;
                            }
                        } else if (i99 == 50) {
                            int i112 = i15 + 2;
                            int i113 = i85 + 1;
                            iArr[i85] = i86;
                            int i114 = i86 / 3;
                            int i115 = i114 + i114;
                            objArr4[i115] = objArr[i111];
                            if (i100 != 0) {
                                i15 += 3;
                                objArr4[i115 + 1] = objArr[i112];
                                i85 = i113;
                            } else {
                                i15 = i112;
                                i85 = i113;
                                i100 = 0;
                            }
                            i29 = i82;
                        } else {
                            i29 = i82;
                        }
                        iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldD4);
                        iObjectFieldOffset2 = 1048575;
                        if ((iCharAt11 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0 || i99 > 17) {
                            i31 = i86;
                            i32 = iObjectFieldOffset;
                            i33 = i27;
                            i34 = 0;
                        } else {
                            int i116 = i27 + 1;
                            int iCharAt13 = str.charAt(i27);
                            if (iCharAt13 >= 55296) {
                                int i117 = iCharAt13 & 8191;
                                int i118 = 13;
                                while (true) {
                                    i33 = i116 + 1;
                                    cCharAt9 = str.charAt(i116);
                                    if (cCharAt9 < 55296) {
                                        break;
                                    }
                                    i117 |= (cCharAt9 & 8191) << i118;
                                    i118 += 13;
                                    i116 = i33;
                                }
                                iCharAt13 = i117 | (cCharAt9 << i118);
                            } else {
                                i33 = i116;
                            }
                            int i119 = (iCharAt13 / 32) + i28 + i28;
                            Object obj3 = objArr[i119];
                            if (obj3 instanceof Field) {
                                fieldD = (Field) obj3;
                            } else {
                                fieldD = D(cls, (String) obj3);
                                objArr[i119] = fieldD;
                            }
                            i31 = i86;
                            i32 = iObjectFieldOffset;
                            i34 = iCharAt13 % 32;
                            iObjectFieldOffset2 = (int) unsafe.objectFieldOffset(fieldD);
                        }
                        if (i99 >= 18 || i99 > 49) {
                            i35 = i34;
                            i36 = i100;
                        } else {
                            iArr[i84] = i32;
                            i84++;
                            i36 = i100;
                            i35 = i34;
                        }
                        i37 = i32;
                    }
                    objArr4[c9.d(i86, i38, i39)] = objArr[i111];
                    iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldD4);
                    iObjectFieldOffset2 = 1048575;
                    if ((iCharAt11 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
                        i31 = i86;
                        i32 = iObjectFieldOffset;
                        i33 = i27;
                        i34 = 0;
                        if (i99 >= 18) {
                            i35 = i34;
                            i36 = i100;
                            i37 = i32;
                        }
                    }
                }
                i15 = i111;
                iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldD4);
                iObjectFieldOffset2 = 1048575;
                if ((iCharAt11 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
                }
            }
            int i120 = i31 + 1;
            iArr2[i31] = i98;
            int i121 = i31 + 2;
            String str2 = str;
            iArr2[i120] = ((iCharAt11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 0) | ((iCharAt11 & 256) != 0 ? 268435456 : 0) | (i36 != 0 ? Integer.MIN_VALUE : 0) | (i99 << 20) | i37;
            iArr2[i121] = (i35 << 20) | iObjectFieldOffset2;
            i86 = i31 + 3;
            i49 = i33;
            length = i89;
            objArr3 = objArr4;
            objArr2 = objArr;
            str = str2;
            i82 = i29;
            i11 = i28;
        }
        return new r3(iArr2, objArr3, i12, i14, w3Var.f33569a, iArr, i16, i82, u2Var, u2Var2);
    }

    public static int u(long j11, Object obj) {
        return ((Integer) j4.h(obj, j11)).intValue();
    }

    public static int w(int i5) {
        return (i5 >>> 20) & 255;
    }

    public static long y(long j11, Object obj) {
        return ((Long) j4.h(obj, j11)).longValue();
    }

    public final x3 A(int i5) {
        int i11 = i5 / 3;
        int i12 = i11 + i11;
        Object[] objArr = this.f33506b;
        x3 x3Var = (x3) objArr[i12];
        if (x3Var != null) {
            return x3Var;
        }
        x3 x3VarA = u3.f33553c.a((Class) objArr[i12 + 1]);
        objArr[i12] = x3VarA;
        return x3VarA;
    }

    public final Object B(int i5, Object obj) {
        x3 x3VarA = A(i5);
        int iX = x(i5) & 1048575;
        if (!n(obj, i5)) {
            return x3VarA.zze();
        }
        Object object = f33504k.getObject(obj, iX);
        if (p(object)) {
            return object;
        }
        x2 x2VarZze = x3VarA.zze();
        if (object != null) {
            x3VarA.zzg(x2VarZze, object);
        }
        return x2VarZze;
    }

    public final Object C(int i5, int i11, Object obj) {
        x3 x3VarA = A(i11);
        if (!q(obj, i5, i11)) {
            return x3VarA.zze();
        }
        Object object = f33504k.getObject(obj, x(i11) & 1048575);
        if (p(object)) {
            return object;
        }
        x2 x2VarZze = x3VarA.zze();
        if (object != null) {
            x3VarA.zzg(x2VarZze, object);
        }
        return x2VarZze;
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final boolean a(Object obj) {
        int i5;
        int i11;
        int i12;
        int i13 = 0;
        int i14 = 0;
        int i15 = 1048575;
        while (i14 < this.f33511g) {
            int i16 = this.f33510f[i14];
            int[] iArr = this.f33505a;
            int i17 = iArr[i16];
            int iX = x(i16);
            int i18 = iArr[i16 + 2];
            int i19 = i18 & 1048575;
            int i21 = 1 << (i18 >>> 20);
            if (i19 != i15) {
                if (i19 != 1048575) {
                    i13 = f33504k.getInt(obj, i19);
                }
                i11 = i16;
                i12 = i13;
                i5 = i19;
            } else {
                int i22 = i13;
                i5 = i15;
                i11 = i16;
                i12 = i22;
            }
            if ((268435456 & iX) == 0 || o(obj, i11, i5, i12, i21)) {
                int iW = w(iX);
                if (iW != 9 && iW != 17) {
                    if (iW != 27) {
                        if (iW == 60 || iW == 68) {
                            if (!q(obj, i17, i11) || A(i11).a(j4.h(obj, iX & 1048575))) {
                                i14++;
                                i15 = i5;
                                i13 = i12;
                            }
                        } else if (iW != 49) {
                            if (iW != 50) {
                                continue;
                            } else {
                                m3 m3Var = (m3) j4.h(obj, iX & 1048575);
                                if (m3Var.isEmpty()) {
                                    continue;
                                } else {
                                    int i23 = i11 / 3;
                                    if (((o4) ((l3) this.f33506b[i23 + i23]).f33448a.f76310c).f33473a == p4.f33489i) {
                                        x3 x3VarA = null;
                                        for (Object obj2 : m3Var.values()) {
                                            if (x3VarA == null) {
                                                x3VarA = u3.f33553c.a(obj2.getClass());
                                            }
                                            if (!x3VarA.a(obj2)) {
                                            }
                                        }
                                    } else {
                                        continue;
                                    }
                                }
                            }
                            i14++;
                            i15 = i5;
                            i13 = i12;
                        }
                    }
                    List list = (List) j4.h(obj, iX & 1048575);
                    if (list.isEmpty()) {
                        continue;
                    } else {
                        x3 x3VarA2 = A(i11);
                        for (int i24 = 0; i24 < list.size(); i24++) {
                            if (x3VarA2.a(list.get(i24))) {
                            }
                        }
                    }
                    i14++;
                    i15 = i5;
                    i13 = i12;
                } else if (!o(obj, i11, i5, i12, i21) || A(i11).a(j4.h(obj, iX & 1048575))) {
                    i14++;
                    i15 = i5;
                    i13 = i12;
                }
            }
            return false;
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0071  */
    @Override // com.google.android.gms.internal.play_billing.x3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(Object obj) {
        if (!p(obj)) {
            return;
        }
        if (obj instanceof x2) {
            x2 x2Var = (x2) obj;
            x2Var.g();
            x2Var.zza = 0;
            x2Var.e();
        }
        int i5 = 0;
        while (true) {
            int[] iArr = this.f33505a;
            if (i5 >= iArr.length) {
                this.f33513i.getClass();
                e4 e4Var = ((x2) obj).zzc;
                if (e4Var.f33392e) {
                    e4Var.f33392e = false;
                    return;
                }
                return;
            }
            int iX = x(i5);
            int i11 = 1048575 & iX;
            int iW = w(iX);
            long j11 = i11;
            if (iW != 9) {
                if (iW != 60 && iW != 68) {
                    switch (iW) {
                        case 18:
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                        case 26:
                        case 27:
                        case 28:
                        case 29:
                        case 30:
                        case 31:
                        case 32:
                        case 33:
                        case 34:
                        case 35:
                        case 36:
                        case 37:
                        case 38:
                        case 39:
                        case 40:
                        case 41:
                        case 42:
                        case 43:
                        case 44:
                        case 45:
                        case 46:
                        case 47:
                        case 48:
                        case 49:
                            h2 h2Var = (h2) ((c3) j4.h(obj, j11));
                            if (!h2Var.f33414a) {
                                break;
                            } else {
                                h2Var.f33414a = false;
                                break;
                            }
                        case 50:
                            Unsafe unsafe = f33504k;
                            Object object = unsafe.getObject(obj, j11);
                            if (object == null) {
                                break;
                            } else {
                                ((m3) object).f33456a = false;
                                unsafe.putObject(obj, j11, object);
                                break;
                            }
                    }
                } else if (q(obj, iArr[i5], i5)) {
                    A(i5).b(f33504k.getObject(obj, j11));
                }
            } else if (n(obj, i5)) {
                A(i5).b(f33504k.getObject(obj, j11));
            }
            i5 += 3;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:120:0x033d  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x034b  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x035d  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x036e  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0377  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x037f  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x039d  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x03a9  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x03c2  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x03cd  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x03d4  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x03ee  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x03f5  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x03fb  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0402  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x040e  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0419  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0424  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x042b  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x0345 A[SYNTHETIC] */
    @Override // com.google.android.gms.internal.play_billing.x3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(Object obj, k3 k3Var) throws k4, zzfa {
        int[] iArr;
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        boolean z11;
        int i15;
        Iterator it;
        int iE0;
        int iB;
        int iD0;
        int iD02;
        int iE02;
        int iB2;
        int iD03;
        r3 r3Var = this;
        n2 n2Var = (n2) k3Var.f33440a;
        Unsafe unsafe = f33504k;
        int i16 = 1048575;
        int i17 = 1048575;
        int i18 = 0;
        int i19 = 0;
        while (true) {
            int[] iArr2 = r3Var.f33505a;
            if (i18 >= iArr2.length) {
                ((x2) obj).zzc.d(k3Var);
                return;
            }
            int iX = r3Var.x(i18);
            int iW = w(iX);
            int i21 = iArr2[i18];
            if (iW <= 17) {
                int i22 = iArr2[i18 + 2];
                int i23 = i22 & i16;
                if (i23 != i17) {
                    i19 = i23 == i16 ? 0 : unsafe.getInt(obj, i23);
                    i17 = i23;
                }
                iArr = iArr2;
                i5 = 1 << (i22 >>> 20);
            } else {
                iArr = iArr2;
                i5 = 0;
            }
            long j11 = iX & i16;
            int i24 = 2;
            switch (iW) {
                case 0:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.t0(i21, Double.doubleToRawLongBits(j4.f33428c.a(obj, j11)));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 1:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.r0(i21, Float.floatToRawIntBits(j4.f33428c.b(obj, j11)));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 2:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.B0(i21, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 3:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.B0(i21, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 4:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.v0(i21, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 5:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.t0(i21, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 6:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.r0(i21, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 7:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        boolean zG = j4.f33428c.g(obj, j11);
                        n2Var.A0(i21 << 3);
                        n2Var.o0(zG ? (byte) 1 : (byte) 0);
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 8:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        Object object = unsafe.getObject(obj, j11);
                        if (object instanceof String) {
                            n2Var.A0((i21 << 3) | 2);
                            n2Var.x0((String) object);
                        } else {
                            n2Var.q0(i21, (l2) object);
                        }
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 9:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        k3Var.a(i21, unsafe.getObject(obj, j11), r3Var.A(i18));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 10:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.q0(i21, (l2) unsafe.getObject(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 11:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.z0(i21, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 12:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.v0(i21, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 13:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.r0(i21, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 14:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        n2Var.t0(i21, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 15:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        int i25 = unsafe.getInt(obj, j11);
                        n2Var.z0(i21, (i25 >> 31) ^ (i25 + i25));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 16:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        long j12 = unsafe.getLong(obj, j11);
                        n2Var.B0(i21, (j12 >> 63) ^ (j12 + j12));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 17:
                    if (r3Var.o(obj, i18, i17, i19, i5)) {
                        Object object2 = unsafe.getObject(obj, j11);
                        n2Var.y0(i21, 3);
                        r3Var.A(i18).c((g2) object2, k3Var);
                        n2Var.y0(i21, 4);
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 18:
                    i11 = i17;
                    i12 = i19;
                    y3.r(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 19:
                    i11 = i17;
                    i12 = i19;
                    y3.v(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 20:
                    i11 = i17;
                    i12 = i19;
                    y3.x(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 21:
                    i11 = i17;
                    i12 = i19;
                    y3.e(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 22:
                    i11 = i17;
                    i12 = i19;
                    y3.w(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 23:
                    i11 = i17;
                    i12 = i19;
                    y3.u(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 24:
                    i11 = i17;
                    i12 = i19;
                    y3.t(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 25:
                    i11 = i17;
                    i12 = i19;
                    y3.q(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 26:
                    i13 = i17;
                    i14 = i19;
                    int i26 = iArr[i18];
                    List list = (List) unsafe.getObject(obj, j11);
                    u2 u2Var = y3.f33663a;
                    if (list != null && !list.isEmpty()) {
                        if (list instanceof g3) {
                            g3 g3Var = (g3) list;
                            for (int i27 = 0; i27 < list.size(); i27++) {
                                Object objZza = g3Var.zza();
                                if (objZza instanceof String) {
                                    n2Var.A0((i26 << 3) | 2);
                                    n2Var.x0((String) objZza);
                                } else {
                                    n2Var.q0(i26, (l2) objZza);
                                }
                            }
                        } else {
                            for (int i28 = 0; i28 < list.size(); i28++) {
                                String str = (String) list.get(i28);
                                n2Var.A0((i26 << 3) | 2);
                                n2Var.x0(str);
                            }
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                    break;
                case 27:
                    i13 = i17;
                    i14 = i19;
                    int i29 = iArr[i18];
                    List list2 = (List) unsafe.getObject(obj, j11);
                    x3 x3VarA = r3Var.A(i18);
                    u2 u2Var2 = y3.f33663a;
                    if (list2 != null && !list2.isEmpty()) {
                        for (int i31 = 0; i31 < list2.size(); i31++) {
                            k3Var.a(i29, list2.get(i31), x3VarA);
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                    break;
                case 28:
                    i13 = i17;
                    i14 = i19;
                    int i32 = iArr[i18];
                    List list3 = (List) unsafe.getObject(obj, j11);
                    u2 u2Var3 = y3.f33663a;
                    if (list3 != null && !list3.isEmpty()) {
                        for (int i33 = 0; i33 < list3.size(); i33++) {
                            n2Var.q0(i32, (l2) list3.get(i33));
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                    break;
                case 29:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    y3.d(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 30:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    y3.s(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 31:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    y3.y(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 32:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    y3.a(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 33:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    y3.b(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 34:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    y3.c(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 35:
                    i13 = i17;
                    i14 = i19;
                    y3.r(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 36:
                    i13 = i17;
                    i14 = i19;
                    y3.v(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 37:
                    i13 = i17;
                    i14 = i19;
                    y3.x(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 38:
                    i13 = i17;
                    i14 = i19;
                    y3.e(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 39:
                    i13 = i17;
                    i14 = i19;
                    y3.w(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 40:
                    i13 = i17;
                    i14 = i19;
                    y3.u(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 41:
                    i13 = i17;
                    i14 = i19;
                    y3.t(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 42:
                    i13 = i17;
                    i14 = i19;
                    y3.q(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 43:
                    i13 = i17;
                    i14 = i19;
                    y3.d(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 44:
                    i13 = i17;
                    i14 = i19;
                    y3.s(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 45:
                    i13 = i17;
                    i14 = i19;
                    y3.y(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 46:
                    i13 = i17;
                    i14 = i19;
                    y3.a(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 47:
                    i13 = i17;
                    i14 = i19;
                    y3.b(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 48:
                    i13 = i17;
                    i14 = i19;
                    y3.c(iArr[i18], (List) unsafe.getObject(obj, j11), k3Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 49:
                    i13 = i17;
                    i14 = i19;
                    int i34 = iArr[i18];
                    List list4 = (List) unsafe.getObject(obj, j11);
                    x3 x3VarA2 = r3Var.A(i18);
                    u2 u2Var4 = y3.f33663a;
                    if (list4 != null && !list4.isEmpty()) {
                        for (int i35 = 0; i35 < list4.size(); i35++) {
                            g2 g2Var = (g2) list4.get(i35);
                            n2Var.y0(i34, 3);
                            x3VarA2.c(g2Var, k3Var);
                            n2Var.y0(i34, 4);
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                    break;
                case 50:
                    Object object3 = unsafe.getObject(obj, j11);
                    if (object3 != null) {
                        int i36 = i18 / 3;
                        mg.l lVar = ((l3) r3Var.f33506b[i36 + i36]).f33448a;
                        o4 o4Var = (o4) lVar.f76310c;
                        o4 o4Var2 = (o4) lVar.f76309b;
                        Iterator it2 = ((m3) object3).entrySet().iterator();
                        while (it2.hasNext()) {
                            Map.Entry entry = (Map.Entry) it2.next();
                            n2Var.y0(i21, i24);
                            Object key = entry.getKey();
                            Object value = entry.getValue();
                            int i37 = r2.f33500c;
                            int iD04 = n2.D0(8);
                            o4 o4Var3 = o4.f33470d;
                            if (o4Var2 == o4Var3) {
                                iD04 += iD04;
                            }
                            p4 p4Var = p4.f33481a;
                            int i38 = i17;
                            switch (o4Var2.ordinal()) {
                                case 0:
                                    i15 = i19;
                                    it = it2;
                                    ((Double) key).getClass();
                                    iE0 = 8;
                                    int i39 = iE0 + iD04;
                                    int iD05 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                        iD05 += iD05;
                                    }
                                    switch (o4Var.ordinal()) {
                                        case 0:
                                            ((Double) value).getClass();
                                            iE02 = 8;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key2 = entry.getKey();
                                            Object value2 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key2);
                                            r2.b(n2Var, o4Var, 2, value2);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 1:
                                            ((Float) value).getClass();
                                            iE02 = 4;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key22 = entry.getKey();
                                            Object value22 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key22);
                                            r2.b(n2Var, o4Var, 2, value22);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 2:
                                            iE02 = n2.E0(((Long) value).longValue());
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key222 = entry.getKey();
                                            Object value222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key222);
                                            r2.b(n2Var, o4Var, 2, value222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 3:
                                            iE02 = n2.E0(((Long) value).longValue());
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key2222 = entry.getKey();
                                            Object value2222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key2222);
                                            r2.b(n2Var, o4Var, 2, value2222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 4:
                                            iE02 = n2.E0(((Integer) value).intValue());
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key22222 = entry.getKey();
                                            Object value22222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key22222);
                                            r2.b(n2Var, o4Var, 2, value22222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 5:
                                            ((Long) value).getClass();
                                            iE02 = 8;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key222222 = entry.getKey();
                                            Object value222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key222222);
                                            r2.b(n2Var, o4Var, 2, value222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 6:
                                            ((Integer) value).getClass();
                                            iE02 = 4;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key2222222 = entry.getKey();
                                            Object value2222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key2222222);
                                            r2.b(n2Var, o4Var, 2, value2222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 7:
                                            ((Boolean) value).getClass();
                                            iE02 = 1;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key22222222 = entry.getKey();
                                            Object value22222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key22222222);
                                            r2.b(n2Var, o4Var, 2, value22222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 8:
                                            if (value instanceof l2) {
                                                iB2 = ((l2) value).f();
                                                iD03 = n2.D0(iB2);
                                            } else {
                                                iB2 = l4.b((String) value);
                                                iD03 = n2.D0(iB2);
                                            }
                                            iE02 = iB2 + iD03;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key222222222 = entry.getKey();
                                            Object value222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key222222222);
                                            r2.b(n2Var, o4Var, 2, value222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 9:
                                            iE02 = ((g2) value).d();
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key2222222222 = entry.getKey();
                                            Object value2222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key2222222222);
                                            r2.b(n2Var, o4Var, 2, value2222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 10:
                                            iB2 = ((g2) value).d();
                                            iD03 = n2.D0(iB2);
                                            iE02 = iB2 + iD03;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key22222222222 = entry.getKey();
                                            Object value22222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key22222222222);
                                            r2.b(n2Var, o4Var, 2, value22222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 11:
                                            if (value instanceof l2) {
                                                iB2 = ((l2) value).f();
                                                iD03 = n2.D0(iB2);
                                            } else {
                                                iB2 = ((byte[]) value).length;
                                                iD03 = n2.D0(iB2);
                                            }
                                            iE02 = iB2 + iD03;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key222222222222 = entry.getKey();
                                            Object value222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key222222222222);
                                            r2.b(n2Var, o4Var, 2, value222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 12:
                                            iE02 = n2.D0(((Integer) value).intValue());
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key2222222222222 = entry.getKey();
                                            Object value2222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key2222222222222);
                                            r2.b(n2Var, o4Var, 2, value2222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 13:
                                            iE02 = value instanceof z2 ? n2.E0(((z2) value).zza()) : n2.E0(((Integer) value).intValue());
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key22222222222222 = entry.getKey();
                                            Object value22222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key22222222222222);
                                            r2.b(n2Var, o4Var, 2, value22222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 14:
                                            ((Integer) value).getClass();
                                            iE02 = 4;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key222222222222222 = entry.getKey();
                                            Object value222222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key222222222222222);
                                            r2.b(n2Var, o4Var, 2, value222222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 15:
                                            ((Long) value).getClass();
                                            iE02 = 8;
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key2222222222222222 = entry.getKey();
                                            Object value2222222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key2222222222222222);
                                            r2.b(n2Var, o4Var, 2, value2222222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 16:
                                            int iIntValue = ((Integer) value).intValue();
                                            iE02 = n2.D0((iIntValue >> 31) ^ (iIntValue + iIntValue));
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key22222222222222222 = entry.getKey();
                                            Object value22222222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key22222222222222222);
                                            r2.b(n2Var, o4Var, 2, value22222222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        case 17:
                                            long jLongValue = ((Long) value).longValue();
                                            iE02 = n2.E0((jLongValue + jLongValue) ^ (jLongValue >> 63));
                                            n2Var.A0(iE02 + iD05 + i39);
                                            Object key222222222222222222 = entry.getKey();
                                            Object value222222222222222222 = entry.getValue();
                                            r2.b(n2Var, o4Var2, 1, key222222222222222222);
                                            r2.b(n2Var, o4Var, 2, value222222222222222222);
                                            i24 = 2;
                                            i19 = i15;
                                            i17 = i38;
                                            it2 = it;
                                        default:
                                            throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                                    }
                                case 1:
                                    i15 = i19;
                                    it = it2;
                                    ((Float) key).getClass();
                                    iE0 = 4;
                                    int i392 = iE0 + iD04;
                                    int iD052 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 2:
                                    i15 = i19;
                                    it = it2;
                                    iE0 = n2.E0(((Long) key).longValue());
                                    int i3922 = iE0 + iD04;
                                    int iD0522 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 3:
                                    i15 = i19;
                                    it = it2;
                                    iE0 = n2.E0(((Long) key).longValue());
                                    int i39222 = iE0 + iD04;
                                    int iD05222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 4:
                                    i15 = i19;
                                    it = it2;
                                    iE0 = n2.E0(((Integer) key).intValue());
                                    int i392222 = iE0 + iD04;
                                    int iD052222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 5:
                                    i15 = i19;
                                    it = it2;
                                    ((Long) key).getClass();
                                    iE0 = 8;
                                    int i3922222 = iE0 + iD04;
                                    int iD0522222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 6:
                                    i15 = i19;
                                    it = it2;
                                    ((Integer) key).getClass();
                                    iE0 = 4;
                                    int i39222222 = iE0 + iD04;
                                    int iD05222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 7:
                                    i15 = i19;
                                    it = it2;
                                    ((Boolean) key).getClass();
                                    iE0 = 1;
                                    int i392222222 = iE0 + iD04;
                                    int iD052222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 8:
                                    i15 = i19;
                                    it = it2;
                                    if (key instanceof l2) {
                                        iB = ((l2) key).f();
                                        iD0 = n2.D0(iB);
                                    } else {
                                        iB = l4.b((String) key);
                                        iD0 = n2.D0(iB);
                                    }
                                    iE0 = iB + iD0;
                                    int i3922222222 = iE0 + iD04;
                                    int iD0522222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 9:
                                    i15 = i19;
                                    it = it2;
                                    iE0 = ((g2) key).d();
                                    int i39222222222 = iE0 + iD04;
                                    int iD05222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 10:
                                    i15 = i19;
                                    it = it2;
                                    iB = ((g2) key).d();
                                    iD0 = n2.D0(iB);
                                    iE0 = iB + iD0;
                                    int i392222222222 = iE0 + iD04;
                                    int iD052222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 11:
                                    i15 = i19;
                                    it = it2;
                                    if (key instanceof l2) {
                                        iB = ((l2) key).f();
                                        iD0 = n2.D0(iB);
                                    } else {
                                        iB = ((byte[]) key).length;
                                        iD0 = n2.D0(iB);
                                    }
                                    iE0 = iB + iD0;
                                    int i3922222222222 = iE0 + iD04;
                                    int iD0522222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 12:
                                    i15 = i19;
                                    it = it2;
                                    iE0 = n2.D0(((Integer) key).intValue());
                                    int i39222222222222 = iE0 + iD04;
                                    int iD05222222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 13:
                                    i15 = i19;
                                    if (key instanceof z2) {
                                        it = it2;
                                        iE0 = n2.E0(((z2) key).zza());
                                    } else {
                                        it = it2;
                                        iE0 = n2.E0(((Integer) key).intValue());
                                    }
                                    int i392222222222222 = iE0 + iD04;
                                    int iD052222222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 14:
                                    ((Integer) key).getClass();
                                    i15 = i19;
                                    it = it2;
                                    iE0 = 4;
                                    int i3922222222222222 = iE0 + iD04;
                                    int iD0522222222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 15:
                                    ((Long) key).getClass();
                                    i15 = i19;
                                    it = it2;
                                    iE0 = 8;
                                    int i39222222222222222 = iE0 + iD04;
                                    int iD05222222222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 16:
                                    int iIntValue2 = ((Integer) key).intValue();
                                    iD02 = n2.D0((iIntValue2 + iIntValue2) ^ (iIntValue2 >> 31));
                                    i15 = i19;
                                    it = it2;
                                    iE0 = iD02;
                                    int i392222222222222222 = iE0 + iD04;
                                    int iD052222222222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                case 17:
                                    long jLongValue2 = ((Long) key).longValue();
                                    iD02 = n2.E0((jLongValue2 + jLongValue2) ^ (jLongValue2 >> 63));
                                    i15 = i19;
                                    it = it2;
                                    iE0 = iD02;
                                    int i3922222222222222222 = iE0 + iD04;
                                    int iD0522222222222222222 = n2.D0(16);
                                    if (o4Var == o4Var3) {
                                    }
                                    switch (o4Var.ordinal()) {
                                    }
                                default:
                                    throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                            }
                        }
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 51:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.t0(i21, Double.doubleToRawLongBits(((Double) j4.h(obj, j11)).doubleValue()));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 52:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.r0(i21, Float.floatToRawIntBits(((Float) j4.h(obj, j11)).floatValue()));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 53:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.B0(i21, y(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 54:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.B0(i21, y(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 55:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.v0(i21, u(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 56:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.t0(i21, y(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 57:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.r0(i21, u(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 58:
                    if (r3Var.q(obj, i21, i18)) {
                        boolean zBooleanValue = ((Boolean) j4.h(obj, j11)).booleanValue();
                        n2Var.A0(i21 << 3);
                        n2Var.o0(zBooleanValue ? (byte) 1 : (byte) 0);
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 59:
                    if (r3Var.q(obj, i21, i18)) {
                        Object object4 = unsafe.getObject(obj, j11);
                        if (object4 instanceof String) {
                            n2Var.A0((i21 << 3) | 2);
                            n2Var.x0((String) object4);
                        } else {
                            n2Var.q0(i21, (l2) object4);
                        }
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 60:
                    if (r3Var.q(obj, i21, i18)) {
                        k3Var.a(i21, unsafe.getObject(obj, j11), r3Var.A(i18));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 61:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.q0(i21, (l2) unsafe.getObject(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 62:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.z0(i21, u(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 63:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.v0(i21, u(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 64:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.r0(i21, u(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 65:
                    if (r3Var.q(obj, i21, i18)) {
                        n2Var.t0(i21, y(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 66:
                    if (r3Var.q(obj, i21, i18)) {
                        int iU = u(j11, obj);
                        n2Var.z0(i21, (iU >> 31) ^ (iU + iU));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 67:
                    if (r3Var.q(obj, i21, i18)) {
                        long jY = y(j11, obj);
                        n2Var.B0(i21, (jY >> 63) ^ (jY + jY));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                case 68:
                    if (r3Var.q(obj, i21, i18)) {
                        Object object5 = unsafe.getObject(obj, j11);
                        n2Var.y0(i21, 3);
                        r3Var.A(i18).c((g2) object5, k3Var);
                        n2Var.y0(i21, 4);
                    }
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
                default:
                    i18 += 3;
                    i16 = 1048575;
                    r3Var = this;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00db A[PHI: r1
      0x00db: PHI (r1v34 int) = (r1v10 int), (r1v35 int) binds: [B:85:0x01ea, B:43:0x00d9] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.google.android.gms.internal.play_billing.x3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d(x2 x2Var) {
        int i5;
        long jDoubleToLongBits;
        int i11;
        int iFloatToIntBits;
        int i12;
        int i13;
        int i14 = 0;
        int i15 = 0;
        while (true) {
            int[] iArr = this.f33505a;
            if (i14 >= iArr.length) {
                return x2Var.zzc.hashCode() + (i15 * 53);
            }
            int iX = x(i14);
            int i16 = 1048575 & iX;
            int iW = w(iX);
            int i17 = iArr[i14];
            long j11 = i16;
            int i18 = 1237;
            int iHashCode = 37;
            switch (iW) {
                case 0:
                    i5 = i15 * 53;
                    jDoubleToLongBits = Double.doubleToLongBits(j4.f33428c.a(x2Var, j11));
                    Charset charset = e3.f33385a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 1:
                    i11 = i15 * 53;
                    iFloatToIntBits = Float.floatToIntBits(j4.f33428c.b(x2Var, j11));
                    i15 = iFloatToIntBits + i11;
                    break;
                case 2:
                    i5 = i15 * 53;
                    jDoubleToLongBits = j4.f(x2Var, j11);
                    Charset charset2 = e3.f33385a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 3:
                    i5 = i15 * 53;
                    jDoubleToLongBits = j4.f(x2Var, j11);
                    Charset charset3 = e3.f33385a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 4:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.e(x2Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 5:
                    i5 = i15 * 53;
                    jDoubleToLongBits = j4.f(x2Var, j11);
                    Charset charset4 = e3.f33385a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 6:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.e(x2Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 7:
                    i12 = i15 * 53;
                    boolean zG = j4.f33428c.g(x2Var, j11);
                    Charset charset5 = e3.f33385a;
                    if (zG) {
                        i18 = 1231;
                    }
                    i15 = i18 + i12;
                    break;
                case 8:
                    i11 = i15 * 53;
                    iFloatToIntBits = ((String) j4.h(x2Var, j11)).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 9:
                    i13 = i15 * 53;
                    Object objH = j4.h(x2Var, j11);
                    if (objH != null) {
                        iHashCode = objH.hashCode();
                    }
                    i15 = i13 + iHashCode;
                    break;
                case 10:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.h(x2Var, j11).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 11:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.e(x2Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 12:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.e(x2Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 13:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.e(x2Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 14:
                    i5 = i15 * 53;
                    jDoubleToLongBits = j4.f(x2Var, j11);
                    Charset charset6 = e3.f33385a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 15:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.e(x2Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 16:
                    i5 = i15 * 53;
                    jDoubleToLongBits = j4.f(x2Var, j11);
                    Charset charset7 = e3.f33385a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 17:
                    i13 = i15 * 53;
                    Object objH2 = j4.h(x2Var, j11);
                    if (objH2 != null) {
                        iHashCode = objH2.hashCode();
                    }
                    i15 = i13 + iHashCode;
                    break;
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                case 45:
                case 46:
                case 47:
                case 48:
                case 49:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.h(x2Var, j11).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 50:
                    i11 = i15 * 53;
                    iFloatToIntBits = j4.h(x2Var, j11).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 51:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = Double.doubleToLongBits(((Double) j4.h(x2Var, j11)).doubleValue());
                        Charset charset8 = e3.f33385a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 52:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = Float.floatToIntBits(((Float) j4.h(x2Var, j11)).floatValue());
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 53:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = y(j11, x2Var);
                        Charset charset9 = e3.f33385a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 54:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = y(j11, x2Var);
                        Charset charset10 = e3.f33385a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 55:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = u(j11, x2Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 56:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = y(j11, x2Var);
                        Charset charset11 = e3.f33385a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 57:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = u(j11, x2Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 58:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i12 = i15 * 53;
                        boolean zBooleanValue = ((Boolean) j4.h(x2Var, j11)).booleanValue();
                        Charset charset12 = e3.f33385a;
                        if (zBooleanValue) {
                        }
                        i15 = i18 + i12;
                        break;
                    }
                    break;
                case 59:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = ((String) j4.h(x2Var, j11)).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 60:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = j4.h(x2Var, j11).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 61:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = j4.h(x2Var, j11).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 62:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = u(j11, x2Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 63:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = u(j11, x2Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 64:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = u(j11, x2Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 65:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = y(j11, x2Var);
                        Charset charset13 = e3.f33385a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 66:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = u(j11, x2Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 67:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = y(j11, x2Var);
                        Charset charset14 = e3.f33385a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 68:
                    if (!q(x2Var, i17, i14)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = j4.h(x2Var, j11).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
            }
            i14 += 3;
        }
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final boolean e(x2 x2Var, x2 x2Var2) {
        boolean zF;
        int i5 = 0;
        while (true) {
            int[] iArr = this.f33505a;
            if (i5 < iArr.length) {
                int iX = x(i5);
                long j11 = iX & 1048575;
                switch (w(iX)) {
                    case 0:
                        if (!m(x2Var, x2Var2, i5)) {
                            break;
                        } else {
                            i4 i4Var = j4.f33428c;
                            if (Double.doubleToLongBits(i4Var.a(x2Var, j11)) != Double.doubleToLongBits(i4Var.a(x2Var2, j11))) {
                                break;
                            } else {
                                continue;
                                i5 += 3;
                            }
                        }
                    case 1:
                        if (!m(x2Var, x2Var2, i5)) {
                            break;
                        } else {
                            i4 i4Var2 = j4.f33428c;
                            if (Float.floatToIntBits(i4Var2.b(x2Var, j11)) != Float.floatToIntBits(i4Var2.b(x2Var2, j11))) {
                                break;
                            } else {
                                continue;
                                i5 += 3;
                            }
                        }
                    case 2:
                        if (!m(x2Var, x2Var2, i5) || j4.f(x2Var, j11) != j4.f(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 3:
                        if (!m(x2Var, x2Var2, i5) || j4.f(x2Var, j11) != j4.f(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 4:
                        if (!m(x2Var, x2Var2, i5) || j4.e(x2Var, j11) != j4.e(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 5:
                        if (!m(x2Var, x2Var2, i5) || j4.f(x2Var, j11) != j4.f(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 6:
                        if (!m(x2Var, x2Var2, i5) || j4.e(x2Var, j11) != j4.e(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 7:
                        if (!m(x2Var, x2Var2, i5)) {
                            break;
                        } else {
                            i4 i4Var3 = j4.f33428c;
                            if (i4Var3.g(x2Var, j11) != i4Var3.g(x2Var2, j11)) {
                                break;
                            } else {
                                continue;
                                i5 += 3;
                            }
                        }
                    case 8:
                        if (!m(x2Var, x2Var2, i5) || !y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 9:
                        if (!m(x2Var, x2Var2, i5) || !y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 10:
                        if (!m(x2Var, x2Var2, i5) || !y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 11:
                        if (!m(x2Var, x2Var2, i5) || j4.e(x2Var, j11) != j4.e(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 12:
                        if (!m(x2Var, x2Var2, i5) || j4.e(x2Var, j11) != j4.e(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 13:
                        if (!m(x2Var, x2Var2, i5) || j4.e(x2Var, j11) != j4.e(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 14:
                        if (!m(x2Var, x2Var2, i5) || j4.f(x2Var, j11) != j4.f(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 15:
                        if (!m(x2Var, x2Var2, i5) || j4.e(x2Var, j11) != j4.e(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 16:
                        if (!m(x2Var, x2Var2, i5) || j4.f(x2Var, j11) != j4.f(x2Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 17:
                        if (!m(x2Var, x2Var2, i5) || !y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 18:
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                    case 23:
                    case 24:
                    case 25:
                    case 26:
                    case 27:
                    case 28:
                    case 29:
                    case 30:
                    case 31:
                    case 32:
                    case 33:
                    case 34:
                    case 35:
                    case 36:
                    case 37:
                    case 38:
                    case 39:
                    case 40:
                    case 41:
                    case 42:
                    case 43:
                    case 44:
                    case 45:
                    case 46:
                    case 47:
                    case 48:
                    case 49:
                        zF = y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11));
                        break;
                    case 50:
                        zF = y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11));
                        break;
                    case 51:
                    case 52:
                    case 53:
                    case 54:
                    case 55:
                    case 56:
                    case 57:
                    case 58:
                    case 59:
                    case 60:
                    case 61:
                    case 62:
                    case 63:
                    case 64:
                    case 65:
                    case 66:
                    case 67:
                    case 68:
                        long j12 = iArr[i5 + 2] & 1048575;
                        if (j4.e(x2Var, j12) != j4.e(x2Var2, j12) || !y3.f(j4.h(x2Var, j11), j4.h(x2Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    default:
                        i5 += 3;
                }
                if (zF) {
                    i5 += 3;
                }
            } else if (x2Var.zzc.equals(x2Var2.zzc)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final void f(Object obj, byte[] bArr, int i5, int i11, com.google.android.gms.internal.measurement.q0 q0Var) {
        s(obj, bArr, i5, i11, 0, q0Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x0372  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0380  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0391  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x03ab  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x03b4  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x03de  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x03f7  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0402  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0409  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0423  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x042b  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x0432  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0439  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0445  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x0450  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x045b  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x0462  */
    /* JADX WARN: Removed duplicated region for block: B:216:0x0678 A[PHI: r21 r22
      0x0678: PHI (r21v21 int) = (r21v3 int), (r21v4 int), (r21v10 int), (r21v12 int), (r21v13 int), (r21v14 int), (r21v18 int), (r21v22 int) binds: [B:280:0x0849, B:276:0x0829, B:250:0x0780, B:236:0x0717, B:232:0x06f7, B:228:0x06d9, B:221:0x0699, B:215:0x0676] A[DONT_GENERATE, DONT_INLINE]
      0x0678: PHI (r22v20 int) = (r22v3 int), (r22v4 int), (r22v10 int), (r22v12 int), (r22v13 int), (r22v14 int), (r22v17 int), (r22v21 int) binds: [B:280:0x0849, B:276:0x0829, B:250:0x0780, B:236:0x0717, B:232:0x06f7, B:228:0x06d9, B:221:0x0699, B:215:0x0676] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:270:0x07eb A[PHI: r21 r22
      0x07eb: PHI (r21v8 int) = (r21v2 int), (r21v9 int) binds: [B:284:0x0869, B:269:0x07e9] A[DONT_GENERATE, DONT_INLINE]
      0x07eb: PHI (r22v8 int) = (r22v2 int), (r22v9 int) binds: [B:284:0x0869, B:269:0x07e9] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:352:0x037a A[SYNTHETIC] */
    @Override // com.google.android.gms.internal.play_billing.x3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int g(g2 g2Var) throws k4 {
        int i5;
        int iD0;
        int iE0;
        int i11;
        int i12;
        int iC;
        int i13;
        int i14;
        int i15;
        int i16;
        int size;
        int iO;
        int iD02;
        int iD03;
        int iD04;
        int iD05;
        int iC2;
        int iB;
        l3 l3Var;
        int iE02;
        int iB2;
        int iD06;
        int iE03;
        int iB3;
        int iD07;
        int iD08;
        int iE04;
        r3 r3Var = this;
        g2 g2Var2 = g2Var;
        Unsafe unsafe = f33504k;
        int i17 = 1048575;
        int i18 = 1048575;
        int i19 = 0;
        int i21 = 0;
        int iA = 0;
        while (true) {
            int[] iArr = r3Var.f33505a;
            if (i19 >= iArr.length) {
                return ((x2) g2Var).zzc.a() + iA;
            }
            int iX = r3Var.x(i19);
            int iW = w(iX);
            int i22 = iArr[i19];
            int i23 = iArr[i19 + 2];
            int i24 = i23 & i17;
            int i25 = 1;
            if (iW <= 17) {
                if (i24 != i18) {
                    i21 = i24 == i17 ? 0 : unsafe.getInt(g2Var2, i24);
                    i18 = i24;
                }
                i5 = 1 << (i23 >>> 20);
            } else {
                i5 = 0;
            }
            int i26 = iX & i17;
            if (iW >= s2.f33517b.f33521a) {
                s2.f33518c.getClass();
            }
            long j11 = i26;
            char c11 = '?';
            int i27 = 4;
            int i28 = 8;
            switch (iW) {
                case 0:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 8, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 1:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 4, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 2:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        long j12 = unsafe.getLong(g2Var2, j11);
                        iD0 = n2.D0(i22 << 3);
                        iE0 = n2.E0(j12);
                        i11 = iE0 + iD0;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 3:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        long j13 = unsafe.getLong(g2Var2, j11);
                        iD0 = n2.D0(i22 << 3);
                        iE0 = n2.E0(j13);
                        i11 = iE0 + iD0;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 4:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        long j14 = unsafe.getInt(g2Var2, j11);
                        iD0 = n2.D0(i22 << 3);
                        iE0 = n2.E0(j14);
                        i11 = iE0 + iD0;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 5:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 8, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 6:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 4, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 7:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 1, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 8:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        int i29 = i22 << 3;
                        Object object = unsafe.getObject(g2Var2, j11);
                        if (object instanceof l2) {
                            int iD09 = n2.D0(i29);
                            int iF = ((l2) object).f();
                            iA = com.google.android.gms.internal.measurement.k2.B(iF, iF, iD09, iA);
                        } else {
                            int iD010 = n2.D0(i29);
                            int iB4 = l4.b((String) object);
                            iA = com.google.android.gms.internal.measurement.k2.B(iB4, iB4, iD010, iA);
                        }
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 9:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        Object object2 = unsafe.getObject(g2Var2, j11);
                        x3 x3VarA = r3Var.A(i19);
                        u2 u2Var = y3.f33663a;
                        int iD011 = n2.D0(i22 << 3);
                        int iC3 = ((g2) object2).c(x3VarA);
                        iA = com.google.android.gms.internal.measurement.k2.B(iC3, iC3, iD011, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 10:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        l2 l2Var = (l2) unsafe.getObject(g2Var2, j11);
                        int iD012 = n2.D0(i22 << 3);
                        int iF2 = l2Var.f();
                        iA = com.google.android.gms.internal.measurement.k2.B(iF2, iF2, iD012, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 11:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(unsafe.getInt(g2Var2, j11), n2.D0(i22 << 3), iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 12:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        long j15 = unsafe.getInt(g2Var2, j11);
                        iD0 = n2.D0(i22 << 3);
                        iE0 = n2.E0(j15);
                        i11 = iE0 + iD0;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 13:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 4, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 14:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 8, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 15:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        int i31 = unsafe.getInt(g2Var2, j11);
                        iA = com.google.android.gms.internal.measurement.k2.A((i31 >> 31) ^ (i31 + i31), n2.D0(i22 << 3), iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 16:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        long j16 = unsafe.getLong(g2Var2, j11);
                        iD0 = n2.D0(i22 << 3);
                        iE0 = n2.E0((j16 >> 63) ^ (j16 + j16));
                        i11 = iE0 + iD0;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 17:
                    if (r3Var.o(g2Var2, i19, i18, i21, i5)) {
                        g2 g2Var3 = (g2) unsafe.getObject(g2Var2, j11);
                        x3 x3VarA2 = r3Var.A(i19);
                        u2 u2Var2 = y3.f33663a;
                        int iD013 = n2.D0(i22 << 3);
                        i12 = iD013 + iD013;
                        iC = g2Var3.c(x3VarA2);
                        i11 = iC + i12;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 18:
                    i13 = i18;
                    i14 = y3.i(i22, (List) unsafe.getObject(g2Var2, j11));
                    iA += i14;
                    i18 = i13;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 19:
                    i13 = i18;
                    i14 = y3.h(i22, (List) unsafe.getObject(g2Var2, j11));
                    iA += i14;
                    i18 = i13;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 20:
                    i15 = i18;
                    i16 = i21;
                    List list = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var3 = y3.f33663a;
                    iD03 = list.size() == 0 ? 0 : (n2.D0(i22 << 3) * list.size()) + y3.k(list);
                    iA += iD03;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 21:
                    i15 = i18;
                    i16 = i21;
                    List list2 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var4 = y3.f33663a;
                    size = list2.size();
                    if (size != 0) {
                        iO = y3.o(list2);
                        iD02 = n2.D0(i22 << 3);
                        iD04 = (iD02 * size) + iO;
                        iA += iD04;
                        i18 = i15;
                        i21 = i16;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                    iD04 = 0;
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 22:
                    i15 = i18;
                    i16 = i21;
                    List list3 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var5 = y3.f33663a;
                    size = list3.size();
                    if (size != 0) {
                        iO = y3.j(list3);
                        iD02 = n2.D0(i22 << 3);
                        iD04 = (iD02 * size) + iO;
                        iA += iD04;
                        i18 = i15;
                        i21 = i16;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                    iD04 = 0;
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 23:
                    i13 = i18;
                    i14 = y3.i(i22, (List) unsafe.getObject(g2Var2, j11));
                    iA += i14;
                    i18 = i13;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 24:
                    i13 = i18;
                    i14 = y3.h(i22, (List) unsafe.getObject(g2Var2, j11));
                    iA += i14;
                    i18 = i13;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 25:
                    i15 = i18;
                    i16 = i21;
                    List list4 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var6 = y3.f33663a;
                    int size2 = list4.size();
                    if (size2 != 0) {
                        iD03 = (n2.D0(i22 << 3) + 1) * size2;
                    }
                    iA += iD03;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                    break;
                case 26:
                    i15 = i18;
                    i16 = i21;
                    List list5 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var7 = y3.f33663a;
                    int size3 = list5.size();
                    if (size3 == 0) {
                        iD04 = 0;
                    } else {
                        iD04 = n2.D0(i22 << 3) * size3;
                        if (list5 instanceof g3) {
                            g3 g3Var = (g3) list5;
                            for (int i32 = 0; i32 < size3; i32++) {
                                Object objZza = g3Var.zza();
                                if (objZza instanceof l2) {
                                    int iF3 = ((l2) objZza).f();
                                    iD04 = com.google.android.gms.internal.measurement.k2.A(iF3, iF3, iD04);
                                } else {
                                    int iB5 = l4.b((String) objZza);
                                    iD04 = com.google.android.gms.internal.measurement.k2.A(iB5, iB5, iD04);
                                }
                            }
                        } else {
                            for (int i33 = 0; i33 < size3; i33++) {
                                Object obj = list5.get(i33);
                                if (obj instanceof l2) {
                                    int iF4 = ((l2) obj).f();
                                    iD04 = com.google.android.gms.internal.measurement.k2.A(iF4, iF4, iD04);
                                } else {
                                    int iB6 = l4.b((String) obj);
                                    iD04 = com.google.android.gms.internal.measurement.k2.A(iB6, iB6, iD04);
                                }
                            }
                        }
                    }
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 27:
                    i15 = i18;
                    i16 = i21;
                    List list6 = (List) unsafe.getObject(g2Var2, j11);
                    x3 x3VarA3 = r3Var.A(i19);
                    u2 u2Var8 = y3.f33663a;
                    int size4 = list6.size();
                    if (size4 == 0) {
                        iD05 = 0;
                    } else {
                        iD05 = n2.D0(i22 << 3) * size4;
                        for (int i34 = 0; i34 < size4; i34++) {
                            int iC4 = ((g2) list6.get(i34)).c(x3VarA3);
                            iD05 = com.google.android.gms.internal.measurement.k2.A(iC4, iC4, iD05);
                        }
                    }
                    iA += iD05;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 28:
                    i15 = i18;
                    i16 = i21;
                    List list7 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var9 = y3.f33663a;
                    int size5 = list7.size();
                    if (size5 != 0) {
                        iD04 = n2.D0(i22 << 3) * size5;
                        for (int i35 = 0; i35 < list7.size(); i35++) {
                            int iF5 = ((l2) list7.get(i35)).f();
                            iD04 = com.google.android.gms.internal.measurement.k2.A(iF5, iF5, iD04);
                        }
                    }
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                    break;
                case 29:
                    i15 = i18;
                    i16 = i21;
                    List list8 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var10 = y3.f33663a;
                    size = list8.size();
                    if (size != 0) {
                        iO = y3.n(list8);
                        iD02 = n2.D0(i22 << 3);
                        iD04 = (iD02 * size) + iO;
                        iA += iD04;
                        i18 = i15;
                        i21 = i16;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                    iD04 = 0;
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 30:
                    i15 = i18;
                    i16 = i21;
                    List list9 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var11 = y3.f33663a;
                    size = list9.size();
                    if (size != 0) {
                        iO = y3.g(list9);
                        iD02 = n2.D0(i22 << 3);
                        iD04 = (iD02 * size) + iO;
                        iA += iD04;
                        i18 = i15;
                        i21 = i16;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                    iD04 = 0;
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 31:
                    i13 = i18;
                    i14 = y3.h(i22, (List) unsafe.getObject(g2Var2, j11));
                    iA += i14;
                    i18 = i13;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 32:
                    i13 = i18;
                    i14 = y3.i(i22, (List) unsafe.getObject(g2Var2, j11));
                    iA += i14;
                    i18 = i13;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 33:
                    i15 = i18;
                    i16 = i21;
                    List list10 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var12 = y3.f33663a;
                    size = list10.size();
                    if (size != 0) {
                        iO = y3.l(list10);
                        iD02 = n2.D0(i22 << 3);
                        iD04 = (iD02 * size) + iO;
                        iA += iD04;
                        i18 = i15;
                        i21 = i16;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                    iD04 = 0;
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 34:
                    i15 = i18;
                    i16 = i21;
                    List list11 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var13 = y3.f33663a;
                    size = list11.size();
                    if (size != 0) {
                        iO = y3.m(list11);
                        iD02 = n2.D0(i22 << 3);
                        iD04 = (iD02 * size) + iO;
                        iA += iD04;
                        i18 = i15;
                        i21 = i16;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                    iD04 = 0;
                    iA += iD04;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 35:
                    i15 = i18;
                    i16 = i21;
                    List list12 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var14 = y3.f33663a;
                    int size6 = list12.size() * 8;
                    if (size6 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size6, n2.D0(i22 << 3), size6, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 36:
                    i15 = i18;
                    i16 = i21;
                    List list13 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var15 = y3.f33663a;
                    int size7 = list13.size() * 4;
                    if (size7 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size7, n2.D0(i22 << 3), size7, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 37:
                    i15 = i18;
                    i16 = i21;
                    int iK = y3.k((List) unsafe.getObject(g2Var2, j11));
                    if (iK > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iK, n2.D0(i22 << 3), iK, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 38:
                    i15 = i18;
                    i16 = i21;
                    int iO2 = y3.o((List) unsafe.getObject(g2Var2, j11));
                    if (iO2 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iO2, n2.D0(i22 << 3), iO2, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 39:
                    i15 = i18;
                    i16 = i21;
                    int iJ = y3.j((List) unsafe.getObject(g2Var2, j11));
                    if (iJ > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iJ, n2.D0(i22 << 3), iJ, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 40:
                    i15 = i18;
                    i16 = i21;
                    List list14 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var16 = y3.f33663a;
                    int size8 = list14.size() * 8;
                    if (size8 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size8, n2.D0(i22 << 3), size8, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 41:
                    i15 = i18;
                    i16 = i21;
                    List list15 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var17 = y3.f33663a;
                    int size9 = list15.size() * 4;
                    if (size9 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size9, n2.D0(i22 << 3), size9, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 42:
                    i15 = i18;
                    i16 = i21;
                    List list16 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var18 = y3.f33663a;
                    int size10 = list16.size();
                    if (size10 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size10, n2.D0(i22 << 3), size10, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 43:
                    i15 = i18;
                    i16 = i21;
                    int iN = y3.n((List) unsafe.getObject(g2Var2, j11));
                    if (iN > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iN, n2.D0(i22 << 3), iN, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 44:
                    i15 = i18;
                    i16 = i21;
                    int iG = y3.g((List) unsafe.getObject(g2Var2, j11));
                    if (iG > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iG, n2.D0(i22 << 3), iG, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 45:
                    i15 = i18;
                    i16 = i21;
                    List list17 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var19 = y3.f33663a;
                    int size11 = list17.size() * 4;
                    if (size11 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size11, n2.D0(i22 << 3), size11, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 46:
                    i15 = i18;
                    i16 = i21;
                    List list18 = (List) unsafe.getObject(g2Var2, j11);
                    u2 u2Var20 = y3.f33663a;
                    int size12 = list18.size() * 8;
                    if (size12 > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(size12, n2.D0(i22 << 3), size12, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 47:
                    i15 = i18;
                    i16 = i21;
                    int iL = y3.l((List) unsafe.getObject(g2Var2, j11));
                    if (iL > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iL, n2.D0(i22 << 3), iL, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 48:
                    i15 = i18;
                    i16 = i21;
                    int iM = y3.m((List) unsafe.getObject(g2Var2, j11));
                    if (iM > 0) {
                        iA = com.google.android.gms.internal.measurement.k2.B(iM, n2.D0(i22 << 3), iM, iA);
                    }
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 49:
                    i15 = i18;
                    i16 = i21;
                    List list19 = (List) unsafe.getObject(g2Var2, j11);
                    x3 x3VarA4 = r3Var.A(i19);
                    u2 u2Var21 = y3.f33663a;
                    int size13 = list19.size();
                    if (size13 == 0) {
                        iC2 = 0;
                    } else {
                        iC2 = 0;
                        for (int i36 = 0; i36 < size13; i36++) {
                            g2 g2Var4 = (g2) list19.get(i36);
                            int iD014 = n2.D0(i22 << 3);
                            iC2 += g2Var4.c(x3VarA4) + iD014 + iD014;
                        }
                    }
                    iA += iC2;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 50:
                    int i37 = i19 / 3;
                    m3 m3Var = (m3) unsafe.getObject(g2Var2, j11);
                    l3 l3Var2 = (l3) r3Var.f33506b[i37 + i37];
                    if (m3Var.isEmpty()) {
                        iB = 0;
                    } else {
                        iB = 0;
                        for (Map.Entry entry : m3Var.entrySet()) {
                            char c12 = c11;
                            Object key = entry.getKey();
                            Object value = entry.getValue();
                            int i38 = i25;
                            mg.l lVar = l3Var2.f33448a;
                            int i39 = i27;
                            int iD015 = n2.D0(i22 << 3);
                            int i40 = i28;
                            o4 o4Var = (o4) lVar.f76309b;
                            o4 o4Var2 = (o4) lVar.f76310c;
                            int i41 = r2.f33500c;
                            int iD016 = n2.D0(i40);
                            int i42 = i18;
                            o4 o4Var3 = o4.f33470d;
                            if (o4Var == o4Var3) {
                                iD016 += iD016;
                            }
                            p4 p4Var = p4.f33481a;
                            int i43 = i21;
                            switch (o4Var.ordinal()) {
                                case 0:
                                    l3Var = l3Var2;
                                    ((Double) key).getClass();
                                    iE02 = i40;
                                    int i44 = iE02 + iD016;
                                    int iD017 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                        iD017 += iD017;
                                    }
                                    switch (o4Var2.ordinal()) {
                                        case 0:
                                            ((Double) value).getClass();
                                            iE03 = i40;
                                            int i45 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i45, i45, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 1:
                                            ((Float) value).getClass();
                                            iE03 = i39;
                                            int i452 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i452, i452, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 2:
                                            iE03 = n2.E0(((Long) value).longValue());
                                            int i4522 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i4522, i4522, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 3:
                                            iE03 = n2.E0(((Long) value).longValue());
                                            int i45222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i45222, i45222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 4:
                                            iE03 = n2.E0(((Integer) value).intValue());
                                            int i452222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i452222, i452222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 5:
                                            ((Long) value).getClass();
                                            iE03 = i40;
                                            int i4522222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i4522222, i4522222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 6:
                                            ((Integer) value).getClass();
                                            iE03 = i39;
                                            int i45222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i45222222, i45222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 7:
                                            ((Boolean) value).getClass();
                                            iE03 = i38;
                                            int i452222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i452222222, i452222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 8:
                                            if (value instanceof l2) {
                                                iB3 = ((l2) value).f();
                                                iD07 = n2.D0(iB3);
                                            } else {
                                                iB3 = l4.b((String) value);
                                                iD07 = n2.D0(iB3);
                                            }
                                            iE03 = iB3 + iD07;
                                            int i4522222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i4522222222, i4522222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 9:
                                            iE03 = ((g2) value).d();
                                            int i45222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i45222222222, i45222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 10:
                                            iB3 = ((g2) value).d();
                                            iD07 = n2.D0(iB3);
                                            iE03 = iB3 + iD07;
                                            int i452222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i452222222222, i452222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 11:
                                            if (value instanceof l2) {
                                                iB3 = ((l2) value).f();
                                                iD07 = n2.D0(iB3);
                                            } else {
                                                iB3 = ((byte[]) value).length;
                                                iD07 = n2.D0(iB3);
                                            }
                                            iE03 = iB3 + iD07;
                                            int i4522222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i4522222222222, i4522222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 12:
                                            iE03 = n2.D0(((Integer) value).intValue());
                                            int i45222222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i45222222222222, i45222222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 13:
                                            iE03 = value instanceof z2 ? n2.E0(((z2) value).zza()) : n2.E0(((Integer) value).intValue());
                                            int i452222222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i452222222222222, i452222222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 14:
                                            ((Integer) value).getClass();
                                            iE03 = i39;
                                            int i4522222222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i4522222222222222, i4522222222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 15:
                                            ((Long) value).getClass();
                                            iE03 = i40;
                                            int i45222222222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i45222222222222222, i45222222222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 16:
                                            int iIntValue = ((Integer) value).intValue();
                                            iE03 = n2.D0((iIntValue >> 31) ^ (iIntValue + iIntValue));
                                            int i452222222222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i452222222222222222, i452222222222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        case 17:
                                            long jLongValue = ((Long) value).longValue();
                                            iE03 = n2.E0((jLongValue >> c12) ^ (jLongValue + jLongValue));
                                            int i4522222222222222222 = iE03 + iD017 + i44;
                                            iB = com.google.android.gms.internal.measurement.k2.B(i4522222222222222222, i4522222222222222222, iD015, iB);
                                            c11 = c12;
                                            i25 = i38;
                                            i28 = i40;
                                            i27 = i39;
                                            i18 = i42;
                                            i21 = i43;
                                            l3Var2 = l3Var;
                                        default:
                                            throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                                    }
                                case 1:
                                    l3Var = l3Var2;
                                    ((Float) key).getClass();
                                    iE02 = i39;
                                    int i442 = iE02 + iD016;
                                    int iD0172 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 2:
                                    l3Var = l3Var2;
                                    iE02 = n2.E0(((Long) key).longValue());
                                    int i4422 = iE02 + iD016;
                                    int iD01722 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 3:
                                    l3Var = l3Var2;
                                    iE02 = n2.E0(((Long) key).longValue());
                                    int i44222 = iE02 + iD016;
                                    int iD017222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 4:
                                    l3Var = l3Var2;
                                    iE02 = n2.E0(((Integer) key).intValue());
                                    int i442222 = iE02 + iD016;
                                    int iD0172222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 5:
                                    l3Var = l3Var2;
                                    ((Long) key).getClass();
                                    iE02 = i40;
                                    int i4422222 = iE02 + iD016;
                                    int iD01722222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 6:
                                    l3Var = l3Var2;
                                    ((Integer) key).getClass();
                                    iE02 = i39;
                                    int i44222222 = iE02 + iD016;
                                    int iD017222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 7:
                                    l3Var = l3Var2;
                                    ((Boolean) key).getClass();
                                    iE02 = i38;
                                    int i442222222 = iE02 + iD016;
                                    int iD0172222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 8:
                                    l3Var = l3Var2;
                                    if (key instanceof l2) {
                                        iB2 = ((l2) key).f();
                                        iD06 = n2.D0(iB2);
                                    } else {
                                        iB2 = l4.b((String) key);
                                        iD06 = n2.D0(iB2);
                                    }
                                    iE02 = iB2 + iD06;
                                    int i4422222222 = iE02 + iD016;
                                    int iD01722222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 9:
                                    l3Var = l3Var2;
                                    iE02 = ((g2) key).d();
                                    int i44222222222 = iE02 + iD016;
                                    int iD017222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 10:
                                    l3Var = l3Var2;
                                    iB2 = ((g2) key).d();
                                    iD06 = n2.D0(iB2);
                                    iE02 = iB2 + iD06;
                                    int i442222222222 = iE02 + iD016;
                                    int iD0172222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 11:
                                    l3Var = l3Var2;
                                    if (key instanceof l2) {
                                        iB2 = ((l2) key).f();
                                        iD06 = n2.D0(iB2);
                                    } else {
                                        iB2 = ((byte[]) key).length;
                                        iD06 = n2.D0(iB2);
                                    }
                                    iE02 = iB2 + iD06;
                                    int i4422222222222 = iE02 + iD016;
                                    int iD01722222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 12:
                                    l3Var = l3Var2;
                                    iE02 = n2.D0(((Integer) key).intValue());
                                    int i44222222222222 = iE02 + iD016;
                                    int iD017222222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 13:
                                    if (key instanceof z2) {
                                        l3Var = l3Var2;
                                        iE02 = n2.E0(((z2) key).zza());
                                    } else {
                                        l3Var = l3Var2;
                                        iE02 = n2.E0(((Integer) key).intValue());
                                    }
                                    int i442222222222222 = iE02 + iD016;
                                    int iD0172222222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 14:
                                    ((Integer) key).getClass();
                                    l3Var = l3Var2;
                                    iE02 = i39;
                                    int i4422222222222222 = iE02 + iD016;
                                    int iD01722222222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 15:
                                    ((Long) key).getClass();
                                    l3Var = l3Var2;
                                    iE02 = i40;
                                    int i44222222222222222 = iE02 + iD016;
                                    int iD017222222222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 16:
                                    int iIntValue2 = ((Integer) key).intValue();
                                    iE02 = n2.D0((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
                                    l3Var = l3Var2;
                                    int i442222222222222222 = iE02 + iD016;
                                    int iD0172222222222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                case 17:
                                    long jLongValue2 = ((Long) key).longValue();
                                    iE02 = n2.E0((jLongValue2 + jLongValue2) ^ (jLongValue2 >> c12));
                                    l3Var = l3Var2;
                                    int i4422222222222222222 = iE02 + iD016;
                                    int iD01722222222222222222 = n2.D0(16);
                                    if (o4Var2 == o4Var3) {
                                    }
                                    switch (o4Var2.ordinal()) {
                                    }
                                default:
                                    throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                            }
                        }
                    }
                    i15 = i18;
                    i16 = i21;
                    iA += iB;
                    i18 = i15;
                    i21 = i16;
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 51:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 8, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 52:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 4, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 53:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        long jY = y(j11, g2Var2);
                        iD08 = n2.D0(i22 << 3);
                        iE04 = n2.E0(jY);
                        iA += iE04 + iD08;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 54:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        long jY2 = y(j11, g2Var2);
                        iD08 = n2.D0(i22 << 3);
                        iE04 = n2.E0(jY2);
                        iA += iE04 + iD08;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 55:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        long jU = u(j11, g2Var2);
                        iD08 = n2.D0(i22 << 3);
                        iE04 = n2.E0(jU);
                        iA += iE04 + iD08;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 56:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 8, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 57:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 4, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 58:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 1, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 59:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        int i46 = i22 << 3;
                        Object object3 = unsafe.getObject(g2Var2, j11);
                        if (object3 instanceof l2) {
                            int iD018 = n2.D0(i46);
                            int iF6 = ((l2) object3).f();
                            iA = com.google.android.gms.internal.measurement.k2.B(iF6, iF6, iD018, iA);
                        } else {
                            int iD019 = n2.D0(i46);
                            int iB7 = l4.b((String) object3);
                            iA = com.google.android.gms.internal.measurement.k2.B(iB7, iB7, iD019, iA);
                        }
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 60:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        Object object4 = unsafe.getObject(g2Var2, j11);
                        x3 x3VarA5 = r3Var.A(i19);
                        u2 u2Var22 = y3.f33663a;
                        int iD020 = n2.D0(i22 << 3);
                        int iC5 = ((g2) object4).c(x3VarA5);
                        iA = com.google.android.gms.internal.measurement.k2.B(iC5, iC5, iD020, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 61:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        l2 l2Var2 = (l2) unsafe.getObject(g2Var2, j11);
                        int iD021 = n2.D0(i22 << 3);
                        int iF7 = l2Var2.f();
                        iA = com.google.android.gms.internal.measurement.k2.B(iF7, iF7, iD021, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 62:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(u(j11, g2Var2), n2.D0(i22 << 3), iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 63:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        long jU2 = u(j11, g2Var2);
                        iD08 = n2.D0(i22 << 3);
                        iE04 = n2.E0(jU2);
                        iA += iE04 + iD08;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 64:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 4, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 65:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        iA = com.google.android.gms.internal.measurement.k2.A(i22 << 3, 8, iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 66:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        int iU = u(j11, g2Var2);
                        iA = com.google.android.gms.internal.measurement.k2.A((iU >> 31) ^ (iU + iU), n2.D0(i22 << 3), iA);
                    }
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
                case 67:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        long jY3 = y(j11, g2Var2);
                        iD08 = n2.D0(i22 << 3);
                        iE04 = n2.E0((jY3 >> 63) ^ (jY3 + jY3));
                        iA += iE04 + iD08;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                case 68:
                    if (r3Var.q(g2Var2, i22, i19)) {
                        g2 g2Var5 = (g2) unsafe.getObject(g2Var2, j11);
                        x3 x3VarA6 = r3Var.A(i19);
                        u2 u2Var23 = y3.f33663a;
                        int iD022 = n2.D0(i22 << 3);
                        i12 = iD022 + iD022;
                        iC = g2Var5.c(x3VarA6);
                        i11 = iC + i12;
                        iA += i11;
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    } else {
                        i19 += 3;
                        r3Var = this;
                        g2Var2 = g2Var;
                        i17 = 1048575;
                    }
                default:
                    i19 += 3;
                    r3Var = this;
                    g2Var2 = g2Var;
                    i17 = 1048575;
            }
        }
    }

    public final void h(int i5, Object obj, Object obj2) {
        if (n(obj2, i5)) {
            int iX = x(i5) & 1048575;
            Unsafe unsafe = f33504k;
            long j11 = iX;
            Object object = unsafe.getObject(obj2, j11);
            if (object == null) {
                throw new IllegalStateException(a80.m.f(this.f33505a[i5], "Source subfield ", " is present but null: ", obj2.toString()));
            }
            x3 x3VarA = A(i5);
            if (!n(obj, i5)) {
                if (p(object)) {
                    x2 x2VarZze = x3VarA.zze();
                    x3VarA.zzg(x2VarZze, object);
                    unsafe.putObject(obj, j11, x2VarZze);
                } else {
                    unsafe.putObject(obj, j11, object);
                }
                j(i5, obj);
                return;
            }
            Object object2 = unsafe.getObject(obj, j11);
            if (!p(object2)) {
                x2 x2VarZze2 = x3VarA.zze();
                x3VarA.zzg(x2VarZze2, object2);
                unsafe.putObject(obj, j11, x2VarZze2);
                object2 = x2VarZze2;
            }
            x3VarA.zzg(object2, object);
        }
    }

    public final void i(int i5, Object obj, Object obj2) {
        int[] iArr = this.f33505a;
        int i11 = iArr[i5];
        if (q(obj2, i11, i5)) {
            int iX = x(i5) & 1048575;
            Unsafe unsafe = f33504k;
            long j11 = iX;
            Object object = unsafe.getObject(obj2, j11);
            if (object == null) {
                throw new IllegalStateException(a80.m.f(iArr[i5], "Source subfield ", " is present but null: ", obj2.toString()));
            }
            x3 x3VarA = A(i5);
            if (!q(obj, i11, i5)) {
                if (p(object)) {
                    x2 x2VarZze = x3VarA.zze();
                    x3VarA.zzg(x2VarZze, object);
                    unsafe.putObject(obj, j11, x2VarZze);
                } else {
                    unsafe.putObject(obj, j11, object);
                }
                j4.j(obj, iArr[i5 + 2] & 1048575, i11);
                return;
            }
            Object object2 = unsafe.getObject(obj, j11);
            if (!p(object2)) {
                x2 x2VarZze2 = x3VarA.zze();
                x3VarA.zzg(x2VarZze2, object2);
                unsafe.putObject(obj, j11, x2VarZze2);
                object2 = x2VarZze2;
            }
            x3VarA.zzg(object2, object);
        }
    }

    public final void j(int i5, Object obj) {
        int i11 = this.f33505a[i5 + 2];
        long j11 = 1048575 & i11;
        if (j11 == 1048575) {
            return;
        }
        j4.j(obj, j11, (1 << (i11 >>> 20)) | j4.e(obj, j11));
    }

    public final void k(int i5, Object obj, Object obj2) {
        f33504k.putObject(obj, x(i5) & 1048575, obj2);
        j(i5, obj);
    }

    public final void l(Object obj, int i5, int i11, Object obj2) {
        f33504k.putObject(obj, x(i11) & 1048575, obj2);
        j4.j(obj, this.f33505a[i11 + 2] & 1048575, i5);
    }

    public final boolean m(x2 x2Var, x2 x2Var2, int i5) {
        return n(x2Var, i5) == n(x2Var2, i5);
    }

    public final boolean n(Object obj, int i5) {
        int i11 = this.f33505a[i5 + 2];
        long j11 = i11 & 1048575;
        if (j11 == 1048575) {
            int iX = x(i5);
            long j12 = iX & 1048575;
            switch (w(iX)) {
                case 0:
                    if (Double.doubleToRawLongBits(j4.f33428c.a(obj, j12)) == 0) {
                        return false;
                    }
                    break;
                case 1:
                    if (Float.floatToRawIntBits(j4.f33428c.b(obj, j12)) == 0) {
                        return false;
                    }
                    break;
                case 2:
                    if (j4.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 3:
                    if (j4.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 4:
                    if (j4.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 5:
                    if (j4.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 6:
                    if (j4.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 7:
                    return j4.f33428c.g(obj, j12);
                case 8:
                    Object objH = j4.h(obj, j12);
                    if (objH instanceof String) {
                        if (((String) objH).isEmpty()) {
                            return false;
                        }
                    } else {
                        if (!(objH instanceof l2)) {
                            throw new IllegalArgumentException();
                        }
                        if (l2.f33446b.equals(objH)) {
                            return false;
                        }
                    }
                    break;
                case 9:
                    if (j4.h(obj, j12) == null) {
                        return false;
                    }
                    break;
                case 10:
                    if (l2.f33446b.equals(j4.h(obj, j12))) {
                        return false;
                    }
                    break;
                case 11:
                    if (j4.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 12:
                    if (j4.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 13:
                    if (j4.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 14:
                    if (j4.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 15:
                    if (j4.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 16:
                    if (j4.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 17:
                    if (j4.h(obj, j12) == null) {
                        return false;
                    }
                    break;
                default:
                    throw new IllegalArgumentException();
            }
        } else {
            if ((j4.e(obj, j11) & (1 << (i11 >>> 20))) == 0) {
                return false;
            }
        }
        return true;
    }

    public final boolean o(Object obj, int i5, int i11, int i12, int i13) {
        return i11 == 1048575 ? n(obj, i5) : (i12 & i13) != 0;
    }

    public final boolean q(Object obj, int i5, int i11) {
        return j4.e(obj, (long) (this.f33505a[i11 + 2] & 1048575)) == i5;
    }

    /* JADX WARN: Code restructure failed: missing block: B:110:0x0373, code lost:
    
        r4 = r13;
        r7 = r15;
        r8 = r12;
        r15 = r35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x03d9, code lost:
    
        r2 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00f9, code lost:
    
        r6 = r45;
        r9 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00fc, code lost:
    
        r4 = r10;
        r7 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00fe, code lost:
    
        r10 = r13;
        r8 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:502:0x0bc9, code lost:
    
        throw new com.google.android.gms.internal.play_billing.zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x017c, code lost:
    
        r4 = r3;
        r3 = r2;
        r2 = r4;
     */
    /* JADX WARN: Removed duplicated region for block: B:655:0x10a9  */
    /* JADX WARN: Removed duplicated region for block: B:660:0x10b7  */
    /* JADX WARN: Removed duplicated region for block: B:661:0x10c9  */
    /* JADX WARN: Removed duplicated region for block: B:662:0x10da  */
    /* JADX WARN: Removed duplicated region for block: B:664:0x10e3  */
    /* JADX WARN: Removed duplicated region for block: B:666:0x10ec  */
    /* JADX WARN: Removed duplicated region for block: B:670:0x110a  */
    /* JADX WARN: Removed duplicated region for block: B:671:0x1116  */
    /* JADX WARN: Removed duplicated region for block: B:676:0x112f  */
    /* JADX WARN: Removed duplicated region for block: B:677:0x113a  */
    /* JADX WARN: Removed duplicated region for block: B:678:0x1141  */
    /* JADX WARN: Removed duplicated region for block: B:682:0x115b  */
    /* JADX WARN: Removed duplicated region for block: B:683:0x1162  */
    /* JADX WARN: Removed duplicated region for block: B:684:0x1168  */
    /* JADX WARN: Removed duplicated region for block: B:685:0x116f  */
    /* JADX WARN: Removed duplicated region for block: B:686:0x117b  */
    /* JADX WARN: Removed duplicated region for block: B:687:0x1186  */
    /* JADX WARN: Removed duplicated region for block: B:688:0x1191  */
    /* JADX WARN: Removed duplicated region for block: B:689:0x1198  */
    /* JADX WARN: Removed duplicated region for block: B:694:0x11bf  */
    /* JADX WARN: Removed duplicated region for block: B:778:0x0a9c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:780:0x0e75 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:804:0x0e84 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:806:0x0aaf A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:817:0x10b1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:818:0x11db A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int s(Object obj, byte[] bArr, int i5, int i11, int i12, com.google.android.gms.internal.measurement.q0 q0Var) {
        u2 u2Var;
        e4 e4Var;
        int[] iArr;
        int i13;
        Unsafe unsafe;
        String str;
        Object[] objArr;
        a3 a3VarZ;
        int i14;
        Iterator it;
        int iE0;
        int iB;
        int iD0;
        int iD02;
        int iE02;
        int iB2;
        int iD03;
        int i15;
        n2 n2Var;
        int i16;
        int iV;
        int i17;
        int i18;
        int i19;
        Object obj2;
        byte[] bArr2;
        com.google.android.gms.internal.measurement.q0 q0Var2;
        Unsafe unsafe2;
        Object obj3;
        int i21;
        int i22;
        int i23;
        int i24;
        byte[] bArr3;
        com.google.android.gms.internal.measurement.q0 q0Var3;
        int i25;
        int i26;
        Unsafe unsafe3;
        byte[] bArr4;
        com.google.android.gms.internal.measurement.q0 q0Var4;
        Object obj4;
        Unsafe unsafe4;
        byte[] bArr5;
        com.google.android.gms.internal.measurement.q0 q0Var5;
        byte[] bArr6;
        com.google.android.gms.internal.measurement.q0 q0Var6;
        String str2;
        e4 e4Var2;
        int i27;
        int i28;
        int iB0;
        int iE03;
        byte[] bArr7;
        com.google.android.gms.internal.measurement.q0 q0Var7;
        int i29;
        int iE04;
        int i31;
        com.google.android.gms.internal.measurement.q0 q0Var8;
        Object obj5;
        Object obj6;
        com.google.android.gms.internal.measurement.q0 q0Var9;
        com.google.android.gms.internal.measurement.q0 q0Var10;
        int i32;
        Unsafe unsafe5;
        int iB02;
        com.google.android.gms.internal.measurement.q0 q0Var11;
        int i33;
        int i34;
        int iB03;
        byte[] bArr8;
        int i35;
        int i36;
        com.google.android.gms.internal.measurement.q0 q0Var12;
        int i37;
        int iD04;
        c3 c3Var;
        int i38;
        int i39;
        byte[] bArr9;
        Unsafe unsafe6;
        int i40;
        int iB04;
        r3 r3Var = this;
        Object obj7 = obj;
        byte[] bArr10 = bArr;
        int i41 = i11;
        com.google.android.gms.internal.measurement.q0 q0Var13 = q0Var;
        if (!p(obj7)) {
            throw new IllegalArgumentException("Mutating immutable message: ".concat(String.valueOf(obj)));
        }
        Unsafe unsafe7 = f33504k;
        int iE05 = i5;
        int i42 = -1;
        int i43 = 0;
        int i44 = 1048575;
        int i45 = 0;
        int i46 = 0;
        while (true) {
            int i47 = 1048575;
            while (true) {
                Object[] objArr2 = r3Var.f33506b;
                u2Var = r3Var.f33513i;
                e4Var = e4.f33387f;
                int i48 = i43;
                iArr = r3Var.f33505a;
                if (iE05 < i41) {
                    int iC0 = iE05 + 1;
                    int i49 = bArr10[iE05];
                    if (i49 < 0) {
                        iC0 = cl.l0.c0(i49, iC0, q0Var13, bArr10);
                        i49 = q0Var13.f32977a;
                    }
                    int i51 = iC0;
                    i46 = i49;
                    int i52 = i46 >>> 3;
                    int i53 = r3Var.f33508d;
                    int i54 = r3Var.f33507c;
                    if (i52 > i42) {
                        iV = (i52 < i54 || i52 > i53) ? -1 : r3Var.v(i52, i48 / 3);
                        i16 = 0;
                    } else if (i52 < i54 || i52 > i53) {
                        i16 = 0;
                        iV = -1;
                    } else {
                        i16 = 0;
                        iV = r3Var.v(i52, 0);
                    }
                    if (iV != -1) {
                        int i55 = i46 & 7;
                        int i56 = iArr[iV + 1];
                        int iW = w(i56);
                        objArr = objArr2;
                        long j11 = i56 & i47;
                        Object obj8 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        if (iW > 17) {
                            Object obj9 = obj7;
                            Unsafe unsafe8 = unsafe7;
                            int i57 = iV;
                            int i58 = i45;
                            int i59 = i44;
                            if (iW != 27) {
                                obj2 = obj9;
                                if (iW > 49) {
                                    str = "Failed to parse the message.";
                                    i18 = i46;
                                    com.google.android.gms.internal.measurement.q0 q0Var14 = q0Var;
                                    i17 = i57;
                                    unsafe = unsafe8;
                                    e4Var2 = e4Var;
                                    i27 = i51;
                                    byte[] bArr11 = bArr;
                                    if (iW != 50) {
                                        long j12 = iArr[i17 + 2] & 1048575;
                                        switch (iW) {
                                            case 51:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 1) {
                                                    iB0 = i28 + 8;
                                                    unsafe.putObject(obj2, j11, Double.valueOf(Double.longBitsToDouble(cl.l0.i0(i28, bArr2))));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB0;
                                                    if (iE05 == i28) {
                                                        i44 = i59;
                                                        i13 = i12;
                                                        i19 = iE05;
                                                        i45 = i58;
                                                        break;
                                                    } else {
                                                        r3Var = this;
                                                        i44 = i59;
                                                        i41 = i11;
                                                        unsafe7 = unsafe;
                                                        bArr10 = bArr2;
                                                        q0Var13 = q0Var2;
                                                        i42 = i52;
                                                        obj7 = obj2;
                                                        i45 = i58;
                                                        i47 = 1048575;
                                                        i46 = i18;
                                                        i43 = i17;
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                            case 52:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 5) {
                                                    iB0 = i28 + 4;
                                                    unsafe.putObject(obj2, j11, Float.valueOf(Float.intBitsToFloat(cl.l0.U(i28, bArr2))));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB0;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 53:
                                            case 54:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 0) {
                                                    iE03 = cl.l0.e0(bArr2, i28, q0Var2);
                                                    unsafe.putObject(obj2, j11, Long.valueOf(q0Var2.f32978b));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iE03;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 55:
                                            case 62:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 0) {
                                                    iB0 = cl.l0.b0(bArr2, i28, q0Var2);
                                                    unsafe.putObject(obj2, j11, Integer.valueOf(q0Var2.f32977a));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB0;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 56:
                                            case 65:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 1) {
                                                    iB0 = i28 + 8;
                                                    unsafe.putObject(obj2, j11, Long.valueOf(cl.l0.i0(i28, bArr2)));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB0;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 57:
                                            case 64:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 5) {
                                                    iB0 = i28 + 4;
                                                    unsafe.putObject(obj2, j11, Integer.valueOf(cl.l0.U(i28, bArr2)));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB0;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 58:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                if (i55 == 0) {
                                                    iE03 = cl.l0.e0(bArr2, i28, q0Var2);
                                                    unsafe.putObject(obj2, j11, Boolean.valueOf(q0Var2.f32978b != 0));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iE03;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 59:
                                                bArr2 = bArr;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                q0Var2 = q0Var;
                                                if (i55 == 2) {
                                                    iB0 = cl.l0.b0(bArr2, i28, q0Var2);
                                                    int i61 = q0Var2.f32977a;
                                                    if (i61 == 0) {
                                                        unsafe.putObject(obj2, j11, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                                    } else {
                                                        int i62 = iB0 + i61;
                                                        if ((i56 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0 && !l4.c(iB0, i62, bArr2)) {
                                                            throw new zzgc("Protocol message had invalid UTF-8.");
                                                        }
                                                        unsafe.putObject(obj2, j11, new String(bArr2, iB0, i61, e3.f33385a));
                                                        iB0 = i62;
                                                    }
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB0;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 60:
                                                i52 = i52;
                                                if (i55 == 2) {
                                                    Object objC = r3Var.C(i52, i17, obj2);
                                                    e4Var = e4Var2;
                                                    int iG0 = cl.l0.g0(objC, r3Var.A(i17), bArr, i27, i11, q0Var);
                                                    r3Var.l(obj2, i52, i17, objC);
                                                    i17 = i17;
                                                    str = str;
                                                    q0Var2 = q0Var;
                                                    i28 = i27;
                                                    iE05 = iG0;
                                                    bArr2 = bArr;
                                                    if (iE05 == i28) {
                                                    }
                                                } else {
                                                    e4Var = e4Var2;
                                                    bArr2 = bArr;
                                                    i17 = i17;
                                                    str = str;
                                                    q0Var2 = q0Var;
                                                    i28 = i27;
                                                    iE05 = i28;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                break;
                                            case 61:
                                                bArr7 = bArr;
                                                q0Var7 = q0Var;
                                                i52 = i52;
                                                i29 = i17;
                                                if (i55 == 2) {
                                                    int iS = cl.l0.S(bArr7, i27, q0Var7);
                                                    unsafe.putObject(obj2, j11, q0Var7.f32979c);
                                                    unsafe.putInt(obj2, j12, i52);
                                                    bArr2 = bArr7;
                                                    iE05 = iS;
                                                    i17 = i29;
                                                    str = str;
                                                    i28 = i27;
                                                    e4Var = e4Var2;
                                                    q0Var2 = q0Var7;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                bArr2 = bArr7;
                                                i17 = i29;
                                                str = str;
                                                i28 = i27;
                                                e4Var = e4Var2;
                                                q0Var2 = q0Var7;
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 63:
                                                bArr7 = bArr;
                                                q0Var7 = q0Var;
                                                i52 = i52;
                                                i29 = i17;
                                                if (i55 == 0) {
                                                    int iB05 = cl.l0.b0(bArr7, i27, q0Var7);
                                                    int i63 = q0Var7.f32977a;
                                                    iE04 = iB05;
                                                    a3 a3VarZ2 = r3Var.z(i29);
                                                    if (a3VarZ2 == null || a3VarZ2.zza(i63)) {
                                                        unsafe.putObject(obj2, j11, Integer.valueOf(i63));
                                                        unsafe.putInt(obj2, j12, i52);
                                                    } else {
                                                        x2 x2Var = (x2) obj2;
                                                        e4 e4VarB = x2Var.zzc;
                                                        if (e4VarB == e4Var2) {
                                                            e4VarB = e4.b();
                                                            x2Var.zzc = e4VarB;
                                                        }
                                                        e4VarB.c(i18, Long.valueOf(i63));
                                                        e4Var2 = e4Var2;
                                                    }
                                                    bArr2 = bArr7;
                                                    i17 = i29;
                                                    str = str;
                                                    i28 = i27;
                                                    iE05 = iE04;
                                                    e4Var = e4Var2;
                                                    q0Var2 = q0Var7;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                bArr2 = bArr7;
                                                i17 = i29;
                                                str = str;
                                                i28 = i27;
                                                e4Var = e4Var2;
                                                q0Var2 = q0Var7;
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 66:
                                                bArr7 = bArr;
                                                q0Var7 = q0Var;
                                                i52 = i52;
                                                i29 = i17;
                                                if (i55 == 0) {
                                                    int iB06 = cl.l0.b0(bArr7, i27, q0Var7);
                                                    unsafe.putObject(obj2, j11, Integer.valueOf(com.google.android.gms.internal.consent_sdk.k0.H(q0Var7.f32977a)));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    iE05 = iB06;
                                                    i17 = i29;
                                                    str = str;
                                                    i28 = i27;
                                                    e4Var = e4Var2;
                                                    bArr2 = bArr7;
                                                    q0Var2 = q0Var7;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                bArr2 = bArr7;
                                                i17 = i29;
                                                str = str;
                                                i28 = i27;
                                                e4Var = e4Var2;
                                                q0Var2 = q0Var7;
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 67:
                                                bArr7 = bArr;
                                                q0Var7 = q0Var;
                                                i52 = i52;
                                                i29 = i17;
                                                if (i55 == 0) {
                                                    iE04 = cl.l0.e0(bArr7, i27, q0Var7);
                                                    long j13 = q0Var7.f32978b;
                                                    unsafe.putObject(obj2, j11, Long.valueOf((j13 >>> 1) ^ (-(j13 & 1))));
                                                    unsafe.putInt(obj2, j12, i52);
                                                    bArr2 = bArr7;
                                                    i17 = i29;
                                                    str = str;
                                                    i28 = i27;
                                                    iE05 = iE04;
                                                    e4Var = e4Var2;
                                                    q0Var2 = q0Var7;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                bArr2 = bArr7;
                                                i17 = i29;
                                                str = str;
                                                i28 = i27;
                                                e4Var = e4Var2;
                                                q0Var2 = q0Var7;
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                            case 68:
                                                if (i55 == 3) {
                                                    i52 = i52;
                                                    Object objC2 = r3Var.C(i52, i17, obj2);
                                                    q0Var2 = q0Var;
                                                    int iF0 = cl.l0.f0(objC2, r3Var.A(i17), bArr, i27, i11, (i18 & (-8)) | 4, q0Var2);
                                                    r3Var.l(obj2, i52, i17, objC2);
                                                    iE05 = iF0;
                                                    str = str;
                                                    i28 = i27;
                                                    e4Var = e4Var2;
                                                    bArr2 = bArr;
                                                    if (iE05 == i28) {
                                                    }
                                                } else {
                                                    i52 = i52;
                                                    bArr2 = bArr;
                                                    q0Var2 = q0Var;
                                                    str = str;
                                                    i28 = i27;
                                                    e4Var = e4Var2;
                                                    iE05 = i28;
                                                    if (iE05 == i28) {
                                                    }
                                                }
                                                break;
                                            default:
                                                bArr2 = bArr;
                                                q0Var2 = q0Var;
                                                str = str;
                                                i28 = i27;
                                                i52 = i52;
                                                e4Var = e4Var2;
                                                iE05 = i28;
                                                if (iE05 == i28) {
                                                }
                                                break;
                                        }
                                    } else if (i55 == 2) {
                                        int i64 = i17 / 3;
                                        Object obj10 = objArr[i64 + i64];
                                        Object object = unsafe.getObject(obj2, j11);
                                        if (!((m3) object).f33456a) {
                                            m3 m3VarA = m3.f33455b.a();
                                            u2.a(m3VarA, object);
                                            unsafe.putObject(obj2, j11, m3VarA);
                                            object = m3VarA;
                                        }
                                        mg.l lVar = ((l3) obj10).f33448a;
                                        m3 m3Var = (m3) object;
                                        int iB07 = cl.l0.b0(bArr11, i27, q0Var14);
                                        int i65 = q0Var14.f32977a;
                                        if (i65 >= 0 && i65 <= i11 - iB07) {
                                            int i66 = iB07 + i65;
                                            Object obj11 = lVar.f76311d;
                                            Object obj12 = obj11;
                                            while (iB07 < i66) {
                                                int iC02 = iB07 + 1;
                                                int i67 = bArr11[iB07];
                                                if (i67 < 0) {
                                                    iC02 = cl.l0.c0(i67, iC02, q0Var14, bArr11);
                                                    i67 = q0Var14.f32977a;
                                                }
                                                int i68 = i67 >>> 3;
                                                int i69 = i67 & 7;
                                                Object obj13 = obj12;
                                                if (i68 == 1) {
                                                    com.google.android.gms.internal.measurement.q0 q0Var15 = q0Var14;
                                                    obj6 = obj8;
                                                    q0Var9 = q0Var15;
                                                    o4 o4Var = (o4) lVar.f76309b;
                                                    if (i69 == o4Var.f33474b) {
                                                        int iR = r(bArr, iC02, i11, o4Var, null, q0Var9);
                                                        obj8 = q0Var9.f32979c;
                                                        iB07 = iR;
                                                        bArr11 = bArr;
                                                        q0Var14 = q0Var9;
                                                        obj12 = obj13;
                                                    } else {
                                                        i31 = i11;
                                                        q0Var8 = q0Var9;
                                                        obj5 = obj13;
                                                    }
                                                } else if (i68 != 2) {
                                                    i31 = i11;
                                                    q0Var8 = q0Var14;
                                                    obj5 = obj13;
                                                    obj6 = obj8;
                                                } else {
                                                    o4 o4Var2 = (o4) lVar.f76310c;
                                                    if (i69 == o4Var2.f33474b) {
                                                        com.google.android.gms.internal.measurement.q0 q0Var16 = q0Var14;
                                                        int iR2 = r(bArr, iC02, i11, o4Var2, obj11.getClass(), q0Var16);
                                                        obj12 = q0Var16.f32979c;
                                                        q0Var14 = q0Var16;
                                                        obj8 = obj8;
                                                        iB07 = iR2;
                                                        bArr11 = bArr;
                                                    } else {
                                                        com.google.android.gms.internal.measurement.q0 q0Var17 = q0Var14;
                                                        obj6 = obj8;
                                                        q0Var9 = q0Var17;
                                                        i31 = i11;
                                                        q0Var8 = q0Var9;
                                                        obj5 = obj13;
                                                    }
                                                }
                                                iB07 = cl.l0.h0(i67, bArr, iC02, i31, q0Var8);
                                                obj12 = obj5;
                                                bArr11 = bArr;
                                                obj8 = obj6;
                                                q0Var14 = q0Var8;
                                            }
                                            byte[] bArr12 = bArr11;
                                            Object obj14 = obj12;
                                            com.google.android.gms.internal.measurement.q0 q0Var18 = q0Var14;
                                            Object obj15 = obj8;
                                            if (iB07 != i66) {
                                                throw new zzgc(str);
                                            }
                                            m3Var.put(obj15, obj14);
                                            i44 = i59;
                                            if (i66 != i27) {
                                                unsafe7 = unsafe;
                                                q0Var13 = q0Var18;
                                                obj7 = obj2;
                                                i42 = i52;
                                                i45 = i58;
                                                i47 = 1048575;
                                                i41 = i11;
                                                bArr10 = bArr12;
                                                i46 = i18;
                                                iE05 = i66;
                                                i43 = i17;
                                            } else {
                                                i13 = i12;
                                                bArr2 = bArr12;
                                                q0Var2 = q0Var18;
                                                i19 = i66;
                                                i52 = i52;
                                                i45 = i58;
                                                e4Var = e4Var2;
                                            }
                                        }
                                    } else {
                                        bArr6 = bArr11;
                                        q0Var6 = q0Var14;
                                        str2 = str;
                                        i13 = i12;
                                        bArr2 = bArr6;
                                        q0Var2 = q0Var6;
                                        str = str2;
                                        i19 = i27;
                                        i52 = i52;
                                        i45 = i58;
                                        e4Var = e4Var2;
                                        i44 = i59;
                                    }
                                } else {
                                    String str3 = "Failed to parse the message.";
                                    long j14 = i56;
                                    c3 c3VarZzd = (c3) unsafe8.getObject(obj2, j11);
                                    if (!((h2) c3VarZzd).f33414a) {
                                        int size = c3VarZzd.size();
                                        c3VarZzd = c3VarZzd.zzd(size + size);
                                        unsafe8.putObject(obj2, j11, c3VarZzd);
                                    }
                                    c3 c3Var2 = c3VarZzd;
                                    switch (iW) {
                                        case 18:
                                        case 35:
                                            q0Var10 = q0Var;
                                            i17 = i57;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i32 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 != 2) {
                                                if (i55 == 1) {
                                                    if (c3Var2 != null) {
                                                        throw new ClassCastException();
                                                    }
                                                    cl.l0.i0(i32, bArr2);
                                                    throw null;
                                                }
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                    i13 = i12;
                                                    i19 = iE05;
                                                    q0Var2 = q0Var10;
                                                    i52 = i52;
                                                    i45 = i58;
                                                    unsafe = unsafe5;
                                                    e4Var = e4Var2;
                                                    break;
                                                } else {
                                                    i41 = i11;
                                                    bArr10 = bArr2;
                                                    q0Var13 = q0Var10;
                                                    obj7 = obj2;
                                                    i42 = i52;
                                                    i45 = i58;
                                                    unsafe7 = unsafe5;
                                                    i47 = 1048575;
                                                    i46 = i18;
                                                    i43 = i17;
                                                }
                                            } else {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                if (cl.l0.b0(bArr2, i32, q0Var10) + q0Var10.f32977a > bArr2.length) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                throw null;
                                            }
                                        case 19:
                                        case 36:
                                            q0Var10 = q0Var;
                                            i17 = i57;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i32 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 == 2) {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                if (cl.l0.b0(bArr2, i32, q0Var10) + q0Var10.f32977a > bArr2.length) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                throw null;
                                            }
                                            if (i55 == 5) {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                cl.l0.U(i32, bArr2);
                                                throw null;
                                            }
                                            iE05 = i32;
                                            i44 = i59;
                                            if (iE05 != i32) {
                                            }
                                            break;
                                        case 20:
                                        case 21:
                                        case 37:
                                        case 38:
                                            q0Var10 = q0Var;
                                            i17 = i57;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i32 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 != 2) {
                                                if (i55 == 0) {
                                                    if (c3Var2 != null) {
                                                        throw new ClassCastException();
                                                    }
                                                    cl.l0.e0(bArr2, i32, q0Var10);
                                                    throw null;
                                                }
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                iB02 = cl.l0.b0(bArr2, i32, q0Var10);
                                                int i71 = q0Var10.f32977a + iB02;
                                                if (iB02 < i71) {
                                                    cl.l0.e0(bArr2, iB02, q0Var10);
                                                    throw null;
                                                }
                                                if (iB02 != i71) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                iE05 = iB02;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 22:
                                        case 29:
                                        case 39:
                                        case 43:
                                            q0Var11 = q0Var;
                                            i17 = i57;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i33 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 == 2) {
                                                iE05 = cl.l0.Y(bArr2, i33, c3Var2, q0Var11);
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                if (i55 == 0) {
                                                    iB02 = cl.l0.d0(i18, bArr2, i33, i11, c3Var2, q0Var11);
                                                    i32 = i33;
                                                    q0Var10 = q0Var11;
                                                    iE05 = iB02;
                                                    i44 = i59;
                                                    if (iE05 != i32) {
                                                    }
                                                }
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 23:
                                        case 32:
                                        case 40:
                                        case 46:
                                            q0Var11 = q0Var;
                                            i17 = i57;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i33 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 == 2) {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                if (cl.l0.b0(bArr2, i33, q0Var11) + q0Var11.f32977a > bArr2.length) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                throw null;
                                            }
                                            if (i55 == 1) {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                cl.l0.i0(i33, bArr2);
                                                throw null;
                                            }
                                            q0Var10 = q0Var11;
                                            i32 = i33;
                                            iE05 = i32;
                                            i44 = i59;
                                            if (iE05 != i32) {
                                            }
                                            break;
                                        case 24:
                                        case 31:
                                        case 41:
                                        case 45:
                                            q0Var11 = q0Var;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i33 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 == 2) {
                                                y2 y2Var = (y2) c3Var2;
                                                int iB08 = cl.l0.b0(bArr2, i33, q0Var11);
                                                int i72 = q0Var11.f32977a;
                                                int i73 = iB08 + i72;
                                                if (i73 > bArr2.length) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                int i74 = (i72 / 4) + y2Var.f33662c;
                                                int length = y2Var.f33661b.length;
                                                if (i74 <= length) {
                                                    i17 = i57;
                                                    i34 = iB08;
                                                } else if (length != 0) {
                                                    while (length < i74) {
                                                        length = a80.m.e(length, 3, 2, 1, 10);
                                                        iB08 = iB08;
                                                        i57 = i57;
                                                    }
                                                    i17 = i57;
                                                    i34 = iB08;
                                                    y2Var.f33661b = Arrays.copyOf(y2Var.f33661b, length);
                                                } else {
                                                    i17 = i57;
                                                    i34 = iB08;
                                                    y2Var.f33661b = new int[Math.max(i74, 10)];
                                                }
                                                iB03 = i34;
                                                while (iB03 < i73) {
                                                    y2Var.e(cl.l0.U(iB03, bArr2));
                                                    iB03 += 4;
                                                }
                                                if (iB03 != i73) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                iE05 = iB03;
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                i17 = i57;
                                                if (i55 == 5) {
                                                    iE05 = i33 + 4;
                                                    y2 y2Var2 = (y2) c3Var2;
                                                    y2Var2.e(cl.l0.U(i33, bArr2));
                                                    while (iE05 < i11) {
                                                        int iB09 = cl.l0.b0(bArr2, iE05, q0Var11);
                                                        if (i18 == q0Var11.f32977a) {
                                                            y2Var2.e(cl.l0.U(iB09, bArr2));
                                                            iE05 = iB09 + 4;
                                                        } else {
                                                            q0Var10 = q0Var11;
                                                            i32 = i33;
                                                            i44 = i59;
                                                            if (iE05 != i32) {
                                                            }
                                                        }
                                                    }
                                                    q0Var10 = q0Var11;
                                                    i32 = i33;
                                                    i44 = i59;
                                                    if (iE05 != i32) {
                                                    }
                                                }
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 25:
                                        case 42:
                                            q0Var11 = q0Var;
                                            e4Var2 = e4Var;
                                            i18 = i46;
                                            i33 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 != 2) {
                                                if (i55 == 0) {
                                                    if (c3Var2 != null) {
                                                        throw new ClassCastException();
                                                    }
                                                    cl.l0.e0(bArr2, i33, q0Var11);
                                                    throw null;
                                                }
                                                i17 = i57;
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                int iB010 = cl.l0.b0(bArr2, i33, q0Var11);
                                                int i75 = q0Var11.f32977a + iB010;
                                                if (iB010 < i75) {
                                                    cl.l0.e0(bArr2, iB010, q0Var11);
                                                    throw null;
                                                }
                                                if (iB010 != i75) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                i17 = i57;
                                                iE05 = iB010;
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 26:
                                            q0Var11 = q0Var;
                                            i18 = i46;
                                            i33 = i51;
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            bArr2 = bArr;
                                            if (i55 != 2) {
                                                e4Var2 = e4Var;
                                                i17 = i57;
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else if ((j14 & 536870912) == 0) {
                                                int iB011 = cl.l0.b0(bArr2, i33, q0Var11);
                                                int i76 = q0Var11.f32977a;
                                                if (i76 < 0) {
                                                    throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                                }
                                                if (i76 == 0) {
                                                    c3Var2.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                                } else {
                                                    c3Var2.add(new String(bArr2, iB011, i76, e3.f33385a));
                                                    iB011 += i76;
                                                }
                                                while (iB011 < i11) {
                                                    int iB012 = cl.l0.b0(bArr2, iB011, q0Var11);
                                                    if (i18 == q0Var11.f32977a) {
                                                        iB011 = cl.l0.b0(bArr2, iB012, q0Var11);
                                                        int i77 = q0Var11.f32977a;
                                                        if (i77 < 0) {
                                                            throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                                        }
                                                        if (i77 == 0) {
                                                            c3Var2.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                                        } else {
                                                            c3Var2.add(new String(bArr2, iB011, i77, e3.f33385a));
                                                            iB011 += i77;
                                                        }
                                                    } else {
                                                        i17 = i57;
                                                        iE05 = iB011;
                                                        q0Var10 = q0Var11;
                                                        e4Var2 = e4Var;
                                                        i32 = i33;
                                                        i44 = i59;
                                                        if (iE05 != i32) {
                                                        }
                                                    }
                                                }
                                                i17 = i57;
                                                iE05 = iB011;
                                                q0Var10 = q0Var11;
                                                e4Var2 = e4Var;
                                                i32 = i33;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                iB03 = cl.l0.b0(bArr2, i33, q0Var11);
                                                int i78 = q0Var11.f32977a;
                                                if (i78 < 0) {
                                                    throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                                }
                                                if (i78 == 0) {
                                                    c3Var2.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                                    e4Var2 = e4Var;
                                                } else {
                                                    int i79 = iB03 + i78;
                                                    if (!l4.c(iB03, i79, bArr2)) {
                                                        throw new zzgc("Protocol message had invalid UTF-8.");
                                                    }
                                                    e4Var2 = e4Var;
                                                    c3Var2.add(new String(bArr2, iB03, i78, e3.f33385a));
                                                    iB03 = i79;
                                                }
                                                while (iB03 < i11) {
                                                    int iB013 = cl.l0.b0(bArr2, iB03, q0Var11);
                                                    if (i18 == q0Var11.f32977a) {
                                                        iB03 = cl.l0.b0(bArr2, iB013, q0Var11);
                                                        int i81 = q0Var11.f32977a;
                                                        if (i81 < 0) {
                                                            throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                                        }
                                                        if (i81 == 0) {
                                                            c3Var2.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                                        } else {
                                                            int i82 = iB03 + i81;
                                                            if (!l4.c(iB03, i82, bArr2)) {
                                                                throw new zzgc("Protocol message had invalid UTF-8.");
                                                            }
                                                            c3Var2.add(new String(bArr2, iB03, i81, e3.f33385a));
                                                            iB03 = i82;
                                                        }
                                                    } else {
                                                        i17 = i57;
                                                        iE05 = iB03;
                                                        q0Var10 = q0Var11;
                                                        i32 = i33;
                                                        i44 = i59;
                                                        if (iE05 != i32) {
                                                        }
                                                    }
                                                }
                                                i17 = i57;
                                                iE05 = iB03;
                                                q0Var10 = q0Var11;
                                                i32 = i33;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 27:
                                            unsafe5 = unsafe8;
                                            str = str3;
                                            if (i55 == 2) {
                                                int iX = cl.l0.X(r3Var.A(i57), i46, bArr, i51, i11, c3Var2, q0Var);
                                                i17 = i57;
                                                i18 = i46;
                                                bArr2 = bArr;
                                                q0Var10 = q0Var;
                                                e4Var2 = e4Var;
                                                i32 = i51;
                                                iE05 = iX;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                i33 = i51;
                                                i18 = i46;
                                                i17 = i57;
                                                bArr2 = bArr;
                                                q0Var10 = q0Var;
                                                e4Var2 = e4Var;
                                                i32 = i33;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 28:
                                            bArr8 = bArr;
                                            i35 = i51;
                                            unsafe5 = unsafe8;
                                            i36 = i46;
                                            str = str3;
                                            if (i55 == 2) {
                                                int iB014 = cl.l0.b0(bArr8, i35, q0Var);
                                                int i83 = q0Var.f32977a;
                                                if (i83 < 0) {
                                                    throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                                }
                                                if (i83 > bArr8.length - iB014) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                if (i83 == 0) {
                                                    c3Var2.add(l2.f33446b);
                                                } else {
                                                    c3Var2.add(l2.l(iB014, i83, bArr8));
                                                    iB014 += i83;
                                                }
                                                while (iB014 < i11) {
                                                    int iB015 = cl.l0.b0(bArr8, iB014, q0Var);
                                                    if (i36 == q0Var.f32977a) {
                                                        iB014 = cl.l0.b0(bArr8, iB015, q0Var);
                                                        int i84 = q0Var.f32977a;
                                                        if (i84 < 0) {
                                                            throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                                        }
                                                        if (i84 > bArr8.length - iB014) {
                                                            throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                        }
                                                        if (i84 == 0) {
                                                            c3Var2.add(l2.f33446b);
                                                        } else {
                                                            c3Var2.add(l2.l(iB014, i84, bArr8));
                                                            iB014 += i84;
                                                        }
                                                    } else {
                                                        i17 = i57;
                                                        iE05 = iB014;
                                                        q0Var10 = q0Var;
                                                        e4Var2 = e4Var;
                                                        i32 = i35;
                                                        i18 = i36;
                                                        bArr2 = bArr8;
                                                        i44 = i59;
                                                        if (iE05 != i32) {
                                                        }
                                                    }
                                                }
                                                i17 = i57;
                                                iE05 = iB014;
                                                q0Var10 = q0Var;
                                                e4Var2 = e4Var;
                                                i32 = i35;
                                                i18 = i36;
                                                bArr2 = bArr8;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                i17 = i57;
                                                q0Var10 = q0Var;
                                                e4Var2 = e4Var;
                                                i32 = i35;
                                                i18 = i36;
                                                bArr2 = bArr8;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        case 30:
                                        case 44:
                                            bArr8 = bArr;
                                            q0Var12 = q0Var;
                                            Unsafe unsafe9 = unsafe8;
                                            i37 = i51;
                                            if (i55 == 2) {
                                                int iY = cl.l0.Y(bArr8, i37, c3Var2, q0Var12);
                                                c3Var = c3Var2;
                                                i35 = i37;
                                                iD04 = iY;
                                                i36 = i46;
                                            } else if (i55 == 0) {
                                                iD04 = cl.l0.d0(i46, bArr8, i37, i11, c3Var2, q0Var12);
                                                i36 = i46;
                                                bArr8 = bArr8;
                                                i35 = i37;
                                                c3Var = c3Var2;
                                            } else {
                                                str = str3;
                                                unsafe5 = unsafe9;
                                                i17 = i57;
                                                bArr2 = bArr8;
                                                e4Var2 = e4Var;
                                                i18 = i46;
                                                q0Var10 = q0Var12;
                                                i32 = i37;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            a3 a3VarZ3 = r3Var.z(i57);
                                            u2 u2Var2 = y3.f33663a;
                                            if (a3VarZ3 == null) {
                                                i38 = iD04;
                                                str = str3;
                                                unsafe5 = unsafe9;
                                            } else if (c3Var != null) {
                                                int size2 = c3Var.size();
                                                i38 = iD04;
                                                int i85 = 0;
                                                int i86 = 0;
                                                e4 e4Var3 = null;
                                                while (i86 < size2) {
                                                    String str4 = str3;
                                                    Integer num = (Integer) c3Var.get(i86);
                                                    Unsafe unsafe10 = unsafe9;
                                                    int iIntValue = num.intValue();
                                                    if (a3VarZ3.zza(iIntValue)) {
                                                        if (i86 != i85) {
                                                            c3Var.set(i85, num);
                                                        }
                                                        i85++;
                                                        i39 = i86;
                                                    } else {
                                                        if (e4Var3 == null) {
                                                            u2Var.getClass();
                                                            x2 x2Var2 = (x2) obj2;
                                                            i39 = i86;
                                                            e4 e4VarB2 = x2Var2.zzc;
                                                            if (e4VarB2 == e4Var) {
                                                                e4VarB2 = e4.b();
                                                                x2Var2.zzc = e4VarB2;
                                                            }
                                                            e4Var3 = e4VarB2;
                                                        } else {
                                                            i39 = i86;
                                                        }
                                                        e4 e4Var4 = e4Var3;
                                                        e4Var4.c(i52 << 3, Long.valueOf(iIntValue));
                                                        e4Var3 = e4Var4;
                                                    }
                                                    i86 = i39 + 1;
                                                    str3 = str4;
                                                    unsafe9 = unsafe10;
                                                }
                                                str = str3;
                                                unsafe5 = unsafe9;
                                                if (i85 != size2) {
                                                    c3Var.subList(i85, size2).clear();
                                                }
                                            } else {
                                                i38 = iD04;
                                                str = str3;
                                                unsafe5 = unsafe9;
                                                Iterator it2 = c3Var.iterator();
                                                e4 e4Var5 = null;
                                                while (it2.hasNext()) {
                                                    int iIntValue2 = ((Integer) it2.next()).intValue();
                                                    if (!a3VarZ3.zza(iIntValue2)) {
                                                        if (e4Var5 == null) {
                                                            u2Var.getClass();
                                                            x2 x2Var3 = (x2) obj2;
                                                            e4 e4VarB3 = x2Var3.zzc;
                                                            if (e4VarB3 == e4Var) {
                                                                e4VarB3 = e4.b();
                                                                x2Var3.zzc = e4VarB3;
                                                            }
                                                            e4Var5 = e4VarB3;
                                                        }
                                                        e4Var5.c(i52 << 3, Long.valueOf(iIntValue2));
                                                        it2.remove();
                                                    }
                                                }
                                            }
                                            i17 = i57;
                                            q0Var10 = q0Var12;
                                            e4Var2 = e4Var;
                                            iE05 = i38;
                                            i32 = i35;
                                            i18 = i36;
                                            bArr2 = bArr8;
                                            i44 = i59;
                                            if (iE05 != i32) {
                                            }
                                            break;
                                        case 33:
                                        case 47:
                                            bArr9 = bArr;
                                            q0Var12 = q0Var;
                                            unsafe6 = unsafe8;
                                            i40 = i46;
                                            i37 = i51;
                                            if (i55 == 2) {
                                                y2 y2Var3 = (y2) c3Var2;
                                                iB04 = cl.l0.b0(bArr9, i37, q0Var12);
                                                int i87 = q0Var12.f32977a + iB04;
                                                while (iB04 < i87) {
                                                    iB04 = cl.l0.b0(bArr9, iB04, q0Var12);
                                                    y2Var3.e(com.google.android.gms.internal.consent_sdk.k0.H(q0Var12.f32977a));
                                                }
                                                if (iB04 != i87) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                            } else {
                                                if (i55 == 0) {
                                                    y2 y2Var4 = (y2) c3Var2;
                                                    iB04 = cl.l0.b0(bArr9, i37, q0Var12);
                                                    y2Var4.e(com.google.android.gms.internal.consent_sdk.k0.H(q0Var12.f32977a));
                                                    while (iB04 < i11) {
                                                        int iB016 = cl.l0.b0(bArr9, iB04, q0Var12);
                                                        if (i40 == q0Var12.f32977a) {
                                                            iB04 = cl.l0.b0(bArr9, iB016, q0Var12);
                                                            y2Var4.e(com.google.android.gms.internal.consent_sdk.k0.H(q0Var12.f32977a));
                                                        }
                                                    }
                                                }
                                                i17 = i57;
                                                bArr2 = bArr9;
                                                str = str3;
                                                e4Var2 = e4Var;
                                                i18 = i40;
                                                unsafe5 = unsafe6;
                                                q0Var10 = q0Var12;
                                                i32 = i37;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            i17 = i57;
                                            iE05 = iB04;
                                            str = str3;
                                            e4Var2 = e4Var;
                                            i18 = i40;
                                            unsafe5 = unsafe6;
                                            bArr2 = bArr9;
                                            q0Var10 = q0Var12;
                                            i32 = i37;
                                            i44 = i59;
                                            if (iE05 != i32) {
                                            }
                                            break;
                                        case 34:
                                        case 48:
                                            bArr9 = bArr;
                                            q0Var12 = q0Var;
                                            unsafe6 = unsafe8;
                                            i40 = i46;
                                            i37 = i51;
                                            if (i55 != 2) {
                                                if (i55 == 0) {
                                                    if (c3Var2 != null) {
                                                        throw new ClassCastException();
                                                    }
                                                    cl.l0.e0(bArr9, i37, q0Var12);
                                                    throw null;
                                                }
                                                i17 = i57;
                                                bArr2 = bArr9;
                                                str = str3;
                                                e4Var2 = e4Var;
                                                i18 = i40;
                                                unsafe5 = unsafe6;
                                                q0Var10 = q0Var12;
                                                i32 = i37;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                if (c3Var2 != null) {
                                                    throw new ClassCastException();
                                                }
                                                iB04 = cl.l0.b0(bArr9, i37, q0Var12);
                                                int i88 = q0Var12.f32977a + iB04;
                                                if (iB04 < i88) {
                                                    cl.l0.e0(bArr9, iB04, q0Var12);
                                                    throw null;
                                                }
                                                if (iB04 != i88) {
                                                    throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                                }
                                                i17 = i57;
                                                iE05 = iB04;
                                                str = str3;
                                                e4Var2 = e4Var;
                                                i18 = i40;
                                                unsafe5 = unsafe6;
                                                bArr2 = bArr9;
                                                q0Var10 = q0Var12;
                                                i32 = i37;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                        default:
                                            if (i55 == 3) {
                                                int i89 = (i46 & (-8)) | 4;
                                                x3 x3VarA = r3Var.A(i57);
                                                x2 x2VarZze = x3VarA.zze();
                                                byte[] bArr13 = bArr;
                                                int i91 = i51;
                                                int iF02 = cl.l0.f0(x2VarZze, x3VarA, bArr13, i91, i11, i89, q0Var);
                                                int i92 = i89;
                                                q0Var12 = q0Var;
                                                x3VarA.b(x2VarZze);
                                                q0Var12.f32979c = x2VarZze;
                                                c3Var2.add(x2VarZze);
                                                while (true) {
                                                    if (iF02 < i11) {
                                                        int i93 = i91;
                                                        int iB017 = cl.l0.b0(bArr13, iF02, q0Var12);
                                                        if (i46 == q0Var12.f32977a) {
                                                            int i94 = i92;
                                                            x2 x2VarZze2 = x3VarA.zze();
                                                            iF02 = cl.l0.f0(x2VarZze2, x3VarA, bArr13, iB017, i11, i94, q0Var);
                                                            byte[] bArr14 = bArr13;
                                                            x3 x3Var = x3VarA;
                                                            q0Var12 = q0Var;
                                                            x3Var.b(x2VarZze2);
                                                            q0Var12.f32979c = x2VarZze2;
                                                            c3Var2.add(x2VarZze2);
                                                            bArr13 = bArr14;
                                                            i92 = i94;
                                                            x3VarA = x3Var;
                                                            i91 = i93;
                                                        } else {
                                                            i37 = i93;
                                                        }
                                                    } else {
                                                        i37 = i91;
                                                    }
                                                }
                                                i17 = i57;
                                                bArr2 = bArr13;
                                                str = str3;
                                                e4Var2 = e4Var;
                                                i18 = i46;
                                                unsafe5 = unsafe8;
                                                iE05 = iF02;
                                                q0Var10 = q0Var12;
                                                i32 = i37;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            } else {
                                                q0Var10 = q0Var;
                                                i17 = i57;
                                                e4Var2 = e4Var;
                                                i18 = i46;
                                                i32 = i51;
                                                unsafe5 = unsafe8;
                                                str = str3;
                                                bArr2 = bArr;
                                                iE05 = i32;
                                                i44 = i59;
                                                if (iE05 != i32) {
                                                }
                                            }
                                            break;
                                    }
                                }
                            } else if (i55 == 2) {
                                c3 c3VarZzd2 = (c3) unsafe8.getObject(obj9, j11);
                                if (!((h2) c3VarZzd2).f33414a) {
                                    int size3 = c3VarZzd2.size();
                                    c3VarZzd2 = c3VarZzd2.zzd(size3 == 0 ? 10 : size3 + size3);
                                    unsafe8.putObject(obj9, j11, c3VarZzd2);
                                }
                                c3 c3Var3 = c3VarZzd2;
                                bArr10 = bArr;
                                i41 = i11;
                                iE05 = cl.l0.X(r3Var.A(i57), i46, bArr10, i51, i41, c3Var3, q0Var);
                                i44 = i59;
                                q0Var13 = q0Var;
                                i43 = i57;
                                obj7 = obj;
                                i42 = i52;
                                i45 = i58;
                                i47 = 1048575;
                                i46 = i46;
                                unsafe7 = unsafe8;
                            } else {
                                obj2 = obj9;
                                bArr6 = bArr;
                                q0Var6 = q0Var;
                                str2 = "Failed to parse the message.";
                                e4Var2 = e4Var;
                                i18 = i46;
                                i27 = i51;
                                i17 = i57;
                                unsafe = unsafe8;
                                i13 = i12;
                                bArr2 = bArr6;
                                q0Var2 = q0Var6;
                                str = str2;
                                i19 = i27;
                                i52 = i52;
                                i45 = i58;
                                e4Var = e4Var2;
                                i44 = i59;
                            }
                        } else {
                            int i95 = iArr[iV + 2];
                            int i96 = 1 << (i95 >>> 20);
                            int i97 = i95 & i47;
                            if (i97 != i44) {
                                int i98 = i47;
                                if (i44 != i98) {
                                    unsafe7.putInt(obj7, i44, i45);
                                    i98 = 1048575;
                                }
                                i45 = i97 == i98 ? 0 : unsafe7.getInt(obj7, i97);
                            } else {
                                i97 = i44;
                            }
                            switch (iW) {
                                case 0:
                                    r3Var = this;
                                    unsafe3 = unsafe7;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr4 = bArr;
                                    i25 = i46;
                                    q0Var4 = q0Var;
                                    if (i55 == 1) {
                                        i45 = i23 | i96;
                                        j4.f33428c.e(obj7, j11, Double.longBitsToDouble(cl.l0.i0(i24, bArr4)));
                                        i44 = i22;
                                        i41 = i11;
                                        i43 = i21;
                                        iE05 = i24 + 8;
                                        break;
                                    }
                                    obj4 = obj7;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 1:
                                    r3Var = this;
                                    unsafe3 = unsafe7;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr4 = bArr;
                                    i25 = i46;
                                    q0Var4 = q0Var;
                                    if (i55 == 5) {
                                        i45 = i23 | i96;
                                        j4.f33428c.f(obj7, j11, Float.intBitsToFloat(cl.l0.U(i24, bArr4)));
                                        i44 = i22;
                                        i41 = i11;
                                        i43 = i21;
                                        iE05 = i24 + 4;
                                        break;
                                    }
                                    obj4 = obj7;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 2:
                                case 3:
                                    r3Var = this;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr4 = bArr;
                                    i25 = i46;
                                    q0Var4 = q0Var;
                                    if (i55 == 0) {
                                        i45 = i23 | i96;
                                        int iE06 = cl.l0.e0(bArr4, i24, q0Var4);
                                        unsafe7.putLong(obj7, j11, q0Var4.f32978b);
                                        i44 = i22;
                                        i41 = i11;
                                        i43 = i21;
                                        iE05 = iE06;
                                        break;
                                    }
                                    unsafe3 = unsafe7;
                                    obj4 = obj7;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 4:
                                case 11:
                                    r3Var = this;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr4 = bArr;
                                    i25 = i46;
                                    q0Var4 = q0Var;
                                    if (i55 == 0) {
                                        i45 = i23 | i96;
                                        iE05 = cl.l0.b0(bArr4, i24, q0Var4);
                                        unsafe7.putInt(obj7, j11, q0Var4.f32977a);
                                        i44 = i22;
                                        i41 = i11;
                                        i43 = i21;
                                        break;
                                    }
                                    unsafe3 = unsafe7;
                                    obj4 = obj7;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 5:
                                case 14:
                                    r3Var = this;
                                    unsafe2 = unsafe7;
                                    obj3 = obj7;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr3 = bArr;
                                    q0Var3 = q0Var;
                                    i25 = i46;
                                    if (i55 != 1) {
                                        bArr4 = bArr3;
                                        q0Var4 = q0Var3;
                                        unsafe3 = unsafe2;
                                        obj4 = obj3;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        long jI0 = cl.l0.i0(i24, bArr3);
                                        obj7 = obj3;
                                        unsafe7 = unsafe2;
                                        unsafe7.putLong(obj7, j11, jI0);
                                        i44 = i22;
                                        i41 = i11;
                                        iE05 = i24 + 8;
                                        i45 = i23 | i96;
                                        bArr10 = bArr3;
                                        q0Var13 = q0Var3;
                                        i42 = i52;
                                        i46 = i25;
                                        i47 = 1048575;
                                        i43 = i21;
                                    }
                                case 6:
                                case 13:
                                    r3Var = this;
                                    unsafe2 = unsafe7;
                                    obj3 = obj7;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr3 = bArr;
                                    q0Var3 = q0Var;
                                    i25 = i46;
                                    if (i55 != 5) {
                                        bArr4 = bArr3;
                                        q0Var4 = q0Var3;
                                        unsafe3 = unsafe2;
                                        obj4 = obj3;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        unsafe2.putInt(obj3, j11, cl.l0.U(i24, bArr3));
                                        i43 = i21;
                                        iE05 = i24 + 4;
                                        i45 = i23 | i96;
                                        i42 = i52;
                                        i46 = i25;
                                        i47 = 1048575;
                                        bArr10 = bArr3;
                                        q0Var13 = q0Var3;
                                        unsafe7 = unsafe2;
                                        obj7 = obj3;
                                        i44 = i22;
                                        i41 = i11;
                                    }
                                case 7:
                                    r3Var = this;
                                    unsafe2 = unsafe7;
                                    obj3 = obj7;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr3 = bArr;
                                    q0Var3 = q0Var;
                                    i25 = i46;
                                    if (i55 != 0) {
                                        bArr4 = bArr3;
                                        q0Var4 = q0Var3;
                                        unsafe3 = unsafe2;
                                        obj4 = obj3;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        int i99 = i23 | i96;
                                        iE05 = cl.l0.e0(bArr3, i24, q0Var3);
                                        j4.f33428c.c(obj3, j11, q0Var3.f32978b != 0);
                                        i43 = i21;
                                        q0Var13 = q0Var3;
                                        i45 = i99;
                                        obj7 = obj3;
                                        i42 = i52;
                                        i46 = i25;
                                        i47 = 1048575;
                                        i44 = i22;
                                        bArr10 = bArr3;
                                        unsafe7 = unsafe2;
                                        i41 = i11;
                                    }
                                case 8:
                                    r3Var = this;
                                    unsafe2 = unsafe7;
                                    obj3 = obj7;
                                    i21 = iV;
                                    i22 = i97;
                                    i23 = i45;
                                    i24 = i51;
                                    bArr3 = bArr;
                                    q0Var3 = q0Var;
                                    i25 = i46;
                                    if (i55 != 2) {
                                        bArr4 = bArr3;
                                        q0Var4 = q0Var3;
                                        unsafe3 = unsafe2;
                                        obj4 = obj3;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        if ((i56 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0) {
                                            iE05 = cl.l0.Z(bArr3, i24, q0Var3);
                                            i26 = i23 | i96;
                                        } else {
                                            int iB018 = cl.l0.b0(bArr3, i24, q0Var3);
                                            int i100 = q0Var3.f32977a;
                                            if (i100 < 0) {
                                                throw new zzgc("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                                            }
                                            i26 = i23 | i96;
                                            if (i100 == 0) {
                                                q0Var3.f32979c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                            } else {
                                                q0Var3.f32979c = new String(bArr3, iB018, i100, e3.f33385a);
                                                iB018 += i100;
                                            }
                                            iE05 = iB018;
                                        }
                                        unsafe2.putObject(obj3, j11, q0Var3.f32979c);
                                        i43 = i21;
                                        bArr10 = bArr3;
                                        q0Var13 = q0Var3;
                                        unsafe7 = unsafe2;
                                        i45 = i26;
                                        obj7 = obj3;
                                        i42 = i52;
                                        i46 = i25;
                                        i47 = 1048575;
                                        i44 = i22;
                                        i41 = i11;
                                    }
                                case 9:
                                    Object obj16 = obj7;
                                    Unsafe unsafe11 = unsafe7;
                                    r3Var = this;
                                    i21 = iV;
                                    i24 = i51;
                                    if (i55 != 2) {
                                        obj3 = obj16;
                                        unsafe3 = unsafe11;
                                        i22 = i97;
                                        i23 = i45;
                                        i25 = i46;
                                        bArr4 = bArr;
                                        q0Var4 = q0Var;
                                        obj4 = obj3;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        i45 |= i96;
                                        Object objB = r3Var.B(i21, obj16);
                                        q0Var13 = q0Var;
                                        i41 = i11;
                                        iE05 = cl.l0.g0(objB, r3Var.A(i21), bArr, i24, i41, q0Var13);
                                        r3Var.k(i21, obj16, objB);
                                        i43 = i21;
                                        bArr10 = bArr;
                                        obj7 = obj16;
                                        unsafe7 = unsafe11;
                                        break;
                                    }
                                case 10:
                                    Object obj17 = obj7;
                                    unsafe4 = unsafe7;
                                    obj4 = obj17;
                                    r3Var = this;
                                    bArr5 = bArr;
                                    q0Var5 = q0Var;
                                    i21 = iV;
                                    i24 = i51;
                                    if (i55 == 2) {
                                        i45 |= i96;
                                        iE05 = cl.l0.S(bArr5, i24, q0Var5);
                                        unsafe4.putObject(obj4, j11, q0Var5.f32979c);
                                        break;
                                    }
                                    i22 = i97;
                                    i23 = i45;
                                    i25 = i46;
                                    bArr4 = bArr5;
                                    q0Var4 = q0Var5;
                                    unsafe3 = unsafe4;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 12:
                                    Object obj18 = obj7;
                                    unsafe4 = unsafe7;
                                    obj4 = obj18;
                                    r3Var = this;
                                    bArr5 = bArr;
                                    q0Var5 = q0Var;
                                    i21 = iV;
                                    i24 = i51;
                                    if (i55 == 0) {
                                        iE05 = cl.l0.b0(bArr5, i24, q0Var5);
                                        int i101 = q0Var5.f32977a;
                                        a3 a3VarZ4 = r3Var.z(i21);
                                        if ((i56 & Integer.MIN_VALUE) != 0 && a3VarZ4 != null && !a3VarZ4.zza(i101)) {
                                            x2 x2Var4 = (x2) obj4;
                                            e4 e4VarB4 = x2Var4.zzc;
                                            if (e4VarB4 == e4Var) {
                                                e4VarB4 = e4.b();
                                                x2Var4.zzc = e4VarB4;
                                            }
                                            e4VarB4.c(i46, Long.valueOf(i101));
                                            break;
                                        } else {
                                            i45 |= i96;
                                            unsafe4.putInt(obj4, j11, i101);
                                            break;
                                        }
                                    }
                                    i22 = i97;
                                    i23 = i45;
                                    i25 = i46;
                                    bArr4 = bArr5;
                                    q0Var4 = q0Var5;
                                    unsafe3 = unsafe4;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 15:
                                    Object obj19 = obj7;
                                    unsafe4 = unsafe7;
                                    obj4 = obj19;
                                    r3Var = this;
                                    bArr5 = bArr;
                                    q0Var5 = q0Var;
                                    i21 = iV;
                                    i24 = i51;
                                    if (i55 == 0) {
                                        i45 |= i96;
                                        iE05 = cl.l0.b0(bArr5, i24, q0Var5);
                                        unsafe4.putInt(obj4, j11, com.google.android.gms.internal.consent_sdk.k0.H(q0Var5.f32977a));
                                        break;
                                    }
                                    i22 = i97;
                                    i23 = i45;
                                    i25 = i46;
                                    bArr4 = bArr5;
                                    q0Var4 = q0Var5;
                                    unsafe3 = unsafe4;
                                    i44 = i22;
                                    i13 = i12;
                                    i19 = i24;
                                    str = "Failed to parse the message.";
                                    bArr2 = bArr4;
                                    q0Var2 = q0Var4;
                                    i45 = i23;
                                    i18 = i25;
                                    i17 = i21;
                                    obj2 = obj4;
                                    unsafe = unsafe3;
                                    i52 = i52;
                                    break;
                                case 16:
                                    r3Var = this;
                                    bArr5 = bArr;
                                    q0Var5 = q0Var;
                                    i21 = iV;
                                    i24 = i51;
                                    if (i55 != 0) {
                                        Object obj20 = obj7;
                                        unsafe4 = unsafe7;
                                        obj4 = obj20;
                                        i22 = i97;
                                        i23 = i45;
                                        i25 = i46;
                                        bArr4 = bArr5;
                                        q0Var4 = q0Var5;
                                        unsafe3 = unsafe4;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        i45 |= i96;
                                        int iE07 = cl.l0.e0(bArr5, i24, q0Var5);
                                        long j15 = q0Var5.f32978b;
                                        unsafe7.putLong(obj7, j11, (-(j15 & 1)) ^ (j15 >>> 1));
                                        obj7 = obj7;
                                        unsafe7 = unsafe7;
                                        i41 = i11;
                                        i43 = i21;
                                        iE05 = iE07;
                                        break;
                                    }
                                default:
                                    if (i55 != 3) {
                                        i21 = iV;
                                        i24 = i51;
                                        unsafe3 = unsafe7;
                                        obj4 = obj7;
                                        i22 = i97;
                                        i23 = i45;
                                        i25 = i46;
                                        bArr4 = bArr;
                                        q0Var4 = q0Var;
                                        i44 = i22;
                                        i13 = i12;
                                        i19 = i24;
                                        str = "Failed to parse the message.";
                                        bArr2 = bArr4;
                                        q0Var2 = q0Var4;
                                        i45 = i23;
                                        i18 = i25;
                                        i17 = i21;
                                        obj2 = obj4;
                                        unsafe = unsafe3;
                                        i52 = i52;
                                        break;
                                    } else {
                                        i45 |= i96;
                                        r3Var = this;
                                        Object objB2 = r3Var.B(iV, obj7);
                                        i21 = iV;
                                        iE05 = cl.l0.f0(objB2, r3Var.A(i21), bArr, i51, i11, (i52 << 3) | 4, q0Var);
                                        q0Var5 = q0Var;
                                        bArr5 = bArr;
                                        r3Var.k(i21, obj7, objB2);
                                        break;
                                    }
                            }
                        }
                    } else {
                        i13 = i12;
                        unsafe = unsafe7;
                        i17 = i16;
                        str = "Failed to parse the message.";
                        objArr = objArr2;
                        i18 = i46;
                        i19 = i51;
                        obj2 = obj7;
                        bArr2 = bArr;
                        q0Var2 = q0Var13;
                    }
                    if (i18 != i13 || i13 == 0) {
                        x2 x2Var5 = (x2) obj2;
                        e4 e4VarB5 = x2Var5.zzc;
                        if (e4VarB5 == e4Var) {
                            e4VarB5 = e4.b();
                            x2Var5.zzc = e4VarB5;
                        }
                        int i102 = i18;
                        int iA0 = cl.l0.a0(i102, bArr2, i19, i11, e4VarB5, q0Var2);
                        r3Var = this;
                        q0Var13 = q0Var;
                        i41 = i11;
                        i42 = i52;
                        obj7 = obj2;
                        i43 = i17;
                        i47 = 1048575;
                        i46 = i102;
                        iE05 = iA0;
                        bArr10 = bArr;
                        unsafe7 = unsafe;
                    } else {
                        i41 = i11;
                        iE05 = i19;
                        obj7 = obj2;
                        i46 = i18;
                    }
                } else {
                    i13 = i12;
                    unsafe = unsafe7;
                    str = "Failed to parse the message.";
                    objArr = objArr2;
                }
            }
        }
        if (i44 != 1048575) {
            unsafe.putInt(obj7, i44, i45);
        }
        r3 r3Var2 = this;
        int i103 = r3Var2.f33511g;
        e4 e4Var6 = null;
        while (i103 < r3Var2.f33512h) {
            int i104 = r3Var2.f33510f[i103];
            int i105 = iArr[i104];
            Object objH = j4.h(obj7, r3Var2.x(i104) & 1048575);
            if (objH != null && (a3VarZ = r3Var2.z(i104)) != null) {
                int i106 = i104 / 3;
                mg.l lVar2 = ((l3) objArr[i106 + i106]).f33448a;
                o4 o4Var3 = (o4) lVar2.f76310c;
                o4 o4Var4 = (o4) lVar2.f76309b;
                Iterator it3 = ((m3) objH).entrySet().iterator();
                while (it3.hasNext()) {
                    Map.Entry entry = (Map.Entry) it3.next();
                    if (a3VarZ.zza(((Integer) entry.getValue()).intValue())) {
                        obj7 = obj;
                    } else {
                        if (e4Var6 == null) {
                            u2Var.getClass();
                            x2 x2Var6 = (x2) obj7;
                            e4 e4VarB6 = x2Var6.zzc;
                            if (e4VarB6 == e4Var) {
                                e4VarB6 = e4.b();
                                x2Var6.zzc = e4VarB6;
                            }
                            e4Var6 = e4VarB6;
                        }
                        Object key = entry.getKey();
                        int i107 = i103;
                        Object value = entry.getValue();
                        int i108 = r2.f33500c;
                        int iD05 = n2.D0(8);
                        o4 o4Var5 = o4.f33470d;
                        if (o4Var4 == o4Var5) {
                            iD05 += iD05;
                        }
                        p4 p4Var = p4.f33481a;
                        switch (o4Var4.ordinal()) {
                            case 0:
                                i14 = i105;
                                it = it3;
                                ((Double) key).getClass();
                                iE0 = 8;
                                int i109 = iE0 + iD05;
                                int iD06 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                    iD06 += iD06;
                                }
                                switch (o4Var3.ordinal()) {
                                    case 0:
                                        ((Double) value).getClass();
                                        iE02 = 8;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var = l2.f33446b;
                                        byte[] bArr15 = new byte[i15];
                                        n2Var = new n2(bArr15, i15);
                                        try {
                                            Object key2 = entry.getKey();
                                            Object value2 = entry.getValue();
                                            r2.b(n2Var, o4Var4, 1, key2);
                                            r2.b(n2Var, o4Var3, 2, value2);
                                            if (i15 - n2Var.f33462f == 0) {
                                                throw new IllegalStateException("Did not write as much data as expected.");
                                            }
                                            e4Var6.c((i14 << 3) | 2, new m2(bArr15));
                                            it.remove();
                                            obj7 = obj;
                                            i105 = i14;
                                            it3 = it;
                                            i103 = i107;
                                            break;
                                        } catch (IOException e3) {
                                            throw new RuntimeException(e3);
                                        }
                                    case 1:
                                        ((Float) value).getClass();
                                        iE02 = 4;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var2 = l2.f33446b;
                                        byte[] bArr152 = new byte[i15];
                                        n2Var = new n2(bArr152, i15);
                                        Object key22 = entry.getKey();
                                        Object value22 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key22);
                                        r2.b(n2Var, o4Var3, 2, value22);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 2:
                                        iE02 = n2.E0(((Long) value).longValue());
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var22 = l2.f33446b;
                                        byte[] bArr1522 = new byte[i15];
                                        n2Var = new n2(bArr1522, i15);
                                        Object key222 = entry.getKey();
                                        Object value222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key222);
                                        r2.b(n2Var, o4Var3, 2, value222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 3:
                                        iE02 = n2.E0(((Long) value).longValue());
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var222 = l2.f33446b;
                                        byte[] bArr15222 = new byte[i15];
                                        n2Var = new n2(bArr15222, i15);
                                        Object key2222 = entry.getKey();
                                        Object value2222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key2222);
                                        r2.b(n2Var, o4Var3, 2, value2222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 4:
                                        iE02 = n2.E0(((Integer) value).intValue());
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var2222 = l2.f33446b;
                                        byte[] bArr152222 = new byte[i15];
                                        n2Var = new n2(bArr152222, i15);
                                        Object key22222 = entry.getKey();
                                        Object value22222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key22222);
                                        r2.b(n2Var, o4Var3, 2, value22222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 5:
                                        ((Long) value).getClass();
                                        iE02 = 8;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var22222 = l2.f33446b;
                                        byte[] bArr1522222 = new byte[i15];
                                        n2Var = new n2(bArr1522222, i15);
                                        Object key222222 = entry.getKey();
                                        Object value222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key222222);
                                        r2.b(n2Var, o4Var3, 2, value222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 6:
                                        ((Integer) value).getClass();
                                        iE02 = 4;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var222222 = l2.f33446b;
                                        byte[] bArr15222222 = new byte[i15];
                                        n2Var = new n2(bArr15222222, i15);
                                        Object key2222222 = entry.getKey();
                                        Object value2222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key2222222);
                                        r2.b(n2Var, o4Var3, 2, value2222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 7:
                                        ((Boolean) value).getClass();
                                        iE02 = 1;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var2222222 = l2.f33446b;
                                        byte[] bArr152222222 = new byte[i15];
                                        n2Var = new n2(bArr152222222, i15);
                                        Object key22222222 = entry.getKey();
                                        Object value22222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key22222222);
                                        r2.b(n2Var, o4Var3, 2, value22222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 8:
                                        if (value instanceof l2) {
                                            iB2 = ((l2) value).f();
                                            iD03 = n2.D0(iB2);
                                        } else {
                                            iB2 = l4.b((String) value);
                                            iD03 = n2.D0(iB2);
                                        }
                                        iE02 = iB2 + iD03;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var22222222 = l2.f33446b;
                                        byte[] bArr1522222222 = new byte[i15];
                                        n2Var = new n2(bArr1522222222, i15);
                                        Object key222222222 = entry.getKey();
                                        Object value222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key222222222);
                                        r2.b(n2Var, o4Var3, 2, value222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 9:
                                        iE02 = ((g2) value).d();
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var222222222 = l2.f33446b;
                                        byte[] bArr15222222222 = new byte[i15];
                                        n2Var = new n2(bArr15222222222, i15);
                                        Object key2222222222 = entry.getKey();
                                        Object value2222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key2222222222);
                                        r2.b(n2Var, o4Var3, 2, value2222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 10:
                                        iB2 = ((g2) value).d();
                                        iD03 = n2.D0(iB2);
                                        iE02 = iB2 + iD03;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var2222222222 = l2.f33446b;
                                        byte[] bArr152222222222 = new byte[i15];
                                        n2Var = new n2(bArr152222222222, i15);
                                        Object key22222222222 = entry.getKey();
                                        Object value22222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key22222222222);
                                        r2.b(n2Var, o4Var3, 2, value22222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 11:
                                        if (value instanceof l2) {
                                            iB2 = ((l2) value).f();
                                            iD03 = n2.D0(iB2);
                                        } else {
                                            iB2 = ((byte[]) value).length;
                                            iD03 = n2.D0(iB2);
                                        }
                                        iE02 = iB2 + iD03;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var22222222222 = l2.f33446b;
                                        byte[] bArr1522222222222 = new byte[i15];
                                        n2Var = new n2(bArr1522222222222, i15);
                                        Object key222222222222 = entry.getKey();
                                        Object value222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key222222222222);
                                        r2.b(n2Var, o4Var3, 2, value222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 12:
                                        iE02 = n2.D0(((Integer) value).intValue());
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var222222222222 = l2.f33446b;
                                        byte[] bArr15222222222222 = new byte[i15];
                                        n2Var = new n2(bArr15222222222222, i15);
                                        Object key2222222222222 = entry.getKey();
                                        Object value2222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key2222222222222);
                                        r2.b(n2Var, o4Var3, 2, value2222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 13:
                                        iE02 = value instanceof z2 ? n2.E0(((z2) value).zza()) : n2.E0(((Integer) value).intValue());
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var2222222222222 = l2.f33446b;
                                        byte[] bArr152222222222222 = new byte[i15];
                                        n2Var = new n2(bArr152222222222222, i15);
                                        Object key22222222222222 = entry.getKey();
                                        Object value22222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key22222222222222);
                                        r2.b(n2Var, o4Var3, 2, value22222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 14:
                                        ((Integer) value).getClass();
                                        iE02 = 4;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var22222222222222 = l2.f33446b;
                                        byte[] bArr1522222222222222 = new byte[i15];
                                        n2Var = new n2(bArr1522222222222222, i15);
                                        Object key222222222222222 = entry.getKey();
                                        Object value222222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key222222222222222);
                                        r2.b(n2Var, o4Var3, 2, value222222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 15:
                                        ((Long) value).getClass();
                                        iE02 = 8;
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var222222222222222 = l2.f33446b;
                                        byte[] bArr15222222222222222 = new byte[i15];
                                        n2Var = new n2(bArr15222222222222222, i15);
                                        Object key2222222222222222 = entry.getKey();
                                        Object value2222222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key2222222222222222);
                                        r2.b(n2Var, o4Var3, 2, value2222222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 16:
                                        int iIntValue3 = ((Integer) value).intValue();
                                        iE02 = n2.D0((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var2222222222222222 = l2.f33446b;
                                        byte[] bArr152222222222222222 = new byte[i15];
                                        n2Var = new n2(bArr152222222222222222, i15);
                                        Object key22222222222222222 = entry.getKey();
                                        Object value22222222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key22222222222222222);
                                        r2.b(n2Var, o4Var3, 2, value22222222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    case 17:
                                        long jLongValue = ((Long) value).longValue();
                                        iE02 = n2.E0((jLongValue + jLongValue) ^ (jLongValue >> 63));
                                        i15 = iE02 + iD06 + i109;
                                        m2 m2Var22222222222222222 = l2.f33446b;
                                        byte[] bArr1522222222222222222 = new byte[i15];
                                        n2Var = new n2(bArr1522222222222222222, i15);
                                        Object key222222222222222222 = entry.getKey();
                                        Object value222222222222222222 = entry.getValue();
                                        r2.b(n2Var, o4Var4, 1, key222222222222222222);
                                        r2.b(n2Var, o4Var3, 2, value222222222222222222);
                                        if (i15 - n2Var.f33462f == 0) {
                                        }
                                        break;
                                    default:
                                        throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                                }
                            case 1:
                                i14 = i105;
                                it = it3;
                                ((Float) key).getClass();
                                iE0 = 4;
                                int i1092 = iE0 + iD05;
                                int iD062 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 2:
                                i14 = i105;
                                it = it3;
                                iE0 = n2.E0(((Long) key).longValue());
                                int i10922 = iE0 + iD05;
                                int iD0622 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 3:
                                i14 = i105;
                                it = it3;
                                iE0 = n2.E0(((Long) key).longValue());
                                int i109222 = iE0 + iD05;
                                int iD06222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 4:
                                i14 = i105;
                                it = it3;
                                iE0 = n2.E0(((Integer) key).intValue());
                                int i1092222 = iE0 + iD05;
                                int iD062222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 5:
                                i14 = i105;
                                it = it3;
                                ((Long) key).getClass();
                                iE0 = 8;
                                int i10922222 = iE0 + iD05;
                                int iD0622222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 6:
                                i14 = i105;
                                it = it3;
                                ((Integer) key).getClass();
                                iE0 = 4;
                                int i109222222 = iE0 + iD05;
                                int iD06222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 7:
                                i14 = i105;
                                it = it3;
                                ((Boolean) key).getClass();
                                iE0 = 1;
                                int i1092222222 = iE0 + iD05;
                                int iD062222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 8:
                                i14 = i105;
                                it = it3;
                                if (key instanceof l2) {
                                    iB = ((l2) key).f();
                                    iD0 = n2.D0(iB);
                                } else {
                                    iB = l4.b((String) key);
                                    iD0 = n2.D0(iB);
                                }
                                iE0 = iB + iD0;
                                int i10922222222 = iE0 + iD05;
                                int iD0622222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 9:
                                i14 = i105;
                                it = it3;
                                iE0 = ((g2) key).d();
                                int i109222222222 = iE0 + iD05;
                                int iD06222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 10:
                                i14 = i105;
                                it = it3;
                                iB = ((g2) key).d();
                                iD0 = n2.D0(iB);
                                iE0 = iB + iD0;
                                int i1092222222222 = iE0 + iD05;
                                int iD062222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 11:
                                i14 = i105;
                                it = it3;
                                if (key instanceof l2) {
                                    iB = ((l2) key).f();
                                    iD0 = n2.D0(iB);
                                } else {
                                    iB = ((byte[]) key).length;
                                    iD0 = n2.D0(iB);
                                }
                                iE0 = iB + iD0;
                                int i10922222222222 = iE0 + iD05;
                                int iD0622222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 12:
                                i14 = i105;
                                it = it3;
                                iE0 = n2.D0(((Integer) key).intValue());
                                int i109222222222222 = iE0 + iD05;
                                int iD06222222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 13:
                                i14 = i105;
                                if (key instanceof z2) {
                                    it = it3;
                                    iE0 = n2.E0(((z2) key).zza());
                                } else {
                                    it = it3;
                                    iE0 = n2.E0(((Integer) key).intValue());
                                }
                                int i1092222222222222 = iE0 + iD05;
                                int iD062222222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 14:
                                ((Integer) key).getClass();
                                i14 = i105;
                                it = it3;
                                iE0 = 4;
                                int i10922222222222222 = iE0 + iD05;
                                int iD0622222222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 15:
                                ((Long) key).getClass();
                                i14 = i105;
                                it = it3;
                                iE0 = 8;
                                int i109222222222222222 = iE0 + iD05;
                                int iD06222222222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 16:
                                int iIntValue4 = ((Integer) key).intValue();
                                iD02 = n2.D0((iIntValue4 + iIntValue4) ^ (iIntValue4 >> 31));
                                i14 = i105;
                                it = it3;
                                iE0 = iD02;
                                int i1092222222222222222 = iE0 + iD05;
                                int iD062222222222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            case 17:
                                long jLongValue2 = ((Long) key).longValue();
                                iD02 = n2.E0((jLongValue2 + jLongValue2) ^ (jLongValue2 >> 63));
                                i14 = i105;
                                it = it3;
                                iE0 = iD02;
                                int i10922222222222222222 = iE0 + iD05;
                                int iD0622222222222222222 = n2.D0(16);
                                if (o4Var3 == o4Var5) {
                                }
                                switch (o4Var3.ordinal()) {
                                }
                            default:
                                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                        }
                    }
                }
            }
            i103++;
            r3Var2 = this;
            obj7 = obj;
        }
        if (e4Var6 != null) {
            ((x2) obj).zzc = e4Var6;
        }
        if (i13 != 0) {
            String str5 = str;
            if (iE05 > i41 || i46 != i13) {
                throw new zzgc(str5);
            }
        } else if (iE05 != i41) {
            throw new zzgc(str);
        }
        return iE05;
    }

    public final int v(int i5, int i11) {
        int[] iArr = this.f33505a;
        int length = (iArr.length / 3) - 1;
        while (i11 <= length) {
            int i12 = (length + i11) >>> 1;
            int i13 = i12 * 3;
            int i14 = iArr[i13];
            if (i5 == i14) {
                return i13;
            }
            if (i5 < i14) {
                length = i12 - 1;
            } else {
                i11 = i12 + 1;
            }
        }
        return -1;
    }

    public final int x(int i5) {
        return this.f33505a[i5 + 1];
    }

    public final a3 z(int i5) {
        int i11 = i5 / 3;
        return (a3) this.f33506b[i11 + i11 + 1];
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final x2 zze() {
        return (x2) ((x2) this.f33509e).j(4);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0022  */
    @Override // com.google.android.gms.internal.play_billing.x3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzg(Object obj, Object obj2) {
        Object obj3;
        if (!p(obj)) {
            throw new IllegalArgumentException("Mutating immutable message: ".concat(String.valueOf(obj)));
        }
        obj2.getClass();
        int i5 = 0;
        while (true) {
            int[] iArr = this.f33505a;
            if (i5 >= iArr.length) {
                y3.p(obj, obj2);
                return;
            }
            int iX = x(i5);
            int i11 = iX & 1048575;
            int iW = w(iX);
            int i12 = iArr[i5];
            long j11 = i11;
            switch (iW) {
                case 0:
                    if (!n(obj2, i5)) {
                        obj3 = obj;
                        break;
                    } else {
                        i4 i4Var = j4.f33428c;
                        obj3 = obj;
                        i4Var.e(obj3, j11, i4Var.a(obj2, j11));
                        j(i5, obj3);
                        break;
                    }
                case 1:
                    if (n(obj2, i5)) {
                        i4 i4Var2 = j4.f33428c;
                        i4Var2.f(obj, j11, i4Var2.b(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 2:
                    if (n(obj2, i5)) {
                        j4.k(obj, j11, j4.f(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 3:
                    if (n(obj2, i5)) {
                        j4.k(obj, j11, j4.f(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 4:
                    if (n(obj2, i5)) {
                        j4.j(obj, j11, j4.e(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 5:
                    if (n(obj2, i5)) {
                        j4.k(obj, j11, j4.f(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 6:
                    if (n(obj2, i5)) {
                        j4.j(obj, j11, j4.e(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 7:
                    if (n(obj2, i5)) {
                        i4 i4Var3 = j4.f33428c;
                        i4Var3.c(obj, j11, i4Var3.g(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 8:
                    if (n(obj2, i5)) {
                        j4.l(obj, j11, j4.h(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 9:
                    h(i5, obj, obj2);
                    obj3 = obj;
                    break;
                case 10:
                    if (n(obj2, i5)) {
                        j4.l(obj, j11, j4.h(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 11:
                    if (n(obj2, i5)) {
                        j4.j(obj, j11, j4.e(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 12:
                    if (n(obj2, i5)) {
                        j4.j(obj, j11, j4.e(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 13:
                    if (n(obj2, i5)) {
                        j4.j(obj, j11, j4.e(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 14:
                    if (n(obj2, i5)) {
                        j4.k(obj, j11, j4.f(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 15:
                    if (n(obj2, i5)) {
                        j4.j(obj, j11, j4.e(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 16:
                    if (n(obj2, i5)) {
                        j4.k(obj, j11, j4.f(obj2, j11));
                        j(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 17:
                    h(i5, obj, obj2);
                    obj3 = obj;
                    break;
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                case 45:
                case 46:
                case 47:
                case 48:
                case 49:
                    c3 c3VarZzd = (c3) j4.h(obj, j11);
                    c3 c3Var = (c3) j4.h(obj2, j11);
                    int size = c3VarZzd.size();
                    int size2 = c3Var.size();
                    if (size > 0 && size2 > 0) {
                        if (!((h2) c3VarZzd).f33414a) {
                            c3VarZzd = c3VarZzd.zzd(size2 + size);
                        }
                        c3VarZzd.addAll(c3Var);
                    }
                    if (size > 0) {
                        c3Var = c3VarZzd;
                    }
                    j4.l(obj, j11, c3Var);
                    obj3 = obj;
                    break;
                case 50:
                    u2 u2Var = y3.f33663a;
                    j4.l(obj, j11, u2.a(j4.h(obj, j11), j4.h(obj2, j11)));
                    obj3 = obj;
                    break;
                case 51:
                case 52:
                case 53:
                case 54:
                case 55:
                case 56:
                case 57:
                case 58:
                case 59:
                    if (q(obj2, i12, i5)) {
                        j4.l(obj, j11, j4.h(obj2, j11));
                        j4.j(obj, iArr[i5 + 2] & 1048575, i12);
                    }
                    obj3 = obj;
                    break;
                case 60:
                    i(i5, obj, obj2);
                    obj3 = obj;
                    break;
                case 61:
                case 62:
                case 63:
                case 64:
                case 65:
                case 66:
                case 67:
                    if (q(obj2, i12, i5)) {
                        j4.l(obj, j11, j4.h(obj2, j11));
                        j4.j(obj, iArr[i5 + 2] & 1048575, i12);
                    }
                    obj3 = obj;
                    break;
                case 68:
                    i(i5, obj, obj2);
                    obj3 = obj;
                    break;
            }
            i5 += 3;
            obj = obj3;
        }
    }
}
