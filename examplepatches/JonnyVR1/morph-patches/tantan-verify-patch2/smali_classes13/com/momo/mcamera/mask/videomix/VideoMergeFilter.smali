.class public Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;
.super Ll/hs10;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private hasFace:Z

.field private hasFaceHandle:I

.field private type:I

.field private typeHandle:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->hasFace:Z

    .line 7
    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->hasFaceHandle:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/hs10;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
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

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nvarying vec2 textureCoordinate;\nuniform float hasFace;\nuniform float type;\nvoid main(){\n   vec2 uv = textureCoordinate;\n   vec4 color0 = texture2D(inputImageTexture0, uv);\n   vec4 color1 = texture2D(inputImageTexture1, uv);\n   vec4 color2 = texture2D(inputImageTexture2, uv);\n   vec4 color3 = mix(color1, color0, color2.r);\n   vec4 color4 = mix(color0, color3, step(1.0, hasFace));\n   gl_FragColor = mix(color4, color1, step(1.0, type));\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "hasFace"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->hasFaceHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "type"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->typeHandle:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->hasFaceHandle:I

    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->hasFace:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->typeHandle:I

    .line 18
    .line 19
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->type:I

    .line 20
    .line 21
    int-to-float p0, p0

    .line 22
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->hasFace:Z

    .line 3
    .line 4
    return-void
.end method

.method public setVideoFileConfig(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMergeFilter;->type:I

    .line 2
    .line 3
    return-void
.end method
