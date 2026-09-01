package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.ImageView;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class xp implements bag {
    public final /* synthetic */ int a;
    public int b;
    public Object c;
    public Object d;

    /* JADX WARN: Removed duplicated region for block: B:30:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00e4 A[LOOP:1: B:27:0x00c2->B:33:0x00e4, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public xp(defpackage.n46 r13, defpackage.n01 r14) {
        /*
            Method dump skipped, instruction units count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xp.<init>(n46, n01):void");
    }

    public static int B(int i, List list) {
        int size = list.size() - 1;
        int i2 = 0;
        while (i2 <= size) {
            int i3 = (i2 + size) >>> 1;
            int i4 = ((dw6) list.get(i3)).a - i;
            if (i4 < 0) {
                i2 = i3 + 1;
            } else {
                if (i4 <= 0) {
                    return i3;
                }
                size = i3 - 1;
            }
        }
        return -(i2 + 1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x01f5, code lost:
    
        if (r11 == 1) goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x01f8, code lost:
    
        if (r11 == 2) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01fa, code lost:
    
        r1 = r0.a;
        r0 = r0.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x0200, code lost:
    
        if (r10 == 1) goto L109;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x0202, code lost:
    
        if (r10 == 2) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0204, code lost:
    
        r2 = android.graphics.Shader.TileMode.CLAMP;
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x0215, code lost:
    
        r2 = android.graphics.Shader.TileMode.MIRROR;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x0218, code lost:
    
        r2 = android.graphics.Shader.TileMode.REPEAT;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x021b, code lost:
    
        r11 = new android.graphics.LinearGradient(r21, r22, r26, r27, r1, r0, r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x021f, code lost:
    
        r11 = new android.graphics.SweepGradient(r8, r9, r0.a, r0.b);
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x022d, code lost:
    
        if (r25 <= 0.0f) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x022f, code lost:
    
        r1 = r0.a;
        r0 = r0.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x0236, code lost:
    
        if (r10 == 1) goto L121;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x0239, code lost:
    
        if (r10 == 2) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x023b, code lost:
    
        r2 = android.graphics.Shader.TileMode.CLAMP;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x024a, code lost:
    
        r2 = android.graphics.Shader.TileMode.MIRROR;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x024d, code lost:
    
        r2 = android.graphics.Shader.TileMode.REPEAT;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x0250, code lost:
    
        r11 = new android.graphics.RadialGradient(r8, r9, r25, r1, r0, r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x025c, code lost:
    
        return new defpackage.xp(r11, (android.content.res.ColorStateList) null, 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x0264, code lost:
    
        throw new org.xmlpull.v1.XmlPullParserException("<gradient> tag requires 'gradientRadius' attribute with radial type");
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x01da, code lost:
    
        if (r13.size() <= 0) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01dc, code lost:
    
        r0 = new defpackage.s31(r13, r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x01e2, code lost:
    
        r0 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01e3, code lost:
    
        if (r0 == null) goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x01e7, code lost:
    
        if (r20 == false) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x01e9, code lost:
    
        r0 = new defpackage.s31(r6, r5, r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01ef, code lost:
    
        r0 = new defpackage.s31(r6, r12);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.xp h(android.content.res.Resources r30, int r31, android.content.res.Resources.Theme r32) {
        /*
            Method dump skipped, instruction units count: 653
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xp.h(android.content.res.Resources, int, android.content.res.Resources$Theme):xp");
    }

    public static /* synthetic */ void x(xp xpVar, int i, int i2, int i3, int i4, int i5, int i6, boolean z, boolean z2, boolean z3, int i7) {
        xpVar.w(i, i2, i3, i4, i5, (i7 & 32) != 0 ? -1 : i6, z, z2, z3, -1);
    }

    public void A() {
        k80.p0(0, 0, 6, (int[]) this.c);
        ((m70) this.d).clear();
    }

    public void C(int i, int i2) {
        if (i < 0) {
            e26.a("Negative lanes are not supported");
        }
        m(i);
        ((int[]) this.c)[i - this.b] = i2 + 1;
    }

    public void D(int i, boolean z) {
        int i2 = i & 33554431;
        long[] jArr = (long[]) this.c;
        int i3 = this.b;
        for (int i4 = 0; i4 < jArr.length - 2 && i4 < i3; i4 += 3) {
            int i5 = i4 + 2;
            long j = jArr[i5];
            if ((((int) j) & 33554431) == i2) {
                long j2 = 8070450532247928831L & j;
                long j3 = z ? 1L : 0L;
                jArr[i5] = j2 | (1152921504606846976L * j3) | (j3 * Long.MIN_VALUE);
                return;
            }
        }
    }

    public void E(int i, int i2, long j) {
        int i3;
        char c;
        char c2;
        long[] jArr = (long[]) this.c;
        long[] jArr2 = (long[]) this.d;
        jArr2[0] = j;
        int i4 = 1;
        while (i4 > 0) {
            i4--;
            long j2 = jArr2[i4];
            int i5 = 33554431;
            int i6 = ((int) j2) & 33554431;
            char c3 = 25;
            int i7 = ((int) (j2 >> 25)) & 33554431;
            char c4 = '2';
            int i8 = ((int) (j2 >> 50)) & 1023;
            int i9 = i8 == 1023 ? this.b : (i8 * 3) + i7;
            if (i7 < 0) {
                return;
            }
            while (i7 < jArr.length - 2 && i7 < i9) {
                int i10 = i7 + 2;
                long j3 = jArr[i10];
                if ((((int) (j3 >> c3)) & i5) == i6) {
                    long j4 = jArr[i7];
                    int i11 = i7 + 1;
                    i3 = i5;
                    c = c3;
                    long j5 = jArr[i11];
                    c2 = c4;
                    jArr[i7] = (((long) (((int) j4) + i2)) & 4294967295L) | (((long) (((int) (j4 >> 32)) + i)) << 32);
                    jArr[i11] = (((long) (((int) j5) + i2)) & 4294967295L) | (((long) (((int) (j5 >> 32)) + i)) << 32);
                    jArr[i10] = (((j3 >> 63) & 1) << 60) | j3;
                    if ((((int) (j3 >> c2)) & 1023) > 0) {
                        int i12 = axa.b;
                        jArr2[i4] = ((-1125899873288193L) & j3) | (((long) ((i7 + 3) & i3)) << c);
                        i4++;
                    }
                } else {
                    i3 = i5;
                    c = c3;
                    c2 = c4;
                }
                i7 += 3;
                i5 = i3;
                c3 = c;
                c4 = c2;
            }
        }
    }

    public void F(String str, Object... objArr) {
        if (this.b <= 2) {
            Log.v((String) this.c, o(str, objArr));
        }
    }

    public void G(int i, d55 d55Var) {
        int i2 = i & 33554431;
        long[] jArr = (long[]) this.c;
        int i3 = this.b;
        for (int i4 = 0; i4 < jArr.length - 2 && i4 < i3; i4 += 3) {
            if ((((int) jArr[i4 + 2]) & 33554431) == i2) {
                long j = jArr[i4];
                long j2 = jArr[i4 + 1];
                d55Var.k(Integer.valueOf((int) (j >> 32)), Integer.valueOf((int) j), Integer.valueOf((int) (j2 >> 32)), Integer.valueOf((int) j2));
                return;
            }
        }
    }

    public void H(Object obj, Object obj2) {
        int i = this.b + 1;
        Object[] objArr = (Object[]) this.c;
        int length = objArr.length;
        int i2 = i + i;
        if (i2 > length) {
            this.c = Arrays.copyOf(objArr, ugg.b(length, i2));
        }
        br7.F(obj, obj2);
        Object[] objArr2 = (Object[]) this.c;
        int i3 = this.b;
        int i4 = i3 + i3;
        objArr2[i4] = obj;
        objArr2[i4 + 1] = obj2;
        this.b = i3 + 1;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01a8  */
    /* JADX WARN: Type inference failed for: r16v11 */
    /* JADX WARN: Type inference failed for: r16v12 */
    /* JADX WARN: Type inference failed for: r16v13 */
    /* JADX WARN: Type inference failed for: r16v4 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v19, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v24 */
    /* JADX WARN: Type inference failed for: r3v25 */
    /* JADX WARN: Type inference failed for: r3v28 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v33 */
    /* JADX WARN: Type inference failed for: r3v34 */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v8, types: [java.lang.Object[]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.khg I() {
        /*
            Method dump skipped, instruction units count: 476
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xp.I():khg");
    }

    @Override // defpackage.bag
    public /* bridge */ /* synthetic */ bag a() {
        return new xp((t46) this.d);
    }

    @Override // defpackage.bag
    public mpg b(mpg mpgVar, int i, int i2) {
        if (i < 0 || i > i2 || i2 > mpgVar.a.length) {
            throw new IndexOutOfBoundsException();
        }
        byte[] bArr = new byte[i2 - i];
        int i3 = 0;
        while (i < i2) {
            bArr[i3] = c(mpgVar, i);
            i++;
            i3++;
        }
        return mpg.e(bArr);
    }

    @Override // defpackage.bag
    public byte c(mpg mpgVar, int i) {
        byte[] bArr = (byte[]) this.c;
        int i2 = i >>> 3;
        if (i2 != this.b) {
            ((t46) this.d).h(i2, bArr);
            this.b = i2;
        }
        return (byte) (((mpgVar.b(i) ^ bArr[i % 8]) << 24) >> 24);
    }

    public void d(Object obj) {
        int i = this.b;
        if (i == 4) {
            Object[] objArr = new Object[5];
            ((Object[]) this.d)[4] = objArr;
            this.d = objArr;
            i = 0;
        }
        ((Object[]) this.d)[i] = obj;
        this.b = i + 1;
    }

    public void e(int i, it6 it6Var) {
        if (i < 0) {
            e26.a("size should be >=0");
        }
        if (i == 0) {
            return;
        }
        v66 v66Var = new v66(this.b, i, it6Var);
        this.b += i;
        ((o78) this.c).b(v66Var);
    }

    public void f() {
        i42 i42Var;
        ImageView imageView = (ImageView) this.c;
        Drawable drawable = imageView.getDrawable();
        if (drawable != null) {
            lm3.a(drawable);
        }
        if (drawable == null || (i42Var = (i42) this.d) == null) {
            return;
        }
        int[] drawableState = imageView.getDrawableState();
        PorterDuff.Mode mode = j20.b;
        scb.o(drawable, i42Var, drawableState);
    }

    public boolean g(int i, int i2) {
        int iU = u(i);
        return iU == i2 || iU == -1 || iU == -2;
    }

    public void i(String str, Exception exc, Object... objArr) {
        Log.e((String) this.c, o(str, objArr), exc);
    }

    public void j(String str, Object... objArr) {
        Log.e((String) this.c, o(str, objArr));
    }

    public void k(int i) {
        byte[] bArr = (byte[]) this.c;
        if (i > bArr.length) {
            byte[] bArr2 = new byte[bArr.length * 2];
            this.c = bArr2;
            System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        }
    }

    public void l(int i, int i2) {
        if (i > 131072) {
            e26.a("Requested item capacity " + i + " is larger than max supported: 131072!");
        }
        int[] iArr = (int[]) this.c;
        if (iArr.length < i) {
            int length = iArr.length;
            while (length < i) {
                length *= 2;
            }
            int[] iArr2 = new int[length];
            k80.k0(i2, 0, (int[]) this.c, iArr2, 12);
            this.c = iArr2;
        }
    }

    public void m(int i) {
        m70 m70Var = (m70) this.d;
        int i2 = this.b;
        int i3 = i - i2;
        if (i3 < 0 || i3 >= 131072) {
            int iMax = Math.max(i - (((int[]) this.c).length / 2), 0);
            this.b = iMax;
            int i4 = iMax - i2;
            int[] iArr = (int[]) this.c;
            if (i4 >= 0) {
                if (i4 < iArr.length) {
                    k80.h0(0, i4, iArr, iArr, iArr.length);
                }
                int[] iArr2 = (int[]) this.c;
                Arrays.fill(iArr2, Math.max(0, iArr2.length - i4), ((int[]) this.c).length, 0);
            } else {
                int i5 = -i4;
                if (iArr.length + i5 < 131072) {
                    l(iArr.length + i5 + 1, i5);
                } else {
                    if (i5 < iArr.length) {
                        k80.h0(i5, 0, iArr, iArr, iArr.length - i5);
                    }
                    int[] iArr3 = (int[]) this.c;
                    Arrays.fill(iArr3, 0, Math.min(iArr3.length, i5), 0);
                }
            }
        } else {
            l(i3 + 1, 0);
        }
        while (!m70Var.isEmpty() && ((dw6) m70Var.first()).a < this.b) {
            m70Var.removeFirst();
        }
        while (!m70Var.isEmpty() && ((dw6) m70Var.last()).a > this.b + ((int[]) this.c).length) {
            m70Var.removeLast();
        }
    }

    public int n(int i, int i2) {
        do {
            i--;
            if (-1 >= i) {
                return -1;
            }
        } while (!g(i, i2));
        return i;
    }

    public String o(String str, Object... objArr) {
        if (objArr.length > 0) {
            str = String.format(Locale.US, str, objArr);
        }
        return ((String) this.d).concat(str);
    }

    public v66 p(int i) {
        if (i < 0 || i >= this.b) {
            StringBuilder sbC = ev6.C("Index ", i, ", size ");
            sbC.append(this.b);
            e26.e(sbC.toString());
        }
        v66 v66Var = (v66) this.d;
        if (v66Var != null) {
            int i2 = v66Var.a;
            if (i < v66Var.b + i2 && i2 <= i) {
                return v66Var;
            }
        }
        o78 o78Var = (o78) this.c;
        v66 v66Var2 = (v66) o78Var.a[guc.v(i, o78Var)];
        this.d = v66Var2;
        return v66Var2;
    }

    public String q() {
        String str = (String) this.d;
        if (str != null) {
            return str;
        }
        int i = this.b;
        if (i < 2) {
            this.d = "UTF-8";
            return "UTF-8";
        }
        byte[] bArr = (byte[]) this.c;
        byte b = bArr[0];
        if (b == 0) {
            if (i < 4 || bArr[1] != 0) {
                this.d = "UTF-16BE";
                return "UTF-16BE";
            }
            if ((bArr[2] & 255) == 254 && (bArr[3] & 255) == 255) {
                this.d = "UTF-32BE";
                return "UTF-32BE";
            }
            this.d = "UTF-32";
            return "UTF-32";
        }
        if ((b & 255) < 128) {
            if (bArr[1] != 0) {
                this.d = "UTF-8";
                return "UTF-8";
            }
            if (i < 4 || bArr[2] != 0) {
                this.d = "UTF-16LE";
                return "UTF-16LE";
            }
            this.d = "UTF-32LE";
            return "UTF-32LE";
        }
        if ((b & 255) == 239) {
            this.d = "UTF-8";
            return "UTF-8";
        }
        if ((b & 255) == 254) {
            this.d = "UTF-16";
            return "UTF-16";
        }
        if (i < 4 || bArr[2] != 0) {
            this.d = "UTF-16";
            return "UTF-16";
        }
        this.d = "UTF-32";
        return "UTF-32";
    }

    public int[] r(int i) {
        m70 m70Var = (m70) this.d;
        dw6 dw6Var = (dw6) bu1.A0(B(i, m70Var), m70Var);
        if (dw6Var != null) {
            return dw6Var.b;
        }
        return null;
    }

    public int s(Object obj) {
        t68 t68Var = (t68) this.c;
        int iD = t68Var.d(obj);
        if (iD >= 0) {
            return t68Var.c[iD];
        }
        return -1;
    }

    public Object t(int i) {
        Object[] objArr = (Object[]) this.d;
        int i2 = i - this.b;
        if (i2 < 0 || i2 >= objArr.length) {
            return null;
        }
        return objArr[i2];
    }

    public String toString() {
        switch (this.a) {
            case 6:
                return v();
            case 13:
                StringBuilder sb = new StringBuilder();
                if (((c8a) this.c) == c8a.HTTP_1_0) {
                    sb.append("HTTP/1.0");
                } else {
                    sb.append("HTTP/1.1");
                }
                sb.append(' ');
                sb.append(this.b);
                sb.append(' ');
                sb.append((String) this.d);
                return sb.toString();
            default:
                return super.toString();
        }
    }

    public int u(int i) {
        int i2 = this.b;
        if (i < i2) {
            return -1;
        }
        if (i >= ((int[]) this.c).length + i2) {
            return -1;
        }
        return r2[i - i2] - 1;
    }

    public void w(int i, int i2, int i3, int i4, int i5, int i6, boolean z, boolean z2, boolean z3, int i7) {
        long[] jArr = (long[]) this.c;
        int i8 = this.b;
        int i9 = i8 + 3;
        this.b = i9;
        int length = jArr.length;
        if (length <= i9) {
            int iMax = Math.max(length * 2, i9);
            this.c = Arrays.copyOf(jArr, iMax);
            this.d = Arrays.copyOf((long[]) this.d, iMax);
        }
        long[] jArr2 = (long[]) this.c;
        jArr2[i8] = (((long) i2) << 32) | (((long) i3) & 4294967295L);
        jArr2[i8 + 1] = (((long) i4) << 32) | (((long) i5) & 4294967295L);
        int i10 = i6 & 33554431;
        jArr2[i8 + 2] = ((z3 ? 1L : 0L) << 63) | ((z2 ? 1L : 0L) << 62) | ((z ? 1L : 0L) << 61) | 1152921504606846976L | (((long) Math.min(0, 1023)) << 50) | (((long) i10) << 25) | ((long) (i & 33554431));
        if (i6 < 0) {
            return;
        }
        for (int i11 = i7 != -1 ? i7 : i8 - 3; i11 >= 0; i11 -= 3) {
            int i12 = i11 + 2;
            long j = jArr2[i12];
            if ((((int) j) & 33554431) == i10) {
                int i13 = (i8 - i11) / 3;
                int i14 = axa.b;
                jArr2[i12] = (((long) Math.min(i13, 1023)) << 50) | (j & (-1151795604700004353L));
                return;
            }
        }
    }

    public boolean y() {
        ColorStateList colorStateList;
        return ((Shader) this.c) == null && (colorStateList = (ColorStateList) this.d) != null && colorStateList.isStateful();
    }

    public void z(AttributeSet attributeSet, int i) {
        int resourceId;
        ImageView imageView = (ImageView) this.c;
        Context context = imageView.getContext();
        int[] iArr = esa.f;
        vwa vwaVarX = vwa.x(context, attributeSet, iArr, i);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        ute.n(imageView, imageView.getContext(), iArr, attributeSet, (TypedArray) vwaVarX.c, i);
        try {
            Drawable drawable = imageView.getDrawable();
            if (drawable == null && (resourceId = typedArray.getResourceId(1, -1)) != -1 && (drawable = guc.E(imageView.getContext(), resourceId)) != null) {
                imageView.setImageDrawable(drawable);
            }
            if (drawable != null) {
                lm3.a(drawable);
            }
            if (typedArray.hasValue(2)) {
                imageView.setImageTintList(vwaVarX.o(2));
            }
            if (typedArray.hasValue(3)) {
                imageView.setImageTintMode(lm3.b(typedArray.getInt(3, -1), null));
            }
            vwaVarX.C();
        } catch (Throwable th) {
            vwaVarX.C();
            throw th;
        }
    }

    public String v() {
        StringBuilder sb = new StringBuilder(MaAxRJinch.sXOFrIQmayMVIe);
        int i = this.b + 1;
        for (int i2 = 0; i2 < i; i2++) {
            Object obj = ((Object[]) this.c)[i2];
            if (obj instanceof xzb) {
                xzb xzbVar = (xzb) obj;
                boolean zL = g76.L(xzbVar.j(), wuc.f);
                int[] iArr = (int[]) this.d;
                if (!zL) {
                    int i3 = iArr[i2];
                    if (i3 >= 0) {
                        sb.append(".");
                        sb.append(xzbVar.f(i3));
                    }
                } else if (iArr[i2] != -1) {
                    sb.append("[");
                    sb.append(((int[]) this.d)[i2]);
                    sb.append("]");
                }
            } else if (obj != tz7.i) {
                sb.append("['");
                sb.append(obj);
                sb.append("']");
            }
        }
        return sb.toString();
    }

    public xp(t46 t46Var) {
        this.a = 15;
        this.b = -1;
        this.c = new byte[8];
        this.d = t46Var;
    }

    public xp(String str, String[] strArr) {
        String string;
        this.a = 8;
        if (strArr.length == 0) {
            string = "";
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append('[');
            for (String str2 : strArr) {
                if (sb.length() > 1) {
                    sb.append(",");
                }
                sb.append(str2);
            }
            sb.append("] ");
            string = sb.toString();
        }
        this.d = string;
        this.c = str;
        int i = 2;
        Object[] objArr = {str, 23};
        if (str.length() <= 23) {
            while (i <= 7 && !Log.isLoggable((String) this.c, i)) {
                i++;
            }
            this.b = i;
            return;
        }
        throw new IllegalArgumentException(String.format("tag \"%s\" is longer than the %d character maximum", objArr));
    }

    public xp(int i) {
        this.a = 16;
        this.c = new Object[i + i];
        this.b = 0;
    }

    public xp(c8a c8aVar, int i, String str) {
        this.a = 13;
        c8aVar.getClass();
        this.c = c8aVar;
        this.b = i;
        this.d = str;
    }

    public xp(ArrayList arrayList, int i, MotionEvent motionEvent) {
        this.a = 0;
        this.c = arrayList;
        this.b = i;
        this.d = motionEvent;
        if (arrayList.isEmpty()) {
            ay0.e("changes cannot be empty");
            throw null;
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public xp(int i, byte b) {
        this(4);
        this.a = i;
        switch (i) {
            case 7:
                this.c = new int[16];
                this.d = new m70();
                break;
            case 9:
                this.c = new o78(new v66[16]);
                break;
            case 16:
                break;
            default:
                Object[] objArr = new Object[5];
                this.c = objArr;
                this.d = objArr;
                break;
        }
    }

    public xp(ImageView imageView) {
        this.a = 1;
        this.b = 0;
        this.c = imageView;
    }

    public /* synthetic */ xp(char c, int i) {
        this.a = i;
    }

    public xp(Shader shader, ColorStateList colorStateList, int i) {
        this.a = 5;
        this.c = shader;
        this.d = colorStateList;
        this.b = i;
    }

    public xp(zte zteVar) {
        this.a = 4;
        this.c = zteVar;
    }
}
