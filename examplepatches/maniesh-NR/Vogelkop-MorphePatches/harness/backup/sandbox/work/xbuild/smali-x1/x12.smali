.class public final Lx12;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/ContentResolver;

.field public final b:Lii;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;Lii;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx12;->a:Landroid/content/ContentResolver;

    iput-object p2, p0, Lx12;->b:Lii;

    return-void
.end method

.method public static a(Ljava/io/InputStream;ILjava/io/File;)Lt12;
    .registers 13

    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p0

    if-nez p0, :cond_9

    sget-object p0, Lt12;->b:Lt12;

    return-object p0

    :cond_9
    new-instance v0, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v2

    const/16 v3, 0x300

    const/16 v4, 0x7d0

    if-lt v1, v2, :cond_2a

    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v4, v3}, Landroid/util/Size;-><init>(II)V

    goto :goto_2f

    :cond_2a
    new-instance v1, Landroid/util/Size;

    invoke-direct {v1, v3, v4}, Landroid/util/Size;-><init>(II)V

    :goto_2f
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    if-gt v2, v3, :cond_45

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v3

    if-gt v2, v3, :cond_45

    move-object v3, v0

    goto :goto_72

    :cond_45
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-double v2, v2

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v4

    int-to-double v4, v4

    div-double/2addr v2, v4

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    int-to-double v6, v1

    div-double/2addr v4, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    new-instance v3, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v4

    int-to-double v4, v4

    div-double/2addr v4, v1

    double-to-int v4, v4

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v5

    int-to-double v5, v5

    div-double/2addr v5, v1

    double-to-int v1, v5

    invoke-direct {v3, v4, v1}, Landroid/util/Size;-><init>(II)V

    :goto_72
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_94

    :try_start_7a
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-static {p0, v0, v3, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_86
    .catchall {:try_start_7a .. :try_end_86} :catchall_8b

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    move-object p0, v0

    goto :goto_8f

    :catchall_8b
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    move-object p0, v1

    :goto_8f
    if-nez p0, :cond_94

    sget-object p0, Lt12;->d:Lt12;

    return-object p0

    :cond_94
    move-object v3, p0

    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    const/high16 p0, 0x43340000    # 180.0f

    const/high16 v0, 0x42b40000    # 90.0f

    const/high16 v4, -0x3d4c0000    # -90.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, -0x40800000    # -1.0f

    packed-switch p1, :pswitch_data_142

    goto :goto_dc

    :pswitch_a8
    invoke-virtual {v8, v4}, Landroid/graphics/Matrix;->setRotate(F)V

    goto :goto_cc

    :pswitch_ac
    invoke-virtual {v8, v4}, Landroid/graphics/Matrix;->setRotate(F)V

    invoke-virtual {v8, v6, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_cc

    :pswitch_b3
    invoke-virtual {v8, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    goto :goto_cc

    :pswitch_b7
    invoke-virtual {v8, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    invoke-virtual {v8, v6, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_cc

    :pswitch_be
    invoke-virtual {v8, p0}, Landroid/graphics/Matrix;->setRotate(F)V

    invoke-virtual {v8, v6, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_cc

    :pswitch_c5
    invoke-virtual {v8, p0}, Landroid/graphics/Matrix;->setRotate(F)V

    goto :goto_cc

    :pswitch_c9
    invoke-virtual {v8, v6, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    :goto_cc
    :try_start_cc
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_db
    .catch Ljava/lang/OutOfMemoryError; {:try_start_cc .. :try_end_db} :catch_dc

    goto :goto_dd

    :catch_dc
    :goto_dc
    move-object p0, v3

    :goto_dd
    if-eq p0, v3, :cond_e2

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    :cond_e2
    :goto_e2
    :try_start_e2
    invoke-static {}, Lr9n;->z()Landroid/graphics/Bitmap$CompressFormat;

    move-result-object p1

    const/16 v0, 0x5a

    invoke-static {p0, p2, p1, v0}, Lz5i;->l0(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;I)Z

    move-result p1

    if-nez p1, :cond_f1

    sget-object p1, Lt12;->c:Lt12;

    goto :goto_133

    :cond_f1
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/32 v5, 0x3d0900

    cmp-long p1, v3, v5

    if-gtz p1, :cond_ff

    sget-object p1, Lt12;->a:Lt12;

    goto :goto_133

    :cond_ff
    new-instance p1, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v3, 0x3f5db3d7

    mul-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-direct {p1, v0, v3}, Landroid/util/Size;-><init>(II)V
    :try_end_11b
    .catchall {:try_start_e2 .. :try_end_11b} :catchall_13c

    :try_start_11b
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    invoke-static {p0, v0, p1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_127
    .catchall {:try_start_11b .. :try_end_127} :catchall_12b

    :try_start_127
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_12f

    :catchall_12b
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    move-object p1, v1

    :goto_12f
    if-nez p1, :cond_137

    sget-object p1, Lt12;->d:Lt12;
    :try_end_133
    .catchall {:try_start_127 .. :try_end_133} :catchall_13c

    :goto_133
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    return-object p1

    :cond_137
    :try_start_137
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_13a
    .catchall {:try_start_137 .. :try_end_13a} :catchall_13c

    move-object p0, p1

    goto :goto_e2

    :catchall_13c
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    throw p1

    :pswitch_data_142
    .packed-switch 0x2
        :pswitch_c9
        :pswitch_c5
        :pswitch_be
        :pswitch_b7
        :pswitch_b3
        :pswitch_ac
        :pswitch_a8
    .end packed-switch
.end method

.method public static b(Ljava/io/File;Ljava/io/File;)Lt12;
    .registers 6

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2e

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/4 v1, 0x1

    :try_start_c
    new-instance v2, Lgh8;

    invoke-direct {v2, v0}, Lgh8;-><init>(Ljava/io/InputStream;)V

    const-string v3, "Orientation"

    invoke-virtual {v2, v1, v3}, Lgh8;->d(ILjava/lang/String;)I

    move-result v1
    :try_end_17
    .catchall {:try_start_c .. :try_end_17} :catchall_17

    :catchall_17
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_1f
    invoke-static {v0, v1, p1}, Lx12;->a(Ljava/io/InputStream;ILjava/io/File;)Lt12;

    move-result-object p0
    :try_end_23
    .catchall {:try_start_1f .. :try_end_23} :catchall_27

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    return-object p0

    :catchall_27
    move-exception p0

    :try_start_28
    throw p0
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_29

    :catchall_29
    move-exception p1

    invoke-static {v0, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1

    :cond_2e
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final c(Lo0g;)Lt12;
    .registers 5

    :try_start_0
    instance-of v0, p1, Lv12;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    goto :goto_15

    :cond_8
    instance-of v0, p1, Lu12;

    if-eqz v0, :cond_e

    move v0, v2

    goto :goto_15

    :cond_e
    instance-of v0, p1, Lw12;

    if-eqz v0, :cond_14

    move v0, v1

    goto :goto_15

    :cond_14
    const/4 v0, -0x2

    :goto_15
    if-eqz v0, :cond_3d

    if-eq v0, v2, :cond_2f

    if-ne v0, v1, :cond_29

    move-object v0, p1

    check-cast v0, Lw12;

    iget-object v0, v0, Lw12;->i:Landroid/net/Uri;

    check-cast p1, Lw12;

    iget-object p1, p1, Lw12;->j:Ljava/io/File;

    invoke-virtual {p0, v0, p1}, Lx12;->e(Landroid/net/Uri;Ljava/io/File;)Lt12;

    move-result-object p0

    return-object p0

    :cond_29
    new-instance p0, Loye;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    throw p0

    :cond_2f
    move-object p0, p1

    check-cast p0, Lu12;

    iget-object p0, p0, Lu12;->i:Ljava/io/File;

    check-cast p1, Lu12;

    iget-object p1, p1, Lu12;->j:Ljava/io/File;

    invoke-static {p0, p1}, Lx12;->b(Ljava/io/File;Ljava/io/File;)Lt12;

    move-result-object p0

    return-object p0

    :cond_3d
    move-object v0, p1

    check-cast v0, Lv12;

    iget-object v0, v0, Lv12;->i:Landroid/net/Uri;

    check-cast p1, Lv12;

    iget-object p1, p1, Lv12;->j:Ljava/io/File;

    invoke-virtual {p0, v0, p1}, Lx12;->d(Landroid/net/Uri;Ljava/io/File;)Lt12;

    move-result-object p0
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4a} :catch_4b

    return-object p0

    :catch_4b
    sget-object p0, Lt12;->d:Lt12;

    return-object p0
.end method

.method public final d(Landroid/net/Uri;Ljava/io/File;)Lt12;
    .registers 8

    iget-object p0, p0, Lx12;->a:Landroid/content/ContentResolver;

    invoke-static {p2}, Lz4o;->P(Ljava/io/File;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_64

    invoke-static {p1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_21

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_19

    const-string p1, ""

    :cond_19
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p2}, Lx12;->b(Ljava/io/File;Ljava/io/File;)Lt12;

    move-result-object p0

    return-object p0

    :cond_21
    :try_start_21
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_25} :catch_61

    if-nez v0, :cond_34

    :try_start_27
    sget-object p0, Lt12;->c:Lt12;
    :try_end_29
    .catchall {:try_start_27 .. :try_end_29} :catchall_2d

    :try_start_29
    invoke-static {v0, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2c} :catch_61

    return-object p0

    :catchall_2d
    move-exception p0

    :try_start_2e
    throw p0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2f

    :catchall_2f
    move-exception p1

    :try_start_30
    invoke-static {v0, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p1
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_34} :catch_61

    :cond_34
    const/4 v2, 0x1

    :try_start_35
    new-instance v3, Lgh8;

    invoke-direct {v3, v0}, Lgh8;-><init>(Ljava/io/InputStream;)V

    const-string v4, "Orientation"

    invoke-virtual {v3, v2, v4}, Lgh8;->d(ILjava/lang/String;)I

    move-result v2
    :try_end_40
    .catchall {:try_start_35 .. :try_end_40} :catchall_40

    :catchall_40
    :try_start_40
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_43} :catch_61

    :try_start_43
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_47} :catch_5e

    if-nez p0, :cond_4f

    :try_start_49
    sget-object p1, Lt12;->c:Lt12;
    :try_end_4b
    .catchall {:try_start_49 .. :try_end_4b} :catchall_57

    :try_start_4b
    invoke-static {p0, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_4e} :catch_5e

    return-object p1

    :cond_4f
    :try_start_4f
    invoke-static {p0, v2, p2}, Lx12;->a(Ljava/io/InputStream;ILjava/io/File;)Lt12;

    move-result-object p1
    :try_end_53
    .catchall {:try_start_4f .. :try_end_53} :catchall_57

    :try_start_53
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_53 .. :try_end_56} :catch_5e

    return-object p1

    :catchall_57
    move-exception p1

    :try_start_58
    throw p1
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_59

    :catchall_59
    move-exception p2

    :try_start_5a
    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_5e} :catch_5e

    :catch_5e
    sget-object p0, Lt12;->c:Lt12;

    return-object p0

    :catch_61
    sget-object p0, Lt12;->c:Lt12;

    return-object p0

    :cond_64
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public final e(Landroid/net/Uri;Ljava/io/File;)Lt12;
    .registers 13

    invoke-static {p2}, Lz4o;->P(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lx12;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v1, Lfvh;

    invoke-direct {v1}, Lfvh;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfvh;->h(Ljava/lang/String;)V

    new-instance v2, Lkvh;

    invoke-direct {v2, v1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, v2}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v3

    new-instance v4, Lwx1;

    invoke-direct {v4, p1, p0, p2}, Lwx1;-><init>(Landroid/net/Uri;Lx12;Ljava/io/File;)V

    new-instance v5, Lk51;

    const/16 p0, 0x1d

    invoke-direct {v5, p0}, Lk51;-><init>(B)V

    const-wide/16 v7, 0x0

    const/16 v9, 0x78

    const/4 v6, 0x0

    invoke-static/range {v3 .. v9}, Lvtp;->R(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJI)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt12;

    return-object p0

    :cond_3b
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
