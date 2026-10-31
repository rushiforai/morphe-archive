package com.google.android.gms.internal.consent_sdk;

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
public final class n6 implements t6 {

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f32156g = new int[0];

    /* renamed from: h, reason: collision with root package name */
    public static final Unsafe f32157h = e7.i();

    /* renamed from: a, reason: collision with root package name */
    public final int[] f32158a;

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f32159b;

    /* renamed from: c, reason: collision with root package name */
    public final i5 f32160c;

    /* renamed from: d, reason: collision with root package name */
    public final int[] f32161d;

    /* renamed from: e, reason: collision with root package name */
    public final int f32162e;

    /* renamed from: f, reason: collision with root package name */
    public final z6 f32163f;

    public n6(int[] iArr, Object[] objArr, i5 i5Var, int[] iArr2, int i5, z6 z6Var, o4 o4Var) {
        this.f32158a = iArr;
        this.f32159b = objArr;
        this.f32161d = iArr2;
        this.f32162e = i5;
        this.f32163f = z6Var;
        this.f32160c = i5Var;
    }

    public static boolean e(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof x5) {
            return ((x5) obj).e();
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:167:0x032a  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x0376  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x038a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static n6 g(s6 s6Var, z6 z6Var, o4 o4Var) {
        int i5;
        int iCharAt;
        int iCharAt2;
        int i11;
        int i12;
        int[] iArr;
        int i13;
        int i14;
        char cCharAt;
        int i15;
        char cCharAt2;
        int i16;
        char cCharAt3;
        int i17;
        char cCharAt4;
        int i18;
        int i19;
        int i21;
        char cCharAt5;
        int i22;
        char cCharAt6;
        int i23;
        int i24;
        Object[] objArr;
        int[] iArr2;
        int iObjectFieldOffset;
        int iObjectFieldOffset2;
        int i25;
        int i26;
        int i27;
        int i28;
        Field fieldM;
        char cCharAt7;
        int i29;
        int i31;
        int i32;
        int i33;
        Field fieldM2;
        Field fieldM3;
        int i34;
        char cCharAt8;
        int i35;
        int i36;
        char cCharAt9;
        int i37;
        char cCharAt10;
        int i38;
        char cCharAt11;
        if (!(s6Var instanceof s6)) {
            s6Var.getClass();
            throw new ClassCastException();
        }
        String str = s6Var.f32238b;
        int length = str.length();
        int i39 = 55296;
        if (str.charAt(0) >= 55296) {
            int i40 = 1;
            while (true) {
                i5 = i40 + 1;
                if (str.charAt(i40) < 55296) {
                    break;
                }
                i40 = i5;
            }
        } else {
            i5 = 1;
        }
        int i41 = i5 + 1;
        int iCharAt3 = str.charAt(i5);
        if (iCharAt3 >= 55296) {
            int i42 = iCharAt3 & 8191;
            int i43 = 13;
            while (true) {
                i38 = i41 + 1;
                cCharAt11 = str.charAt(i41);
                if (cCharAt11 < 55296) {
                    break;
                }
                i42 |= (cCharAt11 & 8191) << i43;
                i43 += 13;
                i41 = i38;
            }
            iCharAt3 = i42 | (cCharAt11 << i43);
            i41 = i38;
        }
        if (iCharAt3 == 0) {
            iCharAt = 0;
            iCharAt2 = 0;
            i11 = 0;
            i13 = 0;
            iArr = f32156g;
            i12 = 0;
        } else {
            int i44 = i41 + 1;
            int iCharAt4 = str.charAt(i41);
            if (iCharAt4 >= 55296) {
                int i45 = iCharAt4 & 8191;
                int i46 = 13;
                while (true) {
                    i22 = i44 + 1;
                    cCharAt6 = str.charAt(i44);
                    if (cCharAt6 < 55296) {
                        break;
                    }
                    i45 |= (cCharAt6 & 8191) << i46;
                    i46 += 13;
                    i44 = i22;
                }
                iCharAt4 = i45 | (cCharAt6 << i46);
                i44 = i22;
            }
            int i47 = i44 + 1;
            int iCharAt5 = str.charAt(i44);
            if (iCharAt5 >= 55296) {
                int i48 = iCharAt5 & 8191;
                int i49 = 13;
                while (true) {
                    i21 = i47 + 1;
                    cCharAt5 = str.charAt(i47);
                    if (cCharAt5 < 55296) {
                        break;
                    }
                    i48 |= (cCharAt5 & 8191) << i49;
                    i49 += 13;
                    i47 = i21;
                }
                iCharAt5 = i48 | (cCharAt5 << i49);
                i47 = i21;
            }
            int i51 = i47 + 1;
            if (str.charAt(i47) >= 55296) {
                while (true) {
                    i19 = i51 + 1;
                    if (str.charAt(i51) < 55296) {
                        break;
                    }
                    i51 = i19;
                }
                i51 = i19;
            }
            int i52 = i51 + 1;
            if (str.charAt(i51) >= 55296) {
                while (true) {
                    i18 = i52 + 1;
                    if (str.charAt(i52) < 55296) {
                        break;
                    }
                    i52 = i18;
                }
                i52 = i18;
            }
            int i53 = i52 + 1;
            iCharAt = str.charAt(i52);
            if (iCharAt >= 55296) {
                int i54 = iCharAt & 8191;
                int i55 = 13;
                while (true) {
                    i17 = i53 + 1;
                    cCharAt4 = str.charAt(i53);
                    if (cCharAt4 < 55296) {
                        break;
                    }
                    i54 |= (cCharAt4 & 8191) << i55;
                    i55 += 13;
                    i53 = i17;
                }
                iCharAt = i54 | (cCharAt4 << i55);
                i53 = i17;
            }
            int i56 = i53 + 1;
            iCharAt2 = str.charAt(i53);
            if (iCharAt2 >= 55296) {
                int i57 = iCharAt2 & 8191;
                int i58 = 13;
                while (true) {
                    i16 = i56 + 1;
                    cCharAt3 = str.charAt(i56);
                    if (cCharAt3 < 55296) {
                        break;
                    }
                    i57 |= (cCharAt3 & 8191) << i58;
                    i58 += 13;
                    i56 = i16;
                }
                iCharAt2 = i57 | (cCharAt3 << i58);
                i56 = i16;
            }
            int i59 = i56 + 1;
            int iCharAt6 = str.charAt(i56);
            if (iCharAt6 >= 55296) {
                int i61 = iCharAt6 & 8191;
                int i62 = 13;
                while (true) {
                    i15 = i59 + 1;
                    cCharAt2 = str.charAt(i59);
                    if (cCharAt2 < 55296) {
                        break;
                    }
                    i61 |= (cCharAt2 & 8191) << i62;
                    i62 += 13;
                    i59 = i15;
                }
                iCharAt6 = i61 | (cCharAt2 << i62);
                i59 = i15;
            }
            int i63 = i59 + 1;
            int iCharAt7 = str.charAt(i59);
            if (iCharAt7 >= 55296) {
                int i64 = iCharAt7 & 8191;
                int i65 = 13;
                while (true) {
                    i14 = i63 + 1;
                    cCharAt = str.charAt(i63);
                    if (cCharAt < 55296) {
                        break;
                    }
                    i64 |= (cCharAt & 8191) << i65;
                    i65 += 13;
                    i63 = i14;
                }
                iCharAt7 = i64 | (cCharAt << i65);
                i63 = i14;
            }
            int i66 = iCharAt7 + iCharAt2 + iCharAt6;
            i11 = iCharAt4 + iCharAt4 + iCharAt5;
            i12 = iCharAt4;
            i41 = i63;
            iArr = new int[i66];
            i13 = iCharAt7;
        }
        Unsafe unsafe = f32157h;
        Object[] objArr2 = s6Var.f32239c;
        Class<?> cls = s6Var.f32237a.getClass();
        int i67 = iCharAt2 + i13;
        int i68 = iCharAt + iCharAt;
        int[] iArr3 = new int[iCharAt * 3];
        Object[] objArr3 = new Object[i68];
        int i69 = i13;
        int i71 = 0;
        int i72 = 0;
        while (i41 < length) {
            int i73 = i41 + 1;
            int iCharAt8 = str.charAt(i41);
            if (iCharAt8 >= i39) {
                int i74 = iCharAt8 & 8191;
                int i75 = i73;
                int i76 = 13;
                while (true) {
                    i37 = i75 + 1;
                    cCharAt10 = str.charAt(i75);
                    i23 = length;
                    if (cCharAt10 < 55296) {
                        break;
                    }
                    i74 |= (cCharAt10 & 8191) << i76;
                    i76 += 13;
                    i75 = i37;
                    length = i23;
                }
                iCharAt8 = i74 | (cCharAt10 << i76);
                i24 = i37;
            } else {
                i23 = length;
                i24 = i73;
            }
            int i77 = i24 + 1;
            int iCharAt9 = str.charAt(i24);
            int i78 = iCharAt8;
            char c11 = 55296;
            if (iCharAt9 >= 55296) {
                int i79 = iCharAt9 & 8191;
                int i81 = 13;
                while (true) {
                    i36 = i77 + 1;
                    cCharAt9 = str.charAt(i77);
                    if (cCharAt9 < c11) {
                        break;
                    }
                    i79 |= (cCharAt9 & 8191) << i81;
                    i81 += 13;
                    i77 = i36;
                    c11 = 55296;
                }
                iCharAt9 = i79 | (cCharAt9 << i81);
                i77 = i36;
            }
            if ((iCharAt9 & 1024) != 0) {
                iArr[i72] = i71;
                i72++;
            }
            int i82 = iCharAt9 & 255;
            int i83 = i12;
            int i84 = iCharAt9 & 2048;
            if (i82 >= 51) {
                int i85 = i77 + 1;
                int iCharAt10 = str.charAt(i77);
                if (iCharAt10 >= 55296) {
                    int i86 = iCharAt10 & 8191;
                    int i87 = i85;
                    int i88 = 13;
                    while (true) {
                        i34 = i87 + 1;
                        cCharAt8 = str.charAt(i87);
                        i35 = i86;
                        if (cCharAt8 < 55296) {
                            break;
                        }
                        i86 = i35 | ((cCharAt8 & 8191) << i88);
                        i88 += 13;
                        i87 = i34;
                    }
                    iCharAt10 = i35 | (cCharAt8 << i88);
                    i32 = i34;
                } else {
                    i32 = i85;
                }
                int i89 = iCharAt10;
                int i91 = i82 - 51;
                int i92 = i32;
                if (i91 == 9 || i91 == 17) {
                    objArr3[c9.d(i71, 3, 1)] = objArr2[i11];
                    i33 = i84;
                    i11++;
                } else if (i91 != 12) {
                    i33 = i84;
                } else if (s6Var.a() == 1 || i84 != 0) {
                    objArr3[c9.d(i71, 3, 1)] = objArr2[i11];
                    i11++;
                    i33 = i84;
                } else {
                    i33 = 0;
                }
                int i93 = i89 + i89;
                Object obj = objArr2[i93];
                int i94 = i33;
                if (obj instanceof Field) {
                    fieldM2 = (Field) obj;
                } else {
                    fieldM2 = m(cls, (String) obj);
                    objArr2[i93] = fieldM2;
                }
                objArr = objArr3;
                int iObjectFieldOffset3 = (int) unsafe.objectFieldOffset(fieldM2);
                int i95 = i93 + 1;
                Object obj2 = objArr2[i95];
                if (obj2 instanceof Field) {
                    fieldM3 = (Field) obj2;
                } else {
                    fieldM3 = m(cls, (String) obj2);
                    objArr2[i95] = fieldM3;
                }
                iObjectFieldOffset2 = (int) unsafe.objectFieldOffset(fieldM3);
                iArr2 = iArr3;
                i28 = iObjectFieldOffset3;
                i84 = i94;
                i25 = i92;
                i27 = 0;
            } else {
                objArr = objArr3;
                int i96 = i11 + 1;
                Field fieldM4 = m(cls, (String) objArr2[i11]);
                if (i82 == 9 || i82 == 17) {
                    iArr2 = iArr3;
                    objArr[c9.d(i71, 3, 1)] = fieldM4.getType();
                } else {
                    if (i82 == 27) {
                        iArr2 = iArr3;
                        i29 = 3;
                        i31 = 1;
                        i11 += 2;
                    } else if (i82 == 49) {
                        i11 += 2;
                        iArr2 = iArr3;
                        i29 = 3;
                        i31 = 1;
                    } else {
                        if (i82 == 12 || i82 == 30 || i82 == 44) {
                            iArr2 = iArr3;
                            if (s6Var.a() == 1 || i84 != 0) {
                                i11 += 2;
                                objArr[c9.d(i71, 3, 1)] = objArr2[i96];
                            } else {
                                i11 = i96;
                                i84 = 0;
                            }
                        } else if (i82 == 50) {
                            int i97 = i11 + 2;
                            int i98 = i69 + 1;
                            iArr[i69] = i71;
                            int i99 = i71 / 3;
                            int i100 = i99 + i99;
                            objArr[i100] = objArr2[i96];
                            if (i84 != 0) {
                                i11 += 3;
                                objArr[i100 + 1] = objArr2[i97];
                                i69 = i98;
                            } else {
                                i11 = i97;
                                i69 = i98;
                                i84 = 0;
                            }
                            iArr2 = iArr3;
                        } else {
                            iArr2 = iArr3;
                        }
                        iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldM4);
                        iObjectFieldOffset2 = 1048575;
                        if ((iCharAt9 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0 || i82 > 17) {
                            i25 = i77;
                            i26 = 0;
                        } else {
                            int i101 = i77 + 1;
                            int iCharAt11 = str.charAt(i77);
                            if (iCharAt11 >= 55296) {
                                int i102 = iCharAt11 & 8191;
                                int i103 = 13;
                                while (true) {
                                    i25 = i101 + 1;
                                    cCharAt7 = str.charAt(i101);
                                    if (cCharAt7 < 55296) {
                                        break;
                                    }
                                    i102 |= (cCharAt7 & 8191) << i103;
                                    i103 += 13;
                                    i101 = i25;
                                }
                                iCharAt11 = i102 | (cCharAt7 << i103);
                            } else {
                                i25 = i101;
                            }
                            int i104 = (iCharAt11 / 32) + i83 + i83;
                            Object obj3 = objArr2[i104];
                            if (obj3 instanceof Field) {
                                fieldM = (Field) obj3;
                            } else {
                                fieldM = m(cls, (String) obj3);
                                objArr2[i104] = fieldM;
                            }
                            i26 = iCharAt11 % 32;
                            iObjectFieldOffset2 = (int) unsafe.objectFieldOffset(fieldM);
                        }
                        if (i82 >= 18 || i82 > 49) {
                            i27 = i26;
                            i28 = iObjectFieldOffset;
                        } else {
                            iArr[i67] = iObjectFieldOffset;
                            i27 = i26;
                            i28 = iObjectFieldOffset;
                            i67++;
                        }
                    }
                    objArr[c9.d(i71, i29, i31)] = objArr2[i96];
                    iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldM4);
                    iObjectFieldOffset2 = 1048575;
                    if ((iCharAt9 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
                        i25 = i77;
                        i26 = 0;
                        if (i82 >= 18) {
                            i27 = i26;
                            i28 = iObjectFieldOffset;
                        }
                    }
                }
                i11 = i96;
                iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldM4);
                iObjectFieldOffset2 = 1048575;
                if ((iCharAt9 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
                }
            }
            int i105 = i71 + 1;
            iArr2[i71] = i78;
            int i106 = i71 + 2;
            String str2 = str;
            iArr2[i105] = ((iCharAt9 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 0) | ((iCharAt9 & 256) != 0 ? 268435456 : 0) | (i84 != 0 ? Integer.MIN_VALUE : 0) | (i82 << 20) | i28;
            i71 += 3;
            iArr2[i106] = (i27 << 20) | iObjectFieldOffset2;
            str = str2;
            i41 = i25;
            i12 = i83;
            length = i23;
            iArr3 = iArr2;
            objArr3 = objArr;
            i39 = 55296;
        }
        return new n6(iArr3, objArr3, s6Var.f32237a, iArr, i13, z6Var, o4Var);
    }

    public static int h(long j11, Object obj) {
        return ((Integer) e7.h(obj, j11)).intValue();
    }

    public static int i(int i5) {
        return (i5 >>> 20) & 255;
    }

    public static long k(long j11, Object obj) {
        return ((Long) e7.h(obj, j11)).longValue();
    }

    public static Field m(Class cls, String str) {
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

    /* JADX WARN: Removed duplicated region for block: B:44:0x00db A[PHI: r1
      0x00db: PHI (r1v35 int) = (r1v11 int), (r1v36 int) binds: [B:85:0x01ea, B:43:0x00d9] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.google.android.gms.internal.consent_sdk.t6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(x5 x5Var) {
        int i5;
        long jDoubleToLongBits;
        int i11;
        int iFloatToIntBits;
        int i12;
        int i13;
        int i14 = 0;
        int i15 = 0;
        while (true) {
            int[] iArr = this.f32158a;
            if (i14 >= iArr.length) {
                x5Var.zzc.getClass();
                return (i15 * 53) + 506991;
            }
            int iJ = j(i14);
            int i16 = 1048575 & iJ;
            int i17 = i(iJ);
            int i18 = iArr[i14];
            long j11 = i16;
            int i19 = 1237;
            int iHashCode = 37;
            switch (i17) {
                case 0:
                    i5 = i15 * 53;
                    jDoubleToLongBits = Double.doubleToLongBits(e7.f32057c.a(x5Var, j11));
                    Charset charset = b6.f31997a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 1:
                    i11 = i15 * 53;
                    iFloatToIntBits = Float.floatToIntBits(e7.f32057c.b(x5Var, j11));
                    i15 = iFloatToIntBits + i11;
                    break;
                case 2:
                    i5 = i15 * 53;
                    jDoubleToLongBits = e7.f(x5Var, j11);
                    Charset charset2 = b6.f31997a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 3:
                    i5 = i15 * 53;
                    jDoubleToLongBits = e7.f(x5Var, j11);
                    Charset charset3 = b6.f31997a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 4:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.e(x5Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 5:
                    i5 = i15 * 53;
                    jDoubleToLongBits = e7.f(x5Var, j11);
                    Charset charset4 = b6.f31997a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 6:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.e(x5Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 7:
                    i12 = i15 * 53;
                    boolean zG = e7.f32057c.g(x5Var, j11);
                    Charset charset5 = b6.f31997a;
                    if (zG) {
                        i19 = 1231;
                    }
                    i15 = i19 + i12;
                    break;
                case 8:
                    i11 = i15 * 53;
                    iFloatToIntBits = ((String) e7.h(x5Var, j11)).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 9:
                    i13 = i15 * 53;
                    Object objH = e7.h(x5Var, j11);
                    if (objH != null) {
                        iHashCode = objH.hashCode();
                    }
                    i15 = i13 + iHashCode;
                    break;
                case 10:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.h(x5Var, j11).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 11:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.e(x5Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 12:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.e(x5Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 13:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.e(x5Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 14:
                    i5 = i15 * 53;
                    jDoubleToLongBits = e7.f(x5Var, j11);
                    Charset charset6 = b6.f31997a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 15:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.e(x5Var, j11);
                    i15 = iFloatToIntBits + i11;
                    break;
                case 16:
                    i5 = i15 * 53;
                    jDoubleToLongBits = e7.f(x5Var, j11);
                    Charset charset7 = b6.f31997a;
                    i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    break;
                case 17:
                    i13 = i15 * 53;
                    Object objH2 = e7.h(x5Var, j11);
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
                    iFloatToIntBits = e7.h(x5Var, j11).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 50:
                    i11 = i15 * 53;
                    iFloatToIntBits = e7.h(x5Var, j11).hashCode();
                    i15 = iFloatToIntBits + i11;
                    break;
                case 51:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = Double.doubleToLongBits(((Double) e7.h(x5Var, j11)).doubleValue());
                        Charset charset8 = b6.f31997a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 52:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = Float.floatToIntBits(((Float) e7.h(x5Var, j11)).floatValue());
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 53:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = k(j11, x5Var);
                        Charset charset9 = b6.f31997a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 54:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = k(j11, x5Var);
                        Charset charset10 = b6.f31997a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 55:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = h(j11, x5Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 56:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = k(j11, x5Var);
                        Charset charset11 = b6.f31997a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 57:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = h(j11, x5Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 58:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i12 = i15 * 53;
                        boolean zBooleanValue = ((Boolean) e7.h(x5Var, j11)).booleanValue();
                        Charset charset12 = b6.f31997a;
                        if (zBooleanValue) {
                        }
                        i15 = i19 + i12;
                        break;
                    }
                    break;
                case 59:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = ((String) e7.h(x5Var, j11)).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 60:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = e7.h(x5Var, j11).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 61:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = e7.h(x5Var, j11).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 62:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = h(j11, x5Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 63:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = h(j11, x5Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 64:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = h(j11, x5Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 65:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = k(j11, x5Var);
                        Charset charset13 = b6.f31997a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 66:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = h(j11, x5Var);
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
                case 67:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i5 = i15 * 53;
                        jDoubleToLongBits = k(j11, x5Var);
                        Charset charset14 = b6.f31997a;
                        i15 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        break;
                    }
                case 68:
                    if (!f(i18, i14, x5Var)) {
                        break;
                    } else {
                        i11 = i15 * 53;
                        iFloatToIntBits = e7.h(x5Var, j11).hashCode();
                        i15 = iFloatToIntBits + i11;
                        break;
                    }
            }
            i14 += 3;
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final boolean b(x5 x5Var, x5 x5Var2) {
        boolean zE;
        int i5 = 0;
        while (true) {
            int[] iArr = this.f32158a;
            if (i5 < iArr.length) {
                int iJ = j(i5);
                long j11 = iJ & 1048575;
                switch (i(iJ)) {
                    case 0:
                        if (!q(x5Var, x5Var2, i5)) {
                            break;
                        } else {
                            d7 d7Var = e7.f32057c;
                            if (Double.doubleToLongBits(d7Var.a(x5Var, j11)) != Double.doubleToLongBits(d7Var.a(x5Var2, j11))) {
                                break;
                            } else {
                                continue;
                                i5 += 3;
                            }
                        }
                    case 1:
                        if (!q(x5Var, x5Var2, i5)) {
                            break;
                        } else {
                            d7 d7Var2 = e7.f32057c;
                            if (Float.floatToIntBits(d7Var2.b(x5Var, j11)) != Float.floatToIntBits(d7Var2.b(x5Var2, j11))) {
                                break;
                            } else {
                                continue;
                                i5 += 3;
                            }
                        }
                    case 2:
                        if (!q(x5Var, x5Var2, i5) || e7.f(x5Var, j11) != e7.f(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 3:
                        if (!q(x5Var, x5Var2, i5) || e7.f(x5Var, j11) != e7.f(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 4:
                        if (!q(x5Var, x5Var2, i5) || e7.e(x5Var, j11) != e7.e(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 5:
                        if (!q(x5Var, x5Var2, i5) || e7.f(x5Var, j11) != e7.f(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 6:
                        if (!q(x5Var, x5Var2, i5) || e7.e(x5Var, j11) != e7.e(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 7:
                        if (!q(x5Var, x5Var2, i5)) {
                            break;
                        } else {
                            d7 d7Var3 = e7.f32057c;
                            if (d7Var3.g(x5Var, j11) != d7Var3.g(x5Var2, j11)) {
                                break;
                            } else {
                                continue;
                                i5 += 3;
                            }
                        }
                    case 8:
                        if (!q(x5Var, x5Var2, i5) || !u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 9:
                        if (!q(x5Var, x5Var2, i5) || !u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 10:
                        if (!q(x5Var, x5Var2, i5) || !u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 11:
                        if (!q(x5Var, x5Var2, i5) || e7.e(x5Var, j11) != e7.e(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 12:
                        if (!q(x5Var, x5Var2, i5) || e7.e(x5Var, j11) != e7.e(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 13:
                        if (!q(x5Var, x5Var2, i5) || e7.e(x5Var, j11) != e7.e(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 14:
                        if (!q(x5Var, x5Var2, i5) || e7.f(x5Var, j11) != e7.f(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 15:
                        if (!q(x5Var, x5Var2, i5) || e7.e(x5Var, j11) != e7.e(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 16:
                        if (!q(x5Var, x5Var2, i5) || e7.f(x5Var, j11) != e7.f(x5Var2, j11)) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    case 17:
                        if (!q(x5Var, x5Var2, i5) || !u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11))) {
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
                        zE = u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11));
                        break;
                    case 50:
                        zE = u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11));
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
                        if (e7.e(x5Var, j12) != e7.e(x5Var2, j12) || !u6.e(e7.h(x5Var, j11), e7.h(x5Var2, j11))) {
                            break;
                        } else {
                            continue;
                            i5 += 3;
                        }
                        break;
                    default:
                        i5 += 3;
                }
                if (zE) {
                    i5 += 3;
                }
            } else if (x5Var.zzc.equals(x5Var2.zzc)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0336  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0344  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0356  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0367  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0370  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0378  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0385  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0391  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x03aa  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x03b5  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x03bc  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x03da  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x03e0  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x03e6  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x03f2  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x03fd  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x0408  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x040f  */
    /* JADX WARN: Removed duplicated region for block: B:285:0x033e A[SYNTHETIC] */
    @Override // com.google.android.gms.internal.consent_sdk.t6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(Object obj, h6 h6Var) throws IOException {
        int[] iArr;
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        boolean z11;
        int i15;
        Iterator it;
        int iX;
        int iE;
        int iW;
        int iW2;
        int iX2;
        int iE2;
        int iW3;
        n6 n6Var = this;
        o5 o5Var = (o5) h6Var.f32089b;
        Unsafe unsafe = f32157h;
        int i16 = 1048575;
        int i17 = 1048575;
        int i18 = 0;
        int i19 = 0;
        while (true) {
            int[] iArr2 = n6Var.f32158a;
            if (i18 >= iArr2.length) {
                y6 y6Var = ((x5) obj).zzc;
                return;
            }
            int iJ = n6Var.j(i18);
            int i21 = i(iJ);
            int i22 = iArr2[i18];
            if (i21 <= 17) {
                int i23 = iArr2[i18 + 2];
                int i24 = i23 & i16;
                if (i24 != i17) {
                    i19 = i24 == i16 ? 0 : unsafe.getInt(obj, i24);
                    i17 = i24;
                }
                iArr = iArr2;
                i5 = 1 << (i23 >>> 20);
            } else {
                iArr = iArr2;
                i5 = 0;
            }
            long j11 = iJ & i16;
            int i25 = 1;
            int i26 = 2;
            switch (i21) {
                case 0:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.i0(i22, Double.doubleToRawLongBits(e7.f32057c.a(obj, j11)));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 1:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.g0(i22, Float.floatToRawIntBits(e7.f32057c.b(obj, j11)));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 2:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.q0(i22, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 3:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.q0(i22, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 4:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.k0(i22, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 5:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.i0(i22, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 6:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.g0(i22, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 7:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        byte bG = e7.f32057c.g(obj, j11);
                        o5Var.Z(11);
                        o5Var.c0(i22 << 3);
                        byte[] bArr = o5Var.f32200e;
                        int i27 = o5Var.f32202g;
                        bArr[i27] = bG;
                        o5Var.f32202g = i27 + 1;
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 8:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        Object object = unsafe.getObject(obj, j11);
                        if (object instanceof String) {
                            o5Var.p0((i22 << 3) | 2);
                            o5Var.m0((String) object);
                        } else {
                            o5Var.e0(i22, (n5) object);
                        }
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 9:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        h6Var.f(i22, unsafe.getObject(obj, j11), n6Var.l(i18));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 10:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.e0(i22, (n5) unsafe.getObject(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 11:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.o0(i22, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 12:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.k0(i22, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 13:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.g0(i22, unsafe.getInt(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 14:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        o5Var.i0(i22, unsafe.getLong(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 15:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        int i28 = unsafe.getInt(obj, j11);
                        o5Var.o0(i22, (i28 >> 31) ^ (i28 + i28));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 16:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        long j12 = unsafe.getLong(obj, j11);
                        o5Var.q0(i22, (j12 >> 63) ^ (j12 + j12));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 17:
                    if (n6Var.s(obj, i18, i17, i19, i5)) {
                        Object object2 = unsafe.getObject(obj, j11);
                        o5Var.n0(i22, 3);
                        n6Var.l(i18).c((i5) object2, h6Var);
                        o5Var.n0(i22, 4);
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 18:
                    i11 = i17;
                    i12 = i19;
                    u6.q(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 19:
                    i11 = i17;
                    i12 = i19;
                    u6.u(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 20:
                    i11 = i17;
                    i12 = i19;
                    u6.w(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 21:
                    i11 = i17;
                    i12 = i19;
                    u6.d(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 22:
                    i11 = i17;
                    i12 = i19;
                    u6.v(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 23:
                    i11 = i17;
                    i12 = i19;
                    u6.t(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 24:
                    i11 = i17;
                    i12 = i19;
                    u6.s(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 25:
                    i11 = i17;
                    i12 = i19;
                    u6.p(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 26:
                    i13 = i17;
                    i14 = i19;
                    int i29 = iArr[i18];
                    List list = (List) unsafe.getObject(obj, j11);
                    z6 z6Var = u6.f32258a;
                    if (list != null && !list.isEmpty()) {
                        if (list instanceof e6) {
                            e6 e6Var = (e6) list;
                            for (int i31 = 0; i31 < list.size(); i31++) {
                                Object objZza = e6Var.zza();
                                if (objZza instanceof String) {
                                    o5Var.p0((i29 << 3) | 2);
                                    o5Var.m0((String) objZza);
                                } else {
                                    o5Var.e0(i29, (n5) objZza);
                                }
                            }
                        } else {
                            for (int i32 = 0; i32 < list.size(); i32++) {
                                String str = (String) list.get(i32);
                                o5Var.p0((i29 << 3) | 2);
                                o5Var.m0(str);
                            }
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                    break;
                case 27:
                    i13 = i17;
                    i14 = i19;
                    int i33 = iArr[i18];
                    List list2 = (List) unsafe.getObject(obj, j11);
                    t6 t6VarL = n6Var.l(i18);
                    z6 z6Var2 = u6.f32258a;
                    if (list2 != null && !list2.isEmpty()) {
                        for (int i34 = 0; i34 < list2.size(); i34++) {
                            h6Var.f(i33, list2.get(i34), t6VarL);
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                    break;
                case 28:
                    i13 = i17;
                    i14 = i19;
                    int i35 = iArr[i18];
                    List list3 = (List) unsafe.getObject(obj, j11);
                    z6 z6Var3 = u6.f32258a;
                    if (list3 != null && !list3.isEmpty()) {
                        for (int i36 = 0; i36 < list3.size(); i36++) {
                            o5Var.e0(i35, (n5) list3.get(i36));
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                    break;
                case 29:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    u6.c(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 30:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    u6.r(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 31:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    u6.x(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 32:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    u6.y(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 33:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    u6.a(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 34:
                    i11 = i17;
                    i12 = i19;
                    z11 = false;
                    u6.b(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, false);
                    i19 = i12;
                    i17 = i11;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 35:
                    i13 = i17;
                    i14 = i19;
                    u6.q(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 36:
                    i13 = i17;
                    i14 = i19;
                    u6.u(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 37:
                    i13 = i17;
                    i14 = i19;
                    u6.w(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 38:
                    i13 = i17;
                    i14 = i19;
                    u6.d(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 39:
                    i13 = i17;
                    i14 = i19;
                    u6.v(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 40:
                    i13 = i17;
                    i14 = i19;
                    u6.t(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 41:
                    i13 = i17;
                    i14 = i19;
                    u6.s(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 42:
                    i13 = i17;
                    i14 = i19;
                    u6.p(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 43:
                    i13 = i17;
                    i14 = i19;
                    u6.c(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 44:
                    i13 = i17;
                    i14 = i19;
                    u6.r(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 45:
                    i13 = i17;
                    i14 = i19;
                    u6.x(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 46:
                    i13 = i17;
                    i14 = i19;
                    u6.y(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 47:
                    i13 = i17;
                    i14 = i19;
                    u6.a(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 48:
                    i13 = i17;
                    i14 = i19;
                    u6.b(iArr[i18], (List) unsafe.getObject(obj, j11), h6Var, true);
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 49:
                    i13 = i17;
                    i14 = i19;
                    int i37 = iArr[i18];
                    List list4 = (List) unsafe.getObject(obj, j11);
                    t6 t6VarL2 = n6Var.l(i18);
                    z6 z6Var4 = u6.f32258a;
                    if (list4 != null && !list4.isEmpty()) {
                        for (int i38 = 0; i38 < list4.size(); i38++) {
                            i5 i5Var = (i5) list4.get(i38);
                            o5Var.n0(i37, 3);
                            t6VarL2.c(i5Var, h6Var);
                            o5Var.n0(i37, 4);
                        }
                    }
                    i19 = i14;
                    i17 = i13;
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                    break;
                case 50:
                    Object object3 = unsafe.getObject(obj, j11);
                    if (object3 != null) {
                        int i39 = i18 / 3;
                        e eVar = ((i6) n6Var.f32159b[i39 + i39]).f32100a;
                        h7 h7Var = (h7) eVar.f32052b;
                        h7 h7Var2 = (h7) eVar.f32051a;
                        Iterator it2 = ((j6) object3).entrySet().iterator();
                        while (it2.hasNext()) {
                            Map.Entry entry = (Map.Entry) it2.next();
                            o5Var.n0(i22, i26);
                            Object key = entry.getKey();
                            Object value = entry.getValue();
                            int i40 = s5.f32234c;
                            int iW4 = o5.W(8);
                            h7 h7Var3 = h7.f32092e;
                            if (h7Var2 == h7Var3) {
                                iW4 += iW4;
                            }
                            i7 i7Var = i7.f32101a;
                            int i41 = i17;
                            switch (h7Var2.ordinal()) {
                                case 0:
                                    i15 = i19;
                                    it = it2;
                                    ((Double) key).getClass();
                                    iX = 8;
                                    int i42 = iX + iW4;
                                    int iW5 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                        iW5 += iW5;
                                    }
                                    switch (h7Var.ordinal()) {
                                        case 0:
                                            ((Double) value).getClass();
                                            iX2 = 8;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key2 = entry.getKey();
                                            Object value2 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key2);
                                            s5.b(o5Var, h7Var, 2, value2);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 1:
                                            ((Float) value).getClass();
                                            iX2 = 4;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key22 = entry.getKey();
                                            Object value22 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key22);
                                            s5.b(o5Var, h7Var, 2, value22);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 2:
                                            iX2 = o5.X(((Long) value).longValue());
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key222 = entry.getKey();
                                            Object value222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key222);
                                            s5.b(o5Var, h7Var, 2, value222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 3:
                                            iX2 = o5.X(((Long) value).longValue());
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key2222 = entry.getKey();
                                            Object value2222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key2222);
                                            s5.b(o5Var, h7Var, 2, value2222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 4:
                                            iX2 = o5.X(((Integer) value).intValue());
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key22222 = entry.getKey();
                                            Object value22222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key22222);
                                            s5.b(o5Var, h7Var, 2, value22222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 5:
                                            ((Long) value).getClass();
                                            iX2 = 8;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key222222 = entry.getKey();
                                            Object value222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key222222);
                                            s5.b(o5Var, h7Var, 2, value222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 6:
                                            ((Integer) value).getClass();
                                            iX2 = 4;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key2222222 = entry.getKey();
                                            Object value2222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key2222222);
                                            s5.b(o5Var, h7Var, 2, value2222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 7:
                                            ((Boolean) value).getClass();
                                            iX2 = i25;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key22222222 = entry.getKey();
                                            Object value22222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key22222222);
                                            s5.b(o5Var, h7Var, 2, value22222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 8:
                                            if (value instanceof n5) {
                                                iE2 = ((n5) value).e();
                                                iW3 = o5.W(iE2);
                                                iX2 = iE2 + iW3;
                                                o5Var.p0(iX2 + iW5 + i42);
                                                Object key222222222 = entry.getKey();
                                                Object value222222222 = entry.getValue();
                                                s5.b(o5Var, h7Var2, i25, key222222222);
                                                s5.b(o5Var, h7Var, 2, value222222222);
                                                i26 = 2;
                                                i19 = i15;
                                                i17 = i41;
                                                it2 = it;
                                                i25 = 1;
                                            } else {
                                                iX2 = o5.V((String) value);
                                                o5Var.p0(iX2 + iW5 + i42);
                                                Object key2222222222 = entry.getKey();
                                                Object value2222222222 = entry.getValue();
                                                s5.b(o5Var, h7Var2, i25, key2222222222);
                                                s5.b(o5Var, h7Var, 2, value2222222222);
                                                i26 = 2;
                                                i19 = i15;
                                                i17 = i41;
                                                it2 = it;
                                                i25 = 1;
                                            }
                                        case 9:
                                            iX2 = ((i5) value).c();
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key22222222222 = entry.getKey();
                                            Object value22222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key22222222222);
                                            s5.b(o5Var, h7Var, 2, value22222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 10:
                                            iE2 = ((i5) value).c();
                                            iW3 = o5.W(iE2);
                                            iX2 = iE2 + iW3;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key222222222222 = entry.getKey();
                                            Object value222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key222222222222);
                                            s5.b(o5Var, h7Var, 2, value222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 11:
                                            if (value instanceof n5) {
                                                iE2 = ((n5) value).e();
                                                iW3 = o5.W(iE2);
                                            } else {
                                                iE2 = ((byte[]) value).length;
                                                iW3 = o5.W(iE2);
                                            }
                                            iX2 = iE2 + iW3;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key2222222222222 = entry.getKey();
                                            Object value2222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key2222222222222);
                                            s5.b(o5Var, h7Var, 2, value2222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 12:
                                            iX2 = o5.W(((Integer) value).intValue());
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key22222222222222 = entry.getKey();
                                            Object value22222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key22222222222222);
                                            s5.b(o5Var, h7Var, 2, value22222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 13:
                                            iX2 = o5.X(((Integer) value).intValue());
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key222222222222222 = entry.getKey();
                                            Object value222222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key222222222222222);
                                            s5.b(o5Var, h7Var, 2, value222222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 14:
                                            ((Integer) value).getClass();
                                            iX2 = 4;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key2222222222222222 = entry.getKey();
                                            Object value2222222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key2222222222222222);
                                            s5.b(o5Var, h7Var, 2, value2222222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 15:
                                            ((Long) value).getClass();
                                            iX2 = 8;
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key22222222222222222 = entry.getKey();
                                            Object value22222222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key22222222222222222);
                                            s5.b(o5Var, h7Var, 2, value22222222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 16:
                                            int iIntValue = ((Integer) value).intValue();
                                            iX2 = o5.W((iIntValue >> 31) ^ (iIntValue + iIntValue));
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key222222222222222222 = entry.getKey();
                                            Object value222222222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key222222222222222222);
                                            s5.b(o5Var, h7Var, 2, value222222222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        case 17:
                                            long jLongValue = ((Long) value).longValue();
                                            iX2 = o5.X((jLongValue + jLongValue) ^ (jLongValue >> 63));
                                            o5Var.p0(iX2 + iW5 + i42);
                                            Object key2222222222222222222 = entry.getKey();
                                            Object value2222222222222222222 = entry.getValue();
                                            s5.b(o5Var, h7Var2, i25, key2222222222222222222);
                                            s5.b(o5Var, h7Var, 2, value2222222222222222222);
                                            i26 = 2;
                                            i19 = i15;
                                            i17 = i41;
                                            it2 = it;
                                            i25 = 1;
                                        default:
                                            throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                                    }
                                case 1:
                                    i15 = i19;
                                    it = it2;
                                    ((Float) key).getClass();
                                    iX = 4;
                                    int i422 = iX + iW4;
                                    int iW52 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 2:
                                    i15 = i19;
                                    it = it2;
                                    iX = o5.X(((Long) key).longValue());
                                    int i4222 = iX + iW4;
                                    int iW522 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 3:
                                    i15 = i19;
                                    it = it2;
                                    iX = o5.X(((Long) key).longValue());
                                    int i42222 = iX + iW4;
                                    int iW5222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 4:
                                    i15 = i19;
                                    it = it2;
                                    iX = o5.X(((Integer) key).intValue());
                                    int i422222 = iX + iW4;
                                    int iW52222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 5:
                                    i15 = i19;
                                    it = it2;
                                    ((Long) key).getClass();
                                    iX = 8;
                                    int i4222222 = iX + iW4;
                                    int iW522222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 6:
                                    i15 = i19;
                                    it = it2;
                                    ((Integer) key).getClass();
                                    iX = 4;
                                    int i42222222 = iX + iW4;
                                    int iW5222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 7:
                                    i15 = i19;
                                    it = it2;
                                    ((Boolean) key).getClass();
                                    iX = i25;
                                    int i422222222 = iX + iW4;
                                    int iW52222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 8:
                                    i15 = i19;
                                    it = it2;
                                    if (key instanceof n5) {
                                        iE = ((n5) key).e();
                                        iW = o5.W(iE);
                                        iX = iE + iW;
                                        int i4222222222 = iX + iW4;
                                        int iW522222222 = o5.W(16);
                                        if (h7Var == h7Var3) {
                                        }
                                        switch (h7Var.ordinal()) {
                                        }
                                    } else {
                                        iX = o5.V((String) key);
                                        int i42222222222 = iX + iW4;
                                        int iW5222222222 = o5.W(16);
                                        if (h7Var == h7Var3) {
                                        }
                                        switch (h7Var.ordinal()) {
                                        }
                                    }
                                case 9:
                                    i15 = i19;
                                    it = it2;
                                    iX = ((i5) key).c();
                                    int i422222222222 = iX + iW4;
                                    int iW52222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 10:
                                    i15 = i19;
                                    it = it2;
                                    iE = ((i5) key).c();
                                    iW = o5.W(iE);
                                    iX = iE + iW;
                                    int i4222222222222 = iX + iW4;
                                    int iW522222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 11:
                                    i15 = i19;
                                    it = it2;
                                    if (key instanceof n5) {
                                        iE = ((n5) key).e();
                                        iW = o5.W(iE);
                                    } else {
                                        iE = ((byte[]) key).length;
                                        iW = o5.W(iE);
                                    }
                                    iX = iE + iW;
                                    int i42222222222222 = iX + iW4;
                                    int iW5222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 12:
                                    i15 = i19;
                                    it = it2;
                                    iX = o5.W(((Integer) key).intValue());
                                    int i422222222222222 = iX + iW4;
                                    int iW52222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 13:
                                    i15 = i19;
                                    it = it2;
                                    iX = o5.X(((Integer) key).intValue());
                                    int i4222222222222222 = iX + iW4;
                                    int iW522222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 14:
                                    ((Integer) key).getClass();
                                    i15 = i19;
                                    it = it2;
                                    iX = 4;
                                    int i42222222222222222 = iX + iW4;
                                    int iW5222222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 15:
                                    ((Long) key).getClass();
                                    i15 = i19;
                                    it = it2;
                                    iX = 8;
                                    int i422222222222222222 = iX + iW4;
                                    int iW52222222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 16:
                                    int iIntValue2 = ((Integer) key).intValue();
                                    iW2 = o5.W((iIntValue2 + iIntValue2) ^ (iIntValue2 >> 31));
                                    i15 = i19;
                                    it = it2;
                                    iX = iW2;
                                    int i4222222222222222222 = iX + iW4;
                                    int iW522222222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                case 17:
                                    long jLongValue2 = ((Long) key).longValue();
                                    iW2 = o5.X((jLongValue2 + jLongValue2) ^ (jLongValue2 >> 63));
                                    i15 = i19;
                                    it = it2;
                                    iX = iW2;
                                    int i42222222222222222222 = iX + iW4;
                                    int iW5222222222222222222 = o5.W(16);
                                    if (h7Var == h7Var3) {
                                    }
                                    switch (h7Var.ordinal()) {
                                    }
                                default:
                                    throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                            }
                        }
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 51:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.i0(i22, Double.doubleToRawLongBits(((Double) e7.h(obj, j11)).doubleValue()));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 52:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.g0(i22, Float.floatToRawIntBits(((Float) e7.h(obj, j11)).floatValue()));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 53:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.q0(i22, k(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 54:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.q0(i22, k(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 55:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.k0(i22, h(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 56:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.i0(i22, k(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 57:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.g0(i22, h(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 58:
                    if (n6Var.f(i22, i18, obj)) {
                        byte bBooleanValue = ((Boolean) e7.h(obj, j11)).booleanValue();
                        o5Var.Z(11);
                        o5Var.c0(i22 << 3);
                        byte[] bArr2 = o5Var.f32200e;
                        int i43 = o5Var.f32202g;
                        bArr2[i43] = bBooleanValue;
                        o5Var.f32202g = i43 + 1;
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 59:
                    if (n6Var.f(i22, i18, obj)) {
                        Object object4 = unsafe.getObject(obj, j11);
                        if (object4 instanceof String) {
                            o5Var.p0((i22 << 3) | 2);
                            o5Var.m0((String) object4);
                        } else {
                            o5Var.e0(i22, (n5) object4);
                        }
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 60:
                    if (n6Var.f(i22, i18, obj)) {
                        h6Var.f(i22, unsafe.getObject(obj, j11), n6Var.l(i18));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 61:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.e0(i22, (n5) unsafe.getObject(obj, j11));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 62:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.o0(i22, h(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 63:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.k0(i22, h(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 64:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.g0(i22, h(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 65:
                    if (n6Var.f(i22, i18, obj)) {
                        o5Var.i0(i22, k(j11, obj));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 66:
                    if (n6Var.f(i22, i18, obj)) {
                        int iH = h(j11, obj);
                        o5Var.o0(i22, (iH >> 31) ^ (iH + iH));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 67:
                    if (n6Var.f(i22, i18, obj)) {
                        long jK = k(j11, obj);
                        o5Var.q0(i22, (jK >> 63) ^ (jK + jK));
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                case 68:
                    if (n6Var.f(i22, i18, obj)) {
                        Object object5 = unsafe.getObject(obj, j11);
                        o5Var.n0(i22, 3);
                        n6Var.l(i18).c((i5) object5, h6Var);
                        o5Var.n0(i22, 4);
                    }
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
                default:
                    i18 += 3;
                    i16 = 1048575;
                    n6Var = this;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:123:0x0355  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0363  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0374  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0385  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x038e  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x0397  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x03a4  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x03b0  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x03c9  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x03d4  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x03db  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x03f1  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x03f9  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x03ff  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0405  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0411  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x041c  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0427  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x042e  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x0642 A[PHI: r21 r22
      0x0642: PHI (r21v21 int) = (r21v3 int), (r21v4 int), (r21v10 int), (r21v12 int), (r21v13 int), (r21v14 int), (r21v18 int), (r21v22 int) binds: [B:273:0x080f, B:269:0x07ef, B:243:0x074a, B:229:0x06e1, B:225:0x06c1, B:221:0x06a3, B:214:0x0663, B:208:0x0640] A[DONT_GENERATE, DONT_INLINE]
      0x0642: PHI (r22v20 int) = (r22v3 int), (r22v4 int), (r22v10 int), (r22v12 int), (r22v13 int), (r22v14 int), (r22v17 int), (r22v21 int) binds: [B:273:0x080f, B:269:0x07ef, B:243:0x074a, B:229:0x06e1, B:225:0x06c1, B:221:0x06a3, B:214:0x0663, B:208:0x0640] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:263:0x07b1 A[PHI: r21 r22
      0x07b1: PHI (r21v8 int) = (r21v2 int), (r21v9 int) binds: [B:277:0x082f, B:262:0x07af] A[DONT_GENERATE, DONT_INLINE]
      0x07b1: PHI (r22v8 int) = (r22v2 int), (r22v9 int) binds: [B:277:0x082f, B:262:0x07af] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:349:0x035d A[SYNTHETIC] */
    @Override // com.google.android.gms.internal.consent_sdk.t6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d(i5 i5Var) {
        int i5;
        int i11;
        int iW;
        int iX;
        int iB;
        int i12;
        int iH;
        int i13;
        int i14;
        int size;
        int iN;
        int iW2;
        int iW3;
        int iW4;
        int iW5;
        int iB2;
        int iE;
        i6 i6Var;
        int iX2;
        int iE2;
        int iW6;
        int iX3;
        int iE3;
        int iW7;
        int iW8;
        int iX4;
        n6 n6Var = this;
        i5 i5Var2 = i5Var;
        Unsafe unsafe = f32157h;
        int i15 = 1048575;
        int i16 = 1048575;
        int i17 = 0;
        int i18 = 0;
        int iX5 = 0;
        while (true) {
            int[] iArr = n6Var.f32158a;
            if (i17 >= iArr.length) {
                y6 y6Var = ((x5) i5Var).zzc;
                int i19 = y6Var.f32324c;
                if (i19 == -1) {
                    y6Var.f32324c = 0;
                    i5 = 0;
                } else {
                    i5 = i19;
                }
                return i5 + iX5;
            }
            int iJ = n6Var.j(i17);
            int i21 = i(iJ);
            int i22 = iArr[i17];
            int i23 = iArr[i17 + 2];
            int i24 = i23 & i15;
            int i25 = 1;
            if (i21 <= 17) {
                if (i24 != i16) {
                    i18 = i24 == i15 ? 0 : unsafe.getInt(i5Var2, i24);
                    i16 = i24;
                }
                i11 = 1 << (i23 >>> 20);
            } else {
                i11 = 0;
            }
            int i26 = iJ & i15;
            if (i21 >= t5.f32245b.f32249a) {
                t5.f32246c.getClass();
            }
            long j11 = i26;
            int i27 = 4;
            int i28 = 8;
            switch (i21) {
                case 0:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 8, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 1:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 4, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 2:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        long j12 = unsafe.getLong(i5Var2, j11);
                        iW = o5.W(i22 << 3);
                        iX = o5.X(j12);
                        iB = iX + iW;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 3:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        long j13 = unsafe.getLong(i5Var2, j11);
                        iW = o5.W(i22 << 3);
                        iX = o5.X(j13);
                        iB = iX + iW;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 4:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        long j14 = unsafe.getInt(i5Var2, j11);
                        iW = o5.W(i22 << 3);
                        iX = o5.X(j14);
                        iB = iX + iW;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 5:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 8, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 6:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 4, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 7:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 1, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 8:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        int i29 = i22 << 3;
                        Object object = unsafe.getObject(i5Var2, j11);
                        if (object instanceof n5) {
                            int iW9 = o5.W(i29);
                            int iE4 = ((n5) object).e();
                            iX5 = c9.e(iE4, iE4, iW9, iX5);
                        } else {
                            iW = o5.W(i29);
                            iX = o5.V((String) object);
                            iB = iX + iW;
                            iX5 += iB;
                        }
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 9:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        Object object2 = unsafe.getObject(i5Var2, j11);
                        t6 t6VarL = n6Var.l(i17);
                        z6 z6Var = u6.f32258a;
                        int iW10 = o5.W(i22 << 3);
                        int iB3 = ((i5) object2).b(t6VarL);
                        iX5 = c9.e(iB3, iB3, iW10, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 10:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        n5 n5Var = (n5) unsafe.getObject(i5Var2, j11);
                        int iW11 = o5.W(i22 << 3);
                        int iE5 = n5Var.e();
                        iX5 = c9.e(iE5, iE5, iW11, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 11:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(unsafe.getInt(i5Var2, j11), o5.W(i22 << 3), iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 12:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        long j15 = unsafe.getInt(i5Var2, j11);
                        iW = o5.W(i22 << 3);
                        iX = o5.X(j15);
                        iB = iX + iW;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 13:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 4, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 14:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        iX5 = c9.x(i22 << 3, 8, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 15:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        int i31 = unsafe.getInt(i5Var2, j11);
                        iX5 = c9.x((i31 >> 31) ^ (i31 + i31), o5.W(i22 << 3), iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 16:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        long j16 = unsafe.getLong(i5Var2, j11);
                        iW = o5.W(i22 << 3);
                        iX = o5.X((j16 >> 63) ^ (j16 + j16));
                        iB = iX + iW;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 17:
                    if (n6Var.s(i5Var2, i17, i16, i18, i11)) {
                        i5 i5Var3 = (i5) unsafe.getObject(i5Var2, j11);
                        t6 t6VarL2 = n6Var.l(i17);
                        z6 z6Var2 = u6.f32258a;
                        int iW12 = o5.W(i22 << 3);
                        iB = i5Var3.b(t6VarL2) + iW12 + iW12;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 18:
                    i12 = i16;
                    iH = u6.h(i22, (List) unsafe.getObject(i5Var2, j11));
                    iX5 += iH;
                    i16 = i12;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 19:
                    i12 = i16;
                    iH = u6.g(i22, (List) unsafe.getObject(i5Var2, j11));
                    iX5 += iH;
                    i16 = i12;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 20:
                    i13 = i16;
                    i14 = i18;
                    List list = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var3 = u6.f32258a;
                    iW3 = list.size() == 0 ? 0 : (o5.W(i22 << 3) * list.size()) + u6.j(list);
                    iX5 += iW3;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 21:
                    i13 = i16;
                    i14 = i18;
                    List list2 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var4 = u6.f32258a;
                    size = list2.size();
                    if (size != 0) {
                        iN = u6.n(list2);
                        iW2 = o5.W(i22 << 3);
                        iW4 = (iW2 * size) + iN;
                        iX5 += iW4;
                        i16 = i13;
                        i18 = i14;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                    iW4 = 0;
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 22:
                    i13 = i16;
                    i14 = i18;
                    List list3 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var5 = u6.f32258a;
                    size = list3.size();
                    if (size != 0) {
                        iN = u6.i(list3);
                        iW2 = o5.W(i22 << 3);
                        iW4 = (iW2 * size) + iN;
                        iX5 += iW4;
                        i16 = i13;
                        i18 = i14;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                    iW4 = 0;
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 23:
                    i12 = i16;
                    iH = u6.h(i22, (List) unsafe.getObject(i5Var2, j11));
                    iX5 += iH;
                    i16 = i12;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 24:
                    i12 = i16;
                    iH = u6.g(i22, (List) unsafe.getObject(i5Var2, j11));
                    iX5 += iH;
                    i16 = i12;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 25:
                    i13 = i16;
                    i14 = i18;
                    List list4 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var6 = u6.f32258a;
                    int size2 = list4.size();
                    if (size2 != 0) {
                        iW3 = (o5.W(i22 << 3) + 1) * size2;
                    }
                    iX5 += iW3;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                    break;
                case 26:
                    i13 = i16;
                    i14 = i18;
                    List list5 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var7 = u6.f32258a;
                    int size3 = list5.size();
                    if (size3 == 0) {
                        iW4 = 0;
                    } else {
                        iW4 = o5.W(i22 << 3) * size3;
                        if (list5 instanceof e6) {
                            e6 e6Var = (e6) list5;
                            for (int i32 = 0; i32 < size3; i32++) {
                                Object objZza = e6Var.zza();
                                if (objZza instanceof n5) {
                                    int iE6 = ((n5) objZza).e();
                                    iW4 = c9.x(iE6, iE6, iW4);
                                } else {
                                    iW4 = o5.V((String) objZza) + iW4;
                                }
                            }
                        } else {
                            for (int i33 = 0; i33 < size3; i33++) {
                                Object obj = list5.get(i33);
                                if (obj instanceof n5) {
                                    int iE7 = ((n5) obj).e();
                                    iW4 = c9.x(iE7, iE7, iW4);
                                } else {
                                    iW4 = o5.V((String) obj) + iW4;
                                }
                            }
                        }
                    }
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 27:
                    i13 = i16;
                    i14 = i18;
                    List list6 = (List) unsafe.getObject(i5Var2, j11);
                    t6 t6VarL3 = n6Var.l(i17);
                    z6 z6Var8 = u6.f32258a;
                    int size4 = list6.size();
                    if (size4 == 0) {
                        iW5 = 0;
                    } else {
                        iW5 = o5.W(i22 << 3) * size4;
                        for (int i34 = 0; i34 < size4; i34++) {
                            int iB4 = ((i5) list6.get(i34)).b(t6VarL3);
                            iW5 = c9.x(iB4, iB4, iW5);
                        }
                    }
                    iX5 += iW5;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 28:
                    i13 = i16;
                    i14 = i18;
                    List list7 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var9 = u6.f32258a;
                    int size5 = list7.size();
                    if (size5 != 0) {
                        iW4 = o5.W(i22 << 3) * size5;
                        for (int i35 = 0; i35 < list7.size(); i35++) {
                            int iE8 = ((n5) list7.get(i35)).e();
                            iW4 = c9.x(iE8, iE8, iW4);
                        }
                    }
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                    break;
                case 29:
                    i13 = i16;
                    i14 = i18;
                    List list8 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var10 = u6.f32258a;
                    size = list8.size();
                    if (size != 0) {
                        iN = u6.m(list8);
                        iW2 = o5.W(i22 << 3);
                        iW4 = (iW2 * size) + iN;
                        iX5 += iW4;
                        i16 = i13;
                        i18 = i14;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                    iW4 = 0;
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 30:
                    i13 = i16;
                    i14 = i18;
                    List list9 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var11 = u6.f32258a;
                    size = list9.size();
                    if (size != 0) {
                        iN = u6.f(list9);
                        iW2 = o5.W(i22 << 3);
                        iW4 = (iW2 * size) + iN;
                        iX5 += iW4;
                        i16 = i13;
                        i18 = i14;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                    iW4 = 0;
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 31:
                    i12 = i16;
                    iH = u6.g(i22, (List) unsafe.getObject(i5Var2, j11));
                    iX5 += iH;
                    i16 = i12;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 32:
                    i12 = i16;
                    iH = u6.h(i22, (List) unsafe.getObject(i5Var2, j11));
                    iX5 += iH;
                    i16 = i12;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 33:
                    i13 = i16;
                    i14 = i18;
                    List list10 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var12 = u6.f32258a;
                    size = list10.size();
                    if (size != 0) {
                        iN = u6.k(list10);
                        iW2 = o5.W(i22 << 3);
                        iW4 = (iW2 * size) + iN;
                        iX5 += iW4;
                        i16 = i13;
                        i18 = i14;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                    iW4 = 0;
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 34:
                    i13 = i16;
                    i14 = i18;
                    List list11 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var13 = u6.f32258a;
                    size = list11.size();
                    if (size != 0) {
                        iN = u6.l(list11);
                        iW2 = o5.W(i22 << 3);
                        iW4 = (iW2 * size) + iN;
                        iX5 += iW4;
                        i16 = i13;
                        i18 = i14;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                    iW4 = 0;
                    iX5 += iW4;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 35:
                    i13 = i16;
                    i14 = i18;
                    List list12 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var14 = u6.f32258a;
                    int size6 = list12.size() * 8;
                    if (size6 > 0) {
                        iX5 = c9.e(size6, o5.W(i22 << 3), size6, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 36:
                    i13 = i16;
                    i14 = i18;
                    List list13 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var15 = u6.f32258a;
                    int size7 = list13.size() * 4;
                    if (size7 > 0) {
                        iX5 = c9.e(size7, o5.W(i22 << 3), size7, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 37:
                    i13 = i16;
                    i14 = i18;
                    int iJ2 = u6.j((List) unsafe.getObject(i5Var2, j11));
                    if (iJ2 > 0) {
                        iX5 = c9.e(iJ2, o5.W(i22 << 3), iJ2, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 38:
                    i13 = i16;
                    i14 = i18;
                    int iN2 = u6.n((List) unsafe.getObject(i5Var2, j11));
                    if (iN2 > 0) {
                        iX5 = c9.e(iN2, o5.W(i22 << 3), iN2, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 39:
                    i13 = i16;
                    i14 = i18;
                    int i36 = u6.i((List) unsafe.getObject(i5Var2, j11));
                    if (i36 > 0) {
                        iX5 = c9.e(i36, o5.W(i22 << 3), i36, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 40:
                    i13 = i16;
                    i14 = i18;
                    List list14 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var16 = u6.f32258a;
                    int size8 = list14.size() * 8;
                    if (size8 > 0) {
                        iX5 = c9.e(size8, o5.W(i22 << 3), size8, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 41:
                    i13 = i16;
                    i14 = i18;
                    List list15 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var17 = u6.f32258a;
                    int size9 = list15.size() * 4;
                    if (size9 > 0) {
                        iX5 = c9.e(size9, o5.W(i22 << 3), size9, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 42:
                    i13 = i16;
                    i14 = i18;
                    List list16 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var18 = u6.f32258a;
                    int size10 = list16.size();
                    if (size10 > 0) {
                        iX5 = c9.e(size10, o5.W(i22 << 3), size10, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 43:
                    i13 = i16;
                    i14 = i18;
                    int iM = u6.m((List) unsafe.getObject(i5Var2, j11));
                    if (iM > 0) {
                        iX5 = c9.e(iM, o5.W(i22 << 3), iM, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 44:
                    i13 = i16;
                    i14 = i18;
                    int iF = u6.f((List) unsafe.getObject(i5Var2, j11));
                    if (iF > 0) {
                        iX5 = c9.e(iF, o5.W(i22 << 3), iF, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 45:
                    i13 = i16;
                    i14 = i18;
                    List list17 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var19 = u6.f32258a;
                    int size11 = list17.size() * 4;
                    if (size11 > 0) {
                        iX5 = c9.e(size11, o5.W(i22 << 3), size11, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 46:
                    i13 = i16;
                    i14 = i18;
                    List list18 = (List) unsafe.getObject(i5Var2, j11);
                    z6 z6Var20 = u6.f32258a;
                    int size12 = list18.size() * 8;
                    if (size12 > 0) {
                        iX5 = c9.e(size12, o5.W(i22 << 3), size12, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 47:
                    i13 = i16;
                    i14 = i18;
                    int iK = u6.k((List) unsafe.getObject(i5Var2, j11));
                    if (iK > 0) {
                        iX5 = c9.e(iK, o5.W(i22 << 3), iK, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 48:
                    i13 = i16;
                    i14 = i18;
                    int iL = u6.l((List) unsafe.getObject(i5Var2, j11));
                    if (iL > 0) {
                        iX5 = c9.e(iL, o5.W(i22 << 3), iL, iX5);
                    }
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 49:
                    i13 = i16;
                    i14 = i18;
                    List list19 = (List) unsafe.getObject(i5Var2, j11);
                    t6 t6VarL4 = n6Var.l(i17);
                    z6 z6Var21 = u6.f32258a;
                    int size13 = list19.size();
                    if (size13 == 0) {
                        iB2 = 0;
                    } else {
                        iB2 = 0;
                        for (int i37 = 0; i37 < size13; i37++) {
                            i5 i5Var4 = (i5) list19.get(i37);
                            int iW13 = o5.W(i22 << 3);
                            iB2 += i5Var4.b(t6VarL4) + iW13 + iW13;
                        }
                    }
                    iX5 += iB2;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 50:
                    int i38 = i17 / 3;
                    j6 j6Var = (j6) unsafe.getObject(i5Var2, j11);
                    i6 i6Var2 = (i6) n6Var.f32159b[i38 + i38];
                    if (j6Var.isEmpty()) {
                        iE = 0;
                    } else {
                        iE = 0;
                        for (Map.Entry entry : j6Var.entrySet()) {
                            Object key = entry.getKey();
                            Object value = entry.getValue();
                            int i39 = i25;
                            e eVar = i6Var2.f32100a;
                            int i40 = i27;
                            int iW14 = o5.W(i22 << 3);
                            int i41 = i28;
                            h7 h7Var = (h7) eVar.f32051a;
                            h7 h7Var2 = (h7) eVar.f32052b;
                            int i42 = s5.f32234c;
                            int iW15 = o5.W(i41);
                            int i43 = i16;
                            h7 h7Var3 = h7.f32092e;
                            if (h7Var == h7Var3) {
                                iW15 += iW15;
                            }
                            i7 i7Var = i7.f32101a;
                            int i44 = i18;
                            switch (h7Var.ordinal()) {
                                case 0:
                                    i6Var = i6Var2;
                                    ((Double) key).getClass();
                                    iX2 = i41;
                                    int i45 = iX2 + iW15;
                                    int iW16 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                        iW16 += iW16;
                                    }
                                    switch (h7Var2.ordinal()) {
                                        case 0:
                                            ((Double) value).getClass();
                                            iX3 = i41;
                                            int i46 = iX3 + iW16 + i45;
                                            iE = c9.e(i46, i46, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 1:
                                            ((Float) value).getClass();
                                            iX3 = i40;
                                            int i462 = iX3 + iW16 + i45;
                                            iE = c9.e(i462, i462, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 2:
                                            iX3 = o5.X(((Long) value).longValue());
                                            int i4622 = iX3 + iW16 + i45;
                                            iE = c9.e(i4622, i4622, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 3:
                                            iX3 = o5.X(((Long) value).longValue());
                                            int i46222 = iX3 + iW16 + i45;
                                            iE = c9.e(i46222, i46222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 4:
                                            iX3 = o5.X(((Integer) value).intValue());
                                            int i462222 = iX3 + iW16 + i45;
                                            iE = c9.e(i462222, i462222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 5:
                                            ((Long) value).getClass();
                                            iX3 = i41;
                                            int i4622222 = iX3 + iW16 + i45;
                                            iE = c9.e(i4622222, i4622222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 6:
                                            ((Integer) value).getClass();
                                            iX3 = i40;
                                            int i46222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i46222222, i46222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 7:
                                            ((Boolean) value).getClass();
                                            iX3 = i39;
                                            int i462222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i462222222, i462222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 8:
                                            if (value instanceof n5) {
                                                iE3 = ((n5) value).e();
                                                iW7 = o5.W(iE3);
                                                iX3 = iE3 + iW7;
                                                int i4622222222 = iX3 + iW16 + i45;
                                                iE = c9.e(i4622222222, i4622222222, iW14, iE);
                                                i25 = i39;
                                                i28 = i41;
                                                i27 = i40;
                                                i16 = i43;
                                                i18 = i44;
                                                i6Var2 = i6Var;
                                            } else {
                                                iX3 = o5.V((String) value);
                                                int i46222222222 = iX3 + iW16 + i45;
                                                iE = c9.e(i46222222222, i46222222222, iW14, iE);
                                                i25 = i39;
                                                i28 = i41;
                                                i27 = i40;
                                                i16 = i43;
                                                i18 = i44;
                                                i6Var2 = i6Var;
                                            }
                                        case 9:
                                            iX3 = ((i5) value).c();
                                            int i462222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i462222222222, i462222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 10:
                                            iE3 = ((i5) value).c();
                                            iW7 = o5.W(iE3);
                                            iX3 = iE3 + iW7;
                                            int i4622222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i4622222222222, i4622222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 11:
                                            if (value instanceof n5) {
                                                iE3 = ((n5) value).e();
                                                iW7 = o5.W(iE3);
                                            } else {
                                                iE3 = ((byte[]) value).length;
                                                iW7 = o5.W(iE3);
                                            }
                                            iX3 = iE3 + iW7;
                                            int i46222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i46222222222222, i46222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 12:
                                            iX3 = o5.W(((Integer) value).intValue());
                                            int i462222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i462222222222222, i462222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 13:
                                            iX3 = o5.X(((Integer) value).intValue());
                                            int i4622222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i4622222222222222, i4622222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 14:
                                            ((Integer) value).getClass();
                                            iX3 = i40;
                                            int i46222222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i46222222222222222, i46222222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 15:
                                            ((Long) value).getClass();
                                            iX3 = i41;
                                            int i462222222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i462222222222222222, i462222222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 16:
                                            int iIntValue = ((Integer) value).intValue();
                                            iX3 = o5.W((iIntValue >> 31) ^ (iIntValue + iIntValue));
                                            int i4622222222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i4622222222222222222, i4622222222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        case 17:
                                            long jLongValue = ((Long) value).longValue();
                                            iX3 = o5.X((jLongValue >> 63) ^ (jLongValue + jLongValue));
                                            int i46222222222222222222 = iX3 + iW16 + i45;
                                            iE = c9.e(i46222222222222222222, i46222222222222222222, iW14, iE);
                                            i25 = i39;
                                            i28 = i41;
                                            i27 = i40;
                                            i16 = i43;
                                            i18 = i44;
                                            i6Var2 = i6Var;
                                        default:
                                            throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                                    }
                                case 1:
                                    i6Var = i6Var2;
                                    ((Float) key).getClass();
                                    iX2 = i40;
                                    int i452 = iX2 + iW15;
                                    int iW162 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 2:
                                    i6Var = i6Var2;
                                    iX2 = o5.X(((Long) key).longValue());
                                    int i4522 = iX2 + iW15;
                                    int iW1622 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 3:
                                    i6Var = i6Var2;
                                    iX2 = o5.X(((Long) key).longValue());
                                    int i45222 = iX2 + iW15;
                                    int iW16222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 4:
                                    i6Var = i6Var2;
                                    iX2 = o5.X(((Integer) key).intValue());
                                    int i452222 = iX2 + iW15;
                                    int iW162222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 5:
                                    i6Var = i6Var2;
                                    ((Long) key).getClass();
                                    iX2 = i41;
                                    int i4522222 = iX2 + iW15;
                                    int iW1622222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 6:
                                    i6Var = i6Var2;
                                    ((Integer) key).getClass();
                                    iX2 = i40;
                                    int i45222222 = iX2 + iW15;
                                    int iW16222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 7:
                                    i6Var = i6Var2;
                                    ((Boolean) key).getClass();
                                    iX2 = i39;
                                    int i452222222 = iX2 + iW15;
                                    int iW162222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 8:
                                    i6Var = i6Var2;
                                    if (key instanceof n5) {
                                        iE2 = ((n5) key).e();
                                        iW6 = o5.W(iE2);
                                        iX2 = iE2 + iW6;
                                        int i4522222222 = iX2 + iW15;
                                        int iW1622222222 = o5.W(16);
                                        if (h7Var2 == h7Var3) {
                                        }
                                        switch (h7Var2.ordinal()) {
                                        }
                                    } else {
                                        iX2 = o5.V((String) key);
                                        int i45222222222 = iX2 + iW15;
                                        int iW16222222222 = o5.W(16);
                                        if (h7Var2 == h7Var3) {
                                        }
                                        switch (h7Var2.ordinal()) {
                                        }
                                    }
                                case 9:
                                    i6Var = i6Var2;
                                    iX2 = ((i5) key).c();
                                    int i452222222222 = iX2 + iW15;
                                    int iW162222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 10:
                                    i6Var = i6Var2;
                                    iE2 = ((i5) key).c();
                                    iW6 = o5.W(iE2);
                                    iX2 = iE2 + iW6;
                                    int i4522222222222 = iX2 + iW15;
                                    int iW1622222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 11:
                                    i6Var = i6Var2;
                                    if (key instanceof n5) {
                                        iE2 = ((n5) key).e();
                                        iW6 = o5.W(iE2);
                                    } else {
                                        iE2 = ((byte[]) key).length;
                                        iW6 = o5.W(iE2);
                                    }
                                    iX2 = iE2 + iW6;
                                    int i45222222222222 = iX2 + iW15;
                                    int iW16222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 12:
                                    i6Var = i6Var2;
                                    iX2 = o5.W(((Integer) key).intValue());
                                    int i452222222222222 = iX2 + iW15;
                                    int iW162222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 13:
                                    i6Var = i6Var2;
                                    iX2 = o5.X(((Integer) key).intValue());
                                    int i4522222222222222 = iX2 + iW15;
                                    int iW1622222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 14:
                                    ((Integer) key).getClass();
                                    i6Var = i6Var2;
                                    iX2 = i40;
                                    int i45222222222222222 = iX2 + iW15;
                                    int iW16222222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 15:
                                    ((Long) key).getClass();
                                    i6Var = i6Var2;
                                    iX2 = i41;
                                    int i452222222222222222 = iX2 + iW15;
                                    int iW162222222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 16:
                                    int iIntValue2 = ((Integer) key).intValue();
                                    iX2 = o5.W((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
                                    i6Var = i6Var2;
                                    int i4522222222222222222 = iX2 + iW15;
                                    int iW1622222222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                case 17:
                                    long jLongValue2 = ((Long) key).longValue();
                                    iX2 = o5.X((jLongValue2 + jLongValue2) ^ (jLongValue2 >> 63));
                                    i6Var = i6Var2;
                                    int i45222222222222222222 = iX2 + iW15;
                                    int iW16222222222222222222 = o5.W(16);
                                    if (h7Var2 == h7Var3) {
                                    }
                                    switch (h7Var2.ordinal()) {
                                    }
                                default:
                                    throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                            }
                        }
                    }
                    i13 = i16;
                    i14 = i18;
                    iX5 += iE;
                    i16 = i13;
                    i18 = i14;
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 51:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 8, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 52:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 4, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 53:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        long jK = k(j11, i5Var2);
                        iW8 = o5.W(i22 << 3);
                        iX4 = o5.X(jK);
                        iX5 += iX4 + iW8;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 54:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        long jK2 = k(j11, i5Var2);
                        iW8 = o5.W(i22 << 3);
                        iX4 = o5.X(jK2);
                        iX5 += iX4 + iW8;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 55:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        long jH = h(j11, i5Var2);
                        iW8 = o5.W(i22 << 3);
                        iX4 = o5.X(jH);
                        iX5 += iX4 + iW8;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 56:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 8, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 57:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 4, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 58:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 1, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 59:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        int i47 = i22 << 3;
                        Object object3 = unsafe.getObject(i5Var2, j11);
                        if (object3 instanceof n5) {
                            int iW17 = o5.W(i47);
                            int iE9 = ((n5) object3).e();
                            iX5 = c9.e(iE9, iE9, iW17, iX5);
                        } else {
                            iW8 = o5.W(i47);
                            iX4 = o5.V((String) object3);
                            iX5 += iX4 + iW8;
                        }
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 60:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        Object object4 = unsafe.getObject(i5Var2, j11);
                        t6 t6VarL5 = n6Var.l(i17);
                        z6 z6Var22 = u6.f32258a;
                        int iW18 = o5.W(i22 << 3);
                        int iB5 = ((i5) object4).b(t6VarL5);
                        iX5 = c9.e(iB5, iB5, iW18, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 61:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        n5 n5Var2 = (n5) unsafe.getObject(i5Var2, j11);
                        int iW19 = o5.W(i22 << 3);
                        int iE10 = n5Var2.e();
                        iX5 = c9.e(iE10, iE10, iW19, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 62:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(h(j11, i5Var2), o5.W(i22 << 3), iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 63:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        long jH2 = h(j11, i5Var2);
                        iW8 = o5.W(i22 << 3);
                        iX4 = o5.X(jH2);
                        iX5 += iX4 + iW8;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 64:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 4, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 65:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        iX5 = c9.x(i22 << 3, 8, iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 66:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        int iH2 = h(j11, i5Var2);
                        iX5 = c9.x((iH2 >> 31) ^ (iH2 + iH2), o5.W(i22 << 3), iX5);
                    }
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
                case 67:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        long jK3 = k(j11, i5Var2);
                        iW8 = o5.W(i22 << 3);
                        iX4 = o5.X((jK3 >> 63) ^ (jK3 + jK3));
                        iX5 += iX4 + iW8;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                case 68:
                    if (n6Var.f(i22, i17, i5Var2)) {
                        i5 i5Var5 = (i5) unsafe.getObject(i5Var2, j11);
                        t6 t6VarL6 = n6Var.l(i17);
                        z6 z6Var23 = u6.f32258a;
                        int iW20 = o5.W(i22 << 3);
                        iB = i5Var5.b(t6VarL6) + iW20 + iW20;
                        iX5 += iB;
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    } else {
                        i17 += 3;
                        n6Var = this;
                        i5Var2 = i5Var;
                        i15 = 1048575;
                    }
                default:
                    i17 += 3;
                    n6Var = this;
                    i5Var2 = i5Var;
                    i15 = 1048575;
            }
        }
    }

    public final boolean f(int i5, int i11, Object obj) {
        return e7.e(obj, (long) (this.f32158a[i11 + 2] & 1048575)) == i5;
    }

    public final int j(int i5) {
        return this.f32158a[i5 + 1];
    }

    public final t6 l(int i5) {
        int i11 = i5 / 3;
        int i12 = i11 + i11;
        Object[] objArr = this.f32159b;
        t6 t6Var = (t6) objArr[i12];
        if (t6Var != null) {
            return t6Var;
        }
        t6 t6VarA = q6.f32217c.a((Class) objArr[i12 + 1]);
        objArr[i12] = t6VarA;
        return t6VarA;
    }

    public final void n(int i5, Object obj, Object obj2) {
        if (r(i5, obj2)) {
            int iJ = j(i5) & 1048575;
            Unsafe unsafe = f32157h;
            long j11 = iJ;
            Object object = unsafe.getObject(obj2, j11);
            if (object == null) {
                throw new IllegalStateException(a80.m.f(this.f32158a[i5], "Source subfield ", " is present but null: ", obj2.toString()));
            }
            t6 t6VarL = l(i5);
            if (!r(i5, obj)) {
                if (e(object)) {
                    x5 x5VarZzc = t6VarL.zzc();
                    t6VarL.zze(x5VarZzc, object);
                    unsafe.putObject(obj, j11, x5VarZzc);
                } else {
                    unsafe.putObject(obj, j11, object);
                }
                p(i5, obj);
                return;
            }
            Object object2 = unsafe.getObject(obj, j11);
            if (!e(object2)) {
                x5 x5VarZzc2 = t6VarL.zzc();
                t6VarL.zze(x5VarZzc2, object2);
                unsafe.putObject(obj, j11, x5VarZzc2);
                object2 = x5VarZzc2;
            }
            t6VarL.zze(object2, object);
        }
    }

    public final void o(int i5, Object obj, Object obj2) {
        int[] iArr = this.f32158a;
        int i11 = iArr[i5];
        if (f(i11, i5, obj2)) {
            int iJ = j(i5) & 1048575;
            Unsafe unsafe = f32157h;
            long j11 = iJ;
            Object object = unsafe.getObject(obj2, j11);
            if (object == null) {
                throw new IllegalStateException(a80.m.f(iArr[i5], "Source subfield ", " is present but null: ", obj2.toString()));
            }
            t6 t6VarL = l(i5);
            if (!f(i11, i5, obj)) {
                if (e(object)) {
                    x5 x5VarZzc = t6VarL.zzc();
                    t6VarL.zze(x5VarZzc, object);
                    unsafe.putObject(obj, j11, x5VarZzc);
                } else {
                    unsafe.putObject(obj, j11, object);
                }
                e7.j(obj, iArr[i5 + 2] & 1048575, i11);
                return;
            }
            Object object2 = unsafe.getObject(obj, j11);
            if (!e(object2)) {
                x5 x5VarZzc2 = t6VarL.zzc();
                t6VarL.zze(x5VarZzc2, object2);
                unsafe.putObject(obj, j11, x5VarZzc2);
                object2 = x5VarZzc2;
            }
            t6VarL.zze(object2, object);
        }
    }

    public final void p(int i5, Object obj) {
        int i11 = this.f32158a[i5 + 2];
        long j11 = 1048575 & i11;
        if (j11 == 1048575) {
            return;
        }
        e7.j(obj, j11, (1 << (i11 >>> 20)) | e7.e(obj, j11));
    }

    public final boolean q(x5 x5Var, x5 x5Var2, int i5) {
        return r(i5, x5Var) == r(i5, x5Var2);
    }

    public final boolean r(int i5, Object obj) {
        int i11 = this.f32158a[i5 + 2];
        long j11 = i11 & 1048575;
        if (j11 == 1048575) {
            int iJ = j(i5);
            long j12 = iJ & 1048575;
            switch (i(iJ)) {
                case 0:
                    if (Double.doubleToRawLongBits(e7.f32057c.a(obj, j12)) == 0) {
                        return false;
                    }
                    break;
                case 1:
                    if (Float.floatToRawIntBits(e7.f32057c.b(obj, j12)) == 0) {
                        return false;
                    }
                    break;
                case 2:
                    if (e7.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 3:
                    if (e7.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 4:
                    if (e7.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 5:
                    if (e7.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 6:
                    if (e7.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 7:
                    return e7.f32057c.g(obj, j12);
                case 8:
                    Object objH = e7.h(obj, j12);
                    if (objH instanceof String) {
                        if (((String) objH).isEmpty()) {
                            return false;
                        }
                    } else {
                        if (!(objH instanceof n5)) {
                            throw new IllegalArgumentException();
                        }
                        if (n5.f32153c.equals(objH)) {
                            return false;
                        }
                    }
                    break;
                case 9:
                    if (e7.h(obj, j12) == null) {
                        return false;
                    }
                    break;
                case 10:
                    if (n5.f32153c.equals(e7.h(obj, j12))) {
                        return false;
                    }
                    break;
                case 11:
                    if (e7.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 12:
                    if (e7.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 13:
                    if (e7.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 14:
                    if (e7.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 15:
                    if (e7.e(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 16:
                    if (e7.f(obj, j12) == 0) {
                        return false;
                    }
                    break;
                case 17:
                    if (e7.h(obj, j12) == null) {
                        return false;
                    }
                    break;
                default:
                    throw new IllegalArgumentException();
            }
        } else if (((1 << (i11 >>> 20)) & e7.e(obj, j11)) == 0) {
            return false;
        }
        return true;
    }

    public final boolean s(Object obj, int i5, int i11, int i12, int i13) {
        return i11 == 1048575 ? r(i5, obj) : (i12 & i13) != 0;
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final x5 zzc() {
        return (x5) ((x5) this.f32160c).f(4);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0071  */
    @Override // com.google.android.gms.internal.consent_sdk.t6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzd(Object obj) {
        if (!e(obj)) {
            return;
        }
        if (obj instanceof x5) {
            x5 x5Var = (x5) obj;
            x5Var.d();
            x5Var.zza = 0;
            x5Var.k();
        }
        int i5 = 0;
        while (true) {
            int[] iArr = this.f32158a;
            if (i5 >= iArr.length) {
                this.f32163f.getClass();
                y6 y6Var = ((x5) obj).zzc;
                if (y6Var.f32325d) {
                    y6Var.f32325d = false;
                    return;
                }
                return;
            }
            int iJ = j(i5);
            int i11 = 1048575 & iJ;
            int i12 = i(iJ);
            long j11 = i11;
            if (i12 != 9) {
                if (i12 != 60 && i12 != 68) {
                    switch (i12) {
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
                            j5 j5Var = (j5) ((a6) e7.h(obj, j11));
                            if (!j5Var.f32113a) {
                                break;
                            } else {
                                j5Var.f32113a = false;
                                break;
                            }
                        case 50:
                            Unsafe unsafe = f32157h;
                            Object object = unsafe.getObject(obj, j11);
                            if (object == null) {
                                break;
                            } else {
                                ((j6) object).f32115a = false;
                                unsafe.putObject(obj, j11, object);
                                break;
                            }
                    }
                } else if (f(iArr[i5], i5, obj)) {
                    l(i5).zzd(f32157h.getObject(obj, j11));
                }
            } else if (r(i5, obj)) {
                l(i5).zzd(f32157h.getObject(obj, j11));
            }
            i5 += 3;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0022  */
    @Override // com.google.android.gms.internal.consent_sdk.t6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zze(Object obj, Object obj2) {
        Object obj3;
        if (!e(obj)) {
            throw new IllegalArgumentException("Mutating immutable message: ".concat(String.valueOf(obj)));
        }
        obj2.getClass();
        int i5 = 0;
        while (true) {
            int[] iArr = this.f32158a;
            if (i5 >= iArr.length) {
                u6.o(obj, obj2);
                return;
            }
            int iJ = j(i5);
            int i11 = iJ & 1048575;
            int i12 = i(iJ);
            int i13 = iArr[i5];
            long j11 = i11;
            switch (i12) {
                case 0:
                    if (!r(i5, obj2)) {
                        obj3 = obj;
                        break;
                    } else {
                        d7 d7Var = e7.f32057c;
                        obj3 = obj;
                        d7Var.e(obj3, j11, d7Var.a(obj2, j11));
                        p(i5, obj3);
                        break;
                    }
                case 1:
                    if (r(i5, obj2)) {
                        d7 d7Var2 = e7.f32057c;
                        d7Var2.f(obj, j11, d7Var2.b(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 2:
                    if (r(i5, obj2)) {
                        e7.k(obj, j11, e7.f(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 3:
                    if (r(i5, obj2)) {
                        e7.k(obj, j11, e7.f(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 4:
                    if (r(i5, obj2)) {
                        e7.j(obj, j11, e7.e(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 5:
                    if (r(i5, obj2)) {
                        e7.k(obj, j11, e7.f(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 6:
                    if (r(i5, obj2)) {
                        e7.j(obj, j11, e7.e(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 7:
                    if (r(i5, obj2)) {
                        d7 d7Var3 = e7.f32057c;
                        d7Var3.c(obj, j11, d7Var3.g(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 8:
                    if (r(i5, obj2)) {
                        e7.l(obj, j11, e7.h(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 9:
                    n(i5, obj, obj2);
                    obj3 = obj;
                    break;
                case 10:
                    if (r(i5, obj2)) {
                        e7.l(obj, j11, e7.h(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 11:
                    if (r(i5, obj2)) {
                        e7.j(obj, j11, e7.e(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 12:
                    if (r(i5, obj2)) {
                        e7.j(obj, j11, e7.e(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 13:
                    if (r(i5, obj2)) {
                        e7.j(obj, j11, e7.e(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 14:
                    if (r(i5, obj2)) {
                        e7.k(obj, j11, e7.f(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 15:
                    if (r(i5, obj2)) {
                        e7.j(obj, j11, e7.e(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 16:
                    if (r(i5, obj2)) {
                        e7.k(obj, j11, e7.f(obj2, j11));
                        p(i5, obj);
                    }
                    obj3 = obj;
                    break;
                case 17:
                    n(i5, obj, obj2);
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
                    a6 a6VarZzd = (a6) e7.h(obj, j11);
                    a6 a6Var = (a6) e7.h(obj2, j11);
                    int size = a6VarZzd.size();
                    int size2 = a6Var.size();
                    if (size > 0 && size2 > 0) {
                        if (!((j5) a6VarZzd).f32113a) {
                            a6VarZzd = a6VarZzd.zzd(size2 + size);
                        }
                        a6VarZzd.addAll(a6Var);
                    }
                    if (size > 0) {
                        a6Var = a6VarZzd;
                    }
                    e7.l(obj, j11, a6Var);
                    obj3 = obj;
                    break;
                case 50:
                    z6 z6Var = u6.f32258a;
                    j6 j6Var = (j6) e7.h(obj, j11);
                    j6 j6Var2 = (j6) e7.h(obj2, j11);
                    if (!j6Var2.isEmpty()) {
                        if (!j6Var.f32115a) {
                            if (j6Var.isEmpty()) {
                                j6Var = new j6();
                            } else {
                                j6 j6Var3 = new j6(j6Var);
                                j6Var3.f32115a = true;
                                j6Var = j6Var3;
                            }
                        }
                        j6Var.a();
                        if (!j6Var2.isEmpty()) {
                            j6Var.putAll(j6Var2);
                        }
                    }
                    e7.l(obj, j11, j6Var);
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
                    if (f(i13, i5, obj2)) {
                        e7.l(obj, j11, e7.h(obj2, j11));
                        e7.j(obj, iArr[i5 + 2] & 1048575, i13);
                    }
                    obj3 = obj;
                    break;
                case 60:
                    o(i5, obj, obj2);
                    obj3 = obj;
                    break;
                case 61:
                case 62:
                case 63:
                case 64:
                case 65:
                case 66:
                case 67:
                    if (f(i13, i5, obj2)) {
                        e7.l(obj, j11, e7.h(obj2, j11));
                        e7.j(obj, iArr[i5 + 2] & 1048575, i13);
                    }
                    obj3 = obj;
                    break;
                case 68:
                    o(i5, obj, obj2);
                    obj3 = obj;
                    break;
            }
            i5 += 3;
            obj = obj3;
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final boolean zzh(Object obj) {
        int i5;
        int i11;
        int i12;
        int i13 = 0;
        int i14 = 0;
        int i15 = 1048575;
        while (i14 < this.f32162e) {
            int i16 = this.f32161d[i14];
            int[] iArr = this.f32158a;
            int i17 = iArr[i16];
            int iJ = j(i16);
            int i18 = iArr[i16 + 2];
            int i19 = i18 & 1048575;
            int i21 = 1 << (i18 >>> 20);
            if (i19 != i15) {
                if (i19 != 1048575) {
                    i13 = f32157h.getInt(obj, i19);
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
            if ((268435456 & iJ) == 0 || s(obj, i11, i5, i12, i21)) {
                int i23 = i(iJ);
                if (i23 != 9 && i23 != 17) {
                    if (i23 != 27) {
                        if (i23 == 60 || i23 == 68) {
                            if (!f(i17, i11, obj) || l(i11).zzh(e7.h(obj, iJ & 1048575))) {
                                i14++;
                                i15 = i5;
                                i13 = i12;
                            }
                        } else if (i23 != 49) {
                            if (i23 != 50) {
                                continue;
                            } else {
                                j6 j6Var = (j6) e7.h(obj, iJ & 1048575);
                                if (j6Var.isEmpty()) {
                                    continue;
                                } else {
                                    int i24 = i11 / 3;
                                    if (((h7) ((i6) this.f32159b[i24 + i24]).f32100a.f32052b).f32094a == i7.f32109i) {
                                        t6 t6VarA = null;
                                        for (Object obj2 : j6Var.values()) {
                                            if (t6VarA == null) {
                                                t6VarA = q6.f32217c.a(obj2.getClass());
                                            }
                                            if (!t6VarA.zzh(obj2)) {
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
                    List list = (List) e7.h(obj, iJ & 1048575);
                    if (list.isEmpty()) {
                        continue;
                    } else {
                        t6 t6VarL = l(i11);
                        for (int i25 = 0; i25 < list.size(); i25++) {
                            if (t6VarL.zzh(list.get(i25))) {
                            }
                        }
                    }
                    i14++;
                    i15 = i5;
                    i13 = i12;
                } else if (!s(obj, i11, i5, i12, i21) || l(i11).zzh(e7.h(obj, iJ & 1048575))) {
                    i14++;
                    i15 = i5;
                    i13 = i12;
                }
            }
            return false;
        }
        return true;
    }
}
