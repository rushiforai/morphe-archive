package com.fyber.inneractive.sdk.protobuf;

import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.security.AccessController;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import sun.misc.Unsafe;

/* loaded from: classes.dex */
public final class i2 implements t2 {

    /* renamed from: q, reason: collision with root package name */
    public static final int[] f30817q = new int[0];

    /* renamed from: r, reason: collision with root package name */
    public static final Unsafe f30818r;

    /* renamed from: a, reason: collision with root package name */
    public final int[] f30819a;

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f30820b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30821c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30822d;

    /* renamed from: e, reason: collision with root package name */
    public final d2 f30823e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f30824f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f30825g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f30826h;

    /* renamed from: i, reason: collision with root package name */
    public final int[] f30827i;

    /* renamed from: j, reason: collision with root package name */
    public final int f30828j;

    /* renamed from: k, reason: collision with root package name */
    public final int f30829k;

    /* renamed from: l, reason: collision with root package name */
    public final k2 f30830l;

    /* renamed from: m, reason: collision with root package name */
    public final t1 f30831m;
    public final o3 n;
    public final j0 o;

    /* renamed from: p, reason: collision with root package name */
    public final z1 f30832p;

    static {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new s3());
        } catch (Throwable unused) {
            unsafe = null;
        }
        f30818r = unsafe;
    }

    public i2(int[] iArr, Object[] objArr, int i5, int i11, d2 d2Var, boolean z11, int[] iArr2, int i12, int i13, k2 k2Var, t1 t1Var, o3 o3Var, j0 j0Var, z1 z1Var) {
        this.f30819a = iArr;
        this.f30820b = objArr;
        this.f30821c = i5;
        this.f30822d = i11;
        this.f30825g = d2Var instanceof z0;
        this.f30826h = z11;
        this.f30824f = j0Var != null && (d2Var instanceof GeneratedMessageLite$ExtendableMessage);
        this.f30827i = iArr2;
        this.f30828j = i12;
        this.f30829k = i13;
        this.f30830l = k2Var;
        this.f30831m = t1Var;
        this.n = o3Var;
        this.o = j0Var;
        this.f30823e = d2Var;
        this.f30832p = z1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:169:0x036c  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x03be  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x03dc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static i2 a(r2 r2Var, k2 k2Var, t1 t1Var, o3 o3Var, j0 j0Var, z1 z1Var) {
        int i5;
        int iCharAt;
        int iCharAt2;
        int iCharAt3;
        int iCharAt4;
        int i11;
        int iCharAt5;
        int i12;
        int[] iArr;
        int i13;
        char cCharAt;
        int i14;
        char cCharAt2;
        int i15;
        char cCharAt3;
        int i16;
        char cCharAt4;
        int i17;
        char cCharAt5;
        int i18;
        char cCharAt6;
        int i19;
        char cCharAt7;
        int i21;
        char cCharAt8;
        int i22;
        int i23;
        boolean z11;
        int i24;
        int iObjectFieldOffset;
        String str;
        Class<?> cls;
        int iObjectFieldOffset2;
        int i25;
        int i26;
        int i27;
        Field fieldA;
        int i28;
        char cCharAt9;
        int i29;
        int i31;
        Field fieldA2;
        Field fieldA3;
        int i32;
        char cCharAt10;
        int i33;
        char cCharAt11;
        int i34;
        int i35;
        char cCharAt12;
        int i36;
        int i37;
        char cCharAt13;
        if (r2Var == null) {
            r2Var.getClass();
            throw new ClassCastException();
        }
        int i38 = 0;
        boolean z12 = ((r2Var.f30887d & 1) == 1 ? o2.PROTO2 : o2.PROTO3) == o2.PROTO3;
        String str2 = r2Var.f30885b;
        int length = str2.length();
        if (str2.charAt(0) >= 55296) {
            int i39 = 1;
            while (true) {
                i5 = i39 + 1;
                if (str2.charAt(i39) < 55296) {
                    break;
                }
                i39 = i5;
            }
        } else {
            i5 = 1;
        }
        int i40 = i5 + 1;
        int iCharAt6 = str2.charAt(i5);
        if (iCharAt6 >= 55296) {
            int i41 = iCharAt6 & 8191;
            int i42 = 13;
            while (true) {
                i37 = i40 + 1;
                cCharAt13 = str2.charAt(i40);
                if (cCharAt13 < 55296) {
                    break;
                }
                i41 |= (cCharAt13 & 8191) << i42;
                i42 += 13;
                i40 = i37;
            }
            iCharAt6 = i41 | (cCharAt13 << i42);
            i40 = i37;
        }
        if (iCharAt6 == 0) {
            iCharAt2 = 0;
            iCharAt3 = 0;
            iCharAt4 = 0;
            i12 = 0;
            iCharAt5 = 0;
            i11 = i40;
            iArr = f30817q;
            iCharAt = 0;
        } else {
            int i43 = i40 + 1;
            iCharAt = str2.charAt(i40);
            if (iCharAt >= 55296) {
                int i44 = iCharAt & 8191;
                int i45 = 13;
                while (true) {
                    i21 = i43 + 1;
                    cCharAt8 = str2.charAt(i43);
                    if (cCharAt8 < 55296) {
                        break;
                    }
                    i44 |= (cCharAt8 & 8191) << i45;
                    i45 += 13;
                    i43 = i21;
                }
                iCharAt = i44 | (cCharAt8 << i45);
                i43 = i21;
            }
            int i46 = i43 + 1;
            int iCharAt7 = str2.charAt(i43);
            if (iCharAt7 >= 55296) {
                int i47 = iCharAt7 & 8191;
                int i48 = 13;
                while (true) {
                    i19 = i46 + 1;
                    cCharAt7 = str2.charAt(i46);
                    if (cCharAt7 < 55296) {
                        break;
                    }
                    i47 |= (cCharAt7 & 8191) << i48;
                    i48 += 13;
                    i46 = i19;
                }
                iCharAt7 = i47 | (cCharAt7 << i48);
                i46 = i19;
            }
            int i49 = i46 + 1;
            iCharAt2 = str2.charAt(i46);
            if (iCharAt2 >= 55296) {
                int i51 = iCharAt2 & 8191;
                int i52 = 13;
                while (true) {
                    i18 = i49 + 1;
                    cCharAt6 = str2.charAt(i49);
                    if (cCharAt6 < 55296) {
                        break;
                    }
                    i51 |= (cCharAt6 & 8191) << i52;
                    i52 += 13;
                    i49 = i18;
                }
                iCharAt2 = i51 | (cCharAt6 << i52);
                i49 = i18;
            }
            int i53 = i49 + 1;
            iCharAt3 = str2.charAt(i49);
            if (iCharAt3 >= 55296) {
                int i54 = iCharAt3 & 8191;
                int i55 = 13;
                while (true) {
                    i17 = i53 + 1;
                    cCharAt5 = str2.charAt(i53);
                    if (cCharAt5 < 55296) {
                        break;
                    }
                    i54 |= (cCharAt5 & 8191) << i55;
                    i55 += 13;
                    i53 = i17;
                }
                iCharAt3 = i54 | (cCharAt5 << i55);
                i53 = i17;
            }
            int i56 = i53 + 1;
            int iCharAt8 = str2.charAt(i53);
            if (iCharAt8 >= 55296) {
                int i57 = iCharAt8 & 8191;
                int i58 = 13;
                while (true) {
                    i16 = i56 + 1;
                    cCharAt4 = str2.charAt(i56);
                    if (cCharAt4 < 55296) {
                        break;
                    }
                    i57 |= (cCharAt4 & 8191) << i58;
                    i58 += 13;
                    i56 = i16;
                }
                iCharAt8 = i57 | (cCharAt4 << i58);
                i56 = i16;
            }
            int i59 = i56 + 1;
            iCharAt4 = str2.charAt(i56);
            if (iCharAt4 >= 55296) {
                int i61 = iCharAt4 & 8191;
                int i62 = 13;
                while (true) {
                    i15 = i59 + 1;
                    cCharAt3 = str2.charAt(i59);
                    if (cCharAt3 < 55296) {
                        break;
                    }
                    i61 |= (cCharAt3 & 8191) << i62;
                    i62 += 13;
                    i59 = i15;
                }
                iCharAt4 = i61 | (cCharAt3 << i62);
                i59 = i15;
            }
            int i63 = i59 + 1;
            int iCharAt9 = str2.charAt(i59);
            if (iCharAt9 >= 55296) {
                int i64 = iCharAt9 & 8191;
                int i65 = 13;
                while (true) {
                    i14 = i63 + 1;
                    cCharAt2 = str2.charAt(i63);
                    if (cCharAt2 < 55296) {
                        break;
                    }
                    i64 |= (cCharAt2 & 8191) << i65;
                    i65 += 13;
                    i63 = i14;
                }
                iCharAt9 = i64 | (cCharAt2 << i65);
                i63 = i14;
            }
            i11 = i63 + 1;
            iCharAt5 = str2.charAt(i63);
            if (iCharAt5 >= 55296) {
                int i66 = iCharAt5 & 8191;
                int i67 = i11;
                int i68 = 13;
                while (true) {
                    i13 = i67 + 1;
                    cCharAt = str2.charAt(i67);
                    if (cCharAt < 55296) {
                        break;
                    }
                    i66 |= (cCharAt & 8191) << i68;
                    i68 += 13;
                    i67 = i13;
                }
                iCharAt5 = i66 | (cCharAt << i68);
                i11 = i13;
            }
            int[] iArr2 = new int[iCharAt5 + iCharAt4 + iCharAt9];
            i12 = (iCharAt * 2) + iCharAt7;
            int i69 = iCharAt8;
            iArr = iArr2;
            i38 = i69;
        }
        Unsafe unsafe = f30818r;
        Object[] objArr = r2Var.f30886c;
        Class<?> cls2 = r2Var.f30884a.getClass();
        int[] iArr3 = new int[i38 * 3];
        int i71 = 2;
        Object[] objArr2 = new Object[i38 * 2];
        int i72 = iCharAt4 + iCharAt5;
        int i73 = i11;
        int i74 = iCharAt;
        int i75 = i72;
        int i76 = iCharAt5;
        int i77 = 0;
        int i78 = 0;
        while (i73 < length) {
            int i79 = i73 + 1;
            int iCharAt10 = str2.charAt(i73);
            int i81 = length;
            if (iCharAt10 >= 55296) {
                int i82 = iCharAt10 & 8191;
                int i83 = i79;
                int i84 = 13;
                while (true) {
                    i35 = i83 + 1;
                    cCharAt12 = str2.charAt(i83);
                    i36 = i82;
                    if (cCharAt12 < 55296) {
                        break;
                    }
                    i82 = i36 | ((cCharAt12 & 8191) << i84);
                    i84 += 13;
                    i83 = i35;
                }
                iCharAt10 = i36 | (cCharAt12 << i84);
                i22 = i35;
            } else {
                i22 = i79;
            }
            int i85 = i22 + 1;
            int iCharAt11 = str2.charAt(i22);
            int i86 = iCharAt10;
            if (iCharAt11 >= 55296) {
                int i87 = iCharAt11 & 8191;
                int i88 = i85;
                int i89 = 13;
                while (true) {
                    i33 = i88 + 1;
                    cCharAt11 = str2.charAt(i88);
                    i34 = i87;
                    if (cCharAt11 < 55296) {
                        break;
                    }
                    i87 = i34 | ((cCharAt11 & 8191) << i89);
                    i89 += 13;
                    i88 = i33;
                }
                iCharAt11 = i34 | (cCharAt11 << i89);
                i73 = i33;
            } else {
                i73 = i85;
            }
            int[] iArr4 = iArr3;
            int i91 = iCharAt11 & 255;
            Object[] objArr3 = objArr;
            if ((iCharAt11 & 1024) != 0) {
                iArr[i78] = i77;
                i78++;
            }
            int i92 = iCharAt2;
            if (i91 >= 51) {
                int i93 = i73 + 1;
                int iCharAt12 = str2.charAt(i73);
                char c11 = 55296;
                if (iCharAt12 >= 55296) {
                    int i94 = iCharAt12 & 8191;
                    int i95 = 13;
                    while (true) {
                        i32 = i93 + 1;
                        cCharAt10 = str2.charAt(i93);
                        if (cCharAt10 < c11) {
                            break;
                        }
                        i94 |= (cCharAt10 & 8191) << i95;
                        i95 += 13;
                        i93 = i32;
                        c11 = 55296;
                    }
                    iCharAt12 = i94 | (cCharAt10 << i95);
                    i93 = i32;
                }
                int i96 = i91 - 51;
                int i97 = iCharAt12;
                if (i96 == 9 || i96 == 17) {
                    i31 = i93;
                    objArr2[u4.b(i77, 3, i71, 1)] = objArr3[i12];
                    i12++;
                } else if (i96 != 12 || z12) {
                    i31 = i93;
                } else {
                    i31 = i93;
                    objArr2[u4.b(i77, 3, i71, 1)] = objArr3[i12];
                    i12++;
                }
                int i98 = i97 * 2;
                Object obj = objArr3[i98];
                if (obj instanceof Field) {
                    fieldA2 = (Field) obj;
                } else {
                    fieldA2 = a((Class) cls2, (String) obj);
                    objArr3[i98] = fieldA2;
                }
                int iObjectFieldOffset3 = (int) unsafe.objectFieldOffset(fieldA2);
                int i99 = i98 + 1;
                Object obj2 = objArr3[i99];
                if (obj2 instanceof Field) {
                    fieldA3 = (Field) obj2;
                } else {
                    fieldA3 = a((Class) cls2, (String) obj2);
                    objArr3[i99] = fieldA3;
                }
                cls = cls2;
                iObjectFieldOffset2 = (int) unsafe.objectFieldOffset(fieldA3);
                i23 = iCharAt3;
                i26 = i12;
                i71 = 2;
                str = str2;
                i27 = iObjectFieldOffset3;
                i73 = i31;
                i25 = 0;
                z11 = z12;
            } else {
                int i100 = i12 + 1;
                Field fieldA4 = a((Class) cls2, (String) objArr3[i12]);
                if (i91 == 9 || i91 == 17) {
                    i23 = iCharAt3;
                    z11 = z12;
                    objArr2[u4.b(i77, 3, 2, 1)] = fieldA4.getType();
                } else {
                    if (i91 == 27 || i91 == 49) {
                        i23 = iCharAt3;
                        z11 = z12;
                        i29 = i12 + 2;
                        objArr2[u4.b(i77, 3, 2, 1)] = objArr3[i100];
                    } else {
                        if (i91 == 12 || i91 == 30 || i91 == 44) {
                            if (!z12) {
                                i23 = iCharAt3;
                                z11 = z12;
                                i29 = i12 + 2;
                                objArr2[u4.b(i77, 3, 2, 1)] = objArr3[i100];
                            }
                        } else if (i91 == 50) {
                            int i101 = i76 + 1;
                            iArr[i76] = i77;
                            int i102 = (i77 / 3) * 2;
                            int i103 = i12 + 2;
                            objArr2[i102] = objArr3[i100];
                            if ((iCharAt11 & 2048) != 0) {
                                i24 = i12 + 3;
                                objArr2[i102 + 1] = objArr3[i103];
                                i23 = iCharAt3;
                                z11 = z12;
                                i76 = i101;
                            } else {
                                i23 = iCharAt3;
                                i24 = i103;
                                i76 = i101;
                                z11 = z12;
                            }
                            iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldA4);
                            if ((iCharAt11 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 4096 || i91 > 17) {
                                str = str2;
                                cls = cls2;
                                i71 = 2;
                                iObjectFieldOffset2 = 1048575;
                                i25 = 0;
                            } else {
                                int i104 = i73 + 1;
                                int iCharAt13 = str2.charAt(i73);
                                if (iCharAt13 >= 55296) {
                                    int i105 = iCharAt13 & 8191;
                                    int i106 = 13;
                                    while (true) {
                                        i28 = i104 + 1;
                                        cCharAt9 = str2.charAt(i104);
                                        if (cCharAt9 < 55296) {
                                            break;
                                        }
                                        i105 |= (cCharAt9 & 8191) << i106;
                                        i106 += 13;
                                        i104 = i28;
                                    }
                                    iCharAt13 = i105 | (cCharAt9 << i106);
                                    i104 = i28;
                                }
                                i71 = 2;
                                int i107 = (iCharAt13 / 32) + (i74 * 2);
                                Object obj3 = objArr3[i107];
                                if (obj3 instanceof Field) {
                                    fieldA = (Field) obj3;
                                } else {
                                    fieldA = a((Class) cls2, (String) obj3);
                                    objArr3[i107] = fieldA;
                                }
                                str = str2;
                                cls = cls2;
                                iObjectFieldOffset2 = (int) unsafe.objectFieldOffset(fieldA);
                                i25 = iCharAt13 % 32;
                                i73 = i104;
                            }
                            if (i91 >= 18 || i91 > 49) {
                                i26 = i24;
                                i27 = iObjectFieldOffset;
                            } else {
                                iArr[i75] = iObjectFieldOffset;
                                i26 = i24;
                                i27 = iObjectFieldOffset;
                                i75++;
                            }
                        }
                        i23 = iCharAt3;
                        z11 = z12;
                    }
                    i24 = i29;
                    iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldA4);
                    if ((iCharAt11 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 4096) {
                        str = str2;
                        cls = cls2;
                        i71 = 2;
                        iObjectFieldOffset2 = 1048575;
                        i25 = 0;
                        if (i91 >= 18) {
                            i26 = i24;
                            i27 = iObjectFieldOffset;
                        }
                    }
                }
                i24 = i100;
                iObjectFieldOffset = (int) unsafe.objectFieldOffset(fieldA4);
                if ((iCharAt11 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 4096) {
                }
            }
            int i108 = i77 + 1;
            iArr4[i77] = i86;
            int i109 = i77 + 2;
            int i110 = i25;
            iArr4[i108] = ((iCharAt11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 0) | ((iCharAt11 & 256) != 0 ? 268435456 : 0) | (i91 << 20) | i27;
            i77 += 3;
            iArr4[i109] = (i110 << 20) | iObjectFieldOffset2;
            str2 = str;
            iCharAt3 = i23;
            iArr3 = iArr4;
            length = i81;
            objArr = objArr3;
            z12 = z11;
            cls2 = cls;
            i12 = i26;
            iCharAt2 = i92;
        }
        return new i2(iArr3, objArr2, iCharAt2, iCharAt3, r2Var.f30884a, z12, iArr, iCharAt5, i72, k2Var, t1Var, o3Var, j0Var, z1Var);
    }

    public static long d(int i5) {
        return i5 & 1048575;
    }

    /* JADX WARN: Removed duplicated region for block: B:105:0x01cb  */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(Object obj, Object obj2) {
        int length = this.f30819a.length;
        int i5 = 0;
        while (true) {
            boolean zA = true;
            if (i5 >= length) {
                this.n.getClass();
                n3 n3Var = ((z0) obj).unknownFields;
                this.n.getClass();
                if (!n3Var.equals(((z0) obj2).unknownFields)) {
                    return false;
                }
                if (!this.f30824f) {
                    return true;
                }
                this.o.getClass();
                n0 n0Var = ((GeneratedMessageLite$ExtendableMessage) obj).extensions;
                this.o.getClass();
                return n0Var.equals(((GeneratedMessageLite$ExtendableMessage) obj2).extensions);
            }
            int[] iArr = this.f30819a;
            int i11 = iArr[i5 + 1];
            long j11 = i11 & 1048575;
            switch ((i11 & 267386880) >>> 20) {
                case 0:
                    if (a(i5, obj, obj2)) {
                        w3 w3Var = x3.f30955c;
                        if (Double.doubleToLongBits(w3Var.c(obj, j11)) != Double.doubleToLongBits(w3Var.c(obj2, j11))) {
                            zA = false;
                            break;
                        }
                    }
                    break;
                case 1:
                    if (a(i5, obj, obj2)) {
                        w3 w3Var2 = x3.f30955c;
                        if (Float.floatToIntBits(w3Var2.d(obj, j11)) != Float.floatToIntBits(w3Var2.d(obj2, j11))) {
                        }
                    }
                    break;
                case 2:
                    if (!a(i5, obj, obj2) || x3.d(obj, j11) != x3.d(obj2, j11)) {
                    }
                    break;
                case 3:
                    if (!a(i5, obj, obj2) || x3.d(obj, j11) != x3.d(obj2, j11)) {
                    }
                    break;
                case 4:
                    if (!a(i5, obj, obj2) || x3.c(obj, j11) != x3.c(obj2, j11)) {
                    }
                    break;
                case 5:
                    if (!a(i5, obj, obj2) || x3.d(obj, j11) != x3.d(obj2, j11)) {
                    }
                    break;
                case 6:
                    if (!a(i5, obj, obj2) || x3.c(obj, j11) != x3.c(obj2, j11)) {
                    }
                    break;
                case 7:
                    if (a(i5, obj, obj2)) {
                        w3 w3Var3 = x3.f30955c;
                        if (w3Var3.a(obj, j11) != w3Var3.a(obj2, j11)) {
                        }
                    }
                    break;
                case 8:
                    if (!a(i5, obj, obj2) || !u2.a(x3.e(obj, j11), x3.e(obj2, j11))) {
                    }
                    break;
                case 9:
                    if (!a(i5, obj, obj2) || !u2.a(x3.e(obj, j11), x3.e(obj2, j11))) {
                    }
                    break;
                case 10:
                    if (!a(i5, obj, obj2) || !u2.a(x3.e(obj, j11), x3.e(obj2, j11))) {
                    }
                    break;
                case 11:
                    if (!a(i5, obj, obj2) || x3.c(obj, j11) != x3.c(obj2, j11)) {
                    }
                    break;
                case 12:
                    if (!a(i5, obj, obj2) || x3.c(obj, j11) != x3.c(obj2, j11)) {
                    }
                    break;
                case 13:
                    if (!a(i5, obj, obj2) || x3.c(obj, j11) != x3.c(obj2, j11)) {
                    }
                    break;
                case 14:
                    if (!a(i5, obj, obj2) || x3.d(obj, j11) != x3.d(obj2, j11)) {
                    }
                    break;
                case 15:
                    if (!a(i5, obj, obj2) || x3.c(obj, j11) != x3.c(obj2, j11)) {
                    }
                    break;
                case 16:
                    if (!a(i5, obj, obj2) || x3.d(obj, j11) != x3.d(obj2, j11)) {
                    }
                    break;
                case 17:
                    if (!a(i5, obj, obj2) || !u2.a(x3.e(obj, j11), x3.e(obj2, j11))) {
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
                    zA = u2.a(x3.e(obj, j11), x3.e(obj2, j11));
                    break;
                case 50:
                    zA = u2.a(x3.e(obj, j11), x3.e(obj2, j11));
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
                    if (x3.c(obj, j12) != x3.c(obj2, j12) || !u2.a(x3.e(obj, j11), x3.e(obj2, j11))) {
                    }
                    break;
            }
            if (!zA) {
                return false;
            }
            i5 += 3;
        }
    }

    public final t2 c(int i5) {
        int i11 = (i5 / 3) * 2;
        Object[] objArr = this.f30820b;
        t2 t2Var = (t2) objArr[i11];
        if (t2Var != null) {
            return t2Var;
        }
        t2 t2VarA = p2.f30870c.a((Class) objArr[i11 + 1]);
        this.f30820b[i11] = t2VarA;
        return t2VarA;
    }

    public final void e(int i5, Object obj, Object obj2) {
        int[] iArr = this.f30819a;
        int i11 = iArr[i5 + 1];
        int i12 = iArr[i5];
        long j11 = i11 & 1048575;
        if (a(obj2, i12, i5)) {
            Object objE = a(obj, i12, i5) ? x3.e(obj, j11) : null;
            Object objE2 = x3.e(obj2, j11);
            if (objE != null && objE2 != null) {
                x3.a(j11, obj, l1.a(objE, objE2));
                b(obj, i12, i5);
            } else if (objE2 != null) {
                x3.a(j11, obj, objE2);
                b(obj, i12, i5);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0100 A[PHI: r2
      0x0100: PHI (r2v30 int) = (r2v10 int), (r2v31 int) binds: [B:82:0x0227, B:40:0x00fe] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d(Object obj) {
        int i5;
        long jDoubleToLongBits;
        int i11;
        int iFloatToIntBits;
        int i12;
        int i13;
        int length = this.f30819a.length;
        int i14 = 0;
        for (int i15 = 0; i15 < length; i15 += 3) {
            int[] iArr = this.f30819a;
            int i16 = iArr[i15 + 1];
            int i17 = iArr[i15];
            long j11 = 1048575 & i16;
            int iHashCode = 37;
            int i18 = 1237;
            switch ((i16 & 267386880) >>> 20) {
                case 0:
                    i5 = i14 * 53;
                    jDoubleToLongBits = Double.doubleToLongBits(x3.f30955c.c(obj, j11));
                    Charset charset = l1.f30847a;
                    i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    i14 = i13;
                    break;
                case 1:
                    i11 = i14 * 53;
                    iFloatToIntBits = Float.floatToIntBits(x3.f30955c.d(obj, j11));
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 2:
                    i5 = i14 * 53;
                    jDoubleToLongBits = x3.d(obj, j11);
                    Charset charset2 = l1.f30847a;
                    i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    i14 = i13;
                    break;
                case 3:
                    i5 = i14 * 53;
                    jDoubleToLongBits = x3.d(obj, j11);
                    Charset charset3 = l1.f30847a;
                    i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    i14 = i13;
                    break;
                case 4:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.c(obj, j11);
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 5:
                    i5 = i14 * 53;
                    jDoubleToLongBits = x3.d(obj, j11);
                    Charset charset4 = l1.f30847a;
                    i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    i14 = i13;
                    break;
                case 6:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.c(obj, j11);
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 7:
                    i12 = i14 * 53;
                    boolean zA = x3.f30955c.a(obj, j11);
                    Charset charset5 = l1.f30847a;
                    if (zA) {
                        i18 = 1231;
                    }
                    i13 = i18 + i12;
                    i14 = i13;
                    break;
                case 8:
                    i11 = i14 * 53;
                    iFloatToIntBits = ((String) x3.e(obj, j11)).hashCode();
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 9:
                    Object objE = x3.e(obj, j11);
                    if (objE != null) {
                        iHashCode = objE.hashCode();
                    }
                    iFloatToIntBits = i14 * 53;
                    i11 = iHashCode;
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 10:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.e(obj, j11).hashCode();
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 11:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.c(obj, j11);
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 12:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.c(obj, j11);
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 13:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.c(obj, j11);
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 14:
                    i5 = i14 * 53;
                    jDoubleToLongBits = x3.d(obj, j11);
                    Charset charset6 = l1.f30847a;
                    i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    i14 = i13;
                    break;
                case 15:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.c(obj, j11);
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 16:
                    i5 = i14 * 53;
                    jDoubleToLongBits = x3.d(obj, j11);
                    Charset charset7 = l1.f30847a;
                    i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                    i14 = i13;
                    break;
                case 17:
                    Object objE2 = x3.e(obj, j11);
                    if (objE2 != null) {
                        iHashCode = objE2.hashCode();
                    }
                    iFloatToIntBits = i14 * 53;
                    i11 = iHashCode;
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
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
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.e(obj, j11).hashCode();
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 50:
                    i11 = i14 * 53;
                    iFloatToIntBits = x3.e(obj, j11).hashCode();
                    i13 = iFloatToIntBits + i11;
                    i14 = i13;
                    break;
                case 51:
                    if (a(obj, i17, i15)) {
                        i5 = i14 * 53;
                        jDoubleToLongBits = Double.doubleToLongBits(((Double) x3.e(obj, j11)).doubleValue());
                        Charset charset8 = l1.f30847a;
                        i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 52:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = Float.floatToIntBits(((Float) x3.e(obj, j11)).floatValue());
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 53:
                    if (a(obj, i17, i15)) {
                        i5 = i14 * 53;
                        jDoubleToLongBits = ((Long) x3.e(obj, j11)).longValue();
                        Charset charset9 = l1.f30847a;
                        i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 54:
                    if (a(obj, i17, i15)) {
                        i5 = i14 * 53;
                        jDoubleToLongBits = ((Long) x3.e(obj, j11)).longValue();
                        Charset charset10 = l1.f30847a;
                        i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 55:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((Integer) x3.e(obj, j11)).intValue();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 56:
                    if (a(obj, i17, i15)) {
                        i5 = i14 * 53;
                        jDoubleToLongBits = ((Long) x3.e(obj, j11)).longValue();
                        Charset charset11 = l1.f30847a;
                        i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 57:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((Integer) x3.e(obj, j11)).intValue();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 58:
                    if (a(obj, i17, i15)) {
                        i12 = i14 * 53;
                        boolean zBooleanValue = ((Boolean) x3.e(obj, j11)).booleanValue();
                        Charset charset12 = l1.f30847a;
                        if (zBooleanValue) {
                        }
                        i13 = i18 + i12;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 59:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((String) x3.e(obj, j11)).hashCode();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 60:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = x3.e(obj, j11).hashCode();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 61:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = x3.e(obj, j11).hashCode();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 62:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((Integer) x3.e(obj, j11)).intValue();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 63:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((Integer) x3.e(obj, j11)).intValue();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 64:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((Integer) x3.e(obj, j11)).intValue();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 65:
                    if (a(obj, i17, i15)) {
                        i5 = i14 * 53;
                        jDoubleToLongBits = ((Long) x3.e(obj, j11)).longValue();
                        Charset charset13 = l1.f30847a;
                        i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 66:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = ((Integer) x3.e(obj, j11)).intValue();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 67:
                    if (a(obj, i17, i15)) {
                        i5 = i14 * 53;
                        jDoubleToLongBits = ((Long) x3.e(obj, j11)).longValue();
                        Charset charset14 = l1.f30847a;
                        i13 = i5 + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
                case 68:
                    if (a(obj, i17, i15)) {
                        i11 = i14 * 53;
                        iFloatToIntBits = x3.e(obj, j11).hashCode();
                        i13 = iFloatToIntBits + i11;
                        i14 = i13;
                        break;
                    } else {
                        break;
                    }
            }
        }
        this.n.getClass();
        int iHashCode2 = ((z0) obj).unknownFields.hashCode() + (i14 * 53);
        if (!this.f30824f) {
            return iHashCode2;
        }
        this.o.getClass();
        return ((GeneratedMessageLite$ExtendableMessage) obj).extensions.f30856a.hashCode() + (iHashCode2 * 53);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.t2
    public final void c(Object obj) {
        int i5;
        int i11 = this.f30828j;
        while (true) {
            i5 = this.f30829k;
            if (i11 >= i5) {
                break;
            }
            long j11 = this.f30819a[this.f30827i[i11] + 1] & 1048575;
            Object objE = x3.e(obj, j11);
            if (objE != null) {
                this.f30832p.getClass();
                ((y1) objE).f30965a = false;
                x3.a(j11, obj, objE);
            }
            i11++;
        }
        int length = this.f30827i.length;
        while (i5 < length) {
            this.f30831m.a(obj, this.f30827i[i5]);
            i5++;
        }
        this.n.getClass();
        ((z0) obj).unknownFields.f30865e = false;
        if (this.f30824f) {
            this.o.getClass();
            ((GeneratedMessageLite$ExtendableMessage) obj).extensions.e();
        }
    }

    public final void c(int i5, Object obj, Object obj2) {
        long j11 = this.f30819a[i5 + 1] & 1048575;
        Object objE = x3.e(obj, j11);
        if (objE != null) {
            this.f30832p.getClass();
            if (!((y1) objE).f30965a) {
                this.f30832p.getClass();
                y1 y1Var = y1.f30964b;
                y1 y1Var2 = y1Var.isEmpty() ? new y1() : new y1(y1Var);
                this.f30832p.getClass();
                z1.a(y1Var2, objE);
                x3.a(j11, obj, y1Var2);
                objE = y1Var2;
            }
        } else {
            this.f30832p.getClass();
            y1 y1Var3 = y1.f30964b;
            objE = y1Var3.isEmpty() ? new y1() : new y1(y1Var3);
            x3.a(j11, obj, objE);
        }
        this.f30832p.getClass();
        this.f30832p.getClass();
        obj2.getClass();
        throw new ClassCastException();
    }

    /* JADX WARN: Removed duplicated region for block: B:139:0x039b  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x0444  */
    /* JADX WARN: Removed duplicated region for block: B:315:0x0814 A[PHI: r10
      0x0814: PHI (r10v25 int) = (r10v3 int), (r10v26 int) binds: [B:496:0x0cf0, B:313:0x080d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:393:0x0a4c A[PHI: r22
      0x0a4c: PHI (r22v30 int) = (r22v15 int), (r22v16 int), (r22v17 int), (r22v24 int), (r22v25 int), (r22v28 int), (r22v31 int) binds: [B:442:0x0bb6, B:438:0x0b9a, B:434:0x0b7e, B:408:0x0ab9, B:404:0x0a9f, B:397:0x0a68, B:392:0x0a4a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:420:0x0b05 A[PHI: r22
      0x0b05: PHI (r22v48 int) = (r22v22 int), (r22v23 int), (r22v51 int) binds: [B:419:0x0b03, B:412:0x0ad3, B:343:0x08b1] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0185 A[PHI: r4
      0x0185: PHI (r4v102 int) = (r4v40 int), (r4v104 int) binds: [B:237:0x0633, B:61:0x017d] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int b(Object obj) {
        int i5;
        int iB;
        int iA;
        int i11;
        int iB2;
        int iA2;
        int iB3;
        int iB4;
        int iB5;
        int serializedSize;
        int iA3;
        int iB6;
        int iB7;
        int iA4;
        int iA5;
        int iB8;
        int iA6;
        int iA7;
        int iB9;
        int iC;
        int iB10;
        int iA8;
        int iB11;
        int i12 = 267386880;
        int i13 = 1048575;
        int i14 = 1;
        if (this.f30826h) {
            Unsafe unsafe = f30818r;
            int i15 = 0;
            int iB12 = 0;
            while (true) {
                int[] iArr = this.f30819a;
                if (i15 < iArr.length) {
                    int i16 = iArr[i15 + 1];
                    int i17 = (i16 & i12) >>> 20;
                    int i18 = iArr[i15];
                    int i19 = i12;
                    long j11 = i16 & 1048575;
                    if (i17 >= FieldType.DOUBLE_LIST_PACKED.id() && i17 <= FieldType.SINT64_LIST_PACKED.id()) {
                        int i21 = this.f30819a[i15 + 2];
                    }
                    switch (i17) {
                        case 0:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 8, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 1:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 4, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 2:
                            if (a(i15, obj)) {
                                long jD = x3.d(obj, j11);
                                iB8 = b0.b(i18);
                                iA6 = b0.a(jD);
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 3:
                            if (a(i15, obj)) {
                                iA7 = b0.a(x3.d(obj, j11)) + b0.b(i18);
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 4:
                            if (a(i15, obj)) {
                                int iC2 = x3.c(obj, j11);
                                iB9 = b0.b(i18);
                                iC = iC2 >= 0 ? b0.c(iC2) : 10;
                                iA7 = iC + iB9;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 5:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 8, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 6:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 4, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 7:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 1, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 8:
                            if (a(i15, obj)) {
                                Object objE = x3.e(obj, j11);
                                if (objE instanceof s) {
                                    iB10 = b0.b(i18);
                                    iA8 = b0.a((s) objE);
                                } else {
                                    iB10 = b0.b(i18);
                                    iA8 = b0.a((String) objE);
                                }
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 9:
                            if (a(i15, obj)) {
                                Object objE2 = x3.e(obj, j11);
                                t2 t2VarC = c(i15);
                                Class cls = u2.f30916a;
                                int iB13 = b0.b(i18);
                                int serializedSize2 = ((b) ((d2) objE2)).getSerializedSize(t2VarC);
                                iA5 = l0.a(serializedSize2, serializedSize2, iB13, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 10:
                            if (a(i15, obj)) {
                                s sVar = (s) x3.e(obj, j11);
                                iB10 = b0.b(i18);
                                iA8 = b0.a(sVar);
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 11:
                            if (a(i15, obj)) {
                                int iC3 = x3.c(obj, j11);
                                iB10 = b0.b(i18);
                                iA8 = b0.c(iC3);
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 12:
                            if (a(i15, obj)) {
                                int iC4 = x3.c(obj, j11);
                                iB10 = b0.b(i18);
                                iA8 = b0.a(iC4);
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 13:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 4, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 14:
                            if (a(i15, obj)) {
                                iA5 = g2.a(i18, 8, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 15:
                            if (a(i15, obj)) {
                                int iC5 = x3.c(obj, j11);
                                iB8 = b0.b(i18);
                                iA6 = b0.c(b0.d(iC5));
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 16:
                            if (a(i15, obj)) {
                                long jD2 = x3.d(obj, j11);
                                iB8 = b0.b(i18);
                                iA6 = b0.a(b0.b(jD2));
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 17:
                            if (a(i15, obj)) {
                                d2 d2Var = (d2) x3.e(obj, j11);
                                t2 t2VarC2 = c(i15);
                                iB8 = b0.b(i18) * 2;
                                iA6 = ((b) d2Var).getSerializedSize(t2VarC2);
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 18:
                            iA7 = u2.b(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 19:
                            iA7 = u2.a(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 20:
                            List list = (List) x3.e(obj, j11);
                            Class cls2 = u2.f30916a;
                            iA7 = list.size() == 0 ? 0 : h2.a(i18, list.size(), u2.c(list));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 21:
                            List list2 = (List) x3.e(obj, j11);
                            Class cls3 = u2.f30916a;
                            int size = list2.size();
                            if (size != 0) {
                                iA7 = h2.a(i18, size, u2.g(list2));
                            }
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 22:
                            List list3 = (List) x3.e(obj, j11);
                            Class cls4 = u2.f30916a;
                            int size2 = list3.size();
                            if (size2 != 0) {
                                iA7 = h2.a(i18, size2, u2.b(list3));
                            }
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 23:
                            iA7 = u2.b(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 24:
                            iA7 = u2.a(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 25:
                            List list4 = (List) x3.e(obj, j11);
                            Class cls5 = u2.f30916a;
                            int size3 = list4.size();
                            iB12 = (size3 == 0 ? 0 : (b0.b(i18) + 1) * size3) + iB12;
                            i15 += 3;
                            i12 = i19;
                        case 26:
                            iA7 = u2.c(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 27:
                            List list5 = (List) x3.e(obj, j11);
                            t2 t2VarC3 = c(i15);
                            Class cls6 = u2.f30916a;
                            int size4 = list5.size();
                            if (size4 == 0) {
                                iB11 = 0;
                            } else {
                                iB11 = b0.b(i18) * size4;
                                for (int i22 = 0; i22 < size4; i22++) {
                                    int serializedSize3 = ((b) ((d2) list5.get(i22))).getSerializedSize(t2VarC3);
                                    iB11 = b0.c(serializedSize3) + serializedSize3 + iB11;
                                }
                            }
                            iB12 = iB11 + iB12;
                            i15 += 3;
                            i12 = i19;
                        case 28:
                            List list6 = (List) x3.e(obj, j11);
                            Class cls7 = u2.f30916a;
                            int size5 = list6.size();
                            if (size5 != 0) {
                                iB11 = b0.b(i18) * size5;
                                for (int i23 = 0; i23 < list6.size(); i23++) {
                                    iB11 = b0.a((s) list6.get(i23)) + iB11;
                                }
                            }
                            iB12 = iB11 + iB12;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 29:
                            List list7 = (List) x3.e(obj, j11);
                            Class cls8 = u2.f30916a;
                            int size6 = list7.size();
                            if (size6 != 0) {
                                iA7 = h2.a(i18, size6, u2.f(list7));
                            }
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 30:
                            List list8 = (List) x3.e(obj, j11);
                            Class cls9 = u2.f30916a;
                            int size7 = list8.size();
                            if (size7 != 0) {
                                iA7 = h2.a(i18, size7, u2.a(list8));
                            }
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 31:
                            iA7 = u2.a(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 32:
                            iA7 = u2.b(i18, (List) x3.e(obj, j11));
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                        case 33:
                            List list9 = (List) x3.e(obj, j11);
                            Class cls10 = u2.f30916a;
                            int size8 = list9.size();
                            if (size8 != 0) {
                                iA7 = h2.a(i18, size8, u2.d(list9));
                            }
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 34:
                            List list10 = (List) x3.e(obj, j11);
                            Class cls11 = u2.f30916a;
                            int size9 = list10.size();
                            if (size9 != 0) {
                                iA7 = h2.a(i18, size9, u2.e(list10));
                            }
                            iA5 = iA7 + iB12;
                            iB12 = iA5;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 35:
                            List list11 = (List) unsafe.getObject(obj, j11);
                            Class cls12 = u2.f30916a;
                            int size10 = list11.size() * 8;
                            if (size10 > 0) {
                                iA5 = l0.a(size10, b0.b(i18), size10, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 36:
                            List list12 = (List) unsafe.getObject(obj, j11);
                            Class cls13 = u2.f30916a;
                            int size11 = list12.size() * 4;
                            if (size11 > 0) {
                                iA5 = l0.a(size11, b0.b(i18), size11, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 37:
                            int iC6 = u2.c((List) unsafe.getObject(obj, j11));
                            if (iC6 > 0) {
                                iA5 = l0.a(iC6, b0.b(i18), iC6, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 38:
                            int iG = u2.g((List) unsafe.getObject(obj, j11));
                            if (iG > 0) {
                                iA5 = l0.a(iG, b0.b(i18), iG, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 39:
                            int iB14 = u2.b((List) unsafe.getObject(obj, j11));
                            if (iB14 > 0) {
                                iA5 = l0.a(iB14, b0.b(i18), iB14, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 40:
                            List list13 = (List) unsafe.getObject(obj, j11);
                            Class cls14 = u2.f30916a;
                            int size12 = list13.size() * 8;
                            if (size12 > 0) {
                                iA5 = l0.a(size12, b0.b(i18), size12, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 41:
                            List list14 = (List) unsafe.getObject(obj, j11);
                            Class cls15 = u2.f30916a;
                            int size13 = list14.size() * 4;
                            if (size13 > 0) {
                                iA5 = l0.a(size13, b0.b(i18), size13, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 42:
                            List list15 = (List) unsafe.getObject(obj, j11);
                            Class cls16 = u2.f30916a;
                            int size14 = list15.size();
                            if (size14 > 0) {
                                iA5 = l0.a(size14, b0.b(i18), size14, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 43:
                            int iF = u2.f((List) unsafe.getObject(obj, j11));
                            if (iF > 0) {
                                iA5 = l0.a(iF, b0.b(i18), iF, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 44:
                            int iA9 = u2.a((List) unsafe.getObject(obj, j11));
                            if (iA9 > 0) {
                                iA5 = l0.a(iA9, b0.b(i18), iA9, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 45:
                            List list16 = (List) unsafe.getObject(obj, j11);
                            Class cls17 = u2.f30916a;
                            int size15 = list16.size() * 4;
                            if (size15 > 0) {
                                iA5 = l0.a(size15, b0.b(i18), size15, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 46:
                            List list17 = (List) unsafe.getObject(obj, j11);
                            Class cls18 = u2.f30916a;
                            int size16 = list17.size() * 8;
                            if (size16 > 0) {
                                iA5 = l0.a(size16, b0.b(i18), size16, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 47:
                            int iD = u2.d((List) unsafe.getObject(obj, j11));
                            if (iD > 0) {
                                iA5 = l0.a(iD, b0.b(i18), iD, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 48:
                            int iE = u2.e((List) unsafe.getObject(obj, j11));
                            if (iE > 0) {
                                iA5 = l0.a(iE, b0.b(i18), iE, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 49:
                            List list18 = (List) x3.e(obj, j11);
                            t2 t2VarC4 = c(i15);
                            Class cls19 = u2.f30916a;
                            int size17 = list18.size();
                            if (size17 != 0) {
                                iB11 = 0;
                                for (int i24 = 0; i24 < size17; i24++) {
                                    iB11 = ((b) ((d2) list18.get(i24))).getSerializedSize(t2VarC4) + (b0.b(i18) * 2) + iB11;
                                }
                            }
                            iB12 = iB11 + iB12;
                            i15 += 3;
                            i12 = i19;
                            break;
                        case 50:
                            z1 z1Var = this.f30832p;
                            Object objE3 = x3.e(obj, j11);
                            Object objB = b(i15);
                            z1Var.getClass();
                            y1 y1Var = (y1) objE3;
                            if (objB == null) {
                                if (y1Var.isEmpty()) {
                                    continue;
                                } else {
                                    Iterator it = y1Var.entrySet().iterator();
                                    if (it.hasNext()) {
                                        Map.Entry entry = (Map.Entry) it.next();
                                        entry.getKey();
                                        entry.getValue();
                                        throw null;
                                    }
                                }
                                i15 += 3;
                                i12 = i19;
                            } else {
                                throw new ClassCastException();
                            }
                        case 51:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 8, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 52:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 4, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 53:
                            if (a(obj, i18, i15)) {
                                long jLongValue = ((Long) x3.e(obj, j11)).longValue();
                                iB8 = b0.b(i18);
                                iA6 = b0.a(jLongValue);
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 54:
                            if (a(obj, i18, i15)) {
                                long jLongValue2 = ((Long) x3.e(obj, j11)).longValue();
                                iB8 = b0.b(i18);
                                iA6 = b0.a(jLongValue2);
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 55:
                            if (a(obj, i18, i15)) {
                                int iIntValue = ((Integer) x3.e(obj, j11)).intValue();
                                iB9 = b0.b(i18);
                                if (iIntValue >= 0) {
                                    iC = b0.c(iIntValue);
                                }
                                iA7 = iC + iB9;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                            break;
                        case 56:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 8, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 57:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 4, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 58:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 1, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 59:
                            if (a(obj, i18, i15)) {
                                Object objE4 = x3.e(obj, j11);
                                if (objE4 instanceof s) {
                                    iB10 = b0.b(i18);
                                    iA8 = b0.a((s) objE4);
                                } else {
                                    iB10 = b0.b(i18);
                                    iA8 = b0.a((String) objE4);
                                }
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 60:
                            if (a(obj, i18, i15)) {
                                Object objE5 = x3.e(obj, j11);
                                t2 t2VarC5 = c(i15);
                                Class cls20 = u2.f30916a;
                                int iB15 = b0.b(i18);
                                int serializedSize4 = ((b) ((d2) objE5)).getSerializedSize(t2VarC5);
                                iA5 = l0.a(serializedSize4, serializedSize4, iB15, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 61:
                            if (a(obj, i18, i15)) {
                                s sVar2 = (s) x3.e(obj, j11);
                                iB10 = b0.b(i18);
                                iA8 = b0.a(sVar2);
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 62:
                            if (a(obj, i18, i15)) {
                                int iIntValue2 = ((Integer) x3.e(obj, j11)).intValue();
                                iB10 = b0.b(i18);
                                iA8 = b0.c(iIntValue2);
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 63:
                            if (a(obj, i18, i15)) {
                                int iIntValue3 = ((Integer) x3.e(obj, j11)).intValue();
                                iB10 = b0.b(i18);
                                iA8 = b0.a(iIntValue3);
                                iA7 = iA8 + iB10;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 64:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 4, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 65:
                            if (a(obj, i18, i15)) {
                                iA5 = g2.a(i18, 8, iB12);
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 66:
                            if (a(obj, i18, i15)) {
                                int iIntValue4 = ((Integer) x3.e(obj, j11)).intValue();
                                iB8 = b0.b(i18);
                                iA6 = b0.c(b0.d(iIntValue4));
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 67:
                            if (a(obj, i18, i15)) {
                                long jLongValue3 = ((Long) x3.e(obj, j11)).longValue();
                                iB8 = b0.b(i18);
                                iA6 = b0.a(b0.b(jLongValue3));
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        case 68:
                            if (a(obj, i18, i15)) {
                                d2 d2Var2 = (d2) x3.e(obj, j11);
                                t2 t2VarC6 = c(i15);
                                iB8 = b0.b(i18) * 2;
                                iA6 = ((b) d2Var2).getSerializedSize(t2VarC6);
                                iA7 = iA6 + iB8;
                                iA5 = iA7 + iB12;
                                iB12 = iA5;
                                i15 += 3;
                                i12 = i19;
                            } else {
                                i15 += 3;
                                i12 = i19;
                            }
                        default:
                            i15 += 3;
                            i12 = i19;
                    }
                } else {
                    this.n.getClass();
                    return ((z0) obj).unknownFields.a() + iB12;
                }
            }
        } else {
            Unsafe unsafe2 = f30818r;
            int i25 = 1048575;
            int i26 = 0;
            int iA10 = 0;
            int i27 = 0;
            while (true) {
                int[] iArr2 = this.f30819a;
                if (i26 < iArr2.length) {
                    int i28 = iArr2[i26 + 1];
                    int i29 = iArr2[i26];
                    int i31 = (i28 & 267386880) >>> 20;
                    int i32 = i13;
                    if (i31 <= 17) {
                        int i33 = iArr2[i26 + 2];
                        int i34 = i33 & i32;
                        i5 = i14 << (i33 >>> 20);
                        if (i34 != i25) {
                            i27 = unsafe2.getInt(obj, i34);
                            i25 = i34;
                        }
                    } else {
                        i5 = 0;
                    }
                    long j12 = i28 & i32;
                    switch (i31) {
                        case 0:
                            if ((i5 & i27) != 0) {
                                iA10 = g2.a(i29, 8, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 1:
                            if ((i5 & i27) != 0) {
                                iA10 = g2.a(i29, 4, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 2:
                            if ((i5 & i27) != 0) {
                                long j13 = unsafe2.getLong(obj, j12);
                                iB = b0.b(i29);
                                iA = b0.a(j13);
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 3:
                            if ((i5 & i27) != 0) {
                                long j14 = unsafe2.getLong(obj, j12);
                                iB = b0.b(i29);
                                iA = b0.a(j14);
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 4:
                            if ((i5 & i27) != 0) {
                                int i35 = unsafe2.getInt(obj, j12);
                                iA = b0.b(i29);
                                iB = i35 >= 0 ? b0.c(i35) : 10;
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 5:
                            if ((i5 & i27) != 0) {
                                iA10 = g2.a(i29, 8, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 6:
                            if ((i5 & i27) != 0) {
                                iA10 = g2.a(i29, 4, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 7:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                i14 = i11;
                                iA10 = g2.a(i29, i14, iA10);
                            } else {
                                i14 = i11;
                            }
                            i26 += 3;
                            i13 = i32;
                        case 8:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                Object object = unsafe2.getObject(obj, j12);
                                if (object instanceof s) {
                                    iB2 = b0.b(i29);
                                    iA2 = b0.a((s) object);
                                } else {
                                    iB2 = b0.b(i29);
                                    iA2 = b0.a((String) object);
                                }
                                iB3 = iA2 + iB2;
                                i14 = i11;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 9:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                Object object2 = unsafe2.getObject(obj, j12);
                                t2 t2VarC7 = c(i26);
                                Class cls21 = u2.f30916a;
                                int iB16 = b0.b(i29);
                                int serializedSize5 = ((b) ((d2) object2)).getSerializedSize(t2VarC7);
                                iA10 = l0.a(serializedSize5, serializedSize5, iB16, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 10:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                s sVar3 = (s) unsafe2.getObject(obj, j12);
                                iB2 = b0.b(i29);
                                iA2 = b0.a(sVar3);
                                iB3 = iA2 + iB2;
                                i14 = i11;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 11:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                int i36 = unsafe2.getInt(obj, j12);
                                iB2 = b0.b(i29);
                                iA2 = b0.c(i36);
                                iB3 = iA2 + iB2;
                                i14 = i11;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 12:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                int i37 = unsafe2.getInt(obj, j12);
                                iB2 = b0.b(i29);
                                iA2 = b0.a(i37);
                                iB3 = iA2 + iB2;
                                i14 = i11;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 13:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                iA10 = g2.a(i29, 4, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 14:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                iA10 = g2.a(i29, 8, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 15:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                int i38 = unsafe2.getInt(obj, j12);
                                iB4 = b0.b(i29);
                                iA = b0.c(b0.d(i38));
                                iB = iB4;
                                i14 = i11;
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 16:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                long j15 = unsafe2.getLong(obj, j12);
                                iB4 = b0.b(i29);
                                iA = b0.a(b0.b(j15));
                                iB = iB4;
                                i14 = i11;
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 17:
                            i11 = i14;
                            if ((i5 & i27) != 0) {
                                d2 d2Var3 = (d2) unsafe2.getObject(obj, j12);
                                t2 t2VarC8 = c(i26);
                                iB5 = b0.b(i29) * 2;
                                serializedSize = ((b) d2Var3).getSerializedSize(t2VarC8);
                                iB3 = serializedSize + iB5;
                                i14 = i11;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 18:
                            iB3 = u2.b(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 19:
                            iB3 = u2.a(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 20:
                            i11 = i14;
                            List list19 = (List) unsafe2.getObject(obj, j12);
                            Class cls22 = u2.f30916a;
                            iA3 = list19.size() == 0 ? 0 : h2.a(i29, list19.size(), u2.c(list19));
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 21:
                            i11 = i14;
                            List list20 = (List) unsafe2.getObject(obj, j12);
                            Class cls23 = u2.f30916a;
                            int size18 = list20.size();
                            if (size18 != 0) {
                                iA3 = h2.a(i29, size18, u2.g(list20));
                            }
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 22:
                            i11 = i14;
                            List list21 = (List) unsafe2.getObject(obj, j12);
                            Class cls24 = u2.f30916a;
                            int size19 = list21.size();
                            if (size19 != 0) {
                                iA3 = h2.a(i29, size19, u2.b(list21));
                            }
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 23:
                            iB3 = u2.b(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 24:
                            iB3 = u2.a(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 25:
                            i11 = i14;
                            List list22 = (List) unsafe2.getObject(obj, j12);
                            Class cls25 = u2.f30916a;
                            int size20 = list22.size();
                            iA10 = (size20 == 0 ? 0 : (b0.b(i29) + 1) * size20) + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 26:
                            iB3 = u2.c(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 27:
                            i11 = i14;
                            List list23 = (List) unsafe2.getObject(obj, j12);
                            t2 t2VarC9 = c(i26);
                            Class cls26 = u2.f30916a;
                            int size21 = list23.size();
                            if (size21 == 0) {
                                iB6 = 0;
                            } else {
                                iB6 = b0.b(i29) * size21;
                                for (int i39 = 0; i39 < size21; i39++) {
                                    int serializedSize6 = ((b) ((d2) list23.get(i39))).getSerializedSize(t2VarC9);
                                    iB6 += b0.c(serializedSize6) + serializedSize6;
                                }
                            }
                            iA10 = iB6 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 28:
                            i11 = i14;
                            List list24 = (List) unsafe2.getObject(obj, j12);
                            Class cls27 = u2.f30916a;
                            int size22 = list24.size();
                            if (size22 != 0) {
                                iB6 = b0.b(i29) * size22;
                                for (int i40 = 0; i40 < list24.size(); i40++) {
                                    iB6 += b0.a((s) list24.get(i40));
                                }
                            }
                            iA10 = iB6 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 29:
                            i11 = i14;
                            List list25 = (List) unsafe2.getObject(obj, j12);
                            Class cls28 = u2.f30916a;
                            int size23 = list25.size();
                            if (size23 != 0) {
                                iA3 = h2.a(i29, size23, u2.f(list25));
                            }
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 30:
                            i11 = i14;
                            List list26 = (List) unsafe2.getObject(obj, j12);
                            Class cls29 = u2.f30916a;
                            int size24 = list26.size();
                            if (size24 != 0) {
                                iA3 = h2.a(i29, size24, u2.a(list26));
                            }
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 31:
                            iB3 = u2.a(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 32:
                            iB3 = u2.b(i29, (List) unsafe2.getObject(obj, j12));
                            iA10 = iB3 + iA10;
                            i26 += 3;
                            i13 = i32;
                        case 33:
                            i11 = i14;
                            List list27 = (List) unsafe2.getObject(obj, j12);
                            Class cls30 = u2.f30916a;
                            int size25 = list27.size();
                            if (size25 != 0) {
                                iA3 = h2.a(i29, size25, u2.d(list27));
                            }
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 34:
                            i11 = i14;
                            List list28 = (List) unsafe2.getObject(obj, j12);
                            Class cls31 = u2.f30916a;
                            int size26 = list28.size();
                            if (size26 != 0) {
                                iA3 = h2.a(i29, size26, u2.e(list28));
                            }
                            iA10 = iA3 + iA10;
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                            break;
                        case 35:
                            i11 = i14;
                            List list29 = (List) unsafe2.getObject(obj, j12);
                            Class cls32 = u2.f30916a;
                            int size27 = list29.size() * 8;
                            if (size27 > 0) {
                                iA10 = l0.a(size27, b0.b(i29), size27, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 36:
                            i11 = i14;
                            List list30 = (List) unsafe2.getObject(obj, j12);
                            Class cls33 = u2.f30916a;
                            int size28 = list30.size() * 4;
                            if (size28 > 0) {
                                iA10 = l0.a(size28, b0.b(i29), size28, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 37:
                            i11 = i14;
                            int iC7 = u2.c((List) unsafe2.getObject(obj, j12));
                            if (iC7 > 0) {
                                iA10 = l0.a(iC7, b0.b(i29), iC7, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 38:
                            i11 = i14;
                            int iG2 = u2.g((List) unsafe2.getObject(obj, j12));
                            if (iG2 > 0) {
                                iA10 = l0.a(iG2, b0.b(i29), iG2, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 39:
                            i11 = i14;
                            int iB17 = u2.b((List) unsafe2.getObject(obj, j12));
                            if (iB17 > 0) {
                                iA10 = l0.a(iB17, b0.b(i29), iB17, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 40:
                            i11 = i14;
                            List list31 = (List) unsafe2.getObject(obj, j12);
                            Class cls34 = u2.f30916a;
                            int size29 = list31.size() * 8;
                            if (size29 > 0) {
                                iA10 = l0.a(size29, b0.b(i29), size29, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 41:
                            i11 = i14;
                            List list32 = (List) unsafe2.getObject(obj, j12);
                            Class cls35 = u2.f30916a;
                            int size30 = list32.size() * 4;
                            if (size30 > 0) {
                                iA10 = l0.a(size30, b0.b(i29), size30, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 42:
                            i11 = i14;
                            List list33 = (List) unsafe2.getObject(obj, j12);
                            Class cls36 = u2.f30916a;
                            int size31 = list33.size();
                            if (size31 > 0) {
                                iA10 = l0.a(size31, b0.b(i29), size31, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 43:
                            i11 = i14;
                            int iF2 = u2.f((List) unsafe2.getObject(obj, j12));
                            if (iF2 > 0) {
                                iA10 = l0.a(iF2, b0.b(i29), iF2, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 44:
                            i11 = i14;
                            int iA11 = u2.a((List) unsafe2.getObject(obj, j12));
                            if (iA11 > 0) {
                                iA10 = l0.a(iA11, b0.b(i29), iA11, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 45:
                            i11 = i14;
                            List list34 = (List) unsafe2.getObject(obj, j12);
                            Class cls37 = u2.f30916a;
                            int size32 = list34.size() * 4;
                            if (size32 > 0) {
                                iA10 = l0.a(size32, b0.b(i29), size32, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 46:
                            i11 = i14;
                            List list35 = (List) unsafe2.getObject(obj, j12);
                            Class cls38 = u2.f30916a;
                            int size33 = list35.size() * 8;
                            if (size33 > 0) {
                                iA10 = l0.a(size33, b0.b(i29), size33, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 47:
                            i11 = i14;
                            int iD2 = u2.d((List) unsafe2.getObject(obj, j12));
                            if (iD2 > 0) {
                                iA10 = l0.a(iD2, b0.b(i29), iD2, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 48:
                            i11 = i14;
                            int iE2 = u2.e((List) unsafe2.getObject(obj, j12));
                            if (iE2 > 0) {
                                iA10 = l0.a(iE2, b0.b(i29), iE2, iA10);
                            }
                            i14 = i11;
                            i26 += 3;
                            i13 = i32;
                        case 49:
                            List list36 = (List) unsafe2.getObject(obj, j12);
                            t2 t2VarC10 = c(i26);
                            Class cls39 = u2.f30916a;
                            int size34 = list36.size();
                            if (size34 == 0) {
                                i11 = i14;
                                iB6 = 0;
                                iA10 = iB6 + iA10;
                                i14 = i11;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                int i41 = 0;
                                iB6 = 0;
                                while (i41 < size34) {
                                    iB6 += ((b) ((d2) list36.get(i41))).getSerializedSize(t2VarC10) + (b0.b(i29) * 2);
                                    i41++;
                                    i14 = i14;
                                }
                                i11 = i14;
                                iA10 = iB6 + iA10;
                                i14 = i11;
                                i26 += 3;
                                i13 = i32;
                            }
                        case 50:
                            z1 z1Var2 = this.f30832p;
                            Object object3 = unsafe2.getObject(obj, j12);
                            Object objB2 = b(i26);
                            z1Var2.getClass();
                            y1 y1Var2 = (y1) object3;
                            if (objB2 == null) {
                                if (y1Var2.isEmpty()) {
                                    continue;
                                } else {
                                    Iterator it2 = y1Var2.entrySet().iterator();
                                    if (it2.hasNext()) {
                                        Map.Entry entry2 = (Map.Entry) it2.next();
                                        entry2.getKey();
                                        entry2.getValue();
                                        throw null;
                                    }
                                }
                                i26 += 3;
                                i13 = i32;
                            } else {
                                throw new ClassCastException();
                            }
                        case 51:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, 8, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 52:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, 4, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 53:
                            if (a(obj, i29, i26)) {
                                long jLongValue4 = ((Long) x3.e(obj, j12)).longValue();
                                iB = b0.b(i29);
                                iA = b0.a(jLongValue4);
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 54:
                            if (a(obj, i29, i26)) {
                                long jLongValue5 = ((Long) x3.e(obj, j12)).longValue();
                                iB = b0.b(i29);
                                iA = b0.a(jLongValue5);
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 55:
                            if (a(obj, i29, i26)) {
                                int iIntValue5 = ((Integer) x3.e(obj, j12)).intValue();
                                iA = b0.b(i29);
                                if (iIntValue5 >= 0) {
                                    iB = b0.c(iIntValue5);
                                }
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                            break;
                        case 56:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, 8, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 57:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, 4, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 58:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, i14, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 59:
                            if (a(obj, i29, i26)) {
                                Object object4 = unsafe2.getObject(obj, j12);
                                if (object4 instanceof s) {
                                    iB7 = b0.b(i29);
                                    iA4 = b0.a((s) object4);
                                } else {
                                    iB7 = b0.b(i29);
                                    iA4 = b0.a((String) object4);
                                }
                                iB3 = iA4 + iB7;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 60:
                            if (a(obj, i29, i26)) {
                                Object object5 = unsafe2.getObject(obj, j12);
                                t2 t2VarC11 = c(i26);
                                Class cls40 = u2.f30916a;
                                int iB18 = b0.b(i29);
                                int serializedSize7 = ((b) ((d2) object5)).getSerializedSize(t2VarC11);
                                iA10 = l0.a(serializedSize7, serializedSize7, iB18, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 61:
                            if (a(obj, i29, i26)) {
                                s sVar4 = (s) unsafe2.getObject(obj, j12);
                                iB7 = b0.b(i29);
                                iA4 = b0.a(sVar4);
                                iB3 = iA4 + iB7;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 62:
                            if (a(obj, i29, i26)) {
                                int iIntValue6 = ((Integer) x3.e(obj, j12)).intValue();
                                iB7 = b0.b(i29);
                                iA4 = b0.c(iIntValue6);
                                iB3 = iA4 + iB7;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 63:
                            if (a(obj, i29, i26)) {
                                int iIntValue7 = ((Integer) x3.e(obj, j12)).intValue();
                                iB7 = b0.b(i29);
                                iA4 = b0.a(iIntValue7);
                                iB3 = iA4 + iB7;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 64:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, 4, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 65:
                            if (a(obj, i29, i26)) {
                                iA10 = g2.a(i29, 8, iA10);
                            }
                            i26 += 3;
                            i13 = i32;
                        case 66:
                            if (a(obj, i29, i26)) {
                                int iIntValue8 = ((Integer) x3.e(obj, j12)).intValue();
                                int iB19 = b0.b(i29);
                                iA = b0.c(b0.d(iIntValue8));
                                iB = iB19;
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 67:
                            if (a(obj, i29, i26)) {
                                long jLongValue6 = ((Long) x3.e(obj, j12)).longValue();
                                iB = b0.b(i29);
                                iA = b0.a(b0.b(jLongValue6));
                                iB3 = iB + iA;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        case 68:
                            if (a(obj, i29, i26)) {
                                d2 d2Var4 = (d2) unsafe2.getObject(obj, j12);
                                t2 t2VarC12 = c(i26);
                                iB5 = b0.b(i29) * 2;
                                serializedSize = ((b) d2Var4).getSerializedSize(t2VarC12);
                                i11 = i14;
                                iB3 = serializedSize + iB5;
                                i14 = i11;
                                iA10 = iB3 + iA10;
                                i26 += 3;
                                i13 = i32;
                            } else {
                                i26 += 3;
                                i13 = i32;
                            }
                        default:
                            i26 += 3;
                            i13 = i32;
                    }
                } else {
                    this.n.getClass();
                    int iA12 = ((z0) obj).unknownFields.a() + iA10;
                    if (!this.f30824f) {
                        return iA12;
                    }
                    this.o.getClass();
                    return ((GeneratedMessageLite$ExtendableMessage) obj).extensions.b() + iA12;
                }
            }
        }
    }

    public static Field a(Class cls, String str) {
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException unused) {
            Field[] declaredFields = cls.getDeclaredFields();
            for (Field field : declaredFields) {
                if (str.equals(field.getName())) {
                    return field;
                }
            }
            StringBuilder sbK = u4.k("Field ", str, " for ");
            sbK.append(cls.getName());
            sbK.append(" not found. Known fields are ");
            sbK.append(Arrays.toString(declaredFields));
            throw new RuntimeException(sbK.toString());
        }
    }

    public final void d(int i5, Object obj, Object obj2) {
        long j11 = this.f30819a[i5 + 1] & 1048575;
        if (a(i5, obj2)) {
            Object objE = x3.e(obj, j11);
            Object objE2 = x3.e(obj2, j11);
            if (objE != null && objE2 != null) {
                x3.a(j11, obj, l1.a(objE, objE2));
                b(i5, obj);
            } else if (objE2 != null) {
                x3.a(j11, obj, objE2);
                b(i5, obj);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.t2
    public final Object a() {
        k2 k2Var = this.f30830l;
        d2 d2Var = this.f30823e;
        k2Var.getClass();
        return ((z0) d2Var).dynamicMethod(y0.NEW_MUTABLE_INSTANCE);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001c  */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Object obj, Object obj2) {
        Object obj3;
        obj2.getClass();
        int i5 = 0;
        while (true) {
            int[] iArr = this.f30819a;
            if (i5 < iArr.length) {
                int i11 = iArr[i5 + 1];
                long j11 = 1048575 & i11;
                int i12 = iArr[i5];
                switch ((i11 & 267386880) >>> 20) {
                    case 0:
                        if (!a(i5, obj2)) {
                            obj3 = obj;
                            break;
                        } else {
                            w3 w3Var = x3.f30955c;
                            obj3 = obj;
                            w3Var.a(obj3, j11, w3Var.c(obj2, j11));
                            b(i5, obj3);
                            break;
                        }
                    case 1:
                        if (a(i5, obj2)) {
                            w3 w3Var2 = x3.f30955c;
                            w3Var2.a(obj, j11, w3Var2.d(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 2:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.d(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 3:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.d(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 4:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.c(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 5:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.d(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 6:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.c(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 7:
                        if (a(i5, obj2)) {
                            w3 w3Var3 = x3.f30955c;
                            w3Var3.a(obj, j11, w3Var3.a(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 8:
                        if (a(i5, obj2)) {
                            x3.a(j11, obj, x3.e(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 9:
                        d(i5, obj, obj2);
                        obj3 = obj;
                        break;
                    case 10:
                        if (a(i5, obj2)) {
                            x3.a(j11, obj, x3.e(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 11:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.c(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 12:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.c(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 13:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.c(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 14:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.d(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 15:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.c(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 16:
                        if (a(i5, obj2)) {
                            x3.a(obj, j11, x3.d(obj2, j11));
                            b(i5, obj);
                        }
                        obj3 = obj;
                        break;
                    case 17:
                        d(i5, obj, obj2);
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
                        this.f30831m.a(j11, obj, obj2);
                        obj3 = obj;
                        break;
                    case 50:
                        z1 z1Var = this.f30832p;
                        Class cls = u2.f30916a;
                        Object objE = x3.e(obj, j11);
                        Object objE2 = x3.e(obj2, j11);
                        z1Var.getClass();
                        x3.a(j11, obj, z1.a(objE, objE2));
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
                        if (a(obj2, i12, i5)) {
                            x3.a(j11, obj, x3.e(obj2, j11));
                            b(obj, i12, i5);
                        }
                        obj3 = obj;
                        break;
                    case 60:
                        e(i5, obj, obj2);
                        obj3 = obj;
                        break;
                    case 61:
                    case 62:
                    case 63:
                    case 64:
                    case 65:
                    case 66:
                    case 67:
                        if (a(obj2, i12, i5)) {
                            x3.a(j11, obj, x3.e(obj2, j11));
                            b(obj, i12, i5);
                        }
                        obj3 = obj;
                        break;
                    case 68:
                        e(i5, obj, obj2);
                        obj3 = obj;
                        break;
                }
                i5 += 3;
                obj = obj3;
            } else {
                Object obj4 = obj;
                o3 o3Var = this.n;
                Class cls2 = u2.f30916a;
                o3Var.getClass();
                z0 z0Var = (z0) obj4;
                n3 n3VarA = z0Var.unknownFields;
                n3 n3Var = ((z0) obj2).unknownFields;
                if (!n3Var.equals(n3.f30860f)) {
                    n3VarA = n3.a(n3VarA, n3Var);
                }
                z0Var.unknownFields = n3VarA;
                if (this.f30824f) {
                    this.o.getClass();
                    n0 n0Var = ((GeneratedMessageLite$ExtendableMessage) obj2).extensions;
                    if (n0Var.f30856a.isEmpty()) {
                        return;
                    }
                    ((GeneratedMessageLite$ExtendableMessage) obj4).ensureExtensionsAreMutable().a(n0Var);
                    return;
                }
                return;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:100:0x030b  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x031c  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x032d  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x033e  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x034f  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0360  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0371  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0382  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0393  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x03a4  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x03b5  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x03c6  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x03d7  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x03e8  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x03f9  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x040e  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x041f  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0430  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0441  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0452  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0463  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0474  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0485  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0496  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x04a7  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x04bc  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x04cd  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x04de  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x04f1  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0504  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0517  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x052a  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x053f  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0558  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0569  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x057e  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0590  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x05a2  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x05b4  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x05c6  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x05d8  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x05ea  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x0643  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x06a5  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x06aa  */
    /* JADX WARN: Removed duplicated region for block: B:218:0x06bc  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x06d0  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x06e4  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x06fa  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x0710  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x0727  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x073e  */
    /* JADX WARN: Removed duplicated region for block: B:239:0x0751  */
    /* JADX WARN: Removed duplicated region for block: B:242:0x0768  */
    /* JADX WARN: Removed duplicated region for block: B:245:0x0777  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x078e  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x07a5  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x07bc  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x07d3  */
    /* JADX WARN: Removed duplicated region for block: B:260:0x07ea  */
    /* JADX WARN: Removed duplicated region for block: B:263:0x0801  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x0816  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x082b  */
    /* JADX WARN: Removed duplicated region for block: B:274:0x0845  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0858  */
    /* JADX WARN: Removed duplicated region for block: B:276:0x0868  */
    /* JADX WARN: Removed duplicated region for block: B:277:0x0878  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x0888  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x0898  */
    /* JADX WARN: Removed duplicated region for block: B:280:0x08a8  */
    /* JADX WARN: Removed duplicated region for block: B:281:0x08b8  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x08c8  */
    /* JADX WARN: Removed duplicated region for block: B:283:0x08d8  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x08e8  */
    /* JADX WARN: Removed duplicated region for block: B:285:0x08f8  */
    /* JADX WARN: Removed duplicated region for block: B:286:0x0908  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x0918  */
    /* JADX WARN: Removed duplicated region for block: B:288:0x0928  */
    /* JADX WARN: Removed duplicated region for block: B:289:0x0938  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x094b  */
    /* JADX WARN: Removed duplicated region for block: B:292:0x095b  */
    /* JADX WARN: Removed duplicated region for block: B:293:0x096b  */
    /* JADX WARN: Removed duplicated region for block: B:294:0x097b  */
    /* JADX WARN: Removed duplicated region for block: B:295:0x098b  */
    /* JADX WARN: Removed duplicated region for block: B:296:0x099b  */
    /* JADX WARN: Removed duplicated region for block: B:297:0x09ab  */
    /* JADX WARN: Removed duplicated region for block: B:298:0x09bf  */
    /* JADX WARN: Removed duplicated region for block: B:299:0x09cf  */
    /* JADX WARN: Removed duplicated region for block: B:300:0x09e0  */
    /* JADX WARN: Removed duplicated region for block: B:301:0x09f1  */
    /* JADX WARN: Removed duplicated region for block: B:302:0x0a02  */
    /* JADX WARN: Removed duplicated region for block: B:303:0x0a13  */
    /* JADX WARN: Removed duplicated region for block: B:304:0x0a24  */
    /* JADX WARN: Removed duplicated region for block: B:305:0x0a35  */
    /* JADX WARN: Removed duplicated region for block: B:306:0x0a46  */
    /* JADX WARN: Removed duplicated region for block: B:307:0x0a57  */
    /* JADX WARN: Removed duplicated region for block: B:310:0x0a6b  */
    /* JADX WARN: Removed duplicated region for block: B:313:0x0a7b  */
    /* JADX WARN: Removed duplicated region for block: B:316:0x0a8b  */
    /* JADX WARN: Removed duplicated region for block: B:319:0x0a9d  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x0aaf  */
    /* JADX WARN: Removed duplicated region for block: B:325:0x0ac1  */
    /* JADX WARN: Removed duplicated region for block: B:328:0x0ad3  */
    /* JADX WARN: Removed duplicated region for block: B:331:0x0ae7  */
    /* JADX WARN: Removed duplicated region for block: B:334:0x0aff  */
    /* JADX WARN: Removed duplicated region for block: B:337:0x0b0f  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:340:0x0b23  */
    /* JADX WARN: Removed duplicated region for block: B:343:0x0b34  */
    /* JADX WARN: Removed duplicated region for block: B:346:0x0b45  */
    /* JADX WARN: Removed duplicated region for block: B:349:0x0b56  */
    /* JADX WARN: Removed duplicated region for block: B:352:0x0b67  */
    /* JADX WARN: Removed duplicated region for block: B:355:0x0b78  */
    /* JADX WARN: Removed duplicated region for block: B:358:0x0b89  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:475:0x05fb A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x012d  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01d0  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01e9  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0202  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x021b  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0234  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x024b  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0262  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x027f  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0294  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x02b6  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x02c7  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x02e9  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x02fa  */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Object obj, c0 c0Var) {
        Iterator itD;
        Map.Entry entry;
        int i5;
        int i11;
        int i12;
        int i13;
        Map.Entry entry2;
        Iterator w2Var;
        c0Var.getClass();
        int i14 = 267386880;
        int i15 = 0;
        int i16 = 1;
        int i17 = 1048575;
        if (q4.ASCENDING == q4.DESCENDING) {
            this.n.getClass();
            ((z0) obj).unknownFields.a(c0Var);
            if (this.f30824f) {
                this.o.getClass();
                n0 n0Var = ((GeneratedMessageLite$ExtendableMessage) obj).extensions;
                if (n0Var.f30856a.isEmpty()) {
                    entry2 = null;
                    w2Var = null;
                } else {
                    if (n0Var.f30858c) {
                        e3 e3Var = n0Var.f30856a;
                        if (e3Var.f30795g == null) {
                            e3Var.f30795g = new x2(e3Var);
                        }
                        w2Var = new o1(new w2(e3Var.f30795g.f30952b));
                    } else {
                        e3 e3Var2 = n0Var.f30856a;
                        if (e3Var2.f30795g == null) {
                            e3Var2.f30795g = new x2(e3Var2);
                        }
                        w2Var = new w2(e3Var2.f30795g.f30952b);
                    }
                    entry2 = (Map.Entry) w2Var.next();
                }
            }
            for (int length = this.f30819a.length - 3; length >= 0; length -= 3) {
                int[] iArr = this.f30819a;
                int i18 = iArr[length + 1];
                int i19 = iArr[length];
                while (entry2 != null) {
                    this.o.getClass();
                    if (((w0) entry2.getKey()).f30933b > i19) {
                        this.o.getClass();
                        j0.a(c0Var, entry2);
                        entry2 = w2Var.hasNext() ? (Map.Entry) w2Var.next() : null;
                    } else {
                        switch ((i18 & 267386880) >>> 20) {
                            case 0:
                                if (a(length, obj)) {
                                    c0Var.a(i19, x3.f30955c.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 1:
                                if (a(length, obj)) {
                                    c0Var.a(i19, x3.f30955c.d(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 2:
                                if (a(length, obj)) {
                                    c0Var.f30775a.b(i19, x3.d(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 3:
                                if (a(length, obj)) {
                                    c0Var.f30775a.b(i19, x3.d(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 4:
                                if (a(length, obj)) {
                                    c0Var.f30775a.b(i19, x3.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 5:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, x3.d(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 6:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, x3.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 7:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, x3.f30955c.a(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 8:
                                if (a(length, obj)) {
                                    a(i19, x3.e(obj, i18 & 1048575), c0Var);
                                    break;
                                } else {
                                    break;
                                }
                            case 9:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, (d2) x3.e(obj, i18 & 1048575), c(length));
                                    break;
                                } else {
                                    break;
                                }
                            case 10:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, (s) x3.e(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 11:
                                if (a(length, obj)) {
                                    c0Var.f30775a.d(i19, x3.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 12:
                                if (a(length, obj)) {
                                    c0Var.f30775a.b(i19, x3.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 13:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, x3.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 14:
                                if (a(length, obj)) {
                                    c0Var.f30775a.a(i19, x3.d(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 15:
                                if (a(length, obj)) {
                                    c0Var.a(i19, x3.c(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 16:
                                if (a(length, obj)) {
                                    c0Var.a(i19, x3.d(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 17:
                                if (a(length, obj)) {
                                    c0Var.a(i19, x3.e(obj, i18 & 1048575), c(length));
                                    break;
                                } else {
                                    break;
                                }
                            case 18:
                                u2.b(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 19:
                                u2.f(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 20:
                                u2.h(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 21:
                                u2.n(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 22:
                                u2.g(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 23:
                                u2.e(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 24:
                                u2.d(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 25:
                                u2.a(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 26:
                                u2.b(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var);
                                break;
                            case 27:
                                u2.b(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, c(length));
                                break;
                            case 28:
                                u2.a(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var);
                                break;
                            case 29:
                                u2.m(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 30:
                                u2.c(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 31:
                                u2.i(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 32:
                                u2.j(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 33:
                                u2.k(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 34:
                                u2.l(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, false);
                                break;
                            case 35:
                                u2.b(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 36:
                                u2.f(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 37:
                                u2.h(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 38:
                                u2.n(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 39:
                                u2.g(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 40:
                                u2.e(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 41:
                                u2.d(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 42:
                                u2.a(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 43:
                                u2.m(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 44:
                                u2.c(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 45:
                                u2.i(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 46:
                                u2.j(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 47:
                                u2.k(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 48:
                                u2.l(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, true);
                                break;
                            case 49:
                                u2.a(this.f30819a[length], (List) x3.e(obj, i18 & 1048575), c0Var, c(length));
                                break;
                            case 50:
                                if (x3.e(obj, i18 & 1048575) != null) {
                                    z1 z1Var = this.f30832p;
                                    Object objB = b(length);
                                    z1Var.getClass();
                                    objB.getClass();
                                    throw new ClassCastException();
                                }
                                break;
                            case 51:
                                if (a(obj, i19, length)) {
                                    c0Var.a(i19, ((Double) x3.e(obj, i18 & 1048575)).doubleValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 52:
                                if (a(obj, i19, length)) {
                                    c0Var.a(i19, ((Float) x3.e(obj, i18 & 1048575)).floatValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 53:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.b(i19, ((Long) x3.e(obj, i18 & 1048575)).longValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 54:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.b(i19, ((Long) x3.e(obj, i18 & 1048575)).longValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 55:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.b(i19, ((Integer) x3.e(obj, i18 & 1048575)).intValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 56:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, ((Long) x3.e(obj, i18 & 1048575)).longValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 57:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, ((Integer) x3.e(obj, i18 & 1048575)).intValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 58:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, ((Boolean) x3.e(obj, i18 & 1048575)).booleanValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 59:
                                if (a(obj, i19, length)) {
                                    a(i19, x3.e(obj, i18 & 1048575), c0Var);
                                    break;
                                } else {
                                    break;
                                }
                            case 60:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, (d2) x3.e(obj, i18 & 1048575), c(length));
                                    break;
                                } else {
                                    break;
                                }
                            case 61:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, (s) x3.e(obj, i18 & 1048575));
                                    break;
                                } else {
                                    break;
                                }
                            case 62:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.d(i19, ((Integer) x3.e(obj, i18 & 1048575)).intValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 63:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.b(i19, ((Integer) x3.e(obj, i18 & 1048575)).intValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 64:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, ((Integer) x3.e(obj, i18 & 1048575)).intValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 65:
                                if (a(obj, i19, length)) {
                                    c0Var.f30775a.a(i19, ((Long) x3.e(obj, i18 & 1048575)).longValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 66:
                                if (a(obj, i19, length)) {
                                    c0Var.a(i19, ((Integer) x3.e(obj, i18 & 1048575)).intValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 67:
                                if (a(obj, i19, length)) {
                                    c0Var.a(i19, ((Long) x3.e(obj, i18 & 1048575)).longValue());
                                    break;
                                } else {
                                    break;
                                }
                            case 68:
                                if (a(obj, i19, length)) {
                                    c0Var.a(i19, x3.e(obj, i18 & 1048575), c(length));
                                    break;
                                } else {
                                    break;
                                }
                        }
                    }
                }
                switch ((i18 & 267386880) >>> 20) {
                }
            }
            while (entry2 != null) {
                this.o.getClass();
                j0.a(c0Var, entry2);
                entry2 = w2Var.hasNext() ? (Map.Entry) w2Var.next() : null;
            }
            return;
        }
        if (this.f30826h) {
            b(obj, c0Var);
            return;
        }
        if (this.f30824f) {
            this.o.getClass();
            n0 n0Var2 = ((GeneratedMessageLite$ExtendableMessage) obj).extensions;
            if (n0Var2.f30856a.isEmpty()) {
                itD = null;
                entry = null;
            } else {
                itD = n0Var2.d();
                entry = (Map.Entry) itD.next();
            }
        }
        int length2 = this.f30819a.length;
        Unsafe unsafe = f30818r;
        int i21 = 0;
        int i22 = 0;
        int i23 = 1048575;
        while (i21 < length2) {
            int[] iArr2 = this.f30819a;
            int i24 = iArr2[i21 + 1];
            int i25 = i14;
            int i26 = iArr2[i21];
            int i27 = (i24 & i25) >>> 20;
            int i28 = i17;
            if (i27 <= 17) {
                int i29 = iArr2[i21 + 2];
                int i31 = i29 & i28;
                if (i31 != i23) {
                    i22 = unsafe.getInt(obj, i31);
                    i23 = i31;
                }
                i5 = i16 << (i29 >>> 20);
            } else {
                i5 = i15;
            }
            while (entry != null) {
                this.o.getClass();
                if (((w0) entry.getKey()).f30933b <= i26) {
                    this.o.getClass();
                    j0.a(c0Var, entry);
                    entry = itD.hasNext() ? (Map.Entry) itD.next() : null;
                } else {
                    long j11 = i24 & i28;
                    switch (i27) {
                        case 0:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.a(i26, x3.f30955c.c(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 1:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.a(i26, x3.f30955c.d(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 2:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.b(i26, unsafe.getLong(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 3:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.b(i26, unsafe.getLong(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 4:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.b(i26, unsafe.getInt(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 5:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, unsafe.getLong(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 6:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, unsafe.getInt(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 7:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, x3.f30955c.a(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 8:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                a(i26, unsafe.getObject(obj, j11), c0Var);
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 9:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, (d2) unsafe.getObject(obj, j11), c(i21));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 10:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, (s) unsafe.getObject(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 11:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.d(i26, unsafe.getInt(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 12:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.b(i26, unsafe.getInt(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 13:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, unsafe.getInt(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 14:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.f30775a.a(i26, unsafe.getLong(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 15:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.a(i26, unsafe.getInt(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 16:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.a(i26, unsafe.getLong(obj, j11));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 17:
                            i11 = 1;
                            i12 = 0;
                            if ((i22 & i5) != 0) {
                                c0Var.a(i26, unsafe.getObject(obj, j11), c(i21));
                            }
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 18:
                            i13 = 0;
                            i11 = 1;
                            u2.b(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 19:
                            i13 = 0;
                            i11 = 1;
                            u2.f(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 20:
                            i13 = 0;
                            i11 = 1;
                            u2.h(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 21:
                            i13 = 0;
                            i11 = 1;
                            u2.n(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 22:
                            i13 = 0;
                            i11 = 1;
                            u2.g(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 23:
                            i13 = 0;
                            i11 = 1;
                            u2.e(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 24:
                            i13 = 0;
                            i11 = 1;
                            u2.d(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 25:
                            i11 = 1;
                            i13 = 0;
                            u2.a(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 26:
                            i11 = 1;
                            u2.b(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 27:
                            i11 = 1;
                            u2.b(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, c(i21));
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 28:
                            i11 = 1;
                            u2.a(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 29:
                            i13 = 0;
                            i11 = 1;
                            u2.m(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 30:
                            i13 = 0;
                            i11 = 1;
                            u2.c(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 31:
                            i13 = 0;
                            i11 = 1;
                            u2.i(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 32:
                            i13 = 0;
                            i11 = 1;
                            u2.j(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 33:
                            i13 = 0;
                            i11 = 1;
                            u2.k(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 34:
                            i11 = 1;
                            i13 = 0;
                            u2.l(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, false);
                            i12 = i13;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 35:
                            i11 = 1;
                            u2.b(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 36:
                            i11 = 1;
                            u2.f(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 37:
                            i11 = 1;
                            u2.h(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 38:
                            i11 = 1;
                            u2.n(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 39:
                            i11 = 1;
                            u2.g(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 40:
                            i11 = 1;
                            u2.e(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 41:
                            i11 = 1;
                            u2.d(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 42:
                            i11 = 1;
                            u2.a(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 43:
                            i11 = 1;
                            u2.m(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 44:
                            i11 = 1;
                            u2.c(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 45:
                            i11 = 1;
                            u2.i(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 46:
                            i11 = 1;
                            u2.j(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 47:
                            i11 = 1;
                            u2.k(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 48:
                            i11 = 1;
                            u2.l(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, true);
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 49:
                            u2.a(this.f30819a[i21], (List) unsafe.getObject(obj, j11), c0Var, c(i21));
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 50:
                            if (unsafe.getObject(obj, j11) != null) {
                                z1 z1Var2 = this.f30832p;
                                Object objB2 = b(i21);
                                z1Var2.getClass();
                                objB2.getClass();
                                throw new ClassCastException();
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 51:
                            if (a(obj, i26, i21)) {
                                c0Var.a(i26, ((Double) x3.e(obj, j11)).doubleValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 52:
                            if (a(obj, i26, i21)) {
                                c0Var.a(i26, ((Float) x3.e(obj, j11)).floatValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 53:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.b(i26, ((Long) x3.e(obj, j11)).longValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 54:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.b(i26, ((Long) x3.e(obj, j11)).longValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 55:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.b(i26, ((Integer) x3.e(obj, j11)).intValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 56:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, ((Long) x3.e(obj, j11)).longValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 57:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, ((Integer) x3.e(obj, j11)).intValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 58:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, ((Boolean) x3.e(obj, j11)).booleanValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 59:
                            if (a(obj, i26, i21)) {
                                a(i26, unsafe.getObject(obj, j11), c0Var);
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 60:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, (d2) unsafe.getObject(obj, j11), c(i21));
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 61:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, (s) unsafe.getObject(obj, j11));
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 62:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.d(i26, ((Integer) x3.e(obj, j11)).intValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 63:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.b(i26, ((Integer) x3.e(obj, j11)).intValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 64:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, ((Integer) x3.e(obj, j11)).intValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 65:
                            if (a(obj, i26, i21)) {
                                c0Var.f30775a.a(i26, ((Long) x3.e(obj, j11)).longValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 66:
                            if (a(obj, i26, i21)) {
                                c0Var.a(i26, ((Integer) x3.e(obj, j11)).intValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 67:
                            if (a(obj, i26, i21)) {
                                c0Var.a(i26, ((Long) x3.e(obj, j11)).longValue());
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        case 68:
                            if (a(obj, i26, i21)) {
                                c0Var.a(i26, unsafe.getObject(obj, j11), c(i21));
                            }
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                        default:
                            i11 = 1;
                            i12 = 0;
                            i21 += 3;
                            i16 = i11;
                            i15 = i12;
                            i14 = i25;
                            i17 = i28;
                    }
                }
            }
            long j112 = i24 & i28;
            switch (i27) {
            }
        }
        while (entry != null) {
            this.o.getClass();
            j0.a(c0Var, entry);
            entry = itD.hasNext() ? (Map.Entry) itD.next() : null;
        }
        this.n.getClass();
        ((z0) obj).unknownFields.a(c0Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0388  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0399  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x03aa  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x03bf  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x03d0  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x03e1  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x03f2  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0403  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0414  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0425  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0436  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0447  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x0458  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x046d  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x047e  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x048f  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x04a2  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x04b5  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x04c8  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x04db  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x04f0  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0509  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x051a  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x052f  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0541  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0553  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0565  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0577  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0589  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x059b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:280:0x05ac A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01b3  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01cc  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01e5  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01fc  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0022  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0230  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0245  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0256  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0267  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0278  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0289  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x02ab  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02de  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x02ef  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0300  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0311  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0322  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0333  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0344  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0355  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0366  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0377  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(Object obj, c0 c0Var) {
        Iterator itD;
        Map.Entry entry;
        if (this.f30824f) {
            this.o.getClass();
            n0 n0Var = ((GeneratedMessageLite$ExtendableMessage) obj).extensions;
            if (n0Var.f30856a.isEmpty()) {
                itD = null;
                entry = null;
            } else {
                itD = n0Var.d();
                entry = (Map.Entry) itD.next();
            }
        }
        int length = this.f30819a.length;
        for (int i5 = 0; i5 < length; i5 += 3) {
            int[] iArr = this.f30819a;
            int i11 = iArr[i5 + 1];
            int i12 = iArr[i5];
            while (entry != null) {
                this.o.getClass();
                if (((w0) entry.getKey()).f30933b <= i12) {
                    this.o.getClass();
                    j0.a(c0Var, entry);
                    entry = itD.hasNext() ? (Map.Entry) itD.next() : null;
                } else {
                    switch ((267386880 & i11) >>> 20) {
                        case 0:
                            if (a(i5, obj)) {
                                c0Var.a(i12, x3.f30955c.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 1:
                            if (a(i5, obj)) {
                                c0Var.a(i12, x3.f30955c.d(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 2:
                            if (a(i5, obj)) {
                                c0Var.f30775a.b(i12, x3.d(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 3:
                            if (a(i5, obj)) {
                                c0Var.f30775a.b(i12, x3.d(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 4:
                            if (a(i5, obj)) {
                                c0Var.f30775a.b(i12, x3.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 5:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, x3.d(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 6:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, x3.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 7:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, x3.f30955c.a(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 8:
                            if (a(i5, obj)) {
                                a(i12, x3.e(obj, i11 & 1048575), c0Var);
                                break;
                            } else {
                                break;
                            }
                        case 9:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, (d2) x3.e(obj, i11 & 1048575), c(i5));
                                break;
                            } else {
                                break;
                            }
                        case 10:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, (s) x3.e(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 11:
                            if (a(i5, obj)) {
                                c0Var.f30775a.d(i12, x3.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 12:
                            if (a(i5, obj)) {
                                c0Var.f30775a.b(i12, x3.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 13:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, x3.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 14:
                            if (a(i5, obj)) {
                                c0Var.f30775a.a(i12, x3.d(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 15:
                            if (a(i5, obj)) {
                                c0Var.a(i12, x3.c(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 16:
                            if (a(i5, obj)) {
                                c0Var.a(i12, x3.d(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 17:
                            if (a(i5, obj)) {
                                c0Var.a(i12, x3.e(obj, i11 & 1048575), c(i5));
                                break;
                            } else {
                                break;
                            }
                        case 18:
                            u2.b(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 19:
                            u2.f(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 20:
                            u2.h(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 21:
                            u2.n(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 22:
                            u2.g(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 23:
                            u2.e(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 24:
                            u2.d(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 25:
                            u2.a(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 26:
                            u2.b(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var);
                            break;
                        case 27:
                            u2.b(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, c(i5));
                            break;
                        case 28:
                            u2.a(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var);
                            break;
                        case 29:
                            u2.m(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 30:
                            u2.c(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 31:
                            u2.i(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 32:
                            u2.j(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 33:
                            u2.k(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 34:
                            u2.l(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, false);
                            break;
                        case 35:
                            u2.b(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 36:
                            u2.f(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 37:
                            u2.h(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 38:
                            u2.n(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 39:
                            u2.g(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 40:
                            u2.e(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 41:
                            u2.d(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 42:
                            u2.a(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 43:
                            u2.m(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 44:
                            u2.c(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 45:
                            u2.i(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 46:
                            u2.j(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 47:
                            u2.k(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 48:
                            u2.l(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, true);
                            break;
                        case 49:
                            u2.a(this.f30819a[i5], (List) x3.e(obj, i11 & 1048575), c0Var, c(i5));
                            break;
                        case 50:
                            if (x3.e(obj, i11 & 1048575) != null) {
                                z1 z1Var = this.f30832p;
                                Object objB = b(i5);
                                z1Var.getClass();
                                objB.getClass();
                                throw new ClassCastException();
                            }
                            break;
                        case 51:
                            if (a(obj, i12, i5)) {
                                c0Var.a(i12, ((Double) x3.e(obj, i11 & 1048575)).doubleValue());
                                break;
                            } else {
                                break;
                            }
                        case 52:
                            if (a(obj, i12, i5)) {
                                c0Var.a(i12, ((Float) x3.e(obj, i11 & 1048575)).floatValue());
                                break;
                            } else {
                                break;
                            }
                        case 53:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.b(i12, ((Long) x3.e(obj, i11 & 1048575)).longValue());
                                break;
                            } else {
                                break;
                            }
                        case 54:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.b(i12, ((Long) x3.e(obj, i11 & 1048575)).longValue());
                                break;
                            } else {
                                break;
                            }
                        case 55:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.b(i12, ((Integer) x3.e(obj, i11 & 1048575)).intValue());
                                break;
                            } else {
                                break;
                            }
                        case 56:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, ((Long) x3.e(obj, i11 & 1048575)).longValue());
                                break;
                            } else {
                                break;
                            }
                        case 57:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, ((Integer) x3.e(obj, i11 & 1048575)).intValue());
                                break;
                            } else {
                                break;
                            }
                        case 58:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, ((Boolean) x3.e(obj, i11 & 1048575)).booleanValue());
                                break;
                            } else {
                                break;
                            }
                        case 59:
                            if (a(obj, i12, i5)) {
                                a(i12, x3.e(obj, i11 & 1048575), c0Var);
                                break;
                            } else {
                                break;
                            }
                        case 60:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, (d2) x3.e(obj, i11 & 1048575), c(i5));
                                break;
                            } else {
                                break;
                            }
                        case 61:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, (s) x3.e(obj, i11 & 1048575));
                                break;
                            } else {
                                break;
                            }
                        case 62:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.d(i12, ((Integer) x3.e(obj, i11 & 1048575)).intValue());
                                break;
                            } else {
                                break;
                            }
                        case 63:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.b(i12, ((Integer) x3.e(obj, i11 & 1048575)).intValue());
                                break;
                            } else {
                                break;
                            }
                        case 64:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, ((Integer) x3.e(obj, i11 & 1048575)).intValue());
                                break;
                            } else {
                                break;
                            }
                        case 65:
                            if (a(obj, i12, i5)) {
                                c0Var.f30775a.a(i12, ((Long) x3.e(obj, i11 & 1048575)).longValue());
                                break;
                            } else {
                                break;
                            }
                        case 66:
                            if (a(obj, i12, i5)) {
                                c0Var.a(i12, ((Integer) x3.e(obj, i11 & 1048575)).intValue());
                                break;
                            } else {
                                break;
                            }
                        case 67:
                            if (a(obj, i12, i5)) {
                                c0Var.a(i12, ((Long) x3.e(obj, i11 & 1048575)).longValue());
                                break;
                            } else {
                                break;
                            }
                        case 68:
                            if (a(obj, i12, i5)) {
                                c0Var.a(i12, x3.e(obj, i11 & 1048575), c(i5));
                                break;
                            } else {
                                break;
                            }
                    }
                }
            }
            switch ((267386880 & i11) >>> 20) {
            }
        }
        while (entry != null) {
            this.o.getClass();
            j0.a(c0Var, entry);
            entry = itD.hasNext() ? (Map.Entry) itD.next() : null;
        }
        this.n.getClass();
        ((z0) obj).unknownFields.a(c0Var);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.t2
    public final void a(Object obj, s2 s2Var, h0 h0Var) throws Throwable {
        h0Var.getClass();
        a(this.n, this.o, obj, s2Var, h0Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:360:?, code lost:
    
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0023  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x0711 A[Catch: all -> 0x0722, TryCatch #3 {all -> 0x0722, blocks: (B:215:0x070c, B:217:0x0711, B:219:0x071a, B:223:0x0725), top: B:243:0x070c }] */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0742  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x074a A[LOOP:3: B:234:0x0746->B:236:0x074a, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:238:0x0757  */
    /* JADX WARN: Removed duplicated region for block: B:277:0x072b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(o3 o3Var, j0 j0Var, Object obj, s2 s2Var, h0 h0Var) throws Throwable {
        o3 o3Var2;
        Object obj2;
        i2 i2Var;
        int i5;
        int iS;
        int i11;
        x0 x0VarA;
        s2 s2Var2;
        h0 h0Var2;
        s2 s2Var3;
        Object objA;
        i2 i2Var2 = this;
        Object obj3 = obj;
        h0 h0Var3 = h0Var;
        Object objB = null;
        n0 n0VarEnsureExtensionsAreMutable = null;
        while (true) {
            try {
                iS = s2Var.s();
            } catch (Throwable th2) {
                th = th2;
                o3Var2 = o3Var;
            }
            if (iS >= i2Var2.f30821c) {
                try {
                    int iA = iS <= i2Var2.f30822d ? i2Var2.a(iS, 0) : -1;
                    i11 = iA;
                } catch (Throwable th3) {
                    th = th3;
                    o3Var2 = o3Var;
                }
                if (i11 >= 0) {
                    o3Var2 = o3Var;
                    Object obj4 = objB;
                    try {
                        int i12 = i2Var2.f30819a[i11 + 1];
                        switch ((267386880 & i12) >>> 20) {
                            case 0:
                                s2Var2 = s2Var;
                                h0Var2 = h0Var3;
                                i2Var = i2Var2;
                                try {
                                } catch (m1 unused) {
                                    obj2 = obj;
                                } catch (Throwable th4) {
                                    th = th4;
                                    obj2 = obj;
                                }
                                try {
                                    x3.f30955c.a(obj, d(i12), s2Var2.h());
                                    obj2 = obj;
                                    i2Var.b(i11, obj2);
                                    i2Var2 = i2Var;
                                    objB = obj4;
                                } catch (m1 unused2) {
                                    obj2 = obj;
                                    objB = obj4;
                                    try {
                                        o3Var2.getClass();
                                        if (objB == null) {
                                        }
                                        if (o3.a(objB, s2Var2)) {
                                        }
                                    } catch (Throwable th5) {
                                        th = th5;
                                    }
                                } catch (Throwable th6) {
                                    th = th6;
                                    obj2 = obj;
                                    objB = obj4;
                                    while (i5 < i2Var.f30829k) {
                                    }
                                    if (objB != null) {
                                    }
                                    throw th;
                                }
                                h0Var3 = h0Var2;
                                break;
                            case 1:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.f30955c.a(obj2, d(i12), s2Var.k());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 2:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.o());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 3:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.f());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 4:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.d());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 5:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.g());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 6:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.q());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 7:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.f30955c.a(obj2, d(i12), s2Var.r());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 8:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                if ((i12 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0) {
                                    x3.a(i12 & 1048575, obj2, s2Var.p());
                                } else if (i2Var.f30825g) {
                                    x3.a(i12 & 1048575, obj2, s2Var.n());
                                } else {
                                    x3.a(i12 & 1048575, obj2, s2Var.a());
                                }
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 9:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                if (i2Var.a(i11, obj2)) {
                                    x3.a(d(i12), obj2, l1.a(x3.e(obj2, d(i12)), s2Var.b(i2Var.c(i11), h0Var2)));
                                } else {
                                    x3.a(d(i12), obj2, s2Var.b(i2Var.c(i11), h0Var2));
                                    i2Var.b(i11, obj2);
                                }
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 10:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(d(i12), obj2, s2Var.a());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 11:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.c());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 12:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                int iB = s2Var.b();
                                i2Var.a(i11);
                                x3.a(obj2, d(i12), iB);
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 13:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.m());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 14:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.t());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 15:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.j());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 16:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                x3.a(obj2, d(i12), s2Var.l());
                                i2Var.b(i11, obj2);
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 17:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                if (i2Var.a(i11, obj2)) {
                                    x3.a(d(i12), obj2, l1.a(x3.e(obj2, d(i12)), s2Var.a(i2Var.c(i11), h0Var2)));
                                } else {
                                    x3.a(d(i12), obj2, s2Var.a(i2Var.c(i11), h0Var2));
                                    i2Var.b(i11, obj2);
                                }
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 18:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.j(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 19:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.d(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 20:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.k(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 21:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.a(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 22:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.o(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 23:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.n(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 24:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.e(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 25:
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                s2Var.l(i2Var.f30831m.b(obj2, d(i12)));
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 26:
                                s2Var2 = s2Var;
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                try {
                                    i2Var.a(obj2, i12, s2Var2);
                                    i2Var2 = i2Var;
                                    objB = obj4;
                                } catch (m1 unused3) {
                                    objB = obj4;
                                    o3Var2.getClass();
                                    if (objB == null) {
                                    }
                                    if (o3.a(objB, s2Var2)) {
                                    }
                                } catch (Throwable th7) {
                                    th = th7;
                                    objB = obj4;
                                    while (i5 < i2Var.f30829k) {
                                    }
                                    if (objB != null) {
                                    }
                                    throw th;
                                }
                                h0Var3 = h0Var2;
                                break;
                            case 27:
                                obj2 = obj3;
                                try {
                                    i2Var2.a(obj2, i12, s2Var, i2Var2.c(i11), h0Var);
                                    i2Var = i2Var2;
                                    h0Var2 = h0Var;
                                    i2Var2 = i2Var;
                                    objB = obj4;
                                } catch (m1 unused4) {
                                    i2Var = i2Var2;
                                    s2Var2 = s2Var;
                                    h0Var2 = h0Var;
                                    objB = obj4;
                                    o3Var2.getClass();
                                    if (objB == null) {
                                    }
                                    if (o3.a(objB, s2Var2)) {
                                    }
                                }
                                h0Var3 = h0Var2;
                                break;
                            case 28:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.h(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 29:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.i(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 30:
                                obj2 = obj3;
                                List listB = i2Var2.f30831m.b(obj2, d(i12));
                                s2Var.p(listB);
                                i2Var2.a(i11);
                                objA = u2.a(iS, listB, obj4, o3Var2);
                                objB = objA;
                                h0Var3 = h0Var;
                                break;
                            case 31:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.f(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 32:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.m(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 33:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.c(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 34:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.g(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 35:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.j(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 36:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.d(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 37:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.k(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 38:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.a(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 39:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.o(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 40:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.n(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 41:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.e(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 42:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.l(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 43:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.i(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 44:
                                obj2 = obj3;
                                List listB2 = i2Var2.f30831m.b(obj2, d(i12));
                                s2Var.p(listB2);
                                i2Var2.a(i11);
                                objA = u2.a(iS, listB2, obj4, o3Var2);
                                objB = objA;
                                h0Var3 = h0Var;
                                break;
                            case 45:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.f(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 46:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.m(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 47:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                s2Var3.c(i2Var2.f30831m.b(obj2, d(i12)));
                                h0Var2 = h0Var;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 48:
                                s2Var3 = s2Var;
                                obj2 = obj3;
                                try {
                                    s2Var3.g(i2Var2.f30831m.b(obj2, d(i12)));
                                    h0Var2 = h0Var;
                                    i2Var = i2Var2;
                                    i2Var2 = i2Var;
                                    objB = obj4;
                                } catch (m1 unused5) {
                                    h0Var2 = h0Var;
                                    i2Var = i2Var2;
                                    s2Var2 = s2Var3;
                                    objB = obj4;
                                    o3Var2.getClass();
                                    if (objB == null) {
                                    }
                                    if (o3.a(objB, s2Var2)) {
                                    }
                                }
                                h0Var3 = h0Var2;
                                break;
                            case 49:
                                try {
                                    obj2 = obj3;
                                } catch (m1 unused6) {
                                    h0Var2 = h0Var;
                                    s2Var2 = s2Var;
                                    obj2 = obj3;
                                    i2Var = i2Var2;
                                    objB = obj4;
                                    o3Var2.getClass();
                                    if (objB == null) {
                                    }
                                    if (o3.a(objB, s2Var2)) {
                                    }
                                }
                                try {
                                    try {
                                        i2Var2.a(obj2, d(i12), s2Var, i2Var2.c(i11), h0Var);
                                        s2Var3 = s2Var;
                                        h0Var2 = h0Var;
                                        i2Var = i2Var2;
                                        i2Var2 = i2Var;
                                        objB = obj4;
                                    } catch (m1 unused7) {
                                        h0Var2 = h0Var;
                                        i2Var = i2Var2;
                                        s2Var2 = s2Var;
                                        objB = obj4;
                                        o3Var2.getClass();
                                        if (objB == null) {
                                        }
                                        if (o3.a(objB, s2Var2)) {
                                        }
                                    }
                                    h0Var3 = h0Var2;
                                    break;
                                } catch (Throwable th8) {
                                    th = th8;
                                    i2Var = i2Var2;
                                    objB = obj4;
                                    while (i5 < i2Var.f30829k) {
                                    }
                                    if (objB != null) {
                                    }
                                    throw th;
                                }
                            case 50:
                                i2Var2.c(i11, obj3, i2Var2.b(i11));
                                throw null;
                                break;
                            case 51:
                                x3.a(d(i12), obj3, Double.valueOf(s2Var.h()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 52:
                                x3.a(d(i12), obj3, Float.valueOf(s2Var.k()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 53:
                                x3.a(d(i12), obj3, Long.valueOf(s2Var.o()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 54:
                                x3.a(d(i12), obj3, Long.valueOf(s2Var.f()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 55:
                                x3.a(d(i12), obj3, Integer.valueOf(s2Var.d()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 56:
                                x3.a(d(i12), obj3, Long.valueOf(s2Var.g()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 57:
                                x3.a(d(i12), obj3, Integer.valueOf(s2Var.q()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 58:
                                x3.a(d(i12), obj3, Boolean.valueOf(s2Var.r()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 59:
                                if ((i12 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0) {
                                    x3.a(i12 & 1048575, obj3, s2Var.p());
                                } else if (i2Var2.f30825g) {
                                    x3.a(i12 & 1048575, obj3, s2Var.n());
                                } else {
                                    x3.a(i12 & 1048575, obj3, s2Var.a());
                                }
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 60:
                                if (i2Var2.a(obj3, iS, i11)) {
                                    x3.a(d(i12), obj3, l1.a(x3.e(obj3, d(i12)), s2Var.b(i2Var2.c(i11), h0Var3)));
                                } else {
                                    x3.a(d(i12), obj3, s2Var.b(i2Var2.c(i11), h0Var3));
                                    i2Var2.b(i11, obj3);
                                }
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 61:
                                x3.a(d(i12), obj3, s2Var.a());
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 62:
                                x3.a(d(i12), obj3, Integer.valueOf(s2Var.c()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 63:
                                int iB2 = s2Var.b();
                                i2Var2.a(i11);
                                x3.a(d(i12), obj3, Integer.valueOf(iB2));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 64:
                                x3.a(d(i12), obj3, Integer.valueOf(s2Var.m()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 65:
                                x3.a(d(i12), obj3, Long.valueOf(s2Var.t()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 66:
                                x3.a(d(i12), obj3, Integer.valueOf(s2Var.j()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 67:
                                x3.a(d(i12), obj3, Long.valueOf(s2Var.l()));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            case 68:
                                x3.a(d(i12), obj3, s2Var.a(i2Var2.c(i11), h0Var3));
                                i2Var2.b(obj3, iS, i11);
                                h0Var2 = h0Var3;
                                obj2 = obj3;
                                i2Var = i2Var2;
                                i2Var2 = i2Var;
                                objB = obj4;
                                h0Var3 = h0Var2;
                                break;
                            default:
                                if (obj4 == null) {
                                    try {
                                        o3Var2.getClass();
                                        objB = new n3();
                                    } catch (m1 unused8) {
                                        s2Var2 = s2Var;
                                        h0Var2 = h0Var3;
                                        obj2 = obj3;
                                        i2Var = i2Var2;
                                        objB = obj4;
                                        o3Var2.getClass();
                                        if (objB == null) {
                                            z0 z0Var = (z0) obj2;
                                            n3 n3Var = z0Var.unknownFields;
                                            if (n3Var == n3.f30860f) {
                                                n3Var = new n3();
                                                z0Var.unknownFields = n3Var;
                                            }
                                            objB = n3Var;
                                        }
                                        if (o3.a(objB, s2Var2)) {
                                            for (int i13 = i2Var.f30828j; i13 < i2Var.f30829k; i13++) {
                                                objB = i2Var.b(i2Var.f30827i[i13], obj2, objB);
                                            }
                                            if (objB != null) {
                                                o3.a(obj2, objB);
                                                return;
                                            }
                                            return;
                                        }
                                        i2Var2 = i2Var;
                                        h0Var3 = h0Var2;
                                        obj3 = obj2;
                                    }
                                } else {
                                    objB = obj4;
                                }
                                try {
                                    o3Var2.getClass();
                                } catch (m1 unused9) {
                                    s2Var2 = s2Var;
                                    h0Var2 = h0Var3;
                                    obj2 = obj3;
                                    i2Var = i2Var2;
                                    o3Var2.getClass();
                                    if (objB == null) {
                                    }
                                    if (o3.a(objB, s2Var2)) {
                                    }
                                }
                                if (!o3.a(objB, s2Var)) {
                                    for (int i14 = i2Var2.f30828j; i14 < i2Var2.f30829k; i14++) {
                                        objB = i2Var2.b(i2Var2.f30827i[i14], obj3, objB);
                                    }
                                    if (objB != null) {
                                        o3.a(obj3, objB);
                                        break;
                                    }
                                }
                                break;
                        }
                    } catch (Throwable th9) {
                        th = th9;
                        obj2 = obj3;
                    }
                } else if (iS == Integer.MAX_VALUE) {
                    for (int i15 = i2Var2.f30828j; i15 < i2Var2.f30829k; i15++) {
                        objB = i2Var2.b(i2Var2.f30827i[i15], obj3, objB);
                    }
                    if (objB != null) {
                        o3Var.getClass();
                        o3.a(obj3, objB);
                    }
                } else {
                    if (i2Var2.f30824f) {
                        d2 d2Var = i2Var2.f30823e;
                        j0Var.getClass();
                        x0VarA = h0Var3.a(iS, d2Var);
                    } else {
                        x0VarA = null;
                    }
                    if (x0VarA != null) {
                        if (n0VarEnsureExtensionsAreMutable == null) {
                            j0Var.getClass();
                            n0VarEnsureExtensionsAreMutable = ((GeneratedMessageLite$ExtendableMessage) obj3).ensureExtensionsAreMutable();
                        }
                        n0 n0Var = n0VarEnsureExtensionsAreMutable;
                        j0Var.getClass();
                        try {
                            objB = j0.a(s2Var, x0VarA, h0Var3, n0Var, objB, o3Var);
                            n0VarEnsureExtensionsAreMutable = n0Var;
                            obj2 = obj3;
                            h0Var3 = h0Var;
                        } catch (Throwable th10) {
                            th = th10;
                            o3Var2 = o3Var;
                        }
                    } else {
                        o3Var2 = o3Var;
                        Object obj5 = objB;
                        try {
                            o3Var2.getClass();
                            if (obj5 == null) {
                                z0 z0Var2 = (z0) obj3;
                                n3 n3Var2 = z0Var2.unknownFields;
                                if (n3Var2 == n3.f30860f) {
                                    n3Var2 = new n3();
                                    z0Var2.unknownFields = n3Var2;
                                }
                                objB = n3Var2;
                            } else {
                                objB = obj5;
                            }
                            try {
                                if (!o3.a(objB, s2Var)) {
                                    for (int i16 = i2Var2.f30828j; i16 < i2Var2.f30829k; i16++) {
                                        objB = i2Var2.b(i2Var2.f30827i[i16], obj3, objB);
                                    }
                                    if (objB != null) {
                                        o3.a(obj3, objB);
                                    }
                                }
                            } catch (Throwable th11) {
                                th = th11;
                            }
                        } catch (Throwable th12) {
                            th = th12;
                            obj2 = obj3;
                            objB = obj5;
                        }
                    }
                    obj2 = obj3;
                    i2Var = i2Var2;
                }
                obj3 = obj2;
            }
            for (i5 = i2Var.f30828j; i5 < i2Var.f30829k; i5++) {
                objB = i2Var.b(i2Var.f30827i[i5], obj2, objB);
            }
            if (objB != null) {
                o3Var2.getClass();
                o3.a(obj2, objB);
            }
            throw th;
        }
    }

    public final Object b(int i5) {
        return this.f30820b[(i5 / 3) * 2];
    }

    public final Object b(int i5, Object obj, Object obj2) {
        int i11 = this.f30819a[i5];
        if (x3.e(obj, r0[i5 + 1] & 1048575) == null) {
            return obj2;
        }
        a(i5);
        return obj2;
    }

    public final void b(int i5, Object obj) {
        int i11 = this.f30819a[i5 + 2];
        long j11 = 1048575 & i11;
        if (j11 == 1048575) {
            return;
        }
        x3.a(obj, j11, (1 << (i11 >>> 20)) | x3.c(obj, j11));
    }

    public final void b(Object obj, int i5, int i11) {
        x3.a(obj, this.f30819a[i11 + 2] & 1048575, i5);
    }

    public final int a(Object obj, byte[] bArr, int i5, int i11, int i12, int i13, int i14, long j11, int i15, long j12, f fVar) throws n1 {
        int iA;
        int iA2;
        int iA3;
        int i16;
        int i17;
        int iC;
        Unsafe unsafe = f30818r;
        k1 k1VarB = (k1) unsafe.getObject(obj, j12);
        if (!((c) k1VarB).f30774a) {
            int size = k1VarB.size();
            k1VarB = k1VarB.b(size == 0 ? 10 : size * 2);
            unsafe.putObject(obj, j12, k1VarB);
        }
        k1 k1Var = k1VarB;
        switch (i15) {
            case 18:
            case 35:
                if (i13 == 2) {
                    d0 d0Var = (d0) k1Var;
                    int iD = g.d(bArr, i5, fVar);
                    int i18 = fVar.f30797a + iD;
                    while (iD < i18) {
                        d0Var.a(Double.longBitsToDouble(g.b(iD, bArr)));
                        iD += 8;
                    }
                    if (iD == i18) {
                        return iD;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 != 1) {
                    return i5;
                }
                d0 d0Var2 = (d0) k1Var;
                d0Var2.a(Double.longBitsToDouble(g.b(i5, bArr)));
                int i19 = i5 + 8;
                while (i19 < i11) {
                    int iA4 = i19 + 1;
                    byte b11 = bArr[i19];
                    if (b11 >= 0) {
                        fVar.f30797a = b11;
                    } else {
                        iA4 = g.a(b11, bArr, iA4, fVar);
                    }
                    if (i12 != fVar.f30797a) {
                        return i19;
                    }
                    d0Var2.a(Double.longBitsToDouble(g.b(iA4, bArr)));
                    i19 = iA4 + 8;
                }
                return i19;
            case 19:
            case 36:
                if (i13 == 2) {
                    q0 q0Var = (q0) k1Var;
                    int iD2 = g.d(bArr, i5, fVar);
                    int i21 = fVar.f30797a + iD2;
                    while (iD2 < i21) {
                        q0Var.a(Float.intBitsToFloat(g.a(iD2, bArr)));
                        iD2 += 4;
                    }
                    if (iD2 == i21) {
                        return iD2;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 != 5) {
                    return i5;
                }
                q0 q0Var2 = (q0) k1Var;
                q0Var2.a(Float.intBitsToFloat(g.a(i5, bArr)));
                for (int i22 = i5 + 4; i22 < i11; i22 = iA + 4) {
                    iA = i22 + 1;
                    byte b12 = bArr[i22];
                    if (b12 >= 0) {
                        fVar.f30797a = b12;
                    } else {
                        iA = g.a(b12, bArr, iA, fVar);
                    }
                    if (i12 != fVar.f30797a) {
                        return i22;
                    }
                    q0Var2.a(Float.intBitsToFloat(g.a(iA, bArr)));
                }
                return i22;
            case 20:
            case 21:
            case 37:
            case 38:
                if (i13 == 2) {
                    u1 u1Var = (u1) k1Var;
                    int iD3 = g.d(bArr, i5, fVar);
                    int i23 = fVar.f30797a + iD3;
                    while (iD3 < i23) {
                        iD3 = g.e(bArr, iD3, fVar);
                        u1Var.a(fVar.f30798b);
                    }
                    if (iD3 == i23) {
                        return iD3;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 != 0) {
                    return i5;
                }
                u1 u1Var2 = (u1) k1Var;
                int iE = g.e(bArr, i5, fVar);
                u1Var2.a(fVar.f30798b);
                while (iE < i11) {
                    int iA5 = iE + 1;
                    byte b13 = bArr[iE];
                    if (b13 >= 0) {
                        fVar.f30797a = b13;
                    } else {
                        iA5 = g.a(b13, bArr, iA5, fVar);
                    }
                    if (i12 != fVar.f30797a) {
                        return iE;
                    }
                    iE = g.e(bArr, iA5, fVar);
                    u1Var2.a(fVar.f30798b);
                }
                return iE;
            case 22:
            case 29:
            case 39:
            case 43:
                if (i13 == 2) {
                    return g.a(bArr, i5, k1Var, fVar);
                }
                return i13 == 0 ? g.c(i12, bArr, i5, i11, k1Var, fVar) : i5;
            case 23:
            case 32:
            case 40:
            case 46:
                if (i13 == 2) {
                    u1 u1Var3 = (u1) k1Var;
                    int iD4 = g.d(bArr, i5, fVar);
                    int i24 = fVar.f30797a + iD4;
                    while (iD4 < i24) {
                        u1Var3.a(g.b(iD4, bArr));
                        iD4 += 8;
                    }
                    if (iD4 == i24) {
                        return iD4;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 != 1) {
                    return i5;
                }
                u1 u1Var4 = (u1) k1Var;
                u1Var4.a(g.b(i5, bArr));
                for (int i25 = i5 + 8; i25 < i11; i25 = iA2 + 8) {
                    iA2 = i25 + 1;
                    byte b14 = bArr[i25];
                    if (b14 >= 0) {
                        fVar.f30797a = b14;
                    } else {
                        iA2 = g.a(b14, bArr, iA2, fVar);
                    }
                    if (i12 != fVar.f30797a) {
                        return i25;
                    }
                    u1Var4.a(g.b(iA2, bArr));
                }
                return i25;
            case 24:
            case 31:
            case 41:
            case 45:
                if (i13 == 2) {
                    a1 a1Var = (a1) k1Var;
                    int iD5 = g.d(bArr, i5, fVar);
                    int i26 = fVar.f30797a + iD5;
                    while (iD5 < i26) {
                        a1Var.c(g.a(iD5, bArr));
                        iD5 += 4;
                    }
                    if (iD5 == i26) {
                        return iD5;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 != 5) {
                    return i5;
                }
                a1 a1Var2 = (a1) k1Var;
                a1Var2.c(g.a(i5, bArr));
                for (int i27 = i5 + 4; i27 < i11; i27 = iA3 + 4) {
                    iA3 = i27 + 1;
                    byte b15 = bArr[i27];
                    if (b15 >= 0) {
                        fVar.f30797a = b15;
                    } else {
                        iA3 = g.a(b15, bArr, iA3, fVar);
                    }
                    if (i12 != fVar.f30797a) {
                        return i27;
                    }
                    a1Var2.c(g.a(iA3, bArr));
                }
                return i27;
            case 25:
            case 42:
                if (i13 == 2) {
                    j jVar = (j) k1Var;
                    int iD6 = g.d(bArr, i5, fVar);
                    int i28 = fVar.f30797a + iD6;
                    while (iD6 < i28) {
                        iD6 = g.e(bArr, iD6, fVar);
                        jVar.a(fVar.f30798b != 0);
                    }
                    if (iD6 == i28) {
                        return iD6;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 != 0) {
                    return i5;
                }
                j jVar2 = (j) k1Var;
                int iE2 = g.e(bArr, i5, fVar);
                jVar2.a(fVar.f30798b != 0);
                while (iE2 < i11) {
                    int iA6 = iE2 + 1;
                    byte b16 = bArr[iE2];
                    if (b16 >= 0) {
                        fVar.f30797a = b16;
                    } else {
                        iA6 = g.a(b16, bArr, iA6, fVar);
                    }
                    if (i12 != fVar.f30797a) {
                        return iE2;
                    }
                    iE2 = g.e(bArr, iA6, fVar);
                    jVar2.a(fVar.f30798b != 0);
                }
                return iE2;
            case 26:
                i16 = i5;
                if (i13 == 2) {
                    if ((j11 & 536870912) == 0) {
                        return g.a(i12, bArr, i16, i11, k1Var, fVar);
                    }
                    return g.b(i12, bArr, i16, i11, k1Var, fVar);
                }
                return i16;
            case 27:
                i16 = i5;
                if (i13 == 2) {
                    t2 t2VarC = c(i14);
                    int iA7 = g.a(t2VarC, bArr, i16, i11, fVar);
                    k1Var.add(fVar.f30799c);
                    while (iA7 < i11) {
                        int iA8 = iA7 + 1;
                        byte b17 = bArr[iA7];
                        if (b17 >= 0) {
                            fVar.f30797a = b17;
                        } else {
                            iA8 = g.a(b17, bArr, iA8, fVar);
                        }
                        if (i12 != fVar.f30797a) {
                            return iA7;
                        }
                        iA7 = g.a(t2VarC, bArr, iA8, i11, fVar);
                        k1Var.add(fVar.f30799c);
                    }
                    return iA7;
                }
                return i16;
            case 28:
                i16 = i5;
                if (i13 == 2) {
                    int iD7 = g.d(bArr, i16, fVar);
                    int i29 = fVar.f30797a;
                    if (i29 >= 0) {
                        if (i29 > bArr.length - iD7) {
                            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                        }
                        if (i29 == 0) {
                            k1Var.add(s.f30889b);
                        } else {
                            int i31 = iD7 + i29;
                            s.a(iD7, i31, bArr.length);
                            k1Var.add(new q(s.f30890c.a(bArr, iD7, i29)));
                            iD7 = i31;
                        }
                        while (iD7 < i11) {
                            int iA9 = iD7 + 1;
                            byte b18 = bArr[iD7];
                            if (b18 >= 0) {
                                fVar.f30797a = b18;
                            } else {
                                iA9 = g.a(b18, bArr, iA9, fVar);
                            }
                            if (i12 != fVar.f30797a) {
                                return iD7;
                            }
                            iD7 = iA9 + 1;
                            byte b19 = bArr[iA9];
                            if (b19 >= 0) {
                                fVar.f30797a = b19;
                            } else {
                                iD7 = g.a(b19, bArr, iD7, fVar);
                            }
                            int i32 = fVar.f30797a;
                            if (i32 >= 0) {
                                if (i32 > bArr.length - iD7) {
                                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                }
                                if (i32 == 0) {
                                    k1Var.add(s.f30889b);
                                } else {
                                    int i33 = iD7 + i32;
                                    s.a(iD7, i33, bArr.length);
                                    k1Var.add(new q(s.f30890c.a(bArr, iD7, i32)));
                                    iD7 = i33;
                                }
                            } else {
                                throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                            }
                        }
                        return iD7;
                    }
                    throw new n1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
                }
                return i16;
            case 30:
            case 44:
                i17 = i5;
                if (i13 != 2) {
                    if (i13 == 0) {
                        iC = g.c(i12, bArr, i17, i11, k1Var, fVar);
                    }
                    return i17;
                }
                iC = g.a(bArr, i17, k1Var, fVar);
                z0 z0Var = (z0) obj;
                n3 n3Var = z0Var.unknownFields;
                if (n3Var == n3.f30860f) {
                    n3Var = null;
                }
                a(i14);
                Class cls = u2.f30916a;
                if (n3Var != null) {
                    z0Var.unknownFields = n3Var;
                }
                return iC;
            case 33:
            case 47:
                i17 = i5;
                if (i13 == 2) {
                    a1 a1Var3 = (a1) k1Var;
                    int iD8 = g.d(bArr, i17, fVar);
                    int i34 = fVar.f30797a + iD8;
                    while (iD8 < i34) {
                        int i35 = iD8 + 1;
                        byte b21 = bArr[iD8];
                        if (b21 >= 0) {
                            fVar.f30797a = b21;
                            iD8 = i35;
                        } else {
                            iD8 = g.a(b21, bArr, i35, fVar);
                        }
                        a1Var3.c(w.b(fVar.f30797a));
                    }
                    if (iD8 == i34) {
                        return iD8;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 == 0) {
                    a1 a1Var4 = (a1) k1Var;
                    int iD9 = g.d(bArr, i17, fVar);
                    a1Var4.c(w.b(fVar.f30797a));
                    while (iD9 < i11) {
                        int iA10 = iD9 + 1;
                        byte b22 = bArr[iD9];
                        if (b22 >= 0) {
                            fVar.f30797a = b22;
                        } else {
                            iA10 = g.a(b22, bArr, iA10, fVar);
                        }
                        if (i12 != fVar.f30797a) {
                            return iD9;
                        }
                        iD9 = iA10 + 1;
                        byte b23 = bArr[iA10];
                        if (b23 >= 0) {
                            fVar.f30797a = b23;
                        } else {
                            iD9 = g.a(b23, bArr, iD9, fVar);
                        }
                        a1Var4.c(w.b(fVar.f30797a));
                    }
                    return iD9;
                }
                return i17;
            case 34:
            case 48:
                i17 = i5;
                if (i13 == 2) {
                    u1 u1Var5 = (u1) k1Var;
                    int iD10 = g.d(bArr, i17, fVar);
                    int i36 = fVar.f30797a + iD10;
                    while (iD10 < i36) {
                        iD10 = g.e(bArr, iD10, fVar);
                        u1Var5.a(w.a(fVar.f30798b));
                    }
                    if (iD10 == i36) {
                        return iD10;
                    }
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                if (i13 == 0) {
                    u1 u1Var6 = (u1) k1Var;
                    int iE3 = g.e(bArr, i17, fVar);
                    u1Var6.a(w.a(fVar.f30798b));
                    while (iE3 < i11) {
                        int iA11 = iE3 + 1;
                        byte b24 = bArr[iE3];
                        if (b24 >= 0) {
                            fVar.f30797a = b24;
                        } else {
                            iA11 = g.a(b24, bArr, iA11, fVar);
                        }
                        if (i12 != fVar.f30797a) {
                            return iE3;
                        }
                        iE3 = g.e(bArr, iA11, fVar);
                        u1Var6.a(w.a(fVar.f30798b));
                    }
                    return iE3;
                }
                return i17;
            case 49:
                if (i13 == 3) {
                    t2 t2VarC2 = c(i14);
                    int i37 = (i12 & (-8)) | 4;
                    int iA12 = g.a(t2VarC2, bArr, i5, i11, i37, fVar);
                    t2 t2Var = t2VarC2;
                    int i38 = i11;
                    f fVar2 = fVar;
                    k1Var.add(fVar2.f30799c);
                    while (iA12 < i38) {
                        int iD11 = g.d(bArr, iA12, fVar2);
                        if (i12 != fVar2.f30797a) {
                            return iA12;
                        }
                        t2 t2Var2 = t2Var;
                        int i39 = i38;
                        f fVar3 = fVar2;
                        iA12 = g.a(t2Var2, bArr, iD11, i39, i37, fVar3);
                        k1Var.add(fVar3.f30799c);
                        t2Var = t2Var2;
                        i38 = i39;
                        fVar2 = fVar3;
                    }
                    return iA12;
                }
            default:
                return i5;
        }
    }

    public final int a(Object obj, byte[] bArr, int i5, int i11, int i12, int i13, int i14, int i15, int i16, long j11, int i17, f fVar) throws n1 {
        Object object;
        Unsafe unsafe = f30818r;
        long j12 = this.f30819a[i17 + 2] & 1048575;
        switch (i16) {
            case 51:
                if (i14 != 1) {
                    return i5;
                }
                unsafe.putObject(obj, j11, Double.valueOf(Double.longBitsToDouble(g.b(i5, bArr))));
                int i18 = i5 + 8;
                unsafe.putInt(obj, j12, i13);
                return i18;
            case 52:
                if (i14 != 5) {
                    return i5;
                }
                unsafe.putObject(obj, j11, Float.valueOf(Float.intBitsToFloat(g.a(i5, bArr))));
                int i19 = i5 + 4;
                unsafe.putInt(obj, j12, i13);
                return i19;
            case 53:
            case 54:
                if (i14 != 0) {
                    return i5;
                }
                int iE = g.e(bArr, i5, fVar);
                unsafe.putObject(obj, j11, Long.valueOf(fVar.f30798b));
                unsafe.putInt(obj, j12, i13);
                return iE;
            case 55:
            case 62:
                if (i14 != 0) {
                    return i5;
                }
                int iD = g.d(bArr, i5, fVar);
                unsafe.putObject(obj, j11, Integer.valueOf(fVar.f30797a));
                unsafe.putInt(obj, j12, i13);
                return iD;
            case 56:
            case 65:
                if (i14 != 1) {
                    return i5;
                }
                unsafe.putObject(obj, j11, Long.valueOf(g.b(i5, bArr)));
                int i21 = i5 + 8;
                unsafe.putInt(obj, j12, i13);
                return i21;
            case 57:
            case 64:
                if (i14 != 5) {
                    return i5;
                }
                unsafe.putObject(obj, j11, Integer.valueOf(g.a(i5, bArr)));
                int i22 = i5 + 4;
                unsafe.putInt(obj, j12, i13);
                return i22;
            case 58:
                if (i14 != 0) {
                    return i5;
                }
                int iE2 = g.e(bArr, i5, fVar);
                unsafe.putObject(obj, j11, Boolean.valueOf(fVar.f30798b != 0));
                unsafe.putInt(obj, j12, i13);
                return iE2;
            case 59:
                if (i14 != 2) {
                    return i5;
                }
                int iD2 = g.d(bArr, i5, fVar);
                int i23 = fVar.f30797a;
                if (i23 == 0) {
                    unsafe.putObject(obj, j11, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                } else {
                    if ((i15 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0) {
                        if (!d4.f30786a.b(bArr, iD2, iD2 + i23)) {
                            throw new n1("Protocol message had invalid UTF-8.");
                        }
                    }
                    unsafe.putObject(obj, j11, new String(bArr, iD2, i23, l1.f30847a));
                    iD2 += i23;
                }
                unsafe.putInt(obj, j12, i13);
                return iD2;
            case 60:
                if (i14 != 2) {
                    return i5;
                }
                int iA = g.a(c(i17), bArr, i5, i11, fVar);
                object = unsafe.getInt(obj, j12) == i13 ? unsafe.getObject(obj, j11) : null;
                if (object == null) {
                    unsafe.putObject(obj, j11, fVar.f30799c);
                } else {
                    unsafe.putObject(obj, j11, l1.a(object, fVar.f30799c));
                }
                unsafe.putInt(obj, j12, i13);
                return iA;
            case 61:
                if (i14 != 2) {
                    return i5;
                }
                int iA2 = g.a(bArr, i5, fVar);
                unsafe.putObject(obj, j11, fVar.f30799c);
                unsafe.putInt(obj, j12, i13);
                return iA2;
            case 63:
                if (i14 != 0) {
                    return i5;
                }
                int iD3 = g.d(bArr, i5, fVar);
                int i24 = fVar.f30797a;
                a(i17);
                unsafe.putObject(obj, j11, Integer.valueOf(i24));
                unsafe.putInt(obj, j12, i13);
                return iD3;
            case 66:
                if (i14 != 0) {
                    return i5;
                }
                int iD4 = g.d(bArr, i5, fVar);
                unsafe.putObject(obj, j11, Integer.valueOf(w.b(fVar.f30797a)));
                unsafe.putInt(obj, j12, i13);
                return iD4;
            case 67:
                if (i14 != 0) {
                    return i5;
                }
                int iE3 = g.e(bArr, i5, fVar);
                unsafe.putObject(obj, j11, Long.valueOf(w.a(fVar.f30798b)));
                unsafe.putInt(obj, j12, i13);
                return iE3;
            case 68:
                if (i14 == 3) {
                    int iA3 = g.a(c(i17), bArr, i5, i11, (i12 & (-8)) | 4, fVar);
                    object = unsafe.getInt(obj, j12) == i13 ? unsafe.getObject(obj, j11) : null;
                    if (object == null) {
                        unsafe.putObject(obj, j11, fVar.f30799c);
                    } else {
                        unsafe.putObject(obj, j11, l1.a(object, fVar.f30799c));
                    }
                    unsafe.putInt(obj, j12, i13);
                    return iA3;
                }
                break;
        }
        return i5;
    }

    public final void a(int i5) {
        if (this.f30820b[u4.b(i5, 3, 2, 1)] != null) {
            throw new ClassCastException();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:175:0x0477, code lost:
    
        r0 = r24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:324:0x0835, code lost:
    
        if (r0 == 1048575) goto L326;
     */
    /* JADX WARN: Code restructure failed: missing block: B:325:0x0837, code lost:
    
        r18.putInt(r9, r0, r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:326:0x083d, code lost:
    
        r0 = r8.f30828j;
        r1 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:328:0x0843, code lost:
    
        if (r0 >= r8.f30829k) goto L367;
     */
    /* JADX WARN: Code restructure failed: missing block: B:329:0x0845, code lost:
    
        r1 = (com.fyber.inneractive.sdk.protobuf.n3) r8.b(r8.f30827i[r0], r9, r1);
        r0 = r0 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:330:0x0852, code lost:
    
        if (r1 == null) goto L332;
     */
    /* JADX WARN: Code restructure failed: missing block: B:331:0x0854, code lost:
    
        r8.n.getClass();
        ((com.fyber.inneractive.sdk.protobuf.z0) r9).unknownFields = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:333:0x0860, code lost:
    
        if (r35 != 0) goto L338;
     */
    /* JADX WARN: Code restructure failed: missing block: B:334:0x0862, code lost:
    
        if (r4 != r3) goto L336;
     */
    /* JADX WARN: Code restructure failed: missing block: B:337:0x086a, code lost:
    
        throw new com.fyber.inneractive.sdk.protobuf.n1("Failed to parse the message.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:338:0x086b, code lost:
    
        if (r4 > r3) goto L341;
     */
    /* JADX WARN: Code restructure failed: missing block: B:339:0x086d, code lost:
    
        if (r13 != r35) goto L341;
     */
    /* JADX WARN: Code restructure failed: missing block: B:340:0x086f, code lost:
    
        return r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:342:0x0875, code lost:
    
        throw new com.fyber.inneractive.sdk.protobuf.n1("Failed to parse the message.");
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:307:0x07c8  */
    /* JADX WARN: Removed duplicated region for block: B:308:0x07cc  */
    /* JADX WARN: Removed duplicated region for block: B:318:0x07f8  */
    /* JADX WARN: Removed duplicated region for block: B:320:0x0808  */
    /* JADX WARN: Removed duplicated region for block: B:358:0x0055 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(Object obj, byte[] bArr, int i5, int i11, int i12, f fVar) throws n1 {
        int i13;
        Unsafe unsafe;
        i2 i2Var;
        Object obj2;
        int iA;
        int i14;
        int i15;
        boolean z11;
        int iE;
        int i16;
        f fVar2;
        int i17;
        n3 n3Var;
        int i18;
        Object objA;
        w0 w0Var;
        int iD;
        int i19;
        int i21;
        int i22;
        int i23;
        int i24;
        boolean z12;
        int i25;
        Unsafe unsafe2;
        f fVar3;
        int iE2;
        Unsafe unsafe3;
        Unsafe unsafe4;
        int i26;
        int i27;
        int iC;
        int iA2;
        i2 i2Var2;
        int i28;
        int i29;
        int i31;
        int iA3;
        i2 i2Var3 = this;
        Object obj3 = obj;
        byte[] bArr2 = bArr;
        int i32 = i11;
        f fVar4 = fVar;
        Unsafe unsafe5 = f30818r;
        int i33 = 0;
        int iA4 = i5;
        int i34 = 0;
        int i35 = 0;
        int i36 = 0;
        int i37 = -1;
        int i38 = 1048575;
        while (true) {
            Object objValueOf = null;
            if (iA4 < i32) {
                int iA5 = iA4 + 1;
                int i39 = bArr2[iA4];
                if (i39 < 0) {
                    iA5 = g.a(i39, bArr2, iA5, fVar4);
                    i39 = fVar4.f30797a;
                }
                int i40 = iA5;
                int i41 = i39;
                int i42 = i41 >>> 3;
                int i43 = i41 & 7;
                if (i42 > i37) {
                    iA = (i42 < i2Var3.f30821c || i42 > i2Var3.f30822d) ? -1 : i2Var3.a(i42, i34 / 3);
                    if (iA != -1) {
                        i37 = i42;
                        i13 = i38;
                        unsafe = unsafe5;
                        i14 = 0;
                        i15 = 0;
                        z11 = true;
                        i2Var = i2Var3;
                        obj2 = obj3;
                        iE = i40;
                        i16 = i41;
                        fVar2 = fVar;
                    } else {
                        int[] iArr = i2Var3.f30819a;
                        int i44 = iArr[iA + 1];
                        int i45 = (i44 & 267386880) >>> 20;
                        long j11 = i44 & 1048575;
                        if (i45 <= 17) {
                            int i46 = iArr[iA + 2];
                            int i47 = 1 << (i46 >>> 20);
                            int i48 = i46 & 1048575;
                            if (i48 != i38) {
                                i19 = i42;
                                if (i38 != 1048575) {
                                    unsafe5.putInt(obj3, i38, i35);
                                }
                                i21 = unsafe5.getInt(obj3, i48);
                                i22 = i48;
                            } else {
                                i19 = i42;
                                i21 = i35;
                                i22 = i38;
                            }
                            switch (i45) {
                                case 0:
                                    i23 = i11;
                                    i24 = i22;
                                    z12 = true;
                                    i25 = i40;
                                    i14 = iA;
                                    unsafe2 = unsafe5;
                                    fVar3 = fVar;
                                    if (i43 == 1) {
                                        x3.f30955c.a(obj3, j11, Double.longBitsToDouble(g.b(i25, bArr)));
                                        iE2 = i25 + 8;
                                        int i49 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i49;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 1:
                                    i23 = i11;
                                    i24 = i22;
                                    i25 = i40;
                                    i14 = iA;
                                    unsafe2 = unsafe5;
                                    fVar3 = fVar;
                                    if (i43 == 5) {
                                        x3.f30955c.a(obj3, j11, Float.intBitsToFloat(g.a(i25, bArr)));
                                        iE2 = i25 + 4;
                                        int i492 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i492;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    z12 = true;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 2:
                                case 3:
                                    i23 = i11;
                                    unsafe3 = unsafe5;
                                    i24 = i22;
                                    fVar3 = fVar;
                                    i25 = i40;
                                    i14 = iA;
                                    if (i43 == 0) {
                                        iE2 = g.e(bArr, i25, fVar3);
                                        unsafe3.putLong(obj3, j11, fVar3.f30798b);
                                        unsafe2 = unsafe3;
                                        int i4922 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i4922;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    unsafe2 = unsafe3;
                                    z12 = true;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 4:
                                case 11:
                                    i23 = i11;
                                    unsafe3 = unsafe5;
                                    i24 = i22;
                                    fVar3 = fVar;
                                    i25 = i40;
                                    i14 = iA;
                                    if (i43 == 0) {
                                        int iA6 = i25 + 1;
                                        byte b11 = bArr[i25];
                                        if (b11 >= 0) {
                                            fVar3.f30797a = b11;
                                        } else {
                                            iA6 = g.a(b11, bArr, iA6, fVar3);
                                        }
                                        iE2 = iA6;
                                        unsafe3.putInt(obj3, j11, fVar3.f30797a);
                                        unsafe2 = unsafe3;
                                        int i49222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i49222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    unsafe2 = unsafe3;
                                    z12 = true;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 5:
                                case 14:
                                    i23 = i11;
                                    unsafe4 = unsafe5;
                                    i24 = i22;
                                    z12 = true;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 != 1) {
                                        i25 = i40;
                                        unsafe2 = unsafe4;
                                        i13 = i24;
                                        i2Var = i2Var3;
                                        z11 = z12;
                                        unsafe = unsafe2;
                                        i16 = i41;
                                        i37 = i19;
                                        i35 = i21;
                                        i15 = 0;
                                        fVar2 = fVar3;
                                        obj2 = obj3;
                                        iE = i25;
                                        break;
                                    } else {
                                        unsafe3 = unsafe4;
                                        unsafe3.putLong(obj3, j11, g.b(i40, bArr));
                                        iE2 = i40 + 8;
                                        unsafe2 = unsafe3;
                                        int i492222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i492222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                case 6:
                                case 13:
                                    i23 = i11;
                                    i26 = i40;
                                    unsafe4 = unsafe5;
                                    i24 = i22;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 == 5) {
                                        unsafe4.putInt(obj3, j11, g.a(i26, bArr));
                                        iE2 = i26 + 4;
                                        unsafe2 = unsafe4;
                                        int i4922222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i4922222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i25 = i26;
                                    unsafe2 = unsafe4;
                                    z12 = true;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 7:
                                    i23 = i11;
                                    i26 = i40;
                                    unsafe4 = unsafe5;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 != 0) {
                                        i24 = i22;
                                        i25 = i26;
                                        unsafe2 = unsafe4;
                                        z12 = true;
                                        i13 = i24;
                                        i2Var = i2Var3;
                                        z11 = z12;
                                        unsafe = unsafe2;
                                        i16 = i41;
                                        i37 = i19;
                                        i35 = i21;
                                        i15 = 0;
                                        fVar2 = fVar3;
                                        obj2 = obj3;
                                        iE = i25;
                                        break;
                                    } else {
                                        iE2 = g.e(bArr, i26, fVar3);
                                        i24 = i22;
                                        x3.f30955c.a(obj3, j11, fVar3.f30798b != 0);
                                        unsafe2 = unsafe4;
                                        int i49222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i49222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                case 8:
                                    i23 = i11;
                                    i27 = i40;
                                    unsafe4 = unsafe5;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 == 2) {
                                        if ((i44 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) == 0) {
                                            iC = g.b(bArr, i27, fVar3);
                                        } else {
                                            iC = g.c(bArr, i27, fVar3);
                                        }
                                        iE2 = iC;
                                        unsafe4.putObject(obj3, j11, fVar3.f30799c);
                                        i24 = i22;
                                        unsafe2 = unsafe4;
                                        int i492222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i492222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i25 = i27;
                                    i24 = i22;
                                    z12 = true;
                                    unsafe2 = unsafe4;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 9:
                                    i23 = i11;
                                    i27 = i40;
                                    unsafe4 = unsafe5;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 == 2) {
                                        iA2 = g.a(i2Var3.c(i14), bArr, i27, i23, fVar3);
                                        if ((i21 & i47) == 0) {
                                            unsafe4.putObject(obj3, j11, fVar3.f30799c);
                                        } else {
                                            unsafe4.putObject(obj3, j11, l1.a(unsafe4.getObject(obj3, j11), fVar3.f30799c));
                                        }
                                        iE2 = iA2;
                                        i24 = i22;
                                        unsafe2 = unsafe4;
                                        int i4922222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i4922222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i25 = i27;
                                    i24 = i22;
                                    z12 = true;
                                    unsafe2 = unsafe4;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 10:
                                    i23 = i11;
                                    i27 = i40;
                                    unsafe4 = unsafe5;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 == 2) {
                                        iE2 = g.a(bArr, i27, fVar3);
                                        unsafe4.putObject(obj3, j11, fVar3.f30799c);
                                        i24 = i22;
                                        unsafe2 = unsafe4;
                                        int i49222222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i49222222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i25 = i27;
                                    i24 = i22;
                                    z12 = true;
                                    unsafe2 = unsafe4;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 12:
                                    i23 = i11;
                                    i27 = i40;
                                    unsafe4 = unsafe5;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 == 0) {
                                        int iA7 = i27 + 1;
                                        byte b12 = bArr[i27];
                                        if (b12 >= 0) {
                                            fVar3.f30797a = b12;
                                        } else {
                                            iA7 = g.a(b12, bArr, iA7, fVar3);
                                        }
                                        iE2 = iA7;
                                        int i51 = fVar3.f30797a;
                                        i2Var3.a(i14);
                                        unsafe4.putInt(obj3, j11, i51);
                                        i24 = i22;
                                        unsafe2 = unsafe4;
                                        int i492222222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i492222222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i25 = i27;
                                    i24 = i22;
                                    z12 = true;
                                    unsafe2 = unsafe4;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 15:
                                    i23 = i11;
                                    i27 = i40;
                                    unsafe4 = unsafe5;
                                    fVar3 = fVar;
                                    i14 = iA;
                                    if (i43 == 0) {
                                        int iA8 = i27 + 1;
                                        byte b13 = bArr[i27];
                                        if (b13 >= 0) {
                                            fVar3.f30797a = b13;
                                        } else {
                                            iA8 = g.a(b13, bArr, iA8, fVar3);
                                        }
                                        iE2 = iA8;
                                        unsafe4.putInt(obj3, j11, w.b(fVar3.f30797a));
                                        i24 = i22;
                                        unsafe2 = unsafe4;
                                        int i4922222222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i4922222222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                    i25 = i27;
                                    i24 = i22;
                                    z12 = true;
                                    unsafe2 = unsafe4;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                                case 16:
                                    i23 = i11;
                                    i27 = i40;
                                    int i52 = iA;
                                    if (i43 != 0) {
                                        Unsafe unsafe6 = unsafe5;
                                        fVar3 = fVar;
                                        unsafe4 = unsafe6;
                                        i14 = i52;
                                        i25 = i27;
                                        i24 = i22;
                                        z12 = true;
                                        unsafe2 = unsafe4;
                                        i13 = i24;
                                        i2Var = i2Var3;
                                        z11 = z12;
                                        unsafe = unsafe2;
                                        i16 = i41;
                                        i37 = i19;
                                        i35 = i21;
                                        i15 = 0;
                                        fVar2 = fVar3;
                                        obj2 = obj3;
                                        iE = i25;
                                        break;
                                    } else {
                                        iE2 = g.e(bArr, i27, fVar);
                                        i14 = i52;
                                        unsafe3 = unsafe5;
                                        unsafe3.putLong(obj3, j11, w.a(fVar.f30798b));
                                        i24 = i22;
                                        unsafe2 = unsafe3;
                                        int i49222222222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i49222222222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                case 17:
                                    if (i43 == 3) {
                                        int i53 = iA;
                                        iA2 = g.a(i2Var3.c(iA), bArr, i40, i11, (i19 << 3) | 4, fVar);
                                        i23 = i11;
                                        if ((i21 & i47) == 0) {
                                            unsafe5.putObject(obj3, j11, fVar.f30799c);
                                        } else {
                                            unsafe5.putObject(obj3, j11, l1.a(unsafe5.getObject(obj3, j11), fVar.f30799c));
                                        }
                                        unsafe4 = unsafe5;
                                        i14 = i53;
                                        iE2 = iA2;
                                        i24 = i22;
                                        unsafe2 = unsafe4;
                                        int i492222222222222 = i21 | i47;
                                        i13 = i24;
                                        obj2 = obj3;
                                        i32 = i23;
                                        i34 = i14;
                                        unsafe = unsafe2;
                                        i17 = i41;
                                        iA4 = iE2;
                                        i37 = i19;
                                        i15 = 0;
                                        i2Var = i2Var3;
                                        i35 = i492222222222222;
                                        bArr2 = bArr;
                                        i36 = i17;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                        fVar4 = fVar;
                                        break;
                                    }
                                default:
                                    i25 = i40;
                                    i14 = iA;
                                    i24 = i22;
                                    z12 = true;
                                    unsafe2 = unsafe5;
                                    fVar3 = fVar;
                                    i13 = i24;
                                    i2Var = i2Var3;
                                    z11 = z12;
                                    unsafe = unsafe2;
                                    i16 = i41;
                                    i37 = i19;
                                    i35 = i21;
                                    i15 = 0;
                                    fVar2 = fVar3;
                                    obj2 = obj3;
                                    iE = i25;
                                    break;
                            }
                        } else {
                            int i54 = i41;
                            Unsafe unsafe7 = unsafe5;
                            i14 = iA;
                            int i55 = i35;
                            if (i45 == 27) {
                                if (i43 == 2) {
                                    k1 k1VarB = (k1) unsafe7.getObject(obj3, j11);
                                    if (!((c) k1VarB).f30774a) {
                                        int size = k1VarB.size();
                                        k1VarB = k1VarB.b(size == 0 ? 10 : size * 2);
                                        unsafe7.putObject(obj3, j11, k1VarB);
                                    }
                                    t2 t2VarC = i2Var3.c(i14);
                                    int iA9 = g.a(t2VarC, bArr, i40, i32, fVar);
                                    k1VarB.add(fVar.f30799c);
                                    while (true) {
                                        if (iA9 < i32) {
                                            int iA10 = iA9 + 1;
                                            byte b14 = bArr[iA9];
                                            if (b14 >= 0) {
                                                fVar.f30797a = b14;
                                            } else {
                                                iA10 = g.a(b14, bArr, iA10, fVar);
                                            }
                                            i31 = i54;
                                            if (i31 == fVar.f30797a) {
                                                iA9 = g.a(t2VarC, bArr, iA10, i32, fVar);
                                                k1VarB.add(fVar.f30799c);
                                                i54 = i31;
                                            }
                                        } else {
                                            i31 = i54;
                                        }
                                    }
                                    obj2 = obj3;
                                    unsafe = unsafe7;
                                    i35 = i55;
                                    i13 = i38;
                                    i34 = i14;
                                    iA4 = iA9;
                                    i17 = i31;
                                    i37 = i42;
                                    i15 = 0;
                                    i2Var = i2Var3;
                                    bArr2 = bArr;
                                    i36 = i17;
                                    i2Var3 = i2Var;
                                    obj3 = obj2;
                                    unsafe5 = unsafe;
                                    i33 = i15;
                                    i38 = i13;
                                    fVar4 = fVar;
                                } else {
                                    i2Var2 = i2Var3;
                                    unsafe = unsafe7;
                                    i13 = i38;
                                    i28 = i40;
                                    i15 = 0;
                                    z11 = true;
                                    i16 = i54;
                                    i29 = i55;
                                }
                            } else if (i45 <= 49) {
                                i13 = i38;
                                unsafe = unsafe7;
                                i29 = i55;
                                i15 = 0;
                                z11 = true;
                                i16 = i54;
                                Object obj4 = obj3;
                                fVar2 = fVar;
                                int iA11 = a(obj4, bArr, i40, i32, i16, i43, i14, i44, i45, j11, fVar2);
                                i14 = i14;
                                i2Var = this;
                                obj2 = obj4;
                                if (iA11 != i40) {
                                    iA4 = iA11;
                                    i37 = i42;
                                    f fVar5 = fVar2;
                                    i36 = i16;
                                    fVar4 = fVar5;
                                    bArr2 = bArr;
                                    i35 = i29;
                                    i32 = i11;
                                    i2Var3 = i2Var;
                                    obj3 = obj2;
                                    i34 = i14;
                                    unsafe5 = unsafe;
                                    i33 = i15;
                                    i38 = i13;
                                } else {
                                    iA3 = iA11;
                                    i37 = i42;
                                    i35 = i29;
                                    iE = iA3;
                                }
                            } else {
                                i15 = 0;
                                z11 = true;
                                unsafe = unsafe7;
                                i29 = i55;
                                i13 = i38;
                                i28 = i40;
                                i16 = i54;
                                i2Var2 = this;
                                if (i45 != 50) {
                                    fVar2 = fVar;
                                    Object obj5 = obj3;
                                    i37 = i42;
                                    iA3 = i2Var2.a(obj5, bArr, i28, i11, i16, i37, i43, i44, i45, j11, i14, fVar2);
                                    i2Var = i2Var2;
                                    obj2 = obj5;
                                    i14 = i14;
                                    if (iA3 != i28) {
                                        iA4 = iA3;
                                        f fVar52 = fVar2;
                                        i36 = i16;
                                        fVar4 = fVar52;
                                        bArr2 = bArr;
                                        i35 = i29;
                                        i32 = i11;
                                        i2Var3 = i2Var;
                                        obj3 = obj2;
                                        i34 = i14;
                                        unsafe5 = unsafe;
                                        i33 = i15;
                                        i38 = i13;
                                    } else {
                                        i35 = i29;
                                        iE = iA3;
                                    }
                                } else if (i43 == 2) {
                                    Unsafe unsafe8 = f30818r;
                                    Object objB = i2Var2.b(i14);
                                    Object object = unsafe8.getObject(obj3, j11);
                                    i2Var2.f30832p.getClass();
                                    if (!((y1) object).f30965a) {
                                        i2Var2.f30832p.getClass();
                                        y1 y1Var = y1.f30964b;
                                        y1 y1Var2 = y1Var.isEmpty() ? new y1() : new y1(y1Var);
                                        i2Var2.f30832p.getClass();
                                        z1.a(y1Var2, object);
                                        unsafe8.putObject(obj3, j11, y1Var2);
                                    }
                                    i2Var2.f30832p.getClass();
                                    objB.getClass();
                                    throw new ClassCastException();
                                }
                            }
                            i35 = i29;
                            fVar2 = fVar;
                            i2Var = i2Var2;
                            obj2 = obj3;
                            iE = i28;
                            i37 = i42;
                        }
                    }
                    if (i16 == i12 || i12 == 0) {
                        if (!i2Var.f30824f && fVar2.f30800d != h0.a()) {
                            d2 d2Var = i2Var.f30823e;
                            o3 o3Var = i2Var.n;
                            x0 x0VarA = fVar2.f30800d.a(i37, d2Var);
                            if (x0VarA == null) {
                                z0 z0Var = (z0) obj2;
                                n3 n3Var2 = z0Var.unknownFields;
                                if (n3Var2 == n3.f30860f) {
                                    n3Var2 = new n3();
                                    z0Var.unknownFields = n3Var2;
                                }
                                i32 = i11;
                                int i56 = i16;
                                i17 = i56;
                                iA4 = g.a(i56, bArr, iE, i32, n3Var2, fVar2);
                                i34 = i14;
                            } else {
                                i32 = i11;
                                int i57 = i16;
                                f fVar6 = fVar2;
                                GeneratedMessageLite$ExtendableMessage generatedMessageLite$ExtendableMessage = (GeneratedMessageLite$ExtendableMessage) obj2;
                                generatedMessageLite$ExtendableMessage.ensureExtensionsAreMutable();
                                n0 n0Var = generatedMessageLite$ExtendableMessage.extensions;
                                w0 w0Var2 = x0VarA.f30949d;
                                int i58 = i14;
                                if (w0Var2.f30935d && w0Var2.f30936e) {
                                    switch (e.f30787a[w0Var2.f30934c.ordinal()]) {
                                        case 1:
                                            i18 = i57;
                                            d0 d0Var = new d0();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i59 = fVar6.f30797a + iD;
                                            while (iD < i59) {
                                                d0Var.a(Double.longBitsToDouble(g.b(iD, bArr)));
                                                iD += 8;
                                            }
                                            if (iD == i59) {
                                                n0Var.c(x0VarA.f30949d, d0Var);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 2:
                                            i18 = i57;
                                            q0 q0Var = new q0();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i61 = fVar6.f30797a + iD;
                                            while (iD < i61) {
                                                q0Var.a(Float.intBitsToFloat(g.a(iD, bArr)));
                                                iD += 4;
                                            }
                                            if (iD == i61) {
                                                n0Var.c(x0VarA.f30949d, q0Var);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 3:
                                        case 4:
                                            i18 = i57;
                                            u1 u1Var = new u1();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i62 = fVar6.f30797a + iD;
                                            while (iD < i62) {
                                                iD = g.e(bArr, iD, fVar6);
                                                u1Var.a(fVar6.f30798b);
                                            }
                                            if (iD == i62) {
                                                n0Var.c(x0VarA.f30949d, u1Var);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 5:
                                        case 6:
                                            i18 = i57;
                                            a1 a1Var = new a1();
                                            iD = g.a(bArr, iE, a1Var, fVar6);
                                            n0Var.c(x0VarA.f30949d, a1Var);
                                            i34 = i58;
                                            iA4 = iD;
                                            break;
                                        case 7:
                                        case 8:
                                            i18 = i57;
                                            u1 u1Var2 = new u1();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i63 = fVar6.f30797a + iD;
                                            while (iD < i63) {
                                                u1Var2.a(g.b(iD, bArr));
                                                iD += 8;
                                            }
                                            if (iD == i63) {
                                                n0Var.c(x0VarA.f30949d, u1Var2);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 9:
                                        case 10:
                                            i18 = i57;
                                            a1 a1Var2 = new a1();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i64 = fVar6.f30797a + iD;
                                            while (iD < i64) {
                                                a1Var2.c(g.a(iD, bArr));
                                                iD += 4;
                                            }
                                            if (iD == i64) {
                                                n0Var.c(x0VarA.f30949d, a1Var2);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 11:
                                            i18 = i57;
                                            j jVar = new j();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i65 = fVar6.f30797a + iD;
                                            while (iD < i65) {
                                                iD = g.e(bArr, iD, fVar6);
                                                jVar.a(fVar6.f30798b != 0 ? z11 : i15);
                                            }
                                            if (iD == i65) {
                                                n0Var.c(x0VarA.f30949d, jVar);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 12:
                                            i18 = i57;
                                            a1 a1Var3 = new a1();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i66 = fVar6.f30797a + iD;
                                            while (iD < i66) {
                                                int i67 = iD + 1;
                                                byte b15 = bArr[iD];
                                                if (b15 >= 0) {
                                                    fVar6.f30797a = b15;
                                                    iD = i67;
                                                } else {
                                                    iD = g.a(b15, bArr, i67, fVar6);
                                                }
                                                a1Var3.c(w.b(fVar6.f30797a));
                                            }
                                            if (iD == i66) {
                                                n0Var.c(x0VarA.f30949d, a1Var3);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 13:
                                            u1 u1Var3 = new u1();
                                            iD = g.d(bArr, iE, fVar6);
                                            int i68 = fVar6.f30797a + iD;
                                            while (iD < i68) {
                                                iD = g.e(bArr, iD, fVar6);
                                                u1Var3.a(w.a(fVar6.f30798b));
                                                i57 = i57;
                                            }
                                            i18 = i57;
                                            if (iD == i68) {
                                                n0Var.c(x0VarA.f30949d, u1Var3);
                                                i34 = i58;
                                                iA4 = iD;
                                                break;
                                            } else {
                                                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                                            }
                                        case 14:
                                            a1 a1Var4 = new a1();
                                            int iA12 = g.a(bArr, iE, a1Var4, fVar6);
                                            n3 n3Var3 = generatedMessageLite$ExtendableMessage.unknownFields;
                                            if (n3Var3 == n3.f30860f) {
                                                n3Var3 = null;
                                            }
                                            n3 n3Var4 = (n3) u2.a(i37, a1Var4, x0VarA.f30949d.f30932a, n3Var3, o3Var);
                                            if (n3Var4 != null) {
                                                generatedMessageLite$ExtendableMessage.unknownFields = n3Var4;
                                            }
                                            n0Var.c(x0VarA.f30949d, a1Var4);
                                            i34 = i58;
                                            i17 = i57;
                                            iA4 = iA12;
                                            break;
                                        default:
                                            throw new IllegalStateException("Type cannot be packed: " + x0VarA.f30949d.f30934c);
                                    }
                                } else {
                                    i18 = i57;
                                    j4 j4Var = w0Var2.f30934c;
                                    if (j4Var == j4.ENUM) {
                                        iE = g.d(bArr, iE, fVar6);
                                        if (x0VarA.f30949d.f30932a.a(fVar6.f30797a) == null) {
                                            n3 n3Var5 = generatedMessageLite$ExtendableMessage.unknownFields;
                                            if (n3Var5 == n3.f30860f) {
                                                n3Var5 = new n3();
                                                generatedMessageLite$ExtendableMessage.unknownFields = n3Var5;
                                            }
                                            u2.a(i37, fVar6.f30797a, n3Var5, o3Var);
                                            i34 = i58;
                                            iA4 = iE;
                                        } else {
                                            objValueOf = Integer.valueOf(fVar6.f30797a);
                                        }
                                    } else {
                                        switch (e.f30787a[j4Var.ordinal()]) {
                                            case 1:
                                                objValueOf = Double.valueOf(Double.longBitsToDouble(g.b(iE, bArr)));
                                                iE += 8;
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                    n0Var.a(w0Var, objA);
                                                } else {
                                                    int i69 = e.f30787a[w0Var.f30934c.ordinal()];
                                                    if (i69 == 17 || i69 == 18) {
                                                        Object obj6 = n0Var.f30856a.get(x0VarA.f30949d);
                                                        if (obj6 != null) {
                                                            objA = l1.a(obj6, objA);
                                                        }
                                                    }
                                                    n0Var.c(x0VarA.f30949d, objA);
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 2:
                                                objValueOf = Float.valueOf(Float.intBitsToFloat(g.a(iE, bArr)));
                                                iE += 4;
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 3:
                                            case 4:
                                                iE = g.e(bArr, iE, fVar6);
                                                objValueOf = Long.valueOf(fVar6.f30798b);
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 5:
                                            case 6:
                                                iE = g.d(bArr, iE, fVar6);
                                                objValueOf = Integer.valueOf(fVar6.f30797a);
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 7:
                                            case 8:
                                                objValueOf = Long.valueOf(g.b(iE, bArr));
                                                iE += 8;
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 9:
                                            case 10:
                                                objValueOf = Integer.valueOf(g.a(iE, bArr));
                                                iE += 4;
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 11:
                                                iE = g.e(bArr, iE, fVar6);
                                                objValueOf = Boolean.valueOf(fVar6.f30798b != 0 ? z11 : i15);
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 12:
                                                iE = g.d(bArr, iE, fVar6);
                                                objValueOf = Integer.valueOf(w.b(fVar6.f30797a));
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 13:
                                                iE = g.e(bArr, iE, fVar6);
                                                objValueOf = Long.valueOf(w.a(fVar6.f30798b));
                                                objA = objValueOf;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 14:
                                                throw new IllegalStateException("Shouldn't reach here.");
                                            case 15:
                                                iE = g.a(bArr, iE, fVar6);
                                                objA = fVar6.f30799c;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 16:
                                                iE = g.b(bArr, iE, fVar6);
                                                objA = fVar6.f30799c;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 17:
                                                iE = g.a(p2.f30870c.a(x0VarA.f30948c.getClass()), bArr, iE, i32, (i37 << 3) | 4, fVar6);
                                                objA = fVar6.f30799c;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                            case 18:
                                                iE = g.a(p2.f30870c.a(x0VarA.f30948c.getClass()), bArr, iE, i32, fVar6);
                                                objA = fVar6.f30799c;
                                                w0Var = x0VarA.f30949d;
                                                if (!w0Var.f30935d) {
                                                }
                                                i34 = i58;
                                                i32 = i11;
                                                iA4 = iE;
                                                break;
                                        }
                                    }
                                    objA = objValueOf;
                                    w0Var = x0VarA.f30949d;
                                    if (!w0Var.f30935d) {
                                    }
                                    i34 = i58;
                                    i32 = i11;
                                    iA4 = iE;
                                }
                                i17 = i18;
                            }
                        } else {
                            int i71 = i16;
                            int i72 = i14;
                            f fVar7 = fVar2;
                            z0 z0Var2 = (z0) obj2;
                            n3Var = z0Var2.unknownFields;
                            if (n3Var == n3.f30860f) {
                                n3Var = new n3();
                                z0Var2.unknownFields = n3Var;
                            }
                            n3 n3Var6 = n3Var;
                            i32 = i11;
                            int iA13 = g.a(i71, bArr, iE, i32, n3Var6, fVar7);
                            i17 = i71;
                            i34 = i72;
                            iA4 = iA13;
                        }
                        bArr2 = bArr;
                        i36 = i17;
                        i2Var3 = i2Var;
                        obj3 = obj2;
                        unsafe5 = unsafe;
                        i33 = i15;
                        i38 = i13;
                        fVar4 = fVar;
                    } else {
                        i32 = i11;
                        iA4 = iE;
                        i36 = i16;
                    }
                } else {
                    if (i42 >= i2Var3.f30821c && i42 <= i2Var3.f30822d) {
                        iA = i2Var3.a(i42, i33);
                    }
                    if (iA != -1) {
                    }
                    if (i16 == i12) {
                    }
                    if (!i2Var.f30824f) {
                        int i712 = i16;
                        int i722 = i14;
                        f fVar72 = fVar2;
                        z0 z0Var22 = (z0) obj2;
                        n3Var = z0Var22.unknownFields;
                        if (n3Var == n3.f30860f) {
                        }
                        n3 n3Var62 = n3Var;
                        i32 = i11;
                        int iA132 = g.a(i712, bArr, iE, i32, n3Var62, fVar72);
                        i17 = i712;
                        i34 = i722;
                        iA4 = iA132;
                        bArr2 = bArr;
                        i36 = i17;
                        i2Var3 = i2Var;
                        obj3 = obj2;
                        unsafe5 = unsafe;
                        i33 = i15;
                        i38 = i13;
                        fVar4 = fVar;
                    }
                }
            } else {
                i13 = i38;
                unsafe = unsafe5;
                i2Var = i2Var3;
                obj2 = obj3;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to find 'out' block for switch in B:37:0x009e. Please report as an issue. */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    public final void a(Object obj, byte[] bArr, int i5, int i11, f fVar) throws n1 {
        int iA;
        int i12;
        int i13;
        int i14;
        int i15;
        Unsafe unsafe;
        int i16;
        int i17;
        Unsafe unsafe2;
        Object obj2;
        int i18;
        int i19;
        int i21;
        int i22;
        int iE;
        int i23;
        int i24;
        int iC;
        int i25;
        i2 i2Var = this;
        Object obj3 = obj;
        byte[] bArr2 = bArr;
        int i26 = i11;
        f fVar2 = fVar;
        if (i2Var.f30826h) {
            Unsafe unsafe3 = f30818r;
            int i27 = -1;
            int i28 = 0;
            int iA2 = i5;
            int i29 = -1;
            int i31 = 0;
            int i32 = 0;
            int i33 = 1048575;
            while (iA2 < i26) {
                int iA3 = iA2 + 1;
                int i34 = bArr2[iA2];
                if (i34 < 0) {
                    iA3 = g.a(i34, bArr2, iA3, fVar2);
                    i34 = fVar2.f30797a;
                }
                int i35 = i34 >>> 3;
                int i36 = i34 & 7;
                if (i35 > i29) {
                    int i37 = i32 / 3;
                    if (i35 >= i2Var.f30821c && i35 <= i2Var.f30822d) {
                        iA = i2Var.a(i35, i37);
                        i32 = iA;
                    }
                    i32 = i27;
                } else {
                    if (i35 >= i2Var.f30821c && i35 <= i2Var.f30822d) {
                        iA = i2Var.a(i35, i28);
                        i32 = iA;
                    }
                    i32 = i27;
                }
                if (i32 == i27) {
                    unsafe2 = unsafe3;
                    obj2 = obj3;
                    i12 = i34;
                    i13 = i33;
                    i19 = iA3;
                    i14 = i35;
                    i32 = i28;
                    i17 = i31;
                } else {
                    int[] iArr = i2Var.f30819a;
                    int i38 = iArr[i32 + 1];
                    int i39 = (i38 & 267386880) >>> 20;
                    long j11 = i38 & 1048575;
                    if (i39 <= 17) {
                        int i40 = iArr[i32 + 2];
                        int i41 = 1 << (i40 >>> 20);
                        int i42 = i40 & 1048575;
                        int i43 = 1048575;
                        if (i42 != i33) {
                            if (i33 != 1048575) {
                                unsafe3.putInt(obj3, i33, i31);
                                i43 = 1048575;
                            }
                            if (i42 != i43) {
                                i31 = unsafe3.getInt(obj3, i42);
                            }
                            i21 = i42;
                        } else {
                            i21 = i33;
                        }
                        int i44 = i31;
                        switch (i39) {
                            case 0:
                                i22 = i11;
                                unsafe2 = unsafe3;
                                i12 = i34;
                                if (i36 == 1) {
                                    x3.f30955c.a(obj3, j11, Double.longBitsToDouble(g.b(iA3, bArr2)));
                                    iE = iA3 + 8;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 1:
                                i22 = i11;
                                unsafe2 = unsafe3;
                                i12 = i34;
                                if (i36 == 5) {
                                    x3.f30955c.a(obj3, j11, Float.intBitsToFloat(g.a(iA3, bArr2)));
                                    iE = iA3 + 4;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 2:
                            case 3:
                                i22 = i11;
                                i23 = i34;
                                if (i36 == 0) {
                                    iE = g.e(bArr2, iA3, fVar2);
                                    unsafe3.putLong(obj3, j11, fVar2.f30798b);
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i23;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 4:
                            case 11:
                                i22 = i11;
                                i23 = i34;
                                if (i36 == 0) {
                                    int iA4 = iA3 + 1;
                                    byte b11 = bArr2[iA3];
                                    if (b11 >= 0) {
                                        fVar2.f30797a = b11;
                                    } else {
                                        iA4 = g.a(b11, bArr2, iA4, fVar2);
                                    }
                                    iE = iA4;
                                    unsafe3.putInt(obj3, j11, fVar2.f30797a);
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i23;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 5:
                            case 14:
                                i22 = i11;
                                if (i36 == 1) {
                                    unsafe3.putLong(obj3, j11, g.b(iA3, bArr2));
                                    iE = iA3 + 8;
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 6:
                            case 13:
                                i22 = i11;
                                if (i36 == 5) {
                                    unsafe3.putInt(obj3, j11, g.a(iA3, bArr2));
                                    iE = iA3 + 4;
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 7:
                                i24 = i11;
                                if (i36 == 0) {
                                    iE = g.e(bArr2, iA3, fVar2);
                                    x3.f30955c.a(obj3, j11, fVar2.f30798b != 0);
                                    unsafe2 = unsafe3;
                                    i22 = i24;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 8:
                                i24 = i11;
                                if (i36 == 2) {
                                    if ((536870912 & i38) == 0) {
                                        iC = g.b(bArr2, iA3, fVar2);
                                    } else {
                                        iC = g.c(bArr2, iA3, fVar2);
                                    }
                                    iE = iC;
                                    unsafe3.putObject(obj3, j11, fVar2.f30799c);
                                    unsafe2 = unsafe3;
                                    i22 = i24;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 9:
                                if (i36 == 2) {
                                    i24 = i11;
                                    iE = g.a(i2Var.c(i32), bArr2, iA3, i24, fVar2);
                                    Object object = unsafe3.getObject(obj3, j11);
                                    if (object == null) {
                                        unsafe3.putObject(obj3, j11, fVar2.f30799c);
                                    } else {
                                        unsafe3.putObject(obj3, j11, l1.a(object, fVar2.f30799c));
                                    }
                                    unsafe2 = unsafe3;
                                    i22 = i24;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 10:
                                if (i36 == 2) {
                                    iE = g.a(bArr2, iA3, fVar2);
                                    unsafe3.putObject(obj3, j11, fVar2.f30799c);
                                    i22 = i11;
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 12:
                                if (i36 == 0) {
                                    int iA5 = iA3 + 1;
                                    byte b12 = bArr2[iA3];
                                    if (b12 >= 0) {
                                        fVar2.f30797a = b12;
                                    } else {
                                        iA5 = g.a(b12, bArr2, iA5, fVar2);
                                    }
                                    iE = iA5;
                                    unsafe3.putInt(obj3, j11, fVar2.f30797a);
                                    i22 = i11;
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 15:
                                if (i36 == 0) {
                                    int iA6 = iA3 + 1;
                                    byte b13 = bArr2[iA3];
                                    if (b13 >= 0) {
                                        fVar2.f30797a = b13;
                                    } else {
                                        iA6 = g.a(b13, bArr2, iA6, fVar2);
                                    }
                                    iE = iA6;
                                    unsafe3.putInt(obj3, j11, w.b(fVar2.f30797a));
                                    i22 = i11;
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            case 16:
                                if (i36 == 0) {
                                    iE = g.e(bArr2, iA3, fVar2);
                                    unsafe3.putLong(obj3, j11, w.a(fVar2.f30798b));
                                    i22 = i11;
                                    unsafe2 = unsafe3;
                                    i31 = i44 | i41;
                                    obj2 = obj3;
                                    i25 = i22;
                                    i13 = i21;
                                    iA2 = iE;
                                    i14 = i35;
                                    break;
                                }
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                            default:
                                unsafe2 = unsafe3;
                                i12 = i34;
                                obj2 = obj3;
                                i13 = i21;
                                i19 = iA3;
                                i14 = i35;
                                i17 = i44;
                                break;
                        }
                        i2Var = this;
                        bArr2 = bArr;
                        fVar2 = fVar;
                        i26 = i25;
                        obj3 = obj2;
                        unsafe3 = unsafe2;
                        i29 = i14;
                        i33 = i13;
                        i27 = -1;
                        i28 = 0;
                    } else {
                        i26 = i11;
                        int i45 = i34;
                        int i46 = i33;
                        int i47 = i31;
                        Unsafe unsafe4 = unsafe3;
                        if (i39 != 27) {
                            i12 = i45;
                            if (i39 <= 49) {
                                int i48 = iA3;
                                i14 = i35;
                                Object obj4 = obj3;
                                byte[] bArr3 = bArr2;
                                int i49 = i32;
                                int iA7 = a(obj4, bArr3, i48, i11, i12, i36, i49, i38, i39, j11, fVar2);
                                i12 = i12;
                                i15 = i49;
                                unsafe2 = unsafe4;
                                if (iA7 != i48) {
                                    iA2 = iA7;
                                    i13 = i46;
                                    i17 = i47;
                                    obj2 = obj4;
                                    i2Var = this;
                                    bArr2 = bArr;
                                    i26 = i11;
                                    fVar2 = fVar;
                                    obj3 = obj2;
                                    i32 = i15;
                                    unsafe3 = unsafe2;
                                    i31 = i17;
                                } else {
                                    i18 = iA7;
                                    i13 = i46;
                                    i17 = i47;
                                    obj2 = obj4;
                                    i19 = i18;
                                    i32 = i15;
                                }
                            } else {
                                i13 = i46;
                                i14 = i35;
                                i15 = i32;
                                unsafe = unsafe4;
                                i16 = iA3;
                                if (i39 != 50) {
                                    Object obj5 = obj3;
                                    i17 = i47;
                                    unsafe2 = unsafe;
                                    int iA8 = a(obj5, bArr, i16, i11, i12, i14, i36, i38, i39, j11, i15, fVar);
                                    obj2 = obj5;
                                    i12 = i12;
                                    if (iA8 != i16) {
                                        iA2 = iA8;
                                        i2Var = this;
                                        bArr2 = bArr;
                                        i26 = i11;
                                        fVar2 = fVar;
                                        obj3 = obj2;
                                        i32 = i15;
                                        unsafe3 = unsafe2;
                                        i31 = i17;
                                    } else {
                                        i18 = iA8;
                                        i19 = i18;
                                        i32 = i15;
                                    }
                                } else if (i36 == 2) {
                                    Unsafe unsafe5 = f30818r;
                                    Object objB = b(i15);
                                    Object object2 = unsafe5.getObject(obj3, j11);
                                    this.f30832p.getClass();
                                    if (!((y1) object2).f30965a) {
                                        this.f30832p.getClass();
                                        y1 y1Var = y1.f30964b;
                                        y1 y1Var2 = y1Var.isEmpty() ? new y1() : new y1(y1Var);
                                        this.f30832p.getClass();
                                        z1.a(y1Var2, object2);
                                        unsafe5.putObject(obj3, j11, y1Var2);
                                    }
                                    this.f30832p.getClass();
                                    objB.getClass();
                                    throw new ClassCastException();
                                }
                            }
                            i29 = i14;
                            i33 = i13;
                            i27 = -1;
                            i28 = 0;
                        } else if (i36 == 2) {
                            k1 k1VarB = (k1) unsafe4.getObject(obj3, j11);
                            if (!((c) k1VarB).f30774a) {
                                int size = k1VarB.size();
                                k1VarB = k1VarB.b(size == 0 ? 10 : size * 2);
                                unsafe4.putObject(obj3, j11, k1VarB);
                            }
                            t2 t2VarC = i2Var.c(i32);
                            int iA9 = g.a(t2VarC, bArr2, iA3, i26, fVar2);
                            k1VarB.add(fVar2.f30799c);
                            while (iA9 < i26) {
                                int iA10 = iA9 + 1;
                                byte b14 = bArr2[iA9];
                                if (b14 >= 0) {
                                    fVar2.f30797a = b14;
                                } else {
                                    iA10 = g.a(b14, bArr2, iA10, fVar2);
                                }
                                int i51 = i45;
                                if (i51 != fVar2.f30797a) {
                                    unsafe3 = unsafe4;
                                    iA2 = iA9;
                                    i33 = i46;
                                    i29 = i35;
                                    i31 = i47;
                                    i27 = -1;
                                    i28 = 0;
                                } else {
                                    iA9 = g.a(t2VarC, bArr2, iA10, i26, fVar2);
                                    k1VarB.add(fVar2.f30799c);
                                    i45 = i51;
                                }
                            }
                            unsafe3 = unsafe4;
                            iA2 = iA9;
                            i33 = i46;
                            i29 = i35;
                            i31 = i47;
                            i27 = -1;
                            i28 = 0;
                        } else {
                            i12 = i45;
                            unsafe = unsafe4;
                            i13 = i46;
                            i16 = iA3;
                            i14 = i35;
                            i15 = i32;
                        }
                        obj2 = obj3;
                        i19 = i16;
                        unsafe2 = unsafe;
                        i32 = i15;
                        i17 = i47;
                    }
                }
                z0 z0Var = (z0) obj2;
                n3 n3Var = z0Var.unknownFields;
                if (n3Var == n3.f30860f) {
                    n3Var = new n3();
                    z0Var.unknownFields = n3Var;
                }
                i25 = i11;
                iA2 = g.a(i12, bArr, i19, i11, n3Var, fVar);
                i31 = i17;
                i2Var = this;
                bArr2 = bArr;
                fVar2 = fVar;
                i26 = i25;
                obj3 = obj2;
                unsafe3 = unsafe2;
                i29 = i14;
                i33 = i13;
                i27 = -1;
                i28 = 0;
            }
            Unsafe unsafe6 = unsafe3;
            Object obj6 = obj3;
            int i52 = i33;
            int i53 = i31;
            int i54 = i26;
            if (i52 != 1048575) {
                unsafe6.putInt(obj6, i52, i53);
            }
            if (iA2 != i54) {
                throw new n1("Failed to parse the message.");
            }
            return;
        }
        a(obj3, bArr, i5, i26, 0, fVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00a7  */
    @Override // com.fyber.inneractive.sdk.protobuf.t2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(Object obj) {
        boolean zA;
        int i5 = 1048575;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            boolean zA2 = true;
            if (i11 < this.f30828j) {
                int i13 = this.f30827i[i11];
                int[] iArr = this.f30819a;
                int i14 = iArr[i13];
                int i15 = iArr[i13 + 1];
                int i16 = iArr[i13 + 2];
                int i17 = i16 & 1048575;
                int i18 = 1 << (i16 >>> 20);
                if (i17 != i5) {
                    if (i17 != 1048575) {
                        i12 = f30818r.getInt(obj, i17);
                    }
                    i5 = i17;
                }
                if ((268435456 & i15) != 0) {
                    if (i5 == 1048575) {
                        zA = a(i13, obj);
                    } else {
                        zA = (i12 & i18) != 0;
                    }
                    if (!zA) {
                        return false;
                    }
                }
                int i19 = (267386880 & i15) >>> 20;
                if (i19 == 9 || i19 == 17) {
                    if (i5 == 1048575) {
                        zA2 = a(i13, obj);
                    } else if ((i18 & i12) == 0) {
                        zA2 = false;
                    }
                    if (zA2 && !c(i13).a(x3.e(obj, i15 & 1048575))) {
                        return false;
                    }
                } else if (i19 == 27) {
                    List list = (List) x3.e(obj, i15 & 1048575);
                    if (list.isEmpty()) {
                        continue;
                    } else {
                        t2 t2VarC = c(i13);
                        for (int i21 = 0; i21 < list.size(); i21++) {
                            if (!t2VarC.a(list.get(i21))) {
                                return false;
                            }
                        }
                    }
                } else if (i19 == 60 || i19 == 68) {
                    if (a(obj, i14, i13) && !c(i13).a(x3.e(obj, i15 & 1048575))) {
                        return false;
                    }
                } else if (i19 != 49) {
                    if (i19 != 50) {
                        continue;
                    } else {
                        z1 z1Var = this.f30832p;
                        Object objE = x3.e(obj, i15 & 1048575);
                        z1Var.getClass();
                        if (!((y1) objE).isEmpty()) {
                            Object objB = b(i13);
                            this.f30832p.getClass();
                            objB.getClass();
                            throw new ClassCastException();
                        }
                    }
                }
                i11++;
            } else {
                if (this.f30824f) {
                    this.o.getClass();
                    if (!((GeneratedMessageLite$ExtendableMessage) obj).extensions.c()) {
                        return false;
                    }
                }
                return true;
            }
        }
    }

    public static void a(int i5, Object obj, c0 c0Var) {
        if (obj instanceof String) {
            c0Var.f30775a.a((String) obj, i5);
        } else {
            c0Var.f30775a.a(i5, (s) obj);
        }
    }

    public final void a(Object obj, int i5, s2 s2Var) {
        if ((536870912 & i5) != 0) {
            s2Var.b(this.f30831m.b(obj, i5 & 1048575));
        } else {
            s2Var.q(this.f30831m.b(obj, i5 & 1048575));
        }
    }

    public final void a(Object obj, int i5, s2 s2Var, t2 t2Var, h0 h0Var) {
        s2Var.b(this.f30831m.b(obj, i5 & 1048575), t2Var, h0Var);
    }

    public final void a(Object obj, long j11, s2 s2Var, t2 t2Var, h0 h0Var) {
        s2Var.a(this.f30831m.b(obj, j11), t2Var, h0Var);
    }

    public final boolean a(int i5, Object obj) {
        int[] iArr = this.f30819a;
        int i11 = iArr[i5 + 2];
        long j11 = i11 & 1048575;
        if (j11 != 1048575) {
            return ((1 << (i11 >>> 20)) & x3.c(obj, j11)) != 0;
        }
        int i12 = iArr[i5 + 1];
        long j12 = i12 & 1048575;
        switch ((i12 & 267386880) >>> 20) {
            case 0:
                return x3.f30955c.c(obj, j12) != 0.0d;
            case 1:
                return x3.f30955c.d(obj, j12) != 0.0f;
            case 2:
                return x3.d(obj, j12) != 0;
            case 3:
                return x3.d(obj, j12) != 0;
            case 4:
                return x3.c(obj, j12) != 0;
            case 5:
                return x3.d(obj, j12) != 0;
            case 6:
                return x3.c(obj, j12) != 0;
            case 7:
                return x3.f30955c.a(obj, j12);
            case 8:
                Object objE = x3.e(obj, j12);
                if (objE instanceof String) {
                    return !((String) objE).isEmpty();
                }
                if (objE instanceof s) {
                    return !s.f30889b.equals(objE);
                }
                throw new IllegalArgumentException();
            case 9:
                return x3.e(obj, j12) != null;
            case 10:
                return !s.f30889b.equals(x3.e(obj, j12));
            case 11:
                return x3.c(obj, j12) != 0;
            case 12:
                return x3.c(obj, j12) != 0;
            case 13:
                return x3.c(obj, j12) != 0;
            case 14:
                return x3.d(obj, j12) != 0;
            case 15:
                return x3.c(obj, j12) != 0;
            case 16:
                return x3.d(obj, j12) != 0;
            case 17:
                return x3.e(obj, j12) != null;
            default:
                throw new IllegalArgumentException();
        }
    }

    public final boolean a(Object obj, int i5, int i11) {
        return x3.c(obj, (long) (this.f30819a[i11 + 2] & 1048575)) == i5;
    }

    public final boolean a(int i5, Object obj, Object obj2) {
        return a(i5, obj) == a(i5, obj2);
    }

    public final int a(int i5, int i11) {
        int length = (this.f30819a.length / 3) - 1;
        while (i11 <= length) {
            int i12 = (length + i11) >>> 1;
            int i13 = i12 * 3;
            int i14 = this.f30819a[i13];
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
}
