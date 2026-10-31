package lf;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import com.vungle.ads.internal.protos.Sdk;
import ke.x;
import l60.i;
import wf.v;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: h, reason: collision with root package name */
    public static final byte[] f74911h = {0, 7, 8, 15};

    /* renamed from: i, reason: collision with root package name */
    public static final byte[] f74912i = {0, 119, -120, -1};

    /* renamed from: j, reason: collision with root package name */
    public static final byte[] f74913j = {0, 17, 34, 51, 68, 85, 102, 119, -120, -103, -86, -69, -52, -35, -18, -1};

    /* renamed from: a, reason: collision with root package name */
    public final Paint f74914a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f74915b;

    /* renamed from: c, reason: collision with root package name */
    public final Canvas f74916c;

    /* renamed from: d, reason: collision with root package name */
    public final i f74917d;

    /* renamed from: e, reason: collision with root package name */
    public final b f74918e;

    /* renamed from: f, reason: collision with root package name */
    public final g f74919f;

    /* renamed from: g, reason: collision with root package name */
    public Bitmap f74920g;

    public h(int i5, int i11) {
        Paint paint = new Paint();
        this.f74914a = paint;
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC));
        paint.setPathEffect(null);
        Paint paint2 = new Paint();
        this.f74915b = paint2;
        paint2.setStyle(Paint.Style.FILL);
        paint2.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OVER));
        paint2.setPathEffect(null);
        this.f74916c = new Canvas();
        this.f74917d = new i(719, 575, 0, 719, 0, 575);
        this.f74918e = new b(0, new int[]{0, -1, -16777216, -8421505}, b(), c());
        this.f74919f = new g(i5, i11);
    }

    public static byte[] a(int i5, int i11, x xVar) {
        byte[] bArr = new byte[i5];
        for (int i12 = 0; i12 < i5; i12++) {
            bArr[i12] = (byte) xVar.i(i11);
        }
        return bArr;
    }

    public static int[] b() {
        int[] iArr = new int[16];
        iArr[0] = 0;
        for (int i5 = 1; i5 < 16; i5++) {
            if (i5 < 8) {
                iArr[i5] = d(255, (i5 & 1) != 0 ? 255 : 0, (i5 & 2) != 0 ? 255 : 0, (i5 & 4) != 0 ? 255 : 0);
            } else {
                int i11 = i5 & 1;
                int i12 = Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                int i13 = i11 != 0 ? 127 : 0;
                int i14 = (i5 & 2) != 0 ? 127 : 0;
                if ((i5 & 4) == 0) {
                    i12 = 0;
                }
                iArr[i5] = d(255, i13, i14, i12);
            }
        }
        return iArr;
    }

    public static int[] c() {
        int[] iArr = new int[256];
        iArr[0] = 0;
        for (int i5 = 0; i5 < 256; i5++) {
            if (i5 < 8) {
                iArr[i5] = d(63, (i5 & 1) != 0 ? 255 : 0, (i5 & 2) != 0 ? 255 : 0, (i5 & 4) == 0 ? 0 : 255);
            } else {
                int i11 = i5 & Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE;
                if (i11 == 0) {
                    iArr[i5] = d(255, ((i5 & 1) != 0 ? 85 : 0) + ((i5 & 16) != 0 ? 170 : 0), ((i5 & 2) != 0 ? 85 : 0) + ((i5 & 32) != 0 ? 170 : 0), ((i5 & 4) == 0 ? 0 : 85) + ((i5 & 64) == 0 ? 0 : 170));
                } else if (i11 == 8) {
                    iArr[i5] = d(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, ((i5 & 1) != 0 ? 85 : 0) + ((i5 & 16) != 0 ? 170 : 0), ((i5 & 2) != 0 ? 85 : 0) + ((i5 & 32) != 0 ? 170 : 0), ((i5 & 4) == 0 ? 0 : 85) + ((i5 & 64) == 0 ? 0 : 170));
                } else if (i11 == 128) {
                    iArr[i5] = d(255, ((i5 & 1) != 0 ? 43 : 0) + Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE + ((i5 & 16) != 0 ? 85 : 0), ((i5 & 2) != 0 ? 43 : 0) + Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE + ((i5 & 32) != 0 ? 85 : 0), ((i5 & 4) == 0 ? 0 : 43) + Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE + ((i5 & 64) == 0 ? 0 : 85));
                } else if (i11 == 136) {
                    iArr[i5] = d(255, ((i5 & 1) != 0 ? 43 : 0) + ((i5 & 16) != 0 ? 85 : 0), ((i5 & 2) != 0 ? 43 : 0) + ((i5 & 32) != 0 ? 85 : 0), ((i5 & 4) == 0 ? 0 : 43) + ((i5 & 64) == 0 ? 0 : 85));
                }
            }
        }
        return iArr;
    }

    public static int d(int i5, int i11, int i12, int i13) {
        return (i5 << 24) | (i11 << 16) | (i12 << 8) | i13;
    }

    /* JADX WARN: Removed duplicated region for block: B:111:0x01d5 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:115:0x01f5  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0203 A[LOOP:3: B:87:0x0156->B:119:0x0203, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x01ff A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void e(byte[] bArr, int[] iArr, int i5, int i11, int i12, Paint paint, Canvas canvas) {
        char c11;
        char c12;
        boolean z11;
        int i13;
        int i14;
        int i15;
        byte[] bArr2;
        boolean z12;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        boolean z13;
        int i23;
        int i24;
        Paint paint2 = paint;
        x xVar = new x(bArr, bArr.length);
        int i25 = i11;
        int i26 = i12;
        byte[] bArrA = null;
        byte[] bArrA2 = null;
        byte[] bArrA3 = null;
        while (xVar.b() != 0) {
            int i27 = 8;
            int i28 = xVar.i(8);
            if (i28 != 240) {
                int i29 = 3;
                int i31 = 2;
                int i32 = 4;
                switch (i28) {
                    case 16:
                        byte[] bArr3 = i5 == 3 ? bArrA == null ? f74912i : bArrA : i5 == 2 ? bArrA3 == null ? f74911h : bArrA3 : null;
                        boolean z14 = false;
                        while (true) {
                            int i33 = xVar.i(2);
                            if (i33 != 0) {
                                z11 = z14;
                                i13 = i33;
                                i14 = 1;
                            } else if (xVar.h()) {
                                int i34 = xVar.i(3) + 3;
                                z11 = z14;
                                i13 = xVar.i(2);
                                i14 = i34;
                            } else {
                                if (xVar.h()) {
                                    z11 = z14;
                                    i14 = 1;
                                    c11 = '\b';
                                    c12 = 4;
                                } else {
                                    int i35 = xVar.i(2);
                                    if (i35 == 0) {
                                        c11 = '\b';
                                        c12 = 4;
                                        z11 = true;
                                    } else if (i35 == 1) {
                                        c11 = '\b';
                                        c12 = 4;
                                        z11 = z14;
                                        i14 = 2;
                                    } else if (i35 == 2) {
                                        c11 = '\b';
                                        c12 = 4;
                                        i14 = xVar.i(4) + 12;
                                        i13 = xVar.i(2);
                                        z11 = z14;
                                        if (i14 == 0) {
                                            i15 = i25;
                                            i25 = i15 + i14;
                                            if (!z11) {
                                            }
                                        }
                                    } else if (i35 != 3) {
                                        z11 = z14;
                                        c11 = '\b';
                                        c12 = 4;
                                    } else {
                                        c11 = '\b';
                                        int i36 = xVar.i(8) + 29;
                                        i13 = xVar.i(2);
                                        z11 = z14;
                                        i14 = i36;
                                        c12 = 4;
                                        if (i14 == 0 || paint2 == null) {
                                            i15 = i25;
                                        } else {
                                            if (bArr3 != 0) {
                                                i13 = bArr3[i13];
                                            }
                                            paint2.setColor(iArr[i13]);
                                            i15 = i25;
                                            canvas.drawRect(i25, i26, i25 + i14, i26 + 1, paint2);
                                        }
                                        i25 = i15 + i14;
                                        if (!z11) {
                                            xVar.c();
                                            break;
                                        } else {
                                            paint2 = paint;
                                            z14 = z11;
                                        }
                                    }
                                    i13 = 0;
                                    i14 = 0;
                                    if (i14 == 0) {
                                    }
                                }
                                i13 = 0;
                                if (i14 == 0) {
                                }
                            }
                            c11 = '\b';
                            c12 = 4;
                            if (i14 == 0) {
                            }
                        }
                    case 17:
                        if (i5 == 3) {
                            bArr2 = bArrA2 == null ? f74913j : bArrA2;
                        } else {
                            bArr2 = null;
                        }
                        boolean z15 = false;
                        while (true) {
                            int i37 = xVar.i(i32);
                            if (i37 != 0) {
                                z12 = z15;
                                i18 = i37;
                                i16 = 1;
                            } else if (xVar.h()) {
                                if (xVar.h()) {
                                    int i38 = xVar.i(i31);
                                    if (i38 == 0) {
                                        z12 = z15;
                                        i16 = 1;
                                    } else if (i38 != 1) {
                                        if (i38 == i31) {
                                            i16 = xVar.i(i32) + 9;
                                            i17 = xVar.i(i32);
                                        } else if (i38 != i29) {
                                            z12 = z15;
                                            i16 = 0;
                                        } else {
                                            i16 = xVar.i(i27) + 25;
                                            i17 = xVar.i(i32);
                                        }
                                        i18 = i17;
                                    } else {
                                        z12 = z15;
                                        i16 = i31;
                                    }
                                    i18 = 0;
                                } else {
                                    i16 = xVar.i(i31) + 4;
                                    i18 = xVar.i(i32);
                                }
                                z12 = z15;
                            } else {
                                int i39 = xVar.i(i29);
                                if (i39 != 0) {
                                    i16 = i39 + 2;
                                    z12 = z15;
                                    i18 = 0;
                                } else {
                                    z12 = true;
                                    i16 = 0;
                                    i18 = 0;
                                }
                            }
                            if (i16 == 0 || paint2 == null) {
                                i19 = i25;
                                i21 = i29;
                                i22 = i31;
                            } else {
                                if (bArr2 != 0) {
                                    i18 = bArr2[i18];
                                }
                                paint2.setColor(iArr[i18]);
                                i21 = i29;
                                i22 = 2;
                                i19 = i25;
                                canvas.drawRect(i25, i26, i25 + i16, i26 + 1, paint2);
                            }
                            i25 = i19 + i16;
                            if (z12) {
                                xVar.c();
                                break;
                            } else {
                                z15 = z12;
                                i29 = i21;
                                i31 = i22;
                                i32 = 4;
                                i27 = 8;
                            }
                        }
                    case 18:
                        boolean z16 = false;
                        while (true) {
                            int i40 = xVar.i(8);
                            if (i40 != 0) {
                                z13 = z16;
                                i23 = 1;
                            } else if (xVar.h()) {
                                z13 = z16;
                                i23 = xVar.i(7);
                                i40 = xVar.i(8);
                            } else {
                                int i41 = xVar.i(7);
                                if (i41 != 0) {
                                    z13 = z16;
                                    i23 = i41;
                                    i40 = 0;
                                } else {
                                    z13 = true;
                                    i40 = 0;
                                    i23 = 0;
                                }
                            }
                            if (i23 == 0 || paint2 == null) {
                                i24 = i25;
                            } else {
                                paint2.setColor(iArr[i40]);
                                i24 = i25;
                                canvas.drawRect(i25, i26, i25 + i23, i26 + 1, paint2);
                            }
                            i25 = i24 + i23;
                            if (z13) {
                                break;
                            } else {
                                z16 = z13;
                            }
                        }
                        break;
                    default:
                        switch (i28) {
                            case 32:
                                bArrA3 = a(4, 4, xVar);
                                break;
                            case 33:
                                bArrA = a(4, 8, xVar);
                                break;
                            case 34:
                                bArrA2 = a(16, 8, xVar);
                                break;
                        }
                }
            } else {
                i26 += 2;
                i25 = i11;
            }
            paint2 = paint;
        }
    }

    public static b f(x xVar, int i5) {
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16 = 8;
        int i17 = xVar.i(8);
        xVar.r(8);
        int i18 = 2;
        int i19 = i5 - 2;
        int i21 = 0;
        int[] iArr = {0, -1, -16777216, -8421505};
        int[] iArrB = b();
        int[] iArrC = c();
        while (i19 > 0) {
            int i22 = xVar.i(i16);
            int i23 = xVar.i(i16);
            int[] iArr2 = (i23 & 128) != 0 ? iArr : (i23 & 64) != 0 ? iArrB : iArrC;
            if ((i23 & 1) != 0) {
                i14 = xVar.i(i16);
                i15 = xVar.i(i16);
                i11 = xVar.i(i16);
                i13 = xVar.i(i16);
                i12 = i19 - 6;
            } else {
                int i24 = xVar.i(6) << i18;
                int i25 = xVar.i(4) << 4;
                i11 = xVar.i(4) << 4;
                i12 = i19 - 4;
                i13 = xVar.i(i18) << 6;
                i14 = i24;
                i15 = i25;
            }
            if (i14 == 0) {
                i15 = i21;
                i11 = i15;
                i13 = 255;
            }
            double d5 = i14;
            double d11 = i15 - 128;
            double d12 = i11 - 128;
            iArr2[i22] = d((byte) (255 - (i13 & 255)), v.h((int) ((1.402d * d11) + d5), 0, 255), v.h((int) ((d5 - (0.34414d * d12)) - (d11 * 0.71414d)), 0, 255), v.h((int) ((d12 * 1.772d) + d5), 0, 255));
            i19 = i12;
            i21 = 0;
            i17 = i17;
            iArrC = iArrC;
            i16 = 8;
            i18 = 2;
        }
        return new b(i17, iArr, iArrB, iArrC);
    }

    public static c g(x xVar) {
        byte[] bArr;
        int i5 = xVar.i(16);
        xVar.r(4);
        int i11 = xVar.i(2);
        boolean zH = xVar.h();
        xVar.r(1);
        byte[] bArr2 = v.f94381f;
        if (i11 != 1) {
            if (i11 == 0) {
                int i12 = xVar.i(16);
                int i13 = xVar.i(16);
                if (i12 > 0) {
                    bArr2 = new byte[i12];
                    xVar.k(i12, bArr2);
                }
                if (i13 > 0) {
                    bArr = new byte[i13];
                    xVar.k(i13, bArr);
                }
            }
            return new c(i5, zH, bArr2, bArr);
        }
        xVar.r(xVar.i(8) * 16);
        bArr = bArr2;
        return new c(i5, zH, bArr2, bArr);
    }
}
