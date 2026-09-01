package defpackage;

import android.graphics.Typeface;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.widget.TextView;
import com.google.android.recaptcha.internal.zzacz;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.Character;
import java.lang.ref.WeakReference;
import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class h30 {
    public final /* synthetic */ int a;
    public int b;
    public int c;
    public Object d;
    public Object e;

    public h30(CharSequence charSequence, int i, Locale locale) {
        this.a = 5;
        this.d = charSequence;
        if (charSequence.length() < 0) {
            c26.a("input start index is outside the CharSequence");
        }
        if (i < 0 || i > charSequence.length()) {
            c26.a("input end index is outside the CharSequence");
        }
        BreakIterator wordInstance = BreakIterator.getWordInstance(locale);
        this.e = wordInstance;
        this.b = Math.max(0, -50);
        this.c = Math.min(charSequence.length(), i + 50);
        wordInstance.setText(new sk1(charSequence, i));
    }

    public static int c(int i, int i2) {
        return e(i2) + j(i);
    }

    public static int c0(int i) {
        return (352 - (Integer.numberOfLeadingZeros(i) * 9)) >>> 6;
    }

    public static int d(int i, int i2) {
        return e(i2) + j(i);
    }

    public static int d0(long j) {
        return (640 - (Long.numberOfLeadingZeros(j) * 9)) >>> 6;
    }

    public static int e(int i) {
        if (i >= 0) {
            return h(i);
        }
        return 10;
    }

    public static int f(int i, q1 q1Var) {
        return g(q1Var) + j(i);
    }

    public static int g(q1 q1Var) {
        int iA = q1Var.a();
        return h(iA) + iA;
    }

    public static int h(int i) {
        if ((i & (-128)) == 0) {
            return 1;
        }
        if ((i & (-16384)) == 0) {
            return 2;
        }
        if (((-2097152) & i) == 0) {
            return 3;
        }
        return (i & (-268435456)) == 0 ? 4 : 5;
    }

    public static int i(long j) {
        if (((-128) & j) == 0) {
            return 1;
        }
        if (((-16384) & j) == 0) {
            return 2;
        }
        if (((-2097152) & j) == 0) {
            return 3;
        }
        if (((-268435456) & j) == 0) {
            return 4;
        }
        if (((-34359738368L) & j) == 0) {
            return 5;
        }
        if (((-4398046511104L) & j) == 0) {
            return 6;
        }
        if (((-562949953421312L) & j) == 0) {
            return 7;
        }
        if (((-72057594037927936L) & j) == 0) {
            return 8;
        }
        return (j & Long.MIN_VALUE) == 0 ? 9 : 10;
    }

    public static int j(int i) {
        return h(i << 3);
    }

    public static h30 t(OutputStream outputStream, int i) {
        return new h30(outputStream, new byte[i]);
    }

    public void A(int i, int i2, int i3) {
        int i4 = i - 2;
        int i5 = i2 - 2;
        s(i4, i5, i3, 1);
        int i6 = i2 - 1;
        s(i4, i6, i3, 2);
        int i7 = i - 1;
        s(i7, i5, i3, 3);
        s(i7, i6, i3, 4);
        s(i7, i2, i3, 5);
        s(i, i5, i3, 6);
        s(i, i6, i3, 7);
        s(i, i2, i3, 8);
    }

    public void B(int i, int i2) throws IOException {
        N(i, 0);
        D(i2);
    }

    public void C(int i, int i2) throws IOException {
        N(i, 0);
        D(i2);
    }

    public void D(int i) throws IOException {
        if (i >= 0) {
            L(i);
        } else {
            M(i);
        }
    }

    public void E(int i, q1 q1Var) throws IOException {
        N(i, 2);
        F(q1Var);
    }

    public void F(q1 q1Var) throws IOException {
        L(q1Var.a());
        q1Var.d(this);
    }

    public void G(int i) throws IOException {
        byte b = (byte) i;
        if (this.c == this.b) {
            y();
        }
        byte[] bArr = (byte[]) this.d;
        int i2 = this.c;
        this.c = i2 + 1;
        bArr[i2] = b;
    }

    public void I(byte[] bArr) throws IOException {
        int length = bArr.length;
        int i = this.b;
        int i2 = this.c;
        int i3 = i - i2;
        byte[] bArr2 = (byte[]) this.d;
        if (i3 >= length) {
            System.arraycopy(bArr, 0, bArr2, i2, length);
            this.c += length;
            return;
        }
        System.arraycopy(bArr, 0, bArr2, i2, i3);
        int i4 = length - i3;
        this.c = i;
        y();
        if (i4 > i) {
            ((OutputStream) this.e).write(bArr, i3, i4);
        } else {
            System.arraycopy(bArr, i3, bArr2, 0, i4);
            this.c = i4;
        }
    }

    public void J(int i) throws IOException {
        G(i & 255);
        G((i >> 8) & 255);
        G((i >> 16) & 255);
        G((i >> 24) & 255);
    }

    public void K(long j) throws IOException {
        G(((int) j) & 255);
        G(((int) (j >> 8)) & 255);
        G(((int) (j >> 16)) & 255);
        G(((int) (j >> 24)) & 255);
        G(((int) (j >> 32)) & 255);
        G(((int) (j >> 40)) & 255);
        G(((int) (j >> 48)) & 255);
        G(((int) (j >> 56)) & 255);
    }

    public void L(int i) throws IOException {
        while ((i & (-128)) != 0) {
            G((i & 127) | 128);
            i >>>= 7;
        }
        G(i);
    }

    public void M(long j) throws IOException {
        while (((-128) & j) != 0) {
            G((((int) j) & 127) | 128);
            j >>>= 7;
        }
        G((int) j);
    }

    public void N(int i, int i2) throws IOException {
        L((i << 3) | i2);
    }

    public void O(int i, int i2) throws zzacz {
        X((i << 3) | i2);
    }

    public void P(int i, int i2) throws zzacz {
        X(i << 3);
        W(i2);
    }

    public void Q(int i, int i2) throws zzacz {
        X(i << 3);
        X(i2);
    }

    public void R(int i, int i2) throws zzacz {
        X((i << 3) | 5);
        Y(i2);
    }

    public void S(int i, long j) throws zzacz {
        X(i << 3);
        Z(j);
    }

    public void T(int i, long j) throws zzacz {
        X((i << 3) | 1);
        a0(j);
    }

    public void U(int i, String str) throws zzacz {
        X((i << 3) | 2);
        byte[] bArr = (byte[]) this.e;
        int i2 = this.c;
        try {
            int iC0 = c0(str.length() * 3);
            int iC02 = c0(str.length());
            if (iC02 != iC0) {
                int i3 = lpf.a;
                X(mo7.X(str));
                int i4 = this.c;
                this.c = lpf.b(str, bArr, i4, bArr.length - i4);
                return;
            }
            int i5 = i2 + iC02;
            this.c = i5;
            int iB = lpf.b(str, bArr, i5, bArr.length - i5);
            this.c = i2;
            X((iB - i2) - iC02);
            this.c = iB;
        } catch (IndexOutOfBoundsException e) {
            throw new zzacz("CodedOutputStream was writing to a flat byte array and ran out of space.", e);
        }
    }

    public void V(int i, pmf pmfVar) throws zzacz {
        X((i << 3) | 2);
        X(pmfVar.m());
        pmfVar.t(this);
    }

    public void W(int i) throws zzacz {
        IndexOutOfBoundsException indexOutOfBoundsException;
        byte[] bArr;
        int i2;
        int i3;
        int i4;
        if (i >= 0) {
            X(i);
            return;
        }
        int i5 = this.c;
        try {
            bArr = (byte[]) this.e;
            long j = i;
            i2 = i5 + 1;
            try {
                bArr[i5] = (byte) (((int) j) | 128);
                int i6 = i5 + 2;
                try {
                    bArr[i2] = (byte) (((int) (j >>> 7)) | 128);
                    int i7 = i5 + 3;
                    bArr[i6] = (byte) (((int) (j >>> 14)) | 128);
                    i6 = i5 + 4;
                    bArr[i7] = (byte) (((int) (j >>> 21)) | 128);
                    i3 = i5 + 5;
                    bArr[i6] = (byte) (((int) (j >>> 28)) | 128);
                    i4 = i5 + 6;
                } catch (IndexOutOfBoundsException e) {
                    indexOutOfBoundsException = e;
                    i5 = i6;
                }
            } catch (IndexOutOfBoundsException e2) {
                i5 = i2;
                indexOutOfBoundsException = e2;
            }
        } catch (IndexOutOfBoundsException e3) {
            indexOutOfBoundsException = e3;
        }
        try {
            bArr[i3] = -1;
            int i8 = i5 + 7;
            bArr[i4] = -1;
            i4 = i5 + 8;
            bArr[i8] = -1;
            i2 = i5 + 9;
            bArr[i4] = -1;
            i5 += 10;
            bArr[i2] = 1;
            this.c = i5;
        } catch (IndexOutOfBoundsException e4) {
            indexOutOfBoundsException = e4;
            i5 = i4;
            throw new zzacz(i5, this.b, 10, indexOutOfBoundsException);
        }
    }

    public void X(int i) throws zzacz {
        IndexOutOfBoundsException indexOutOfBoundsException;
        int i2 = this.c;
        int i3 = i & (-128);
        byte[] bArr = (byte[]) this.e;
        try {
        } catch (IndexOutOfBoundsException e) {
            indexOutOfBoundsException = e;
        }
        if (i3 == 0) {
            int i4 = i2 + 1;
            bArr[i2] = (byte) i;
            this.c = i4;
            return;
        }
        int i5 = i2 + 1;
        bArr[i2] = (byte) (i | 128);
        int i6 = i >>> 7;
        try {
        } catch (IndexOutOfBoundsException e2) {
            i3 = i;
            indexOutOfBoundsException = e2;
        }
        if ((i6 & (-128)) == 0) {
            int i7 = i2 + 2;
            bArr[i5] = (byte) i6;
            this.c = i7;
            return;
        }
        int i8 = i2 + 2;
        try {
            bArr[i5] = (byte) (i6 | 128);
            int i9 = i >>> 14;
            if ((i9 & (-128)) == 0) {
                int i10 = i2 + 3;
                bArr[i8] = (byte) i9;
                this.c = i10;
                return;
            }
            int i11 = i2 + 3;
            try {
                bArr[i8] = (byte) (i9 | 128);
                int i12 = i >>> 21;
                if ((i12 & (-128)) == 0) {
                    int i13 = i2 + 4;
                    bArr[i11] = (byte) i12;
                    this.c = i13;
                    return;
                } else {
                    i8 = i2 + 4;
                    bArr[i11] = (byte) (i12 | 128);
                    int i14 = i2 + 5;
                    bArr[i8] = (byte) (i >>> 28);
                    this.c = i14;
                    return;
                }
            } catch (IndexOutOfBoundsException e3) {
                indexOutOfBoundsException = e3;
                i3 = i11;
            }
        } catch (IndexOutOfBoundsException e4) {
            indexOutOfBoundsException = e4;
            i3 = i8;
        }
        throw new zzacz(i3, this.b, 1, indexOutOfBoundsException);
    }

    public void Y(int i) throws zzacz {
        int i2 = this.c;
        try {
            byte[] bArr = (byte[]) this.e;
            bArr[i2] = (byte) i;
            bArr[i2 + 1] = (byte) (i >> 8);
            bArr[i2 + 2] = (byte) (i >> 16);
            bArr[i2 + 3] = (byte) (i >> 24);
            this.c = i2 + 4;
        } catch (IndexOutOfBoundsException e) {
            throw new zzacz(i2, this.b, 4, e);
        }
    }

    public void Z(long j) throws zzacz {
        long j2 = j & (-128);
        int i = this.c;
        byte[] bArr = (byte[]) this.e;
        try {
            if (j2 == 0) {
                bArr[i] = (byte) j;
                this.c = i + 1;
                return;
            }
            bArr[i] = (byte) (((int) j) | 128);
            int i2 = i + 1;
            long j3 = j >>> 7;
            long j4 = j3 & (-128);
            int i3 = (int) j3;
            if (j4 == 0) {
                bArr[i2] = (byte) i3;
                this.c = i + 2;
                return;
            }
            bArr[i2] = (byte) (i3 | 128);
            int i4 = i + 2;
            long j5 = j >>> 14;
            long j6 = j5 & (-128);
            int i5 = (int) j5;
            if (j6 == 0) {
                bArr[i4] = (byte) i5;
                this.c = i + 3;
                return;
            }
            bArr[i4] = (byte) (i5 | 128);
            int i6 = i + 3;
            long j7 = j >>> 21;
            long j8 = j7 & (-128);
            int i7 = (int) j7;
            if (j8 == 0) {
                bArr[i6] = (byte) i7;
                this.c = i + 4;
                return;
            }
            bArr[i6] = (byte) (i7 | 128);
            int i8 = i + 4;
            long j9 = j >>> 28;
            long j10 = j9 & (-128);
            int i9 = (int) j9;
            if (j10 == 0) {
                bArr[i8] = (byte) i9;
                this.c = i + 5;
                return;
            }
            bArr[i8] = (byte) (i9 | 128);
            int i10 = i + 5;
            long j11 = j >>> 35;
            long j12 = j11 & (-128);
            int i11 = (int) j11;
            if (j12 == 0) {
                bArr[i10] = (byte) i11;
                this.c = i + 6;
                return;
            }
            bArr[i10] = (byte) (i11 | 128);
            int i12 = i + 6;
            long j13 = j >>> 42;
            long j14 = j13 & (-128);
            int i13 = (int) j13;
            if (j14 == 0) {
                bArr[i12] = (byte) i13;
                this.c = i + 7;
                return;
            }
            bArr[i12] = (byte) (i13 | 128);
            int i14 = i + 7;
            long j15 = j >>> 49;
            long j16 = j15 & (-128);
            int i15 = (int) j15;
            if (j16 == 0) {
                bArr[i14] = (byte) i15;
                this.c = i + 8;
                return;
            }
            bArr[i14] = (byte) (i15 | 128);
            int i16 = i + 8;
            long j17 = j >>> 56;
            int i17 = (int) j17;
            if (((-128) & j17) == 0) {
                bArr[i16] = (byte) i17;
                this.c = i + 9;
            } else {
                bArr[i16] = (byte) (i17 | 128);
                bArr[i + 9] = (byte) (j >>> 63);
                this.c = i + 10;
            }
        } catch (IndexOutOfBoundsException e) {
            throw new zzacz(i, this.b, 1, e);
        }
    }

    public void a(int i) {
        new Handler(Looper.getMainLooper()).post(new yy(i, 3, this));
    }

    public void a0(long j) throws zzacz {
        int i = this.c;
        try {
            byte[] bArr = (byte[]) this.e;
            bArr[i] = (byte) j;
            bArr[i + 1] = (byte) (j >> 8);
            bArr[i + 2] = (byte) (j >> 16);
            bArr[i + 3] = (byte) (j >> 24);
            bArr[i + 4] = (byte) (j >> 32);
            bArr[i + 5] = (byte) (j >> 40);
            bArr[i + 6] = (byte) (j >> 48);
            bArr[i + 7] = (byte) (j >> 56);
            this.c = i + 8;
        } catch (IndexOutOfBoundsException e) {
            throw new zzacz(i, this.b, 8, e);
        }
    }

    public void b(int i) {
        int i2 = this.b;
        int i3 = this.c;
        boolean z = false;
        if (i <= i3 && i2 <= i) {
            z = true;
        }
        if (z) {
            return;
        }
        StringBuilder sbB = ev6.B(i, i2, "Invalid offset: ", ". Valid range is [", " , ");
        sbB.append(i3);
        sbB.append(']');
        c26.a(sbB.toString());
    }

    public void b0(byte[] bArr, int i, int i2) throws zzacz {
        try {
            System.arraycopy(bArr, i, (byte[]) this.e, this.c, i2);
            this.c += i2;
        } catch (IndexOutOfBoundsException e) {
            throw new zzacz(this.c, this.b, i2, e);
        }
    }

    public void k() throws IOException {
        y();
    }

    public int l() {
        ym0 ym0Var = (ym0) this.e;
        String str = (String) this.d;
        if (ym0Var == null) {
            return str.length();
        }
        return (ym0Var.b - ym0Var.f()) + (str.length() - (this.c - this.b));
    }

    public boolean m(int i) {
        CharSequence charSequence = (CharSequence) this.d;
        int i2 = this.b + 1;
        if (i > this.c || i2 > i) {
            return false;
        }
        if (!Character.isLetterOrDigit(Character.codePointBefore(charSequence, i))) {
            int i3 = i - 1;
            if (!Character.isSurrogate(charSequence.charAt(i3))) {
                if (!yw3.d()) {
                    return false;
                }
                yw3 yw3VarA = yw3.a();
                if (yw3VarA.c() != 1 || yw3VarA.b(charSequence, i3) == -1) {
                    return false;
                }
            }
        }
        return true;
    }

    public boolean n(int i) {
        int i2 = this.b + 1;
        if (i > this.c || i2 > i) {
            return false;
        }
        return mk7.B(Character.codePointBefore((CharSequence) this.d, i));
    }

    public boolean o(int i) {
        b(i);
        if (!((BreakIterator) this.e).isBoundary(i)) {
            return false;
        }
        if (q(i) && q(i - 1) && q(i + 1)) {
            return false;
        }
        return i <= 0 || i >= ((CharSequence) this.d).length() - 1 || !(p(i) || p(i + 1));
    }

    public boolean p(int i) {
        CharSequence charSequence = (CharSequence) this.d;
        int i2 = i - 1;
        Character.UnicodeBlock unicodeBlockOf = Character.UnicodeBlock.of(charSequence.charAt(i2));
        Character.UnicodeBlock unicodeBlock = Character.UnicodeBlock.HIRAGANA;
        if (g76.L(unicodeBlockOf, unicodeBlock) && g76.L(Character.UnicodeBlock.of(charSequence.charAt(i)), Character.UnicodeBlock.KATAKANA)) {
            return true;
        }
        return g76.L(Character.UnicodeBlock.of(charSequence.charAt(i)), unicodeBlock) && g76.L(Character.UnicodeBlock.of(charSequence.charAt(i2)), Character.UnicodeBlock.KATAKANA);
    }

    public boolean q(int i) {
        CharSequence charSequence = (CharSequence) this.d;
        int i2 = this.b;
        if (i >= this.c || i2 > i) {
            return false;
        }
        if (!Character.isLetterOrDigit(Character.codePointAt(charSequence, i)) && !Character.isSurrogate(charSequence.charAt(i))) {
            if (!yw3.d()) {
                return false;
            }
            yw3 yw3VarA = yw3.a();
            if (yw3VarA.c() != 1 || yw3VarA.b(charSequence, i) == -1) {
                return false;
            }
        }
        return true;
    }

    public boolean r(int i) {
        int i2 = this.b;
        if (i >= this.c || i2 > i) {
            return false;
        }
        return mk7.B(Character.codePointAt((CharSequence) this.d, i));
    }

    public void s(int i, int i2, int i3, int i4) {
        int i5 = this.c;
        if (i < 0) {
            int i6 = this.b;
            i += i6;
            i2 += 4 - ((i6 + 4) % 8);
        }
        if (i2 < 0) {
            i2 += i5;
            i += 4 - ((i5 + 4) % 8);
        }
        ((byte[]) this.e)[(i * i5) + i2] = (byte) ((((String) this.d).charAt(i3) & (1 << (8 - i4))) == 0 ? 0 : 1);
    }

    public String toString() {
        switch (this.a) {
            case 4:
                ym0 ym0Var = (ym0) this.e;
                String str = (String) this.d;
                if (ym0Var == null) {
                    return str;
                }
                StringBuilder sb = new StringBuilder();
                sb.append((CharSequence) str, 0, this.b);
                sb.append((char[]) ym0Var.e, 0, ym0Var.c);
                char[] cArr = (char[]) ym0Var.e;
                int i = ym0Var.d;
                sb.append(cArr, i, ym0Var.b - i);
                String str2 = (String) this.d;
                sb.append((CharSequence) str2, this.c, str2.length());
                return sb.toString();
            default:
                return super.toString();
        }
    }

    public int u(int i) {
        b(i);
        int iFollowing = ((BreakIterator) this.e).following(i);
        return (q(iFollowing + (-1)) && q(iFollowing) && !p(iFollowing)) ? u(iFollowing) : iFollowing;
    }

    public void v(int i) {
    }

    public void w(Typeface typeface) {
        int i;
        if (Build.VERSION.SDK_INT >= 28 && (i = this.b) != -1) {
            typeface = m30.a(typeface, i, (this.c & 2) != 0);
        }
        n30 n30Var = (n30) this.e;
        WeakReference weakReference = (WeakReference) this.d;
        if (n30Var.m) {
            n30Var.l = typeface;
            TextView textView = (TextView) weakReference.get();
            if (textView != null) {
                boolean zIsAttachedToWindow = textView.isAttachedToWindow();
                int i2 = n30Var.j;
                if (zIsAttachedToWindow) {
                    textView.post(new i30(textView, typeface, i2));
                } else {
                    textView.setTypeface(typeface, i2);
                }
            }
        }
    }

    public int x(int i) {
        b(i);
        int iPreceding = ((BreakIterator) this.e).preceding(i);
        return (q(iPreceding) && m(iPreceding) && !p(iPreceding)) ? x(iPreceding) : iPreceding;
    }

    public void y() throws IOException {
        ((OutputStream) this.e).write((byte[]) this.d, 0, this.c);
        this.c = 0;
    }

    public void z(int i, int i2, String str) {
        if (i > i2) {
            c26.a("start index must be less than or equal to end index: " + i + " > " + i2);
        }
        if (i < 0) {
            c26.a("start must be non-negative, but was " + i);
        }
        ym0 ym0Var = (ym0) this.e;
        if (ym0Var == null) {
            int iMax = Math.max(255, str.length() + 128);
            char[] cArr = new char[iMax];
            int iMin = Math.min(i, 64);
            int iMin2 = Math.min(((String) this.d).length() - i2, 64);
            String str2 = (String) this.d;
            int i3 = i - iMin;
            str2.getClass();
            str2.getChars(i3, i, cArr, 0);
            String str3 = (String) this.d;
            int i4 = iMax - iMin2;
            int i5 = iMin2 + i2;
            str3.getClass();
            str3.getChars(i2, i5, cArr, i4);
            str.getChars(0, str.length(), cArr, iMin);
            int length = str.length() + iMin;
            ym0 ym0Var2 = new ym0(1);
            ym0Var2.b = iMax;
            ym0Var2.e = cArr;
            ym0Var2.c = length;
            ym0Var2.d = i4;
            this.e = ym0Var2;
            this.b = i3;
            this.c = i5;
            return;
        }
        int i6 = this.b;
        int i7 = i - i6;
        int i8 = i2 - i6;
        if (i7 < 0 || i8 > ym0Var.b - ym0Var.f()) {
            this.d = toString();
            this.e = null;
            this.b = -1;
            this.c = -1;
            z(i, i2, str);
            return;
        }
        int length2 = str.length() - (i8 - i7);
        if (length2 > ym0Var.f()) {
            int iF = length2 - ym0Var.f();
            int i9 = ym0Var.b;
            do {
                i9 *= 2;
            } while (i9 - ym0Var.b < iF);
            char[] cArr2 = new char[i9];
            System.arraycopy((char[]) ym0Var.e, 0, cArr2, 0, ym0Var.c);
            int i10 = ym0Var.b;
            int i11 = ym0Var.d;
            int i12 = i10 - i11;
            int i13 = i9 - i12;
            System.arraycopy((char[]) ym0Var.e, i11, cArr2, i13, (i12 + i11) - i11);
            ym0Var.e = cArr2;
            ym0Var.b = i9;
            ym0Var.d = i13;
        }
        int i14 = ym0Var.c;
        if (i7 < i14 && i8 <= i14) {
            int i15 = i14 - i8;
            char[] cArr3 = (char[]) ym0Var.e;
            System.arraycopy(cArr3, i8, cArr3, ym0Var.d - i15, i15);
            ym0Var.c = i7;
            ym0Var.d -= i15;
        } else if (i7 >= i14 || i8 < i14) {
            int iF2 = ym0Var.f() + i7;
            int iF3 = ym0Var.f() + i8;
            int i16 = ym0Var.d;
            int i17 = iF2 - i16;
            char[] cArr4 = (char[]) ym0Var.e;
            System.arraycopy(cArr4, i16, cArr4, ym0Var.c, i17);
            i7 = ym0Var.c + i17;
            ym0Var.c = i7;
            ym0Var.d = iF3;
        } else {
            ym0Var.d = ym0Var.f() + i8;
            ym0Var.c = i7;
        }
        str.getChars(0, str.length(), (char[]) ym0Var.e, i7);
        ym0Var.c = str.length() + ym0Var.c;
    }

    public void H(g21 g21Var) throws IOException {
        int size = g21Var.size();
        int i = this.b;
        int i2 = this.c;
        int i3 = i - i2;
        byte[] bArr = (byte[]) this.d;
        if (i3 >= size) {
            g21Var.f(0, i2, size, bArr);
            this.c += size;
            return;
        }
        g21Var.f(0, i2, i3, bArr);
        int i4 = size - i3;
        this.c = i;
        y();
        if (i4 <= i) {
            g21Var.f(i3, 0, i4, bArr);
            this.c = i4;
            return;
        }
        OutputStream outputStream = (OutputStream) this.e;
        if (i3 >= 0) {
            if (i4 >= 0) {
                int i5 = i3 + i4;
                if (i5 <= g21Var.size()) {
                    if (i4 > 0) {
                        g21Var.y(outputStream, i3, i4);
                        return;
                    }
                    return;
                }
                ay0.c(39, i5, "Source end offset exceeded: ");
                return;
            }
            ay0.c(23, i4, "Length < 0: ");
            return;
        }
        ay0.c(30, i3, uvlZTF.tKQgXphwfFQVw);
    }

    public h30(byte[] bArr, int i) {
        this.a = 6;
        int length = bArr.length;
        if (((length - i) | i) >= 0) {
            this.e = bArr;
            this.c = 0;
            this.b = i;
        } else {
            Locale locale = Locale.US;
            ay0.e(ev6.v("Array range is invalid. Buffer.length=", length, i, ", offset=0, length="));
            throw null;
        }
    }

    public /* synthetic */ h30() {
        this.a = 4;
    }

    public h30(String str, int i, int i2) {
        this.a = 2;
        this.d = str;
        this.c = i;
        this.b = i2;
        byte[] bArr = new byte[i * i2];
        this.e = bArr;
        Arrays.fill(bArr, (byte) -1);
    }

    public h30(OutputStream outputStream, byte[] bArr) {
        this.a = 1;
        this.e = outputStream;
        this.d = bArr;
        this.c = 0;
        this.b = bArr.length;
    }

    public h30(ArrayList arrayList, ArrayList arrayList2) {
        this.a = 3;
        this.b = op8.Y(arrayList);
        this.c = op8.Y(arrayList2);
        this.d = arrayList;
        this.e = arrayList2;
    }

    public h30(n30 n30Var, int i, int i2, WeakReference weakReference) {
        this.a = 0;
        this.e = n30Var;
        this.b = i;
        this.c = i2;
        this.d = weakReference;
    }
}
