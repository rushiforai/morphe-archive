.class public Ll/ps40;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    new-instance p1, Ll/os40;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2}, Ll/os40;-><init>(Ll/y20;Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b(Ll/y20;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/x20;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, ".png"

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->H1(Landroid/content/Context;)Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    .line 33
    .line 34
    .line 35
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 36
    .line 37
    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public static e(Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/a;->n(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public static f(Ljava/lang/String;Ljava/io/File;Ll/y20;Ll/x20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;
    .locals 2
    .param p3    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Ll/y20<",
            "Ljava/io/File;",
            ">;",
            "Ll/x20;",
            ")",
            "Lcom/p1/mobile/putong/ui/download/DownloadTask;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/ms40;

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ll/ms40;-><init>(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Ll/ns40;

    .line 34
    .line 35
    invoke-direct {p1, p3}, Ll/ns40;-><init>(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method

.method public static g(FF)Z
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float p1, v0, p1

    .line 4
    .line 5
    add-float/2addr p0, p1

    .line 6
    cmpl-float p0, p0, v0

    .line 7
    .line 8
    if-ltz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;
    .locals 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/high16 p1, 0x40a00000    # 5.0f

    .line 10
    .line 11
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const/4 v8, 0x0

    .line 20
    const/4 v9, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    const v6, 0x3efae148    # 0.49f

    .line 24
    .line 25
    .line 26
    const v7, 0x3f028f5c    # 0.51f

    .line 27
    .line 28
    .line 29
    move-object v0, p0

    .line 30
    invoke-static/range {v0 .. v9}, Ll/ps40;->i(Landroid/view/View;Landroid/graphics/Bitmap;IIIIFFFF)Landroid/graphics/Bitmap;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static i(Landroid/view/View;Landroid/graphics/Bitmap;IIIIFFFF)Landroid/graphics/Bitmap;
    .locals 13
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-eqz v1, :cond_5

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-eqz v1, :cond_5

    if-eqz p0, :cond_5

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-eqz v1, :cond_5

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    .line 5
    invoke-virtual {p0, p2, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-ge v1, v2, :cond_1

    invoke-static/range {p8 .. p9}, Ll/ps40;->g(FF)Z

    move-result v1

    if-nez v1, :cond_1

    .line 7
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p8

    float-to-int v1, v1

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float v7, v3, p9

    mul-float/2addr v2, v7

    float-to-int v2, v2

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v7

    sub-int/2addr v7, v1

    sub-int/2addr v7, v2

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 10
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-static {p1, v6, v6, v8, v1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    .line 12
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    sub-int/2addr v10, v1

    sub-int/2addr v10, v2

    .line 13
    invoke-static {p1, v6, v1, v9, v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    sub-int/2addr v10, v2

    .line 15
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    .line 16
    invoke-static {p1, v6, v10, v11, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 17
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    invoke-static {v9, v10, v7, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 18
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v11

    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v10, v11, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 19
    new-instance v11, Landroid/graphics/Canvas;

    invoke-direct {v11, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 20
    invoke-virtual {v11, v8, v5, v5, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    int-to-float v12, v1

    .line 21
    invoke-virtual {v11, v7, v5, v12, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 22
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    add-int/2addr v1, v12

    int-to-float v1, v1

    invoke-virtual {v11, v2, v5, v1, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 23
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->recycle()V

    .line 24
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->recycle()V

    .line 25
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->recycle()V

    .line 26
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 27
    invoke-virtual {p1, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 28
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-static {p1, v1, v2, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 30
    invoke-virtual {v10, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 32
    :cond_2
    :goto_0
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-ge p1, v1, :cond_4

    invoke-static/range {p6 .. p7}, Ll/ps40;->g(FF)Z

    move-result p1

    if-eqz p1, :cond_3

    goto/16 :goto_1

    .line 33
    :cond_3
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, p6

    float-to-int p1, p1

    .line 34
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float v3, v3, p7

    mul-float/2addr v1, v3

    float-to-int v1, v1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    sub-int/2addr v2, p1

    sub-int/2addr v2, v1

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 36
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v10, v6, v6, p1, v3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 37
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, p1

    sub-int/2addr v7, v1

    .line 38
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    .line 39
    invoke-static {v10, p1, v6, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 40
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    sub-int/2addr v8, v1

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .line 41
    invoke-static {v10, v8, v6, v1, v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-static {v7, v2, v6, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 44
    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 45
    invoke-virtual {v6, v3, v5, v5, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    int-to-float v8, p1

    .line 46
    invoke-virtual {v6, v2, v8, v5, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 47
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    add-int/2addr p1, v8

    int-to-float p1, p1

    invoke-virtual {v6, v1, p1, v5, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 48
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p1, v0, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    .line 50
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->recycle()V

    .line 51
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 52
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 53
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->recycle()V

    return-object v4

    .line 54
    :cond_4
    :goto_1
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p1, v0, v10}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object v10

    :cond_5
    :goto_2
    return-object v0
.end method
