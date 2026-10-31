package wf;

import android.media.MediaFormat;
import android.net.Uri;
import android.opengl.GLES20;
import android.opengl.GLU;
import android.os.Bundle;
import android.os.Trace;
import android.text.TextUtils;
import android.util.Log;
import b.c0;
import com.google.android.exoplayer2.util.GlUtil$GlException;
import com.google.android.gms.internal.measurement.k2;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import ke.x;
import org.xmlpull.v1.XmlPullParser;
import xk.r2;
import xk.s0;
import xk.v0;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f94304a = {0, 0, 0, 1};

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f94305b = {com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "A", "B", "C"};

    /* renamed from: c, reason: collision with root package name */
    public static final Object f94306c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public static final byte[] f94307d = {0, 0, 0, 1};

    /* renamed from: e, reason: collision with root package name */
    public static final float[] f94308e = {1.0f, 1.0f, 1.0909091f, 0.90909094f, 1.4545455f, 1.2121212f, 2.1818182f, 1.8181819f, 2.909091f, 2.4242425f, 1.6363636f, 1.3636364f, 1.939394f, 1.6161616f, 1.3333334f, 1.5f, 2.0f};

    /* renamed from: f, reason: collision with root package name */
    public static final Object f94309f = new Object();

    /* renamed from: g, reason: collision with root package name */
    public static int[] f94310g = new int[10];

    /* JADX WARN: Removed duplicated region for block: B:63:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0151  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0164  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static m A(int i5, int i11, byte[] bArr) {
        int iL;
        boolean zH;
        x xVar;
        int i12;
        int iL2;
        boolean z11;
        boolean zH2;
        int i13;
        x xVar2 = new x(bArr, i5 + 1, i11);
        int i14 = 8;
        int i15 = xVar2.i(8);
        int i16 = xVar2.i(8);
        int i17 = xVar2.i(8);
        int iL3 = xVar2.l();
        if (i15 == 100 || i15 == 110 || i15 == 122 || i15 == 244 || i15 == 44 || i15 == 83 || i15 == 86 || i15 == 118 || i15 == 128 || i15 == 138) {
            iL = xVar2.l();
            zH = iL == 3 ? xVar2.h() : false;
            xVar2.l();
            xVar2.l();
            xVar2.q();
            if (xVar2.h()) {
                int i18 = iL != 3 ? 8 : 12;
                int i19 = 0;
                while (i19 < i18) {
                    if (xVar2.h()) {
                        int i21 = i19 < 6 ? 16 : 64;
                        int iM = 8;
                        int i22 = 8;
                        for (int i23 = 0; i23 < i21; i23++) {
                            if (iM != 0) {
                                iM = ((xVar2.m() + i22) + 256) % 256;
                            }
                            if (iM != 0) {
                                i22 = iM;
                            }
                        }
                    }
                    i19++;
                }
            }
        } else {
            iL = 1;
            zH = false;
        }
        int iL4 = xVar2.l() + 4;
        int iL5 = xVar2.l();
        if (iL5 == 0) {
            iL2 = xVar2.l() + 4;
            xVar = xVar2;
            i12 = 16;
        } else {
            if (iL5 == 1) {
                boolean zH3 = xVar2.h();
                xVar2.m();
                xVar2.m();
                i12 = 16;
                long jL = xVar2.l();
                xVar = xVar2;
                for (int i24 = 0; i24 < jL; i24++) {
                    xVar.l();
                }
                z11 = zH3;
                i14 = 8;
                iL2 = 0;
                xVar.l();
                xVar.q();
                int iL6 = xVar.l() + 1;
                int iL7 = xVar.l() + 1;
                zH2 = xVar.h();
                int i25 = 2 - (zH2 ? 1 : 0);
                int i26 = iL7 * i25;
                if (!zH2) {
                    xVar.q();
                }
                xVar.q();
                int i27 = iL6 * 16;
                int i28 = i26 * 16;
                if (xVar.h()) {
                    int iL8 = xVar.l();
                    int iL9 = xVar.l();
                    int iL10 = xVar.l();
                    int iL11 = xVar.l();
                    if (iL != 0) {
                        int i29 = iL == 3 ? 1 : 2;
                        i25 *= iL == 1 ? 2 : 1;
                        i = i29;
                    }
                    i27 -= (iL8 + iL9) * i;
                    i28 -= (iL10 + iL11) * i25;
                }
                int i31 = i27;
                float f11 = 1.0f;
                if (xVar.h() && xVar.h()) {
                    i13 = xVar.i(i14);
                    if (i13 != 255) {
                        int i32 = i12;
                        int i33 = xVar.i(i32);
                        int i34 = xVar.i(i32);
                        if (i33 != 0 && i34 != 0) {
                            f11 = i33 / i34;
                        }
                    } else if (i13 < 17) {
                        f11 = f94308e[i13];
                    } else {
                        k2.t(i13, "Unexpected aspect_ratio_idc value: ", "NalUnitUtil");
                    }
                }
                return new m(i15, i16, i17, iL3, i31, i28, f11, zH, zH2, iL4, iL5, iL2, z11);
            }
            xVar = xVar2;
            i12 = 16;
            iL2 = 0;
        }
        z11 = false;
        xVar.l();
        xVar.q();
        int iL62 = xVar.l() + 1;
        int iL72 = xVar.l() + 1;
        zH2 = xVar.h();
        int i252 = 2 - (zH2 ? 1 : 0);
        int i262 = iL72 * i252;
        if (!zH2) {
        }
        xVar.q();
        int i272 = iL62 * 16;
        int i282 = i262 * 16;
        if (xVar.h()) {
        }
        int i312 = i272;
        float f112 = 1.0f;
        if (xVar.h()) {
            i13 = xVar.i(i14);
            if (i13 != 255) {
            }
        }
        return new m(i15, i16, i17, iL3, i312, i282, f112, zH, zH2, iL4, iL5, iL2, z11);
    }

    public static void B(MediaFormat mediaFormat, List list) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            mediaFormat.setByteBuffer(c0.h(i5, "csd-"), ByteBuffer.wrap((byte[]) list.get(i5)));
        }
    }

    public static int C(int i5, byte[] bArr) {
        int i11;
        synchronized (f94309f) {
            int i12 = 0;
            int i13 = 0;
            while (i12 < i5) {
                while (true) {
                    if (i12 >= i5 - 2) {
                        i12 = i5;
                        break;
                    }
                    try {
                        if (bArr[i12] == 0 && bArr[i12 + 1] == 0 && bArr[i12 + 2] == 3) {
                            break;
                        }
                        i12++;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                if (i12 < i5) {
                    int[] iArr = f94310g;
                    if (iArr.length <= i13) {
                        f94310g = Arrays.copyOf(iArr, iArr.length * 2);
                    }
                    f94310g[i13] = i12;
                    i12 += 3;
                    i13++;
                }
            }
            i11 = i5 - i13;
            int i14 = 0;
            int i15 = 0;
            for (int i16 = 0; i16 < i13; i16++) {
                int i17 = f94310g[i16] - i15;
                System.arraycopy(bArr, i15, bArr, i14, i17);
                int i18 = i14 + i17;
                int i19 = i18 + 1;
                bArr[i18] = 0;
                i14 = i18 + 2;
                bArr[i19] = 0;
                i15 += i17 + 3;
            }
            System.arraycopy(bArr, i15, bArr, i14, i11 - i14);
        }
        return i11;
    }

    public static void D(String str, String str2) {
        synchronized (f94306c) {
            Log.w(str, str2);
        }
    }

    public static void E(String str, String str2, Exception exc) {
        D(str, a(str2, exc));
    }

    public static String a(String str, Throwable th2) {
        String strReplace;
        synchronized (f94306c) {
            try {
                if (th2 != null) {
                    Throwable cause = th2;
                    while (true) {
                        if (cause == null) {
                            strReplace = Log.getStackTraceString(th2).trim().replace("\t", "    ");
                            break;
                        }
                        if (cause instanceof UnknownHostException) {
                            strReplace = "UnknownHostException (no network)";
                        } else {
                            cause = cause.getCause();
                        }
                    }
                } else {
                    strReplace = null;
                }
            } finally {
            }
        }
        if (TextUtils.isEmpty(strReplace)) {
            return str;
        }
        StringBuilder sbK = k2.k(str, "\n  ");
        sbK.append(strReplace.replace("\n", "\n  "));
        sbK.append('\n');
        return sbK.toString();
    }

    public static void b(String str) {
        if (v.f94376a >= 18) {
            Trace.beginSection(str);
        }
    }

    public static String c(int i5, boolean z11, int i11, int i12, int[] iArr, int i13) {
        Object[] objArr = {f94305b[i5], Integer.valueOf(i11), Integer.valueOf(i12), Character.valueOf(z11 ? 'H' : 'L'), Integer.valueOf(i13)};
        int i14 = v.f94376a;
        StringBuilder sb2 = new StringBuilder(String.format(Locale.US, "hvc1.%s%d.%X.%c%d", objArr));
        int length = iArr.length;
        while (length > 0 && iArr[length - 1] == 0) {
            length--;
        }
        for (int i15 = 0; i15 < length; i15++) {
            sb2.append(String.format(".%02X", Integer.valueOf(iArr[i15])));
        }
        return sb2.toString();
    }

    public static void d(String str, boolean z11) {
        if (!z11) {
            throw new IllegalArgumentException(String.valueOf(str));
        }
    }

    public static void e(boolean z11) {
        if (!z11) {
            throw new IllegalArgumentException();
        }
    }

    public static void f() throws GlUtil$GlException {
        StringBuilder sb2 = new StringBuilder();
        boolean z11 = false;
        while (true) {
            int iGlGetError = GLES20.glGetError();
            if (iGlGetError == 0) {
                break;
            }
            if (z11) {
                sb2.append('\n');
            }
            sb2.append("glError: ");
            sb2.append(GLU.gluErrorString(iGlGetError));
            z11 = true;
        }
        if (z11) {
            throw new GlUtil$GlException(sb2.toString());
        }
    }

    public static void g(String str, boolean z11) throws GlUtil$GlException {
        if (!z11) {
            throw new GlUtil$GlException(str);
        }
    }

    public static void h(int i5, int i11) {
        if (i5 < 0 || i5 >= i11) {
            throw new IndexOutOfBoundsException();
        }
    }

    public static void i(boolean z11) {
        if (!z11) {
            throw new IllegalStateException();
        }
    }

    public static void j(Object obj) {
        if (obj == null) {
            throw new IllegalStateException();
        }
    }

    public static void k(Object obj, String str) {
        if (obj == null) {
            throw new IllegalStateException(String.valueOf(str));
        }
    }

    public static void l(boolean[] zArr) {
        zArr[0] = false;
        zArr[1] = false;
        zArr[2] = false;
    }

    public static FloatBuffer m(float[] fArr) {
        return (FloatBuffer) ByteBuffer.allocateDirect(fArr.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer().put(fArr).flip();
    }

    public static void n() {
        synchronized (f94306c) {
        }
    }

    public static void o(String str, String str2) {
        synchronized (f94306c) {
            Log.e(str, str2);
        }
    }

    public static void p(String str, String str2, Throwable th2) {
        o(str, a(str2, th2));
    }

    public static void q() {
        if (v.f94376a >= 18) {
            Trace.endSection();
        }
    }

    public static int r(byte[] bArr, int i5, int i11, boolean[] zArr) {
        int i12 = i11 - i5;
        i(i12 >= 0);
        if (i12 == 0) {
            return i11;
        }
        if (zArr[0]) {
            l(zArr);
            return i5 - 3;
        }
        if (i12 > 1 && zArr[1] && bArr[i5] == 1) {
            l(zArr);
            return i5 - 2;
        }
        if (i12 > 2 && zArr[2] && bArr[i5] == 0 && bArr[i5 + 1] == 1) {
            l(zArr);
            return i5 - 1;
        }
        int i13 = i11 - 1;
        int i14 = i5 + 2;
        while (i14 < i13) {
            byte b11 = bArr[i14];
            if ((b11 & 254) == 0) {
                int i15 = i14 - 2;
                if (bArr[i15] == 0 && bArr[i14 - 1] == 0 && b11 == 1) {
                    l(zArr);
                    return i15;
                }
                i14 -= 2;
            }
            i14 += 3;
        }
        zArr[0] = i12 <= 2 ? !(i12 != 2 ? !(zArr[1] && bArr[i13] == 1) : !(zArr[2] && bArr[i11 + (-2)] == 0 && bArr[i13] == 1)) : bArr[i11 + (-3)] == 0 && bArr[i11 + (-2)] == 0 && bArr[i13] == 1;
        zArr[1] = i12 <= 1 ? zArr[2] && bArr[i13] == 0 : bArr[i11 + (-2)] == 0 && bArr[i13] == 0;
        zArr[2] = bArr[i13] == 0;
        return i11;
    }

    public static r2 s(fe.d dVar, ArrayList arrayList) {
        s0 s0VarL = v0.l();
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            Bundle bundle = (Bundle) arrayList.get(i5);
            bundle.getClass();
            s0VarL.a(dVar.b(bundle));
        }
        return s0VarL.f();
    }

    public static String t(XmlPullParser xmlPullParser, String str) {
        int attributeCount = xmlPullParser.getAttributeCount();
        for (int i5 = 0; i5 < attributeCount; i5++) {
            if (xmlPullParser.getAttributeName(i5).equals(str)) {
                return xmlPullParser.getAttributeValue(i5);
            }
        }
        return null;
    }

    public static void u(String str, String str2) {
        synchronized (f94306c) {
            Log.i(str, str2);
        }
    }

    public static int v(Uri uri) {
        String lastPathSegment = uri.getLastPathSegment();
        if (lastPathSegment == null) {
            return -1;
        }
        if (lastPathSegment.endsWith(".ac3") || lastPathSegment.endsWith(".ec3")) {
            return 0;
        }
        if (lastPathSegment.endsWith(".ac4")) {
            return 1;
        }
        if (lastPathSegment.endsWith(".adts") || lastPathSegment.endsWith(".aac")) {
            return 2;
        }
        if (lastPathSegment.endsWith(".amr")) {
            return 3;
        }
        if (lastPathSegment.endsWith(".flac")) {
            return 4;
        }
        if (lastPathSegment.endsWith(".flv")) {
            return 5;
        }
        if (lastPathSegment.endsWith(".mid") || lastPathSegment.endsWith(".midi") || lastPathSegment.endsWith(".smf")) {
            return 15;
        }
        if (lastPathSegment.startsWith(".mk", lastPathSegment.length() - 4) || lastPathSegment.endsWith(".webm")) {
            return 6;
        }
        if (lastPathSegment.endsWith(".mp3")) {
            return 7;
        }
        if (lastPathSegment.endsWith(".mp4") || lastPathSegment.startsWith(".m4", lastPathSegment.length() - 4) || lastPathSegment.startsWith(".mp4", lastPathSegment.length() - 5) || lastPathSegment.startsWith(".cmf", lastPathSegment.length() - 5)) {
            return 8;
        }
        if (lastPathSegment.startsWith(".og", lastPathSegment.length() - 4) || lastPathSegment.endsWith(".opus")) {
            return 9;
        }
        if (lastPathSegment.endsWith(".ps") || lastPathSegment.endsWith(".mpeg") || lastPathSegment.endsWith(".mpg") || lastPathSegment.endsWith(".m2p")) {
            return 10;
        }
        if (lastPathSegment.endsWith(".ts") || lastPathSegment.startsWith(".ts", lastPathSegment.length() - 4)) {
            return 11;
        }
        if (lastPathSegment.endsWith(".wav") || lastPathSegment.endsWith(".wave")) {
            return 12;
        }
        if (lastPathSegment.endsWith(".vtt") || lastPathSegment.endsWith(".webvtt")) {
            return 13;
        }
        if (lastPathSegment.endsWith(".jpg") || lastPathSegment.endsWith(".jpeg")) {
            return 14;
        }
        return lastPathSegment.endsWith(".avi") ? 16 : -1;
    }

    public static boolean w(XmlPullParser xmlPullParser, String str) {
        return xmlPullParser.getEventType() == 3 && xmlPullParser.getName().equals(str);
    }

    public static boolean x(XmlPullParser xmlPullParser, String str) {
        return xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equals(str);
    }

    public static void y(MediaFormat mediaFormat, String str, int i5) {
        if (i5 != -1) {
            mediaFormat.setInteger(str, i5);
        }
    }

    public static k z(int i5, int i11, byte[] bArr) {
        int i12;
        int i13;
        int i14;
        int i15 = 2;
        x xVar = new x(bArr, i5 + 2, i11);
        int i16 = 4;
        xVar.r(4);
        int i17 = xVar.i(3);
        xVar.q();
        int i18 = xVar.i(2);
        boolean zH = xVar.h();
        int i19 = xVar.i(5);
        int i21 = 0;
        for (int i22 = 0; i22 < 32; i22++) {
            if (xVar.h()) {
                i21 |= 1 << i22;
            }
        }
        int i23 = 6;
        int[] iArr = new int[6];
        for (int i24 = 0; i24 < 6; i24++) {
            iArr[i24] = xVar.i(8);
        }
        int i25 = i21;
        int i26 = xVar.i(8);
        int i27 = 0;
        for (int i28 = 0; i28 < i17; i28++) {
            if (xVar.h()) {
                i27 += 89;
            }
            if (xVar.h()) {
                i27 += 8;
            }
        }
        xVar.r(i27);
        if (i17 > 0) {
            xVar.r((8 - i17) * 2);
        }
        xVar.l();
        int iL = xVar.l();
        if (iL == 3) {
            xVar.q();
        }
        int iL2 = xVar.l();
        int iL3 = xVar.l();
        if (xVar.h()) {
            int iL4 = xVar.l();
            int iL5 = xVar.l();
            int iL6 = xVar.l();
            int iL7 = xVar.l();
            iL2 -= (iL4 + iL5) * ((iL == 1 || iL == 2) ? 2 : 1);
            iL3 -= (iL6 + iL7) * (iL == 1 ? 2 : 1);
        }
        xVar.l();
        xVar.l();
        int iL8 = xVar.l();
        for (int i29 = xVar.h() ? 0 : i17; i29 <= i17; i29++) {
            xVar.l();
            xVar.l();
            xVar.l();
        }
        xVar.l();
        xVar.l();
        xVar.l();
        xVar.l();
        xVar.l();
        xVar.l();
        if (xVar.h() && xVar.h()) {
            int i31 = 0;
            while (i31 < i16) {
                int i32 = 0;
                while (i32 < i23) {
                    if (xVar.h()) {
                        int iMin = Math.min(64, 1 << ((i31 << 1) + 4));
                        if (i31 > 1) {
                            xVar.m();
                        }
                        for (int i33 = 0; i33 < iMin; i33++) {
                            xVar.m();
                        }
                    } else {
                        xVar.l();
                    }
                    i32 += i31 == 3 ? 3 : 1;
                    i23 = 6;
                }
                i31++;
                i16 = 4;
                i23 = 6;
            }
        }
        xVar.r(2);
        if (xVar.h()) {
            xVar.r(8);
            xVar.l();
            xVar.l();
            xVar.q();
        }
        int iL9 = xVar.l();
        int[] iArrCopyOf = new int[0];
        int[] iArrCopyOf2 = new int[0];
        int i34 = -1;
        int i35 = 0;
        int i36 = -1;
        while (i35 < iL9) {
            if (i35 == 0 || !xVar.h()) {
                i12 = i15;
                i13 = iL9;
                i14 = iL8;
                int iL10 = xVar.l();
                int iL11 = xVar.l();
                int[] iArr2 = new int[iL10];
                for (int i37 = 0; i37 < iL10; i37++) {
                    iArr2[i37] = xVar.l() + 1;
                    xVar.q();
                }
                int[] iArr3 = new int[iL11];
                for (int i38 = 0; i38 < iL11; i38++) {
                    iArr3[i38] = xVar.l() + 1;
                    xVar.q();
                }
                i34 = iL10;
                iArrCopyOf2 = iArr3;
                iArrCopyOf = iArr2;
                i36 = iL11;
            } else {
                i12 = i15;
                int i39 = i34 + i36;
                int iL12 = (1 - ((xVar.h() ? 1 : 0) * 2)) * (xVar.l() + 1);
                i13 = iL9;
                int i40 = i39 + 1;
                int[] iArr4 = iArrCopyOf;
                boolean[] zArr = new boolean[i40];
                for (int i41 = 0; i41 <= i39; i41++) {
                    if (xVar.h()) {
                        zArr[i41] = true;
                    } else {
                        zArr[i41] = xVar.h();
                    }
                }
                int[] iArr5 = new int[i40];
                int[] iArr6 = new int[i40];
                int i42 = 0;
                for (int i43 = i36 - 1; i43 >= 0; i43--) {
                    int i44 = iArrCopyOf2[i43] + iL12;
                    if (i44 < 0 && zArr[i34 + i43]) {
                        iArr5[i42] = i44;
                        i42++;
                    }
                }
                if (iL12 < 0 && zArr[i39]) {
                    iArr5[i42] = iL12;
                    i42++;
                }
                int i45 = i42;
                i14 = iL8;
                for (int i46 = 0; i46 < i34; i46++) {
                    int i47 = iArr4[i46] + iL12;
                    if (i47 < 0 && zArr[i46]) {
                        iArr5[i45] = i47;
                        i45++;
                    }
                }
                iArrCopyOf = Arrays.copyOf(iArr5, i45);
                int i48 = 0;
                for (int i49 = i34 - 1; i49 >= 0; i49--) {
                    int i51 = iArr4[i49] + iL12;
                    if (i51 > 0 && zArr[i49]) {
                        iArr6[i48] = i51;
                        i48++;
                    }
                }
                if (iL12 > 0 && zArr[i39]) {
                    iArr6[i48] = iL12;
                    i48++;
                }
                int i52 = i45;
                int i53 = i48;
                for (int i54 = 0; i54 < i36; i54++) {
                    int i55 = iArrCopyOf2[i54] + iL12;
                    if (i55 > 0 && zArr[i34 + i54]) {
                        iArr6[i53] = i55;
                        i53++;
                    }
                }
                iArrCopyOf2 = Arrays.copyOf(iArr6, i53);
                i36 = i53;
                i34 = i52;
            }
            i35++;
            i15 = i12;
            iL9 = i13;
            iL8 = i14;
        }
        int i56 = i15;
        int i57 = iL8;
        if (xVar.h()) {
            for (int i58 = 0; i58 < xVar.l(); i58++) {
                xVar.r(i57 + 5);
            }
        }
        xVar.r(i56);
        float f11 = 1.0f;
        if (xVar.h()) {
            if (xVar.h()) {
                int i59 = xVar.i(8);
                if (i59 == 255) {
                    int i61 = xVar.i(16);
                    int i62 = xVar.i(16);
                    if (i61 != 0 && i62 != 0) {
                        f11 = i61 / i62;
                    }
                } else if (i59 < 17) {
                    f11 = f94308e[i59];
                } else {
                    k2.t(i59, "Unexpected aspect_ratio_idc value: ", "NalUnitUtil");
                }
            }
            if (xVar.h()) {
                xVar.q();
            }
            if (xVar.h()) {
                xVar.r(4);
                if (xVar.h()) {
                    xVar.r(24);
                }
            }
            if (xVar.h()) {
                xVar.l();
                xVar.l();
            }
            xVar.q();
            if (xVar.h()) {
                iL3 *= 2;
            }
        }
        return new k(i18, zH, i19, i25, iArr, i26, iL2, iL3, f11);
    }
}
