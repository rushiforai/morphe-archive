.class public abstract Lcom/momo/mcamera/mask/GLProgram;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ATTRIBUTE_POSITION:Ljava/lang/String; = "position"

.field public static final ATTRIBUTE_TEXCOORD:Ljava/lang/String; = "inputTextureCoordinate"

.field public static final UNIFORM_TEXTUREBASE:Ljava/lang/String; = "inputImageTexture"

.field public static final VARYING_TEXCOORD:Ljava/lang/String; = "textureCoordinate"


# instance fields
.field protected fragmentShaderHandle:I

.field protected height:I

.field protected initialized:Z

.field private mBufferTex:[Ljava/nio/FloatBuffer;

.field private mBufferVex:Ljava/nio/FloatBuffer;

.field private mByteBufferTex:[Ljava/nio/ByteBuffer;

.field private mByteBufferVex:Ljava/nio/ByteBuffer;

.field protected mNumCoord:I

.field protected mNumTexture:I

.field protected positionHandle:I

.field protected programHandle:I

.field protected texCoordHandles:[I

.field protected textureHandles:[I

.field private type:I

.field protected vertexShaderHandle:I

.field protected width:I


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/GLProgram;->initialized:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->textureHandles:[I

    .line 15
    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->positionHandle:I

    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 19
    .line 20
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->width:I

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->height:I

    .line 23
    .line 24
    const/4 v0, 0x4

    .line 25
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->type:I

    .line 26
    .line 27
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferVex:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferTex:[Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    iput-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    iput p1, p0, Lcom/momo/mcamera/mask/GLProgram;->mNumTexture:I

    .line 36
    .line 37
    iput p2, p0, Lcom/momo/mcamera/mask/GLProgram;->mNumCoord:I

    .line 38
    .line 39
    new-array p1, p1, [I

    .line 40
    .line 41
    iput-object p1, p0, Lcom/momo/mcamera/mask/GLProgram;->textureHandles:[I

    .line 42
    .line 43
    new-array p1, p2, [I

    .line 44
    .line 45
    iput-object p1, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 46
    .line 47
    new-array p1, p2, [Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferTex:[Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    new-array p1, p2, [Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    return-void
.end method

.method private attributeCoord()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 8
    .line 9
    array-length v2, v2

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, "attribute vec2 inputTextureCoordinate"

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v3, ";\n"

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v4, "varying vec2 textureCoordinate"

    .line 37
    .line 38
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method private setVaryCoord()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 8
    .line 9
    array-length v2, v2

    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, " textureCoordinate"

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v3, " =  inputTextureCoordinate"

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v3, ";\n"

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 2
    .line 3
    const-string v1, "position"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    if-ge v2, v0, :cond_0

    .line 13
    .line 14
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 15
    .line 16
    add-int/lit8 v1, v2, 0x1

    .line 17
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v4, "inputTextureCoordinate"

    .line 21
    .line 22
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    move v2, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 7
    .line 8
    .line 9
    iput v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 16
    .line 17
    .line 18
    iput v1, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 19
    .line 20
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 25
    .line 26
    .line 27
    iput v1, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 28
    .line 29
    :cond_2
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/GLProgram;->initialized:Z

    .line 30
    .line 31
    return-void
.end method

.method public disableDrawArray()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->positionHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    if-ge v1, v3, :cond_0

    .line 12
    .line 13
    aget v2, v2, v1

    .line 14
    .line 15
    invoke-static {v2}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/16 p0, 0xde1

    .line 22
    .line 23
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public drawFrame([[F[I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/GLProgram;->initialized:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/GLProgram;->initWithGLContext()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/GLProgram;->initialized:Z

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/GLProgram;->subDrawSub([[F[I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public abstract getSubFrameShader()Ljava/lang/String;
.end method

.method public getSubVertexShader()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "attribute vec4 position;\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLProgram;->attributeCoord()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "void main() {\n"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lcom/momo/mcamera/mask/GLProgram;->setVaryCoord()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "   gl_Position = position;\n}\n"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public initCoord([[F)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferVex:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    array-length v3, v1

    .line 13
    mul-int/lit8 v3, v3, 0x4

    .line 14
    .line 15
    if-eq v2, v3, :cond_1

    .line 16
    .line 17
    :cond_0
    array-length v2, v1

    .line 18
    mul-int/lit8 v2, v2, 0x4

    .line 19
    .line 20
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferVex:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferVex:Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 44
    .line 45
    :cond_2
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 58
    .line 59
    .line 60
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->positionHandle:I

    .line 61
    .line 62
    const/4 v6, 0x0

    .line 63
    iget-object v7, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferVex:Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    const/4 v3, 0x2

    .line 66
    const/16 v4, 0x1406

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 70
    .line 71
    .line 72
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->positionHandle:I

    .line 73
    .line 74
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 75
    .line 76
    .line 77
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferTex:[Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    array-length v2, v1

    .line 80
    if-ge v0, v2, :cond_5

    .line 81
    .line 82
    add-int/lit8 v2, v0, 0x1

    .line 83
    .line 84
    aget-object v3, p1, v2

    .line 85
    .line 86
    aget-object v4, v1, v0

    .line 87
    .line 88
    if-nez v4, :cond_3

    .line 89
    .line 90
    array-length v4, v3

    .line 91
    mul-int/lit8 v4, v4, 0x4

    .line 92
    .line 93
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    aput-object v4, v1, v0

    .line 98
    .line 99
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferTex:[Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    aget-object v1, v1, v0

    .line 102
    .line 103
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    aget-object v4, v1, v0

    .line 113
    .line 114
    if-nez v4, :cond_4

    .line 115
    .line 116
    iget-object v4, p0, Lcom/momo/mcamera/mask/GLProgram;->mByteBufferTex:[Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    aget-object v4, v4, v0

    .line 119
    .line 120
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    aput-object v4, v1, v0

    .line 125
    .line 126
    :cond_4
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 127
    .line 128
    aget-object v1, v1, v0

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 134
    .line 135
    aget-object v1, v1, v0

    .line 136
    .line 137
    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    aget-object v1, v1, v0

    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 148
    .line 149
    aget v3, v1, v0

    .line 150
    .line 151
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->mBufferTex:[Ljava/nio/FloatBuffer;

    .line 152
    .line 153
    aget-object v8, v1, v0

    .line 154
    .line 155
    const/4 v4, 0x2

    .line 156
    const/16 v5, 0x1406

    .line 157
    .line 158
    const/4 v6, 0x0

    .line 159
    const/4 v7, 0x0

    .line 160
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 164
    .line 165
    aget v0, v1, v0

    .line 166
    .line 167
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 168
    .line 169
    .line 170
    move v0, v2

    .line 171
    goto :goto_0

    .line 172
    :cond_5
    return-void
.end method

.method public initShaderHandles()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 2
    .line 3
    const-string v1, "position"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->positionHandle:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/GLProgram;->textureHandles:[I

    .line 14
    .line 15
    array-length v3, v2

    .line 16
    if-ge v1, v3, :cond_0

    .line 17
    .line 18
    iget v3, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 19
    .line 20
    new-instance v4, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v5, "inputImageTexture"

    .line 23
    .line 24
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    aput v3, v2, v1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->textureHandles:[I

    .line 44
    .line 45
    array-length v1, v1

    .line 46
    if-ge v0, v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->texCoordHandles:[I

    .line 49
    .line 50
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 51
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v4, "inputTextureCoordinate"

    .line 55
    .line 56
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    aput v2, v1, v0

    .line 71
    .line 72
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    return-void
.end method

.method public initWithGLContext()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/GLProgram;->getSubVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/GLProgram;->getSubFrameShader()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x8b31

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iput v2, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 17
    .line 18
    const v3, 0x8b81

    .line 19
    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    const/4 v5, 0x0

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 29
    .line 30
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 31
    .line 32
    .line 33
    new-array v0, v4, [I

    .line 34
    .line 35
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 36
    .line 37
    invoke-static {v2, v3, v0, v5}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 38
    .line 39
    .line 40
    aget v0, v0, v5

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 45
    .line 46
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 51
    .line 52
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 53
    .line 54
    .line 55
    iput v5, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const-string v0, "none"

    .line 59
    .line 60
    :goto_0
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 61
    .line 62
    if-eqz v2, :cond_5

    .line 63
    .line 64
    const v2, 0x8b30

    .line 65
    .line 66
    .line 67
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iput v2, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 79
    .line 80
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 81
    .line 82
    .line 83
    new-array v1, v4, [I

    .line 84
    .line 85
    iget v2, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 86
    .line 87
    invoke-static {v2, v3, v1, v5}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 88
    .line 89
    .line 90
    aget v1, v1, v5

    .line 91
    .line 92
    if-nez v1, :cond_1

    .line 93
    .line 94
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 95
    .line 96
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 101
    .line 102
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 103
    .line 104
    .line 105
    iput v5, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 106
    .line 107
    :cond_1
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 108
    .line 109
    if-eqz v1, :cond_4

    .line 110
    .line 111
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 116
    .line 117
    if-eqz v0, :cond_2

    .line 118
    .line 119
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 120
    .line 121
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 122
    .line 123
    .line 124
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 125
    .line 126
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 127
    .line 128
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/GLProgram;->bindShaderAttributes()V

    .line 132
    .line 133
    .line 134
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 135
    .line 136
    invoke-static {v0}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 137
    .line 138
    .line 139
    new-array v0, v4, [I

    .line 140
    .line 141
    iget v1, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 142
    .line 143
    const v2, 0x8b82

    .line 144
    .line 145
    .line 146
    invoke-static {v1, v2, v0, v5}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 147
    .line 148
    .line 149
    aget v0, v0, v5

    .line 150
    .line 151
    if-nez v0, :cond_2

    .line 152
    .line 153
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 154
    .line 155
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 156
    .line 157
    .line 158
    iput v5, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 159
    .line 160
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 161
    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 165
    .line 166
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 167
    .line 168
    .line 169
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 170
    .line 171
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 172
    .line 173
    .line 174
    iput v5, p0, Lcom/momo/mcamera/mask/GLProgram;->vertexShaderHandle:I

    .line 175
    .line 176
    iput v5, p0, Lcom/momo/mcamera/mask/GLProgram;->fragmentShaderHandle:I

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/GLProgram;->initShaderHandles()V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_3
    const-string p0, "Could not create program."

    .line 183
    .line 184
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_4
    const-string v1, ": Could not create fragment shader. Reason: "

    .line 189
    .line 190
    invoke-static {p0, v1, v0}, Ll/rej;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_5
    const-string v1, ": Could not create vertex shader. Reason: "

    .line 195
    .line 196
    invoke-static {p0, v1, v0}, Ll/rej;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public passShaderValues([[F[I)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/GLProgram;->initCoord([[F)V

    .line 7
    .line 8
    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    move v0, p1

    .line 11
    :goto_0
    array-length v1, p2

    .line 12
    if-ge p1, v1, :cond_1

    .line 13
    .line 14
    packed-switch p1, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    goto :goto_1

    .line 18
    :pswitch_0
    const v0, 0x84c9

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :pswitch_1
    const v0, 0x84c8

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :pswitch_2
    const v0, 0x84c7

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :pswitch_3
    const v0, 0x84c6

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :pswitch_4
    const v0, 0x84c5

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :pswitch_5
    const v0, 0x84c4

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :pswitch_6
    const v0, 0x84c3

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :pswitch_7
    const v0, 0x84c2

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :pswitch_8
    const v0, 0x84c1

    .line 51
    .line 52
    .line 53
    :goto_1
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 54
    .line 55
    .line 56
    const/16 v1, 0xde1

    .line 57
    .line 58
    aget v2, p2, p1

    .line 59
    .line 60
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/momo/mcamera/mask/GLProgram;->textureHandles:[I

    .line 64
    .line 65
    aget v1, v1, p1

    .line 66
    .line 67
    add-int/lit8 p1, p1, 0x1

    .line 68
    .line 69
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    return-void

    .line 74
    nop

    .line 75
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setDrawType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/GLProgram;->type:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/GLProgram;->width:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/mask/GLProgram;->height:I

    .line 4
    .line 5
    return-void
.end method

.method public subDrawSub([[F[I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/GLProgram;->programHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    array-length v1, p1

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    aget-object v1, p1, v0

    .line 13
    .line 14
    array-length v1, v1

    .line 15
    div-int/lit8 v1, v1, 0x6

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v1, v0

    .line 19
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/GLProgram;->passShaderValues([[F[I)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Lcom/momo/mcamera/mask/GLProgram;->type:I

    .line 23
    .line 24
    mul-int/lit8 v1, v1, 0x3

    .line 25
    .line 26
    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/GLProgram;->disableDrawArray()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
