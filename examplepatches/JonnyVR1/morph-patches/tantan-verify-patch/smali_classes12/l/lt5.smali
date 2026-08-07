.class public Ll/lt5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lt5$c;
    }
.end annotation


# instance fields
.field private a:Lcom/idv/identity/ocr/compress/CompressConfig;

.field private b:Landroid/content/Context;

.field c:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/idv/identity/ocr/compress/CompressConfig;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lt5;->c:Landroid/os/Handler;

    .line 10
    .line 11
    iput-object p1, p0, Ll/lt5;->b:Landroid/content/Context;

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/idv/identity/ocr/compress/CompressConfig;->ofDefaultConfig()Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :cond_0
    iput-object p2, p0, Ll/lt5;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/lt5;)Lcom/idv/identity/ocr/compress/CompressConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lt5;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/lt5;Ljava/io/File;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lt5;->g(Ljava/io/File;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/lt5;ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/lt5;->h(ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e(Ljava/lang/String;Ll/lt5$c;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const-string v1, "\u8981\u538b\u7f29\u7684\u6587\u4ef6\u4e0d\u5b58\u5728"

    .line 5
    .line 6
    invoke-direct {p0, v0, p1, v1, p2}, Ll/lt5;->h(ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 17
    .line 18
    invoke-static {p1, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 22
    .line 23
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 24
    .line 25
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 26
    .line 27
    iget-object v4, p0, Ll/lt5;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 28
    .line 29
    invoke-virtual {v4}, Lcom/idv/identity/ocr/compress/CompressConfig;->getMaxPixel()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    int-to-float v4, v4

    .line 34
    if-lt v0, v3, :cond_1

    .line 35
    .line 36
    int-to-float v5, v0

    .line 37
    cmpl-float v5, v5, v4

    .line 38
    .line 39
    if-lez v5, :cond_1

    .line 40
    .line 41
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 42
    .line 43
    :goto_0
    int-to-float v0, v0

    .line 44
    div-float/2addr v0, v4

    .line 45
    float-to-int v0, v0

    .line 46
    add-int/2addr v0, v2

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    if-ge v0, v3, :cond_2

    .line 49
    .line 50
    int-to-float v0, v3

    .line 51
    cmpl-float v0, v0, v4

    .line 52
    .line 53
    if-lez v0, :cond_2

    .line 54
    .line 55
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v0, v2

    .line 59
    :goto_1
    iput v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 60
    .line 61
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 62
    .line 63
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 64
    .line 65
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 66
    .line 67
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 68
    .line 69
    invoke-static {p1, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p0, Ll/lt5;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/idv/identity/ocr/compress/CompressConfig;->isEnableQualityCompress()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    invoke-direct {p0, v0, p1, p2}, Ll/lt5;->f(Landroid/graphics/Bitmap;Ljava/lang/String;Ll/lt5$c;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    new-instance v1, Ljava/io/File;

    .line 86
    .line 87
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-direct {p0, v1}, Ll/lt5;->g(Ljava/io/File;)Ljava/io/File;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 95
    .line 96
    new-instance v1, Ljava/io/FileOutputStream;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 99
    .line 100
    .line 101
    const/16 v2, 0x64

    .line 102
    .line 103
    invoke-virtual {v0, p1, v2, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p2, p0}, Ll/lt5$c;->b(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method private f(Landroid/graphics/Bitmap;Ljava/lang/String;Ll/lt5$c;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const-string v0, "\u50cf\u7d20\u538b\u7f29\u5931\u8d25,bitmap is null"

    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v0, p3}, Ll/lt5;->h(ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    .line 11
    .line 12
    new-instance v1, Ll/lt5$a;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1, p2, p3}, Ll/lt5$a;-><init>(Ll/lt5;Landroid/graphics/Bitmap;Ljava/lang/String;Ll/lt5$c;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private g(Ljava/io/File;)Ljava/io/File;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/lt5;->b:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/ksh0;->b(Landroid/content/Context;Ljava/io/File;)Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    return-object p1
.end method

.method private h(ZLjava/lang/String;Ljava/lang/String;Ll/lt5$c;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/lt5;->c:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/lt5$b;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move v3, p1

    .line 7
    move-object v5, p2

    .line 8
    move-object v6, p3

    .line 9
    move-object v4, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/lt5$b;-><init>(Ll/lt5;ZLl/lt5$c;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public d(Ljava/lang/String;Ll/lt5$c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lt5;->a:Lcom/idv/identity/ocr/compress/CompressConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/ocr/compress/CompressConfig;->isEnablePixelCompress()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-direct {p0, p1, p2}, Ll/lt5;->e(Ljava/lang/String;Ll/lt5$c;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "\u56fe\u7247\u538b\u7f29\u5931\u8d25,%s"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {p2, p1, v0}, Ll/lt5$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p0, v0, p1, p2}, Ll/lt5;->f(Landroid/graphics/Bitmap;Ljava/lang/String;Ll/lt5$c;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
