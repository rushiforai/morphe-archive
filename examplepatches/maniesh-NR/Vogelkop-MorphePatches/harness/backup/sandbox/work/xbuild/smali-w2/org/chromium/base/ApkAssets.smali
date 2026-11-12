.class public final Lorg/chromium/base/ApkAssets;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String;


# direct methods
.method public static open(Ljava/lang/String;Ljava/lang/String;)[J
    .registers 13

    const-string v0, "Error while loading asset "

    const/4 v1, 0x0

    sput-object v1, Lorg/chromium/base/ApkAssets;->a:Ljava/lang/String;

    const/4 v2, 0x3

    :try_start_6
    sget-object v3, Lt8;->a:Landroid/content/Context;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_18

    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->d(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_18

    invoke-static {p1}, Lorg/chromium/base/BundleUtils;->a(Ljava/lang/String;)Landroid/content/Context;

    move-result-object v3

    :cond_18
    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/content/res/AssetManager;->openNonAssetFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v5

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v7

    new-array v9, v2, [J

    const/4 v10, 0x0

    aput-wide v3, v9, v10

    const/4 v3, 0x1

    aput-wide v5, v9, v3

    const/4 v3, 0x2

    aput-wide v7, v9, v3
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_3c} :catch_40
    .catchall {:try_start_6 .. :try_end_3c} :catchall_7f

    :try_start_3c
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3f} :catch_3f

    :catch_3f
    return-object v9

    :catch_40
    move-exception v3

    :try_start_41
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " from "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lorg/chromium/base/ApkAssets;->a:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_74

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    :cond_74
    new-array p0, v2, [J

    fill-array-data p0, :array_86
    :try_end_79
    .catchall {:try_start_41 .. :try_end_79} :catchall_7f

    if-eqz v1, :cond_7e

    :try_start_7b
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_7e
    .catch Ljava/io/IOException; {:try_start_7b .. :try_end_7e} :catch_7e

    :catch_7e
    :cond_7e
    return-object p0

    :catchall_7f
    move-exception p0

    if-eqz v1, :cond_85

    :try_start_82
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_82 .. :try_end_85} :catch_85

    :catch_85
    :cond_85
    throw p0

    :array_86
    .array-data 8
        -0x1
        -0x1
        -0x1
    .end array-data
.end method

.method public static takeLastErrorString()Ljava/lang/String;
    .registers 2

    sget-object v0, Lorg/chromium/base/ApkAssets;->a:Ljava/lang/String;

    const/4 v1, 0x0

    sput-object v1, Lorg/chromium/base/ApkAssets;->a:Ljava/lang/String;

    return-object v0
.end method
