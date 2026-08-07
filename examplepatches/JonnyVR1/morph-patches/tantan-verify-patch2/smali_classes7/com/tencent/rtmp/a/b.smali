.class public Lcom/tencent/rtmp/a/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/rtmp/a/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/a/b$b;,
        Lcom/tencent/rtmp/a/b$a;
    }
.end annotation


# instance fields
.field private final a:Landroid/graphics/BitmapFactory$Options;

.field private b:Landroid/os/HandlerThread;

.field private c:Landroid/os/Handler;

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/rtmp/a/c;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/BitmapRegionDecoder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->a:Landroid/graphics/BitmapFactory$Options;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 23
    .line 24
    new-instance v0, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->e:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->e:Ljava/util/Map;

    .line 36
    .line 37
    return-void
.end method

.method private a(IIF)Lcom/tencent/rtmp/a/c;
    .locals 2

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    add-int/2addr v0, p1

    .line 6
    iget-object v1, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/tencent/rtmp/a/c;

    .line 13
    .line 14
    iget v1, v1, Lcom/tencent/rtmp/a/c;->a:F

    .line 15
    .line 16
    cmpg-float v1, v1, p3

    .line 17
    .line 18
    if-gtz v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/tencent/rtmp/a/c;

    .line 27
    .line 28
    iget v1, v1, Lcom/tencent/rtmp/a/c;->b:F

    .line 29
    .line 30
    cmpl-float v1, v1, p3

    .line 31
    .line 32
    if-lez v1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/tencent/rtmp/a/c;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 44
    .line 45
    if-lt p1, p2, :cond_1

    .line 46
    .line 47
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/tencent/rtmp/a/c;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_1
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/tencent/rtmp/a/c;

    .line 59
    .line 60
    iget v1, v1, Lcom/tencent/rtmp/a/c;->b:F

    .line 61
    .line 62
    cmpl-float v1, p3, v1

    .line 63
    .line 64
    if-ltz v1, :cond_2

    .line 65
    .line 66
    add-int/lit8 v0, v0, 0x1

    .line 67
    .line 68
    invoke-direct {p0, v0, p2, p3}, Lcom/tencent/rtmp/a/b;->a(IIF)Lcom/tencent/rtmp/a/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_2
    iget-object p2, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Lcom/tencent/rtmp/a/c;

    .line 80
    .line 81
    iget p2, p2, Lcom/tencent/rtmp/a/c;->a:F

    .line 82
    .line 83
    cmpg-float p2, p3, p2

    .line 84
    .line 85
    if-gez p2, :cond_3

    .line 86
    .line 87
    add-int/lit8 v0, v0, -0x1

    .line 88
    .line 89
    invoke-direct {p0, p1, v0, p3}, Lcom/tencent/rtmp/a/b;->a(IIF)Lcom/tencent/rtmp/a/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0

    .line 94
    :cond_3
    const/4 p0, 0x0

    .line 95
    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a/b;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-direct {p0, p1}, Lcom/tencent/rtmp/a/b;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method private a(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    new-instance p0, Ljava/net/URL;

    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    .line 104
    invoke-virtual {p0}, Ljava/net/URLConnection;->connect()V

    .line 105
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    const/16 p1, 0x3a98

    .line 106
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 107
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 108
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/rtmp/a/b;)Ljava/util/List;
    .locals 0

    .line 96
    iget-object p0, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    return-object p0
.end method

.method private a()V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->b:Landroid/os/HandlerThread;

    if-nez v0, :cond_0

    .line 99
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "SuperVodThumbnailsWorkThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->b:Landroid/os/HandlerThread;

    .line 100
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 101
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/tencent/rtmp/a/b;->b:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/tencent/rtmp/a/b;)Ljava/util/Map;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/tencent/rtmp/a/b;->e:Ljava/util/Map;

    return-object p0
.end method

.method private b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "TXImageSprite"

    .line 6
    .line 7
    const-string v1, " remove all tasks!"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 19
    .line 20
    new-instance v1, Lcom/tencent/rtmp/a/b$1;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/tencent/rtmp/a/b$1;-><init>(Lcom/tencent/rtmp/a/b;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/tencent/rtmp/a/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/rtmp/a/b;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getThumbnail(F)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {p0, v2, v0, p1}, Lcom/tencent/rtmp/a/b;->a(IIF)Lcom/tencent/rtmp/a/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_1
    iget-object v0, p1, Lcom/tencent/rtmp/a/c;->d:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/tencent/rtmp/a/b;->e:Ljava/util/Map;

    .line 30
    .line 31
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/graphics/BitmapRegionDecoder;

    .line 36
    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_2
    new-instance v1, Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 43
    .line 44
    .line 45
    iget v2, p1, Lcom/tencent/rtmp/a/c;->e:I

    .line 46
    .line 47
    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    iget v3, p1, Lcom/tencent/rtmp/a/c;->f:I

    .line 50
    .line 51
    iput v3, v1, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    iget v4, p1, Lcom/tencent/rtmp/a/c;->g:I

    .line 54
    .line 55
    add-int/2addr v2, v4

    .line 56
    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    iget p1, p1, Lcom/tencent/rtmp/a/c;->h:I

    .line 59
    .line 60
    add-int/2addr v3, p1

    .line 61
    iput v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    iget-object p0, p0, Lcom/tencent/rtmp/a/b;->a:Landroid/graphics/BitmapFactory$Options;

    .line 64
    .line 65
    invoke-virtual {v0, v1, p0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/rtmp/a/b;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->b:Landroid/os/HandlerThread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/rtmp/a/b;->b:Landroid/os/HandlerThread;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setVTTUrlAndImageUrls(Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "TXImageSprite"

    .line 8
    .line 9
    const-string p1, "setVTTUrlAndImageUrls: vttUrl can\'t be null!"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/tencent/rtmp/a/b;->b()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/tencent/rtmp/a/b;->a()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v1, Lcom/tencent/rtmp/a/b$a;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Lcom/tencent/rtmp/a/b$a;-><init>(Lcom/tencent/rtmp/a/b;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/lang/String;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/tencent/rtmp/a/b;->c:Landroid/os/Handler;

    .line 56
    .line 57
    new-instance v2, Lcom/tencent/rtmp/a/b$b;

    .line 58
    .line 59
    invoke-direct {v2, p0, p1, v0}, Lcom/tencent/rtmp/a/b$b;-><init>(Lcom/tencent/rtmp/a/b;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return-void
.end method
