.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;
.super Ll/d33;
.source "SourceFile"


# static fields
.field public static final UNIFORM_TEXTURE1:Ljava/lang/String; = "inputImageTexture1"


# instance fields
.field private texOffsetHandle:I

.field private textureHandle1:I

.field public texturedHorrizonOffset:F

.field public texturedVerticalOffset:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d33;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texturedVerticalOffset:F

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texturedHorrizonOffset:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texOffsetHandle:I

    .line 11
    .line 12
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->textureHandle1:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getSubFrameShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\n uniform vec2 texOffset;varying vec2 textureCoordinate;\nvoid main(){\n vec2 newCoord = textureCoordinate+ texOffset; if(newCoord.y >= 1.0){  newCoord.y = newCoord.y - 1.0;   gl_FragColor = texture2D(inputImageTexture1, newCoord);\n }else{   gl_FragColor = texture2D(inputImageTexture0, newCoord);\n }}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d33;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->programHandle:I

    .line 5
    .line 6
    const-string v1, "texOffset"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texOffsetHandle:I

    .line 13
    .line 14
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->programHandle:I

    .line 15
    .line 16
    const-string v1, "inputImageTexture1"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->textureHandle1:I

    .line 23
    .line 24
    return-void
.end method

.method public declared-synchronized passShaderValues([I)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1}, Ll/d33;->passShaderValues([I)V

    .line 3
    .line 4
    .line 5
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texOffsetHandle:I

    .line 6
    .line 7
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texturedHorrizonOffset:F

    .line 8
    .line 9
    iget v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texturedVerticalOffset:F

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 12
    .line 13
    .line 14
    const v0, 0x84c1

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 18
    .line 19
    .line 20
    array-length v0, p1

    .line 21
    const/4 v1, 0x2

    .line 22
    const/4 v2, 0x1

    .line 23
    const/16 v3, 0xde1

    .line 24
    .line 25
    if-lt v0, v1, :cond_0

    .line 26
    .line 27
    aget p1, p1, v2

    .line 28
    .line 29
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    aget p1, p1, v0

    .line 37
    .line 38
    invoke-static {v3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->textureHandle1:I

    .line 42
    .line 43
    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-void

    .line 48
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p1
.end method

.method public setTexturedHorrizonOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texturedHorrizonOffset:F

    .line 2
    .line 3
    return-void
.end method

.method public setTexturedVerticalOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/ScrollEffectProgram;->texturedVerticalOffset:F

    .line 2
    .line 3
    return-void
.end method
