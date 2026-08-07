.class public Lcom/bytedance/realx/video/GlClearWorkaround;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;
    }
.end annotation


# static fields
.field private static final DEFAULT_FRAGMENT_SHADER_STRING:Ljava/lang/String; = "#ifdef GL_ES\nprecision mediump float;\n#endif\nuniform vec4 u_clear_color;\nvoid main(void) {\n  gl_FragColor = u_clear_color;\n}\n"

.field private static final DEFAULT_VERTEX_SHADER_STRING:Ljava/lang/String; = "#ifdef GL_ES\nprecision mediump float;\n#endif\nuniform float u_clear_depth;\nattribute vec4 a_position;\nvoid main(void) {\n  gl_Position = vec4(a_position.x, a_position.y, u_clear_depth, 1.0);\n}\n"

.field private static final FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;


# instance fields
.field private currentShader:Lcom/bytedance/realx/video/GlShader;

.field private mHasInit:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/bytedance/realx/video/GlUtil;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/bytedance/realx/video/GlClearWorkaround;->FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

    .line 13
    .line 14
    return-void

    .line 15
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
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->mHasInit:Z

    .line 6
    .line 7
    return-void
.end method

.method private createShader()Lcom/bytedance/realx/video/GlShader;
    .locals 2

    .line 1
    new-instance p0, Lcom/bytedance/realx/video/GlShader;

    .line 2
    .line 3
    const-string v0, "#ifdef GL_ES\nprecision mediump float;\n#endif\nuniform float u_clear_depth;\nattribute vec4 a_position;\nvoid main(void) {\n  gl_Position = vec4(a_position.x, a_position.y, u_clear_depth, 1.0);\n}\n"

    .line 4
    .line 5
    const-string v1, "#ifdef GL_ES\nprecision mediump float;\n#endif\nuniform vec4 u_clear_color;\nvoid main(void) {\n  gl_FragColor = u_clear_color;\n}\n"

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/GlShader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static isNeedWorkaround()Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;->kStatusDisable:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const/16 v0, 0x1f00

    .line 11
    .line 12
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "mali"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    const-string v1, "arm"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget-object v0, Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;->kStatusDisable:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    :goto_0
    sget-object v0, Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;->kStatusEnable:Lcom/bytedance/realx/video/GlClearWorkaround$WORKAROUND_STATUS;

    .line 41
    .line 42
    return-object v0
.end method

.method private prepareShader()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/GlClearWorkaround;->createShader()Lcom/bytedance/realx/video/GlShader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 8
    .line 9
    .line 10
    const-string p0, "Create shader"

    .line 11
    .line 12
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "a_position"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/bytedance/realx/video/GlShader;->getAttribLocation(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 22
    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    sget-object v6, Lcom/bytedance/realx/video/GlClearWorkaround;->FULL_RECTANGLE_BUFFER:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    const/16 v3, 0x1406

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "Prepare shader"

    .line 35
    .line 36
    invoke-static {p0}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public declared-synchronized clear(IIIFFFFFI)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->mHasInit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/bytedance/realx/video/GlClearWorkaround;->prepareShader()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlShader;->useProgram()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 25
    .line 26
    const-string v1, "u_clear_depth"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-static {v0, p8}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 33
    .line 34
    .line 35
    iget-object p8, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 36
    .line 37
    const-string v0, "u_clear_color"

    .line 38
    .line 39
    invoke-virtual {p8, v0}, Lcom/bytedance/realx/video/GlShader;->getUniformLocation(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p8

    .line 43
    invoke-static {p8, p4, p5, p6, p7}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 44
    .line 45
    .line 46
    and-int/lit16 p4, p3, 0x4000

    .line 47
    .line 48
    const/4 p5, 0x0

    .line 49
    if-nez p4, :cond_2

    .line 50
    .line 51
    invoke-static {p5, p5, p5, p5}, Landroid/opengl/GLES20;->glColorMask(ZZZZ)V

    .line 52
    .line 53
    .line 54
    :cond_2
    const-string p4, "before depth test"

    .line 55
    .line 56
    invoke-static {p4}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    and-int/lit16 p4, p3, 0x100

    .line 60
    .line 61
    const/16 p6, 0x207

    .line 62
    .line 63
    const/16 p7, 0xb71

    .line 64
    .line 65
    if-eqz p4, :cond_3

    .line 66
    .line 67
    invoke-static {p7}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 68
    .line 69
    .line 70
    invoke-static {p6}, Landroid/opengl/GLES20;->glDepthFunc(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    invoke-static {p7}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 75
    .line 76
    .line 77
    const/16 p4, 0x200

    .line 78
    .line 79
    invoke-static {p4}, Landroid/opengl/GLES20;->glDepthFunc(I)V

    .line 80
    .line 81
    .line 82
    :goto_1
    const-string p4, "before stencil test"

    .line 83
    .line 84
    invoke-static {p4}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    and-int/lit16 p3, p3, 0x400

    .line 88
    .line 89
    const/16 p4, 0xb90

    .line 90
    .line 91
    const/16 p7, 0x1e00

    .line 92
    .line 93
    if-eqz p3, :cond_4

    .line 94
    .line 95
    invoke-static {p4}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 96
    .line 97
    .line 98
    const/16 p3, 0xff

    .line 99
    .line 100
    invoke-static {p6, p9, p3}, Landroid/opengl/GLES20;->glStencilFunc(III)V

    .line 101
    .line 102
    .line 103
    const/16 p3, 0x1e01

    .line 104
    .line 105
    invoke-static {p7, p7, p3}, Landroid/opengl/GLES20;->glStencilOp(III)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    invoke-static {p4}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 110
    .line 111
    .line 112
    invoke-static {p7, p7, p7}, Landroid/opengl/GLES20;->glStencilOp(III)V

    .line 113
    .line 114
    .line 115
    invoke-static {p5}, Landroid/opengl/GLES20;->glStencilMask(I)V

    .line 116
    .line 117
    .line 118
    :goto_2
    const-string p3, "before clear workaround"

    .line 119
    .line 120
    invoke-static {p3}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    const/16 p3, 0xb44

    .line 124
    .line 125
    invoke-static {p3}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 126
    .line 127
    .line 128
    const/16 p3, 0xbe2

    .line 129
    .line 130
    invoke-static {p3}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 131
    .line 132
    .line 133
    const p3, 0x8037

    .line 134
    .line 135
    .line 136
    invoke-static {p3}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 137
    .line 138
    .line 139
    invoke-static {p5, p5, p1, p2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 140
    .line 141
    .line 142
    const/4 p1, 0x5

    .line 143
    const/4 p2, 0x4

    .line 144
    invoke-static {p1, p5, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 145
    .line 146
    .line 147
    const-string p1, "after clear workaround"

    .line 148
    .line 149
    invoke-static {p1}, Lcom/bytedance/realx/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 150
    .line 151
    .line 152
    monitor-exit p0

    .line 153
    return-void

    .line 154
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 155
    throw p1
.end method

.method public declared-synchronized init()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->mHasInit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->mHasInit:Z

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/bytedance/realx/video/GlShader;->release()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/bytedance/realx/video/GlClearWorkaround;->currentShader:Lcom/bytedance/realx/video/GlShader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method
