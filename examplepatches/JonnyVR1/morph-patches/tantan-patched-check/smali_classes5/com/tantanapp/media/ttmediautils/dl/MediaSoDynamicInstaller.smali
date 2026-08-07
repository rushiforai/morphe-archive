.class public Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;,
        Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoMd5;,
        Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoList;,
        Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;,
        Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;,
        Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;
    }
.end annotation


# instance fields
.field private mContext:Landroid/app/Application;

.field private mJsonParser:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

.field private mSDKHashPath:Ljava/io/File;

.field private mSDKMd5:Ljava/lang/String;

.field private mSDKRootPath:Ljava/io/File;

.field private mSDKSoMd5Path:Ljava/lang/String;

.field private mSDKUrl:Ljava/lang/String;

.field private mSDKZipPath:Ljava/io/File;

.field private mSoPathInZipArmv7a:Ljava/lang/String;

.field private mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;


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

.method public static synthetic a(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-direct {p0, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onDownloading(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/RuntimeException;

    .line 5
    .line 6
    const-string v0, "downloadAndInstall zip canceled"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/16 v0, 0x7d1

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onFailure(ILjava/lang/Exception;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Ljava/io/File;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->checkHash(Ljava/io/File;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-static {p3}, Lcom/tantanapp/media/ttmediautils/tinker/SharePatchFileUtil;->safeDeleteFile(Ljava/io/File;)Z

    .line 8
    .line 9
    .line 10
    new-instance p1, Ljava/io/IOException;

    .line 11
    .line 12
    const-string p2, "Download wrong file"

    .line 13
    .line 14
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/16 p2, 0x3ea

    .line 18
    .line 19
    invoke-direct {p0, p2, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onFailure(ILjava/lang/Exception;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p3, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-direct {p0, p2, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->clearOldSdks(Ljava/io/File;Ljava/io/File;)V

    .line 38
    .line 39
    .line 40
    new-instance p2, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;

    .line 41
    .line 42
    const/4 p3, 0x1

    .line 43
    invoke-direct {p2, p1, p3}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;-><init>(Ljava/io/File;Z)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, p2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->unzip(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->installLibs(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onSuccess()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    new-instance p1, Ljava/io/IOException;

    .line 57
    .line 58
    const-string p2, "rename failed"

    .line 59
    .line 60
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/16 p2, 0x3eb

    .line 64
    .line 65
    invoke-direct {p0, p2, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onFailure(ILjava/lang/Exception;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private checkHash(Ljava/io/File;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKMd5:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/common/MD5Utils;->getFileMD5(Ljava/io/File;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private clearOldSdks(Ljava/io/File;Ljava/io/File;)V
    .locals 5
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    array-length v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_1

    .line 8
    .line 9
    aget-object v2, p1, v1

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    :try_start_0
    invoke-static {v2}, Lcom/tantanapp/media/ttmediautils/common/FileUtils;->forceDelete(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :catch_0
    move-exception v2

    .line 30
    invoke-static {v2}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    const/16 v3, 0x3ed

    .line 34
    .line 35
    invoke-direct {p0, v3, v2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onEvent(ILjava/lang/Exception;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public static synthetic d(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Lcom/tantanapp/media/ttmediautils/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Exception;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    const/16 p2, 0x3ec

    .line 10
    .line 11
    invoke-direct {p0, p2, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onFailure(ILjava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private downloadAndInstall(Ljava/io/File;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKRootPath:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->ensureDirectory(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/io/File;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v2, ".temp"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKUrl:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-direct {v1, v2, v0, v3}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;-><init>(Ljava/lang/String;Ljava/io/File;Z)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/v5y;

    .line 41
    .line 42
    invoke-direct {v0, p0, p1}, Ll/v5y;-><init>(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;Ljava/io/File;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onSuccess(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Ll/w5y;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/w5y;-><init>(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onLoading(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/x5y;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/x5y;-><init>(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onFail(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance v0, Ll/y5y;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/y5y;-><init>(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onCancel(Lcom/tantanapp/media/ttmediautils/download/Action1;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->getInstance()Lcom/tantanapp/media/ttmediautils/download/DownloadManager;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1, p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadManager;->download(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :catch_0
    move-exception p1

    .line 85
    const/16 v0, 0x3e9

    .line 86
    .line 87
    invoke-direct {p0, v0, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->onFailure(ILjava/lang/Exception;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private installLibs(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->needUnzip:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->rootFolder:Ljava/io/File;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->checkSoMd5(Ljava/io/File;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "so file is illegal"

    .line 15
    .line 16
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    new-instance v0, Ljava/io/File;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->rootFolder:Ljava/io/File;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSoPathInZipArmv7a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->isFileDirNotEmpty(Ljava/io/File;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mContext:Landroid/app/Application;

    .line 36
    .line 37
    invoke-static {p0, v0}, Lcom/tantanapp/media/ttmediautils/tinker/TinkerLoadLibrary;->installNativeLibraryABIWithoutTinkerInstalled(Landroid/app/Application;Ljava/io/File;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    const-string p0, "TinkerLoadLibrary load fail."

    .line 45
    .line 46
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    const-string p0, "soFolder is empty."

    .line 51
    .line 52
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static isFileDirNotEmpty(Ljava/io/File;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    array-length p0, p0

    .line 22
    if-lez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method private onDownloading(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;->onDownloading(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private onEvent(ILjava/lang/Exception;)V
    .locals 0
    .param p2    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;->onEvent(ILjava/lang/Exception;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private onFailure(ILjava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKHashPath:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/tinker/SharePatchFileUtil;->deleteDir(Ljava/io/File;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;->onFailure(ILjava/lang/Exception;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method private onSuccess()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;->onSuccess()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private unzip(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;)V
    .locals 1
    .param p1    # Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->needUnzip:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKHashPath:Ljava/io/File;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->ensureDirectory(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object p0, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->zipFile:Ljava/io/File;

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/tantanapp/media/ttmediautils/common/FileUtils;->decompress(Ljava/io/File;Ljava/io/File;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->rootFolder:Ljava/io/File;

    .line 17
    .line 18
    iget-object p0, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->zipFile:Ljava/io/File;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/tinker/SharePatchFileUtil;->safeDeleteFile(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    iget-object p1, p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;->zipFile:Ljava/io/File;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/tinker/SharePatchFileUtil;->safeDeleteFile(Ljava/io/File;)Z

    .line 28
    .line 29
    .line 30
    const-string p1, "unzip fail:"

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p1, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public checkSoMd5(Ljava/io/File;)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKSoMd5Path:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/common/FileUtils;->readString(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mJsonParser:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

    .line 17
    .line 18
    const-class v2, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoList;

    .line 19
    .line 20
    invoke-interface {v1, v0, v2}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoList;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    iget-object v2, v0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoList;->list:Ljava/util/ArrayList;

    .line 30
    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v2, Ljava/io/File;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSoPathInZipArmv7a:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {v2, p1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, v0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoList;->list:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoMd5;

    .line 58
    .line 59
    new-instance v0, Ljava/io/File;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoMd5;->getName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SoMd5;->getMd5()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/common/MD5Utils;->getFileMD5(Ljava/io/File;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_1

    .line 87
    .line 88
    :cond_2
    return v1

    .line 89
    :cond_3
    const/4 p0, 0x1

    .line 90
    return p0

    .line 91
    :cond_4
    :goto_0
    return v1
.end method

.method public clearStatusListener()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;

    .line 3
    .line 4
    return-void
.end method

.method public ensureDirectory(Ljava/io/File;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const-string v0, "mkdirs fail : "

    .line 9
    .line 10
    if-nez p0, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_5

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v0, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    const-string p0, "delete file fail : "

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p0, p1}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_5
    :goto_0
    return-void
.end method

.method public installPreDownloadedSo()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKHashPath:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->isAllSoExists(Ljava/io/File;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iget-object v3, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKHashPath:Ljava/io/File;

    .line 14
    .line 15
    invoke-direct {v0, v2, v3, v1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;-><init>(Ljava/io/File;Ljava/io/File;Z)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->installLibs(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$Entity;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    return v1
.end method

.method public isAllSoExists(Ljava/io/File;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->checkSoMd5(Ljava/io/File;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public loadLibs(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->access$000(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSoPathInZipArmv7a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->access$100(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->access$200(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKMd5:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->access$300(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKSoMd5Path:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->getSoSaveRootDir()Ljava/io/File;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKRootPath:Ljava/io/File;

    .line 30
    .line 31
    new-instance v0, Ljava/io/File;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKRootPath:Ljava/io/File;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKUrl:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2}, Lcom/tantanapp/media/ttmediautils/common/MD5Utils;->digest(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKHashPath:Ljava/io/File;

    .line 45
    .line 46
    new-instance v0, Ljava/io/File;

    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKHashPath:Ljava/io/File;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v2, ".zip"

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKZipPath:Ljava/io/File;

    .line 75
    .line 76
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->access$400(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Landroid/app/Application;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mContext:Landroid/app/Application;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;->access$500(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitConfig;)Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mJsonParser:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$JsonParser;

    .line 87
    .line 88
    iget-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mSDKZipPath:Ljava/io/File;

    .line 89
    .line 90
    invoke-direct {p0, p1}, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->downloadAndInstall(Ljava/io/File;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public setStatusListener(Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;->mStatusListener:Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;

    .line 4
    .line 5
    :cond_0
    return-void
.end method
