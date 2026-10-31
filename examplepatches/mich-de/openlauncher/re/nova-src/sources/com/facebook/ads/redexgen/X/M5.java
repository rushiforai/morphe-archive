package com.facebook.ads.redexgen.X;

import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.os.Handler;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class M5 implements SurfaceTexture.OnFrameAvailableListener, Runnable {
    public static byte[] A06;
    public static String[] A07 = {"lHEUmbhnHbDqf9jIpOC7QME5k", "Ncc0e6Lf61n7f67vuL7LxSW2UpGbB3y4", "Do0lDsrRt7Bt2nUHFi6x4zRVTYRlNh8q", "5T19TwKvbyb1Z0bnsiS6nPJ8sWeZGlni", "riOI9xXq0YhJWAQP0wPGheJcFKtAr7wZ", "pwFNi0NtAro5jxbFyuoox4Iz4Ath1DVB", "gNcteiQ", "MBKxZ1Ew9y"};
    public static final int[] A08;
    public SurfaceTexture A00;
    public EGLContext A01;
    public EGLDisplay A02;
    public EGLSurface A03;
    public final Handler A04;
    public final int[] A05 = new int[1];

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 22);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A06 = new byte[]{-48, -46, -41, -82, -45, -38, -38, -34, -48, -82, -38, -39, -47, -44, -46, -117, -47, -52, -44, -41, -48, -49, -91, -117, -34, -32, -50, -50, -48, -34, -34, -88, -112, -51, -105, -117, -39, -32, -40, -82, -38, -39, -47, -44, -46, -34, -58, -101, -56, -88, -112, -49, -105, -117, -50, -38, -39, -47, -44, -46, -34, -58, -101, -56, -88, -112, -34, -99, -97, -92, 123, -86, -99, -103, -84, -99, 123, -89, -90, -84, -99, -80, -84, 88, -98, -103, -95, -92, -99, -100, -7, -5, 0, -41, 6, -7, -11, 8, -7, -28, -10, 9, -6, -6, -7, 6, -25, 9, 6, -6, -11, -9, -7, -76, -6, -11, -3, 0, -7, -8, -94, -92, -87, -124, -94, -79, -127, -90, -80, -83, -87, -98, -74, 93, -93, -98, -90, -87, -94, -95, -128, -126, -121, 100, -119, -124, -113, -124, 124, -121, -124, -107, -128, 59, -127, 124, -124, -121, -128, AbstractJsonLexerKt.TC_INVALID, -93, -91, -86, -117, -97, -87, -93, -127, -77, -80, -80, -93, -84, -78, 94, -92, -97, -89, -86, -93, -94, -100, -95, 124, -102, -93, -119, -102, -83, -87, -86, -89, -102, -88, 85, -101, -106, -98, -95, -102, -103, 99, 85, 122, -89, -89, -92, -89, 111, 85};
    }

    static {
        A05();
        A08 = new int[]{12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 0, 12327, 12344, 12339, 4, 12344};
    }

    public M5(Handler handler) {
        this.A04 = handler;
    }

    public static EGLConfig A00(EGLDisplay eGLDisplay) {
        EGLConfig[] configs = new EGLConfig[1];
        int[] iArr = new int[1];
        boolean success = EGL14.eglChooseConfig(eGLDisplay, A08, 0, configs, 0, 1, iArr, 0);
        if (success && iArr[0] > 0 && configs[0] != null) {
            EGLConfig eGLConfig = configs[0];
            if (A07[0].length() == 6) {
                throw new RuntimeException();
            }
            A07[1] = "FdU9nhcNF0FEgGWnnbFQuT53fRs5PBot";
            return eGLConfig;
        }
        throw new M3(N1.A0n(A04(0, 67, 85), Boolean.valueOf(success), Integer.valueOf(iArr[0]), configs[0]));
    }

    public static EGLContext A01(EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i5) {
        int[] iArr;
        if (i5 != 0) {
            iArr = new int[]{12440, 2, 12992, 1, 12344};
        } else {
            iArr = new int[]{12440, 2, 12344};
        }
        EGLContext eGLContextEglCreateContext = EGL14.eglCreateContext(eGLDisplay, eGLConfig, EGL14.EGL_NO_CONTEXT, iArr, 0);
        if (eGLContextEglCreateContext != null) {
            return eGLContextEglCreateContext;
        }
        throw new M3(A04(67, 23, 34));
    }

    public static EGLDisplay A02() {
        EGLDisplay eGLDisplayEglGetDisplay = EGL14.eglGetDisplay(0);
        if (eGLDisplayEglGetDisplay == null) {
            throw new M3(A04(120, 20, 39));
        }
        int[] iArr = new int[2];
        boolean eglInitialized = EGL14.eglInitialize(eGLDisplayEglGetDisplay, iArr, 0, iArr, 1);
        if (!eglInitialized) {
            throw new M3(A04(140, 20, 5));
        }
        return eGLDisplayEglGetDisplay;
    }

    public static EGLSurface A03(EGLDisplay eGLDisplay, EGLConfig eGLConfig, EGLContext eGLContext, int i5) {
        int[] pbufferAttributes;
        EGLSurface eGLSurfaceEglCreatePbufferSurface;
        if (i5 == 1) {
            eGLSurfaceEglCreatePbufferSurface = EGL14.EGL_NO_SURFACE;
        } else {
            if (i5 == 2) {
                pbufferAttributes = new int[]{12375, 1, 12374, 1, 12992, 1, 12344};
            } else {
                pbufferAttributes = new int[]{12375, 1, 12374, 1, 12344};
            }
            eGLSurfaceEglCreatePbufferSurface = EGL14.eglCreatePbufferSurface(eGLDisplay, eGLConfig, pbufferAttributes, 0);
            if (eGLSurfaceEglCreatePbufferSurface == null) {
                throw new M3(A04(90, 30, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
            }
        }
        boolean zEglMakeCurrent = EGL14.eglMakeCurrent(eGLDisplay, eGLSurfaceEglCreatePbufferSurface, eGLSurfaceEglCreatePbufferSurface, eGLContext);
        String[] strArr = A07;
        if (strArr[5].charAt(18) == strArr[4].charAt(18)) {
            throw new RuntimeException();
        }
        A07[0] = "xrntSmi998AA9vI3V3XDLrsgx";
        if (!zEglMakeCurrent) {
            throw new M3(A04(160, 21, 40));
        }
        return eGLSurfaceEglCreatePbufferSurface;
    }

    public static void A06(int[] iArr) {
        GLES20.glGenTextures(1, iArr, 0);
        int iGlGetError = GLES20.glGetError();
        if (iGlGetError == 0) {
        } else {
            throw new M3(A04(181, 29, 31) + Integer.toHexString(iGlGetError));
        }
    }

    public final SurfaceTexture A07() {
        return (SurfaceTexture) AbstractC1062Ln.A01(this.A00);
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A08() {
        this.A04.removeCallbacks(this);
        try {
            if (this.A00 != null) {
                this.A00.release();
                GLES20.glDeleteTextures(1, this.A05, 0);
            }
            EGLSurface eGLSurface = this.A03;
            String[] strArr = A07;
            if (strArr[2].charAt(17) != strArr[3].charAt(17)) {
                throw new RuntimeException();
            }
            A07[1] = "H7NfP8zZOBcQuiJ7VpdOmaBCr8ZMGR45";
            if (eGLSurface != null) {
                boolean zEquals = this.A03.equals(EGL14.EGL_NO_SURFACE);
                String[] strArr2 = A07;
                if (strArr2[2].charAt(17) != strArr2[3].charAt(17)) {
                    String[] strArr3 = A07;
                    strArr3[2] = "OrgyMNOs01hKfdUuciAlGvqNPkvnXMlP";
                    strArr3[3] = "uzjvcDhHL1UpxZs72i4mdi50b2ocuvvb";
                    if (!zEquals) {
                        EGL14.eglDestroySurface(this.A02, this.A03);
                    }
                } else {
                    A07[7] = "jrDX84OvsM";
                    if (!zEquals) {
                    }
                }
            }
            if (this.A01 != null) {
                EGL14.eglDestroyContext(this.A02, this.A01);
            }
            this.A02 = null;
            this.A01 = null;
            this.A03 = null;
            this.A00 = null;
        } catch (Throwable th2) {
            if (this.A03 != null && !this.A03.equals(EGL14.EGL_NO_SURFACE)) {
                EGL14.eglDestroySurface(this.A02, this.A03);
            }
            EGLContext eGLContext = this.A01;
            String[] strArr4 = A07;
            if (strArr4[2].charAt(17) == strArr4[3].charAt(17)) {
                String[] strArr5 = A07;
                strArr5[5] = "EwAhHbtQEuX5KWQXaSwbE8ikCiLqxrp6";
                strArr5[4] = "dc6GrG0lCFHF0xhkfrj5Em8Gqpe608ZQ";
                if (eGLContext != null) {
                }
            } else if (eGLContext != null) {
                EGL14.eglDestroyContext(this.A02, this.A01);
            }
            this.A02 = null;
            this.A01 = null;
            this.A03 = null;
            this.A00 = null;
            throw th2;
        }
    }

    public final void A09(int i5) {
        this.A02 = A02();
        EGLConfig eGLConfigA00 = A00(this.A02);
        this.A01 = A01(this.A02, eGLConfigA00, i5);
        this.A03 = A03(this.A02, eGLConfigA00, this.A01, i5);
        A06(this.A05);
        this.A00 = new SurfaceTexture(this.A05[0]);
        this.A00.setOnFrameAvailableListener(this);
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public final void onFrameAvailable(SurfaceTexture surfaceTexture) {
        this.A04.post(this);
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00 != null) {
                this.A00.updateTexImage();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
