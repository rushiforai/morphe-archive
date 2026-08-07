.class public abstract Ll/wnd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zc80;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wnd$a;
    }
.end annotation


# static fields
.field public static final f:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final g:[B


# instance fields
.field public final a:Ll/v23;

.field public b:Z

.field public c:Z

.field public final d:Lcom/facebook/imagepipeline/platform/PreverificationHelper;

.field public final e:Ll/nj80;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Ll/wnd;

    .line 2
    .line 3
    sput-object v0, Ll/wnd;->f:Ljava/lang/Class;

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/wnd;->g:[B

    .line 12
    .line 13
    return-void

    .line 14
    nop

    .line 15
    :array_0
    .array-data 1
        -0x1t
        -0x27t
    .end array-data
.end method

.method public constructor <init>(Ll/v23;Ll/nj80;Ll/bd80;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v23;",
            "Ll/nj80<",
            "Ljava/nio/ByteBuffer;",
            ">;",
            "Ll/bd80;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x1a

    .line 7
    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/facebook/imagepipeline/platform/PreverificationHelper;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/facebook/imagepipeline/platform/PreverificationHelper;-><init>()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iput-object v0, p0, Ll/wnd;->d:Lcom/facebook/imagepipeline/platform/PreverificationHelper;

    .line 18
    .line 19
    iput-object p1, p0, Ll/wnd;->a:Ll/v23;

    .line 20
    .line 21
    instance-of p1, p1, Ll/pfe;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p3}, Ll/bd80;->a()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput-boolean p1, p0, Ll/wnd;->b:Z

    .line 30
    .line 31
    invoke-virtual {p3}, Ll/bd80;->b()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput-boolean p1, p0, Ll/wnd;->c:Z

    .line 36
    .line 37
    :cond_1
    iput-object p2, p0, Ll/wnd;->e:Ll/nj80;

    .line 38
    .line 39
    return-void
.end method

.method public static e(Ll/n0f;Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/BitmapFactory$Options;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/n0f;->J()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 14
    .line 15
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 16
    .line 17
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 18
    .line 19
    const/16 v3, 0x1a

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-lt v2, v3, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/sgw;->a()Landroid/graphics/Bitmap$Config;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-ne p1, v2, :cond_0

    .line 29
    .line 30
    move v2, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v2, v4

    .line 33
    :goto_0
    if-nez v2, :cond_1

    .line 34
    .line 35
    iput-object p1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 36
    .line 37
    :cond_1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 38
    .line 39
    if-nez p2, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 p2, 0x0

    .line 46
    invoke-static {p0, p2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 47
    .line 48
    .line 49
    iget p0, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 50
    .line 51
    const/4 v1, -0x1

    .line 52
    if-eq p0, v1, :cond_2

    .line 53
    .line 54
    iget p0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 55
    .line 56
    if-eq p0, v1, :cond_2

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 60
    .line 61
    .line 62
    return-object p2

    .line 63
    :cond_3
    :goto_1
    if-eqz v2, :cond_4

    .line 64
    .line 65
    iput-object p1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 66
    .line 67
    :cond_4
    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 68
    .line 69
    return-object v0
.end method


# virtual methods
.method public a(Ll/n0f;Landroid/graphics/Bitmap$Config;Landroid/graphics/Rect;Landroid/graphics/ColorSpace;)Ll/fb5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n0f;",
            "Landroid/graphics/Bitmap$Config;",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/ColorSpace;",
            ")",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/wnd;->b:Z

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Ll/wnd;->e(Ll/n0f;Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/BitmapFactory$Options;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object v0, p2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/io/InputStream;

    .line 25
    .line 26
    invoke-virtual {p0, v1, p2, p3, p4}, Ll/wnd;->c(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Landroid/graphics/ColorSpace;)Ll/fb5;

    .line 27
    .line 28
    .line 29
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    return-object p0

    .line 31
    :catch_0
    move-exception p2

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    sget-object p2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/wnd;->a(Ll/n0f;Landroid/graphics/Bitmap$Config;Landroid/graphics/Rect;Landroid/graphics/ColorSpace;)Ll/fb5;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    throw p2
.end method

.method public b(Ll/n0f;Landroid/graphics/Bitmap$Config;Landroid/graphics/Rect;ILandroid/graphics/ColorSpace;)Ll/fb5;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n0f;",
            "Landroid/graphics/Bitmap$Config;",
            "Landroid/graphics/Rect;",
            "I",
            "Landroid/graphics/ColorSpace;",
            ")",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p4}, Ll/n0f;->U(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Ll/wnd;->b:Z

    .line 6
    .line 7
    invoke-static {p1, p2, v1}, Ll/wnd;->e(Ll/n0f;Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/BitmapFactory$Options;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p1}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/n0f;->M()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-le v2, p4, :cond_0

    .line 23
    .line 24
    new-instance v2, Ll/eor;

    .line 25
    .line 26
    invoke-direct {v2, v1, p4}, Ll/eor;-><init>(Ljava/io/InputStream;I)V

    .line 27
    .line 28
    .line 29
    move-object v1, v2

    .line 30
    :cond_0
    if-nez v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Ll/y2i0;

    .line 33
    .line 34
    sget-object v2, Ll/wnd;->g:[B

    .line 35
    .line 36
    invoke-direct {v0, v1, v2}, Ll/y2i0;-><init>(Ljava/io/InputStream;[B)V

    .line 37
    .line 38
    .line 39
    move-object v1, v0

    .line 40
    :cond_1
    iget-object v0, p2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 41
    .line 42
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 43
    .line 44
    if-eq v0, v2, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    :goto_0
    move v2, v0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    const/4 v0, 0x0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    :try_start_0
    invoke-virtual {p0, v1, p2, p3, p5}, Ll/wnd;->c(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Landroid/graphics/ColorSpace;)Ll/fb5;

    .line 52
    .line 53
    .line 54
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :catch_0
    move-exception v0

    .line 60
    move-object p1, v0

    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    return-object p0

    .line 65
    :catchall_0
    move-exception v0

    .line 66
    move-object p0, v0

    .line 67
    goto :goto_3

    .line 68
    :catch_1
    move-exception v0

    .line 69
    move-object p2, v0

    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    :try_start_2
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 73
    .line 74
    move-object v3, p0

    .line 75
    move-object v4, p1

    .line 76
    move-object v6, p3

    .line 77
    move v7, p4

    .line 78
    move-object v8, p5

    .line 79
    invoke-virtual/range {v3 .. v8}, Ll/wnd;->b(Ll/n0f;Landroid/graphics/Bitmap$Config;Landroid/graphics/Rect;ILandroid/graphics/ColorSpace;)Ll/fb5;

    .line 80
    .line 81
    .line 82
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :catch_2
    move-exception v0

    .line 88
    move-object p1, v0

    .line 89
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 90
    .line 91
    .line 92
    :goto_2
    return-object p0

    .line 93
    :cond_3
    :try_start_4
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    :goto_3
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 95
    .line 96
    .line 97
    goto :goto_4

    .line 98
    :catch_3
    move-exception v0

    .line 99
    move-object p1, v0

    .line 100
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    :goto_4
    throw p0
.end method

.method public final c(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Landroid/graphics/ColorSpace;)Ll/fb5;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Landroid/graphics/BitmapFactory$Options;",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/ColorSpace;",
            ")",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 5
    .line 6
    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 15
    .line 16
    div-int/2addr v0, v1

    .line 17
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget v2, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 22
    .line 23
    div-int/2addr v1, v2

    .line 24
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    const/16 v4, 0x1a

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    if-lt v2, v4, :cond_1

    .line 31
    .line 32
    iget-object v6, p0, Ll/wnd;->d:Lcom/facebook/imagepipeline/platform/PreverificationHelper;

    .line 33
    .line 34
    if-eqz v6, :cond_1

    .line 35
    .line 36
    iget-object v7, p2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 37
    .line 38
    invoke-virtual {v6, v7}, Lcom/facebook/imagepipeline/platform/PreverificationHelper;->shouldUseHardwareBitmapConfig(Landroid/graphics/Bitmap$Config;)Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-eqz v6, :cond_1

    .line 43
    .line 44
    move v6, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    move v6, v5

    .line 47
    :goto_0
    const/4 v7, 0x0

    .line 48
    if-nez p3, :cond_2

    .line 49
    .line 50
    if-eqz v6, :cond_2

    .line 51
    .line 52
    iput-boolean v5, p2, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    if-eqz p3, :cond_3

    .line 56
    .line 57
    if-eqz v6, :cond_3

    .line 58
    .line 59
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 60
    .line 61
    iput-object v5, p2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 62
    .line 63
    :cond_3
    iget-boolean v5, p0, Ll/wnd;->b:Z

    .line 64
    .line 65
    if-nez v5, :cond_5

    .line 66
    .line 67
    invoke-virtual {p0, v0, v1, p2}, Ll/wnd;->d(IILandroid/graphics/BitmapFactory$Options;)I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    iget-object v6, p0, Ll/wnd;->a:Ll/v23;

    .line 72
    .line 73
    invoke-interface {v6, v5}, Ll/vi80;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    check-cast v5, Landroid/graphics/Bitmap;

    .line 78
    .line 79
    if-eqz v5, :cond_4

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_4
    const-string p0, "BitmapPool.get returned null"

    .line 83
    .line 84
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-object v7

    .line 88
    :cond_5
    :goto_1
    move-object v5, v7

    .line 89
    :goto_2
    iput-object v5, p2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 90
    .line 91
    if-lt v2, v4, :cond_7

    .line 92
    .line 93
    if-nez p4, :cond_6

    .line 94
    .line 95
    invoke-static {}, Ll/uqd;->a()Landroid/graphics/ColorSpace$Named;

    .line 96
    .line 97
    .line 98
    move-result-object p4

    .line 99
    invoke-static {p4}, Ll/vqd;->a(Landroid/graphics/ColorSpace$Named;)Landroid/graphics/ColorSpace;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    :cond_6
    invoke-static {p2, p4}, Ll/hae;->a(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/ColorSpace;)V

    .line 104
    .line 105
    .line 106
    :cond_7
    iget-object p4, p0, Ll/wnd;->e:Ll/nj80;

    .line 107
    .line 108
    invoke-interface {p4}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p4

    .line 112
    check-cast p4, Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    if-nez p4, :cond_8

    .line 115
    .line 116
    invoke-static {}, Ll/rhd;->c()I

    .line 117
    .line 118
    .line 119
    move-result p4

    .line 120
    invoke-static {p4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 121
    .line 122
    .line 123
    move-result-object p4

    .line 124
    :cond_8
    :try_start_0
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->array()[B

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iput-object v2, p2, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 129
    .line 130
    if-eqz p3, :cond_b

    .line 131
    .line 132
    if-eqz v5, :cond_b

    .line 133
    .line 134
    iget-object v2, p2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 135
    .line 136
    if-eqz v2, :cond_b

    .line 137
    .line 138
    :try_start_1
    invoke-virtual {v5, v0, v1, v2}, Landroid/graphics/Bitmap;->reconfigure(IILandroid/graphics/Bitmap$Config;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p1, v3}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    .line 142
    .line 143
    .line 144
    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 145
    if-eqz v0, :cond_9

    .line 146
    .line 147
    :try_start_2
    invoke-virtual {v0, p3, p2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 148
    .line 149
    .line 150
    move-result-object p3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 151
    goto :goto_3

    .line 152
    :catchall_0
    move-exception p2

    .line 153
    move-object v7, v0

    .line 154
    goto :goto_4

    .line 155
    :cond_9
    move-object p3, v7

    .line 156
    :goto_3
    if-eqz v0, :cond_c

    .line 157
    .line 158
    :try_start_3
    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 159
    .line 160
    .line 161
    goto :goto_6

    .line 162
    :catchall_1
    move-exception p1

    .line 163
    goto/16 :goto_9

    .line 164
    .line 165
    :catch_0
    move-exception p1

    .line 166
    goto :goto_7

    .line 167
    :catch_1
    move-exception p2

    .line 168
    goto :goto_8

    .line 169
    :catchall_2
    move-exception p2

    .line 170
    goto :goto_4

    .line 171
    :catch_2
    move-object v0, v7

    .line 172
    :catch_3
    :try_start_4
    sget-object v1, Ll/wnd;->f:Ljava/lang/Class;

    .line 173
    .line 174
    const-string v2, "Could not decode region %s, decoding full bitmap instead."

    .line 175
    .line 176
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    invoke-static {v1, v2, p3}, Ll/huf;->f(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 181
    .line 182
    .line 183
    if-eqz v0, :cond_b

    .line 184
    .line 185
    :try_start_5
    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 186
    .line 187
    .line 188
    goto :goto_5

    .line 189
    :goto_4
    if-eqz v7, :cond_a

    .line 190
    .line 191
    invoke-virtual {v7}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 192
    .line 193
    .line 194
    :cond_a
    throw p2

    .line 195
    :cond_b
    :goto_5
    move-object p3, v7

    .line 196
    :cond_c
    :goto_6
    if-nez p3, :cond_d

    .line 197
    .line 198
    invoke-static {p1, v7, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 199
    .line 200
    .line 201
    move-result-object p3
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 202
    :cond_d
    iget-object p1, p0, Ll/wnd;->e:Ll/nj80;

    .line 203
    .line 204
    invoke-interface {p1, p4}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    if-eqz v5, :cond_f

    .line 208
    .line 209
    if-eq v5, p3, :cond_f

    .line 210
    .line 211
    iget-object p0, p0, Ll/wnd;->a:Ll/v23;

    .line 212
    .line 213
    invoke-interface {p0, v5}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    if-eqz p3, :cond_e

    .line 217
    .line 218
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->recycle()V

    .line 219
    .line 220
    .line 221
    :cond_e
    invoke-static {}, Ll/wpg0;->a()V

    .line 222
    .line 223
    .line 224
    return-object v7

    .line 225
    :cond_f
    iget-boolean p1, p0, Ll/wnd;->c:Z

    .line 226
    .line 227
    if-eqz p1, :cond_10

    .line 228
    .line 229
    invoke-static {}, Ll/wnd$a;->a()Ll/wnd$a;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p3, p0}, Ll/fb5;->Z(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    return-object p0

    .line 238
    :cond_10
    iget-object p0, p0, Ll/wnd;->a:Ll/v23;

    .line 239
    .line 240
    invoke-static {p3, p0}, Ll/fb5;->Z(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    return-object p0

    .line 245
    :goto_7
    if-eqz v5, :cond_11

    .line 246
    .line 247
    :try_start_6
    iget-object p2, p0, Ll/wnd;->a:Ll/v23;

    .line 248
    .line 249
    invoke-interface {p2, v5}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 250
    .line 251
    .line 252
    :cond_11
    throw p1

    .line 253
    :goto_8
    if-eqz v5, :cond_12

    .line 254
    .line 255
    iget-object p3, p0, Ll/wnd;->a:Ll/v23;

    .line 256
    .line 257
    invoke-interface {p3, v5}, Ll/vi80;->release(Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 258
    .line 259
    .line 260
    :cond_12
    :try_start_7
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 261
    .line 262
    .line 263
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    if-eqz p1, :cond_13

    .line 268
    .line 269
    invoke-static {}, Ll/qof0;->a()Ll/qof0;

    .line 270
    .line 271
    .line 272
    move-result-object p3

    .line 273
    invoke-static {p1, p3}, Ll/fb5;->Z(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 274
    .line 275
    .line 276
    move-result-object p1
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 277
    iget-object p0, p0, Ll/wnd;->e:Ll/nj80;

    .line 278
    .line 279
    invoke-interface {p0, p4}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    return-object p1

    .line 283
    :cond_13
    :try_start_8
    throw p2
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 284
    :catch_4
    :try_start_9
    throw p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 285
    :goto_9
    iget-object p0, p0, Ll/wnd;->e:Ll/nj80;

    .line 286
    .line 287
    invoke-interface {p0, p4}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    throw p1
.end method

.method public abstract d(IILandroid/graphics/BitmapFactory$Options;)I
.end method
