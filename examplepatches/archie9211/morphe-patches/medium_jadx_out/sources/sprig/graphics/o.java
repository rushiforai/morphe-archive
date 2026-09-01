package sprig.graphics;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.util.Size;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u0015\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\b\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J%\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\u001f\u0010\u0011\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002¢\u0006\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0014\u001a\u00020\u000f8\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0011\u0010\u0013R\u0014\u0010\u0016\u001a\u00020\u000f8\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0015\u0010\u0013R\u0016\u0010\u0019\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0017\u0010\u0018R\u0016\u0010\u001d\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001b\u0010\u001cR\u0016\u0010 \u001a\u00020\r8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001e\u0010\u001fR\u0016\u0010\"\u001a\u00020\r8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b!\u0010\u001fR\u0016\u0010$\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b#\u0010\u001cR\u0016\u0010&\u001a\u00020\r8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b%\u0010\u001fR\u0016\u0010(\u001a\u00020\r8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b'\u0010\u001fR\u0016\u0010*\u001a\u00020\r8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b)\u0010\u001fR\u0014\u0010,\u001a\u00020\u001a8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b+\u0010\u001cR\"\u00104\u001a\u00020-8\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b.\u0010/\u001a\u0004\b0\u00101\"\u0004\b2\u00103R\"\u0010<\u001a\u0002058\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b6\u00107\u001a\u0004\b8\u00109\"\u0004\b:\u0010;¨\u0006="}, d2 = {"Lsprig/h/o;", "", "<init>", "()V", "Landroid/util/Size;", "muxerSize", "Landroid/graphics/Bitmap;", "bitmap", "", "mvpMatrix", "Lc1e;", "draw", "(Landroid/util/Size;Landroid/graphics/Bitmap;[F)V", "", "type", "", "shaderCode", "a", "(ILjava/lang/String;)I", "Ljava/lang/String;", "vertexShaderCode", "b", "fragmentShaderCode", "c", "[F", "vertices", "", "d", "[I", "indices", "e", "I", "program", "f", "vertexHandle", "g", "bufferHandles", "h", "uvsHandle", "i", "mvpHandle", "j", "samplerHandle", "k", "textureHandle", "Ljava/nio/FloatBuffer;", "l", "Ljava/nio/FloatBuffer;", "getVertexBuffer", "()Ljava/nio/FloatBuffer;", "setVertexBuffer", "(Ljava/nio/FloatBuffer;)V", "vertexBuffer", "Ljava/nio/IntBuffer;", "m", "Ljava/nio/IntBuffer;", "getIndexBuffer", "()Ljava/nio/IntBuffer;", "setIndexBuffer", "(Ljava/nio/IntBuffer;)V", "indexBuffer", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class o {

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public int program;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public int vertexHandle;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public int uvsHandle;

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    public int mvpHandle;

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    public int samplerHandle;

    /* JADX INFO: renamed from: k, reason: from kotlin metadata */
    public final int[] textureHandle;

    /* JADX INFO: renamed from: l, reason: from kotlin metadata */
    public FloatBuffer vertexBuffer;

    /* JADX INFO: renamed from: m, reason: from kotlin metadata */
    public IntBuffer indexBuffer;

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final String vertexShaderCode = "precision highp float;\nattribute vec3 vertexPosition;\nattribute vec2 uvs;\nvarying vec2 varUvs;\nuniform mat4 mvp;\n\nvoid main()\n{\n\tvarUvs = uvs;\n\tgl_Position = mvp * vec4(vertexPosition, 1.0);\n}";

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final String fragmentShaderCode = "precision mediump float;\n\nvarying vec2 varUvs;\nuniform sampler2D texSampler;\n\nvoid main()\n{\t\n\tgl_FragColor = texture2D(texSampler, varUvs);\n}";

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public float[] vertices = {-1.0f, -1.0f, 0.0f, 0.0f, 0.0f, -1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 1.0f, 1.0f, 1.0f, -1.0f, 0.0f, 1.0f, 0.0f};

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public int[] indices = {2, 1, 0, 0, 3, 2};

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public int[] bufferHandles = new int[2];

    public o() {
        int[] iArr = new int[1];
        this.textureHandle = iArr;
        ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(80);
        byteBufferAllocateDirect.order(ByteOrder.nativeOrder());
        FloatBuffer floatBufferAsFloatBuffer = byteBufferAllocateDirect.asFloatBuffer();
        floatBufferAsFloatBuffer.put(this.vertices);
        floatBufferAsFloatBuffer.position(0);
        this.vertexBuffer = floatBufferAsFloatBuffer;
        ByteBuffer byteBufferAllocateDirect2 = ByteBuffer.allocateDirect(this.indices.length * 4);
        byteBufferAllocateDirect2.order(ByteOrder.nativeOrder());
        IntBuffer intBufferAsIntBuffer = byteBufferAllocateDirect2.asIntBuffer();
        intBufferAsIntBuffer.put(this.indices);
        intBufferAsIntBuffer.position(0);
        this.indexBuffer = intBufferAsIntBuffer;
        int iA = a(35633, "precision highp float;\nattribute vec3 vertexPosition;\nattribute vec2 uvs;\nvarying vec2 varUvs;\nuniform mat4 mvp;\n\nvoid main()\n{\n\tvarUvs = uvs;\n\tgl_Position = mvp * vec4(vertexPosition, 1.0);\n}");
        int iA2 = a(35632, "precision mediump float;\n\nvarying vec2 varUvs;\nuniform sampler2D texSampler;\n\nvoid main()\n{\t\n\tgl_FragColor = texture2D(texSampler, varUvs);\n}");
        int iGlCreateProgram = GLES20.glCreateProgram();
        GLES20.glAttachShader(iGlCreateProgram, iA);
        GLES20.glAttachShader(iGlCreateProgram, iA2);
        GLES20.glLinkProgram(iGlCreateProgram);
        this.vertexHandle = GLES20.glGetAttribLocation(iGlCreateProgram, "vertexPosition");
        this.uvsHandle = GLES20.glGetAttribLocation(iGlCreateProgram, "uvs");
        this.mvpHandle = GLES20.glGetUniformLocation(iGlCreateProgram, "mvp");
        this.samplerHandle = GLES20.glGetUniformLocation(iGlCreateProgram, "texSampler");
        this.program = iGlCreateProgram;
        GLES20.glGenBuffers(2, this.bufferHandles, 0);
        GLES20.glBindBuffer(34962, this.bufferHandles[0]);
        GLES20.glBufferData(34962, this.vertices.length * 4, this.vertexBuffer, 35048);
        GLES20.glBindBuffer(34963, this.bufferHandles[1]);
        GLES20.glBufferData(34963, this.indices.length * 4, this.indexBuffer, 35048);
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glEnable(3042);
        GLES20.glBlendFunc(770, 771);
    }

    public final int a(int type, String shaderCode) {
        int iGlCreateShader = GLES20.glCreateShader(type);
        GLES20.glShaderSource(iGlCreateShader, shaderCode);
        GLES20.glCompileShader(iGlCreateShader);
        return iGlCreateShader;
    }

    public final void draw(Size muxerSize, Bitmap bitmap, float[] mvpMatrix) {
        int height;
        int width;
        muxerSize.getClass();
        bitmap.getClass();
        mvpMatrix.getClass();
        GLES20.glClear(FujifilmMakernoteDirectory.TAG_FACES_DETECTED);
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        if (muxerSize.getHeight() == muxerSize.getWidth()) {
            width = (muxerSize.getWidth() - bitmap.getWidth()) / 2;
            height = (muxerSize.getHeight() - bitmap.getHeight()) / 2;
        } else {
            height = 0;
            width = 0;
        }
        GLES20.glViewport(width, height, bitmap.getWidth(), bitmap.getHeight());
        GLES20.glUseProgram(this.program);
        GLES20.glUniformMatrix4fv(this.mvpHandle, 1, false, mvpMatrix, 0);
        GLES20.glActiveTexture(33984);
        GLES20.glBindTexture(3553, this.textureHandle[0]);
        GLES20.glPixelStorei(3317, 1);
        GLUtils.texImage2D(3553, 0, bitmap, 0);
        GLES20.glTexParameteri(3553, 10241, 9728);
        GLES20.glTexParameteri(3553, 10240, 9728);
        GLES20.glBindBuffer(34962, this.bufferHandles[0]);
        GLES20.glBindBuffer(34963, this.bufferHandles[1]);
        GLES20.glEnableVertexAttribArray(this.vertexHandle);
        GLES20.glVertexAttribPointer(this.vertexHandle, 3, FujifilmMakernoteDirectory.TAG_MAX_APERTURE_AT_MIN_FOCAL, false, 20, 0);
        GLES20.glEnableVertexAttribArray(this.uvsHandle);
        GLES20.glVertexAttribPointer(this.uvsHandle, 2, FujifilmMakernoteDirectory.TAG_MAX_APERTURE_AT_MIN_FOCAL, false, 20, 12);
        GLES20.glDrawElements(4, 6, FujifilmMakernoteDirectory.TAG_MAX_FOCAL_LENGTH, 0);
    }

    public final IntBuffer getIndexBuffer() {
        return this.indexBuffer;
    }

    public final FloatBuffer getVertexBuffer() {
        return this.vertexBuffer;
    }

    public final void setIndexBuffer(IntBuffer intBuffer) {
        intBuffer.getClass();
        this.indexBuffer = intBuffer;
    }

    public final void setVertexBuffer(FloatBuffer floatBuffer) {
        floatBuffer.getClass();
        this.vertexBuffer = floatBuffer;
    }
}
