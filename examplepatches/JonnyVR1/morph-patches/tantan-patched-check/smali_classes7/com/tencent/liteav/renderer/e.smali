.class public Lcom/tencent/liteav/renderer/e;
.super Lcom/tencent/liteav/basic/module/a;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/renderer/e$a;
    }
.end annotation


# static fields
.field private static final a:[F


# instance fields
.field private A:J

.field private B:Z

.field private C:Z

.field private D:Z

.field private E:Z

.field private F:Lcom/tencent/liteav/renderer/e$a;

.field private b:Landroid/graphics/SurfaceTexture;

.field private c:I

.field protected d:Landroid/view/TextureView;

.field protected e:Lcom/tencent/liteav/renderer/d;

.field protected f:I

.field protected g:I

.field protected h:I

.field protected i:I

.field protected j:I

.field protected k:I

.field protected volatile l:I

.field protected m:I

.field protected n:I

.field protected o:Lcom/tencent/liteav/renderer/f;

.field p:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private q:Lcom/tencent/liteav/basic/c/e;

.field private r:Lcom/tencent/liteav/renderer/h;

.field private s:Landroid/view/Surface;

.field private t:I

.field private u:I

.field private v:[I

.field private w:I

.field private x:J

.field private y:J

.field private z:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/liteav/renderer/e;->a:[F

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        -0x40800000    # -1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/module/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->f:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->g:I

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 14
    .line 15
    const/16 v1, 0x320

    .line 16
    .line 17
    iput v1, p0, Lcom/tencent/liteav/renderer/e;->c:I

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->t:I

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->k:I

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    iput v1, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 25
    .line 26
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->m:I

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->n:I

    .line 29
    .line 30
    const/4 v1, 0x5

    .line 31
    new-array v1, v1, [I

    .line 32
    .line 33
    iput-object v1, p0, Lcom/tencent/liteav/renderer/e;->v:[I

    .line 34
    .line 35
    const/16 v1, 0x1f4

    .line 36
    .line 37
    iput v1, p0, Lcom/tencent/liteav/renderer/e;->w:I

    .line 38
    .line 39
    const-wide/16 v1, 0x0

    .line 40
    .line 41
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/e;->x:J

    .line 42
    .line 43
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/e;->y:J

    .line 44
    .line 45
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/e;->z:J

    .line 46
    .line 47
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/e;->A:J

    .line 48
    .line 49
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    .line 50
    .line 51
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->C:Z

    .line 52
    .line 53
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->E:Z

    .line 54
    .line 55
    new-instance v1, Lcom/tencent/liteav/renderer/e$a;

    .line 56
    .line 57
    invoke-direct {v1}, Lcom/tencent/liteav/renderer/e$a;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 61
    .line 62
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->D:Z

    .line 63
    .line 64
    return-void
.end method

.method private a(J)J
    .locals 2

    .line 351
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    move-result-wide v0

    cmp-long p0, p1, v0

    if-lez p0, :cond_0

    const-wide/16 p0, 0x0

    return-wide p0

    :cond_0
    sub-long/2addr v0, p1

    return-wide v0
.end method

.method private a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 7

    int-to-float p0, p3

    int-to-float p2, p2

    div-float p3, p0, p2

    .line 260
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    cmpl-float p3, p3, v0

    if-lez p3, :cond_0

    .line 261
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr p2, p0

    goto :goto_0

    .line 262
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    int-to-float p2, p2

    div-float p2, p0, p2

    .line 263
    :goto_0
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 264
    invoke-virtual {v5, p2, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 265
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 266
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    return-object p0
.end method

.method private a(Landroid/graphics/Matrix;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    .line 267
    iget v3, v0, Lcom/tencent/liteav/renderer/e;->t:I

    iget v4, v0, Lcom/tencent/liteav/renderer/e;->k:I

    add-int/2addr v3, v4

    rem-int/lit16 v3, v3, 0x168

    rsub-int v3, v3, 0x168

    .line 268
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    const/4 v10, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v9, p1

    move-object/from16 v4, p2

    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 269
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Bitmap;->recycle()V

    if-eqz v3, :cond_0

    .line 270
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    int-to-float v3, v3

    .line 271
    invoke-virtual {v4, v3}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 272
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    const/16 v17, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v16, v4

    invoke-static/range {v11 .. v17}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 273
    invoke-virtual {v11}, Landroid/graphics/Bitmap;->recycle()V

    move-object v4, v3

    goto :goto_0

    :cond_0
    move-object v4, v11

    .line 274
    :goto_0
    iget v3, v0, Lcom/tencent/liteav/renderer/e;->u:I

    if-nez v3, :cond_6

    .line 275
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 276
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    const/4 v3, 0x0

    const/4 v5, 0x1

    if-ge v1, v2, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v3

    :goto_1
    if-ge v7, v8, :cond_2

    move v3, v5

    :cond_2
    if-eq v6, v3, :cond_4

    const/high16 v0, 0x3f000000    # 0.5f

    if-eqz v6, :cond_3

    int-to-float v3, v8

    int-to-float v1, v1

    mul-float/2addr v3, v1

    int-to-float v2, v2

    div-float/2addr v3, v2

    int-to-float v2, v7

    sub-float/2addr v2, v3

    mul-float/2addr v2, v0

    .line 277
    new-instance v9, Landroid/graphics/Matrix;

    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    div-float/2addr v1, v3

    .line 278
    invoke-virtual {v9, v1, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    float-to-int v5, v2

    float-to-int v7, v3

    const/4 v10, 0x0

    const/4 v6, 0x0

    .line 279
    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 280
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    return-object v0

    :cond_3
    int-to-float v3, v7

    int-to-float v1, v1

    div-float/2addr v3, v1

    int-to-float v1, v2

    mul-float/2addr v3, v1

    int-to-float v2, v8

    sub-float/2addr v2, v3

    mul-float/2addr v2, v0

    .line 281
    new-instance v13, Landroid/graphics/Matrix;

    invoke-direct {v13}, Landroid/graphics/Matrix;-><init>()V

    div-float/2addr v1, v3

    .line 282
    invoke-virtual {v13, v1, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    float-to-int v6, v2

    float-to-int v8, v3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v5, 0x0

    .line 283
    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 284
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    const/4 v14, 0x0

    const/4 v9, 0x0

    invoke-static/range {v8 .. v14}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 285
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V

    return-object v0

    .line 286
    :cond_4
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    if-eq v1, v3, :cond_5

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-eq v2, v3, :cond_5

    .line 287
    invoke-direct {v0, v4, v1, v2}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_5
    return-object v4

    .line 288
    :cond_6
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    if-eq v1, v3, :cond_7

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-eq v2, v3, :cond_7

    .line 289
    invoke-direct {v0, v4, v1, v2}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_7
    return-object v4
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/e;Landroid/graphics/Matrix;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 0

    .line 257
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/Matrix;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/e;)Lcom/tencent/liteav/basic/c/e;
    .locals 0

    .line 258
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    return-object p0
.end method

.method private a(III[FZ)[I
    .locals 4

    .line 330
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/h;->a()Z

    move-result v0

    if-eq v0, p5, :cond_0

    .line 331
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/h;->c()V

    const/4 v0, 0x0

    .line 332
    iput-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    .line 333
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    if-nez v0, :cond_1

    .line 334
    new-instance v0, Lcom/tencent/liteav/renderer/h;

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/tencent/liteav/renderer/h;-><init>(Ljava/lang/Boolean;)V

    iput-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    .line 335
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/h;->b()V

    .line 336
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    if-eqz p4, :cond_2

    .line 337
    invoke-virtual {v0, p4}, Lcom/tencent/liteav/renderer/h;->a([F)V

    goto :goto_0

    .line 338
    :cond_2
    sget-object p4, Lcom/tencent/liteav/renderer/e;->a:[F

    invoke-virtual {v0, p4}, Lcom/tencent/liteav/renderer/h;->a([F)V

    .line 339
    :goto_0
    iget p4, p0, Lcom/tencent/liteav/renderer/e;->m:I

    .line 340
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->n:I

    .line 341
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->u:I

    .line 342
    iget-object v2, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    if-nez v1, :cond_3

    .line 343
    sget v1, Lcom/tencent/liteav/renderer/h;->a:I

    invoke-virtual {v2, v1}, Lcom/tencent/liteav/renderer/h;->a(I)V

    goto :goto_1

    .line 344
    :cond_3
    sget v1, Lcom/tencent/liteav/renderer/h;->b:I

    invoke-virtual {v2, v1}, Lcom/tencent/liteav/renderer/h;->a(I)V

    .line 345
    :goto_1
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->t:I

    iget v2, p0, Lcom/tencent/liteav/renderer/e;->k:I

    add-int v3, v1, v2

    rem-int/lit16 v3, v3, 0x168

    if-eqz p5, :cond_5

    const/16 p5, 0x5a

    if-eq v1, p5, :cond_4

    const/16 p5, 0x10e

    if-ne v1, p5, :cond_5

    :cond_4
    add-int/2addr v1, v2

    add-int/lit16 v1, v1, 0xb4

    .line 346
    rem-int/lit16 v3, v1, 0x168

    .line 347
    :cond_5
    iget-object p5, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    invoke-virtual {p5, v3}, Lcom/tencent/liteav/renderer/h;->b(I)V

    .line 348
    iget-object p5, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    invoke-virtual {p5, p2, p3}, Lcom/tencent/liteav/renderer/h;->b(II)V

    .line 349
    iget-object p2, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    invoke-virtual {p2, p4, v0}, Lcom/tencent/liteav/renderer/h;->a(II)V

    .line 350
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/h;->d(I)I

    move-result p0

    filled-new-array {p0, p4, v0}, [I

    move-result-object p0

    return-object p0
.end method

.method private b()V
    .locals 13

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->D:Z

    .line 2
    .line 3
    const-string v1, "TXCVideoRender"

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/os/Bundle;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v4, "EVT_USERID"

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {v0, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v4, "EVT_ID"

    .line 24
    .line 25
    const/16 v5, 0x7d3

    .line 26
    .line 27
    invoke-virtual {v0, v4, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    const-string v4, "EVT_TIME"

    .line 31
    .line 32
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 33
    .line 34
    .line 35
    move-result-wide v6

    .line 36
    invoke-virtual {v0, v4, v6, v7}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 37
    .line 38
    .line 39
    const-string v4, "EVT_MSG"

    .line 40
    .line 41
    const-string v6, "Render the first video frame(IDR)"

    .line 42
    .line 43
    invoke-virtual {v0, v4, v6}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    const-string v4, "EVT_PARAM1"

    .line 47
    .line 48
    iget v6, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 49
    .line 50
    invoke-virtual {v0, v4, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    const-string v4, "EVT_PARAM2"

    .line 54
    .line 55
    iget v6, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 56
    .line 57
    invoke-virtual {v0, v4, v6}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->p:Ljava/lang/ref/WeakReference;

    .line 61
    .line 62
    invoke-static {v4, v5, v0}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    .line 63
    .line 64
    .line 65
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 66
    .line 67
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    const/16 v5, 0x1771

    .line 76
    .line 77
    invoke-virtual {p0, v5, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 81
    .line 82
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 83
    .line 84
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    const/16 v5, 0x427d

    .line 89
    .line 90
    invoke-virtual {p0, v5, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 94
    .line 95
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 96
    .line 97
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    const/16 v5, 0x427e

    .line 102
    .line 103
    invoke-virtual {p0, v5, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v4, "trtc_render render first frame "

    .line 109
    .line 110
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v4, ", "

    .line 121
    .line 122
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 126
    .line 127
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    const/4 v0, 0x1

    .line 138
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->D:Z

    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    iget v5, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 153
    .line 154
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    filled-new-array {v0, v4, v5}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const-string v4, "Remote-VideoRender[%d]: Render first frame [tinyID:%s][streamType:%d]"

    .line 163
    .line 164
    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v4, "streamType: 2-big, 3-small, 7-sub"

    .line 169
    .line 170
    const/4 v5, 0x0

    .line 171
    const/4 v6, 0x2

    .line 172
    invoke-static {v6, v0, v4, v5}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    const v4, 0x9c56

    .line 180
    .line 181
    .line 182
    iget v5, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 183
    .line 184
    invoke-static {v0, v4, v2, v3, v5}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 185
    .line 186
    .line 187
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 188
    .line 189
    iget-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 190
    .line 191
    const-wide/16 v6, 0x1

    .line 192
    .line 193
    add-long/2addr v4, v6

    .line 194
    iput-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 195
    .line 196
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->o()V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 200
    .line 201
    iget-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->d:J

    .line 202
    .line 203
    cmp-long v8, v4, v2

    .line 204
    .line 205
    if-eqz v8, :cond_4

    .line 206
    .line 207
    invoke-direct {p0, v4, v5}, Lcom/tencent/liteav/renderer/e;->a(J)J

    .line 208
    .line 209
    .line 210
    move-result-wide v4

    .line 211
    iput-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 212
    .line 213
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 214
    .line 215
    iget-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->j:J

    .line 216
    .line 217
    iget-wide v8, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 218
    .line 219
    add-long/2addr v4, v8

    .line 220
    iput-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->j:J

    .line 221
    .line 222
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->w:I

    .line 223
    .line 224
    int-to-long v4, v4

    .line 225
    cmp-long v4, v8, v4

    .line 226
    .line 227
    const-string v5, " block time:"

    .line 228
    .line 229
    const-string v8, "render frame count:"

    .line 230
    .line 231
    if-lez v4, :cond_2

    .line 232
    .line 233
    iget-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->e:J

    .line 234
    .line 235
    add-long/2addr v9, v6

    .line 236
    iput-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->e:J

    .line 237
    .line 238
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 239
    .line 240
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    const/16 v9, 0x1773

    .line 245
    .line 246
    invoke-virtual {p0, v9, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 250
    .line 251
    iget-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 252
    .line 253
    iget-wide v11, v0, Lcom/tencent/liteav/renderer/e$a;->h:J

    .line 254
    .line 255
    cmp-long v4, v9, v11

    .line 256
    .line 257
    if-lez v4, :cond_1

    .line 258
    .line 259
    iput-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->h:J

    .line 260
    .line 261
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 262
    .line 263
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 264
    .line 265
    .line 266
    move-result-object v4

    .line 267
    const/16 v9, 0x1775

    .line 268
    .line 269
    invoke-virtual {p0, v9, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 278
    .line 279
    iget-wide v9, v4, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 280
    .line 281
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 288
    .line 289
    iget-wide v9, v4, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 290
    .line 291
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string v4, "> 500"

    .line 295
    .line 296
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 307
    .line 308
    iget-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 309
    .line 310
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->c:I

    .line 311
    .line 312
    int-to-long v11, v0

    .line 313
    cmp-long v0, v9, v11

    .line 314
    .line 315
    if-lez v0, :cond_3

    .line 316
    .line 317
    iget-wide v11, p0, Lcom/tencent/liteav/renderer/e;->x:J

    .line 318
    .line 319
    add-long/2addr v11, v6

    .line 320
    iput-wide v11, p0, Lcom/tencent/liteav/renderer/e;->x:J

    .line 321
    .line 322
    iget-wide v11, p0, Lcom/tencent/liteav/renderer/e;->z:J

    .line 323
    .line 324
    add-long/2addr v11, v9

    .line 325
    iput-wide v11, p0, Lcom/tencent/liteav/renderer/e;->z:J

    .line 326
    .line 327
    new-instance v0, Ljava/lang/StringBuilder;

    .line 328
    .line 329
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 333
    .line 334
    iget-wide v9, v4, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 335
    .line 336
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 343
    .line 344
    iget-wide v9, v4, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 345
    .line 346
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    const-string v4, "> "

    .line 350
    .line 351
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->c:I

    .line 355
    .line 356
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->p:Ljava/lang/ref/WeakReference;

    .line 367
    .line 368
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    new-instance v9, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    const-string v10, "Current video playback stuck for "

    .line 375
    .line 376
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-object v10, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 380
    .line 381
    iget-wide v10, v10, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 382
    .line 383
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    const-string v10, "ms"

    .line 387
    .line 388
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v9

    .line 395
    const/16 v10, 0x839

    .line 396
    .line 397
    invoke-static {v0, v4, v10, v9}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;Ljava/lang/String;ILjava/lang/String;)V

    .line 398
    .line 399
    .line 400
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 401
    .line 402
    iget-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->g:J

    .line 403
    .line 404
    iget-wide v11, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 405
    .line 406
    add-long/2addr v9, v11

    .line 407
    iput-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->g:J

    .line 408
    .line 409
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 410
    .line 411
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    const/16 v9, 0x1776

    .line 416
    .line 417
    invoke-virtual {p0, v9, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 418
    .line 419
    .line 420
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 421
    .line 422
    iget-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 423
    .line 424
    const-wide/16 v11, 0x3e8

    .line 425
    .line 426
    cmp-long v4, v9, v11

    .line 427
    .line 428
    if-lez v4, :cond_4

    .line 429
    .line 430
    iget-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->f:J

    .line 431
    .line 432
    add-long/2addr v9, v6

    .line 433
    iput-wide v9, v0, Lcom/tencent/liteav/renderer/e$a;->f:J

    .line 434
    .line 435
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 436
    .line 437
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 438
    .line 439
    .line 440
    move-result-object v4

    .line 441
    const/16 v6, 0x1774

    .line 442
    .line 443
    invoke-virtual {p0, v6, v0, v4}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    new-instance v0, Ljava/lang/StringBuilder;

    .line 447
    .line 448
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 452
    .line 453
    iget-wide v6, v4, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 454
    .line 455
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 462
    .line 463
    iget-wide v4, v4, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 464
    .line 465
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    const-string v4, "> 1000"

    .line 469
    .line 470
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object v0

    .line 477
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    :cond_4
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 481
    .line 482
    .line 483
    move-result-wide v0

    .line 484
    iget-wide v4, p0, Lcom/tencent/liteav/renderer/e;->y:J

    .line 485
    .line 486
    cmp-long v6, v4, v2

    .line 487
    .line 488
    if-nez v6, :cond_5

    .line 489
    .line 490
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/e;->y:J

    .line 491
    .line 492
    goto :goto_0

    .line 493
    :cond_5
    sub-long v4, v0, v4

    .line 494
    .line 495
    const-wide/16 v6, 0x7d0

    .line 496
    .line 497
    cmp-long v4, v4, v6

    .line 498
    .line 499
    if-ltz v4, :cond_7

    .line 500
    .line 501
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 502
    .line 503
    iget-wide v5, p0, Lcom/tencent/liteav/renderer/e;->x:J

    .line 504
    .line 505
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 506
    .line 507
    .line 508
    move-result-object v5

    .line 509
    const/16 v6, 0x4277

    .line 510
    .line 511
    invoke-virtual {p0, v6, v4, v5}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 515
    .line 516
    iget-wide v5, p0, Lcom/tencent/liteav/renderer/e;->z:J

    .line 517
    .line 518
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    const/16 v6, 0x4278

    .line 523
    .line 524
    invoke-virtual {p0, v6, v4, v5}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 525
    .line 526
    .line 527
    iget-wide v4, p0, Lcom/tencent/liteav/renderer/e;->A:J

    .line 528
    .line 529
    cmp-long v4, v4, v2

    .line 530
    .line 531
    if-eqz v4, :cond_6

    .line 532
    .line 533
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v4

    .line 537
    iget-wide v5, p0, Lcom/tencent/liteav/renderer/e;->z:J

    .line 538
    .line 539
    long-to-int v5, v5

    .line 540
    int-to-long v5, v5

    .line 541
    iget v7, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 542
    .line 543
    const v8, 0x9c45

    .line 544
    .line 545
    .line 546
    invoke-static {v4, v8, v5, v6, v7}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 547
    .line 548
    .line 549
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v4

    .line 553
    iget-wide v5, p0, Lcom/tencent/liteav/renderer/e;->y:J

    .line 554
    .line 555
    sub-long v5, v0, v5

    .line 556
    .line 557
    long-to-int v5, v5

    .line 558
    int-to-long v5, v5

    .line 559
    iget v7, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 560
    .line 561
    const v8, 0x9c46

    .line 562
    .line 563
    .line 564
    invoke-static {v4, v8, v5, v6, v7}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 565
    .line 566
    .line 567
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 568
    .line 569
    iget-object v5, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 570
    .line 571
    iget-wide v5, v5, Lcom/tencent/liteav/renderer/e$a;->j:J

    .line 572
    .line 573
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 574
    .line 575
    .line 576
    move-result-object v5

    .line 577
    const/16 v6, 0x1784

    .line 578
    .line 579
    invoke-virtual {p0, v6, v4, v5}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 580
    .line 581
    .line 582
    :cond_6
    iput-wide v2, p0, Lcom/tencent/liteav/renderer/e;->x:J

    .line 583
    .line 584
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/e;->y:J

    .line 585
    .line 586
    iput-wide v2, p0, Lcom/tencent/liteav/renderer/e;->z:J

    .line 587
    .line 588
    :cond_7
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 589
    .line 590
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 591
    .line 592
    .line 593
    move-result-wide v4

    .line 594
    iput-wide v4, v0, Lcom/tencent/liteav/renderer/e$a;->d:J

    .line 595
    .line 596
    iget-wide v0, p0, Lcom/tencent/liteav/renderer/e;->A:J

    .line 597
    .line 598
    cmp-long v0, v0, v2

    .line 599
    .line 600
    if-nez v0, :cond_8

    .line 601
    .line 602
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 603
    .line 604
    iget-wide v0, v0, Lcom/tencent/liteav/renderer/e$a;->d:J

    .line 605
    .line 606
    iput-wide v0, p0, Lcom/tencent/liteav/renderer/e;->A:J

    .line 607
    .line 608
    :cond_8
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 609
    .line 610
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 611
    .line 612
    iput v1, v0, Lcom/tencent/liteav/renderer/e$a;->l:I

    .line 613
    .line 614
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 615
    .line 616
    iput p0, v0, Lcom/tencent/liteav/renderer/e$a;->k:I

    .line 617
    .line 618
    return-void
.end method

.method private b(Landroid/view/Surface;)V
    .locals 4

    .line 649
    const-string v0, "surface-render: set surface stop render thread "

    const-string v1, "TXCVideoRender"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "surface-render: set surface "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 650
    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->s:Landroid/view/Surface;

    if-ne v1, p1, :cond_0

    .line 651
    const-string p0, "TXCVideoRender"

    const-string p1, "surface-render: set the same surface, ignore "

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 652
    :cond_0
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->s:Landroid/view/Surface;

    const/4 v1, 0x1

    .line 653
    iput v1, p0, Lcom/tencent/liteav/renderer/e;->l:I

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 654
    const-string v0, "TXCVideoRender"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "surface-render: set surface start render thread "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/renderer/e;->c(Ljava/lang/Object;)V

    return-void

    .line 656
    :cond_1
    monitor-enter p0

    .line 657
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    if-eqz p1, :cond_2

    .line 658
    const-string p1, "TXCVideoRender"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/e;->a()V

    .line 660
    iput-object v1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 661
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private b(Landroid/view/TextureView;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 622
    iput v0, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 623
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    if-nez v1, :cond_1

    if-nez p1, :cond_2

    :cond_1
    if-eqz v1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    const/4 v0, 0x1

    .line 624
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "play:vrender: set video view @old="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ",new="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/tencent/liteav/renderer/e;->j:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TXCVideoRender"

    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_9

    .line 625
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    if-nez v1, :cond_4

    .line 626
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/renderer/e;->b(Landroid/graphics/SurfaceTexture;)V

    .line 627
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 628
    :cond_4
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    if-eqz p1, :cond_9

    .line 629
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    if-eqz p1, :cond_5

    .line 630
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    iput p1, p0, Lcom/tencent/liteav/renderer/e;->f:I

    .line 631
    :cond_5
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    if-eqz p1, :cond_6

    .line 632
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/tencent/liteav/renderer/e;->g:I

    .line 633
    :cond_6
    new-instance p1, Lcom/tencent/liteav/renderer/d;

    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-direct {p1, v0}, Lcom/tencent/liteav/renderer/d;-><init>(Landroid/view/TextureView;)V

    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    .line 634
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    iget v1, p0, Lcom/tencent/liteav/renderer/e;->i:I

    invoke-virtual {p1, v0, v1}, Lcom/tencent/liteav/renderer/d;->b(II)V

    .line 635
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    iget v0, p0, Lcom/tencent/liteav/renderer/e;->f:I

    iget v1, p0, Lcom/tencent/liteav/renderer/e;->g:I

    invoke-virtual {p1, v0, v1}, Lcom/tencent/liteav/renderer/d;->a(II)V

    .line 636
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    iget v0, p0, Lcom/tencent/liteav/renderer/e;->u:I

    invoke-virtual {p1, v0}, Lcom/tencent/liteav/renderer/d;->a(I)V

    .line 637
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    iget v0, p0, Lcom/tencent/liteav/renderer/e;->t:I

    iget v1, p0, Lcom/tencent/liteav/renderer/e;->k:I

    add-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x168

    invoke-virtual {p1, v0}, Lcom/tencent/liteav/renderer/d;->c(I)V

    .line 638
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-virtual {p1, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 639
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 640
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    if-eqz p1, :cond_8

    .line 641
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 642
    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    if-eq p1, v0, :cond_7

    .line 643
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "play:vrender: setSurfaceTexture "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", surfaceTexture "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1, p0}, Landroid/view/TextureView;->setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 645
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "setSurfaceTexture error "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 646
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "play:vrender: not setSurfaceTexture old surfaceTexture "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ", new surfaceTexture "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 647
    :cond_8
    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 648
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/SurfaceTexture;)V

    :cond_9
    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/renderer/e;)[I
    .locals 0

    .line 662
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->v:[I

    return-object p0
.end method


# virtual methods
.method public a()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 329
    const/4 p0, 0x0

    return-object p0
.end method

.method public a(I)V
    .locals 0

    .line 259
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    return-void
.end method

.method public a(II)V
    .locals 2

    .line 323
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    if-ne v0, p1, :cond_0

    iget v1, p0, Lcom/tencent/liteav/renderer/e;->i:I

    if-eq v1, p2, :cond_2

    :cond_0
    if-ne v0, p1, :cond_1

    .line 324
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->i:I

    if-eq v0, p2, :cond_2

    .line 325
    :cond_1
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 326
    iput p2, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 327
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    if-eqz p0, :cond_2

    .line 328
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/renderer/d;->b(II)V

    :cond_2
    return-void
.end method

.method public a(IIIZI)V
    .locals 0

    .line 306
    invoke-virtual {p0, p2, p3}, Lcom/tencent/liteav/renderer/e;->a(II)V

    return-void
.end method

.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    const/4 p1, 0x1

    .line 322
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    return-void
.end method

.method public a(Landroid/view/Surface;)V
    .locals 0

    .line 300
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/e;->b(Landroid/view/Surface;)V

    return-void
.end method

.method public a(Landroid/view/TextureView;)V
    .locals 0

    .line 299
    invoke-direct {p0, p1}, Lcom/tencent/liteav/renderer/e;->b(Landroid/view/TextureView;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 298
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/renderer/e;->p:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/c/o;)V
    .locals 6

    .line 290
    iget-object v4, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    const/4 v0, 0x0

    if-eqz v4, :cond_0

    .line 291
    :try_start_0
    invoke-virtual {v4}, Landroid/view/TextureView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v1

    goto :goto_0

    :catch_0
    move-object v3, v0

    :goto_0
    if-eqz v3, :cond_2

    .line 292
    invoke-virtual {v4, v0}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v2

    .line 293
    new-instance v0, Lcom/tencent/liteav/renderer/e$1;

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/renderer/e$1;-><init>(Lcom/tencent/liteav/renderer/e;Landroid/graphics/Matrix;Landroid/graphics/Bitmap;Landroid/view/TextureView;Lcom/tencent/liteav/basic/c/o;)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_0
    move-object v1, p0

    move-object v5, p1

    .line 294
    iget-object p0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    if-eqz p0, :cond_1

    .line 295
    new-instance p1, Lcom/tencent/liteav/renderer/e$2;

    invoke-direct {p1, v1, v5}, Lcom/tencent/liteav/renderer/e$2;-><init>(Lcom/tencent/liteav/renderer/e;Lcom/tencent/liteav/basic/c/o;)V

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    if-eqz v5, :cond_2

    .line 296
    invoke-interface {v5, v0}, Lcom/tencent/liteav/basic/c/o;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/TXSVideoFrame;III)V
    .locals 0

    .line 301
    iget p1, p0, Lcom/tencent/liteav/renderer/e;->k:I

    if-eq p4, p1, :cond_0

    .line 302
    iput p4, p0, Lcom/tencent/liteav/renderer/e;->k:I

    .line 303
    iget p1, p0, Lcom/tencent/liteav/renderer/e;->t:I

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/e;->d(I)V

    .line 304
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/tencent/liteav/renderer/e;->a(II)V

    .line 305
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/e;->b()V

    return-void
.end method

.method public a(Lcom/tencent/liteav/renderer/f;)V
    .locals 0

    .line 297
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->o:Lcom/tencent/liteav/renderer/f;

    return-void
.end method

.method public a(Ljava/lang/Object;I[FZ)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "surface-render: onDrawTextureToSurface stop render thread "

    .line 4
    .line 5
    const-string v7, "surface-render: onDrawTextureToSurface start render thread "

    .line 6
    .line 7
    const-string v8, "surface-render: onDrawTextureToSurface surface change stop render thread "

    .line 8
    .line 9
    iget v2, v1, Lcom/tencent/liteav/renderer/e;->l:I

    .line 10
    .line 11
    const/4 v9, 0x1

    .line 12
    if-ne v2, v9, :cond_7

    .line 13
    .line 14
    iget v3, v1, Lcom/tencent/liteav/renderer/e;->h:I

    .line 15
    .line 16
    iget v4, v1, Lcom/tencent/liteav/renderer/e;->i:I

    .line 17
    .line 18
    move/from16 v2, p2

    .line 19
    .line 20
    move-object/from16 v5, p3

    .line 21
    .line 22
    move/from16 v6, p4

    .line 23
    .line 24
    invoke-direct/range {v1 .. v6}, Lcom/tencent/liteav/renderer/e;->a(III[FZ)[I

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/4 v3, 0x0

    .line 29
    aget v11, v2, v3

    .line 30
    .line 31
    aget v16, v2, v9

    .line 32
    .line 33
    const/4 v4, 0x2

    .line 34
    aget v17, v2, v4

    .line 35
    .line 36
    iget-object v4, v1, Lcom/tencent/liteav/renderer/e;->v:[I

    .line 37
    .line 38
    const/4 v5, 0x3

    .line 39
    invoke-static {v2, v3, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v1, Lcom/tencent/liteav/renderer/e;->v:[I

    .line 43
    .line 44
    const/4 v4, 0x4

    .line 45
    if-eqz p4, :cond_0

    .line 46
    .line 47
    aput v9, v2, v5

    .line 48
    .line 49
    const/16 v3, 0xb4

    .line 50
    .line 51
    aput v3, v2, v4

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    aput v3, v2, v5

    .line 55
    .line 56
    aput v3, v2, v4

    .line 57
    .line 58
    :goto_0
    monitor-enter p0

    .line 59
    :try_start_0
    iget-object v2, v1, Lcom/tencent/liteav/renderer/e;->s:Landroid/view/Surface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    iget-object v3, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 62
    .line 63
    const/4 v4, 0x0

    .line 64
    if-eqz v2, :cond_5

    .line 65
    .line 66
    if-eqz v3, :cond_2

    .line 67
    .line 68
    :try_start_1
    invoke-virtual {v3}, Lcom/tencent/liteav/basic/c/e;->b()Landroid/view/Surface;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-ne v0, v2, :cond_1

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-nez v3, :cond_2

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catchall_0
    move-exception v0

    .line 84
    goto/16 :goto_3

    .line 85
    .line 86
    :cond_1
    :goto_1
    const-string v3, "TXCVideoRender"

    .line 87
    .line 88
    new-instance v5, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v6, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 94
    .line 95
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v6, ", "

    .line 99
    .line 100
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v0, ", "

    .line 107
    .line 108
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-static {v3, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/e;->a()V

    .line 124
    .line 125
    .line 126
    iput-object v4, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 127
    .line 128
    :cond_2
    iget-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 129
    .line 130
    if-nez v0, :cond_3

    .line 131
    .line 132
    iget v0, v1, Lcom/tencent/liteav/renderer/e;->l:I

    .line 133
    .line 134
    if-ne v0, v9, :cond_3

    .line 135
    .line 136
    invoke-virtual {v2}, Landroid/view/Surface;->isValid()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_3

    .line 141
    .line 142
    new-instance v0, Lcom/tencent/liteav/basic/c/e;

    .line 143
    .line 144
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/e;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 148
    .line 149
    const-string v0, "TXCVideoRender"

    .line 150
    .line 151
    new-instance v3, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v4, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 157
    .line 158
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v4, ","

    .line 162
    .line 163
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-static {v0, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 177
    .line 178
    move-object/from16 v3, p1

    .line 179
    .line 180
    invoke-virtual {v0, v3, v2}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Object;Landroid/view/Surface;)V

    .line 181
    .line 182
    .line 183
    :cond_3
    iget-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 184
    .line 185
    if-eqz v0, :cond_6

    .line 186
    .line 187
    iget v0, v1, Lcom/tencent/liteav/renderer/e;->l:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 188
    .line 189
    if-ne v0, v9, :cond_6

    .line 190
    .line 191
    iget-object v10, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 192
    .line 193
    if-eqz p4, :cond_4

    .line 194
    .line 195
    :try_start_2
    iget v14, v1, Lcom/tencent/liteav/renderer/e;->m:I

    .line 196
    .line 197
    iget v15, v1, Lcom/tencent/liteav/renderer/e;->n:I

    .line 198
    .line 199
    const/16 v18, 0x0

    .line 200
    .line 201
    const/16 v19, 0x0

    .line 202
    .line 203
    const/4 v12, 0x1

    .line 204
    const/16 v13, 0xb4

    .line 205
    .line 206
    invoke-virtual/range {v10 .. v19}, Lcom/tencent/liteav/basic/c/e;->a(IZIIIIIZZ)V

    .line 207
    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_4
    iget v14, v1, Lcom/tencent/liteav/renderer/e;->m:I

    .line 211
    .line 212
    iget v15, v1, Lcom/tencent/liteav/renderer/e;->n:I

    .line 213
    .line 214
    const/16 v18, 0x0

    .line 215
    .line 216
    const/16 v19, 0x0

    .line 217
    .line 218
    const/4 v12, 0x0

    .line 219
    const/4 v13, 0x0

    .line 220
    invoke-virtual/range {v10 .. v19}, Lcom/tencent/liteav/basic/c/e;->a(IZIIIIIZZ)V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_5
    if-eqz v3, :cond_6

    .line 225
    .line 226
    const-string v2, "TXCVideoRender"

    .line 227
    .line 228
    new-instance v3, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    iget-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 234
    .line 235
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    iget-object v0, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/e;->a()V

    .line 248
    .line 249
    .line 250
    iput-object v4, v1, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 251
    .line 252
    :cond_6
    :goto_2
    monitor-exit p0

    .line 253
    return-void

    .line 254
    :goto_3
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 255
    throw v0

    .line 256
    :cond_7
    return-void
.end method

.method public a(Z)V
    .locals 7

    .line 307
    const-string v0, "surface-render:stop render thread "

    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/e;->C:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 308
    const-string v1, "Remote-VideoRender[%d]: Stop [tinyID:%s][streamType:%d][stopRendThread:%s]"

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lcom/tencent/liteav/renderer/e;->j:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    if-eqz p1, :cond_0

    const-string v6, "true"

    goto :goto_0

    :cond_0
    const-string v6, "false"

    :goto_0
    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "streamType: 2-big, 3-small, 7-sub"

    const/4 v4, 0x2

    invoke-static {v4, v1, v3, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 309
    :cond_1
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/e;->C:Z

    .line 310
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/e;->D:Z

    .line 311
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/e;->E:Z

    if-eqz p1, :cond_3

    .line 312
    iget p1, p0, Lcom/tencent/liteav/renderer/e;->l:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_3

    const/4 p1, -0x1

    .line 313
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 314
    const-string p1, "TXCVideoRender"

    const-string v1, "play:vrender: quit render thread when stop"

    invoke-static {p1, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->e()V

    .line 316
    monitor-enter p0

    .line 317
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    if-eqz p1, :cond_2

    .line 318
    const-string p1, "TXCVideoRender"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    invoke-virtual {p1}, Lcom/tencent/liteav/basic/c/e;->a()V

    const/4 p1, 0x0

    .line 320
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 321
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_3
    return-void
.end method

.method public b(I)V
    .locals 0

    if-lez p1, :cond_0

    .line 619
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->c:I

    :cond_0
    return-void
.end method

.method public b(II)V
    .locals 0

    .line 620
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/renderer/e;->a(II)V

    return-void
.end method

.method public b(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    const/4 p1, 0x0

    .line 621
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    return-void
.end method

.method public c(I)V
    .locals 0

    .line 67
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->u:I

    .line 68
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    if-eqz p0, :cond_0

    .line 69
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/d;->a(I)V

    :cond_0
    return-void
.end method

.method public c(II)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "surface-render: set setSurfaceSize "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "*"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TXCVideoRender"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->m:I

    .line 29
    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->n:I

    .line 33
    .line 34
    if-eq p2, v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->l:I

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    if-ne v0, v1, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->v:[I

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 52
    .line 53
    new-instance v1, Lcom/tencent/liteav/renderer/e$3;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1, p2}, Lcom/tencent/liteav/renderer/e$3;-><init>(Lcom/tencent/liteav/renderer/e;II)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->m:I

    .line 63
    .line 64
    iput p2, p0, Lcom/tencent/liteav/renderer/e;->n:I

    .line 65
    .line 66
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 0

    .line 70
    return-void
.end method

.method public d(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->t:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->k:I

    .line 8
    .line 9
    add-int/2addr p1, p0

    .line 10
    rem-int/lit16 p1, p1, 0x168

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/renderer/d;->c(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 4
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/liteav/renderer/e;->w:I

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "Remote-VideoRender[%d]: Start [tinyID:%s] [streamType:%d]"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x2

    .line 30
    const-string v2, "streamType: 2-big, 3-small, 7-sub"

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-static {v1, v0, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->C:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->E:Z

    .line 40
    .line 41
    iput-boolean v3, p0, Lcom/tencent/liteav/renderer/e;->D:Z

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->m()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public g()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->s:Landroid/view/Surface;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->m:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public h()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->s:Landroid/view/Surface;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->n:I

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/renderer/e;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public k()V
    .locals 0

    return-void
.end method

.method public l()V
    .locals 4

    .line 1
    const-string v0, "surface-render: onRenderThreadEGLDestroy stop render thread "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "TXCVideoRender"

    .line 10
    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/e;->a()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/tencent/liteav/renderer/e;->q:Lcom/tencent/liteav/basic/c/e;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tencent/liteav/renderer/h;->c()V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Lcom/tencent/liteav/renderer/e;->r:Lcom/tencent/liteav/renderer/h;

    .line 47
    .line 48
    :cond_1
    return-void

    .line 49
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw v0
.end method

.method public m()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/renderer/e;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->b:J

    .line 13
    .line 14
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->e:J

    .line 17
    .line 18
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->f:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->g:J

    .line 21
    .line 22
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->h:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->j:J

    .line 25
    .line 26
    iput-wide v1, p0, Lcom/tencent/liteav/renderer/e;->A:J

    .line 27
    .line 28
    const/16 v0, 0x1771

    .line 29
    .line 30
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, v3}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x1773

    .line 36
    .line 37
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 38
    .line 39
    invoke-virtual {p0, v0, v1, v3}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    const/16 v0, 0x1775

    .line 43
    .line 44
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1, v3}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    const/16 v0, 0x1776

    .line 50
    .line 51
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1, v3}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    const/16 v0, 0x1774

    .line 57
    .line 58
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 59
    .line 60
    invoke-virtual {p0, v0, v1, v3}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    const/16 v0, 0x1784

    .line 64
    .line 65
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 66
    .line 67
    invoke-virtual {p0, v0, v1, v3}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public n()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 6
    .line 7
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->d:J

    .line 8
    .line 9
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->i:J

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iput v1, v0, Lcom/tencent/liteav/renderer/e$a;->k:I

    .line 17
    .line 18
    iput v1, v0, Lcom/tencent/liteav/renderer/e$a;->l:I

    .line 19
    .line 20
    iget v0, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 21
    .line 22
    const-wide/16 v3, 0x0

    .line 23
    .line 24
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/16 v3, 0x1772

    .line 29
    .line 30
    invoke-virtual {p0, v3, v0, v1}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x427d

    .line 34
    .line 35
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    const/16 v0, 0x427e

    .line 41
    .line 42
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 43
    .line 44
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public o()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->getTimeTick()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iget-object v2, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 23
    .line 24
    iget-wide v3, v2, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 25
    .line 26
    sub-long/2addr v0, v3

    .line 27
    const-wide/16 v3, 0x3b6

    .line 28
    .line 29
    cmp-long v3, v0, v3

    .line 30
    .line 31
    if-ltz v3, :cond_1

    .line 32
    .line 33
    iget-wide v3, v2, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 34
    .line 35
    iget-wide v5, v2, Lcom/tencent/liteav/renderer/e$a;->b:J

    .line 36
    .line 37
    sub-long/2addr v3, v5

    .line 38
    long-to-double v2, v3

    .line 39
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    mul-double/2addr v2, v4

    .line 45
    long-to-double v4, v0

    .line 46
    div-double/2addr v2, v4

    .line 47
    iget v4, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 48
    .line 49
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const/16 v6, 0x1772

    .line 54
    .line 55
    invoke-virtual {p0, v6, v4, v5}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(IILjava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    double-to-int v2, v2

    .line 63
    int-to-long v2, v2

    .line 64
    iget v5, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 65
    .line 66
    const v6, 0x9c41

    .line 67
    .line 68
    .line 69
    invoke-static {v4, v6, v2, v3, v5}, Lcom/tencent/liteav/basic/module/TXCKeyPointReportProxy;->a(Ljava/lang/String;IJI)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 73
    .line 74
    iget-wide v2, p0, Lcom/tencent/liteav/renderer/e$a;->c:J

    .line 75
    .line 76
    iput-wide v2, p0, Lcom/tencent/liteav/renderer/e$a;->b:J

    .line 77
    .line 78
    iget-wide v2, p0, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 79
    .line 80
    add-long/2addr v2, v0

    .line 81
    iput-wide v2, p0, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "play:vrender: texture available @"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "id "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "_"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "TXCVideoRender"

    .line 38
    .line 39
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iput p2, p0, Lcom/tencent/liteav/renderer/e;->f:I

    .line 43
    .line 44
    iput p3, p0, Lcom/tencent/liteav/renderer/e;->g:I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-virtual {v0, p2, p3}, Lcom/tencent/liteav/renderer/d;->a(II)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p2, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 54
    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p2, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 64
    .line 65
    if-eq p1, p2, :cond_1

    .line 66
    .line 67
    iget-object p1, p0, Lcom/tencent/liteav/renderer/e;->d:Landroid/view/TextureView;

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Landroid/view/TextureView;->setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    const/4 p1, 0x0

    .line 73
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/SurfaceTexture;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    const/4 p1, 0x1

    .line 80
    iput-boolean p1, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    .line 81
    .line 82
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 5

    .line 1
    const-string v0, "TXCVideoRender"

    .line 2
    .line 3
    const-string v1, "play:vrender:  onSurfaceTextureDestroyed when need save texture : "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iput-boolean v2, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/e;->E:Z

    .line 14
    .line 15
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "id "

    .line 19
    .line 20
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/module/a;->getID()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "_"

    .line 31
    .line 32
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->j:I

    .line 36
    .line 37
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-boolean v1, p0, Lcom/tencent/liteav/renderer/e;->E:Z

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catch_0
    move-exception p1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->F:Lcom/tencent/liteav/renderer/e$a;

    .line 57
    .line 58
    const-wide/16 v3, 0x0

    .line 59
    .line 60
    iput-wide v3, v1, Lcom/tencent/liteav/renderer/e$a;->a:J

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/e;->b(Landroid/graphics/SurfaceTexture;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 66
    .line 67
    if-ne p1, v1, :cond_1

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    iput-object p1, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :goto_0
    const-string v1, "onSurfaceTextureDestroyed failed."

    .line 74
    .line 75
    invoke-static {v0, v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->b:Landroid/graphics/SurfaceTexture;

    .line 79
    .line 80
    if-nez p0, :cond_2

    .line 81
    .line 82
    const/4 v2, 0x1

    .line 83
    :cond_2
    return v2
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "play:vrender: texture size change new:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, " old:"

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v2, p0, Lcom/tencent/liteav/renderer/e;->f:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget v1, p0, Lcom/tencent/liteav/renderer/e;->g:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "TXCVideoRender"

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    .line 47
    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    const-string v0, "play:vrender: onSurfaceCreate on onSurfaceTextureSizeChanged when onSurfaceTextureAvailable is not trigger"

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Lcom/tencent/liteav/renderer/e;->B:Z

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/e;->a(Landroid/graphics/SurfaceTexture;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iput p2, p0, Lcom/tencent/liteav/renderer/e;->f:I

    .line 62
    .line 63
    iput p3, p0, Lcom/tencent/liteav/renderer/e;->g:I

    .line 64
    .line 65
    iget-object p0, p0, Lcom/tencent/liteav/renderer/e;->e:Lcom/tencent/liteav/renderer/d;

    .line 66
    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0, p2, p3}, Lcom/tencent/liteav/renderer/d;->a(II)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method
