.class public Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;
    }
.end annotation


# instance fields
.field private fileName:Ljava/lang/String;

.field private mBufferSize:I

.field protected mFileLength:J

.field protected mIsFirstRun:Z

.field private mLocalPath:Ljava/lang/String;

.field private mNetPath:Ljava/lang/String;

.field private mOnCancel:Lcom/tantanapp/media/ttmediautils/download/Action1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mOnConnect:Lcom/tantanapp/media/ttmediautils/download/Action2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mOnFail:Lcom/tantanapp/media/ttmediautils/download/Action2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private mOnLoading:Lcom/tantanapp/media/ttmediautils/download/Action2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mOnPause:Lcom/tantanapp/media/ttmediautils/download/Action2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mOnStart:Lcom/tantanapp/media/ttmediautils/download/Action1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mOnSuccess:Lcom/tantanapp/media/ttmediautils/download/Action2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private mOriginPath:Ljava/lang/String;

.field protected mPercent:I

.field protected mRetryTime:I

.field private mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

.field private mUpdateInterval:I

.field protected mUpdateTime:J

.field private mUrl:Ljava/net/URL;

.field protected mWriteLength:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateTime:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-boolean v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mIsFirstRun:Z

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    iput v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mPercent:I

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    iput v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mNetPath:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOriginPath:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mLocalPath:Ljava/lang/String;

    .line 27
    .line 28
    const/16 v1, 0x2000

    .line 29
    .line 30
    iput v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mBufferSize:I

    .line 31
    .line 32
    const/16 v1, 0x10

    .line 33
    .line 34
    iput v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateInterval:I

    .line 35
    .line 36
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NORMAL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnStart:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnConnect:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnCancel:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnLoading:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnPause:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnSuccess:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnFail:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mNetPath:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mLocalPath:Ljava/lang/String;

    .line 61
    .line 62
    iput-boolean p3, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mIsFirstRun:Z

    .line 63
    .line 64
    if-eqz p3, :cond_0

    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_0

    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/io/File;->length()J

    .line 73
    .line 74
    .line 75
    move-result-wide p1

    .line 76
    iput-wide p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 80
    iput-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateTime:J

    const/4 v2, 0x0

    .line 81
    iput-boolean v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mIsFirstRun:Z

    const/4 v2, -0x1

    .line 82
    iput v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mPercent:I

    .line 83
    iput-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 84
    iput-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    const/4 v0, 0x3

    .line 85
    iput v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    const/4 v0, 0x0

    .line 86
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mNetPath:Ljava/lang/String;

    .line 87
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOriginPath:Ljava/lang/String;

    .line 88
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mLocalPath:Ljava/lang/String;

    const/16 v1, 0x2000

    .line 89
    iput v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mBufferSize:I

    const/16 v1, 0x10

    .line 90
    iput v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateInterval:I

    .line 91
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NORMAL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    iput-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 92
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnStart:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 93
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnConnect:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 94
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnCancel:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 95
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnLoading:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 96
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnPause:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 97
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnSuccess:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 98
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnFail:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 99
    invoke-direct {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isDownLoadApkPath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    invoke-direct {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getDownLoadApkPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mNetPath:Ljava/lang/String;

    goto :goto_0

    .line 101
    :cond_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mNetPath:Ljava/lang/String;

    .line 102
    :goto_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOriginPath:Ljava/lang/String;

    .line 103
    iput-object p2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mLocalPath:Ljava/lang/String;

    return-void
.end method

.method private getDownLoadApkPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->fileName:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "UTF-8"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-object p1
.end method

.method private isDownLoadApkPath(Ljava/lang/String;)Z
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUrl:Ljava/net/URL;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 v0, 0x2f

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    add-int/2addr v0, v1

    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->fileName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, ".apk"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p0
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 3
    .line 4
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->CANCEL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 5
    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    iput-object v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onCancel()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onDestroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public getBufferSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mBufferSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getLocalPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mLocalPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNetPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mNetPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriginPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOriginPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPercent()I
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-lez v2, :cond_2

    .line 9
    .line 10
    iget-wide v4, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 11
    .line 12
    long-to-float p0, v4

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    mul-float/2addr p0, v2

    .line 16
    const/high16 v2, 0x42c80000    # 100.0f

    .line 17
    .line 18
    mul-float/2addr p0, v2

    .line 19
    long-to-float v0, v0

    .line 20
    div-float/2addr p0, v0

    .line 21
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-gez p0, :cond_0

    .line 26
    .line 27
    return v3

    .line 28
    :cond_0
    const/16 v0, 0x64

    .line 29
    .line 30
    if-le p0, v0, :cond_1

    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    return p0

    .line 34
    :cond_2
    return v3
.end method

.method public isCancel()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->CANCEL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isNeedPause()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NEED_PAUSE:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isNeedResume()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NEED_RESUME:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isPaused()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 2
    .line 3
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->PAUSED:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public declared-synchronized needPause()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 3
    .line 4
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NORMAL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NEED_PAUSE:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public declared-synchronized needResume()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 3
    .line 4
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->PAUSED:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NEED_RESUME:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public declared-synchronized onCancel(Lcom/tantanapp/media/ttmediautils/download/Action1;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 16
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnCancel:Lcom/tantanapp/media/ttmediautils/download/Action1;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onCancel()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnCancel:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, p0}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public declared-synchronized onConnect(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 16
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnConnect:Lcom/tantanapp/media/ttmediautils/download/Action2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onConnect(Ljava/lang/String;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnConnect:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action2;->call(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized onDestroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnStart:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnConnect:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnCancel:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnLoading:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnPause:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnSuccess:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnFail:Lcom/tantanapp/media/ttmediautils/download/Action2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method public declared-synchronized onFail(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 16
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnFail:Lcom/tantanapp/media/ttmediautils/download/Action2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onFail(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnFail:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action2;->call(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized onLoading(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 20
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnLoading:Lcom/tantanapp/media/ttmediautils/download/Action2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onLoading(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnLoading:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action2;->call(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw p1
.end method

.method public declared-synchronized onPause(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 36
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnPause:Lcom/tantanapp/media/ttmediautils/download/Action2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onPause(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 3
    .line 4
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->CANCEL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 5
    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->PAUSED:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    sget-object v0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->NORMAL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 24
    .line 25
    :goto_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnPause:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action2;->call(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    :cond_1
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p1
.end method

.method public declared-synchronized onStart(Lcom/tantanapp/media/ttmediautils/download/Action1;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 16
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnStart:Lcom/tantanapp/media/ttmediautils/download/Action1;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onStart()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnStart:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, p0}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw v0
.end method

.method public declared-synchronized onSuccess(Lcom/tantanapp/media/ttmediautils/download/Action2;)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;",
            "Ljava/io/File;",
            ">;)",
            "Lcom/tantanapp/media/ttmediautils/download/DownloadTask;"
        }
    .end annotation

    monitor-enter p0

    .line 16
    :try_start_0
    iput-object p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnSuccess:Lcom/tantanapp/media/ttmediautils/download/Action2;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    monitor-exit p0

    return-object p0

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized onSuccess(Ljava/io/File;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mOnSuccess:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action2;->call(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public run()V
    .locals 2

    .line 1
    :goto_0
    iget v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mState:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 6
    .line 7
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->CANCEL:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v1, Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;->PAUSED:Lcom/tantanapp/media/ttmediautils/download/DownloadTask$State;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/download/HttpUtil;->downloadFile(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public setBufferSize(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mBufferSize:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setUpdateInterval(I)Lcom/tantanapp/media/ttmediautils/download/DownloadTask;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateInterval:I

    .line 2
    .line 3
    return-object p0
.end method

.method public updatePercent()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-ltz v0, :cond_1

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateTime:J

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iget-wide v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateTime:J

    .line 26
    .line 27
    sub-long/2addr v0, v2

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iget v2, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateInterval:I

    .line 33
    .line 34
    int-to-long v2, v2

    .line 35
    cmp-long v0, v0, v2

    .line 36
    .line 37
    if-lez v0, :cond_1

    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getPercent()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mPercent:I

    .line 44
    .line 45
    if-eq v1, v0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    iput-wide v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateTime:J

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onLoading(I)V

    .line 54
    .line 55
    .line 56
    iput v0, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mPercent:I

    .line 57
    .line 58
    :cond_1
    return-void
.end method
