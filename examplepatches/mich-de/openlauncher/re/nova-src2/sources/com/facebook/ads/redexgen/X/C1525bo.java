package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.util.SparseArray;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.bo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1525bo {
    public static byte[] A07;
    public static String[] A08 = {"JsV4TFjYWvOVFh9fbEMBQ1yd", "zI9rFfLAPUbBcFVn1cs8sVfp7", "5vAFQLVRtXS7x8rkrLI0RrMKh", "5t", "1oeTKhLIb83oiC2b8AZ2Gaj38pe10VaJ", "yM2U", "BgBP9zcDMfdMiz0Sq4W1kP4oEPZ", "BxbzWHPj6NvSPUz9iUx4YOqPzI8l5Xlv"};
    public static final byte[] A09;
    public static final byte[] A0A;
    public static final byte[] A0B;
    public Bitmap A00;
    public final Canvas A01;
    public final Paint A02 = new Paint();
    public final Paint A03;
    public final C1517bg A04;
    public final C1518bh A05;
    public final C1524bn A06;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1517bg A04(C1083Mj c1083Mj, int i5) {
        int iA04;
        int iA042;
        int iA043;
        int iA044;
        int i11 = 8;
        int iA045 = c1083Mj.A04(8);
        c1083Mj.A09(8);
        int i12 = i5 - 2;
        int[] iArrA0F = A0F();
        int[] iArrA0G = A0G();
        int[] iArrA0H = A0H();
        while (i12 > 0) {
            int iA046 = c1083Mj.A04(i11);
            int iA047 = c1083Mj.A04(i11);
            int i13 = i12 - 2;
            int[] iArr = (iA047 & 128) != 0 ? iArrA0F : (iA047 & 64) != 0 ? iArrA0G : iArrA0H;
            if ((iA047 & 1) != 0) {
                iA04 = c1083Mj.A04(i11);
                iA042 = c1083Mj.A04(i11);
                iA043 = c1083Mj.A04(i11);
                iA044 = c1083Mj.A04(i11);
                i12 = i13 - 4;
            } else {
                iA04 = c1083Mj.A04(6) << 2;
                iA042 = c1083Mj.A04(4) << 4;
                iA043 = c1083Mj.A04(4) << 4;
                iA044 = c1083Mj.A04(2) << 6;
                i12 = i13 - 2;
            }
            if (iA04 == 0) {
                iA042 = 0;
                iA043 = 0;
                iA044 = 255;
            }
            iArr[iA046] = A00(255 - (iA044 & 255), N1.A07((int) (iA04 + ((iA042 - 128) * 1.402d)), 0, 255), N1.A07((int) ((iA04 - ((iA043 - 128) * 0.34414d)) - ((iA042 - 128) * 0.71414d)), 0, 255), N1.A07((int) (iA04 + ((iA043 - 128) * 1.772d)), 0, 255));
            i11 = 8;
        }
        return new C1517bg(iA045, iArrA0F, iArrA0G, iArrA0H);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1518bh A05(C1083Mj c1083Mj) {
        int iA04;
        int iA042;
        int iA043;
        int iA044;
        c1083Mj.A09(4);
        boolean zA0H = c1083Mj.A0H();
        c1083Mj.A09(3);
        int iA045 = c1083Mj.A04(16);
        int iA046 = c1083Mj.A04(16);
        if (zA0H) {
            iA04 = c1083Mj.A04(16);
            iA044 = c1083Mj.A04(16);
            iA042 = c1083Mj.A04(16);
            iA043 = c1083Mj.A04(16);
        } else {
            iA04 = 0;
            iA042 = 0;
            iA043 = iA046;
            iA044 = iA045;
        }
        return new C1518bh(iA045, iA046, iA04, iA044, iA042, iA043);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1522bl A08(C1083Mj c1083Mj, int i5) {
        int i11 = 8;
        int iA04 = c1083Mj.A04(8);
        c1083Mj.A09(4);
        boolean zA0H = c1083Mj.A0H();
        c1083Mj.A09(3);
        int iA042 = c1083Mj.A04(16);
        int iA043 = c1083Mj.A04(16);
        int iA044 = c1083Mj.A04(3);
        int iA045 = c1083Mj.A04(3);
        c1083Mj.A09(2);
        int iA046 = c1083Mj.A04(8);
        int iA047 = c1083Mj.A04(8);
        int iA048 = c1083Mj.A04(4);
        int iA049 = c1083Mj.A04(2);
        c1083Mj.A09(2);
        int i12 = i5 - 10;
        SparseArray sparseArray = new SparseArray();
        while (i12 > 0) {
            int iA0410 = c1083Mj.A04(16);
            int iA0411 = c1083Mj.A04(2);
            int iA0412 = c1083Mj.A04(2);
            int iA0413 = c1083Mj.A04(12);
            c1083Mj.A09(4);
            int iA0414 = c1083Mj.A04(12);
            i12 -= 6;
            int iA0415 = 0;
            int iA0416 = 0;
            if (iA0411 == 1 || iA0411 == 2) {
                iA0415 = c1083Mj.A04(i11);
                iA0416 = c1083Mj.A04(i11);
                i12 -= 2;
            }
            sparseArray.put(iA0410, new C1523bm(iA0411, iA0412, iA0413, iA0414, iA0415, iA0416));
            i11 = 8;
        }
        return new C1522bl(iA04, zA0H, iA042, iA043, iA044, iA045, iA046, iA047, iA048, iA049, sparseArray);
    }

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 115);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A07 = new byte[]{4, 33, 52, 33, 96, 38, 41, 37, 44, 36, 96, 44, 37, 46, 39, 52, 40, 96, 37, 56, 35, 37, 37, 36, 51, 96, 44, 41, 45, 41, 52, 55, 5, 17, 35, 18, 1, 0, 22, 1};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final List<C1251Th> A0I(byte[] bArr, int i5) {
        C1083Mj c1083Mj = new C1083Mj(bArr, i5);
        while (c1083Mj.A01() >= 48 && c1083Mj.A04(8) == 15) {
            A0B(c1083Mj, this.A06);
        }
        C1520bj c1520bj = this.A06.A01;
        if (c1520bj != null) {
            C1518bh c1518bh = this.A06.A00 != null ? this.A06.A00 : this.A05;
            if (this.A00 == null || c1518bh.A05 + 1 != this.A00.getWidth() || c1518bh.A00 + 1 != this.A00.getHeight()) {
                this.A00 = Bitmap.createBitmap(c1518bh.A05 + 1, c1518bh.A00 + 1, Bitmap.Config.ARGB_8888);
                this.A01.setBitmap(this.A00);
            }
            ArrayList arrayList = new ArrayList();
            SparseArray<C1521bk> sparseArray = c1520bj.A03;
            for (int i11 = 0; i11 < sparseArray.size(); i11++) {
                this.A01.save();
                C1521bk c1521bkValueAt = sparseArray.valueAt(i11);
                C1522bl c1522bl = this.A06.A08.get(sparseArray.keyAt(i11));
                int i12 = c1521bkValueAt.A00 + c1518bh.A02;
                int i13 = c1521bkValueAt.A01 + c1518bh.A04;
                this.A01.clipRect(i12, i13, Math.min(c1522bl.A08 + i12, c1518bh.A01), Math.min(c1522bl.A02 + i13, c1518bh.A03));
                C1517bg c1517bg = this.A06.A06.get(c1522bl.A00);
                if (c1517bg == null && (c1517bg = this.A06.A04.get(c1522bl.A00)) == null) {
                    c1517bg = this.A04;
                }
                SparseArray<C1523bm> sparseArray2 = c1522bl.A09;
                for (int i14 = 0; i14 < sparseArray2.size(); i14++) {
                    int iKeyAt = sparseArray2.keyAt(i14);
                    C1523bm c1523bmValueAt = sparseArray2.valueAt(i14);
                    C1519bi c1519bi = this.A06.A07.get(iKeyAt);
                    if (c1519bi == null) {
                        c1519bi = this.A06.A05.get(iKeyAt);
                    }
                    if (c1519bi != null) {
                        Paint paint = c1519bi.A01 ? null : this.A02;
                        int i15 = c1522bl.A01;
                        int i16 = i12 + c1523bmValueAt.A02;
                        int i17 = i13 + c1523bmValueAt.A05;
                        Canvas canvas = this.A01;
                        String[] strArr = A08;
                        if (strArr[4].charAt(30) != strArr[7].charAt(30)) {
                            String[] strArr2 = A08;
                            strArr2[3] = "Vx";
                            strArr2[0] = "u9oPMu67mHNYaVuzznnGdinz";
                            A0C(c1519bi, c1517bg, i15, i16, i17, paint, canvas);
                        }
                    }
                }
                if (c1522bl.A0A) {
                    this.A03.setColor(c1522bl.A01 == 3 ? c1517bg.A03[c1522bl.A07] : c1522bl.A01 == 2 ? c1517bg.A02[c1522bl.A06] : c1517bg.A01[c1522bl.A05]);
                    this.A01.drawRect(i12, i13, c1522bl.A08 + i12, c1522bl.A02 + i13, this.A03);
                }
                arrayList.add(new C1052Ld().A0D(Bitmap.createBitmap(this.A00, i12, i13, c1522bl.A08, c1522bl.A02)).A04(i12 / c1518bh.A05).A0A(0).A07(i13 / c1518bh.A00, 0).A09(0).A06(c1522bl.A08 / c1518bh.A05).A03(c1522bl.A02 / c1518bh.A00).A0H());
                this.A01.drawColor(0, PorterDuff.Mode.CLEAR);
                this.A01.restore();
            }
            return Collections.unmodifiableList(arrayList);
        }
        List<C1251Th> listEmptyList = Collections.emptyList();
        String[] strArr3 = A08;
        if (strArr3[4].charAt(30) != strArr3[7].charAt(30)) {
            String[] strArr4 = A08;
            strArr4[4] = "k6wxMV5rogRqQXlJ7wPhPjAOTGXgdcai";
            strArr4[7] = "gpzzOf5VMtZ0FadQglIjA6shEguw2FFx";
            return listEmptyList;
        }
        throw new RuntimeException();
    }

    static {
        A0A();
        A09 = new byte[]{0, 7, 8, 15};
        A0A = new byte[]{0, 119, -120, -1};
        A0B = new byte[]{0, 17, 34, 51, 68, 85, 102, 119, -120, -103, -86, -69, -52, -35, -18, -1};
    }

    public C1525bo(int i5, int i11) {
        this.A02.setStyle(Paint.Style.FILL_AND_STROKE);
        this.A02.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC));
        this.A02.setPathEffect(null);
        this.A03 = new Paint();
        this.A03.setStyle(Paint.Style.FILL);
        this.A03.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OVER));
        this.A03.setPathEffect(null);
        this.A01 = new Canvas();
        this.A05 = new C1518bh(719, 575, 0, 719, 0, 575);
        this.A04 = new C1517bg(0, A0F(), A0G(), A0H());
        this.A06 = new C1524bn(i5, i11);
    }

    public static int A00(int i5, int i11, int i12, int i13) {
        return (i5 << 24) | (i11 << 16) | (i12 << 8) | i13;
    }

    public static int A01(C1083Mj c1083Mj, int[] iArr, byte[] bArr, int i5, int i11, Paint paint, Canvas canvas) {
        boolean z11 = false;
        do {
            int clutIndex = 0;
            int iA04 = c1083Mj.A04(2);
            if (iA04 != 0) {
                clutIndex = 1;
            } else if (c1083Mj.A0H()) {
                clutIndex = c1083Mj.A04(3) + 3;
                iA04 = c1083Mj.A04(2);
            } else if (c1083Mj.A0H()) {
                clutIndex = 1;
                iA04 = 0;
            } else {
                switch (c1083Mj.A04(2)) {
                    case 0:
                        z11 = true;
                        iA04 = 0;
                        break;
                    case 1:
                        clutIndex = 2;
                        iA04 = 0;
                        break;
                    case 2:
                        clutIndex = c1083Mj.A04(4) + 12;
                        iA04 = c1083Mj.A04(2);
                        break;
                    case 3:
                        clutIndex = c1083Mj.A04(8) + 29;
                        if (A08[6].length() == 27) {
                            String[] strArr = A08;
                            strArr[3] = "rf";
                            strArr[0] = "t15PXyEyf06LFckNamOoNHYS";
                            iA04 = c1083Mj.A04(2);
                            break;
                        } else {
                            throw new RuntimeException();
                        }
                    default:
                        iA04 = 0;
                        break;
                }
            }
            if (clutIndex != 0 && paint != null) {
                if (bArr != null) {
                    iA04 = bArr[iA04];
                }
                paint.setColor(iArr[iA04]);
                canvas.drawRect(i5, i11, i5 + clutIndex, i11 + 1, paint);
            }
            i5 += clutIndex;
        } while (!z11);
        return i5;
    }

    public static int A02(C1083Mj c1083Mj, int[] iArr, byte[] bArr, int i5, int i11, Paint paint, Canvas canvas) {
        boolean z11 = false;
        do {
            int iA04 = 0;
            int iA042 = c1083Mj.A04(4);
            if (iA042 != 0) {
                iA04 = 1;
            } else if (!c1083Mj.A0H()) {
                int iA043 = c1083Mj.A04(3);
                if (iA043 != 0) {
                    iA04 = iA043 + 2;
                    iA042 = 0;
                } else {
                    z11 = true;
                    iA042 = 0;
                }
            } else if (!c1083Mj.A0H()) {
                iA04 = c1083Mj.A04(2) + 4;
                iA042 = c1083Mj.A04(4);
            } else {
                switch (c1083Mj.A04(2)) {
                    case 0:
                        iA04 = 1;
                        iA042 = 0;
                        break;
                    case 1:
                        iA04 = 2;
                        iA042 = 0;
                        break;
                    case 2:
                        iA04 = c1083Mj.A04(4) + 9;
                        iA042 = c1083Mj.A04(4);
                        break;
                    case 3:
                        iA04 = c1083Mj.A04(8) + 25;
                        iA042 = c1083Mj.A04(4);
                        break;
                    default:
                        iA042 = 0;
                        break;
                }
            }
            if (iA04 != 0 && paint != null) {
                if (bArr != null) {
                    iA042 = bArr[iA042];
                }
                paint.setColor(iArr[iA042]);
                canvas.drawRect(i5, i11, i5 + iA04, i11 + 1, paint);
            }
            i5 += iA04;
        } while (!z11);
        return i5;
    }

    public static int A03(C1083Mj c1083Mj, int[] iArr, byte[] bArr, int i5, int i11, Paint paint, Canvas canvas) {
        int iA04;
        int i12 = i5;
        boolean z11 = false;
        do {
            int iA042 = c1083Mj.A04(8);
            if (iA042 != 0) {
                iA04 = 1;
            } else if (!c1083Mj.A0H()) {
                iA04 = c1083Mj.A04(7);
                if (iA04 != 0) {
                    iA042 = 0;
                } else {
                    z11 = true;
                    iA04 = 0;
                    iA042 = 0;
                }
            } else {
                iA04 = c1083Mj.A04(7);
                iA042 = c1083Mj.A04(8);
            }
            if (iA04 != 0 && paint != null) {
                if (bArr != null) {
                    iA042 = bArr[iA042];
                }
                paint.setColor(iArr[iA042]);
                float f11 = i12;
                float f12 = i11;
                String[] strArr = A08;
                if (strArr[3].length() == strArr[0].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A08;
                strArr2[4] = "nFAY43cuMtbo8GHNqxxyMaFJhuv8uT08";
                strArr2[7] = "nVtWZ378Kka1Q7VhBISIVs1iQwprxuF1";
                canvas.drawRect(f11, f12, i12 + iA04, i11 + 1, paint);
            }
            i12 += iA04;
        } while (!z11);
        return i12;
    }

    public static C1519bi A06(C1083Mj c1083Mj) {
        int iA04 = c1083Mj.A04(16);
        c1083Mj.A09(4);
        int objectId = c1083Mj.A04(2);
        boolean zA0H = c1083Mj.A0H();
        c1083Mj.A09(1);
        byte[] bArr = N1.A07;
        byte[] bArr2 = N1.A07;
        if (objectId == 1) {
            int numberOfCodes = c1083Mj.A04(8);
            c1083Mj.A09(numberOfCodes * 16);
        } else if (objectId == 0) {
            int objectCodingMethod = c1083Mj.A04(16);
            int objectId2 = c1083Mj.A04(16);
            if (objectCodingMethod > 0) {
                bArr = new byte[objectCodingMethod];
                c1083Mj.A0G(bArr, 0, objectCodingMethod);
            }
            if (objectId2 > 0) {
                bArr2 = new byte[objectId2];
                c1083Mj.A0G(bArr2, 0, objectId2);
            } else {
                bArr2 = bArr;
            }
        }
        return new C1519bi(iA04, zA0H, bArr, bArr2);
    }

    public static C1520bj A07(C1083Mj c1083Mj, int i5) {
        int iA04 = c1083Mj.A04(8);
        int iA042 = c1083Mj.A04(4);
        int iA043 = c1083Mj.A04(2);
        c1083Mj.A09(2);
        int i11 = i5 - 2;
        SparseArray sparseArray = new SparseArray();
        while (i11 > 0) {
            int remainingLength = c1083Mj.A04(8);
            c1083Mj.A09(8);
            int version = c1083Mj.A04(16);
            int timeoutSecs = c1083Mj.A04(16);
            i11 -= 6;
            sparseArray.put(remainingLength, new C1521bk(version, timeoutSecs));
        }
        return new C1520bj(iA04, iA042, iA043, sparseArray);
    }

    public static void A0B(C1083Mj c1083Mj, C1524bn c1524bn) {
        int iA04 = c1083Mj.A04(8);
        int iA042 = c1083Mj.A04(16);
        int pageId = c1083Mj.A04(16);
        int dataFieldLimit = c1083Mj.A02() + pageId;
        int dataFieldLength = pageId * 8;
        int segmentType = c1083Mj.A01();
        if (dataFieldLength > segmentType) {
            MV.A07(A09(31, 9, 0), A09(0, 31, 51));
            int segmentType2 = c1083Mj.A01();
            c1083Mj.A09(segmentType2);
            return;
        }
        switch (iA04) {
            case 16:
                int segmentType3 = c1524bn.A03;
                if (iA042 == segmentType3) {
                    C1520bj c1520bj = c1524bn.A01;
                    C1520bj c1520bjA07 = A07(c1083Mj, pageId);
                    int segmentType4 = c1520bjA07.A00;
                    if (segmentType4 != 0) {
                        c1524bn.A01 = c1520bjA07;
                        c1524bn.A08.clear();
                        c1524bn.A06.clear();
                        c1524bn.A07.clear();
                        break;
                    } else if (c1520bj != null) {
                        int dataFieldLength2 = c1520bj.A02;
                        int segmentType5 = c1520bjA07.A02;
                        if (dataFieldLength2 != segmentType5) {
                            c1524bn.A01 = c1520bjA07;
                            break;
                        }
                    }
                }
                break;
            case 17:
                C1520bj c1520bj2 = c1524bn.A01;
                int segmentType6 = c1524bn.A03;
                if (iA042 == segmentType6 && c1520bj2 != null) {
                    C1522bl c1522blA08 = A08(c1083Mj, pageId);
                    int segmentType7 = c1520bj2.A00;
                    if (segmentType7 == 0) {
                        SparseArray<C1522bl> sparseArray = c1524bn.A08;
                        int segmentType8 = c1522blA08.A03;
                        C1522bl c1522bl = sparseArray.get(segmentType8);
                        if (c1522bl != null) {
                            c1522blA08.A00(c1522bl);
                        }
                    }
                    SparseArray<C1522bl> sparseArray2 = c1524bn.A08;
                    int segmentType9 = c1522blA08.A03;
                    sparseArray2.put(segmentType9, c1522blA08);
                    break;
                }
                break;
            case 18:
                int segmentType10 = c1524bn.A03;
                if (iA042 == segmentType10) {
                    C1517bg c1517bgA04 = A04(c1083Mj, pageId);
                    SparseArray<C1517bg> sparseArray3 = c1524bn.A06;
                    int segmentType11 = c1517bgA04.A00;
                    sparseArray3.put(segmentType11, c1517bgA04);
                    break;
                } else {
                    int segmentType12 = c1524bn.A02;
                    if (iA042 == segmentType12) {
                        C1517bg c1517bgA042 = A04(c1083Mj, pageId);
                        SparseArray<C1517bg> sparseArray4 = c1524bn.A04;
                        int segmentType13 = c1517bgA042.A00;
                        sparseArray4.put(segmentType13, c1517bgA042);
                        break;
                    }
                }
                break;
            case 19:
                int segmentType14 = c1524bn.A03;
                if (iA042 == segmentType14) {
                    C1519bi c1519biA06 = A06(c1083Mj);
                    SparseArray<C1519bi> sparseArray5 = c1524bn.A07;
                    int segmentType15 = c1519biA06.A00;
                    sparseArray5.put(segmentType15, c1519biA06);
                    break;
                } else {
                    int segmentType16 = c1524bn.A02;
                    if (iA042 == segmentType16) {
                        C1519bi c1519biA062 = A06(c1083Mj);
                        SparseArray<C1519bi> sparseArray6 = c1524bn.A05;
                        int segmentType17 = c1519biA062.A00;
                        sparseArray6.put(segmentType17, c1519biA062);
                        break;
                    }
                }
                break;
            case 20:
                int segmentType18 = c1524bn.A03;
                if (iA042 == segmentType18) {
                    c1524bn.A00 = A05(c1083Mj);
                    break;
                }
                break;
        }
        int segmentType19 = c1083Mj.A02();
        c1083Mj.A0A(dataFieldLimit - segmentType19);
    }

    public static void A0C(C1519bi c1519bi, C1517bg c1517bg, int i5, int i11, int i12, Paint paint, Canvas canvas) {
        int[] iArr;
        if (i5 == 3) {
            iArr = c1517bg.A03;
        } else if (i5 == 2) {
            iArr = c1517bg.A02;
        } else {
            iArr = c1517bg.A01;
        }
        A0D(c1519bi.A03, iArr, i5, i11, i12, paint, canvas);
        A0D(c1519bi.A02, iArr, i5, i11, i12 + 1, paint, canvas);
    }

    public static void A0D(byte[] bArr, int[] iArr, int i5, int i11, int i12, Paint paint, Canvas canvas) {
        byte[] bArr2;
        byte[] bArr3;
        int i13 = i12;
        C1083Mj c1083Mj = new C1083Mj(bArr);
        byte[] clutMapTable2To8 = null;
        byte[] clutMapTable2To4 = null;
        byte[] bArrA0E = null;
        int line = i11;
        while (c1083Mj.A01() != 0) {
            switch (c1083Mj.A04(8)) {
                case 16:
                    if (i5 == 3) {
                        bArr2 = clutMapTable2To4 == null ? A0A : clutMapTable2To4;
                    } else if (i5 == 2) {
                        bArr2 = clutMapTable2To8 == null ? A09 : clutMapTable2To8;
                    } else {
                        bArr2 = null;
                    }
                    line = A01(c1083Mj, iArr, bArr2, line, i13, paint, canvas);
                    if (A08[5].length() == 4) {
                        A08[5] = "INWB";
                        c1083Mj.A06();
                        break;
                    } else {
                        throw new RuntimeException();
                    }
                case 17:
                    if (i5 == 3) {
                        bArr3 = bArrA0E == null ? A0B : bArrA0E;
                    } else {
                        bArr3 = null;
                    }
                    line = A02(c1083Mj, iArr, bArr3, line, i13, paint, canvas);
                    c1083Mj.A06();
                    break;
                case 18:
                    line = A03(c1083Mj, iArr, null, line, i13, paint, canvas);
                    break;
                case 32:
                    clutMapTable2To8 = A0E(4, 4, c1083Mj);
                    break;
                case 33:
                    clutMapTable2To4 = A0E(4, 8, c1083Mj);
                    break;
                case 34:
                    bArrA0E = A0E(16, 8, c1083Mj);
                    break;
                case 240:
                    i13 += 2;
                    line = i11;
                    break;
            }
        }
    }

    public static byte[] A0E(int i5, int i11, C1083Mj c1083Mj) {
        byte[] bArr = new byte[i5];
        for (int i12 = 0; i12 < i5; i12++) {
            bArr[i12] = (byte) c1083Mj.A04(i11);
        }
        return bArr;
    }

    public static int[] A0F() {
        int[] iArr = new int[4];
        iArr[0] = 0;
        if (A08[6].length() != 27) {
            throw new RuntimeException();
        }
        A08[5] = "UKRJ";
        iArr[1] = -1;
        iArr[2] = -16777216;
        iArr[3] = -8421505;
        return iArr;
    }

    public static int[] A0G() {
        int[] iArr = new int[16];
        iArr[0] = 0;
        for (int i5 = 1; i5 < iArr.length; i5++) {
            if (i5 < 8) {
                int i11 = (i5 & 1) != 0 ? 255 : 0;
                iArr[i5] = A00(255, i11, (i5 & 2) != 0 ? 255 : 0, (i5 & 4) != 0 ? 255 : 0);
            } else {
                int i12 = i5 & 1;
                int i13 = Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
                int i14 = i12 != 0 ? Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE : 0;
                int i15 = (i5 & 2) != 0 ? Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE : 0;
                if ((i5 & 4) == 0) {
                    i13 = 0;
                }
                iArr[i5] = A00(255, i14, i15, i13);
            }
        }
        return iArr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:138:0x0029, code lost:
    
        continue;
     */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0189  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int[] A0H() {
        int[] iArr = new int[256];
        iArr[0] = 0;
        for (int i5 = 0; i5 < iArr.length; i5++) {
            if (i5 < 8) {
                int i11 = (i5 & 1) != 0 ? 255 : 0;
                iArr[i5] = A00(63, i11, (i5 & 2) != 0 ? 255 : 0, (i5 & 4) == 0 ? 0 : 255);
            } else {
                switch (i5 & Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE) {
                    case 0:
                        int i12 = ((i5 & 1) != 0 ? 85 : 0) + ((i5 & 16) != 0 ? 170 : 0);
                        int i13 = ((i5 & 2) != 0 ? 85 : 0) + ((i5 & 32) != 0 ? 170 : 0);
                        int i14 = (i5 & 4) == 0 ? 0 : 85;
                        int i15 = i5 & 64;
                        if (A08[6].length() != 27) {
                            String[] strArr = A08;
                            strArr[4] = "bSnjUDub7bObQ8EGvYPBkslmisWTOY6w";
                            strArr[7] = "Yb931zwFH8JAISIiHzcsgH50hwdoubnO";
                            if (i15 == 0) {
                                i = 0;
                            }
                            iArr[i5] = A00(255, i12, i13, i14 + i);
                            break;
                        } else {
                            A08[6] = "giTTEFiONoi9787xiXhrtfr6U9u";
                            if (i15 == 0) {
                            }
                            iArr[i5] = A00(255, i12, i13, i14 + i);
                        }
                    case 8:
                        int i16 = ((i5 & 1) != 0 ? 85 : 0) + ((i5 & 16) != 0 ? 170 : 0);
                        int i17 = ((i5 & 2) != 0 ? 85 : 0) + ((i5 & 32) != 0 ? 170 : 0);
                        int i18 = i5 & 4;
                        if (A08[5].length() != 4) {
                            throw new RuntimeException();
                        }
                        A08[6] = "LhhNv66emf4CN5nBnv9iDds5Bnp";
                        iArr[i5] = A00(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, i16, i17, (i18 == 0 ? 0 : 85) + ((i5 & 64) == 0 ? 0 : 170));
                        break;
                    case 128:
                        int i19 = i5 & 1;
                        String[] strArr2 = A08;
                        if (strArr2[4].charAt(30) != strArr2[7].charAt(30)) {
                            String[] strArr3 = A08;
                            strArr3[4] = "Z8UcYjzUy6V9YAKzaWp6JqWgXNcZttQE";
                            strArr3[7] = "qowOW12Oo04mXVMG9XTKN3xvNkznhuB4";
                            int i21 = (i19 != 0 ? 43 : 0) + Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE + ((i5 & 16) != 0 ? 85 : 0);
                            String[] strArr4 = A08;
                            if (strArr4[4].charAt(30) != strArr4[7].charAt(30)) {
                                A08[5] = "NG2b";
                                iArr[i5] = A00(255, i21, ((i5 & 2) != 0 ? 43 : 0) + Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE + ((i5 & 32) != 0 ? 85 : 0), ((i5 & 4) == 0 ? 0 : 43) + Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE + ((i5 & 64) == 0 ? 0 : 85));
                                break;
                            }
                        }
                        throw new RuntimeException();
                    case PRIVACY_URL_ERROR_VALUE:
                        int i22 = (i5 & 1) != 0 ? 43 : 0;
                        iArr[i5] = A00(255, i22 + ((i5 & 16) != 0 ? 85 : 0), ((i5 & 2) != 0 ? 43 : 0) + ((i5 & 32) != 0 ? 85 : 0), ((i5 & 4) == 0 ? 0 : 43) + ((i5 & 64) == 0 ? 0 : 85));
                        break;
                }
            }
        }
        return iArr;
    }

    public final void A0J() {
        this.A06.A00();
    }
}
