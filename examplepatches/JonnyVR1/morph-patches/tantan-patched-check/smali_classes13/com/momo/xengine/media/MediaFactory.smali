.class public final Lcom/momo/xengine/media/MediaFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "XMedia"

.field public static final VERSION_NUM:I = 0x64

.field private static loadSOSuccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createAudioProcessor()Lcom/momo/xengine/media/IAudioProcessor;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/AudioProcessorImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/AudioProcessorImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createMediaUtil()Lcom/momo/xengine/media/IMediaUtil;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/MediaUtilImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/MediaUtilImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createPCMDecoder()Lcom/momo/xengine/media/IPCMDecoder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/PCMDecoderImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/PCMDecoderImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createSoundTouch()Lcom/momo/xengine/media/ISoundTouch;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/SoundTouchImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/SoundTouchImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createVideoBgmUtil()Lcom/momo/xengine/media/IVideoBgmUtil;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/VideoBgmUtilImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/VideoBgmUtilImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createVideoDecoder()Lcom/momo/xengine/media/IVideoDecoder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/VideoDecoderImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/VideoDecoderImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createVideoEncoder()Lcom/momo/xengine/media/IVideoEncoder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/VideoEncoderImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/VideoEncoderImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createVideoEncoderWithSurface()Lcom/momo/xengine/media/IMediacodecSurfaceEncoder;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/MediacodecEncoderWrapper;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/MediacodecEncoderWrapper;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createVideoFrameExtractor()Lcom/momo/xengine/media/IVideoFrameExtractor;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createVideoSplicers()Lcom/momo/xengine/media/IVideoSplicers;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/VideoSplicersImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/VideoSplicersImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static createYUVConverter()Lcom/momo/xengine/media/IYUVConverter;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/momo/xengine/media/YUVConverterImpl;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/momo/xengine/media/YUVConverterImpl;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static declared-synchronized loadSO()Z
    .locals 6

    .line 1
    const-string v0, "\u52a8\u6001\u5e93\u52a0\u8f7d\u5931\u8d25"

    .line 2
    .line 3
    const-class v1, Lcom/momo/xengine/media/MediaFactory;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget-boolean v2, Lcom/momo/xengine/media/MediaFactory;->loadSOSuccess:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    monitor-exit v1

    .line 12
    return v3

    .line 13
    :cond_0
    :try_start_1
    const-string v2, "XMedia"

    .line 14
    .line 15
    const-string v4, "\u52a0\u8f7d\u52a8\u6001\u5e93 \u5f00\u59cb"

    .line 16
    .line 17
    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const-string v2, "c++_shared"

    .line 21
    .line 22
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string v2, "xmedia"

    .line 26
    .line 27
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v2, "XMedia"

    .line 31
    .line 32
    const-string v4, "\u52a0\u8f7d\u52a8\u6001\u5e93 \u5b8c\u6210"

    .line 33
    .line 34
    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    const-wide/16 v4, 0x64

    .line 38
    .line 39
    invoke-static {v4, v5}, Lcom/momo/xengine/media/MediaFactory;->nativeCheckVersion(J)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sput-boolean v3, Lcom/momo/xengine/media/MediaFactory;->loadSOSuccess:Z

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catchall_0
    move-exception v2

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-string v2, "XMedia"

    .line 51
    .line 52
    const-string v3, "\u52a8\u6001\u5e93\u7248\u672c\u52a0\u8f7d\u9519\u8bef"

    .line 53
    .line 54
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :goto_0
    :try_start_2
    const-string v3, "XMedia"

    .line 59
    .line 60
    new-instance v4, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    :goto_1
    sget-boolean v0, Lcom/momo/xengine/media/MediaFactory;->loadSOSuccess:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 76
    .line 77
    monitor-exit v1

    .line 78
    return v0

    .line 79
    :catchall_1
    move-exception v0

    .line 80
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    throw v0
.end method

.method private static native nativeCheckVersion(J)Z
.end method

.method private static native nativeSetLogEnable(Z)V
.end method

.method public static setLogEnable(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xengine/media/MediaFactory;->loadSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/momo/xengine/media/MediaFactory;->nativeSetLogEnable(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
