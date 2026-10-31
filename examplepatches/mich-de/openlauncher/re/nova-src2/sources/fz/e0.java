package fz;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import com.vungle.ads.internal.protos.Sdk;
import e10.z2;
import h6.c1;
import java.nio.ByteBuffer;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.Unit;
import kotlin.internal.ProgressionUtilKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.ranges.IntProgression;

/* loaded from: classes.dex */
public abstract class e0 {
    /* JADX WARN: Removed duplicated region for block: B:13:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x03eb  */
    /* JADX WARN: Removed duplicated region for block: B:186:0x03f9  */
    /* JADX WARN: Removed duplicated region for block: B:192:0x040e  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x0412  */
    /* JADX WARN: Removed duplicated region for block: B:200:0x0432  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x043a  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x0462  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0062 A[PHI: r6
      0x0062: PHI (r6v5 int) = (r6v3 int), (r6v1 int) binds: [B:28:0x0074, B:20:0x005f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:236:0x04c4  */
    /* JADX WARN: Removed duplicated region for block: B:260:0x051a  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x051c  */
    /* JADX WARN: Removed duplicated region for block: B:264:0x052d  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0531  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x0536  */
    /* JADX WARN: Removed duplicated region for block: B:270:0x053b  */
    /* JADX WARN: Removed duplicated region for block: B:277:0x055b  */
    /* JADX WARN: Removed duplicated region for block: B:343:0x0638  */
    /* JADX WARN: Removed duplicated region for block: B:349:0x0643  */
    /* JADX WARN: Removed duplicated region for block: B:352:0x0655  */
    /* JADX WARN: Removed duplicated region for block: B:365:0x06b7  */
    /* JADX WARN: Removed duplicated region for block: B:377:0x06e2  */
    /* JADX WARN: Removed duplicated region for block: B:400:0x078d  */
    /* JADX WARN: Removed duplicated region for block: B:406:0x07c9  */
    /* JADX WARN: Removed duplicated region for block: B:411:0x07d5  */
    /* JADX WARN: Removed duplicated region for block: B:419:0x07e8  */
    /* JADX WARN: Removed duplicated region for block: B:423:0x07f5  */
    /* JADX WARN: Removed duplicated region for block: B:469:0x08d2  */
    /* JADX WARN: Removed duplicated region for block: B:475:0x08ed  */
    /* JADX WARN: Removed duplicated region for block: B:482:0x08fe  */
    /* JADX WARN: Removed duplicated region for block: B:485:0x0905  */
    /* JADX WARN: Removed duplicated region for block: B:488:0x090e  */
    /* JADX WARN: Removed duplicated region for block: B:500:0x0977  */
    /* JADX WARN: Removed duplicated region for block: B:532:0x03f4 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:541:0x04b0 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:546:0x0510 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:553:0x07b4 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:558:0x08e3 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static v a(Drawable drawable, int i5, byte[] bArr, Bitmap bitmap, Canvas canvas) {
        int height;
        Bitmap bitmapY;
        int width;
        int i11;
        boolean z11;
        int i12;
        cz.g gVar;
        int i13;
        cz.g gVar2;
        int i14;
        cz.g gVar3;
        cz.g gVar4;
        cz.g gVar5;
        int i15;
        cz.g gVar6;
        cz.g gVar7;
        cz.g gVar8;
        cz.g gVar9;
        cz.g gVar10;
        boolean z12;
        Bitmap bitmap2;
        int i16;
        boolean z13;
        int length;
        int i17;
        boolean z14;
        int i18;
        boolean z15;
        boolean z16;
        o0 o0Var;
        d dVar;
        float f11;
        d dVar2;
        int i19;
        float fMax;
        float f12;
        float f13;
        float f14;
        float f15;
        float f16;
        float fMin;
        o0 o0Var2;
        float f17;
        cz.g gVar11;
        float f18;
        cz.g gVar12;
        o0 o0Var3;
        boolean z17;
        boolean z18;
        boolean z19;
        float f19;
        d dVar3;
        float f21;
        float fMin2;
        float f22;
        Bitmap bitmapCreateScaledBitmap;
        cz.g gVar13;
        cz.g gVar14;
        cz.g gVar15;
        cz.g gVar16;
        boolean z21;
        cz.g gVar17;
        cz.g gVar18;
        float f23;
        float f24;
        boolean z22;
        float f25;
        float[] fArr;
        boolean z23;
        boolean z24;
        boolean z25;
        byte b11;
        cz.g gVar19;
        o0 o0Var4;
        int i21;
        byte b12;
        int i22;
        byte b13;
        int i23;
        int i24;
        byte b14;
        int i25;
        byte b15;
        byte b16;
        byte b17;
        byte b18;
        byte b19;
        int i26 = i5;
        if (drawable instanceof AdaptiveIconDrawable) {
            return v.f56366j;
        }
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        byteBufferWrap.rewind();
        if (z2.Y(drawable) != null) {
            Bitmap bitmapY2 = z2.Y(drawable);
            Intrinsics.d(bitmapY2);
            if (bitmapY2.getByteCount() <= bArr.length) {
                Bitmap bitmapY3 = z2.Y(drawable);
                Intrinsics.d(bitmapY3);
                if (bitmapY3.getConfig() == Bitmap.Config.ARGB_8888) {
                    bitmapY = z2.Y(drawable);
                    Intrinsics.d(bitmapY);
                    width = bitmapY.getWidth();
                    height = bitmapY.getHeight();
                } else {
                    if (bitmap == null || canvas == null) {
                        throw new IllegalStateException("Passed too small of pixelBuffer without a backup mask bitmap/canvas");
                    }
                    int intrinsicWidth = drawable.getIntrinsicWidth();
                    int intrinsicHeight = drawable.getIntrinsicHeight();
                    if (intrinsicWidth <= 0 || intrinsicHeight <= 0) {
                        if (intrinsicWidth <= 0 || intrinsicWidth > i26) {
                            intrinsicWidth = i26;
                        }
                        if (intrinsicHeight > 0 && intrinsicHeight <= i26) {
                            i26 = intrinsicHeight;
                        }
                        bitmap.eraseColor(0);
                        drawable.setBounds(0, 0, intrinsicWidth, i26);
                        drawable.draw(canvas);
                        height = i26;
                        bitmapY = bitmap;
                        width = intrinsicWidth;
                    } else {
                        if (intrinsicWidth > i26 || intrinsicHeight > i26) {
                            int iMax = Math.max(intrinsicWidth, intrinsicHeight);
                            intrinsicWidth = (intrinsicWidth * i26) / iMax;
                            i26 = (i26 * intrinsicHeight) / iMax;
                        }
                        bitmap.eraseColor(0);
                        drawable.setBounds(0, 0, intrinsicWidth, i26);
                        drawable.draw(canvas);
                        height = i26;
                        bitmapY = bitmap;
                        width = intrinsicWidth;
                    }
                }
            }
        }
        bitmapY.copyPixelsToBuffer(byteBufferWrap);
        boolean z26 = true;
        boolean z27 = bitmapY.getConfig() != Bitmap.Config.ARGB_8888;
        int iMin = Math.min(width, height);
        if (iMin < 9) {
            return v.f56366j;
        }
        int i27 = iMin / 2;
        int i28 = i27;
        int i29 = 0;
        while (true) {
            if (i29 >= i27) {
                i29 = i27;
                break;
            }
            if (z27) {
                b19 = bArr[c1.i(bitmapY, i29, i27)];
                UByte.Companion companion = UByte.f71693b;
            } else {
                b19 = bArr[c1.i(bitmapY, i29, ((i27 + 1) * 4) - 1)];
                UByte.Companion companion2 = UByte.f71693b;
            }
            int i31 = b19 & 255;
            UInt.Companion companion3 = UInt.f71696b;
            if (Integer.compareUnsigned(i31, 0) > 0 && i29 < i28) {
                i28 = i29;
            }
            if (Intrinsics.h(i31, 160) > 0) {
                break;
            }
            i29++;
        }
        int i32 = iMin - 1;
        if (i27 <= i32) {
            i11 = i32;
            while (true) {
                if (z27) {
                    b18 = bArr[c1.i(bitmapY, i11, i27)];
                    UByte.Companion companion4 = UByte.f71693b;
                } else {
                    b18 = bArr[c1.i(bitmapY, i11, ((i27 + 1) * 4) - 1)];
                    UByte.Companion companion5 = UByte.f71693b;
                }
                if (Intrinsics.h(b18 & 255, 160) > 0) {
                    break;
                }
                if (i11 == i27) {
                    break;
                }
                i11--;
            }
            i11 = i27;
        } else {
            i11 = i27;
        }
        int i33 = 0;
        while (true) {
            if (i33 >= i27) {
                z11 = z26;
                i33 = i27;
                break;
            }
            if (z27) {
                z11 = z26;
                b17 = bArr[c1.i(bitmapY, i27, i33)];
                UByte.Companion companion6 = UByte.f71693b;
            } else {
                z11 = z26;
                b17 = bArr[c1.i(bitmapY, i27, ((i33 + 1) * 4) - 1)];
                UByte.Companion companion7 = UByte.f71693b;
            }
            if (Intrinsics.h(b17 & 255, 160) > 0) {
                break;
            }
            i33++;
            z26 = z11;
        }
        if (i27 <= i32) {
            i12 = i32;
            while (true) {
                if (z27) {
                    b16 = bArr[c1.i(bitmapY, i27, i12)];
                    UByte.Companion companion8 = UByte.f71693b;
                } else {
                    b16 = bArr[c1.i(bitmapY, i27, ((i12 + 1) * 4) - 1)];
                    UByte.Companion companion9 = UByte.f71693b;
                }
                if (Intrinsics.h(b16 & 255, 160) > 0) {
                    break;
                }
                if (i12 == i27) {
                    break;
                }
                i12--;
            }
            i12 = i27;
        } else {
            i12 = i27;
        }
        int i34 = (i32 - i12) - i33;
        int i35 = (i32 - i11) - i29;
        float fMax2 = Math.max(1.0f, i27 / (i27 - i28));
        o0 o0Var5 = new o0(iMin);
        o0 o0Var6 = new o0(iMin);
        o0 o0Var7 = new o0(iMin);
        o0 o0Var8 = new o0(iMin);
        int i36 = iMin / 4;
        int i37 = iMin - i36;
        boolean z28 = z27;
        int i38 = 0;
        while (true) {
            gVar = o0Var5.f56319c;
            i13 = i34;
            gVar2 = o0Var5.f56318b;
            i14 = i35;
            gVar3 = o0Var7.f56319c;
            gVar4 = o0Var7.f56318b;
            if (i38 >= iMin) {
                break;
            }
            ((float[]) gVar2.f48614c)[i38] = 1.0f;
            ((float[]) gVar.f48614c)[i38] = 1.0f;
            IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, i27), 2);
            int i39 = intProgressionL0.f71906a;
            float f26 = fMax2;
            int i40 = intProgressionL0.f71907b;
            int i41 = intProgressionL0.f71908c;
            if ((i41 > 0 && i39 <= i40) || (i41 < 0 && i40 <= i39)) {
                while (true) {
                    if (z28) {
                        i25 = i41;
                        b15 = bArr[c1.i(bitmapY, i38, i39)];
                        UByte.Companion companion10 = UByte.f71693b;
                    } else {
                        i25 = i41;
                        b15 = bArr[c1.i(bitmapY, i38, ((i39 + 1) * 4) - 1)];
                        UByte.Companion companion11 = UByte.f71693b;
                    }
                    i23 = width;
                    i24 = i27;
                    if (Intrinsics.h(b15 & 255, 160) > 0) {
                        o0Var5.c(b15, i39, i38, z11);
                        break;
                    }
                    if (i39 == i40) {
                        break;
                    }
                    i39 += i25;
                    i41 = i25;
                    width = i23;
                    i27 = i24;
                    z11 = true;
                }
            } else {
                i23 = width;
                i24 = i27;
            }
            ((float[]) gVar4.f48614c)[i38] = 1.0f;
            ((float[]) gVar3.f48614c)[i38] = 1.0f;
            int iA = ProgressionUtilKt.a(i32, i24 + 1, -2);
            if (iA <= i32) {
                int i42 = i32;
                while (true) {
                    if (z28) {
                        b14 = bArr[c1.i(bitmapY, i38, i42)];
                        UByte.Companion companion12 = UByte.f71693b;
                    } else {
                        b14 = bArr[c1.i(bitmapY, i38, ((i42 + 1) * 4) - 1)];
                        UByte.Companion companion13 = UByte.f71693b;
                    }
                    if (Intrinsics.h(b14 & 255, 160) > 0) {
                        o0Var7.c(b14, i42, i38, true);
                        break;
                    }
                    if (i42 != iA) {
                        i42 -= 2;
                    }
                }
            }
            i38++;
            i34 = i13;
            i35 = i14;
            fMax2 = f26;
            width = i23;
            i27 = i24;
            z11 = true;
        }
        int i43 = width;
        int i44 = i27;
        float f27 = fMax2;
        int iB = MathKt.b(height * 0.01f);
        int i45 = 0;
        int i46 = 0;
        while (true) {
            gVar5 = o0Var6.f56319c;
            i15 = height;
            gVar6 = o0Var6.f56318b;
            gVar7 = gVar3;
            gVar8 = o0Var8.f56319c;
            gVar9 = gVar;
            gVar10 = o0Var8.f56318b;
            if (i45 >= iMin) {
                break;
            }
            ((float[]) gVar6.f48614c)[i45] = 1.3f;
            ((float[]) gVar5.f48614c)[i45] = 1.3f;
            int i47 = i44;
            cz.g gVar20 = gVar4;
            IntProgression intProgressionL02 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, i47), 2);
            int i48 = intProgressionL02.f71906a;
            int i49 = intProgressionL02.f71907b;
            int i51 = intProgressionL02.f71908c;
            if ((i51 > 0 && i48 <= i49) || (i51 < 0 && i49 <= i48)) {
                while (true) {
                    if (z28) {
                        i22 = i51;
                        b13 = bArr[c1.i(bitmapY, i48, i45)];
                        UByte.Companion companion14 = UByte.f71693b;
                    } else {
                        i22 = i51;
                        b13 = bArr[c1.i(bitmapY, i48, ((i45 + 1) * 4) - 1)];
                        UByte.Companion companion15 = UByte.f71693b;
                    }
                    gVar19 = gVar2;
                    o0Var4 = o0Var7;
                    if (Intrinsics.h(b13 & 255, 160) > 0) {
                        o0Var6.c(b13, i45, i48, false);
                        break;
                    }
                    if (i48 == i49) {
                        break;
                    }
                    i48 += i22;
                    gVar2 = gVar19;
                    o0Var7 = o0Var4;
                    i51 = i22;
                }
            } else {
                gVar19 = gVar2;
                o0Var4 = o0Var7;
            }
            ((float[]) gVar10.f48614c)[i45] = 1.3f;
            ((float[]) gVar8.f48614c)[i45] = 1.3f;
            int iA2 = ProgressionUtilKt.a(i32, i47 + 1, -2);
            if (iA2 <= i32) {
                int i52 = i32;
                byte b21 = 0;
                i21 = 0;
                while (true) {
                    if (z28) {
                        b12 = bArr[c1.i(bitmapY, i52, i45)];
                        UByte.Companion companion16 = UByte.f71693b;
                    } else {
                        b12 = bArr[c1.i(bitmapY, i52, ((i45 + 1) * 4) - 1)];
                        UByte.Companion companion17 = UByte.f71693b;
                    }
                    int i53 = b12 & 255;
                    if (Intrinsics.h(i53, 160) > 0) {
                        o0Var8.c(b12, i45, i52, false);
                        break;
                    }
                    if (Intrinsics.h(i53, ((byte) 10) & 255) > 0 && Intrinsics.h(i53, b21 & 255) > 0) {
                        i21++;
                    }
                    if (i52 == iA2) {
                        break;
                    }
                    i52 -= 2;
                    b21 = b12;
                }
            } else {
                i21 = 0;
            }
            if (i21 > iB) {
                i46++;
            }
            i45++;
            gVar4 = gVar20;
            height = i15;
            gVar3 = gVar7;
            gVar = gVar9;
            i44 = i47;
            gVar2 = gVar19;
            o0Var7 = o0Var4;
        }
        cz.g gVar21 = gVar2;
        o0 o0Var9 = o0Var7;
        int i54 = i44;
        cz.g gVar22 = gVar4;
        int i55 = i43;
        boolean z29 = ((float) i46) / ((float) i55) > 0.65f;
        boolean z31 = !z29;
        if (z29) {
            z12 = z29;
            bitmap2 = bitmapY;
        } else {
            int i56 = 0;
            int i57 = 0;
            for (int i58 = 0; i58 < iMin; i58++) {
                int i59 = 0;
                while (i59 < iMin) {
                    if (z28) {
                        z25 = z29;
                        b11 = bArr[c1.i(bitmapY, i59, i58)];
                        UByte.Companion companion18 = UByte.f71693b;
                    } else {
                        z25 = z29;
                        b11 = bArr[c1.i(bitmapY, i59, ((i58 + 1) * 4) - 1)];
                        UByte.Companion companion19 = UByte.f71693b;
                    }
                    int i61 = b11 & 255;
                    UInt.Companion companion20 = UInt.f71696b;
                    Bitmap bitmap3 = bitmapY;
                    if (Integer.compareUnsigned(i61, 0) > 0) {
                        i57 += i61;
                        i56++;
                    }
                    i59++;
                    z29 = z25;
                    bitmapY = bitmap3;
                }
            }
            z12 = z29;
            bitmap2 = bitmapY;
            if (i56 > 0) {
                UInt.Companion companion21 = UInt.f71696b;
                if (Integer.compareUnsigned(Integer.divideUnsigned(i57, i56), Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE) < 0) {
                    i16 = i36;
                    z31 = false;
                    z13 = false;
                }
            }
            int iMax2 = Math.max((iMin / 100) + 1, 1);
            int[] iArr = o0Var5.f56325i;
            length = iArr.length - 1;
            i17 = 1;
            while (true) {
                if (i17 < length) {
                    z14 = true;
                    break;
                }
                if (iArr[i17] > iMax2) {
                    z14 = false;
                    break;
                }
                i17++;
            }
            int[] iArr2 = o0Var6.f56325i;
            if (!z14) {
                int length2 = iArr2.length - 1;
                i18 = i16;
                int i62 = 1;
                while (true) {
                    if (i62 >= length2) {
                        break;
                    }
                    int i63 = i62;
                    if (iArr2[i63] > iMax2) {
                        z14 = false;
                        break;
                    }
                    i62 = i63 + 1;
                }
            } else {
                i18 = i16;
            }
            if (!z14) {
                o0Var = o0Var9;
                int[] iArr3 = o0Var.f56325i;
                z15 = z31;
                int length3 = iArr3.length - 1;
                z16 = z14;
                int i64 = 1;
                while (true) {
                    if (i64 >= length3) {
                        break;
                    }
                    int i65 = length3;
                    if (iMin - iArr3[i64] > iMax2) {
                        z16 = false;
                        break;
                    }
                    i64++;
                    length3 = i65;
                }
            } else {
                z15 = z31;
                z16 = z14;
                o0Var = o0Var9;
            }
            if (z16) {
                int[] iArr4 = o0Var8.f56325i;
                int length4 = iArr4.length - 1;
                int i66 = 1;
                while (true) {
                    if (i66 >= length4) {
                        break;
                    }
                    int[] iArr5 = iArr4;
                    if (iMin - iArr4[i66] > iMax2) {
                        z16 = false;
                        break;
                    }
                    i66++;
                    iArr4 = iArr5;
                }
            }
            int i67 = (iMin * Sdk.SDKError.Reason.TPAT_ERROR_VALUE) / 192;
            dVar = d.f56189j;
            f11 = 1.0f;
            while (true) {
                if (f11 > 0.5f) {
                    dVar2 = dVar;
                    i19 = i55;
                    f11 = 0.5f;
                    break;
                }
                int iE = o0Var5.f56320d.e(f11);
                dVar2 = dVar;
                int iE2 = o0Var6.f56320d.e(f11);
                i19 = i55;
                int iE3 = o0Var.f56320d.e(f11);
                int iE4 = o0Var8.f56320d.e(f11);
                boolean z32 = iE >= i67;
                boolean z33 = iE2 >= i67;
                int i68 = i67 * 2;
                boolean z34 = iE3 + iE >= i68;
                boolean z35 = iE4 + iE2 >= i68;
                if (z32 && z33 && z34 && z35) {
                    break;
                }
                f11 -= 0.01f;
                dVar = dVar2;
                i55 = i19;
            }
            Unit unit = Unit.f71706a;
            fMax = Math.max(0.5f, f11);
            f12 = 1.0f;
            while (true) {
                if (f12 > fMax) {
                    f13 = fMax;
                    f12 = 0.5f;
                    break;
                }
                int iE5 = o0Var5.f56321e.e(f12);
                int iE6 = o0Var6.f56321e.e(f12);
                f13 = fMax;
                int iE7 = o0Var.f56321e.e(f12);
                int iE8 = o0Var8.f56321e.e(f12);
                boolean z36 = iE5 >= i67;
                boolean z37 = iE6 >= i67;
                int i69 = i67 * 2;
                boolean z38 = iE7 + iE5 >= i69;
                boolean z39 = iE8 + iE6 >= i69;
                if (z36 && z37 && z38 && z39) {
                    break;
                }
                f12 -= 0.01f;
                fMax = f13;
            }
            Unit unit2 = Unit.f71706a;
            f14 = f12 <= f13 ? f12 : f13;
            float f28 = Math.max(Math.abs(i13), Math.abs(i14)) < 1 ? 0.0062f : 0.0f;
            if (iMin <= 125) {
                f16 = 0.015f;
            } else {
                if (iMin <= 119) {
                    f15 = 0.02f;
                    fMin = Math.min(1.1f, f27);
                    while (true) {
                        if (fMin <= f14) {
                            o0Var2 = o0Var;
                            f17 = f15;
                            gVar11 = gVar5;
                            f18 = f14;
                            gVar12 = gVar8;
                            o0Var3 = o0Var6;
                            z17 = false;
                            z18 = false;
                            z19 = false;
                            f19 = 0.5f;
                            break;
                        }
                        f17 = f15;
                        gVar17 = gVar21;
                        f18 = f14;
                        int iE9 = gVar17.e(fMin);
                        gVar12 = gVar8;
                        int iE10 = gVar6.e(fMin);
                        gVar11 = gVar5;
                        gVar18 = gVar22;
                        int iE11 = gVar18.e(fMin);
                        int iE12 = gVar10.e(fMin);
                        boolean z41 = iE9 >= i67;
                        boolean z42 = iE10 >= i67;
                        int i71 = i67 * 2;
                        boolean z43 = iE11 + iE9 >= i71;
                        boolean z44 = iE12 + iE10 >= i71;
                        if (z41 && z42 && z43 && z44) {
                            float f29 = iMin > 145 ? 0.04f : iMin > 139 ? 0.042f : iMin > 112 ? 0.044f : iMin > 106 ? 0.048f : iMin > 99 ? 0.05f : iMin > 92 ? 0.054f : 0.062f;
                            if (iMin > 158) {
                                f23 = 0.057f;
                            } else if (iMin > 152) {
                                f23 = 0.06f;
                            } else if (iMin > 145) {
                                f24 = f29;
                                z22 = true;
                                f25 = 0.062f;
                                int iA3 = o0Var5.a(z22);
                                float f31 = fMin;
                                int iA4 = o0Var6.a(z22);
                                o0Var3 = o0Var6;
                                int iA5 = o0Var.a(false);
                                o0Var2 = o0Var;
                                int iA6 = o0Var8.a(false);
                                boolean z45 = iA3 != 1 && iA4 == 1 && iA5 == 1 && iA6 == 1;
                                boolean z46 = (iA3 != 0 || iA4 == 0 || iA5 == 0 || iA6 == 0) ? false : true;
                                fArr = (float[]) gVar6.f48614c;
                                if (Math.abs(fArr[i18] - fArr[i37]) > f24) {
                                    float[] fArr2 = (float[]) gVar10.f48614c;
                                    if (Math.abs(fArr2[i18] - fArr2[i37]) > f24 || Math.abs(((float[]) gVar17.f48614c)[i18] - ((float[]) gVar18.f48614c)[i18]) > f24 || Math.abs(((float[]) gVar17.f48614c)[i37] - ((float[]) gVar18.f48614c)[i37]) > f24) {
                                        z23 = false;
                                        boolean z47 = !z45 && z23 && gVar17.f48613b - gVar17.f48612a < f25 && gVar18.f48613b - gVar18.f48612a < f25 && gVar6.f48613b - gVar6.f48612a < f25 && gVar10.f48613b - gVar10.f48612a < f25;
                                        float f32 = iMin / 52.5f;
                                        if (z46 || !z23 || f31 >= 0.91f || Math.abs((iArr[0] / 2.0f) - iArr[1]) > f32 || Math.abs((iArr[iArr.length - 1] / 2.0f) - iArr[iArr.length - 2]) > f32) {
                                            z17 = false;
                                        } else {
                                            z17 = false;
                                            if (Math.abs((iArr2[0] / 2.0f) - iArr2[1]) <= f32 && Math.abs((iArr2[iArr2.length - 1] / 2.0f) - iArr2[iArr2.length - 2]) <= f32 && Math.abs((gVar17.f48613b - gVar17.f48612a) - 0.097f) <= 0.08f && Math.abs((gVar6.f48613b - gVar6.f48612a) - 0.097f) <= 0.08f && Math.abs((gVar18.f48613b - gVar18.f48612a) - 0.097f) <= 0.08f && Math.abs((gVar10.f48613b - gVar10.f48612a) - 0.097f) <= 0.08f) {
                                                z24 = true;
                                            }
                                            z18 = z24;
                                            z19 = z47;
                                            f19 = f31;
                                        }
                                        z24 = z17;
                                        z18 = z24;
                                        z19 = z47;
                                        f19 = f31;
                                    } else {
                                        float[] fArr3 = (float[]) gVar17.f48614c;
                                        float f33 = fArr3[i54];
                                        if (f33 + f17 > fArr3[i18]) {
                                            float[] fArr4 = (float[]) gVar18.f48614c;
                                            float f34 = fArr4[i54];
                                            if (f34 + f17 > fArr4[i18] && Math.abs(f33 - f34) <= f24) {
                                                z23 = true;
                                            }
                                            if (z45) {
                                                float f322 = iMin / 52.5f;
                                                if (z46) {
                                                    z17 = false;
                                                    z24 = z17;
                                                    z18 = z24;
                                                    z19 = z47;
                                                    f19 = f31;
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                f23 = iMin > 132 ? 0.064f : iMin > 112 ? 0.067f : iMin > 106 ? 0.076f : iMin > 92 ? 0.083f : 0.1f;
                            }
                            f24 = f29;
                            f25 = f23;
                            z22 = true;
                            int iA32 = o0Var5.a(z22);
                            float f312 = fMin;
                            int iA42 = o0Var6.a(z22);
                            o0Var3 = o0Var6;
                            int iA52 = o0Var.a(false);
                            o0Var2 = o0Var;
                            int iA62 = o0Var8.a(false);
                            if (iA32 != 1) {
                                if (iA32 != 0) {
                                    fArr = (float[]) gVar6.f48614c;
                                    if (Math.abs(fArr[i18] - fArr[i37]) > f24) {
                                    }
                                }
                            }
                        } else {
                            fMin -= 0.01f;
                            gVar22 = gVar18;
                            f14 = f18;
                            gVar8 = gVar12;
                            gVar5 = gVar11;
                            o0Var6 = o0Var6;
                            o0Var = o0Var;
                            gVar21 = gVar17;
                            f15 = f17;
                        }
                    }
                    if (!z19 && f19 > 1.0f) {
                        f19 = 1.0f;
                    }
                    Unit unit3 = Unit.f71706a;
                    if (f19 >= f18) {
                        dVar3 = z19 ? d.f56191l : z18 ? d.f56194q : d.n;
                        f21 = f19;
                    } else {
                        dVar3 = dVar2;
                        f21 = f18;
                    }
                    fMin2 = Math.min(1.1f, f27);
                    while (true) {
                        if (fMin2 <= f21) {
                            f22 = 0.5f;
                            break;
                        }
                        gVar13 = gVar9;
                        int iE13 = gVar13.e(fMin2);
                        gVar14 = gVar11;
                        int iE14 = gVar14.e(fMin2);
                        gVar15 = gVar7;
                        int iE15 = gVar15.e(fMin2);
                        gVar16 = gVar12;
                        int iE16 = gVar16.e(fMin2);
                        boolean z48 = iE13 >= i67 ? true : z17;
                        boolean z49 = iE14 >= i67 ? true : z17;
                        int i72 = iE15 + iE13;
                        int i73 = i67 * 2;
                        boolean z50 = i72 >= i73 ? true : z17;
                        boolean z51 = iE16 + iE14 >= i73 ? true : z17;
                        if (!z48 || !z49 || !z50 || !z51) {
                            fMin2 -= 0.01f;
                            gVar9 = gVar13;
                            gVar11 = gVar14;
                            gVar7 = gVar15;
                            gVar12 = gVar16;
                        } else if (gVar13.f48613b - gVar13.f48612a >= 0.05f || gVar15.f48613b - gVar15.f48612a >= 0.05f || gVar14.f48613b - gVar14.f48612a >= 0.05f || gVar16.f48613b - gVar16.f48612a >= 0.05f || !o0Var5.b() || !o0Var3.b() || !o0Var2.b() || !o0Var8.b()) {
                            z21 = z17;
                            f22 = fMin2;
                            z19 = z21;
                        } else {
                            float[] fArr5 = (float[]) gVar13.f48614c;
                            if (Math.abs(fArr5[i18] - fArr5[i37]) <= 0.04f) {
                                float[] fArr6 = (float[]) gVar15.f48614c;
                                if (Math.abs(fArr6[i18] - fArr6[i37]) <= 0.04f && Math.abs(((float[]) gVar13.f48614c)[i18] - ((float[]) gVar15.f48614c)[i18]) <= 0.04f && Math.abs(((float[]) gVar13.f48614c)[i37] - ((float[]) gVar15.f48614c)[i37]) <= 0.04f && Math.abs(((float[]) gVar13.f48614c)[i54] - ((float[]) gVar15.f48614c)[i54]) <= 0.04f) {
                                    z21 = true;
                                }
                                f22 = fMin2;
                                z19 = z21;
                            }
                        }
                    }
                    Unit unit4 = Unit.f71706a;
                    if (f22 > f21 + f17) {
                        dVar3 = z19 ? d.o : d.n;
                        f21 = f22;
                    }
                    float f35 = (f21 < 0.98f || f21 >= 1.0f) ? f21 : 1.0f;
                    if (!Intrinsics.b(dVar3, d.o)) {
                        return new v(f35, iMin, i13, i14, dVar3, z15, z13, z16, 128);
                    }
                    if (bitmap2.getConfig() == Bitmap.Config.ARGB_8888) {
                        bitmapCreateScaledBitmap = bitmap2;
                    } else {
                        int i74 = i19;
                        Bitmap bitmapA = z2.A(drawable, i74, i15);
                        bitmapCreateScaledBitmap = (bitmapA.getWidth() == i74 && bitmapA.getHeight() == i15) ? bitmapA : Bitmap.createScaledBitmap(bitmapA, i74, i15, true);
                    }
                    Point point = o0Var5.f56323g;
                    int pixel = bitmapCreateScaledBitmap.getPixel(point.x, point.y);
                    Point point2 = o0Var5.f56324h;
                    int pixel2 = bitmapCreateScaledBitmap.getPixel(point2.x, point2.y);
                    o0 o0Var10 = o0Var2;
                    Point point3 = o0Var10.f56323g;
                    int pixel3 = bitmapCreateScaledBitmap.getPixel(point3.x, point3.y);
                    Point point4 = o0Var10.f56324h;
                    return new v(f35, iMin, i13, i14, dVar3, z15, z13, new f(pixel, pixel2, pixel3, bitmapCreateScaledBitmap.getPixel(point4.x, point4.y)), z16);
                }
                f16 = 0.018f;
            }
            f15 = f28 + f16;
            fMin = Math.min(1.1f, f27);
            while (true) {
                if (fMin <= f14) {
                }
                fMin -= 0.01f;
                gVar22 = gVar18;
                f14 = f18;
                gVar8 = gVar12;
                gVar5 = gVar11;
                o0Var6 = o0Var6;
                o0Var = o0Var;
                gVar21 = gVar17;
                f15 = f17;
            }
            if (!z19) {
                f19 = 1.0f;
            }
            Unit unit32 = Unit.f71706a;
            if (f19 >= f18) {
            }
            fMin2 = Math.min(1.1f, f27);
            while (true) {
                if (fMin2 <= f21) {
                }
                fMin2 -= 0.01f;
                gVar9 = gVar13;
                gVar11 = gVar14;
                gVar7 = gVar15;
                gVar12 = gVar16;
            }
            Unit unit42 = Unit.f71706a;
            if (f22 > f21 + f17) {
            }
            if (f21 < 0.98f) {
            }
            if (!Intrinsics.b(dVar3, d.o)) {
            }
        }
        i16 = i36;
        z13 = z12;
        int iMax22 = Math.max((iMin / 100) + 1, 1);
        int[] iArr6 = o0Var5.f56325i;
        length = iArr6.length - 1;
        i17 = 1;
        while (true) {
            if (i17 < length) {
            }
            i17++;
        }
        int[] iArr22 = o0Var6.f56325i;
        if (!z14) {
        }
        if (!z14) {
        }
        if (z16) {
        }
        int i672 = (iMin * Sdk.SDKError.Reason.TPAT_ERROR_VALUE) / 192;
        dVar = d.f56189j;
        f11 = 1.0f;
        while (true) {
            if (f11 > 0.5f) {
            }
            f11 -= 0.01f;
            dVar = dVar2;
            i55 = i19;
        }
        Unit unit5 = Unit.f71706a;
        fMax = Math.max(0.5f, f11);
        f12 = 1.0f;
        while (true) {
            if (f12 > fMax) {
            }
            f12 -= 0.01f;
            fMax = f13;
        }
        Unit unit22 = Unit.f71706a;
        if (f12 <= f13) {
        }
        if (Math.max(Math.abs(i13), Math.abs(i14)) < 1) {
        }
        if (iMin <= 125) {
        }
        f15 = f28 + f16;
        fMin = Math.min(1.1f, f27);
        while (true) {
            if (fMin <= f14) {
            }
            fMin -= 0.01f;
            gVar22 = gVar18;
            f14 = f18;
            gVar8 = gVar12;
            gVar5 = gVar11;
            o0Var6 = o0Var6;
            o0Var = o0Var;
            gVar21 = gVar17;
            f15 = f17;
        }
        if (!z19) {
        }
        Unit unit322 = Unit.f71706a;
        if (f19 >= f18) {
        }
        fMin2 = Math.min(1.1f, f27);
        while (true) {
            if (fMin2 <= f21) {
            }
            fMin2 -= 0.01f;
            gVar9 = gVar13;
            gVar11 = gVar14;
            gVar7 = gVar15;
            gVar12 = gVar16;
        }
        Unit unit422 = Unit.f71706a;
        if (f22 > f21 + f17) {
        }
        if (f21 < 0.98f) {
        }
        if (!Intrinsics.b(dVar3, d.o)) {
        }
    }
}
