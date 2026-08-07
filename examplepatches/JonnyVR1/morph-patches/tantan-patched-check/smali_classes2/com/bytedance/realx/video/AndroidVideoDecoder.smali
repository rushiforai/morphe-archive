.class Lcom/bytedance/realx/video/AndroidVideoDecoder;
.super Landroid/media/MediaCodec$Callback;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoDecoder;
.implements Lcom/bytedance/realx/video/VideoSink;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;,
        Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;
    }
.end annotation


# static fields
.field private static final ADAPTIVE_PLAYBACK_MAX_DIMENSION:I = 0x2328

.field private static final DEFAULT_OUTPUT_FRAME_WAIT_TIME_MS:I = 0x10

.field private static final DEQUEUE_INPUT_INDEX_TIME_US:I = 0x1388

.field private static final DEQUEUE_INPUT_TIMEOUT_US:I = 0x7a120

.field private static final DEQUEUE_OUTPUT_BUFFER_TIMEOUT_US:I = 0x186a0

.field private static final DIRECT_RENDER_BY_VSYNC_MAX_CACHE_SIZE:Ljava/lang/String; = "bytertc.hw.decoder.dr.vsync.cache.size"

.field private static final DIRECT_RENDER_MODE_BY_VSYNC:I = 0x2

.field private static final DIRECT_RENDER_MODE_NONE:I = 0x0

.field private static final DIRECT_RENDER_MODE_NORMAL:I = 0x1

.field private static final ENABLE_CHECK_SYS_RESOLUTION_SUPPORT:Ljava/lang/String; = "bytertc.check.sys.resolution.support.enable"

.field private static final FLAG_CHECK_TEXTURE_SIZE:Ljava/lang/String; = "bytertc.hw.decoder.check.texture.size"

.field private static final HISI_DECODER_END_CODE:Ljava/lang/String; = "bytertc.hisi.decoder.endcode.enable"

.field private static final MAX_EGL_NUM:Ljava/lang/String; = "bytertc.hw.decoder.maxeglnum"

.field private static final MAX_OUTPUT_FRAME_WAIT_TIME_MS:I = 0x514

.field private static final MAX_RECREATE_DECODER_COUNT:I = 0x2

.field private static final MEDIA_CODEC_RELEASE_TIMEOUT_MS:I = 0x1770

.field private static final MEDIA_FORMAT_KEY_CROP_BOTTOM:Ljava/lang/String; = "crop-bottom"

.field private static final MEDIA_FORMAT_KEY_CROP_LEFT:Ljava/lang/String; = "crop-left"

.field private static final MEDIA_FORMAT_KEY_CROP_RIGHT:Ljava/lang/String; = "crop-right"

.field private static final MEDIA_FORMAT_KEY_CROP_TOP:Ljava/lang/String; = "crop-top"

.field private static final MEDIA_FORMAT_KEY_SLICE_HEIGHT:Ljava/lang/String; = "slice-height"

.field private static final MEDIA_FORMAT_KEY_STRIDE:Ljava/lang/String; = "stride"

.field private static final MIN_OUTPUT_FRAME_TIME_DELTA_MS:I = 0xa

.field private static final NEW_INPUT_BUFFER_API:Ljava/lang/String; = "bytertc.hw.decoder.newinputbuffer"

.field private static final NEW_OUTPUT_BUFFER_API:Ljava/lang/String; = "bytertc.hw.decoder.newoutputbuffer"

.field private static final TAG:Ljava/lang/String; = "AndroidVideoDecoder"

.field private static final TEXTURE_PLAYOUT_INSIDE_DECODER:I = 0x0

.field private static final TEXTURE_PLAYOUT_OUTSIDE_DECODER:I = 0x1

.field private static curEglContextNum:I = 0x0

.field private static maxDirectRenderCacheSize:I = 0x5

.field private static maxEglContextNum:I = 0x10


# instance fields
.field private adaptive_playback_max_height:I

.field private adaptive_playback_max_width:I

.field private asyncHandler:Landroid/os/Handler;

.field private asyncOutputThread:Landroid/os/HandlerThread;

.field private avgInputTimeDelta:J

.field private callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private callbackDecodedFrameCount:J

.field private final callbackLock:Ljava/lang/Object;

.field private codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final codecName:Ljava/lang/String;

.field private final codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

.field private colorFormat:I

.field private currentFrameCache:J

.field private currentInputTimeDelta:J

.field private currentOutputTime:J

.field private decoderThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

.field private final dimensionLock:Ljava/lang/Object;

.field private directRenderMode:I

.field private directRenderThread:Ljava/lang/Thread;

.field private dropDecodedFrameCount:J

.field enableCheckSysResolutionSupport:Z

.field enableHisiEndCode:Z

.field private enableRetryDeliver:Z

.field enableTextureSizeCheck:Z

.field private enable_adaptive_playback:Z

.field private encoded_height:I

.field private encoded_width:I

.field private exSurface:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private frameCacheThreshold:I

.field private hasDecodedFirstFrame:Z

.field private height:I

.field private inputBuffers:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private inputFrameCount:J

.field private isError:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private keyFrameRequired:Z

.field private lastInputTime:J

.field private lastOutputTime:J

.field private maxDeaccelerateRatio:F

.field private maxExSurfaceRecreateDecoderCount:I

.field private maxTryCount:I

.field private final mediaCodecWrapperFactory:Lcom/bytedance/realx/video/MediaCodecWrapperFactory;

.field private minAccelerateRatio:F

.field private minFrameCache:J

.field private mustUseYUVoutput:Z

.field private outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private outputBufferQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final outputBufferQueueLock:Ljava/lang/Object;

.field private outputFrameCount:J

.field private outputThread:Ljava/lang/Thread;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

.field private packetCount2s:J

.field private privateParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final renderedTextureMetadataLock:Ljava/lang/Object;

.field private volatile running:Z

.field private settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

.field private volatile shutdownException:Ljava/lang/Exception;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private sliceHeight:I

.field private final smoothOutputLock:Ljava/lang/Object;

.field private stride:I

.field private surface:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final surfaceTextureHelperLock:Ljava/lang/Object;

.field private texturePlayoutMode:I

.field private timeForAvg:J

.field private useAsyncMode:Z

.field private useNewInputBufferAPI:Z

.field private useNewOutputBufferAPI:Z

.field private usingInternalSurfaceLast:Z

.field private vpassPrivateParams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/bytedance/realx/video/MediaCodecWrapperFactory;Ljava/lang/String;Lcom/bytedance/realx/video/RXVideoCodecStandard;I)V
    .locals 5

    .line 1
    invoke-direct {p0}, Landroid/media/MediaCodec$Callback;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableHisiEndCode:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableCheckSysResolutionSupport:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableTextureSizeCheck:Z

    .line 11
    .line 12
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxExSurfaceRecreateDecoderCount:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderThread:Ljava/lang/Thread;

    .line 16
    .line 17
    new-instance v3, Ljava/lang/Object;

    .line 18
    .line 19
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueueLock:Ljava/lang/Object;

    .line 23
    .line 24
    new-instance v3, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 30
    .line 31
    new-instance v3, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 32
    .line 33
    invoke-direct {v3}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 37
    .line 38
    new-instance v3, Ljava/lang/Object;

    .line 39
    .line 40
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 44
    .line 45
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_width:I

    .line 46
    .line 47
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_height:I

    .line 48
    .line 49
    new-instance v3, Ljava/lang/Object;

    .line 50
    .line 51
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelperLock:Ljava/lang/Object;

    .line 55
    .line 56
    const-wide/16 v3, 0x0

    .line 57
    .line 58
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->lastOutputTime:J

    .line 59
    .line 60
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentOutputTime:J

    .line 61
    .line 62
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->lastInputTime:J

    .line 63
    .line 64
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentInputTimeDelta:J

    .line 65
    .line 66
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->packetCount2s:J

    .line 67
    .line 68
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->timeForAvg:J

    .line 69
    .line 70
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->avgInputTimeDelta:J

    .line 71
    .line 72
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 73
    .line 74
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 75
    .line 76
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 77
    .line 78
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 79
    .line 80
    const-wide/16 v3, -0x1

    .line 81
    .line 82
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 83
    .line 84
    iput-wide v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 85
    .line 86
    new-instance v3, Ljava/lang/Object;

    .line 87
    .line 88
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->smoothOutputLock:Ljava/lang/Object;

    .line 92
    .line 93
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->usingInternalSurfaceLast:Z

    .line 94
    .line 95
    new-instance v3, Ljava/util/HashMap;

    .line 96
    .line 97
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 101
    .line 102
    new-instance v3, Ljava/util/HashMap;

    .line 103
    .line 104
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->vpassPrivateParams:Ljava/util/HashMap;

    .line 108
    .line 109
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->mustUseYUVoutput:Z

    .line 110
    .line 111
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewInputBufferAPI:Z

    .line 112
    .line 113
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewOutputBufferAPI:Z

    .line 114
    .line 115
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enable_adaptive_playback:Z

    .line 116
    .line 117
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_width:I

    .line 118
    .line 119
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_height:I

    .line 120
    .line 121
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableRetryDeliver:Z

    .line 122
    .line 123
    const/16 v0, 0x10

    .line 124
    .line 125
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxTryCount:I

    .line 126
    .line 127
    const/4 v0, 0x0

    .line 128
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minAccelerateRatio:F

    .line 129
    .line 130
    const/high16 v0, 0x3f800000    # 1.0f

    .line 131
    .line 132
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxDeaccelerateRatio:F

    .line 133
    .line 134
    const/4 v0, 0x2

    .line 135
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->frameCacheThreshold:I

    .line 136
    .line 137
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderMode:I

    .line 138
    .line 139
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 140
    .line 141
    new-instance v0, Ljava/lang/Object;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 144
    .line 145
    .line 146
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 147
    .line 148
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 149
    .line 150
    new-instance v0, Ljava/util/LinkedList;

    .line 151
    .line 152
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputBuffers:Ljava/util/LinkedList;

    .line 156
    .line 157
    new-instance v0, Ljava/lang/Object;

    .line 158
    .line 159
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 160
    .line 161
    .line 162
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackLock:Ljava/lang/Object;

    .line 163
    .line 164
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 165
    .line 166
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 167
    .line 168
    .line 169
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 170
    .line 171
    invoke-direct {p0, p4}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isSupportedColorFormat(I)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_0

    .line 176
    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    const-string v2, "ctor name: "

    .line 180
    .line 181
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v2, " type: "

    .line 188
    .line 189
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v2, " color format(19:I420 21:NV12): "

    .line 196
    .line 197
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    const-string v2, "AndroidVideoDecoder"

    .line 208
    .line 209
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->mediaCodecWrapperFactory:Lcom/bytedance/realx/video/MediaCodecWrapperFactory;

    .line 213
    .line 214
    iput-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 215
    .line 216
    iput-object p3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 217
    .line 218
    iput p4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 219
    .line 220
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 221
    .line 222
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 223
    .line 224
    return-void

    .line 225
    :cond_0
    const-string p0, "Unsupported color format: "

    .line 226
    .line 227
    invoke-static {p0, p4}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 228
    .line 229
    .line 230
    throw v2
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/AndroidVideoDecoder;ILandroid/media/MediaCodec$BufferInfo;Z)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-wide p2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 6
    .line 7
    const-wide/16 v0, 0x3e8

    .line 8
    .line 9
    mul-long/2addr p2, v0

    .line 10
    invoke-interface {p0, p1, p2, p3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IJ)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {p0, p1, p3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    const-string p1, "AndroidVideoDecoder"

    .line 20
    .line 21
    const-string p2, "releaseOutputBuffer failed"

    .line 22
    .line 23
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public static synthetic access$000(Lcom/bytedance/realx/video/AndroidVideoDecoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderByVSync()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueueLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Lcom/bytedance/realx/video/MediaCodecWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Lcom/bytedance/realx/video/VideoDecoder$Callback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$508(Lcom/bytedance/realx/video/AndroidVideoDecoder;)J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v2, v0

    .line 6
    iput-wide v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 7
    .line 8
    return-wide v0
.end method

.method public static synthetic access$600(Lcom/bytedance/realx/video/AndroidVideoDecoder;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDirectRenderFrame(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/bytedance/realx/video/AndroidVideoDecoder;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/bytedance/realx/video/AndroidVideoDecoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseCodecOnOutputThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private appendHisiEndCode(Ljava/nio/ByteBuffer;I)I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableHisiEndCode:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "OMX.hisi"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/16 p0, 0x12

    .line 16
    .line 17
    new-array p0, p0, [B

    .line 18
    .line 19
    fill-array-data p0, :array_0

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/lit8 v1, p2, 0x12

    .line 27
    .line 28
    if-lt v0, v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    return v1

    .line 34
    :cond_0
    return p2

    .line 35
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x1et
        0x48t
        0x53t
        0x50t
        0x49t
        0x43t
        0x45t
        0x4et
        0x44t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/AndroidVideoDecoder;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseCodecOnOutputThread()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method private callbackDirectRenderFrame(J)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 12
    .line 13
    :cond_1
    new-instance v2, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 14
    .line 15
    iget v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 16
    .line 17
    iget v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 18
    .line 19
    const/4 v8, 0x0

    .line 20
    sget-object v9, Lcom/bytedance/realx/video/RXPixelFormat;->kUnknown:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 21
    .line 22
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    invoke-direct/range {v2 .. v9}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;-><init>(IIJ[Ljava/nio/ByteBuffer;[ILcom/bytedance/realx/video/RXPixelFormat;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v3, 0x3e8

    .line 29
    .line 30
    mul-long/2addr v3, p1

    .line 31
    sget-object v6, Lcom/bytedance/realx/video/RXColorSpace;->kUnknown:Lcom/bytedance/realx/video/RXColorSpace;

    .line 32
    .line 33
    sget-object v7, Lcom/bytedance/realx/video/RXVideoRotation;->VIDEO_ROTATION_0:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    invoke-static/range {v2 .. v7}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->createRXVideoFrame(Lcom/bytedance/realx/video/memory/NativeRXByteMemory;JLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {v0, p1}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onDecodedFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 41
    .line 42
    .line 43
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 44
    .line 45
    const-wide/16 v3, 0x1

    .line 46
    .line 47
    add-long/2addr v0, v3

    .line 48
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 51
    .line 52
    .line 53
    invoke-interface {p1}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private copyI420Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
    .locals 19

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v3, p2

    .line 4
    .line 5
    move/from16 v6, p4

    .line 6
    .line 7
    move/from16 v7, p5

    .line 8
    .line 9
    rem-int/lit8 v1, v3, 0x2

    .line 10
    .line 11
    const-string v8, "AndroidVideoDecoder"

    .line 12
    .line 13
    const/4 v9, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "Stride is not divisible by two: "

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v8, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v9

    .line 34
    :cond_0
    add-int/lit8 v1, v6, 0x1

    .line 35
    .line 36
    const/4 v10, 0x2

    .line 37
    div-int/lit8 v16, v1, 0x2

    .line 38
    .line 39
    rem-int/lit8 v1, p3, 0x2

    .line 40
    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    add-int/lit8 v1, v7, 0x1

    .line 44
    .line 45
    div-int/2addr v1, v10

    .line 46
    :goto_0
    move/from16 v17, v1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    div-int/lit8 v1, v7, 0x2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :goto_1
    div-int/lit8 v13, v3, 0x2

    .line 53
    .line 54
    mul-int v1, v3, v7

    .line 55
    .line 56
    mul-int v11, v3, p3

    .line 57
    .line 58
    mul-int v2, v13, v17

    .line 59
    .line 60
    add-int v12, v11, v2

    .line 61
    .line 62
    mul-int v4, v13, p3

    .line 63
    .line 64
    div-int/2addr v4, v10

    .line 65
    add-int v14, v11, v4

    .line 66
    .line 67
    add-int v15, v14, v2

    .line 68
    .line 69
    move-object/from16 v2, p0

    .line 70
    .line 71
    invoke-virtual {v2, v6, v7}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->allocateI420Buffer(II)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    if-nez v4, :cond_2

    .line 76
    .line 77
    return-object v9

    .line 78
    :cond_2
    invoke-virtual {v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getNumberOfPlanes()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    move-object/from16 v18, v9

    .line 83
    .line 84
    const/4 v9, 0x3

    .line 85
    if-eq v5, v9, :cond_3

    .line 86
    .line 87
    invoke-virtual {v4}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 88
    .line 89
    .line 90
    return-object v18

    .line 91
    :cond_3
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    const/4 v1, 0x0

    .line 95
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v4, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v4, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 107
    .line 108
    .line 109
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 110
    move-object v9, v4

    .line 111
    move-object v4, v5

    .line 112
    move v5, v1

    .line 113
    move-object/from16 v1, p0

    .line 114
    .line 115
    :try_start_1
    invoke-virtual/range {v1 .. v7}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v12}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    move-result-object v12

    .line 128
    const/4 v1, 0x1

    .line 129
    move v4, v14

    .line 130
    invoke-virtual {v9, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    .line 133
    move-result-object v14

    .line 134
    move v2, v15

    .line 135
    invoke-virtual {v9, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 136
    .line 137
    .line 138
    move-result v15

    .line 139
    move v3, v2

    .line 140
    move v2, v11

    .line 141
    move-object/from16 v11, p0

    .line 142
    .line 143
    invoke-virtual/range {v11 .. v17}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 144
    .line 145
    .line 146
    rem-int/lit8 v5, p3, 0x2

    .line 147
    .line 148
    if-ne v5, v1, :cond_4

    .line 149
    .line 150
    add-int/lit8 v5, v17, -0x1

    .line 151
    .line 152
    mul-int/2addr v5, v13

    .line 153
    add-int v11, v2, v5

    .line 154
    .line 155
    invoke-virtual {v0, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v9, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v9, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 163
    .line 164
    .line 165
    move-result v5

    .line 166
    mul-int v5, v5, v17

    .line 167
    .line 168
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :catch_0
    move-exception v0

    .line 176
    goto :goto_3

    .line 177
    :cond_4
    :goto_2
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    move-result-object v12

    .line 187
    invoke-virtual {v9, v10}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 188
    .line 189
    .line 190
    move-result-object v14

    .line 191
    invoke-virtual {v9, v10}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 192
    .line 193
    .line 194
    move-result v15

    .line 195
    move-object/from16 v11, p0

    .line 196
    .line 197
    invoke-virtual/range {v11 .. v17}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 198
    .line 199
    .line 200
    rem-int/lit8 v2, p3, 0x2

    .line 201
    .line 202
    if-ne v2, v1, :cond_5

    .line 203
    .line 204
    add-int/lit8 v1, v17, -0x1

    .line 205
    .line 206
    mul-int/2addr v13, v1

    .line 207
    add-int v14, v4, v13

    .line 208
    .line 209
    invoke-virtual {v0, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v9, v10}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {v9, v10}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    mul-int v2, v2, v17

    .line 221
    .line 222
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 226
    .line 227
    .line 228
    :cond_5
    return-object v9

    .line 229
    :catch_1
    move-exception v0

    .line 230
    move-object v9, v4

    .line 231
    :goto_3
    const-string v1, "buffer err:"

    .line 232
    .line 233
    invoke-static {v8, v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v9}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 237
    .line 238
    .line 239
    return-object v18
.end method

.method private copyNV12Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
    .locals 12

    .line 1
    move/from16 v6, p5

    .line 2
    .line 3
    add-int/lit8 v0, v6, 0x1

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    div-int/lit8 v8, v0, 0x2

    .line 7
    .line 8
    mul-int v0, p2, v6

    .line 9
    .line 10
    mul-int v7, p2, p3

    .line 11
    .line 12
    mul-int v2, p2, v8

    .line 13
    .line 14
    add-int v9, v7, v2

    .line 15
    .line 16
    sget-object v2, Lcom/bytedance/realx/video/RXPixelFormat;->kNv12:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 17
    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    move/from16 v5, p4

    .line 21
    .line 22
    invoke-static {v5, v6, v2, v3, v4}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->createRXByteMemory(IILcom/bytedance/realx/video/RXPixelFormat;J)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 23
    .line 24
    .line 25
    move-result-object v10

    .line 26
    const/4 v11, 0x0

    .line 27
    if-nez v10, :cond_0

    .line 28
    .line 29
    return-object v11

    .line 30
    :cond_0
    invoke-virtual {v10}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getNumberOfPlanes()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eq v2, v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v10}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 37
    .line 38
    .line 39
    return-object v11

    .line 40
    :cond_1
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v10, v0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v10, v0}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    move-object v0, p0

    .line 60
    move v2, p2

    .line 61
    invoke-virtual/range {v0 .. v6}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v9}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    const/4 p1, 0x1

    .line 75
    invoke-virtual {v10, p1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneData(I)Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v10, p1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->getPlaneLineSize(I)I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    move-object v2, p0

    .line 84
    move v4, p2

    .line 85
    move/from16 v7, p4

    .line 86
    .line 87
    invoke-virtual/range {v2 .. v8}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    .line 90
    return-object v10

    .line 91
    :catch_0
    move-exception v0

    .line 92
    move-object p0, v0

    .line 93
    const-string p1, "AndroidVideoDecoder"

    .line 94
    .line 95
    const-string p2, "copyNV12Buffer err:"

    .line 96
    .line 97
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v10}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 101
    .line 102
    .line 103
    return-object v11
.end method

.method private createDirectRenderVSyncThread()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Lcom/bytedance/realx/video/AndroidVideoDecoder$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder$1;-><init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderThread:Ljava/lang/Thread;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private createOutputThread()Ljava/lang/Thread;
    .locals 2

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/AndroidVideoDecoder$3;

    .line 2
    .line 3
    const-string v1, "AndroidVideoDecoder.outputThread"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder$3;-><init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private deliverByteFrame(ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    iget-object v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v2

    .line 10
    :try_start_0
    iget v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 11
    .line 12
    iget v6, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 13
    .line 14
    iget v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stride:I

    .line 15
    .line 16
    iget v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sliceHeight:I

    .line 17
    .line 18
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    iget-object v8, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 20
    .line 21
    iget v2, v7, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 22
    .line 23
    mul-int v9, v5, v6

    .line 24
    .line 25
    mul-int/lit8 v9, v9, 0x3

    .line 26
    .line 27
    div-int/lit8 v9, v9, 0x2

    .line 28
    .line 29
    if-ge v2, v9, :cond_0

    .line 30
    .line 31
    const-string v0, "AndroidVideoDecoder"

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "Insufficient output buffer size: "

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget v2, v7, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    mul-int v9, v3, v6

    .line 54
    .line 55
    mul-int/lit8 v9, v9, 0x3

    .line 56
    .line 57
    div-int/lit8 v9, v9, 0x2

    .line 58
    .line 59
    if-ge v2, v9, :cond_1

    .line 60
    .line 61
    if-ne v4, v6, :cond_1

    .line 62
    .line 63
    if-le v3, v5, :cond_1

    .line 64
    .line 65
    mul-int/lit8 v2, v2, 0x2

    .line 66
    .line 67
    mul-int/lit8 v3, v6, 0x3

    .line 68
    .line 69
    div-int v3, v2, v3

    .line 70
    .line 71
    :cond_1
    :try_start_1
    iget-boolean v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 72
    .line 73
    if-eqz v2, :cond_2

    .line 74
    .line 75
    iget-object v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 76
    .line 77
    invoke-interface {v2, v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    goto :goto_0

    .line 82
    :cond_2
    iget-boolean v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewOutputBufferAPI:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 83
    .line 84
    iget-object v9, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 85
    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    :try_start_2
    invoke-interface {v9, v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    goto :goto_0

    .line 93
    :cond_3
    invoke-interface {v9}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    aget-object v2, v2, v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 98
    .line 99
    :goto_0
    iget v9, v7, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 100
    .line 101
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 102
    .line 103
    .line 104
    iget v9, v7, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 105
    .line 106
    iget v10, v7, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 107
    .line 108
    add-int/2addr v9, v10

    .line 109
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const-wide/16 v9, 0x1

    .line 117
    .line 118
    :try_start_3
    iget v11, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 119
    .line 120
    const/16 v12, 0x13

    .line 121
    .line 122
    if-ne v11, v12, :cond_4

    .line 123
    .line 124
    :try_start_4
    invoke-direct/range {v1 .. v6}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyI420Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 125
    .line 126
    .line 127
    move-result-object v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 128
    move-object/from16 v1, p0

    .line 129
    .line 130
    :goto_1
    move-object v11, v2

    .line 131
    goto :goto_2

    .line 132
    :catch_0
    move-exception v0

    .line 133
    move-object/from16 v1, p0

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_4
    :try_start_5
    invoke-direct/range {v1 .. v6}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->copyNV12Buffer(Ljava/nio/ByteBuffer;IIII)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 137
    .line 138
    .line 139
    move-result-object v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 140
    goto :goto_1

    .line 141
    :goto_2
    if-nez v11, :cond_5

    .line 142
    .line 143
    const-string v0, "AndroidVideoDecoder"

    .line 144
    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string v3, "byteMemory is null, colorFormat:"

    .line 148
    .line 149
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 153
    .line 154
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 165
    .line 166
    add-long/2addr v2, v9

    .line 167
    iput-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 168
    .line 169
    return-void

    .line 170
    :cond_5
    :try_start_6
    iget-object v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 171
    .line 172
    const/4 v3, 0x0

    .line 173
    invoke-interface {v2, v0, v3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 174
    .line 175
    .line 176
    iget-wide v2, v7, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 177
    .line 178
    const-wide/16 v4, 0x3e8

    .line 179
    .line 180
    mul-long v12, v2, v4

    .line 181
    .line 182
    sget-object v15, Lcom/bytedance/realx/video/RXColorSpace;->kUnknown:Lcom/bytedance/realx/video/RXColorSpace;

    .line 183
    .line 184
    sget-object v16, Lcom/bytedance/realx/video/RXVideoRotation;->VIDEO_ROTATION_0:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 185
    .line 186
    const/4 v14, 0x0

    .line 187
    invoke-static/range {v11 .. v16}, Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;->createRXVideoFrame(Lcom/bytedance/realx/video/memory/NativeRXByteMemory;JLjava/nio/ByteBuffer;Lcom/bytedance/realx/video/RXColorSpace;Lcom/bytedance/realx/video/RXVideoRotation;)Lcom/bytedance/realx/video/memory/NativeRXVideoFrame;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    if-nez v8, :cond_6

    .line 192
    .line 193
    const-string v2, "AndroidVideoDecoder"

    .line 194
    .line 195
    new-instance v3, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v4, "callback is null, dropDecodedFrameCount:"

    .line 198
    .line 199
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-wide v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 203
    .line 204
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-static {v2, v3}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 215
    .line 216
    add-long/2addr v2, v9

    .line 217
    iput-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 218
    .line 219
    invoke-virtual {v11}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 220
    .line 221
    .line 222
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :cond_6
    invoke-interface {v8, v0}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onDecodedFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 227
    .line 228
    .line 229
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 230
    .line 231
    add-long/2addr v2, v9

    .line 232
    iput-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 233
    .line 234
    invoke-virtual {v11}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 235
    .line 236
    .line 237
    invoke-interface {v0}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->release()V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :catch_1
    move-exception v0

    .line 242
    const-string v1, "AndroidVideoDecoder"

    .line 243
    .line 244
    const-string v2, "releaseOutputBuffer failed!"

    .line 245
    .line 246
    invoke-static {v1, v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v11}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->release()V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :catch_2
    move-exception v0

    .line 254
    :goto_3
    const-string v2, "AndroidVideoDecoder"

    .line 255
    .line 256
    const-string v3, "buffer err!"

    .line 257
    .line 258
    invoke-static {v2, v3, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 259
    .line 260
    .line 261
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 262
    .line 263
    add-long/2addr v2, v9

    .line 264
    iput-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 265
    .line 266
    return-void

    .line 267
    :catch_3
    move-exception v0

    .line 268
    const-string v1, "AndroidVideoDecoder"

    .line 269
    .line 270
    const-string v2, "getOutputBuffer failed!"

    .line 271
    .line 272
    invoke-static {v1, v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :catchall_0
    move-exception v0

    .line 277
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 278
    throw v0
.end method

.method private deliverTextureFrame(ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 5
    .line 6
    iget v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 7
    .line 8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 9
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 10
    .line 11
    iget-boolean v3, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSmoothOutput:Z

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->smoothOutputFrame()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 23
    .line 24
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    const/4 v4, 0x1

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    move v5, v3

    .line 35
    move v0, v4

    .line 36
    :goto_0
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/16 v0, 0xc8

    .line 39
    .line 40
    if-ge v5, v0, :cond_3

    .line 41
    .line 42
    add-int/lit8 v5, v5, 0x1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 45
    .line 46
    monitor-enter v0

    .line 47
    :try_start_1
    iget-object v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 48
    .line 49
    if-nez v6, :cond_1

    .line 50
    .line 51
    move v6, v3

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v6, v4

    .line 54
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    if-eqz v6, :cond_2

    .line 56
    .line 57
    const-wide/16 v7, 0xa

    .line 58
    .line 59
    :try_start_2
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :catch_0
    move-exception v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_2
    move v0, v6

    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 71
    throw p0

    .line 72
    :cond_3
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableRetryDeliver:Z

    .line 73
    .line 74
    const-wide/16 v5, 0x1

    .line 75
    .line 76
    if-eqz v0, :cond_9

    .line 77
    .line 78
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 79
    .line 80
    if-eqz v0, :cond_9

    .line 81
    .line 82
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 83
    .line 84
    .line 85
    move-result-wide v7

    .line 86
    iget-wide v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 87
    .line 88
    iget-wide v11, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 89
    .line 90
    sub-long/2addr v9, v11

    .line 91
    const-wide/16 v11, 0x0

    .line 92
    .line 93
    cmp-long v0, v9, v11

    .line 94
    .line 95
    if-ltz v0, :cond_4

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_4
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->frameCacheThreshold:I

    .line 99
    .line 100
    add-int/2addr v0, v4

    .line 101
    int-to-long v9, v0

    .line 102
    :goto_3
    iput-wide v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 103
    .line 104
    const-string v0, "AndroidVideoDecoder"

    .line 105
    .line 106
    new-instance v9, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v10, "currentFrameCache:"

    .line 109
    .line 110
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iget-wide v10, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 114
    .line 115
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v9

    .line 122
    invoke-static {v0, v9}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-wide v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 126
    .line 127
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->frameCacheThreshold:I

    .line 128
    .line 129
    int-to-long v11, v0

    .line 130
    cmp-long v0, v9, v11

    .line 131
    .line 132
    iget v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxTryCount:I

    .line 133
    .line 134
    if-gtz v0, :cond_5

    .line 135
    .line 136
    int-to-float v0, v9

    .line 137
    iget v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxDeaccelerateRatio:F

    .line 138
    .line 139
    :goto_4
    mul-float/2addr v0, v9

    .line 140
    float-to-int v0, v0

    .line 141
    move v9, v4

    .line 142
    goto :goto_5

    .line 143
    :cond_5
    int-to-float v0, v9

    .line 144
    iget v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minAccelerateRatio:F

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :goto_5
    if-eqz v9, :cond_8

    .line 148
    .line 149
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 150
    .line 151
    .line 152
    move-result-wide v9

    .line 153
    sub-long/2addr v9, v7

    .line 154
    int-to-long v11, v0

    .line 155
    cmp-long v9, v9, v11

    .line 156
    .line 157
    if-gez v9, :cond_8

    .line 158
    .line 159
    iget-object v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 160
    .line 161
    monitor-enter v9

    .line 162
    :try_start_4
    iget-object v10, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 163
    .line 164
    if-nez v10, :cond_6

    .line 165
    .line 166
    move v10, v3

    .line 167
    goto :goto_6

    .line 168
    :cond_6
    move v10, v4

    .line 169
    :goto_6
    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 170
    if-eqz v10, :cond_7

    .line 171
    .line 172
    :try_start_5
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1

    .line 173
    .line 174
    .line 175
    goto :goto_7

    .line 176
    :catch_1
    move-exception v9

    .line 177
    invoke-virtual {v9}, Ljava/lang/Throwable;->printStackTrace()V

    .line 178
    .line 179
    .line 180
    :cond_7
    :goto_7
    move v9, v10

    .line 181
    goto :goto_5

    .line 182
    :catchall_1
    move-exception p0

    .line 183
    :try_start_6
    monitor-exit v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 184
    throw p0

    .line 185
    :cond_8
    const-string v0, "AndroidVideoDecoder"

    .line 186
    .line 187
    new-instance v9, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v10, "retry delivering frame take ms: "

    .line 190
    .line 191
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 195
    .line 196
    .line 197
    move-result-wide v10

    .line 198
    sub-long/2addr v10, v7

    .line 199
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v7

    .line 206
    invoke-static {v0, v7}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    :cond_9
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 210
    .line 211
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 212
    .line 213
    monitor-enter v7

    .line 214
    :try_start_7
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 215
    .line 216
    if-eqz v8, :cond_b

    .line 217
    .line 218
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 219
    .line 220
    if-eqz v8, :cond_b

    .line 221
    .line 222
    :try_start_8
    invoke-interface {v8, p1, v3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 223
    .line 224
    .line 225
    goto :goto_8

    .line 226
    :catchall_2
    move-exception p0

    .line 227
    goto :goto_d

    .line 228
    :catch_2
    move-exception p1

    .line 229
    :try_start_9
    const-string p2, "AndroidVideoDecoder"

    .line 230
    .line 231
    const-string v1, "releaseOutputBuffer failed"

    .line 232
    .line 233
    invoke-static {p2, v1, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    :goto_8
    iget-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 237
    .line 238
    add-long/2addr p1, v5

    .line 239
    iput-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 240
    .line 241
    if-eqz v0, :cond_a

    .line 242
    .line 243
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 244
    .line 245
    const-string p1, "waiting for texture for the previous frame"

    .line 246
    .line 247
    invoke-interface {v0, p0, p1}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    :cond_a
    monitor-exit v7

    .line 251
    goto :goto_b

    .line 252
    :cond_b
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelperLock:Ljava/lang/Object;

    .line 253
    .line 254
    monitor-enter v8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 255
    :try_start_a
    iget-object v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 256
    .line 257
    if-eqz v9, :cond_d

    .line 258
    .line 259
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableTextureSizeCheck:Z

    .line 260
    .line 261
    invoke-virtual {v9, v1, v2, v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setTextureSize(IIZ)V

    .line 262
    .line 263
    .line 264
    monitor-exit v8
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 265
    :try_start_b
    new-instance v0, Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 266
    .line 267
    iget-wide v1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 268
    .line 269
    invoke-direct {v0, v1, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;-><init>(J)V

    .line 270
    .line 271
    .line 272
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 273
    .line 274
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 275
    .line 276
    if-eqz p0, :cond_c

    .line 277
    .line 278
    :try_start_c
    invoke-interface {p0, p1, v4}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_c
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 279
    .line 280
    .line 281
    goto :goto_9

    .line 282
    :catch_3
    move-exception p0

    .line 283
    :try_start_d
    const-string p1, "AndroidVideoDecoder"

    .line 284
    .line 285
    const-string p2, "releaseOutputBuffer failed!"

    .line 286
    .line 287
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 288
    .line 289
    .line 290
    :cond_c
    :goto_9
    monitor-exit v7
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 291
    goto :goto_b

    .line 292
    :catchall_3
    move-exception p0

    .line 293
    goto :goto_c

    .line 294
    :cond_d
    :try_start_e
    iget-wide v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 295
    .line 296
    add-long/2addr v1, v5

    .line 297
    iput-wide v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 298
    .line 299
    if-eqz v0, :cond_e

    .line 300
    .line 301
    sget-object p2, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 302
    .line 303
    const-string v1, "surfaceTextureHelper is null"

    .line 304
    .line 305
    invoke-interface {v0, p2, v1}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    :cond_e
    const-string p2, "AndroidVideoDecoder"

    .line 309
    .line 310
    const-string v0, "surfaceTextureHelper is null, drop current decoded frame."

    .line 311
    .line 312
    invoke-static {p2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 316
    .line 317
    if-eqz p0, :cond_f

    .line 318
    .line 319
    :try_start_f
    invoke-interface {p0, p1, v3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_f
    .catch Ljava/lang/IllegalStateException; {:try_start_f .. :try_end_f} :catch_4
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 320
    .line 321
    .line 322
    goto :goto_a

    .line 323
    :catch_4
    move-exception p0

    .line 324
    :try_start_10
    const-string p1, "AndroidVideoDecoder"

    .line 325
    .line 326
    const-string p2, "releaseOutputBuffer failed"

    .line 327
    .line 328
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 329
    .line 330
    .line 331
    :cond_f
    :goto_a
    monitor-exit v8
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    .line 332
    :try_start_11
    monitor-exit v7
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 333
    :goto_b
    return-void

    .line 334
    :goto_c
    :try_start_12
    monitor-exit v8
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_3

    .line 335
    :try_start_13
    throw p0

    .line 336
    :goto_d
    monitor-exit v7
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_2

    .line 337
    throw p0

    .line 338
    :catchall_4
    move-exception p0

    .line 339
    :try_start_14
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    .line 340
    throw p0
.end method

.method private deliverTextureFrameOutSide(ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 2
    .line 3
    iget-wide v1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;-><init>(J)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelperLock:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 18
    .line 19
    iget v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setTextureSize(II)V

    .line 22
    .line 23
    .line 24
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    new-instance v0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;

    .line 26
    .line 27
    new-instance v1, Lcom/bytedance/realx/video/b;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1, p2}, Lcom/bytedance/realx/video/b;-><init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;ILandroid/media/MediaCodec$BufferInfo;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;-><init>(Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->onFrame(Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :try_start_1
    iget-wide v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 44
    .line 45
    const-wide/16 v3, 0x1

    .line 46
    .line 47
    add-long/2addr v1, v3

    .line 48
    iput-wide v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 49
    .line 50
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 51
    .line 52
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 53
    .line 54
    const-string v2, "outSideSurfaceTextureHelper is null"

    .line 55
    .line 56
    invoke-interface {p2, v1, v2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string p2, "AndroidVideoDecoder"

    .line 60
    .line 61
    const-string v1, "outSideSurfaceTextureHelper is null, drop current decoded frame."

    .line 62
    .line 63
    invoke-static {p2, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    const/4 p2, 0x0

    .line 71
    :try_start_2
    invoke-interface {p0, p1, p2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception p0

    .line 76
    :try_start_3
    const-string p1, "AndroidVideoDecoder"

    .line 77
    .line 78
    const-string p2, "releaseOutputBuffer failed"

    .line 79
    .line 80
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    monitor-exit v0

    .line 84
    return-void

    .line 85
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 86
    throw p0
.end method

.method private directRenderByVSync()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder$2;-><init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Landroid/os/Looper;->loop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string v0, "AndroidVideoDecoder"

    .line 22
    .line 23
    const-string v1, "direct render by vsync is error"

    .line 24
    .line 25
    invoke-static {v0, v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private drainOutputFrame(Landroid/media/MediaCodec$BufferInfo;I)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 7
    .line 8
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string p0, "AndroidVideoDecoder"

    .line 17
    .line 18
    const-string p1, "codec is error when call drainOutputFrame"

    .line 19
    .line 20
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string p0, "AndroidVideoDecoder"

    .line 29
    .line 30
    const-string p1, "callback is null, return"

    .line 31
    .line 32
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    if-eqz v1, :cond_7

    .line 40
    .line 41
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 42
    .line 43
    if-nez v1, :cond_5

    .line 44
    .line 45
    :try_start_0
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderMode:I

    .line 46
    .line 47
    if-ne v4, v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 50
    .line 51
    iget-wide v4, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 52
    .line 53
    const-wide/16 v6, 0x3e8

    .line 54
    .line 55
    mul-long/2addr v4, v6

    .line 56
    invoke-interface {v1, p2, v4, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IJ)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :catch_0
    move-exception p1

    .line 61
    goto :goto_3

    .line 62
    :cond_2
    const/4 v5, 0x2

    .line 63
    if-ne v5, v1, :cond_4

    .line 64
    .line 65
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueueLock:Ljava/lang/Object;

    .line 66
    .line 67
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :try_start_1
    new-instance v4, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;

    .line 69
    .line 70
    iget-wide v5, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 71
    .line 72
    invoke-direct {v4, v5, v6, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;-><init>(JI)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 76
    .line 77
    invoke-virtual {p1, v4}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    sget p2, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxDirectRenderCacheSize:I

    .line 87
    .line 88
    if-le p1, p2, :cond_3

    .line 89
    .line 90
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputBufferQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;

    .line 97
    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 101
    .line 102
    iget p1, p1, Lcom/bytedance/realx/video/AndroidVideoDecoder$OutputBufferInfo;->bufferIndex:I

    .line 103
    .line 104
    const/4 v4, 0x0

    .line 105
    invoke-interface {p2, p1, v4}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V

    .line 106
    .line 107
    .line 108
    sget-object p1, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 109
    .line 110
    const-string p2, "direct render drop frame"

    .line 111
    .line 112
    invoke-interface {v0, p1, p2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 116
    .line 117
    add-long/2addr p1, v2

    .line 118
    iput-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :catchall_0
    move-exception p1

    .line 122
    goto :goto_1

    .line 123
    :cond_3
    :goto_0
    monitor-exit v1

    .line 124
    return-void

    .line 125
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    :try_start_2
    throw p1

    .line 127
    :cond_4
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 128
    .line 129
    invoke-interface {v1, p2, v4}, Lcom/bytedance/realx/video/MediaCodecWrapper;->releaseOutputBuffer(IZ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 130
    .line 131
    .line 132
    :goto_2
    iget-wide p1, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 133
    .line 134
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDirectRenderFrame(J)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :goto_3
    new-instance p2, Ljava/io/StringWriter;

    .line 139
    .line 140
    invoke-direct {p2}, Ljava/io/StringWriter;-><init>()V

    .line 141
    .line 142
    .line 143
    new-instance v1, Ljava/io/PrintWriter;

    .line 144
    .line 145
    invoke-direct {v1, p2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 149
    .line 150
    .line 151
    sget-object p1, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_EXCEPTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 152
    .line 153
    invoke-virtual {p2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-interface {v0, p1, p2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sget-object p1, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 161
    .line 162
    const-string p2, "releaseOutputBuffer err"

    .line 163
    .line 164
    invoke-interface {v0, p1, p2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 168
    .line 169
    add-long/2addr p1, v2

    .line 170
    iput-wide p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 171
    .line 172
    return-void

    .line 173
    :cond_5
    if-ne v4, v1, :cond_6

    .line 174
    .line 175
    invoke-direct {p0, p2, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->deliverTextureFrameOutSide(ILandroid/media/MediaCodec$BufferInfo;)V

    .line 176
    .line 177
    .line 178
    :cond_6
    return-void

    .line 179
    :cond_7
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 180
    .line 181
    if-nez v0, :cond_8

    .line 182
    .line 183
    iput-boolean v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 184
    .line 185
    :cond_8
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 186
    .line 187
    if-eqz v0, :cond_9

    .line 188
    .line 189
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 190
    .line 191
    if-nez v0, :cond_9

    .line 192
    .line 193
    invoke-direct {p0, p2, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->deliverTextureFrame(ILandroid/media/MediaCodec$BufferInfo;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_9
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 198
    .line 199
    if-eqz v0, :cond_a

    .line 200
    .line 201
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 202
    .line 203
    if-ne v4, v0, :cond_a

    .line 204
    .line 205
    invoke-direct {p0, p2, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->deliverTextureFrameOutSide(ILandroid/media/MediaCodec$BufferInfo;)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_a
    invoke-direct {p0, p2, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->deliverByteFrame(ILandroid/media/MediaCodec$BufferInfo;)V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method private feedInputBufferAsync(Lcom/bytedance/realx/video/EncodedImage;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 12

    .line 1
    iget-object v0, p1, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const v0, 0x4c4b40

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const v0, 0x7a120

    .line 18
    .line 19
    .line 20
    :goto_0
    div-int/lit16 v0, v0, 0x1388

    .line 21
    .line 22
    :cond_1
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackLock:Ljava/lang/Object;

    .line 23
    .line 24
    monitor-enter v2

    .line 25
    :try_start_0
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputBuffers:Ljava/util/LinkedList;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, -0x1

    .line 32
    if-gtz v3, :cond_2

    .line 33
    .line 34
    move v6, v4

    .line 35
    goto :goto_1

    .line 36
    :cond_2
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputBuffers:Ljava/util/LinkedList;

    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Ljava/lang/Integer;

    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    move v6, v3

    .line 49
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    if-ne v6, v4, :cond_3

    .line 51
    .line 52
    add-int/lit8 v2, v0, -0x1

    .line 53
    .line 54
    const-wide/16 v7, 0x5

    .line 55
    .line 56
    :try_start_1
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :catch_0
    move-exception v0

    .line 61
    const-string v3, "AndroidVideoDecoder"

    .line 62
    .line 63
    new-instance v5, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v7, ""

    .line 66
    .line 67
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v3, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :goto_2
    move v0, v2

    .line 81
    :cond_3
    if-ne v6, v4, :cond_4

    .line 82
    .line 83
    if-gtz v0, :cond_1

    .line 84
    .line 85
    :cond_4
    if-ne v6, v4, :cond_5

    .line 86
    .line 87
    const-string p0, "AndroidVideoDecoder"

    .line 88
    .line 89
    const-string p1, "decode() - no HW buffers available; decoder falling behind"

    .line 90
    .line 91
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_5
    :try_start_2
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 98
    .line 99
    invoke-interface {v0, v6}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    .line 102
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 103
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-ge v2, v1, :cond_6

    .line 108
    .line 109
    const-string p0, "AndroidVideoDecoder"

    .line 110
    .line 111
    const-string p1, "decode() - HW buffer too small"

    .line 112
    .line 113
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 117
    .line 118
    return-object p0

    .line 119
    :cond_6
    iget-object v2, p1, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 122
    .line 123
    .line 124
    invoke-direct {p0, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->appendHisiEndCode(Ljava/nio/ByteBuffer;I)I

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    :try_start_3
    iget-object v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 129
    .line 130
    iget-wide p0, p1, Lcom/bytedance/realx/video/EncodedImage;->captureTimeNs:J

    .line 131
    .line 132
    const-wide/16 v0, 0x3e8

    .line 133
    .line 134
    div-long v9, p0, v0

    .line 135
    .line 136
    const/4 v11, 0x0

    .line 137
    const/4 v7, 0x0

    .line 138
    invoke-interface/range {v5 .. v11}, Lcom/bytedance/realx/video/MediaCodecWrapper;->queueInputBuffer(IIIJI)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_1

    .line 139
    .line 140
    .line 141
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 142
    .line 143
    return-object p0

    .line 144
    :catch_1
    move-exception v0

    .line 145
    move-object p0, v0

    .line 146
    const-string p1, "AndroidVideoDecoder"

    .line 147
    .line 148
    const-string v0, "queueInputBuffer failed"

    .line 149
    .line 150
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 151
    .line 152
    .line 153
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 154
    .line 155
    return-object p0

    .line 156
    :catch_2
    move-exception v0

    .line 157
    move-object p0, v0

    .line 158
    const-string p1, "AndroidVideoDecoder"

    .line 159
    .line 160
    const-string v0, "getInputBuffer failed"

    .line 161
    .line 162
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 166
    .line 167
    return-object p0

    .line 168
    :catchall_0
    move-exception v0

    .line 169
    move-object p0, v0

    .line 170
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 171
    throw p0
.end method

.method private feedInputBufferSync(Lcom/bytedance/realx/video/EncodedImage;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 12

    .line 1
    const-string v1, "AndroidVideoDecoder"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 12
    .line 13
    iget-boolean v3, v3, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 14
    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    const-wide/32 v3, 0x4c4b40

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-wide/32 v3, 0x7a120

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-interface {v2, v3, v4}, Lcom/bytedance/realx/video/MediaCodecWrapper;->dequeueInputBuffer(J)I

    .line 25
    .line 26
    .line 27
    move-result v6
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 28
    if-gez v6, :cond_1

    .line 29
    .line 30
    const-string p0, "decode() - no HW buffers available; decoder falling behind"

    .line 31
    .line 32
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    :try_start_1
    iget-boolean v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewInputBufferAPI:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 39
    .line 40
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    :try_start_2
    invoke-interface {v3, v6}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    goto :goto_1

    .line 49
    :catch_0
    move-exception v0

    .line 50
    move-object p1, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    invoke-interface {v3}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    aget-object v2, v2, v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 57
    .line 58
    :goto_1
    if-nez v2, :cond_3

    .line 59
    .line 60
    const-string p0, "decode() - HW buffer is null"

    .line 61
    .line 62
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_3
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-ge v3, v0, :cond_4

    .line 73
    .line 74
    const-string p0, "decode() - HW buffer too small"

    .line 75
    .line 76
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OVERLOAD:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_4
    iget-object v3, p1, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    invoke-direct {p0, v2, v0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->appendHisiEndCode(Ljava/nio/ByteBuffer;I)I

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    :try_start_3
    iget-object v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 92
    .line 93
    iget-wide p0, p1, Lcom/bytedance/realx/video/EncodedImage;->captureTimeNs:J

    .line 94
    .line 95
    const-wide/16 v2, 0x3e8

    .line 96
    .line 97
    div-long v9, p0, v2

    .line 98
    .line 99
    const/4 v11, 0x0

    .line 100
    const/4 v7, 0x0

    .line 101
    invoke-interface/range {v5 .. v11}, Lcom/bytedance/realx/video/MediaCodecWrapper;->queueInputBuffer(IIIJI)V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_1

    .line 102
    .line 103
    .line 104
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 105
    .line 106
    return-object p0

    .line 107
    :catch_1
    move-exception v0

    .line 108
    move-object p0, v0

    .line 109
    const-string p1, "queueInputBuffer failed"

    .line 110
    .line 111
    invoke-static {v1, p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 115
    .line 116
    return-object p0

    .line 117
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v2, "getInputBuffers failed,useNewInputBufferAPI"

    .line 120
    .line 121
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-boolean p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewInputBufferAPI:Z

    .line 125
    .line 126
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p0, "exception:"

    .line 130
    .line 131
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 145
    .line 146
    return-object p0

    .line 147
    :catch_2
    move-exception v0

    .line 148
    move-object p0, v0

    .line 149
    const-string p1, "dequeueInputBuffer failed"

    .line 150
    .line 151
    invoke-static {v1, p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 152
    .line 153
    .line 154
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 155
    .line 156
    return-object p0
.end method

.method private initDecodeInternal(II)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 11

    .line 1
    const-string v0, "init codec done with internal surface:"

    .line 2
    .line 3
    const-string v1, "init codec done with external surface:"

    .line 4
    .line 5
    const-string v2, "init codec done control by outside with internal surface:"

    .line 6
    .line 7
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    const-string p0, "AndroidVideoDecoder"

    .line 12
    .line 13
    const-string p1, "callback uninitalized"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->UNINITIALIZED:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    sget-object v5, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 26
    .line 27
    iget v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    if-ne v6, v5, :cond_1

    .line 31
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->initOutSideSurfaceTextureHelper(II)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->initSurfaceTextureHelper()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    :goto_0
    sget-object v7, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 42
    .line 43
    if-eq v5, v7, :cond_2

    .line 44
    .line 45
    return-object v5

    .line 46
    :cond_2
    const-string v5, "AndroidVideoDecoder"

    .line 47
    .line 48
    new-instance v7, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v8, "initDecodeInternal name: "

    .line 51
    .line 52
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v8, " type: "

    .line 61
    .line 62
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 66
    .line 67
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v8, " width: "

    .line 71
    .line 72
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v8, " height: "

    .line 79
    .line 80
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v8, " sharedContext:"

    .line 87
    .line 88
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 92
    .line 93
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v8, " outputByDts:"

    .line 97
    .line 98
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 102
    .line 103
    iget-boolean v8, v8, Lcom/bytedance/realx/video/VideoDecoder$Settings;->outputByDts:Z

    .line 104
    .line 105
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v8, ", external surface:"

    .line 109
    .line 110
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 114
    .line 115
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v8, ", internal surface:"

    .line 119
    .line 120
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 124
    .line 125
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    const-string v8, " smoothOutput:"

    .line 129
    .line 130
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 134
    .line 135
    iget-boolean v8, v8, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSmoothOutput:Z

    .line 136
    .line 137
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v8, " yuv mode:"

    .line 141
    .line 142
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 146
    .line 147
    iget-boolean v8, v8, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 148
    .line 149
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v8, " mustUseYUVoutput:"

    .line 153
    .line 154
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    iget-boolean v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->mustUseYUVoutput:Z

    .line 158
    .line 159
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v8, ", latencyInsensitiveMode:"

    .line 163
    .line 164
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 168
    .line 169
    iget-boolean v8, v8, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 170
    .line 171
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v8, ", enableRecreateByResolution:"

    .line 175
    .line 176
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 180
    .line 181
    iget-boolean v8, v8, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableRecreateByResolution:Z

    .line 182
    .line 183
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v8, ", enableBFrameDecode:"

    .line 187
    .line 188
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 192
    .line 193
    iget-boolean v8, v8, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableBFrameDecode:Z

    .line 194
    .line 195
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    const-string v8, ", useAsyncMode:"

    .line 199
    .line 200
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-boolean v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 204
    .line 205
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v8, ", texturePlayoutMode:"

    .line 209
    .line 210
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 214
    .line 215
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string v8, ", directRenderMode:"

    .line 219
    .line 220
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    iget v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderMode:I

    .line 224
    .line 225
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    const-string v8, ", curEglContextNum:"

    .line 229
    .line 230
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    sget v8, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 234
    .line 235
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v7

    .line 242
    invoke-static {v5, v7}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    iget-object v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 246
    .line 247
    if-eqz v5, :cond_3

    .line 248
    .line 249
    const-string p1, "AndroidVideoDecoder"

    .line 250
    .line 251
    const-string p2, "initDecodeInternal called while the codec is already running"

    .line 252
    .line 253
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 257
    .line 258
    .line 259
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 260
    .line 261
    return-object p0

    .line 262
    :cond_3
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 263
    .line 264
    iput p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 265
    .line 266
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stride:I

    .line 267
    .line 268
    iput p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sliceHeight:I

    .line 269
    .line 270
    const/4 v5, 0x0

    .line 271
    iput-boolean v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 272
    .line 273
    iput-boolean v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 274
    .line 275
    const-wide/16 v7, 0x0

    .line 276
    .line 277
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 278
    .line 279
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 280
    .line 281
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 282
    .line 283
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 284
    .line 285
    const-wide/16 v7, -0x1

    .line 286
    .line 287
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 288
    .line 289
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 290
    .line 291
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 292
    .line 293
    invoke-virtual {v7}, Ljava/util/HashMap;->clear()V

    .line 294
    .line 295
    .line 296
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 297
    .line 298
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->vpassPrivateParams:Ljava/util/HashMap;

    .line 299
    .line 300
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 301
    .line 302
    .line 303
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 304
    .line 305
    invoke-virtual {v7, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 306
    .line 307
    .line 308
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackLock:Ljava/lang/Object;

    .line 309
    .line 310
    monitor-enter v7

    .line 311
    :try_start_0
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputBuffers:Ljava/util/LinkedList;

    .line 312
    .line 313
    invoke-virtual {v8}, Ljava/util/LinkedList;->clear()V

    .line 314
    .line 315
    .line 316
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 317
    :try_start_1
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->mediaCodecWrapperFactory:Lcom/bytedance/realx/video/MediaCodecWrapperFactory;

    .line 318
    .line 319
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 320
    .line 321
    invoke-interface {v7, v8}, Lcom/bytedance/realx/video/MediaCodecWrapperFactory;->createByCodecName(Ljava/lang/String;)Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 322
    .line 323
    .line 324
    move-result-object v7

    .line 325
    iput-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_4

    .line 326
    .line 327
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->updateCheckSysResolutionStatus()V

    .line 328
    .line 329
    .line 330
    iget-boolean v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableCheckSysResolutionSupport:Z

    .line 331
    .line 332
    if-eqz v7, :cond_4

    .line 333
    .line 334
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 335
    .line 336
    invoke-interface {v7}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 337
    .line 338
    .line 339
    move-result-object v7

    .line 340
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 341
    .line 342
    invoke-virtual {v8}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v8

    .line 346
    invoke-virtual {v7, v8}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 347
    .line 348
    .line 349
    move-result-object v7

    .line 350
    invoke-virtual {v7}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 351
    .line 352
    .line 353
    move-result-object v7

    .line 354
    invoke-virtual {v7, p1, p2}, Landroid/media/MediaCodecInfo$VideoCapabilities;->isSizeSupported(II)Z

    .line 355
    .line 356
    .line 357
    move-result v7

    .line 358
    if-nez v7, :cond_4

    .line 359
    .line 360
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 361
    .line 362
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V

    .line 363
    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 366
    .line 367
    .line 368
    const-string v0, "AndroidVideoDecoder"

    .line 369
    .line 370
    new-instance v1, Ljava/lang/StringBuilder;

    .line 371
    .line 372
    const-string v2, "isSizeSupported return false with the resolution:"

    .line 373
    .line 374
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    const-string v2, "xheight, fallback software"

    .line 381
    .line 382
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 393
    .line 394
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_OUT_OF_RESOLUTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 395
    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    .line 397
    .line 398
    const-string v2, "isSizeSupported return false with the resolution:"

    .line 399
    .line 400
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 404
    .line 405
    .line 406
    const-string p1, "x"

    .line 407
    .line 408
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    invoke-interface {p0, v0, p1}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 422
    .line 423
    return-object p0

    .line 424
    :cond_4
    const/4 v7, 0x0

    .line 425
    :try_start_2
    iget-object v8, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 426
    .line 427
    invoke-virtual {v8}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v8

    .line 431
    invoke-static {v8, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 432
    .line 433
    .line 434
    move-result-object v8

    .line 435
    invoke-direct {p0, v8}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->initMediaFormat(Landroid/media/MediaFormat;)V

    .line 436
    .line 437
    .line 438
    iget-boolean v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 439
    .line 440
    if-eqz v9, :cond_5

    .line 441
    .line 442
    new-instance v9, Landroid/os/HandlerThread;

    .line 443
    .line 444
    const-string v10, "asyncOutput"

    .line 445
    .line 446
    invoke-direct {v9, v10}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    iput-object v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 450
    .line 451
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    .line 452
    .line 453
    .line 454
    new-instance v9, Landroid/os/Handler;

    .line 455
    .line 456
    iget-object v10, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 457
    .line 458
    invoke-virtual {v10}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 459
    .line 460
    .line 461
    move-result-object v10

    .line 462
    invoke-direct {v9, v10}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 463
    .line 464
    .line 465
    iput-object v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncHandler:Landroid/os/Handler;

    .line 466
    .line 467
    iput-boolean v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 468
    .line 469
    iget-object v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 470
    .line 471
    invoke-virtual {v9}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 472
    .line 473
    .line 474
    iget-object v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 475
    .line 476
    iget-object v10, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncHandler:Landroid/os/Handler;

    .line 477
    .line 478
    invoke-interface {v9, p0, v10}, Lcom/bytedance/realx/video/MediaCodecWrapper;->setCallback(Landroid/media/MediaCodec$Callback;Landroid/os/Handler;)V

    .line 479
    .line 480
    .line 481
    :cond_5
    iget v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxExSurfaceRecreateDecoderCount:I

    .line 482
    .line 483
    const/4 v10, -0x1

    .line 484
    if-lt v9, v10, :cond_6

    .line 485
    .line 486
    iput-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 487
    .line 488
    :cond_6
    iget-object v10, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 489
    .line 490
    if-eqz v10, :cond_7

    .line 491
    .line 492
    iget-object v10, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 493
    .line 494
    if-eqz v10, :cond_7

    .line 495
    .line 496
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 497
    .line 498
    invoke-interface {v0, v8, v10, v7, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 499
    .line 500
    .line 501
    const-string v0, "AndroidVideoDecoder"

    .line 502
    .line 503
    new-instance v1, Ljava/lang/StringBuilder;

    .line 504
    .line 505
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 506
    .line 507
    .line 508
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 509
    .line 510
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 511
    .line 512
    .line 513
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    .line 519
    .line 520
    goto :goto_1

    .line 521
    :cond_7
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 522
    .line 523
    if-eqz v2, :cond_8

    .line 524
    .line 525
    add-int/2addr v9, v6

    .line 526
    iput v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxExSurfaceRecreateDecoderCount:I

    .line 527
    .line 528
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 529
    .line 530
    invoke-interface {v0, v8, v2, v7, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 531
    .line 532
    .line 533
    const-string v0, "AndroidVideoDecoder"

    .line 534
    .line 535
    new-instance v2, Ljava/lang/StringBuilder;

    .line 536
    .line 537
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 541
    .line 542
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 543
    .line 544
    .line 545
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v1

    .line 549
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    goto :goto_1

    .line 553
    :cond_8
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 554
    .line 555
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 556
    .line 557
    invoke-interface {v1, v8, v2, v7, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 558
    .line 559
    .line 560
    const-string v1, "AndroidVideoDecoder"

    .line 561
    .line 562
    new-instance v2, Ljava/lang/StringBuilder;

    .line 563
    .line 564
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 565
    .line 566
    .line 567
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 568
    .line 569
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    .line 578
    .line 579
    :goto_1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 580
    .line 581
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->start()V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .line 582
    .line 583
    .line 584
    goto/16 :goto_2

    .line 585
    .line 586
    :catch_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 587
    .line 588
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 589
    .line 590
    .line 591
    move-result-object v0

    .line 592
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 593
    .line 594
    invoke-virtual {v1}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object v1

    .line 598
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    const-string v1, "AndroidVideoDecoder"

    .line 603
    .line 604
    new-instance v2, Ljava/lang/StringBuilder;

    .line 605
    .line 606
    const-string v8, "current decoder SupportedHeights:"

    .line 607
    .line 608
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 609
    .line 610
    .line 611
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 612
    .line 613
    .line 614
    move-result-object v8

    .line 615
    invoke-virtual {v8}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedHeights()Landroid/util/Range;

    .line 616
    .line 617
    .line 618
    move-result-object v8

    .line 619
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 620
    .line 621
    .line 622
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    .line 628
    .line 629
    const-string v1, "AndroidVideoDecoder"

    .line 630
    .line 631
    new-instance v2, Ljava/lang/StringBuilder;

    .line 632
    .line 633
    const-string v8, "current decoder SupportedWidths:"

    .line 634
    .line 635
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 639
    .line 640
    .line 641
    move-result-object v8

    .line 642
    invoke-virtual {v8}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedWidths()Landroid/util/Range;

    .line 643
    .line 644
    .line 645
    move-result-object v8

    .line 646
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 647
    .line 648
    .line 649
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 650
    .line 651
    .line 652
    move-result-object v2

    .line 653
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    const-string v1, "AndroidVideoDecoder"

    .line 657
    .line 658
    new-instance v2, Ljava/lang/StringBuilder;

    .line 659
    .line 660
    const-string v8, "current decoder SupportedFrameRates:"

    .line 661
    .line 662
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 663
    .line 664
    .line 665
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 666
    .line 667
    .line 668
    move-result-object v8

    .line 669
    invoke-virtual {v8}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedFrameRates()Landroid/util/Range;

    .line 670
    .line 671
    .line 672
    move-result-object v8

    .line 673
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 674
    .line 675
    .line 676
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object v2

    .line 680
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 684
    .line 685
    .line 686
    move-result-object v1

    .line 687
    invoke-virtual {v1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedHeights()Landroid/util/Range;

    .line 688
    .line 689
    .line 690
    move-result-object v1

    .line 691
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 692
    .line 693
    .line 694
    move-result-object v2

    .line 695
    invoke-virtual {v1, v2}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    .line 696
    .line 697
    .line 698
    move-result v1

    .line 699
    if-eqz v1, :cond_10

    .line 700
    .line 701
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    .line 702
    .line 703
    .line 704
    move-result-object v0

    .line 705
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedWidths()Landroid/util/Range;

    .line 706
    .line 707
    .line 708
    move-result-object v0

    .line 709
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 710
    .line 711
    .line 712
    move-result-object v1

    .line 713
    invoke-virtual {v0, v1}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    .line 714
    .line 715
    .line 716
    move-result v0

    .line 717
    if-nez v0, :cond_9

    .line 718
    .line 719
    goto/16 :goto_6

    .line 720
    .line 721
    :cond_9
    const-string v0, "AndroidVideoDecoder"

    .line 722
    .line 723
    const-string v1, "initDecode Argument err, try reset Argument and reconfig"

    .line 724
    .line 725
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 726
    .line 727
    .line 728
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 729
    .line 730
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_EXCEPTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 731
    .line 732
    const-string v2, "initDecode Argument err, try reset Argument and reconfig"

    .line 733
    .line 734
    invoke-interface {v0, v1, v2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 735
    .line 736
    .line 737
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 738
    .line 739
    invoke-virtual {v0}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 740
    .line 741
    .line 742
    move-result-object v0

    .line 743
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 744
    .line 745
    .line 746
    move-result-object p1

    .line 747
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 748
    .line 749
    if-eqz p2, :cond_a

    .line 750
    .line 751
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 752
    .line 753
    iget-boolean p2, p2, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 754
    .line 755
    if-eqz p2, :cond_b

    .line 756
    .line 757
    :cond_a
    const-string p2, "color-format"

    .line 758
    .line 759
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 760
    .line 761
    invoke-virtual {p1, p2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 762
    .line 763
    .line 764
    :cond_b
    :try_start_3
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 765
    .line 766
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 767
    .line 768
    invoke-interface {p2, p1, v0, v7, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 769
    .line 770
    .line 771
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 772
    .line 773
    invoke-interface {p1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->start()V
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_2

    .line 774
    .line 775
    .line 776
    :goto_2
    iput v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxExSurfaceRecreateDecoderCount:I

    .line 777
    .line 778
    iget-boolean p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 779
    .line 780
    if-nez p1, :cond_c

    .line 781
    .line 782
    iput-boolean v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 783
    .line 784
    :try_start_4
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 785
    .line 786
    invoke-virtual {p1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->detachThread()V

    .line 787
    .line 788
    .line 789
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->createOutputThread()Ljava/lang/Thread;

    .line 790
    .line 791
    .line 792
    move-result-object p1

    .line 793
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 794
    .line 795
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 796
    .line 797
    .line 798
    goto :goto_3

    .line 799
    :catch_1
    move-exception p1

    .line 800
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 801
    .line 802
    invoke-interface {p2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V

    .line 803
    .line 804
    .line 805
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 806
    .line 807
    .line 808
    const-string p0, "AndroidVideoDecoder"

    .line 809
    .line 810
    const-string p2, "outputThread create err, fallback software:"

    .line 811
    .line 812
    invoke-static {p0, p2, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 813
    .line 814
    .line 815
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 816
    .line 817
    return-object p0

    .line 818
    :cond_c
    :goto_3
    iget p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderMode:I

    .line 819
    .line 820
    const/4 p2, 0x2

    .line 821
    if-ne p1, p2, :cond_d

    .line 822
    .line 823
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->createDirectRenderVSyncThread()V

    .line 824
    .line 825
    .line 826
    :cond_d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 827
    .line 828
    .line 829
    move-result-wide p1

    .line 830
    sub-long/2addr p1, v3

    .line 831
    const-string v0, "AndroidVideoDecoder"

    .line 832
    .line 833
    new-instance v1, Ljava/lang/StringBuilder;

    .line 834
    .line 835
    const-string v2, "initDecodeInternal done,init video decoder cost time:"

    .line 836
    .line 837
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 838
    .line 839
    .line 840
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 841
    .line 842
    .line 843
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 844
    .line 845
    .line 846
    move-result-object p1

    .line 847
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    .line 849
    .line 850
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 851
    .line 852
    if-eqz p1, :cond_e

    .line 853
    .line 854
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 855
    .line 856
    if-nez p2, :cond_e

    .line 857
    .line 858
    iput-boolean v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->usingInternalSurfaceLast:Z

    .line 859
    .line 860
    goto :goto_4

    .line 861
    :cond_e
    if-nez p1, :cond_f

    .line 862
    .line 863
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 864
    .line 865
    if-eqz p1, :cond_f

    .line 866
    .line 867
    iget-boolean p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->usingInternalSurfaceLast:Z

    .line 868
    .line 869
    if-nez p1, :cond_f

    .line 870
    .line 871
    iput-boolean v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->usingInternalSurfaceLast:Z

    .line 872
    .line 873
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 874
    .line 875
    sget-object p1, Lcom/bytedance/realx/video/VideoCodecStatus;->USING_INTERNAL_SURFACE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 876
    .line 877
    const-string p2, "using internal surface"

    .line 878
    .line 879
    invoke-interface {p0, p1, p2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 880
    .line 881
    .line 882
    :cond_f
    :goto_4
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 883
    .line 884
    return-object p0

    .line 885
    :catch_2
    move-exception p1

    .line 886
    goto :goto_5

    .line 887
    :catch_3
    move-exception p1

    .line 888
    :goto_5
    const-string p2, "AndroidVideoDecoder"

    .line 889
    .line 890
    new-instance v0, Ljava/lang/StringBuilder;

    .line 891
    .line 892
    const-string v1, "initDecode failed when retry config:"

    .line 893
    .line 894
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 895
    .line 896
    .line 897
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 898
    .line 899
    .line 900
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 901
    .line 902
    .line 903
    move-result-object v0

    .line 904
    invoke-static {p2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 905
    .line 906
    .line 907
    new-instance p2, Ljava/io/StringWriter;

    .line 908
    .line 909
    invoke-direct {p2}, Ljava/io/StringWriter;-><init>()V

    .line 910
    .line 911
    .line 912
    new-instance v0, Ljava/io/PrintWriter;

    .line 913
    .line 914
    invoke-direct {v0, p2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 915
    .line 916
    .line 917
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 918
    .line 919
    .line 920
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 921
    .line 922
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_EXCEPTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 923
    .line 924
    invoke-virtual {p2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 925
    .line 926
    .line 927
    move-result-object p2

    .line 928
    invoke-interface {p1, v0, p2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 929
    .line 930
    .line 931
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 932
    .line 933
    invoke-interface {p1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V

    .line 934
    .line 935
    .line 936
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 937
    .line 938
    .line 939
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 940
    .line 941
    return-object p0

    .line 942
    :cond_10
    :goto_6
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 943
    .line 944
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->MEDIACODEC_OUT_OF_RESOLUTION:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 945
    .line 946
    new-instance v2, Ljava/lang/StringBuilder;

    .line 947
    .line 948
    const-string v3, "hardware decoder not support the resolution:"

    .line 949
    .line 950
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 951
    .line 952
    .line 953
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 954
    .line 955
    .line 956
    const-string v3, "x"

    .line 957
    .line 958
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 959
    .line 960
    .line 961
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 962
    .line 963
    .line 964
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 965
    .line 966
    .line 967
    move-result-object p2

    .line 968
    invoke-interface {v0, v1, p2}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 969
    .line 970
    .line 971
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 972
    .line 973
    invoke-interface {p2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V

    .line 974
    .line 975
    .line 976
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 977
    .line 978
    .line 979
    const-string p0, "AndroidVideoDecoder"

    .line 980
    .line 981
    new-instance p2, Ljava/lang/StringBuilder;

    .line 982
    .line 983
    const-string v0, "initDecodeInternal err,decoder not support the resolution:"

    .line 984
    .line 985
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 986
    .line 987
    .line 988
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 989
    .line 990
    .line 991
    const-string p1, "xheight, fallback software"

    .line 992
    .line 993
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 994
    .line 995
    .line 996
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 997
    .line 998
    .line 999
    move-result-object p1

    .line 1000
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1001
    .line 1002
    .line 1003
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 1004
    .line 1005
    return-object p0

    .line 1006
    :catch_4
    const-string p1, "AndroidVideoDecoder"

    .line 1007
    .line 1008
    new-instance p2, Ljava/lang/StringBuilder;

    .line 1009
    .line 1010
    const-string v0, "Cannot create media decoder "

    .line 1011
    .line 1012
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1013
    .line 1014
    .line 1015
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 1016
    .line 1017
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1018
    .line 1019
    .line 1020
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1021
    .line 1022
    .line 1023
    move-result-object p2

    .line 1024
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1025
    .line 1026
    .line 1027
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 1028
    .line 1029
    .line 1030
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 1031
    .line 1032
    return-object p0

    .line 1033
    :catchall_0
    move-exception p0

    .line 1034
    :try_start_5
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1035
    throw p0
.end method

.method private initMediaFormat(Landroid/media/MediaFormat;)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 7
    .line 8
    const-string v3, "AndroidVideoDecoder"

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 13
    .line 14
    iget-boolean v2, v2, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    :cond_0
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v4, "init colorFormat is(I420:19):"

    .line 25
    .line 26
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 30
    .line 31
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 42
    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v4, "color-format"

    .line 48
    .line 49
    invoke-direct {p0, p1, v4, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    const-string v5, "max-height"

    .line 56
    .line 57
    const-string v6, "max-width"

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    invoke-interface {v2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecType:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 66
    .line 67
    invoke-virtual {v7}, Lcom/bytedance/realx/video/RXVideoCodecStandard;->mimeType()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-virtual {v2, v7}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-string v7, "adaptive-playback"

    .line 76
    .line 77
    invoke-virtual {v2, v7}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureSupported(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_3

    .line 82
    .line 83
    const-string v2, "width"

    .line 84
    .line 85
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-direct {p0, p1, v6, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setAdaptivePlaybackParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    .line 99
    const-string v2, "height"

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-direct {p0, p1, v5, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setAdaptivePlaybackParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_2

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_2
    move v0, v4

    .line 117
    :goto_0
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enable_adaptive_playback:Z

    .line 118
    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    invoke-virtual {p1, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_width:I

    .line 126
    .line 127
    invoke-virtual {p1, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iput v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_height:I

    .line 132
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string v2, "enable adaptive playback max_width: "

    .line 136
    .line 137
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_width:I

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v2, ", max_height: "

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_height:I

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-static {v3, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_3
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 163
    .line 164
    iget-boolean v2, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->outputByDts:Z

    .line 165
    .line 166
    if-eqz v2, :cond_5

    .line 167
    .line 168
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 169
    .line 170
    if-nez v0, :cond_5

    .line 171
    .line 172
    const-string v0, "low-latency"

    .line 173
    .line 174
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 175
    .line 176
    .line 177
    const-string v0, "vendor.qti-ext-dec-picture-order.enable"

    .line 178
    .line 179
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 180
    .line 181
    .line 182
    const-string v0, "vendor.qti-ext-dec-low-latency.enable"

    .line 183
    .line 184
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 185
    .line 186
    .line 187
    const-string v0, "vendor.rtc-ext-dec-low-latency.enable"

    .line 188
    .line 189
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 190
    .line 191
    .line 192
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 193
    .line 194
    iget v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 195
    .line 196
    if-ge v0, v2, :cond_4

    .line 197
    .line 198
    const-string v0, "vendor.hisi-ext-low-latency-video-dec.video-scene-for-low-latency-req"

    .line 199
    .line 200
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 201
    .line 202
    .line 203
    :cond_4
    const/4 v0, -0x1

    .line 204
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    const-string v2, "vendor.hisi-ext-low-latency-video-dec.video-scene-for-low-latency-rdy"

    .line 209
    .line 210
    invoke-direct {p0, p1, v2, v0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 211
    .line 212
    .line 213
    const-string v0, "fast-output-mode"

    .line 214
    .line 215
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 216
    .line 217
    .line 218
    const-string v0, "vendor.vdec.example-ext-dec-low-latency.enable"

    .line 219
    .line 220
    const-string v1, "true"

    .line 221
    .line 222
    invoke-direct {p0, p1, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->setStringParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    :cond_5
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 226
    .line 227
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_a

    .line 240
    .line 241
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Ljava/util/Map$Entry;

    .line 246
    .line 247
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    check-cast v2, Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-nez v2, :cond_6

    .line 258
    .line 259
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    check-cast v2, Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    if-eqz v2, :cond_7

    .line 270
    .line 271
    goto :goto_1

    .line 272
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    const-string v7, "set android hardware decoder private param with Key:"

    .line 275
    .line 276
    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v8

    .line 283
    check-cast v8, Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    const-string v8, " Value:"

    .line 289
    .line 290
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v9

    .line 297
    check-cast v9, Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    check-cast v2, Ljava/lang/String;

    .line 314
    .line 315
    const-string v9, "bytertc.hisi.decoder.endcode.enable"

    .line 316
    .line 317
    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v2

    .line 321
    if-eqz v2, :cond_8

    .line 322
    .line 323
    const-string v2, "0"

    .line 324
    .line 325
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object v9

    .line 329
    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v2

    .line 333
    if-eqz v2, :cond_8

    .line 334
    .line 335
    iput-boolean v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableHisiEndCode:Z

    .line 336
    .line 337
    const-string v1, "set android hardware decoder close hisi hw decoder endcode"

    .line 338
    .line 339
    invoke-static {v3, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    goto :goto_1

    .line 343
    :cond_8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v7

    .line 352
    check-cast v7, Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v7

    .line 364
    check-cast v7, Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    check-cast v2, Ljava/lang/String;

    .line 381
    .line 382
    invoke-direct {p0, v2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 383
    .line 384
    .line 385
    move-result v2

    .line 386
    if-eqz v2, :cond_9

    .line 387
    .line 388
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    check-cast v2, Ljava/lang/String;

    .line 393
    .line 394
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object v1

    .line 398
    check-cast v1, Ljava/lang/String;

    .line 399
    .line 400
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 401
    .line 402
    .line 403
    move-result v1

    .line 404
    invoke-virtual {p1, v2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 405
    .line 406
    .line 407
    goto/16 :goto_1

    .line 408
    .line 409
    :cond_9
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    check-cast v2, Ljava/lang/String;

    .line 414
    .line 415
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 416
    .line 417
    .line 418
    move-result v2

    .line 419
    if-lez v2, :cond_6

    .line 420
    .line 421
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    check-cast v2, Ljava/lang/String;

    .line 426
    .line 427
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    check-cast v1, Ljava/lang/String;

    .line 432
    .line 433
    invoke-virtual {p1, v2, v1}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    goto/16 :goto_1

    .line 437
    .line 438
    :cond_a
    return-void
.end method

.method private initOutSideSurfaceTextureHelper(II)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 0

    .line 1
    :try_start_0
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget p1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 8
    .line 9
    sget p2, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxEglContextNum:I

    .line 10
    .line 11
    if-ge p1, p2, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->createSurfaceTextureHelper()Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->initSurfaceTextureHelper(Lcom/bytedance/realx/video/SurfaceTextureHelper;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    :cond_0
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 28
    .line 29
    return-object p0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string p2, "err when create surface:"

    .line 34
    .line 35
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "AndroidVideoDecoder"

    .line 46
    .line 47
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 51
    .line 52
    return-object p0
.end method

.method private initSurfaceTextureHelper()Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAGFXSurfaceTextureHelper:Z

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 16
    .line 17
    iget-boolean v1, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    sget v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 22
    .line 23
    sget v2, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxEglContextNum:I

    .line 24
    .line 25
    if-ge v1, v2, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSurfaceTextureReuse:Z

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->createSurfaceTextureHelper()Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p0, v0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->initSurfaceTextureHelper(Lcom/bytedance/realx/video/SurfaceTextureHelper;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    :cond_2
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 46
    .line 47
    return-object p0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v1, "err when create surface:"

    .line 52
    .line 53
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "AndroidVideoDecoder"

    .line 64
    .line 65
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 69
    .line 70
    return-object p0
.end method

.method private isNumeric(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "[0-9]+"

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private isSupportedColorFormat(I)Z
    .locals 4

    .line 1
    sget-object p0, Lcom/bytedance/realx/video/MediaCodecUtils;->DECODER_COLOR_FORMATS:[I

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget v3, p0, v2

    .line 9
    .line 10
    if-ne v3, p1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return v1
.end method

.method private reformat(Landroid/media/MediaFormat;)V
    .locals 7

    .line 1
    const-string v0, "Frame stride and slice height: "

    .line 2
    .line 3
    const-string v1, "Unexpected size change. Configured "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    const-string v2, "crop-left"

    .line 11
    .line 12
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    const-string v2, "crop-right"

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const-string v2, "crop-bottom"

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    const-string v2, "crop-top"

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    const-string v2, "crop-right"

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    const-string v3, "crop-left"

    .line 51
    .line 52
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v2, v3

    .line 57
    const-string v3, "crop-bottom"

    .line 58
    .line 59
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    add-int/lit8 v3, v3, 0x1

    .line 64
    .line 65
    const-string v4, "crop-top"

    .line 66
    .line 67
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    sub-int/2addr v3, v4

    .line 72
    const-string v4, "AndroidVideoDecoder"

    .line 73
    .line 74
    new-instance v5, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v6, "stream have crop info newWidth:"

    .line 77
    .line 78
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v6, " newHeight:"

    .line 85
    .line 86
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-static {v4, v5}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_0
    const-string v2, "width"

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    const-string v3, "height"

    .line 107
    .line 108
    invoke-virtual {p1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    :goto_0
    iget-object v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 113
    .line 114
    monitor-enter v4

    .line 115
    :try_start_0
    iget-boolean v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->hasDecodedFirstFrame:Z

    .line 116
    .line 117
    if-eqz v5, :cond_2

    .line 118
    .line 119
    iget v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 120
    .line 121
    if-ne v5, v2, :cond_1

    .line 122
    .line 123
    iget v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 124
    .line 125
    if-eq v5, v3, :cond_2

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :catchall_0
    move-exception p0

    .line 129
    goto/16 :goto_4

    .line 130
    .line 131
    :cond_1
    :goto_1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 132
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "*"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ". New "

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v1, "*"

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stopOnOutputThread(Ljava/lang/Exception;)V

    .line 177
    .line 178
    .line 179
    monitor-exit v4

    .line 180
    return-void

    .line 181
    :cond_2
    iput v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 182
    .line 183
    iput v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 184
    .line 185
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 187
    .line 188
    if-nez v1, :cond_3

    .line 189
    .line 190
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outSideSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 191
    .line 192
    if-nez v1, :cond_3

    .line 193
    .line 194
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 195
    .line 196
    if-eqz v1, :cond_4

    .line 197
    .line 198
    :cond_3
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 199
    .line 200
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 201
    .line 202
    if-eqz v1, :cond_5

    .line 203
    .line 204
    :cond_4
    const-string v1, "color-format"

    .line 205
    .line 206
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-eqz v1, :cond_5

    .line 211
    .line 212
    const-string v1, "color-format"

    .line 213
    .line 214
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 219
    .line 220
    const-string v1, "AndroidVideoDecoder"

    .line 221
    .line 222
    new-instance v2, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string v3, "Color: 0x"

    .line 225
    .line 226
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    iget v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 230
    .line 231
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 246
    .line 247
    invoke-direct {p0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isSupportedColorFormat(I)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_5

    .line 252
    .line 253
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 254
    .line 255
    new-instance v0, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    const-string v1, "Unsupported color format: "

    .line 258
    .line 259
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    iget v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->colorFormat:I

    .line 263
    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-direct {p0, p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stopOnOutputThread(Ljava/lang/Exception;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_5
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 279
    .line 280
    monitor-enter v1

    .line 281
    :try_start_1
    const-string v2, "stride"

    .line 282
    .line 283
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    if-eqz v2, :cond_6

    .line 288
    .line 289
    const-string v2, "stride"

    .line 290
    .line 291
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    iput v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stride:I

    .line 296
    .line 297
    goto :goto_2

    .line 298
    :catchall_1
    move-exception p0

    .line 299
    goto :goto_3

    .line 300
    :cond_6
    :goto_2
    const-string v2, "slice-height"

    .line 301
    .line 302
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    if-eqz v2, :cond_7

    .line 307
    .line 308
    const-string v2, "slice-height"

    .line 309
    .line 310
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sliceHeight:I

    .line 315
    .line 316
    :cond_7
    const-string p1, "AndroidVideoDecoder"

    .line 317
    .line 318
    new-instance v2, Ljava/lang/StringBuilder;

    .line 319
    .line 320
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stride:I

    .line 324
    .line 325
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    const-string v0, " x "

    .line 329
    .line 330
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sliceHeight:I

    .line 334
    .line 335
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    iget p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 346
    .line 347
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stride:I

    .line 348
    .line 349
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 350
    .line 351
    .line 352
    move-result p1

    .line 353
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->stride:I

    .line 354
    .line 355
    iget p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 356
    .line 357
    iget v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sliceHeight:I

    .line 358
    .line 359
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 360
    .line 361
    .line 362
    move-result p1

    .line 363
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sliceHeight:I

    .line 364
    .line 365
    monitor-exit v1

    .line 366
    return-void

    .line 367
    :goto_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 368
    throw p0

    .line 369
    :goto_4
    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 370
    throw p0
.end method

.method private reinitDecode(II)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseInternal()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 6
    .line 7
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSurfaceTextureReuse:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    const-string p0, "AndroidVideoDecoder"

    .line 19
    .line 20
    const-string p1, "releaseInternal err"

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    const/4 v2, 0x2

    .line 30
    if-ge v1, v2, :cond_3

    .line 31
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->initDecodeInternal(II)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v2, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 37
    .line 38
    if-ne v2, v0, :cond_2

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_2
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    return-object v0
.end method

.method private releaseCodecOnOutputThread()V
    .locals 3

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    const-string v1, "thread check err"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const-string v1, "Releasing MediaCodec on output thread"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 20
    .line 21
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 22
    .line 23
    .line 24
    goto :goto_1

    .line 25
    :catch_1
    move-exception v1

    .line 26
    const-string v2, "Media decoder stop failed"

    .line 27
    .line 28
    invoke-static {v0, v2, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :goto_1
    :try_start_2
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 32
    .line 33
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->release()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :catch_2
    move-exception v1

    .line 38
    const-string v2, "Media decoder release failed"

    .line 39
    .line 40
    invoke-static {v0, v2, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 44
    .line 45
    :goto_2
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 46
    .line 47
    .line 48
    const-string p0, "Release on output thread done"

    .line 49
    .line 50
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private releaseInternal()Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    const-string v1, "AndroidVideoDecoder"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "release: Decoder is not running."

    .line 8
    .line 9
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-wide/16 v2, 0x1770

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :try_start_0
    iget-object v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderThread:Ljava/lang/Thread;

    .line 19
    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    invoke-virtual {v4, v2, v3}, Ljava/lang/Thread;->join(J)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderThread:Ljava/lang/Thread;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception v4

    .line 29
    const-string v5, "directRenderThread join error"

    .line 30
    .line 31
    invoke-static {v1, v5, v4}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    iget-boolean v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 35
    .line 36
    const-string v5, "Media decoder release timeout"

    .line 37
    .line 38
    const/4 v6, 0x0

    .line 39
    if-eqz v4, :cond_4

    .line 40
    .line 41
    sget-object v4, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 42
    .line 43
    iput-boolean v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 44
    .line 45
    iget-object v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 46
    .line 47
    if-eqz v6, :cond_3

    .line 48
    .line 49
    iget-object v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncHandler:Landroid/os/Handler;

    .line 50
    .line 51
    new-instance v8, Lcom/bytedance/realx/video/a;

    .line 52
    .line 53
    invoke-direct {v8, p0, v6}, Lcom/bytedance/realx/video/a;-><init>(Lcom/bytedance/realx/video/AndroidVideoDecoder;Landroid/os/HandlerThread;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    iget-object v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 60
    .line 61
    invoke-static {v6, v2, v3}, Lcom/bytedance/realx/base/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    new-instance v2, Ljava/lang/RuntimeException;

    .line 68
    .line 69
    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v5, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    sget-object v4, Lcom/bytedance/realx/video/VideoCodecStatus;->TIMEOUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 76
    .line 77
    :cond_2
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncOutputThread:Landroid/os/HandlerThread;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->asyncHandler:Landroid/os/Handler;

    .line 80
    .line 81
    :cond_3
    return-object v4

    .line 82
    :cond_4
    :try_start_1
    iput-boolean v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 83
    .line 84
    iget-object v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 85
    .line 86
    invoke-static {v4, v2, v3}, Lcom/bytedance/realx/base/ThreadUtils;->joinUninterruptibly(Ljava/lang/Thread;J)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-nez v2, :cond_5

    .line 91
    .line 92
    new-instance v2, Ljava/lang/RuntimeException;

    .line 93
    .line 94
    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-static {v1, v5, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    sget-object v1, Lcom/bytedance/realx/video/VideoCodecStatus;->TIMEOUT:Lcom/bytedance/realx/video/VideoCodecStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    .line 102
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 103
    .line 104
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 105
    .line 106
    return-object v1

    .line 107
    :catchall_0
    move-exception v1

    .line 108
    goto :goto_1

    .line 109
    :cond_5
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 112
    .line 113
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 114
    .line 115
    if-eqz v2, :cond_6

    .line 116
    .line 117
    new-instance v2, Ljava/lang/RuntimeException;

    .line 118
    .line 119
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 120
    .line 121
    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    const-string v3, "Media decoder release error"

    .line 125
    .line 126
    invoke-static {v1, v3, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 130
    .line 131
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_6
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 135
    .line 136
    return-object p0

    .line 137
    :goto_1
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 138
    .line 139
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThread:Ljava/lang/Thread;

    .line 140
    .line 141
    throw v1
.end method

.method private setAdaptivePlaybackParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, "AndroidVideoDecoder"

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/util/Map$Entry;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    check-cast v4, Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {p0, v4}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_0

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    invoke-static {p0, p2}, Ljava/lang/Math;->max(II)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    const/16 p2, 0x2328

    .line 69
    .line 70
    const-string v0, "}"

    .line 71
    .line 72
    const-string v4, ", resoluion: "

    .line 73
    .line 74
    const-string v5, " {privateConfig: "

    .line 75
    .line 76
    if-gt p0, p2, :cond_1

    .line 77
    .line 78
    if-lez p0, :cond_1

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    check-cast p2, Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p1, p2, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    new-instance p0, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p1, "setAdaptivePlaybackParam params key: "

    .line 92
    .line 93
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p1, ", value:"

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    check-cast p1, Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {v3, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    const/4 p0, 0x1

    .line 164
    return p0

    .line 165
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string p2, "setAdaptivePlaybackParam failed! exceeding the valid range(0, 10000], key: "

    .line 168
    .line 169
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    check-cast p2, Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string p2, ", value: "

    .line 182
    .line 183
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    check-cast p0, Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {v3, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return v2

    .line 222
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string p1, "setAdaptivePlaybackParam, but private key isn\'t setted, params: "

    .line 225
    .line 226
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-static {v3, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    return v2
.end method

.method private setIntegerParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "AndroidVideoDecoder"

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {p0, v3}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    const-string v4, "the decoder params "

    .line 48
    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    check-cast p3, Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p1, p3, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    check-cast p3, Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p3, " is coverd by vpaas with value:"

    .line 85
    .line 86
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    check-cast p3, Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 106
    .line 107
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 112
    .line 113
    invoke-virtual {v3, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-lez v3, :cond_2

    .line 127
    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    check-cast v4, Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v4, " set by vpaas is invalid with value:"

    .line 143
    .line 144
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    check-cast v1, Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v1, ",skip it"

    .line 157
    .line 158
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string p1, " is disabled by vpaas,skip it"

    .line 185
    .line 186
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v0, "decoder int params has been set with Key:"

    .line 200
    .line 201
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v0, " Value:"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    invoke-virtual {p1, p2, p0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method private setStringParam(Landroid/media/MediaFormat;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "AndroidVideoDecoder"

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/Map$Entry;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    check-cast p3, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    const-string v0, "the decoder params "

    .line 48
    .line 49
    if-lez p3, :cond_1

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    check-cast p3, Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, p3, v3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    check-cast p3, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p3, " is coverd by vpaas with value:"

    .line 81
    .line 82
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    check-cast p3, Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    check-cast p3, Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string p3, " is disabled by vpaas,skip it"

    .line 117
    .line 118
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :goto_0
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 129
    .line 130
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v0, "decoder string params has been set with Key:"

    .line 137
    .line 138
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v0, " Value:"

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method private smoothOutputFrame()V
    .locals 11

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentOutputTime:J

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 8
    .line 9
    iget-wide v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 10
    .line 11
    cmp-long v2, v2, v4

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    iput-wide v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 16
    .line 17
    :cond_0
    iget-wide v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 18
    .line 19
    const-wide/16 v4, 0x0

    .line 20
    .line 21
    cmp-long v6, v2, v4

    .line 22
    .line 23
    iget-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 24
    .line 25
    if-gez v6, :cond_1

    .line 26
    .line 27
    iput-wide v7, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    cmp-long v6, v2, v7

    .line 31
    .line 32
    if-lez v6, :cond_2

    .line 33
    .line 34
    cmp-long v6, v7, v4

    .line 35
    .line 36
    if-ltz v6, :cond_2

    .line 37
    .line 38
    move-wide v2, v7

    .line 39
    :cond_2
    iput-wide v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 40
    .line 41
    :goto_0
    iget-wide v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->lastOutputTime:J

    .line 42
    .line 43
    sub-long/2addr v0, v2

    .line 44
    iget-wide v6, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->avgInputTimeDelta:J

    .line 45
    .line 46
    cmp-long v8, v6, v4

    .line 47
    .line 48
    iget-wide v9, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentInputTimeDelta:J

    .line 49
    .line 50
    if-gtz v8, :cond_4

    .line 51
    .line 52
    cmp-long v6, v9, v4

    .line 53
    .line 54
    if-lez v6, :cond_3

    .line 55
    .line 56
    :goto_1
    move-wide v6, v9

    .line 57
    goto :goto_2

    .line 58
    :cond_3
    const-wide/16 v6, 0x10

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_4
    cmp-long v8, v9, v6

    .line 62
    .line 63
    if-ltz v8, :cond_5

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_5
    const-wide/16 v6, 0xa

    .line 67
    .line 68
    cmp-long v8, v9, v6

    .line 69
    .line 70
    if-lez v8, :cond_6

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_6
    :goto_2
    cmp-long v2, v2, v4

    .line 74
    .line 75
    if-lez v2, :cond_9

    .line 76
    .line 77
    cmp-long v2, v0, v6

    .line 78
    .line 79
    if-gez v2, :cond_9

    .line 80
    .line 81
    sub-long/2addr v6, v0

    .line 82
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 83
    .line 84
    iget-wide v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 85
    .line 86
    cmp-long v0, v0, v2

    .line 87
    .line 88
    if-lez v0, :cond_7

    .line 89
    .line 90
    const-wide/16 v0, 0x2

    .line 91
    .line 92
    div-long/2addr v6, v0

    .line 93
    :cond_7
    const-wide/16 v0, 0x514

    .line 94
    .line 95
    cmp-long v2, v6, v0

    .line 96
    .line 97
    if-lez v2, :cond_8

    .line 98
    .line 99
    move-wide v6, v0

    .line 100
    :cond_8
    cmp-long v0, v6, v4

    .line 101
    .line 102
    if-lez v0, :cond_9

    .line 103
    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->smoothOutputLock:Ljava/lang/Object;

    .line 105
    .line 106
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->smoothOutputLock:Ljava/lang/Object;

    .line 108
    .line 109
    invoke-virtual {v1, v6, v7}, Ljava/lang/Object;->wait(J)V

    .line 110
    .line 111
    .line 112
    monitor-exit v0

    .line 113
    goto :goto_3

    .line 114
    :catchall_0
    move-exception v1

    .line 115
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    :try_start_2
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 117
    :catch_0
    move-exception v0

    .line 118
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 119
    .line 120
    .line 121
    :cond_9
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->lastOutputTime:J

    .line 126
    .line 127
    return-void
.end method

.method private stopOnOutputThread(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 19
    .line 20
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->shutdownException:Ljava/lang/Exception;

    .line 21
    .line 22
    return-void
.end method

.method private updateCheckSysResolutionStatus()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->privateParams:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/lang/String;

    .line 28
    .line 29
    const-string v3, "bytertc.check.sys.resolution.support.enable"

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "0"

    .line 42
    .line 43
    const-string v4, "AndroidVideoDecoder"

    .line 44
    .line 45
    if-ne v2, v3, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableCheckSysResolutionSupport:Z

    .line 49
    .line 50
    const-string v1, "set android hardware decoder close check sys resolution support"

    .line 51
    .line 52
    invoke-static {v4, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v2, "1"

    .line 61
    .line 62
    if-ne v1, v2, :cond_0

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    iput-boolean v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableCheckSysResolutionSupport:Z

    .line 66
    .line 67
    const-string v1, "set android hardware decoder open check sys resolution support"

    .line 68
    .line 69
    invoke-static {v4, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    return-void
.end method


# virtual methods
.method public allocateI420Buffer(II)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;
    .locals 2

    .line 1
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kI420:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    invoke-static {p1, p2, p0, v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXByteMemory;->createRXByteMemory(IILcom/bytedance/realx/video/RXPixelFormat;J)Lcom/bytedance/realx/video/memory/NativeRXByteMemory;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/bytedance/realx/video/YuvHelper;->copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public createSurfaceTextureHelper()Lcom/bytedance/realx/video/SurfaceTextureHelper;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAGFXSurfaceTextureHelper:Z

    .line 4
    .line 5
    const-string v1, "decoder-texture-thread"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {v1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->createWithAGFX(Ljava/lang/String;)Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 15
    .line 16
    invoke-static {v1, p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;)Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public decode(Lcom/bytedance/realx/video/EncodedImage;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "decode uninitalized, codec: "

    .line 6
    .line 7
    const-string v3, "resolution changed, try to reinit decoder. enable_adaptive_playback: "

    .line 8
    .line 9
    const-string v4, "frame resolution("

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v5

    .line 15
    iget-wide v7, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->lastInputTime:J

    .line 16
    .line 17
    const-wide/16 v9, 0x0

    .line 18
    .line 19
    cmp-long v11, v7, v9

    .line 20
    .line 21
    if-lez v11, :cond_0

    .line 22
    .line 23
    sub-long v7, v5, v7

    .line 24
    .line 25
    iput-wide v7, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentInputTimeDelta:J

    .line 26
    .line 27
    :cond_0
    iput-wide v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->lastInputTime:J

    .line 28
    .line 29
    iget-wide v7, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->packetCount2s:J

    .line 30
    .line 31
    const-wide/16 v11, 0x1

    .line 32
    .line 33
    add-long/2addr v7, v11

    .line 34
    iput-wide v7, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->packetCount2s:J

    .line 35
    .line 36
    iget-wide v13, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->timeForAvg:J

    .line 37
    .line 38
    cmp-long v13, v9, v13

    .line 39
    .line 40
    if-nez v13, :cond_1

    .line 41
    .line 42
    iput-wide v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->timeForAvg:J

    .line 43
    .line 44
    :cond_1
    iget-wide v13, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->timeForAvg:J

    .line 45
    .line 46
    sub-long v15, v5, v13

    .line 47
    .line 48
    const-wide/16 v17, 0x7d0

    .line 49
    .line 50
    cmp-long v15, v15, v17

    .line 51
    .line 52
    if-ltz v15, :cond_2

    .line 53
    .line 54
    cmp-long v15, v7, v9

    .line 55
    .line 56
    if-lez v15, :cond_2

    .line 57
    .line 58
    sub-long v13, v5, v13

    .line 59
    .line 60
    div-long/2addr v13, v7

    .line 61
    iput-wide v13, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->avgInputTimeDelta:J

    .line 62
    .line 63
    iput-wide v9, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->packetCount2s:J

    .line 64
    .line 65
    iput-wide v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->timeForAvg:J

    .line 66
    .line 67
    :cond_2
    iget-object v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_3

    .line 74
    .line 75
    const-string v0, "AndroidVideoDecoder"

    .line 76
    .line 77
    const-string v1, "mediacodec error."

    .line 78
    .line 79
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 83
    .line 84
    return-object v0

    .line 85
    :cond_3
    :try_start_0
    iget v5, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 86
    .line 87
    iget v6, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_width:I

    .line 88
    .line 89
    const/4 v7, 0x1

    .line 90
    const/4 v8, 0x0

    .line 91
    if-ne v5, v6, :cond_4

    .line 92
    .line 93
    iget v6, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 94
    .line 95
    iget v13, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_height:I

    .line 96
    .line 97
    if-eq v6, v13, :cond_a

    .line 98
    .line 99
    :cond_4
    iget-object v6, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 100
    .line 101
    if-eqz v6, :cond_6

    .line 102
    .line 103
    iget-boolean v6, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enable_adaptive_playback:Z

    .line 104
    .line 105
    if-eqz v6, :cond_6

    .line 106
    .line 107
    iget v6, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_width:I

    .line 108
    .line 109
    if-gt v5, v6, :cond_5

    .line 110
    .line 111
    iget v5, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 112
    .line 113
    iget v6, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_height:I

    .line 114
    .line 115
    if-le v5, v6, :cond_6

    .line 116
    .line 117
    :cond_5
    const-string v5, "AndroidVideoDecoder"

    .line 118
    .line 119
    new-instance v6, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget v4, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 125
    .line 126
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v4, "*"

    .line 130
    .line 131
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    iget v4, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 135
    .line 136
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v4, " exceeded maximum limit of adaptive playback max_width: "

    .line 140
    .line 141
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_width:I

    .line 145
    .line 146
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v4, ", max_height: "

    .line 150
    .line 151
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->adaptive_playback_max_height:I

    .line 155
    .line 156
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-static {v5, v4}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    iput-boolean v8, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enable_adaptive_playback:Z

    .line 167
    .line 168
    :cond_6
    const-string v4, "AndroidVideoDecoder"

    .line 169
    .line 170
    new-instance v5, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iget-boolean v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enable_adaptive_playback:Z

    .line 176
    .line 177
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string v3, ", is first init: "

    .line 181
    .line 182
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    iget v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_width:I

    .line 186
    .line 187
    if-nez v3, :cond_7

    .line 188
    .line 189
    move v3, v7

    .line 190
    goto :goto_0

    .line 191
    :cond_7
    move v3, v8

    .line 192
    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v3, ", new width: "

    .line 196
    .line 197
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    iget v3, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 201
    .line 202
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string v3, ", new height: "

    .line 206
    .line 207
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    iget v3, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 211
    .line 212
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    invoke-static {v4, v3}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_width:I

    .line 223
    .line 224
    if-eqz v3, :cond_8

    .line 225
    .line 226
    iget-boolean v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enable_adaptive_playback:Z

    .line 227
    .line 228
    if-nez v3, :cond_9

    .line 229
    .line 230
    :cond_8
    iget v3, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 231
    .line 232
    iget v4, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 233
    .line 234
    invoke-direct {v1, v3, v4}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->reinitDecode(II)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    sget-object v4, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 239
    .line 240
    if-eq v3, v4, :cond_9

    .line 241
    .line 242
    return-object v3

    .line 243
    :cond_9
    iget-object v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dimensionLock:Ljava/lang/Object;

    .line 244
    .line 245
    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 246
    :try_start_1
    iget v4, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 247
    .line 248
    iput v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_width:I

    .line 249
    .line 250
    iget v5, v0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 251
    .line 252
    iput v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_height:I

    .line 253
    .line 254
    iput v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->width:I

    .line 255
    .line 256
    iput v5, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->height:I

    .line 257
    .line 258
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 259
    :cond_a
    :try_start_2
    iget-object v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 260
    .line 261
    if-eqz v3, :cond_15

    .line 262
    .line 263
    iget-object v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 264
    .line 265
    if-nez v3, :cond_b

    .line 266
    .line 267
    goto/16 :goto_4

    .line 268
    .line 269
    :cond_b
    iget-object v2, v0, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 270
    .line 271
    if-nez v2, :cond_c

    .line 272
    .line 273
    const-string v0, "AndroidVideoDecoder"

    .line 274
    .line 275
    const-string v1, "decode() - no input data"

    .line 276
    .line 277
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERR_PARAMETER:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 281
    .line 282
    return-object v0

    .line 283
    :cond_c
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    if-nez v2, :cond_d

    .line 288
    .line 289
    const-string v0, "AndroidVideoDecoder"

    .line 290
    .line 291
    const-string v1, "decode() - input buffer empty"

    .line 292
    .line 293
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERR_PARAMETER:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 297
    .line 298
    return-object v0

    .line 299
    :cond_d
    iget-boolean v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 300
    .line 301
    if-eqz v2, :cond_f

    .line 302
    .line 303
    iget-object v2, v0, Lcom/bytedance/realx/video/EncodedImage;->frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 304
    .line 305
    sget-object v3, Lcom/bytedance/realx/video/EncodedImage$FrameType;->kIntra:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 306
    .line 307
    if-eq v2, v3, :cond_e

    .line 308
    .line 309
    const-string v0, "AndroidVideoDecoder"

    .line 310
    .line 311
    const-string v1, "decode() - key frame required first"

    .line 312
    .line 313
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->NO_OUTPUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 317
    .line 318
    return-object v0

    .line 319
    :cond_e
    iget-boolean v2, v0, Lcom/bytedance/realx/video/EncodedImage;->completeFrame:Z

    .line 320
    .line 321
    if-nez v2, :cond_f

    .line 322
    .line 323
    const-string v0, "AndroidVideoDecoder"

    .line 324
    .line 325
    const-string v1, "decode() - complete frame required first"

    .line 326
    .line 327
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->NO_OUTPUT:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 331
    .line 332
    return-object v0

    .line 333
    :cond_f
    sget-object v2, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 334
    .line 335
    iget-boolean v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 336
    .line 337
    if-eqz v2, :cond_10

    .line 338
    .line 339
    invoke-direct/range {p0 .. p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->feedInputBufferAsync(Lcom/bytedance/realx/video/EncodedImage;)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    goto :goto_1

    .line 344
    :cond_10
    invoke-direct/range {p0 .. p1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->feedInputBufferSync(Lcom/bytedance/realx/video/EncodedImage;)Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    :goto_1
    sget-object v2, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 349
    .line 350
    if-eq v0, v2, :cond_11

    .line 351
    .line 352
    return-object v0

    .line 353
    :cond_11
    iget-boolean v0, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 354
    .line 355
    if-eqz v0, :cond_12

    .line 356
    .line 357
    iput-boolean v8, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->keyFrameRequired:Z

    .line 358
    .line 359
    :cond_12
    iget-object v0, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 360
    .line 361
    iget-boolean v2, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSmoothOutput:Z

    .line 362
    .line 363
    if-eqz v2, :cond_14

    .line 364
    .line 365
    iget-boolean v2, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 366
    .line 367
    if-nez v2, :cond_14

    .line 368
    .line 369
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableBFrameDecode:Z

    .line 370
    .line 371
    if-nez v0, :cond_14

    .line 372
    .line 373
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 374
    .line 375
    iget-wide v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputFrameCount:J

    .line 376
    .line 377
    sub-long/2addr v2, v4

    .line 378
    cmp-long v0, v2, v9

    .line 379
    .line 380
    if-lez v0, :cond_13

    .line 381
    .line 382
    goto :goto_2

    .line 383
    :cond_13
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 384
    .line 385
    :goto_2
    iput-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 386
    .line 387
    iget-wide v4, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 388
    .line 389
    cmp-long v0, v4, v9

    .line 390
    .line 391
    if-ltz v0, :cond_14

    .line 392
    .line 393
    cmp-long v0, v2, v4

    .line 394
    .line 395
    if-lez v0, :cond_14

    .line 396
    .line 397
    :try_start_3
    iget-object v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->smoothOutputLock:Ljava/lang/Object;

    .line 398
    .line 399
    monitor-enter v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 400
    :try_start_4
    iget-object v0, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->smoothOutputLock:Ljava/lang/Object;

    .line 401
    .line 402
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 403
    .line 404
    .line 405
    monitor-exit v2

    .line 406
    goto :goto_3

    .line 407
    :catchall_0
    move-exception v0

    .line 408
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 409
    :try_start_5
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 410
    :catch_0
    :try_start_6
    const-string v0, "AndroidVideoDecoder"

    .line 411
    .line 412
    new-instance v2, Ljava/lang/StringBuilder;

    .line 413
    .line 414
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 415
    .line 416
    .line 417
    const-string v3, "currentFrameCache:"

    .line 418
    .line 419
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    iget-wide v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->currentFrameCache:J

    .line 423
    .line 424
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v3, " minFrameCache:"

    .line 428
    .line 429
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    iget-wide v3, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minFrameCache:J

    .line 433
    .line 434
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    :cond_14
    :goto_3
    iget-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 445
    .line 446
    add-long/2addr v2, v11

    .line 447
    iput-wide v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputFrameCount:J

    .line 448
    .line 449
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 450
    .line 451
    return-object v0

    .line 452
    :cond_15
    :goto_4
    const-string v0, "AndroidVideoDecoder"

    .line 453
    .line 454
    new-instance v3, Ljava/lang/StringBuilder;

    .line 455
    .line 456
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    iget-object v2, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 460
    .line 461
    if-eqz v2, :cond_16

    .line 462
    .line 463
    goto :goto_5

    .line 464
    :cond_16
    move v7, v8

    .line 465
    :goto_5
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    const-string v2, ", callback: "

    .line 469
    .line 470
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    iget-object v1, v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 474
    .line 475
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->UNINITIALIZED:Lcom/bytedance/realx/video/VideoCodecStatus;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 486
    .line 487
    return-object v0

    .line 488
    :catchall_1
    move-exception v0

    .line 489
    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 490
    :try_start_8
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 491
    :catch_1
    move-exception v0

    .line 492
    const-string v1, "AndroidVideoDecoder"

    .line 493
    .line 494
    const-string v2, "android decode err"

    .line 495
    .line 496
    invoke-static {v1, v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 497
    .line 498
    .line 499
    sget-object v0, Lcom/bytedance/realx/video/VideoCodecStatus;->ERROR:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 500
    .line 501
    return-object v0
.end method

.method public deliverDecodedFrame()V
    .locals 6

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "dequeueOutputBuffer err, returned "

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->outputThreadChecker:Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/bytedance/realx/base/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string p0, "codec is null when call deliverDecodedFrame"

    .line 15
    .line 16
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v2, Landroid/media/MediaCodec$BufferInfo;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 28
    .line 29
    iget-boolean v4, v4, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 30
    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    const-wide/16 v4, 0x61a8

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-wide/32 v4, 0x186a0

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-interface {v3, v2, v4, v5}, Lcom/bytedance/realx/video/MediaCodecWrapper;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, -0x2

    .line 44
    if-ne v3, v4, :cond_2

    .line 45
    .line 46
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 47
    .line 48
    invoke-interface {v1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getOutputFormat()Landroid/media/MediaFormat;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {p0, v1}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->reformat(Landroid/media/MediaFormat;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    if-gez v3, :cond_3

    .line 57
    .line 58
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    invoke-direct {p0, v2, v3}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->drainOutputFrame(Landroid/media/MediaCodec$BufferInfo;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    const-string p0, "deliverDecodedFrame failed"

    .line 79
    .line 80
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public disableExternalSurface()V
    .locals 2

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "disable external surface."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 10
    .line 11
    return-void
.end method

.method public getImplementationName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codecName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrefersLateDecoding()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public initDecode(Lcom/bytedance/realx/video/VideoDecoder$Settings;Lcom/bytedance/realx/video/VideoDecoder$Callback;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 4
    .line 5
    iget-object p2, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iput-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 10
    .line 11
    :cond_0
    iget-boolean p2, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAsyncMode:Z

    .line 12
    .line 13
    iput-boolean p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useAsyncMode:Z

    .line 14
    .line 15
    iget p2, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->directRenderMode:I

    .line 16
    .line 17
    iput p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->directRenderMode:I

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-ne p2, v0, :cond_1

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget p1, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->texturePlayoutMode:I

    .line 27
    .line 28
    iput p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->texturePlayoutMode:I

    .line 29
    .line 30
    :goto_0
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 31
    .line 32
    return-object p0
.end method

.method public initSurfaceTextureHelper(Lcom/bytedance/realx/video/SurfaceTextureHelper;Z)V
    .locals 3

    const/4 v0, 0x1

    .line 71
    const-string v1, "AndroidVideoDecoder"

    if-nez p1, :cond_0

    .line 72
    const-string p1, "surfaceTextureHelper create fail,egl context maybe is full, the hw decoder should use yuvoutput mode"

    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    iput-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->mustUseYUVoutput:Z

    return-void

    .line 74
    :cond_0
    const-string v2, "surfaceTextureHelper create successful."

    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAGFXSurfaceTextureHelper:Z

    if-nez v1, :cond_1

    .line 76
    sget v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    add-int/2addr v1, v0

    sput v1, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 77
    :cond_1
    invoke-virtual {p1, p2}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->setEnableOutsideControlTextureMemory(Z)V

    .line 78
    new-instance p2, Landroid/view/Surface;

    invoke-virtual {p1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 79
    invoke-virtual {p1, p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->startListening(Lcom/bytedance/realx/video/VideoSink;)V

    return-void
.end method

.method public onError(Landroid/media/MediaCodec;Landroid/media/MediaCodec$CodecException;)V
    .locals 0

    .line 1
    iget-boolean p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget-object p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-interface {p2}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-eq p2, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isError:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public onFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 9

    .line 1
    const-string v0, "renderedTextureMetadata is null drop current decoded frame,running:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 10
    .line 11
    add-long/2addr v0, v2

    .line 12
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 13
    .line 14
    const-string p1, "AndroidVideoDecoder"

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "callback is null, dropDecodedFrameCount:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-wide v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object v4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 37
    .line 38
    monitor-enter v4

    .line 39
    :try_start_0
    iget-object v5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 40
    .line 41
    if-nez v5, :cond_1

    .line 42
    .line 43
    const-string p1, "AndroidVideoDecoder"

    .line 44
    .line 45
    new-instance v5, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 51
    .line 52
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p1, Lcom/bytedance/realx/video/VideoCodecStatus;->DROP_DECODED_FRAME:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 63
    .line 64
    const-string v0, "renderedTextureMetadata is null"

    .line 65
    .line 66
    invoke-interface {v1, p1, v0}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 70
    .line 71
    add-long/2addr v0, v2

    .line 72
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->dropDecodedFrameCount:J

    .line 73
    .line 74
    monitor-exit v4

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    iget-wide v5, v5, Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;->presentationTimestampUs:J

    .line 79
    .line 80
    const-wide/16 v7, 0x3e8

    .line 81
    .line 82
    mul-long/2addr v5, v7

    .line 83
    const/4 v0, 0x0

    .line 84
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 85
    .line 86
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-interface {p1, v5, v6}, Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;->setTimestampNs(J)V

    .line 88
    .line 89
    .line 90
    invoke-interface {v1, p1}, Lcom/bytedance/realx/video/VideoDecoder$Callback;->onDecodedFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 91
    .line 92
    .line 93
    iget-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 94
    .line 95
    add-long/2addr v0, v2

    .line 96
    iput-wide v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackDecodedFrameCount:J

    .line 97
    .line 98
    return-void

    .line 99
    :goto_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    throw p0
.end method

.method public onInputBufferAvailable(Landroid/media/MediaCodec;I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eq v0, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callbackLock:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter p1

    .line 19
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->inputBuffers:Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p0, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    monitor-exit p1

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0

    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public onOutputBufferAvailable(Landroid/media/MediaCodec;ILandroid/media/MediaCodec$BufferInfo;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eq v0, p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    :try_start_0
    invoke-direct {p0, p3, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->drainOutputFrame(Landroid/media/MediaCodec$BufferInfo;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    new-instance p1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string p2, ""

    .line 24
    .line 25
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "AndroidVideoDecoder"

    .line 36
    .line 37
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "onOutputFormatChanged "

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->running:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/bytedance/realx/video/MediaCodecWrapper;->getRealCodec()Landroid/media/MediaCodec;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eq v0, p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-direct {p0, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->reformat(Landroid/media/MediaFormat;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public release()Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 3

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "mediacodec release start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseInternal()Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurface()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurfaceTextureHelper()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadataLock:Ljava/lang/Object;

    .line 19
    .line 20
    monitor-enter v1

    .line 21
    const/4 v2, 0x0

    .line 22
    :try_start_0
    iput-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->renderedTextureMetadata:Lcom/bytedance/realx/video/AndroidVideoDecoder$DecodedTextureMetadata;

    .line 23
    .line 24
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    iput-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->callback:Lcom/bytedance/realx/video/VideoDecoder$Callback;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_width:I

    .line 29
    .line 30
    iput v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->encoded_height:I

    .line 31
    .line 32
    return-object v0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p0
.end method

.method public releaseSurface()V
    .locals 3

    .line 1
    const-string v0, "AndroidVideoDecoder"

    .line 2
    .line 3
    const-string v1, "releaseSurface start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "AndroidVideoDecoder"

    .line 13
    .line 14
    const-string v1, "release surface"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelperLock:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    const-string v1, "AndroidVideoDecoder"

    .line 35
    .line 36
    const-string v2, "surfaceTextureHelper.stopListening()"

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->stopListening()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    :try_start_2
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 51
    .line 52
    iget-boolean v0, v0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSurfaceTextureReuse:Z

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->releaseSurfaceTextureHelper()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 61
    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 62
    :catch_0
    move-exception p0

    .line 63
    const-string v0, "AndroidVideoDecoder"

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v2, "releaseSurface:"

    .line 68
    .line 69
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    :goto_2
    const-string p0, "AndroidVideoDecoder"

    .line 83
    .line 84
    const-string v0, "releaseSurface end"

    .line 85
    .line 86
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public releaseSurfaceTextureHelper()V
    .locals 4

    .line 1
    const-string v0, "release surfaceTextureHelper done, curEglContextNum:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelperLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    const-string v2, "AndroidVideoDecoder"

    .line 11
    .line 12
    const-string v3, "release surfaceTextureHelper"

    .line 13
    .line 14
    invoke-static {v2, v3}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->dispose()V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    iput-object v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 24
    .line 25
    sget p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 26
    .line 27
    add-int/lit8 p0, p0, -0x1

    .line 28
    .line 29
    sput p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 30
    .line 31
    const-string p0, "AndroidVideoDecoder"

    .line 32
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget v0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->curEglContextNum:I

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    :goto_0
    monitor-exit v1

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public setDeliverParams(ZIFFI)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "got android hardware decoder setDeliverParams enable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", maxTryCount:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", minAccelerateRatio:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", maxDeaccelerateRatio:"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", frameCacheThreshold:"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "AndroidVideoDecoder"

    .line 48
    .line 49
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-boolean p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableRetryDeliver:Z

    .line 53
    .line 54
    iput p2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxTryCount:I

    .line 55
    .line 56
    iput p3, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->minAccelerateRatio:F

    .line 57
    .line 58
    iput p4, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxDeaccelerateRatio:F

    .line 59
    .line 60
    iput p5, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->frameCacheThreshold:I

    .line 61
    .line 62
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 63
    .line 64
    return-object p0
.end method

.method public setExternalSurface(Landroid/view/Surface;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "set external surface:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AndroidVideoDecoder"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 21
    .line 22
    if-eq p1, v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->codec:Lcom/bytedance/realx/video/MediaCodecWrapper;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    :try_start_0
    invoke-interface {v0, p1}, Lcom/bytedance/realx/video/MediaCodecWrapper;->setOutputSurface(Landroid/view/Surface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "setOutputSurface error:"

    .line 36
    .line 37
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->exSurface:Landroid/view/Surface;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->surface:Landroid/view/Surface;

    .line 54
    .line 55
    return-void
.end method

.method public setPrivateParam(Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "got android hardware decoder setPrivateParam key:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " value:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "AndroidVideoDecoder"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "bytertc.hw.decoder.dr.vsync.cache.size"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-direct {p0, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    sput p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxDirectRenderCacheSize:I

    .line 47
    .line 48
    :cond_0
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_1
    const-string v0, "bytertc.hw.decoder.maxeglnum"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-direct {p0, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    sput p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->maxEglContextNum:I

    .line 70
    .line 71
    :cond_2
    const-string p0, "this is not a param set to HW Decoder, only for control."

    .line 72
    .line 73
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_3
    const-string v0, "bytertc.hw.decoder.check.texture.size"

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    const-string p1, "true"

    .line 88
    .line 89
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iput-boolean p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableTextureSizeCheck:Z

    .line 94
    .line 95
    new-instance p1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string p2, "set FLAG_CHECK_TEXTURE_SIZE to "

    .line 98
    .line 99
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-boolean p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->enableTextureSizeCheck:Z

    .line 103
    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_4
    const-string v0, "bytertc.hw.decoder.newinputbuffer"

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    const/4 v2, 0x0

    .line 124
    const/4 v3, 0x1

    .line 125
    if-eqz v0, :cond_7

    .line 126
    .line 127
    invoke-direct {p0, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_6

    .line 132
    .line 133
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-lt p1, v3, :cond_5

    .line 138
    .line 139
    move v2, v3

    .line 140
    :cond_5
    iput-boolean v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewInputBufferAPI:Z

    .line 141
    .line 142
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string p2, "this is not a param set to HW Decoder, only for control. useNewInputBufferAPI:"

    .line 145
    .line 146
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-boolean p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewInputBufferAPI:Z

    .line 150
    .line 151
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 162
    .line 163
    return-object p0

    .line 164
    :cond_7
    const-string v0, "bytertc.hw.decoder.newoutputbuffer"

    .line 165
    .line 166
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_a

    .line 171
    .line 172
    invoke-direct {p0, p2}, Lcom/bytedance/realx/video/AndroidVideoDecoder;->isNumeric(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_9

    .line 177
    .line 178
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-lt p1, v3, :cond_8

    .line 183
    .line 184
    move v2, v3

    .line 185
    :cond_8
    iput-boolean v2, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewOutputBufferAPI:Z

    .line 186
    .line 187
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string p2, "this is not a param set to HW Decoder, only for control. useNewOutputBufferAPI:"

    .line 190
    .line 191
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    iget-boolean p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->useNewOutputBufferAPI:Z

    .line 195
    .line 196
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 207
    .line 208
    return-object p0

    .line 209
    :cond_a
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->vpassPrivateParams:Ljava/util/HashMap;

    .line 210
    .line 211
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 215
    .line 216
    return-object p0
.end method

.method public updateSettings(Lcom/bytedance/realx/video/VideoDecoder$Settings;)Lcom/bytedance/realx/video/VideoCodecStatus;
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "updateSettings outputByDts:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 11
    .line 12
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->outputByDts:Z

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", smoothOutput:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 23
    .line 24
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSmoothOutput:Z

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ", yuv mode:"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 35
    .line 36
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v1, ", latencyInsensitiveMode:"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 47
    .line 48
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", enableRecreateByResolution:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 59
    .line 60
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableRecreateByResolution:Z

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, ", enableBFrameDecode:"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 71
    .line 72
    iget-boolean v1, v1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableBFrameDecode:Z

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, ", context: "

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/bytedance/realx/video/AndroidVideoDecoder;->settings:Lcom/bytedance/realx/video/VideoDecoder$Settings;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p0, ", enableAsyncMode:"

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-boolean p0, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAsyncMode:Z

    .line 95
    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p0, ", directRenderMode:"

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget p0, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->directRenderMode:I

    .line 105
    .line 106
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p0, ", texturePlayoutMode:"

    .line 110
    .line 111
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget p0, p1, Lcom/bytedance/realx/video/VideoDecoder$Settings;->texturePlayoutMode:I

    .line 115
    .line 116
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    const-string p1, "AndroidVideoDecoder"

    .line 124
    .line 125
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    sget-object p0, Lcom/bytedance/realx/video/VideoCodecStatus;->OK:Lcom/bytedance/realx/video/VideoCodecStatus;

    .line 129
    .line 130
    return-object p0
.end method
