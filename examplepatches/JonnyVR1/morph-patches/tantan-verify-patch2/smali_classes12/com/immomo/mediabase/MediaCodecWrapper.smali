.class public Lcom/immomo/mediabase/MediaCodecWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;,
        Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;,
        Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;,
        Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;,
        Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;,
        Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;
    }
.end annotation


# static fields
.field public static final CODEC_DECODE:I = 0x1

.field public static final CODEC_ENCODE:I


# instance fields
.field private final AUDIO_MIME:Ljava/lang/String;

.field private final AUDIO_WAIT_TIME_US:J

.field private final DECODER_ERROR:I

.field private final ENCODER_ERROR:I

.field private final TAG:Ljava/lang/String;

.field private final VIDEO_MIME:Ljava/lang/String;

.field private final WAIT_TIME_US:J

.field private mCodecFeedingExit:Z

.field private mCodecIsStarted:Z

.field private mCodecName:Ljava/lang/String;

.field private mCodecOutputExit:Z

.field private mCodecSurface:Landroid/view/Surface;

.field private mCodecType:I

.field private mCompleteListener:Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;

.field private mDecStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;

.field private mFeedBuffer:Ljava/nio/ByteBuffer;

.field private mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mFeedingIsPaused:Z

.field private mFeedingPauseFlag:Z

.field private mMediaCodec:Landroid/media/MediaCodec;

.field private mMediaCodecFeedingThread:Ljava/lang/Thread;

.field private mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

.field private mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

.field private mMediaCodecOutingThread:Ljava/lang/Thread;

.field private mMediaCodecSync:Ljava/lang/Object;

.field private mName:Ljava/lang/String;

.field mNeedFlushCodec:Z

.field private mNeedStopAllThread:Z

.field private mOutterIsPaused:Z

.field private mOutterPauseFlag:Z

.field private mPauseFeedingSync:Ljava/lang/Object;

.field private mPauseOutterSync:Ljava/lang/Object;

.field private mRawFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/immomo/mediabase/PacketData;",
            ">;"
        }
    .end annotation
.end field

.field private mReleaseManual:Z

.field private mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

.field private mTextureRenderListener:Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;

.field private needFeedData:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x191

    .line 195
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->DECODER_ERROR:I

    const/16 v0, 0x192

    .line 196
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->ENCODER_ERROR:I

    .line 197
    const-string v0, "MedaiCodecWrapper"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->TAG:Ljava/lang/String;

    .line 198
    const-string v0, "video"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->VIDEO_MIME:Ljava/lang/String;

    .line 199
    const-string v0, "audio"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_MIME:Ljava/lang/String;

    const-wide/16 v0, 0x2710

    .line 200
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->WAIT_TIME_US:J

    const-wide/16 v0, 0x3e8

    .line 201
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_WAIT_TIME_US:J

    const/4 v0, 0x0

    .line 202
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 203
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 204
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 205
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 206
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

    .line 207
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 208
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 209
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    const/4 v1, -0x1

    .line 210
    iput v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    const/4 v1, 0x0

    .line 211
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 212
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 213
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mRawFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 214
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 215
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 216
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 217
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    const/4 v2, 0x1

    .line 218
    iput-boolean v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->needFeedData:Z

    .line 219
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 220
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseOutterSync:Ljava/lang/Object;

    .line 221
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    .line 222
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 223
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mReleaseManual:Z

    .line 224
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z

    const/high16 v0, 0x100000

    .line 225
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 226
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 227
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x191

    .line 160
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->DECODER_ERROR:I

    const/16 v0, 0x192

    .line 161
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->ENCODER_ERROR:I

    .line 162
    const-string v0, "MedaiCodecWrapper"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->TAG:Ljava/lang/String;

    .line 163
    const-string v0, "video"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->VIDEO_MIME:Ljava/lang/String;

    .line 164
    const-string v0, "audio"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_MIME:Ljava/lang/String;

    const-wide/16 v0, 0x2710

    .line 165
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->WAIT_TIME_US:J

    const-wide/16 v0, 0x3e8

    .line 166
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_WAIT_TIME_US:J

    const/4 v0, 0x0

    .line 167
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 168
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 169
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 170
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 171
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

    .line 172
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 173
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 174
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    const/4 v1, -0x1

    .line 175
    iput v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    const/4 v1, 0x0

    .line 176
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 177
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 178
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mRawFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 179
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 180
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 181
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 182
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    const/4 v2, 0x1

    .line 183
    iput-boolean v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->needFeedData:Z

    .line 184
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 185
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseOutterSync:Ljava/lang/Object;

    .line 186
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    .line 187
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 188
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mReleaseManual:Z

    .line 189
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z

    const/high16 v0, 0x100000

    .line 190
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 191
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 192
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    .line 193
    iput p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x191

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->DECODER_ERROR:I

    .line 7
    .line 8
    const/16 v0, 0x192

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->ENCODER_ERROR:I

    .line 11
    .line 12
    const-string v0, "MedaiCodecWrapper"

    .line 13
    .line 14
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->TAG:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "video"

    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->VIDEO_MIME:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "audio"

    .line 21
    .line 22
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_MIME:Ljava/lang/String;

    .line 23
    .line 24
    const-wide/16 v0, 0x2710

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->WAIT_TIME_US:J

    .line 27
    .line 28
    const-wide/16 v0, 0x3e8

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_WAIT_TIME_US:J

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/Object;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 53
    .line 54
    const/4 v1, -0x1

    .line 55
    iput v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 61
    .line 62
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 63
    .line 64
    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mRawFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 68
    .line 69
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 70
    .line 71
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 72
    .line 73
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 74
    .line 75
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    iput-boolean v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->needFeedData:Z

    .line 79
    .line 80
    new-instance v2, Ljava/lang/Object;

    .line 81
    .line 82
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 86
    .line 87
    new-instance v2, Ljava/lang/Object;

    .line 88
    .line 89
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseOutterSync:Ljava/lang/Object;

    .line 93
    .line 94
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    .line 95
    .line 96
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 97
    .line 98
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mReleaseManual:Z

    .line 99
    .line 100
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z

    .line 101
    .line 102
    const/high16 v0, 0x100000

    .line 103
    .line 104
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 111
    .line 112
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 116
    .line 117
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    .line 118
    .line 119
    iput p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 120
    .line 121
    iput-object p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    .line 122
    .line 123
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x191

    .line 125
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->DECODER_ERROR:I

    const/16 v0, 0x192

    .line 126
    iput v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->ENCODER_ERROR:I

    .line 127
    const-string v0, "MedaiCodecWrapper"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->TAG:Ljava/lang/String;

    .line 128
    const-string v0, "video"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->VIDEO_MIME:Ljava/lang/String;

    .line 129
    const-string v0, "audio"

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_MIME:Ljava/lang/String;

    const-wide/16 v0, 0x2710

    .line 130
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->WAIT_TIME_US:J

    const-wide/16 v0, 0x3e8

    .line 131
    iput-wide v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->AUDIO_WAIT_TIME_US:J

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 133
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 134
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 135
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 136
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

    .line 137
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 138
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 139
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    const/4 v1, -0x1

    .line 140
    iput v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    const/4 v1, 0x0

    .line 141
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 142
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 143
    new-instance v2, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mRawFrameQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 144
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 145
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 146
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 147
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    const/4 v2, 0x1

    .line 148
    iput-boolean v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->needFeedData:Z

    .line 149
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 150
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseOutterSync:Ljava/lang/Object;

    .line 151
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    .line 152
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 153
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mReleaseManual:Z

    .line 154
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z

    const/high16 v0, 0x100000

    .line 155
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 156
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 157
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    .line 158
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1000(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1002(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1100(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseOutterSync:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1302(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1400(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediabase/MediaCodecWrapper;->feedData()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mTextureRenderListener:Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1600(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1700(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1702(Lcom/immomo/mediabase/MediaCodecWrapper;[Ljava/nio/ByteBuffer;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1800(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mDecStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1900(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCompleteListener:Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mReleaseManual:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$402(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/immomo/mediabase/MediaCodecWrapper;[Ljava/nio/ByteBuffer;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$800(Lcom/immomo/mediabase/MediaCodecWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$802(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 2
    .line 3
    return p0
.end method

.method private checkDecoderCapability()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method private checkEncoderCapability(Landroid/media/MediaFormat;)Z
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Landroid/media/MediaFormat;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/media/MediaFormat;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "audio"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const-string v3, "MedaiCodecWrapper"

    .line 35
    .line 36
    const-string v4, "mime"

    .line 37
    .line 38
    if-eqz v2, :cond_4

    .line 39
    .line 40
    const-string p0, "sample-rate"

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v1, p0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    :cond_1
    const-string p0, "channel-count"

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {v1, p0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    :cond_2
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v1, v4, p0}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string p1, "audio issupported !!!!!! "

    .line 86
    .line 87
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {v3, p0}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    return p0

    .line 109
    :cond_4
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 110
    .line 111
    const-string v2, "video"

    .line 112
    .line 113
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_8

    .line 118
    .line 119
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_5

    .line 124
    .line 125
    invoke-virtual {p1, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v1, v4, p0}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_5
    const-string p0, "width"

    .line 133
    .line 134
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_6

    .line 139
    .line 140
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    invoke-virtual {v1, p0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 145
    .line 146
    .line 147
    :cond_6
    const-string p0, "height"

    .line 148
    .line 149
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eqz v2, :cond_7

    .line 154
    .line 155
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    invoke-virtual {v1, p0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 160
    .line 161
    .line 162
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string p1, "video issupported !!!!!! "

    .line 165
    .line 166
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {v3, p0}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    return p0

    .line 188
    :cond_8
    const/4 p0, 0x1

    .line 189
    return p0

    .line 190
    :cond_9
    :goto_0
    const/4 p0, 0x0

    .line 191
    return p0
.end method

.method private feedData()Z
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->needFeedData:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v2, 0x0

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    aget-object v3, v3, v2

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-le v0, v3, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    aget-object v0, v0, v2

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto/16 :goto_3

    .line 53
    .line 54
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    .line 55
    .line 56
    if-nez v0, :cond_4

    .line 57
    .line 58
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 63
    .line 64
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 65
    .line 66
    if-nez v0, :cond_4

    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 74
    .line 75
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 78
    .line 79
    invoke-interface {v0, v3, v4}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    return v2

    .line 86
    :cond_2
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 87
    .line 88
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 89
    .line 90
    if-nez v0, :cond_4

    .line 91
    .line 92
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    return v2

    .line 96
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 97
    .line 98
    const-wide/16 v3, 0x2710

    .line 99
    .line 100
    invoke-virtual {v0, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-ltz v6, :cond_7

    .line 105
    .line 106
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 107
    .line 108
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 109
    .line 110
    if-lez v0, :cond_5

    .line 111
    .line 112
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    aget-object v0, v0, v6

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecInputBuffers:[Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    aget-object v0, v0, v6

    .line 122
    .line 123
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 130
    .line 131
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 132
    .line 133
    invoke-virtual {v0, v3, v2, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    .line 136
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 137
    .line 138
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 139
    .line 140
    iget v8, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 141
    .line 142
    iget-wide v9, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 143
    .line 144
    const/4 v11, 0x0

    .line 145
    const/4 v7, 0x0

    .line 146
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_5
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 151
    .line 152
    if-nez v0, :cond_6

    .line 153
    .line 154
    const-wide/16 v9, 0x0

    .line 155
    .line 156
    const/4 v11, 0x4

    .line 157
    const/4 v7, 0x0

    .line 158
    const/4 v8, 0x0

    .line 159
    :try_start_1
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 160
    .line 161
    .line 162
    iput-boolean v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedFlushCodec:Z

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_6
    const-wide/16 v9, 0x0

    .line 166
    .line 167
    const/4 v11, 0x4

    .line 168
    const/4 v7, 0x0

    .line 169
    const/4 v8, 0x0

    .line 170
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 171
    .line 172
    .line 173
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mNeedStopAllThread:Z

    .line 174
    .line 175
    :goto_2
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 176
    .line 177
    iput v2, v0, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    .line 179
    return v1

    .line 180
    :cond_7
    return v2

    .line 181
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 185
    .line 186
    if-eqz v0, :cond_9

    .line 187
    .line 188
    iget p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 189
    .line 190
    const/4 v3, 0x0

    .line 191
    if-ne p0, v1, :cond_8

    .line 192
    .line 193
    const/16 p0, -0x191

    .line 194
    .line 195
    invoke-interface {v0, p0, v2, v3}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 196
    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_8
    const/16 p0, -0x192

    .line 200
    .line 201
    invoke-interface {v0, p0, v2, v3}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_9
    :goto_4
    return v2
.end method

.method public static isEncodeSupportBitrateMode(Ljava/lang/String;I)Z
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    move v2, v0

    .line 9
    :goto_0
    if-ge v2, v1, :cond_3

    .line 10
    .line 11
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-eqz v3, :cond_2

    .line 16
    .line 17
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_2

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    move v5, v0

    .line 31
    :goto_1
    array-length v6, v4

    .line 32
    if-ge v5, v6, :cond_2

    .line 33
    .line 34
    const-string v6, "codec"

    .line 35
    .line 36
    aget-object v7, v4, v5

    .line 37
    .line 38
    invoke-static {v6, v7}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    aget-object v6, v4, v5

    .line 42
    .line 43
    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    if-eqz v6, :cond_1

    .line 48
    .line 49
    invoke-virtual {v3, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    if-eqz v6, :cond_1

    .line 58
    .line 59
    invoke-virtual {v6, p1}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    return v0
.end method

.method public static isSurpportH265Dec()Z
    .locals 9

    .line 1
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_9

    .line 8
    .line 9
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    new-instance v4, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v5, "codec"

    .line 16
    .line 17
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-static {v4}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_0

    .line 39
    .line 40
    goto :goto_5

    .line 41
    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    goto :goto_5

    .line 48
    :cond_1
    move v6, v1

    .line 49
    :goto_1
    array-length v7, v4

    .line 50
    if-ge v6, v7, :cond_8

    .line 51
    .line 52
    aget-object v7, v4, v6

    .line 53
    .line 54
    invoke-static {v5, v7}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    aget-object v7, v4, v6

    .line 58
    .line 59
    const-string v8, "video/hevc"

    .line 60
    .line 61
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    if-eqz v7, :cond_7

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v2, "OMX.MTK.VIDEO.DECODER.HEVC"

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    return v1

    .line 80
    :cond_2
    :try_start_0
    invoke-virtual {v3, v8}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    iget-object v0, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 87
    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    array-length v2, v0

    .line 91
    move v3, v1

    .line 92
    move v4, v3

    .line 93
    move v5, v4

    .line 94
    :goto_2
    if-ge v3, v2, :cond_5

    .line 95
    .line 96
    aget-object v6, v0, v3

    .line 97
    .line 98
    if-nez v6, :cond_3

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_3
    iget v7, v6, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 102
    .line 103
    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    iget v6, v6, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    .line 108
    .line 109
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 110
    .line 111
    .line 112
    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :catchall_0
    move-exception v0

    .line 117
    goto :goto_4

    .line 118
    :cond_4
    move v4, v1

    .line 119
    :cond_5
    const/4 v0, 0x1

    .line 120
    if-lt v4, v0, :cond_6

    .line 121
    .line 122
    return v0

    .line 123
    :cond_6
    return v1

    .line 124
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 125
    .line 126
    .line 127
    return v1

    .line 128
    :cond_7
    add-int/lit8 v6, v6, 0x1

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_8
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_9
    return v1
.end method


# virtual methods
.method public createMediaCodec(Landroid/media/MediaFormat;I)Z
    .locals 6

    .line 1
    const-string v0, "CreateMediaCodec Error ["

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    if-gt p2, v3, :cond_4

    .line 11
    .line 12
    if-gez p2, :cond_0

    .line 13
    .line 14
    goto/16 :goto_2

    .line 15
    .line 16
    :cond_0
    const/4 v4, 0x0

    .line 17
    :try_start_0
    iput p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 18
    .line 19
    const-string p2, "mime"

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 26
    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    const-string p1, "MedaiCodecWrapper"

    .line 30
    .line 31
    const-string p2, "Media codec name is null"

    .line 32
    .line 33
    invoke-static {p1, p2}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    return v2

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_3

    .line 40
    :catch_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :try_start_2
    iget v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 43
    .line 44
    if-nez v5, :cond_2

    .line 45
    .line 46
    invoke-static {p2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 51
    .line 52
    invoke-virtual {p2, p1, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 56
    .line 57
    const-string v5, "video"

    .line 58
    .line 59
    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_3

    .line 64
    .line 65
    const-string p2, "color-format"

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    const p2, 0x7f000789

    .line 72
    .line 73
    .line 74
    if-ne p1, p2, :cond_3

    .line 75
    .line 76
    iget-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    if-ne v5, v3, :cond_3

    .line 86
    .line 87
    invoke-static {p2}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    iput-object p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 92
    .line 93
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 94
    .line 95
    invoke-virtual {p2, p1, v5, v4, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 96
    .line 97
    .line 98
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 101
    .line 102
    .line 103
    iput-boolean v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 104
    .line 105
    :try_start_3
    monitor-exit v1

    .line 106
    return v3

    .line 107
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 108
    .line 109
    .line 110
    :try_start_4
    iget-object p2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 111
    .line 112
    invoke-virtual {p2}, Landroid/media/MediaCodec;->release()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 113
    .line 114
    .line 115
    :catch_1
    :try_start_5
    iput-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 116
    .line 117
    const-string p0, "MedaiCodecWrapper"

    .line 118
    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "]"

    .line 132
    .line 133
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-static {p0, p1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    monitor-exit v1

    .line 144
    return v2

    .line 145
    :cond_4
    :goto_2
    const-string p0, "MedaiCodecWrapper"

    .line 146
    .line 147
    const-string p1, "Media format is null"

    .line 148
    .line 149
    invoke-static {p0, p1}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    monitor-exit v1

    .line 153
    return v2

    .line 154
    :goto_3
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 155
    throw p0
.end method

.method public flush()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 10
    .line 11
    return-void
.end method

.method public getCodecInputSurface()Landroid/view/Surface;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const-string v2, "video"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    monitor-exit v0

    .line 24
    return-object p0

    .line 25
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public getCodecOutputFormat()Landroid/media/MediaFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public pause()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 2
    .line 3
    const-wide/16 v1, 0x5

    .line 4
    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iput-boolean v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 16
    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    :goto_0
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    throw p0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseOutterSync:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter v0

    .line 49
    :try_start_3
    iput-boolean v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 50
    .line 51
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 52
    :goto_1
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 53
    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    :try_start_4
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catch_1
    move-exception v0

    .line 65
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catchall_1
    move-exception p0

    .line 70
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 71
    throw p0

    .line 72
    :cond_1
    return-void
.end method

.method public releaseMediaCodec()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mReleaseManual:Z

    .line 6
    .line 7
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecFeedingExit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto/16 :goto_6

    .line 20
    .line 21
    :catch_0
    move-exception v2

    .line 22
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    :goto_0
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecFeedingThread:Ljava/lang/Thread;

    .line 26
    .line 27
    :cond_0
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    iget v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 36
    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 40
    .line 41
    const-string v4, "video"

    .line 42
    .line 43
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecOutputExit:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    :goto_1
    :try_start_3
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :catch_1
    move-exception v2

    .line 68
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 69
    .line 70
    .line 71
    :goto_2
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 72
    .line 73
    :cond_2
    const/4 v2, 0x0

    .line 74
    :try_start_5
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 75
    .line 76
    if-eqz v4, :cond_5

    .line 77
    .line 78
    iget-boolean v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z

    .line 79
    .line 80
    if-eqz v5, :cond_3

    .line 81
    .line 82
    invoke-virtual {v4}, Landroid/media/MediaCodec;->stop()V

    .line 83
    .line 84
    .line 85
    iput-boolean v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecIsStarted:Z

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :catch_2
    move-exception v4

    .line 89
    goto :goto_4

    .line 90
    :cond_3
    :goto_3
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 91
    .line 92
    invoke-virtual {v4}, Landroid/media/MediaCodec;->release()V

    .line 93
    .line 94
    .line 95
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 96
    .line 97
    goto :goto_5

    .line 98
    :goto_4
    :try_start_6
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 99
    .line 100
    .line 101
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 102
    .line 103
    if-eqz v4, :cond_5

    .line 104
    .line 105
    iget v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 106
    .line 107
    if-ne v5, v1, :cond_4

    .line 108
    .line 109
    const/16 v1, -0x191

    .line 110
    .line 111
    invoke-interface {v4, v1, v2, v3}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_5

    .line 115
    :cond_4
    const/16 v1, -0x192

    .line 116
    .line 117
    invoke-interface {v4, v1, v2, v3}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_5
    :goto_5
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecName:Ljava/lang/String;

    .line 121
    .line 122
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 123
    .line 124
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    iput-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 127
    .line 128
    monitor-exit v0

    .line 129
    return-void

    .line 130
    :goto_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 131
    throw p0
.end method

.method public resume()V
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 36
    :try_start_0
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 37
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 38
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 39
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 40
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public resume(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mPauseFeedingSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    :try_start_0
    iget-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/media/MediaCodec;->flush()V

    .line 20
    .line 21
    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterPauseFlag:Z

    .line 24
    .line 25
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingPauseFlag:Z

    .line 26
    .line 27
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mOutterIsPaused:Z

    .line 28
    .line 29
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedingIsPaused:Z

    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method public setCodecInputSurface(Landroid/view/Surface;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecType:I

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCodecSurface:Landroid/view/Surface;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public setDecStatusListener(Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mDecStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public setMaxFeedBufferSize(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-le p1, v0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    if-lez p1, :cond_1

    .line 19
    .line 20
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mFeedBuffer:Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public setMediaCodecStatusListener(Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mStatusListener:Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public setOnCompleteListener(Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mCompleteListener:Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;

    .line 2
    .line 3
    return-void
.end method

.method public setParams(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setTextureRenderStatusListener(Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mTextureRenderListener:Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;

    .line 2
    .line 3
    return-void
.end method

.method public starMediaCodec(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/lang/Thread;

    .line 9
    .line 10
    new-instance v2, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;-><init>(Lcom/immomo/mediabase/MediaCodecWrapper;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mName:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v4, "_outdata"

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->mMediaCodecOutingThread:Ljava/lang/Thread;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    :goto_0
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper;->needFeedData:Z

    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method
