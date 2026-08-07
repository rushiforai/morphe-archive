.class public Ll/afl0;
.super Ll/it2;
.source "SourceFile"


# instance fields
.field public E:Ljava/lang/String;

.field private F:I

.field private G:[F

.field private H:Ljava/nio/FloatBuffer;

.field private I:[F

.field private J:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/it2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "mediump"

    .line 5
    .line 6
    iput-object v0, p0, Ll/afl0;->E:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/afl0;->F:I

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v1, v0, [F

    .line 14
    .line 15
    iput-object v1, p0, Ll/afl0;->G:[F

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Ll/afl0;->H:Ljava/nio/FloatBuffer;

    .line 19
    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    iput-object v0, p0, Ll/afl0;->I:[F

    .line 23
    .line 24
    iput-object v1, p0, Ll/afl0;->J:Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public Q([F)V
    .locals 14

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/16 v1, 0x8

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    aget v1, p1, v0

    .line 10
    .line 11
    const/4 v2, 0x5

    .line 12
    aget v3, p1, v2

    .line 13
    .line 14
    const/4 v4, 0x7

    .line 15
    aget v5, p1, v4

    .line 16
    .line 17
    add-float/2addr v3, v5

    .line 18
    const/high16 v6, 0x3f800000    # 1.0f

    .line 19
    .line 20
    sub-float v3, v6, v3

    .line 21
    .line 22
    const/4 v7, 0x6

    .line 23
    aget v8, p1, v7

    .line 24
    .line 25
    add-float/2addr v8, v1

    .line 26
    add-float/2addr v5, v3

    .line 27
    iget-object v9, p0, Ll/afl0;->I:[F

    .line 28
    .line 29
    const/4 v10, 0x0

    .line 30
    aput v1, v9, v10

    .line 31
    .line 32
    const/4 v11, 0x1

    .line 33
    aput v3, v9, v11

    .line 34
    .line 35
    const/4 v12, 0x2

    .line 36
    aput v8, v9, v12

    .line 37
    .line 38
    const/4 v13, 0x3

    .line 39
    aput v3, v9, v13

    .line 40
    .line 41
    aput v1, v9, v0

    .line 42
    .line 43
    aput v5, v9, v2

    .line 44
    .line 45
    aput v8, v9, v7

    .line 46
    .line 47
    aput v5, v9, v4

    .line 48
    .line 49
    aget v1, p1, v10

    .line 50
    .line 51
    aget v3, p1, v11

    .line 52
    .line 53
    aget v5, p1, v13

    .line 54
    .line 55
    add-float/2addr v3, v5

    .line 56
    sub-float/2addr v6, v3

    .line 57
    aget p1, p1, v12

    .line 58
    .line 59
    add-float/2addr p1, v1

    .line 60
    add-float/2addr v5, v6

    .line 61
    iget-object p0, p0, Ll/afl0;->G:[F

    .line 62
    .line 63
    aput v1, p0, v10

    .line 64
    .line 65
    aput v6, p0, v11

    .line 66
    .line 67
    aput p1, p0, v12

    .line 68
    .line 69
    aput v6, p0, v13

    .line 70
    .line 71
    aput v1, p0, v0

    .line 72
    .line 73
    aput v5, p0, v2

    .line 74
    .line 75
    aput p1, p0, v7

    .line 76
    .line 77
    aput v5, p0, v4

    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ffj;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/afl0;->E:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main(){\n   vec2 origin_uv = textureCoordinate;\n   vec2 mask_uv = textureCoordinate1;\n   vec4 color1 = texture2D(inputImageTexture0, origin_uv);\n   vec4 color2 = texture2D(inputImageTexture0, vec2(mask_uv.x, mask_uv.y));\n   color1.a = color2.r;    color1.rgb = color1.rgb * color2.r;    gl_FragColor = color1;\n}\n"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nattribute vec2 inputTextureCoordinate1;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\n  textureCoordinate1 = inputTextureCoordinate1;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/vej;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

    .line 5
    .line 6
    const-string v1, "inputTextureCoordinate1"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/afl0;->F:I

    .line 13
    .line 14
    iget-object v0, p0, Ll/afl0;->G:[F

    .line 15
    .line 16
    array-length v0, v0

    .line 17
    mul-int/lit8 v0, v0, 0x4

    .line 18
    .line 19
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/afl0;->H:Ljava/nio/FloatBuffer;

    .line 36
    .line 37
    iget-object v1, p0, Ll/afl0;->G:[F

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/afl0;->I:[F

    .line 48
    .line 49
    array-length v0, v0

    .line 50
    mul-int/lit8 v0, v0, 0x4

    .line 51
    .line 52
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/afl0;->J:Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    iget-object p0, p0, Ll/afl0;->I:[F

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public x()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vej;->b:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/vej;->f:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/vej;->b:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/vej;->f:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/afl0;->J:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 28
    .line 29
    .line 30
    iget v2, p0, Ll/vej;->g:I

    .line 31
    .line 32
    iget-object v7, p0, Ll/afl0;->J:Ljava/nio/FloatBuffer;

    .line 33
    .line 34
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/vej;->g:I

    .line 38
    .line 39
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/afl0;->H:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    iget v2, p0, Ll/afl0;->F:I

    .line 48
    .line 49
    iget-object v7, p0, Ll/afl0;->H:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 52
    .line 53
    .line 54
    iget v0, p0, Ll/afl0;->F:I

    .line 55
    .line 56
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 57
    .line 58
    .line 59
    const v0, 0x84c0

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 63
    .line 64
    .line 65
    const/16 v0, 0xde1

    .line 66
    .line 67
    iget v2, p0, Ll/vej;->h:I

    .line 68
    .line 69
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 70
    .line 71
    .line 72
    iget p0, p0, Ll/vej;->e:I

    .line 73
    .line 74
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
