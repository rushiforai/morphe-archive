.class public Lcom/momo/x264/x264sdk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/x264/x264sdk$listener;
    }
.end annotation


# static fields
.field private static volatile mIsLibLoaded:Z


# instance fields
.field private _listener:Lcom/momo/x264/x264sdk$listener;

.field private volatile isRelease:Z

.field private mNativeContext:J

.field private mVideobuffer:Ljava/nio/ByteBuffer;

.field private object:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/momo/x264/x264sdk$listener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/x264/x264sdk;->isRelease:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/x264/x264sdk;->object:Ljava/lang/Object;

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/momo/x264/x264sdk;->mNativeContext:J

    .line 17
    .line 18
    invoke-static {}, Lcom/momo/x264/x264sdk;->loadLibrariesOnce()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/momo/x264/x264sdk;->_listener:Lcom/momo/x264/x264sdk$listener;

    .line 22
    .line 23
    return-void
.end method

.method private native CloseX264Encode()V
.end method

.method private native GenX264Sei([B)[B
.end method

.method private H264DataCallBackFunc(Ljava/lang/Object;[BI)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    check-cast p1, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/momo/x264/x264sdk;

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object p0, p0, Lcom/momo/x264/x264sdk;->_listener:Lcom/momo/x264/x264sdk$listener;

    .line 16
    .line 17
    invoke-interface {p0, p2, p3}, Lcom/momo/x264/x264sdk$listener;->h264data([BI)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private native encoderH264(IJ)I
.end method

.method private native initX264Encode(IIIILjava/lang/Object;)V
.end method

.method private static loadLibrariesOnce()V
    .locals 3

    .line 1
    const-class v0, Lcom/momo/x264/x264sdk;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/momo/x264/x264sdk;->mIsLibLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :try_start_1
    const-string v2, "x264encoder"

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    sput-boolean v2, Lcom/momo/x264/x264sdk;->mIsLibLoaded:Z
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    :try_start_2
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    goto :goto_1

    .line 21
    :catch_0
    sput-boolean v1, Lcom/momo/x264/x264sdk;->mIsLibLoaded:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catch_1
    sput-boolean v1, Lcom/momo/x264/x264sdk;->mIsLibLoaded:Z

    .line 25
    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    throw v1
.end method


# virtual methods
.method public GenSEI([BI)[B
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/momo/x264/x264sdk;->object:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p2

    .line 4
    :try_start_0
    sget-boolean v0, Lcom/momo/x264/x264sdk;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/momo/x264/x264sdk;->GenX264Sei([B)[B

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    monitor-exit p2

    .line 13
    return-object p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    monitor-exit p2

    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :goto_0
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public PushOriStream([BIJ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/x264/x264sdk;->object:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/x264/x264sdk;->isRelease:Z

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/momo/x264/x264sdk;->mVideobuffer:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge v1, p2, :cond_2

    .line 22
    .line 23
    :cond_1
    div-int/lit16 v1, p2, 0x400

    .line 24
    .line 25
    add-int/2addr v1, v2

    .line 26
    mul-int/lit16 v1, v1, 0x400

    .line 27
    .line 28
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/momo/x264/x264sdk;->mVideobuffer:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    :cond_2
    iget-object v1, p0, Lcom/momo/x264/x264sdk;->mVideobuffer:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/x264/x264sdk;->mVideobuffer:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, p1, v2, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    invoke-direct {p0, p2, p3, p4}, Lcom/momo/x264/x264sdk;->encoderH264(IJ)I

    .line 46
    .line 47
    .line 48
    monitor-exit v0

    .line 49
    return-void

    .line 50
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method

.method public getEnabled()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/momo/x264/x264sdk;->mIsLibLoaded:Z

    .line 2
    .line 3
    return p0
.end method

.method public initEncode(IIII)V
    .locals 8

    .line 1
    iget-object v1, p0, Lcom/momo/x264/x264sdk;->object:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    new-instance v7, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v7, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move v3, p1

    .line 11
    move v4, p2

    .line 12
    move v5, p3

    .line 13
    move v6, p4

    .line 14
    invoke-direct/range {v2 .. v7}, Lcom/momo/x264/x264sdk;->initX264Encode(IIIILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    move-object p0, v0

    .line 20
    goto :goto_1

    .line 21
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/x264/x264sdk;->object:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/x264/x264sdk;->isRelease:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/momo/x264/x264sdk;->CloseX264Encode()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_1

    .line 13
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p0
.end method
