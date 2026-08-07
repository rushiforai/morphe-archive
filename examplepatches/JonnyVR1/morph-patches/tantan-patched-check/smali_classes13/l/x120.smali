.class public Ll/x120;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/l6x;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/l6x;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/l6x;

.field private final d:[S

.field private final e:I

.field private f:I

.field private g:I

.field protected i:I

.field protected j:I

.field public k:Ljava/nio/ShortBuffer;

.field private l:Z

.field protected final m:[F

.field n:F

.field o:F

.field private p:Z

.field protected q:Ljava/nio/FloatBuffer;

.field protected r:[F

.field private final s:Ljava/lang/String;

.field private final t:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    new-array v0, v0, [S

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/x120;->d:[S

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    iput v1, p0, Ll/x120;->e:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-boolean v1, p0, Ll/x120;->l:Z

    .line 18
    .line 19
    const/16 v2, 0x10

    .line 20
    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    iput-object v2, p0, Ll/x120;->m:[F

    .line 24
    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iput v2, p0, Ll/x120;->n:F

    .line 28
    .line 29
    iput v2, p0, Ll/x120;->o:F

    .line 30
    .line 31
    iput-boolean v1, p0, Ll/x120;->p:Z

    .line 32
    .line 33
    const-string v2, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; varying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nuniform float flip;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize; if(flip > 1.0){  textureCoordinate = vec2(1.0 - (coord.x + 0.5),(coord.y + 0.5));\n } else{  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0 - (coord.y + 0.5));\n}\n}"

    .line 34
    .line 35
    iput-object v2, p0, Ll/x120;->s:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "precision mediump float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   gl_FragColor = color1; }"

    .line 38
    .line 39
    iput-object v2, p0, Ll/x120;->t:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v2, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Ll/x120;->a:Ljava/util/List;

    .line 47
    .line 48
    new-instance v2, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v2, p0, Ll/x120;->b:Ljava/util/List;

    .line 54
    .line 55
    array-length v2, v0

    .line 56
    mul-int/lit8 v2, v2, 0x2

    .line 57
    .line 58
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iput-object v2, p0, Ll/x120;->k:Ljava/nio/ShortBuffer;

    .line 74
    .line 75
    invoke-virtual {v2, v0}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/x120;->k:Ljava/nio/ShortBuffer;

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x0s
        0x2s
        0x3s
    .end array-data
.end method


# virtual methods
.method public Q1(Ll/l6x;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x120;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/l6x;

    .line 18
    .line 19
    iget-object v2, v1, Ll/l6x;->k:Ll/gfj;

    .line 20
    .line 21
    iget-object v3, p1, Ll/l6x;->k:Ll/gfj;

    .line 22
    .line 23
    if-ne v2, v3, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/x120;->a:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_1
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/x120;->m:[F

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/l6x;->f([F)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/x120;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public R1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/x120;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/l6x;

    .line 23
    .line 24
    iget-object v3, p0, Ll/x120;->b:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-object p0, p0, Ll/x120;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 35
    .line 36
    .line 37
    monitor-exit v0

    .line 38
    return-void

    .line 39
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw p0
.end method

.method public S1(FI)V
    .locals 2

    .line 1
    iget p2, p0, Ll/x120;->f:I

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {p2, v0, p1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 6
    .line 7
    .line 8
    iget p1, p0, Ll/x120;->j:I

    .line 9
    .line 10
    const/high16 p2, 0x40000000    # 2.0f

    .line 11
    .line 12
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/x120;->d:[S

    .line 16
    .line 17
    array-length p1, p1

    .line 18
    const/16 p2, 0x1403

    .line 19
    .line 20
    iget-object v0, p0, Ll/x120;->k:Ljava/nio/ShortBuffer;

    .line 21
    .line 22
    const/4 v1, 0x4

    .line 23
    invoke-static {v1, p1, p2, v0}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 24
    .line 25
    .line 26
    iget p0, p0, Ll/wej;->positionHandle:I

    .line 27
    .line 28
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public T1()Ll/l6x;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x120;->c:Ll/l6x;

    .line 2
    .line 3
    return-object p0
.end method

.method public U1(Ll/l6x;[FI)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v1, Ll/l6x;->i:Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    mul-int/lit8 v3, v3, 0x4

    .line 13
    .line 14
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v1, Ll/l6x;->i:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    :cond_0
    iget-object v3, v1, Ll/l6x;->i:Ljava/nio/FloatBuffer;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v3, v1, Ll/l6x;->i:Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    iget-object v2, v1, Ll/l6x;->i:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    iget v5, v0, Ll/wej;->positionHandle:I

    .line 48
    .line 49
    const/16 v9, 0x8

    .line 50
    .line 51
    iget-object v10, v1, Ll/l6x;->i:Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    const/4 v6, 0x2

    .line 54
    const/16 v7, 0x1406

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 58
    .line 59
    .line 60
    iget v11, v0, Ll/x120;->i:I

    .line 61
    .line 62
    const/16 v15, 0x8

    .line 63
    .line 64
    iget-object v1, v1, Ll/l6x;->b:Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    const/4 v12, 0x2

    .line 67
    const/16 v13, 0x1406

    .line 68
    .line 69
    const/4 v14, 0x0

    .line 70
    move-object/from16 v16, v1

    .line 71
    .line 72
    invoke-static/range {v11 .. v16}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 73
    .line 74
    .line 75
    iget v1, v0, Ll/wej;->positionHandle:I

    .line 76
    .line 77
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 78
    .line 79
    .line 80
    iget v1, v0, Ll/x120;->i:I

    .line 81
    .line 82
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 83
    .line 84
    .line 85
    const v1, 0x84c0

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 89
    .line 90
    .line 91
    const/16 v1, 0xde1

    .line 92
    .line 93
    move/from16 v2, p3

    .line 94
    .line 95
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 96
    .line 97
    .line 98
    iget v0, v0, Ll/wej;->textureHandle:I

    .line 99
    .line 100
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public V1(Ll/l6x;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x120;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    return-void
.end method

.method public X1(Ll/l6x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x120;->c:Ll/l6x;

    .line 2
    .line 3
    return-void
.end method

.method public bindShaderAttributes()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const-string v2, "uMVPMatrix"

    .line 8
    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ll/wej;->programHandle:I

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    const-string v2, "decorationSize"

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget p0, p0, Ll/wej;->programHandle:I

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    const-string v1, "flip"

    .line 24
    .line 25
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/x120;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/l6x;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/l6x;->a()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public drawBackgroundImage()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

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
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Ll/x120;->f:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v0, v2, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 30
    .line 31
    .line 32
    iget v0, p0, Ll/x120;->j:I

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/x120;->r:[F

    .line 39
    .line 40
    const/16 v2, 0x8

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    new-array v0, v2, [F

    .line 45
    .line 46
    iput-object v0, p0, Ll/x120;->r:[F

    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    iget v3, p0, Ll/wej;->curRotation:I

    .line 51
    .line 52
    aget-object v0, v0, v3

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 58
    .line 59
    iget v3, p0, Ll/wej;->curRotation:I

    .line 60
    .line 61
    aget-object v0, v0, v3

    .line 62
    .line 63
    iget-object v3, p0, Ll/x120;->r:[F

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/x120;->q:Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    const/4 v3, 0x4

    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Ll/x120;->r:[F

    .line 74
    .line 75
    array-length v0, v0

    .line 76
    mul-int/2addr v0, v3

    .line 77
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Ll/x120;->q:Ljava/nio/FloatBuffer;

    .line 94
    .line 95
    :cond_1
    move v0, v1

    .line 96
    :goto_0
    if-ge v0, v2, :cond_2

    .line 97
    .line 98
    iget-object v4, p0, Ll/x120;->r:[F

    .line 99
    .line 100
    aget v5, v4, v0

    .line 101
    .line 102
    const/high16 v6, -0x40800000    # -1.0f

    .line 103
    .line 104
    mul-float/2addr v5, v6

    .line 105
    const/high16 v6, 0x3f000000    # 0.5f

    .line 106
    .line 107
    add-float/2addr v5, v6

    .line 108
    aput v5, v4, v0

    .line 109
    .line 110
    add-int/lit8 v0, v0, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    iget-object v0, p0, Ll/x120;->q:Ljava/nio/FloatBuffer;

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/x120;->q:Ljava/nio/FloatBuffer;

    .line 119
    .line 120
    iget-object v2, p0, Ll/x120;->r:[F

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/x120;->q:Ljava/nio/FloatBuffer;

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 128
    .line 129
    .line 130
    iget v4, p0, Ll/x120;->i:I

    .line 131
    .line 132
    const/16 v8, 0x8

    .line 133
    .line 134
    iget-object v9, p0, Ll/x120;->q:Ljava/nio/FloatBuffer;

    .line 135
    .line 136
    const/4 v5, 0x2

    .line 137
    const/16 v6, 0x1406

    .line 138
    .line 139
    const/4 v7, 0x0

    .line 140
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 141
    .line 142
    .line 143
    iget v0, p0, Ll/x120;->i:I

    .line 144
    .line 145
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 146
    .line 147
    .line 148
    const v0, 0x84c0

    .line 149
    .line 150
    .line 151
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/x120;->c:Ll/l6x;

    .line 155
    .line 156
    invoke-virtual {v0}, Ll/l6x;->c()I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    const/16 v2, 0xde1

    .line 161
    .line 162
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 163
    .line 164
    .line 165
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 166
    .line 167
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 168
    .line 169
    .line 170
    const/4 p0, 0x5

    .line 171
    invoke-static {p0, v1, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public drawSub()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v0, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x4100

    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/x120;->drawBackgroundImage()V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0xbe2

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 35
    .line 36
    .line 37
    const/16 v1, 0x303

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    const/16 v4, 0x302

    .line 41
    .line 42
    invoke-static {v4, v1, v3, v1}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/x120;->b:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_0

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ll/l6x;

    .line 62
    .line 63
    iget-object v4, p0, Ll/x120;->b:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v4, p0, Ll/x120;->a:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v4, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    iget-object v1, p0, Ll/x120;->a:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_3

    .line 85
    .line 86
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Ll/l6x;

    .line 91
    .line 92
    invoke-virtual {v3}, Ll/l6x;->b()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    monitor-enter v4

    .line 97
    :try_start_0
    invoke-virtual {v3}, Ll/l6x;->c()I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-gez v5, :cond_1

    .line 102
    .line 103
    monitor-exit v4

    .line 104
    goto :goto_1

    .line 105
    :catchall_0
    move-exception p0

    .line 106
    goto :goto_3

    .line 107
    :cond_1
    invoke-virtual {v3}, Ll/l6x;->g()V

    .line 108
    .line 109
    .line 110
    iget-object v5, v3, Ll/l6x;->m:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-eqz v6, :cond_2

    .line 121
    .line 122
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    check-cast v6, [F

    .line 127
    .line 128
    invoke-virtual {v3}, Ll/l6x;->c()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    invoke-virtual {p0, v3, v6, v7}, Ll/x120;->U1(Ll/l6x;[FI)V

    .line 133
    .line 134
    .line 135
    iget v6, v3, Ll/l6x;->g:F

    .line 136
    .line 137
    iget v7, v3, Ll/l6x;->f:F

    .line 138
    .line 139
    div-float/2addr v6, v7

    .line 140
    invoke-virtual {p0, v6, v2}, Ll/x120;->S1(FI)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 145
    .line 146
    monitor-exit v4

    .line 147
    goto :goto_1

    .line 148
    :goto_3
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    throw p0

    .line 150
    :cond_3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture0;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture0,textureCoordinate);\n   gl_FragColor = color1; }"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; varying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nuniform float flip;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize; if(flip > 1.0){  textureCoordinate = vec2(1.0 - (coord.x + 0.5),(coord.y + 0.5));\n } else{  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0 - (coord.y + 0.5));\n}\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "position2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/x120;->i:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "uMVPMatrix"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/x120;->g:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "decorationSize"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/x120;->f:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "flip"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/x120;->j:I

    .line 43
    .line 44
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/wej;->texture_in:I

    .line 7
    .line 8
    iget-object p1, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 9
    .line 10
    iput-object p1, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-float p1, p1

    .line 31
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    int-to-float p2, p2

    .line 36
    div-float/2addr p1, p2

    .line 37
    iget-object v0, p0, Ll/x120;->m:[F

    .line 38
    .line 39
    const/high16 p2, -0x40800000    # -1.0f

    .line 40
    .line 41
    div-float v4, p2, p1

    .line 42
    .line 43
    const/high16 p2, 0x3f800000    # 1.0f

    .line 44
    .line 45
    div-float v5, p2, p1

    .line 46
    .line 47
    const/high16 v6, 0x40400000    # 3.0f

    .line 48
    .line 49
    const/high16 v7, 0x40e00000    # 7.0f

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    const/high16 v2, -0x40800000    # -1.0f

    .line 53
    .line 54
    const/high16 v3, 0x3f800000    # 1.0f

    .line 55
    .line 56
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/x120;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/l6x;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/l6x;->a()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
