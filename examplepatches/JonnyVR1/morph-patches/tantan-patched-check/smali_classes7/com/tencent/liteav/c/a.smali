.class public Lcom/tencent/liteav/c/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Lcom/tencent/liteav/basic/c/h;

.field b:Lcom/tencent/liteav/basic/c/h;

.field protected c:[Lcom/tencent/liteav/basic/c/j$a;

.field protected d:Lcom/tencent/liteav/basic/c/j$a;

.field protected e:[I

.field private f:Lcom/tencent/liteav/beauty/b/y;

.field private g:Lcom/tencent/liteav/beauty/b/o;

.field private final h:I

.field private final i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:Lcom/tencent/liteav/basic/c/a;

.field private o:[F

.field private p:Lcom/tencent/liteav/beauty/e;

.field private q:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    iput v1, p0, Lcom/tencent/liteav/c/a;->h:I

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    iput v1, p0, Lcom/tencent/liteav/c/a;->i:I

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput v1, p0, Lcom/tencent/liteav/c/a;->j:I

    .line 21
    .line 22
    iput v1, p0, Lcom/tencent/liteav/c/a;->k:I

    .line 23
    .line 24
    iput v1, p0, Lcom/tencent/liteav/c/a;->l:I

    .line 25
    .line 26
    iput v1, p0, Lcom/tencent/liteav/c/a;->m:I

    .line 27
    .line 28
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->n:Lcom/tencent/liteav/basic/c/a;

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    new-array v1, v1, [F

    .line 32
    .line 33
    fill-array-data v1, :array_0

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/tencent/liteav/c/a;->o:[F

    .line 37
    .line 38
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->e:[I

    .line 43
    .line 44
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->p:Lcom/tencent/liteav/beauty/e;

    .line 45
    .line 46
    const-string v0, "CombineVideoFilter"

    .line 47
    .line 48
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->q:Ljava/lang/String;

    .line 49
    .line 50
    return-void

    .line 51
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private a(III)V
    .locals 3

    if-lez p1, :cond_4

    if-lez p2, :cond_4

    .line 263
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    if-eqz v0, :cond_0

    array-length v1, v0

    if-ne p3, v1, :cond_0

    goto :goto_0

    .line 264
    :cond_0
    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([Lcom/tencent/liteav/basic/c/j$a;)V

    const/4 v0, 0x0

    .line 265
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 266
    invoke-static {v0, p3, p1, p2}, Lcom/tencent/liteav/basic/c/j;->a([Lcom/tencent/liteav/basic/c/j$a;III)[Lcom/tencent/liteav/basic/c/j$a;

    move-result-object p3

    iput-object p3, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 267
    iget-object p3, p0, Lcom/tencent/liteav/c/a;->e:[I

    const/4 v1, 0x0

    if-nez p3, :cond_1

    const/4 p3, 0x1

    .line 268
    new-array p3, p3, [I

    iput-object p3, p0, Lcom/tencent/liteav/c/a;->e:[I

    const/16 v2, 0x1908

    .line 269
    invoke-static {p1, p2, v2, v2, p3}, Lcom/tencent/liteav/basic/c/j;->a(IIII[I)I

    move-result v2

    aput v2, p3, v1

    .line 270
    :cond_1
    iget-object p3, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    if-eqz p3, :cond_2

    .line 271
    invoke-static {p3}, Lcom/tencent/liteav/basic/c/j;->a(Lcom/tencent/liteav/basic/c/j$a;)Lcom/tencent/liteav/basic/c/j$a;

    .line 272
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    .line 273
    :cond_2
    iget-object p3, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    if-nez p3, :cond_3

    .line 274
    invoke-static {p3, p1, p2}, Lcom/tencent/liteav/basic/c/j;->a(Lcom/tencent/liteav/basic/c/j$a;II)Lcom/tencent/liteav/basic/c/j$a;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    .line 275
    :cond_3
    iget-object p1, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    if-eqz p1, :cond_4

    .line 276
    iget-object p1, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    iget-object p1, p1, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    aget p1, p1, v1

    const p2, 0x8d40

    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/4 p1, 0x0

    .line 277
    invoke-static {p1, p1, p1, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0x4100

    .line 278
    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 279
    iget-object p1, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    iget-object p3, p0, Lcom/tencent/liteav/c/a;->o:[F

    invoke-virtual {p1, p3}, Lcom/tencent/liteav/beauty/b/o;->b([F)V

    .line 280
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 281
    invoke-static {p2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    :cond_4
    :goto_0
    return-void
.end method

.method private a([Lcom/tencent/liteav/basic/e/a;)V
    .locals 7

    .line 282
    iget v0, p0, Lcom/tencent/liteav/c/a;->j:I

    iget v1, p0, Lcom/tencent/liteav/c/a;->k:I

    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/c/a;->c(II)V

    .line 283
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    if-nez v0, :cond_0

    .line 284
    new-instance v0, Lcom/tencent/liteav/beauty/b/o;

    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/o;-><init>()V

    iput-object v0, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    .line 285
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    move-result v0

    if-nez v0, :cond_0

    .line 286
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->q:Ljava/lang/String;

    const-string p1, "mCropFilter.init failed!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 287
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->g:Lcom/tencent/liteav/beauty/b/o;

    if-eqz v0, :cond_1

    .line 288
    iget v1, p0, Lcom/tencent/liteav/c/a;->j:I

    iget v2, p0, Lcom/tencent/liteav/c/a;->k:I

    invoke-virtual {v0, v1, v2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 289
    :cond_1
    iget v0, p0, Lcom/tencent/liteav/c/a;->j:I

    iget v1, p0, Lcom/tencent/liteav/c/a;->k:I

    array-length p1, p1

    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/c/a;->a(III)V

    .line 290
    iget-object p1, p0, Lcom/tencent/liteav/c/a;->n:Lcom/tencent/liteav/basic/c/a;

    if-eqz p1, :cond_2

    .line 291
    iget v0, p1, Lcom/tencent/liteav/basic/c/a;->c:I

    iget p1, p1, Lcom/tencent/liteav/basic/c/a;->d:I

    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/c/a;->d(II)Z

    .line 292
    iget-object v1, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    if-eqz v1, :cond_3

    .line 293
    iget v2, p0, Lcom/tencent/liteav/c/a;->j:I

    iget v3, p0, Lcom/tencent/liteav/c/a;->k:I

    iget-object v5, p0, Lcom/tencent/liteav/c/a;->n:Lcom/tencent/liteav/basic/c/a;

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/tencent/liteav/basic/c/h;->a(IILjava/nio/FloatBuffer;Lcom/tencent/liteav/basic/c/a;I)[F

    move-result-object p1

    .line 294
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    sget-object v1, Lcom/tencent/liteav/basic/c/l;->e:[F

    invoke-virtual {v0, v1, p1}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    goto :goto_0

    .line 295
    :cond_2
    invoke-direct {p0}, Lcom/tencent/liteav/c/a;->c()V

    .line 296
    :cond_3
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/c/a;->l:I

    if-lez p1, :cond_4

    iget v0, p0, Lcom/tencent/liteav/c/a;->m:I

    if-lez v0, :cond_4

    .line 297
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/c/a;->b(II)V

    :cond_4
    return-void
.end method

.method private b()V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    if-eqz v0, :cond_0

    .line 41
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    :cond_0
    return-void
.end method

.method private b(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/basic/c/h;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->q:Ljava/lang/String;

    .line 25
    .line 26
    const-string p1, "mOutputFilter.init failed!"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method private c()V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    if-eqz v0, :cond_0

    .line 41
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    :cond_0
    return-void
.end method

.method private c(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/beauty/b/y;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/liteav/beauty/b/y;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->q:Ljava/lang/String;

    .line 25
    .line 26
    const-string p1, "TXCGPUWatermarkTextureFilter.init failed!"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method private d()V
    .locals 2

    .line 41
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 42
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/b/z;->d()V

    .line 43
    iput-object v1, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 44
    :cond_0
    invoke-direct {p0}, Lcom/tencent/liteav/c/a;->b()V

    .line 45
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    if-eqz v0, :cond_1

    .line 46
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 47
    iput-object v1, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    :cond_1
    return-void
.end method

.method private d(II)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Lcom/tencent/liteav/basic/c/h;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->q:Ljava/lang/String;

    .line 25
    .line 26
    const-string p1, "mCropFilter.init failed!"

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return v1
.end method


# virtual methods
.method public a([Lcom/tencent/liteav/basic/e/a;I)I
    .locals 13

    .line 1
    if-eqz p1, :cond_8

    .line 2
    .line 3
    iget v0, p0, Lcom/tencent/liteav/c/a;->j:I

    .line 4
    .line 5
    if-lez v0, :cond_8

    .line 6
    .line 7
    iget v0, p0, Lcom/tencent/liteav/c/a;->k:I

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    invoke-direct {p0, p1}, Lcom/tencent/liteav/c/a;->a([Lcom/tencent/liteav/basic/e/a;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    move v0, v1

    .line 22
    move v2, v0

    .line 23
    :goto_0
    array-length v3, p1

    .line 24
    if-ge v0, v3, :cond_4

    .line 25
    .line 26
    iget-object v2, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 27
    .line 28
    aget-object v2, v2, v0

    .line 29
    .line 30
    iget-object v2, v2, Lcom/tencent/liteav/basic/c/j$a;->a:[I

    .line 31
    .line 32
    aget v2, v2, v1

    .line 33
    .line 34
    const v3, 0x8d40

    .line 35
    .line 36
    .line 37
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-static {v2, v2, v2, v2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 42
    .line 43
    .line 44
    const/16 v2, 0x4100

    .line 45
    .line 46
    invoke-static {v2}, Landroid/opengl/GLES20;->glClear(I)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Lcom/tencent/liteav/beauty/d$f;

    .line 50
    .line 51
    invoke-direct {v2}, Lcom/tencent/liteav/beauty/d$f;-><init>()V

    .line 52
    .line 53
    .line 54
    filled-new-array {v2}, [Lcom/tencent/liteav/beauty/d$f;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    aget-object v4, v2, v1

    .line 59
    .line 60
    aget-object v5, p1, v0

    .line 61
    .line 62
    iget v6, v5, Lcom/tencent/liteav/basic/e/a;->a:I

    .line 63
    .line 64
    iput v6, v4, Lcom/tencent/liteav/beauty/d$f;->e:I

    .line 65
    .line 66
    iget-object v6, v5, Lcom/tencent/liteav/basic/e/a;->f:Lcom/tencent/liteav/basic/c/a;

    .line 67
    .line 68
    iget v7, v6, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 69
    .line 70
    iput v7, v4, Lcom/tencent/liteav/beauty/d$f;->f:I

    .line 71
    .line 72
    iget v8, v6, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 73
    .line 74
    iput v8, v4, Lcom/tencent/liteav/beauty/d$f;->g:I

    .line 75
    .line 76
    iget v8, v6, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 77
    .line 78
    int-to-float v8, v8

    .line 79
    const/high16 v9, 0x3f800000    # 1.0f

    .line 80
    .line 81
    mul-float/2addr v8, v9

    .line 82
    iget v10, p0, Lcom/tencent/liteav/c/a;->j:I

    .line 83
    .line 84
    int-to-float v11, v10

    .line 85
    div-float/2addr v8, v11

    .line 86
    iput v8, v4, Lcom/tencent/liteav/beauty/d$f;->b:F

    .line 87
    .line 88
    iget v6, v6, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 89
    .line 90
    int-to-float v6, v6

    .line 91
    mul-float/2addr v6, v9

    .line 92
    iget v8, p0, Lcom/tencent/liteav/c/a;->k:I

    .line 93
    .line 94
    int-to-float v8, v8

    .line 95
    div-float/2addr v6, v8

    .line 96
    iput v6, v4, Lcom/tencent/liteav/beauty/d$f;->c:F

    .line 97
    .line 98
    int-to-float v6, v7

    .line 99
    mul-float/2addr v6, v9

    .line 100
    int-to-float v7, v10

    .line 101
    div-float/2addr v6, v7

    .line 102
    iput v6, v4, Lcom/tencent/liteav/beauty/d$f;->d:F

    .line 103
    .line 104
    iget-object v4, v5, Lcom/tencent/liteav/basic/e/a;->e:Lcom/tencent/liteav/basic/e/a$a;

    .line 105
    .line 106
    if-eqz v4, :cond_1

    .line 107
    .line 108
    iget-object v5, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 109
    .line 110
    iget v4, v4, Lcom/tencent/liteav/basic/e/a$a;->a:F

    .line 111
    .line 112
    invoke-virtual {v5, v4}, Lcom/tencent/liteav/beauty/b/y;->a(F)V

    .line 113
    .line 114
    .line 115
    iget-object v4, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 116
    .line 117
    aget-object v5, p1, v0

    .line 118
    .line 119
    iget-object v5, v5, Lcom/tencent/liteav/basic/e/a;->e:Lcom/tencent/liteav/basic/e/a$a;

    .line 120
    .line 121
    iget-boolean v5, v5, Lcom/tencent/liteav/basic/e/a$a;->b:Z

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Lcom/tencent/liteav/beauty/b/y;->c(Z)V

    .line 124
    .line 125
    .line 126
    :cond_1
    iget-object v4, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 127
    .line 128
    invoke-virtual {v4, v2}, Lcom/tencent/liteav/b/a;->a([Lcom/tencent/liteav/beauty/d$f;)V

    .line 129
    .line 130
    .line 131
    iget v2, p0, Lcom/tencent/liteav/c/a;->j:I

    .line 132
    .line 133
    iget v4, p0, Lcom/tencent/liteav/c/a;->k:I

    .line 134
    .line 135
    invoke-static {v1, v1, v2, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/tencent/liteav/c/a;->f:Lcom/tencent/liteav/beauty/b/y;

    .line 139
    .line 140
    if-nez v0, :cond_2

    .line 141
    .line 142
    iget-object v4, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    .line 143
    .line 144
    iget-object v4, v4, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    .line 145
    .line 146
    aget v4, v4, v1

    .line 147
    .line 148
    invoke-virtual {v2, v4}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 149
    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_2
    iget-object v4, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 153
    .line 154
    add-int/lit8 v5, v0, -0x1

    .line 155
    .line 156
    aget-object v4, v4, v5

    .line 157
    .line 158
    iget-object v4, v4, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    .line 159
    .line 160
    aget v4, v4, v1

    .line 161
    .line 162
    invoke-virtual {v2, v4}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 163
    .line 164
    .line 165
    :goto_1
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 166
    .line 167
    .line 168
    add-int/lit8 v2, v0, 0x1

    .line 169
    .line 170
    move v12, v2

    .line 171
    move v2, v0

    .line 172
    move v0, v12

    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_3
    move v2, v1

    .line 176
    :cond_4
    iget-object p1, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 177
    .line 178
    aget-object p1, p1, v2

    .line 179
    .line 180
    iget-object p1, p1, Lcom/tencent/liteav/basic/c/j$a;->b:[I

    .line 181
    .line 182
    aget p1, p1, v1

    .line 183
    .line 184
    iget v0, p0, Lcom/tencent/liteav/c/a;->j:I

    .line 185
    .line 186
    iget v2, p0, Lcom/tencent/liteav/c/a;->k:I

    .line 187
    .line 188
    iget-object v3, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 189
    .line 190
    if-eqz v3, :cond_5

    .line 191
    .line 192
    iget-object v3, p0, Lcom/tencent/liteav/c/a;->n:Lcom/tencent/liteav/basic/c/a;

    .line 193
    .line 194
    if-eqz v3, :cond_5

    .line 195
    .line 196
    iget v4, v3, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 197
    .line 198
    iget v3, v3, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 199
    .line 200
    invoke-static {v1, v1, v4, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 201
    .line 202
    .line 203
    iget-object v3, p0, Lcom/tencent/liteav/c/a;->b:Lcom/tencent/liteav/basic/c/h;

    .line 204
    .line 205
    invoke-virtual {v3, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    :cond_5
    iget-object v3, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 210
    .line 211
    if-eqz v3, :cond_6

    .line 212
    .line 213
    iget v0, p0, Lcom/tencent/liteav/c/a;->l:I

    .line 214
    .line 215
    iget v2, p0, Lcom/tencent/liteav/c/a;->m:I

    .line 216
    .line 217
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->a:Lcom/tencent/liteav/basic/c/h;

    .line 221
    .line 222
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    iget v0, p0, Lcom/tencent/liteav/c/a;->l:I

    .line 227
    .line 228
    iget v2, p0, Lcom/tencent/liteav/c/a;->m:I

    .line 229
    .line 230
    :cond_6
    move v4, p1

    .line 231
    move v5, v0

    .line 232
    move v6, v2

    .line 233
    iget-object v3, p0, Lcom/tencent/liteav/c/a;->p:Lcom/tencent/liteav/beauty/e;

    .line 234
    .line 235
    if-eqz v3, :cond_7

    .line 236
    .line 237
    int-to-long v7, p2

    .line 238
    invoke-interface/range {v3 .. v8}, Lcom/tencent/liteav/beauty/e;->a(IIIJ)V

    .line 239
    .line 240
    .line 241
    :cond_7
    return v4

    .line 242
    :cond_8
    :goto_2
    iget-object p0, p0, Lcom/tencent/liteav/c/a;->q:Ljava/lang/String;

    .line 243
    .line 244
    const-string p1, "frames or canvaceSize if null!"

    .line 245
    .line 246
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    const/4 p0, -0x1

    .line 250
    return p0
.end method

.method public a()V
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([Lcom/tencent/liteav/basic/c/j$a;)V

    const/4 v0, 0x0

    .line 258
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 259
    invoke-direct {p0}, Lcom/tencent/liteav/c/a;->d()V

    .line 260
    iget-object v1, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    if-eqz v1, :cond_0

    .line 261
    invoke-static {v1}, Lcom/tencent/liteav/basic/c/j;->a(Lcom/tencent/liteav/basic/c/j$a;)Lcom/tencent/liteav/basic/c/j$a;

    .line 262
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->d:Lcom/tencent/liteav/basic/c/j$a;

    :cond_0
    return-void
.end method

.method public a(II)V
    .locals 1

    if-lez p1, :cond_1

    if-lez p2, :cond_1

    .line 252
    iget v0, p0, Lcom/tencent/liteav/c/a;->j:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lcom/tencent/liteav/c/a;->k:I

    if-eq p2, v0, :cond_1

    .line 253
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    invoke-static {v0}, Lcom/tencent/liteav/basic/c/j;->a([Lcom/tencent/liteav/basic/c/j$a;)V

    const/4 v0, 0x0

    .line 254
    iput-object v0, p0, Lcom/tencent/liteav/c/a;->c:[Lcom/tencent/liteav/basic/c/j$a;

    .line 255
    :cond_1
    iput p1, p0, Lcom/tencent/liteav/c/a;->j:I

    .line 256
    iput p2, p0, Lcom/tencent/liteav/c/a;->k:I

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/c/a;)V
    .locals 0

    .line 251
    iput-object p1, p0, Lcom/tencent/liteav/c/a;->n:Lcom/tencent/liteav/basic/c/a;

    return-void
.end method
