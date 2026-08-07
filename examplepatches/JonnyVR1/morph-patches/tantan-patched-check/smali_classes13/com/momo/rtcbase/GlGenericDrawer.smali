.class Lcom/momo/rtcbase/GlGenericDrawer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/RendererCommon$GlDrawer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;,
        Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;
    }
.end annotation


# static fields
.field private static final DEFAULT_VERTEX_SHADER_STRING:Ljava/lang/String; = "varying vec2 tc;\nattribute vec4 in_pos;\nattribute vec4 in_tc;\nuniform mat4 tex_mat;\nvoid main() {\n  gl_Position = in_pos;\n  tc = (tex_mat * in_tc).xy;\n}\n"

.field private static final FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

.field private static final FULL_RECTANGLE_TEXTURE_BUFFER:Ljava/nio/FloatBuffer;

.field private static final INPUT_TEXTURE_COORDINATE_NAME:Ljava/lang/String; = "in_tc"

.field private static final INPUT_VERTEX_COORDINATE_NAME:Ljava/lang/String; = "in_pos"

.field private static final TEXTURE_MATRIX_NAME:Ljava/lang/String; = "tex_mat"


# instance fields
.field private currentShader:Lcom/momo/rtcbase/GlShader;

.field private currentShaderType:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

.field private final genericFragmentSource:Ljava/lang/String;

.field private inPosLocation:I

.field private inTcLocation:I

.field private final shaderCallbacks:Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;

.field private texMatrixLocation:I

.field private final vertexShader:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Lcom/momo/rtcbase/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Lcom/momo/rtcbase/GlGenericDrawer;->FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    fill-array-data v0, :array_1

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/rtcbase/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/momo/rtcbase/GlGenericDrawer;->FULL_RECTANGLE_TEXTURE_BUFFER:Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;)V
    .locals 1

    .line 11
    const-string v0, "varying vec2 tc;\nattribute vec4 in_pos;\nattribute vec4 in_tc;\nuniform mat4 tex_mat;\nvoid main() {\n  gl_Position = in_pos;\n  tc = (tex_mat * in_tc).xy;\n}\n"

    invoke-direct {p0, v0, p1, p2}, Lcom/momo/rtcbase/GlGenericDrawer;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->vertexShader:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/GlGenericDrawer;->genericFragmentSource:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/GlGenericDrawer;->shaderCallbacks:Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;

    .line 9
    .line 10
    return-void
.end method

.method public static createFragmentShaderString(Ljava/lang/String;Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;->OES:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 7
    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    const-string v2, "#extension GL_OES_EGL_image_external : require\n"

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    :cond_0
    const-string v2, "precision mediump float;\nvarying vec2 tc;\n"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    sget-object v2, Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;->YUV:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 21
    .line 22
    if-ne p1, v2, :cond_1

    .line 23
    .line 24
    const-string p1, "uniform sampler2D y_tex;\nuniform sampler2D u_tex;\nuniform sampler2D v_tex;\nvec4 sample(vec2 p) {\n  float y = texture2D(y_tex, p).r * 1.16438;\n  float u = texture2D(u_tex, p).r;\n  float v = texture2D(v_tex, p).r;\n  return vec4(y + 1.59603 * v - 0.874202,\n    y - 0.391762 * u - 0.812968 * v + 0.531668,\n    y + 2.01723 * u - 1.08563, 1);\n}\n"

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    if-ne p1, v1, :cond_2

    .line 34
    .line 35
    const-string p1, "samplerExternalOES"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string p1, "sampler2D"

    .line 39
    .line 40
    :goto_0
    const-string v1, "uniform "

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, " tex;\n"

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p1, "sample("

    .line 54
    .line 55
    const-string v1, "texture2D(tex, "

    .line 56
    .line 57
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method private prepareShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;[FIIII)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShaderType:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual/range {p0 .. p1}, Lcom/momo/rtcbase/GlGenericDrawer;->createShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;)Lcom/momo/rtcbase/GlShader;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 22
    .line 23
    move-object v4, p1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    iput-object p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShaderType:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlShader;->release()V

    .line 32
    .line 33
    .line 34
    :cond_2
    invoke-virtual/range {p0 .. p1}, Lcom/momo/rtcbase/GlGenericDrawer;->createShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;)Lcom/momo/rtcbase/GlShader;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlShader;->useProgram()V

    .line 41
    .line 42
    .line 43
    sget-object v3, Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;->YUV:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 44
    .line 45
    if-ne p1, v3, :cond_3

    .line 46
    .line 47
    const-string p1, "y_tex"

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 54
    .line 55
    .line 56
    const-string p1, "u_tex"

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 63
    .line 64
    .line 65
    const-string p1, "v_tex"

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    const/4 v3, 0x2

    .line 72
    invoke-static {p1, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    const-string p1, "tex"

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 83
    .line 84
    .line 85
    :goto_0
    const-string p1, "Create shader"

    .line 86
    .line 87
    invoke-static {p1}, Lcom/momo/rtcbase/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->shaderCallbacks:Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;

    .line 91
    .line 92
    invoke-interface {p1, v0}, Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;->onNewShader(Lcom/momo/rtcbase/GlShader;)V

    .line 93
    .line 94
    .line 95
    const-string p1, "tex_mat"

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iput p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->texMatrixLocation:I

    .line 102
    .line 103
    const-string p1, "in_pos"

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getAttribLocation(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->inPosLocation:I

    .line 110
    .line 111
    const-string p1, "in_tc"

    .line 112
    .line 113
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/GlShader;->getAttribLocation(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iput p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->inTcLocation:I

    .line 118
    .line 119
    move-object v4, v0

    .line 120
    :goto_1
    invoke-virtual {v4}, Lcom/momo/rtcbase/GlShader;->useProgram()V

    .line 121
    .line 122
    .line 123
    iget p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->inPosLocation:I

    .line 124
    .line 125
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 126
    .line 127
    .line 128
    iget v5, p0, Lcom/momo/rtcbase/GlGenericDrawer;->inPosLocation:I

    .line 129
    .line 130
    const/4 v9, 0x0

    .line 131
    sget-object v10, Lcom/momo/rtcbase/GlGenericDrawer;->FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

    .line 132
    .line 133
    const/4 v6, 0x2

    .line 134
    const/16 v7, 0x1406

    .line 135
    .line 136
    const/4 v8, 0x0

    .line 137
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 138
    .line 139
    .line 140
    iget p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->inTcLocation:I

    .line 141
    .line 142
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 143
    .line 144
    .line 145
    iget v5, p0, Lcom/momo/rtcbase/GlGenericDrawer;->inTcLocation:I

    .line 146
    .line 147
    sget-object v10, Lcom/momo/rtcbase/GlGenericDrawer;->FULL_RECTANGLE_TEXTURE_BUFFER:Ljava/nio/FloatBuffer;

    .line 148
    .line 149
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 150
    .line 151
    .line 152
    iget p1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->texMatrixLocation:I

    .line 153
    .line 154
    invoke-static {p1, v1, v2, p2, v2}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 155
    .line 156
    .line 157
    iget-object v3, p0, Lcom/momo/rtcbase/GlGenericDrawer;->shaderCallbacks:Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;

    .line 158
    .line 159
    move-object v5, p2

    .line 160
    move v6, p3

    .line 161
    move v7, p4

    .line 162
    move/from16 v8, p5

    .line 163
    .line 164
    move/from16 v9, p6

    .line 165
    .line 166
    invoke-interface/range {v3 .. v9}, Lcom/momo/rtcbase/GlGenericDrawer$ShaderCallbacks;->onPrepareShader(Lcom/momo/rtcbase/GlShader;[FIIII)V

    .line 167
    .line 168
    .line 169
    const-string p0, "Prepare shader"

    .line 170
    .line 171
    invoke-static {p0}, Lcom/momo/rtcbase/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method


# virtual methods
.method public createShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;)Lcom/momo/rtcbase/GlShader;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/GlShader;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/GlGenericDrawer;->vertexShader:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->genericFragmentSource:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/momo/rtcbase/GlGenericDrawer;->createFragmentShaderString(Ljava/lang/String;Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, v1, p0}, Lcom/momo/rtcbase/GlShader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public drawOes(I[FIIIIII)V
    .locals 7

    .line 1
    sget-object v1, Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;->OES:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p7

    .line 8
    move v6, p8

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/momo/rtcbase/GlGenericDrawer;->prepareShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;[FIIII)V

    .line 10
    .line 11
    .line 12
    const p0, 0x84c0

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 16
    .line 17
    .line 18
    const p0, 0x8d65

    .line 19
    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 22
    .line 23
    .line 24
    invoke-static {p5, p6, v5, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x4

    .line 28
    const/4 p2, 0x5

    .line 29
    const/4 p3, 0x0

    .line 30
    invoke-static {p2, p3, p1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, p3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public drawRgb(I[FIIIIII)V
    .locals 7

    .line 1
    sget-object v1, Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;->RGB:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p7

    .line 8
    move v6, p8

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/momo/rtcbase/GlGenericDrawer;->prepareShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;[FIIII)V

    .line 10
    .line 11
    .line 12
    const p0, 0x84c0

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 16
    .line 17
    .line 18
    const/16 p0, 0xde1

    .line 19
    .line 20
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 21
    .line 22
    .line 23
    invoke-static {p5, p6, v5, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x4

    .line 27
    const/4 p2, 0x5

    .line 28
    const/4 p3, 0x0

    .line 29
    invoke-static {p2, p3, p1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public drawYuv([I[FIIIIII)V
    .locals 7

    .line 1
    sget-object v1, Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;->YUV:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p7

    .line 8
    move v6, p8

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/momo/rtcbase/GlGenericDrawer;->prepareShader(Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;[FIIII)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    move p2, p0

    .line 14
    :goto_0
    const/16 p3, 0xde1

    .line 15
    .line 16
    const p4, 0x84c0

    .line 17
    .line 18
    .line 19
    const/4 p7, 0x3

    .line 20
    if-ge p2, p7, :cond_0

    .line 21
    .line 22
    add-int/2addr p4, p2

    .line 23
    invoke-static {p4}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 24
    .line 25
    .line 26
    aget p4, p1, p2

    .line 27
    .line 28
    invoke-static {p3, p4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 p2, p2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {p5, p6, v5, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x5

    .line 38
    const/4 p2, 0x4

    .line 39
    invoke-static {p1, p0, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 40
    .line 41
    .line 42
    move p1, p0

    .line 43
    :goto_1
    if-ge p1, p7, :cond_1

    .line 44
    .line 45
    add-int p2, p1, p4

    .line 46
    .line 47
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 48
    .line 49
    .line 50
    invoke-static {p3, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 51
    .line 52
    .line 53
    add-int/lit8 p1, p1, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/rtcbase/GlShader;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShader:Lcom/momo/rtcbase/GlShader;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/rtcbase/GlGenericDrawer;->currentShaderType:Lcom/momo/rtcbase/GlGenericDrawer$ShaderType;

    .line 12
    .line 13
    :cond_0
    return-void
.end method
