.class public Lcom/cosmos/photon/push/image/BitmapDiskCache;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private diskCache:Lcom/cosmos/photon/push/image/DiskLruCache;


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    :try_start_0
    invoke-static {p1, v0, v1, p2, p3}, Lcom/cosmos/photon/push/image/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/cosmos/photon/push/image/BitmapDiskCache;->diskCache:Lcom/cosmos/photon/push/image/DiskLruCache;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    const-string p1, "MoPush-IMAGE"

    .line 15
    .line 16
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/cosmos/photon/push/image/BitmapDiskCache;->diskCache:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache;->get(Ljava/lang/String;)Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    move-object v0, p0

    .line 26
    goto :goto_4

    .line 27
    :catch_0
    move-exception p1

    .line 28
    goto :goto_2

    .line 29
    :cond_0
    :goto_0
    if-eqz p0, :cond_1

    .line 30
    .line 31
    :goto_1
    :try_start_2
    invoke-virtual {p0}, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 32
    .line 33
    .line 34
    goto :goto_3

    .line 35
    :catchall_1
    move-exception p1

    .line 36
    goto :goto_4

    .line 37
    :catch_1
    move-exception p1

    .line 38
    move-object p0, v0

    .line 39
    :goto_2
    :try_start_3
    const-string v1, "MoPush-IMAGE"

    .line 40
    .line 41
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 42
    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catch_2
    :cond_1
    :goto_3
    return-object v0

    .line 48
    :goto_4
    if-eqz v0, :cond_2

    .line 49
    .line 50
    :try_start_4
    invoke-virtual {v0}, Lcom/cosmos/photon/push/image/DiskLruCache$Snapshot;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 51
    .line 52
    .line 53
    :catch_3
    :cond_2
    throw p1

    .line 54
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method

.method public putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/push/image/BitmapDiskCache;->diskCache:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache;->edit(Ljava/lang/String;)Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 17
    .line 18
    const/16 v2, 0x64

    .line 19
    .line 20
    invoke-virtual {p2, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->commit()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/cosmos/photon/push/image/BitmapDiskCache;->diskCache:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/cosmos/photon/push/image/DiskLruCache;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    const-string p1, "MoPush-IMAGE"

    .line 34
    .line 35
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
