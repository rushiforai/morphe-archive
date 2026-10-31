package k9;

import android.graphics.Bitmap;
import android.graphics.RectF;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.opengl.Matrix;
import b.c0;
import b3.x;
import com.google.android.gms.internal.measurement.a0;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class e implements c {

    /* renamed from: q, reason: collision with root package name */
    public static final float[] f71216q = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};

    /* renamed from: r, reason: collision with root package name */
    public static final f f71217r = new f(0);

    /* renamed from: a, reason: collision with root package name */
    public float[] f71218a = new float[128];

    /* renamed from: b, reason: collision with root package name */
    public final float[] f71219b = new float[8];

    /* renamed from: c, reason: collision with root package name */
    public final x f71220c = new x(3, false);

    /* renamed from: d, reason: collision with root package name */
    public int f71221d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f71222e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final float[] f71223f = new float[16];

    /* renamed from: g, reason: collision with root package name */
    public final int f71224g;

    /* renamed from: h, reason: collision with root package name */
    public final int f71225h;

    /* renamed from: i, reason: collision with root package name */
    public final a0[] f71226i;

    /* renamed from: j, reason: collision with root package name */
    public final x f71227j;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f71228k;

    /* renamed from: l, reason: collision with root package name */
    public final float[] f71229l;

    /* renamed from: m, reason: collision with root package name */
    public final RectF f71230m;
    public final RectF n;
    public final float[] o;

    /* renamed from: p, reason: collision with root package name */
    public final int[] f71231p;

    public e() {
        a0[] a0VarArr = {new d("aPosition", 0), new d("uMatrix", 1), new d("uColor", 1)};
        a0[] a0VarArr2 = {new d("aPosition", 0), new d("uMatrix", 1), new d("uTextureMatrix", 1), new d("uTextureSampler", 1), new d("uAlpha", 1)};
        this.f71226i = a0VarArr2;
        a0[] a0VarArr3 = {new d("aPosition", 0), new d("uMatrix", 1), new d("uTextureMatrix", 1), new d("uTextureSampler", 1), new d("uAlpha", 1)};
        a0[] a0VarArr4 = {new d("aPosition", 0), new d("uMatrix", 1), new d("aTextureCoordinate", 0), new d("uTextureSampler", 1), new d("uAlpha", 1)};
        this.f71227j = new x(3, false);
        ArrayList arrayList = new ArrayList();
        this.f71228k = arrayList;
        this.f71229l = new float[32];
        this.f71230m = new RectF();
        this.n = new RectF();
        float[] fArr = new float[16];
        this.o = fArr;
        int[] iArr = new int[1];
        this.f71231p = iArr;
        Matrix.setIdentityM(fArr, 0);
        Matrix.setIdentityM(this.f71218a, this.f71222e);
        this.f71219b[this.f71221d] = 1.0f;
        arrayList.add(null);
        FloatBuffer floatBufferAsFloatBuffer = ByteBuffer.allocateDirect(80).order(ByteOrder.nativeOrder()).asFloatBuffer();
        floatBufferAsFloatBuffer.put(f71216q, 0, 20).position(0);
        GLES20.glGenBuffers(1, iArr, 0);
        b();
        b();
        int i5 = iArr[0];
        GLES20.glBindBuffer(34962, i5);
        b();
        GLES20.glBufferData(34962, floatBufferAsFloatBuffer.capacity() * 4, floatBufferAsFloatBuffer, 35044);
        b();
        this.f71225h = i5;
        int iF = f(35633, "uniform mat4 uMatrix;\nattribute vec2 aPosition;\nvoid main() {\n  vec4 pos = vec4(aPosition, 0.0, 1.0);\n  gl_Position = uMatrix * pos;\n}\n");
        int iF2 = f(35633, "uniform mat4 uMatrix;\nuniform mat4 uTextureMatrix;\nattribute vec2 aPosition;\nvarying vec2 vTextureCoord;\nvoid main() {\n  vec4 pos = vec4(aPosition, 0.0, 1.0);\n  gl_Position = uMatrix * pos;\n  vTextureCoord = (uTextureMatrix * pos).xy;\n}\n");
        int iF3 = f(35633, "uniform mat4 uMatrix;\nattribute vec2 aPosition;\nattribute vec2 aTextureCoordinate;\nvarying vec2 vTextureCoord;\nvoid main() {\n  vec4 pos = vec4(aPosition, 0.0, 1.0);\n  gl_Position = uMatrix * pos;\n  vTextureCoord = aTextureCoordinate;\n}\n");
        int iF4 = f(35632, "precision mediump float;\nuniform vec4 uColor;\nvoid main() {\n  gl_FragColor = uColor;\n}\n");
        int iF5 = f(35632, "precision mediump float;\nvarying vec2 vTextureCoord;\nuniform float uAlpha;\nuniform sampler2D uTextureSampler;\nvoid main() {\n  gl_FragColor = texture2D(uTextureSampler, vTextureCoord);\n  gl_FragColor *= uAlpha;\n}\n");
        int iF6 = f(35632, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform float uAlpha;\nuniform samplerExternalOES uTextureSampler;\nvoid main() {\n  gl_FragColor = texture2D(uTextureSampler, vTextureCoord);\n  gl_FragColor *= uAlpha;\n}\n");
        a(iF, iF4, a0VarArr);
        this.f71224g = a(iF2, iF5, a0VarArr2);
        a(iF2, iF6, a0VarArr3);
        a(iF3, iF5, a0VarArr4);
        GLES20.glBlendFunc(1, 771);
        b();
    }

    public static void b() {
        int iGlGetError = GLES20.glGetError();
        if (iGlGetError != 0) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("e");
            bVar.e(new IllegalStateException(c0.h(iGlGetError, "GL Error: ")));
        }
    }

    public static void c(RectF rectF, RectF rectF2, a aVar) {
        h hVar = (h) aVar;
        if (hVar.f71210c == -1) {
            hVar.e();
        }
        int i5 = hVar.f71210c;
        h hVar2 = (h) aVar;
        if (hVar2.f71210c == -1) {
            hVar2.e();
        }
        int i11 = hVar2.f71211d;
        int iB = aVar.b();
        int iA = aVar.a();
        float f11 = iB;
        rectF.left /= f11;
        float f12 = rectF.right / f11;
        rectF.right = f12;
        float f13 = iA;
        rectF.top /= f13;
        rectF.bottom /= f13;
        float f14 = i5 / f11;
        if (f12 > f14) {
            rectF2.right = (((f14 - rectF.left) * rectF2.width()) / rectF.width()) + rectF2.left;
            rectF.right = f14;
        }
        float f15 = i11 / f13;
        if (rectF.bottom > f15) {
            rectF2.bottom = (((f15 - rectF.top) * rectF2.height()) / rectF.height()) + rectF2.top;
            rectF.bottom = f15;
        }
    }

    public static int f(int i5, String str) {
        int iGlCreateShader = GLES20.glCreateShader(i5);
        GLES20.glShaderSource(iGlCreateShader, str);
        b();
        GLES20.glCompileShader(iGlCreateShader);
        b();
        return iGlCreateShader;
    }

    public final int a(int i5, int i11, a0[] a0VarArr) {
        int iGlCreateProgram = GLES20.glCreateProgram();
        b();
        if (iGlCreateProgram == 0) {
            throw new RuntimeException("Cannot create GL program: " + GLES20.glGetError());
        }
        GLES20.glAttachShader(iGlCreateProgram, i5);
        b();
        GLES20.glAttachShader(iGlCreateProgram, i11);
        b();
        GLES20.glLinkProgram(iGlCreateProgram);
        b();
        int[] iArr = this.f71231p;
        GLES20.glGetProgramiv(iGlCreateProgram, 35714, iArr, 0);
        if (iArr[0] != 1) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("e");
            bVar.d("Could not link program:\n%s", GLES20.glGetProgramInfoLog(iGlCreateProgram));
            GLES20.glDeleteProgram(iGlCreateProgram);
            iGlCreateProgram = 0;
        }
        for (a0 a0Var : a0VarArr) {
            a0Var.c(iGlCreateProgram);
        }
        return iGlCreateProgram;
    }

    public final void d(RectF rectF, RectF rectF2, a aVar) {
        if (rectF2.width() <= 0.0f || rectF2.height() <= 0.0f) {
            return;
        }
        RectF rectF3 = this.f71230m;
        rectF3.set(rectF);
        RectF rectF4 = this.n;
        rectF4.set(rectF2);
        c(rectF3, rectF4, aVar);
        e(rectF3, rectF4, aVar);
    }

    public final void e(RectF rectF, RectF rectF2, a aVar) {
        float fWidth = rectF.width();
        float[] fArr = this.o;
        fArr[0] = fWidth;
        fArr[5] = rectF.height();
        fArr[12] = rectF.left;
        fArr[13] = rectF.top;
        aVar.getClass();
        GLES20.glUseProgram(this.f71224g);
        b();
        h hVar = (h) aVar;
        if (!hVar.f71238k || this.f71219b[this.f71221d] < 0.95f) {
            GLES20.glEnable(3042);
            b();
        } else {
            GLES20.glDisable(3042);
            b();
        }
        GLES20.glActiveTexture(33984);
        b();
        hVar.j(this);
        GLES20.glBindTexture(3553, aVar.f71208a);
        b();
        a0[] a0VarArr = this.f71226i;
        GLES20.glUniform1i(a0VarArr[3].f32362a, 0);
        b();
        GLES20.glUniform1f(a0VarArr[4].f32362a, this.f71219b[this.f71221d]);
        b();
        GLES20.glBindBuffer(34962, this.f71225h);
        b();
        GLES20.glVertexAttribPointer(a0VarArr[0].f32362a, 2, 5126, false, 8, 0);
        b();
        GLES20.glBindBuffer(34962, 0);
        b();
        GLES20.glUniformMatrix4fv(a0VarArr[2].f32362a, 1, false, fArr, 0);
        b();
        float f11 = rectF2.left;
        float f12 = rectF2.top;
        float fWidth2 = rectF2.width();
        float fHeight = rectF2.height();
        Matrix.translateM(this.f71229l, 0, this.f71218a, this.f71222e, f11, f12, 0.0f);
        float[] fArr2 = this.f71229l;
        Matrix.scaleM(fArr2, 0, fWidth2, fHeight, 1.0f);
        float[] fArr3 = this.f71229l;
        Matrix.multiplyMM(fArr3, 16, this.f71223f, 0, fArr3, 0);
        GLES20.glUniformMatrix4fv(a0VarArr[1].f32362a, 1, false, fArr2, 16);
        b();
        int i5 = a0VarArr[0].f32362a;
        GLES20.glEnableVertexAttribArray(i5);
        b();
        GLES20.glDrawArrays(5, 0, 4);
        b();
        GLES20.glDisableVertexAttribArray(i5);
        b();
    }

    public final void g() {
        x xVar = this.f71220c;
        int i5 = xVar.f17391a - 1;
        xVar.f17391a = i5;
        int i11 = xVar.f17392b[i5];
        if ((i11 & 1) == 1) {
            this.f71221d--;
        }
        if ((i11 & 2) == 2) {
            this.f71222e -= 16;
        }
    }

    public final void h(h hVar, int i5, int i11, Bitmap bitmap, int i12, int i13) {
        GLES20.glBindTexture(3553, hVar.f71208a);
        b();
        GLUtils.texSubImage2D(3553, 0, i5, i11, bitmap, i12, i13);
    }

    public final void i(float f11, float f12) {
        int i5 = this.f71222e;
        float[] fArr = this.f71218a;
        int i11 = i5 + 12;
        fArr[i11] = (fArr[i5 + 4] * f12) + (fArr[i5] * f11) + fArr[i11];
        int i12 = i5 + 13;
        fArr[i12] = (fArr[i5 + 5] * f12) + (fArr[i5 + 1] * f11) + fArr[i12];
        int i13 = i5 + 14;
        fArr[i13] = (fArr[i5 + 6] * f12) + (fArr[i5 + 2] * f11) + fArr[i13];
        int i14 = i5 + 15;
        fArr[i14] = (fArr[i5 + 7] * f12) + (fArr[i5 + 3] * f11) + fArr[i14];
    }
}
