.class public Lcom/cosmos/photon/push/image/ImageLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/image/ImageLoader$Builder;
    }
.end annotation


# instance fields
.field private final diskCache:Lcom/cosmos/photon/push/image/BitmapDiskCache;

.field private final downloader:Lcom/cosmos/photon/push/image/HttpDownloader;

.field private final memCache:Lcom/cosmos/photon/push/image/BitmapMemCache;


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/cosmos/photon/push/image/BitmapMemCache;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->access$000(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    long-to-int v1, v1

    .line 11
    invoke-direct {v0, v1}, Lcom/cosmos/photon/push/image/BitmapMemCache;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/cosmos/photon/push/image/ImageLoader;->memCache:Lcom/cosmos/photon/push/image/BitmapMemCache;

    .line 15
    .line 16
    new-instance v0, Lcom/cosmos/photon/push/image/BitmapDiskCache;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->access$100(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)Ljava/io/File;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {p1}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->access$200(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-direct {v0, v1, v2, v3}, Lcom/cosmos/photon/push/image/BitmapDiskCache;-><init>(Ljava/io/File;J)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/cosmos/photon/push/image/ImageLoader;->diskCache:Lcom/cosmos/photon/push/image/BitmapDiskCache;

    .line 30
    .line 31
    new-instance p1, Lcom/cosmos/photon/push/image/HttpDownloader;

    .line 32
    .line 33
    invoke-direct {p1}, Lcom/cosmos/photon/push/image/HttpDownloader;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/cosmos/photon/push/image/ImageLoader;->downloader:Lcom/cosmos/photon/push/image/HttpDownloader;

    .line 37
    .line 38
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/image/ImageLoader$Builder;Lcom/cosmos/photon/push/image/ImageLoader$1;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/image/ImageLoader;-><init>(Lcom/cosmos/photon/push/image/ImageLoader$Builder;)V

    return-void
.end method


# virtual methods
.method public clearMemCache()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/ImageLoader;->memCache:Lcom/cosmos/photon/push/image/BitmapMemCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/cosmos/photon/push/image/BitmapMemCache;->clearCache()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public syncLoadBitmap(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/cosmos/photon/push/util/MD5Utils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/cosmos/photon/push/image/ImageLoader;->memCache:Lcom/cosmos/photon/push/image/BitmapMemCache;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/image/BitmapMemCache;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/cosmos/photon/push/image/ImageLoader;->diskCache:Lcom/cosmos/photon/push/image/BitmapDiskCache;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/image/BitmapDiskCache;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/cosmos/photon/push/image/ImageLoader;->memCache:Lcom/cosmos/photon/push/image/BitmapMemCache;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/cosmos/photon/push/image/BitmapMemCache;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 31
    .line 32
    .line 33
    :try_start_0
    iget-object v2, p0, Lcom/cosmos/photon/push/image/ImageLoader;->downloader:Lcom/cosmos/photon/push/image/HttpDownloader;

    .line 34
    .line 35
    invoke-virtual {v2, p1, v1}, Lcom/cosmos/photon/push/image/HttpDownloader;->downloadUrlToStream(Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ljava/io/ByteArrayInputStream;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {p1, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1, p2, p3}, Lcom/cosmos/photon/push/image/BitmapUtil;->scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p2, p0, Lcom/cosmos/photon/push/image/ImageLoader;->memCache:Lcom/cosmos/photon/push/image/BitmapMemCache;

    .line 56
    .line 57
    invoke-virtual {p2, v0, p1}, Lcom/cosmos/photon/push/image/BitmapMemCache;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/cosmos/photon/push/image/ImageLoader;->diskCache:Lcom/cosmos/photon/push/image/BitmapDiskCache;

    .line 61
    .line 62
    invoke-virtual {p0, v0, p1}, Lcom/cosmos/photon/push/image/BitmapDiskCache;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-object p1

    .line 66
    :catch_0
    move-exception p0

    .line 67
    const-string p1, "MoPush-IMAGE"

    .line 68
    .line 69
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method
