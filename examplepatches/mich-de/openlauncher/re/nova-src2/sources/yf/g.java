package yf;

import android.opengl.GLES20;
import android.util.Log;
import com.google.android.exoplayer2.util.GlUtil$GlException;
import cw.r;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: i, reason: collision with root package name */
    public static final float[] f97258i = {1.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 1.0f, 1.0f};

    /* renamed from: j, reason: collision with root package name */
    public static final float[] f97259j = {1.0f, 0.0f, 0.0f, 0.0f, -0.5f, 0.0f, 0.0f, 0.5f, 1.0f};

    /* renamed from: k, reason: collision with root package name */
    public static final float[] f97260k = {0.5f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 1.0f, 1.0f};

    /* renamed from: a, reason: collision with root package name */
    public int f97261a;

    /* renamed from: b, reason: collision with root package name */
    public fk.l f97262b;

    /* renamed from: c, reason: collision with root package name */
    public r f97263c;

    /* renamed from: d, reason: collision with root package name */
    public int f97264d;

    /* renamed from: e, reason: collision with root package name */
    public int f97265e;

    /* renamed from: f, reason: collision with root package name */
    public int f97266f;

    /* renamed from: g, reason: collision with root package name */
    public int f97267g;

    /* renamed from: h, reason: collision with root package name */
    public int f97268h;

    public static boolean b(f fVar) {
        e eVar = fVar.f97254a;
        e eVar2 = fVar.f97255b;
        fk.l[] lVarArr = eVar.f97253a;
        if (lVarArr.length == 1 && lVarArr[0].f55199a == 0) {
            fk.l[] lVarArr2 = eVar2.f97253a;
            if (lVarArr2.length == 1 && lVarArr2[0].f55199a == 0) {
                return true;
            }
        }
        return false;
    }

    public final void a() {
        try {
            r rVar = new r("uniform mat4 uMvpMatrix;\nuniform mat3 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec2 aTexCoords;\nvarying vec2 vTexCoords;\n// Standard transformation.\nvoid main() {\n  gl_Position = uMvpMatrix * aPosition;\n  vTexCoords = (uTexMatrix * vec3(aTexCoords, 1)).xy;\n}\n", "// This is required since the texture data is GL_TEXTURE_EXTERNAL_OES.\n#extension GL_OES_EGL_image_external : require\nprecision mediump float;\n// Standard texture rendering shader.\nuniform samplerExternalOES uTexture;\nvarying vec2 vTexCoords;\nvoid main() {\n  gl_FragColor = texture2D(uTexture, vTexCoords);\n}\n");
            this.f97263c = rVar;
            this.f97264d = GLES20.glGetUniformLocation(rVar.f48279c, "uMvpMatrix");
            this.f97265e = GLES20.glGetUniformLocation(this.f97263c.f48279c, "uTexMatrix");
            this.f97266f = this.f97263c.s("aPosition");
            this.f97267g = this.f97263c.s("aTexCoords");
            this.f97268h = GLES20.glGetUniformLocation(this.f97263c.f48279c, "uTexture");
        } catch (GlUtil$GlException e3) {
            Log.e("ProjectionRenderer", "Failed to initialize the program", e3);
        }
    }
}
