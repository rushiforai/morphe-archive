.class public Lcom/immomo/mediabase/DecodeAudioFile;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "HUOHL_DecodeAudioFile"


# instance fields
.field mAudioDuration:J

.field mAudioFormat:Landroid/media/MediaFormat;

.field mAudioTrackIndex:I

.field private mDecodeRunable:Ljava/lang/Runnable;

.field private mDecodeThread:Ljava/lang/Thread;

.field mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

.field private mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

.field private mEnableResample:Z

.field private mEndDeocdeTime:J

.field mExtractor:Landroid/media/MediaExtractor;

.field private mSourceFile:Ljava/lang/String;

.field private mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

.field private mStartDecodeTime:J

.field private mStopDecode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSourceFile:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mEnableResample:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-object v1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    iput-wide v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStartDecodeTime:J

    .line 19
    .line 20
    iput-wide v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mEndDeocdeTime:J

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStopDecode:Z

    .line 23
    .line 24
    iput-object v1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeThread:Ljava/lang/Thread;

    .line 25
    .line 26
    iput-object v1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    iput v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioTrackIndex:I

    .line 30
    .line 31
    iput-wide v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioDuration:J

    .line 32
    .line 33
    iput-object v1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 34
    .line 35
    new-instance v0, Lcom/immomo/mediabase/DecodeAudioFile$1;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/immomo/mediabase/DecodeAudioFile$1;-><init>(Lcom/immomo/mediabase/DecodeAudioFile;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeRunable:Ljava/lang/Runnable;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStartDecodeTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100(Lcom/immomo/mediabase/DecodeAudioFile;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStopDecode:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/immomo/mediabase/DecodeAudioFile;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mEndDeocdeTime:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$300(Lcom/immomo/mediabase/DecodeAudioFile;)Lcom/immomo/mediabase/AudioParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSrcAudioParam()Lcom/immomo/mediabase/AudioParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediabase/DecodeAudioFile;->stopDecode()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 13
    .line 14
    :cond_0
    const-string p0, "HUOHL_DecodeAudioFile"

    .line 15
    .line 16
    const-string v0, "release: "

    .line 17
    .line 18
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setDecodeSource(Ljava/lang/String;JJ)Z
    .locals 7

    .line 1
    const-string v0, "durationUs"

    .line 2
    .line 3
    const-string v1, "mime"

    .line 4
    .line 5
    iput-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSourceFile:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :try_start_0
    iget-object v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    new-instance v2, Landroid/media/MediaExtractor;

    .line 13
    .line 14
    invoke-direct {v2}, Landroid/media/MediaExtractor;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception p2

    .line 21
    goto/16 :goto_3

    .line 22
    .line 23
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSourceFile:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    move v3, p1

    .line 37
    :goto_1
    if-ge v3, v2, :cond_3

    .line 38
    .line 39
    iget-object v4, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 40
    .line 41
    invoke-virtual {v4, v3}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const-string v6, "audio"

    .line 50
    .line 51
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_1

    .line 56
    .line 57
    iput v3, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioTrackIndex:I

    .line 58
    .line 59
    iput-object v4, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 60
    .line 61
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    iget-object v4, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 68
    .line 69
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    iput-wide v4, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioDuration:J

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    invoke-virtual {v4, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    const-string v5, "video"

    .line 81
    .line 82
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .line 84
    .line 85
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioTrackIndex:I

    .line 89
    .line 90
    if-ltz p1, :cond_5

    .line 91
    .line 92
    iget-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 93
    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    iget-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 97
    .line 98
    if-nez p1, :cond_4

    .line 99
    .line 100
    new-instance p1, Lcom/immomo/mediabase/AudioParameter;

    .line 101
    .line 102
    invoke-direct {p1}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 106
    .line 107
    :cond_4
    iget-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 110
    .line 111
    const-string v1, "sample-rate"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {p1, v0}, Lcom/immomo/mediabase/AudioParameter;->setSamplingRate(I)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mSrcAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 121
    .line 122
    iget-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 123
    .line 124
    const-string v1, "channel-count"

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-virtual {p1, v0}, Lcom/immomo/mediabase/AudioParameter;->setNumChannels(I)V

    .line 131
    .line 132
    .line 133
    :cond_5
    iput-wide p2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStartDecodeTime:J

    .line 134
    .line 135
    iput-wide p4, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mEndDeocdeTime:J

    .line 136
    .line 137
    new-instance p1, Ljava/lang/Thread;

    .line 138
    .line 139
    iget-object p2, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeRunable:Ljava/lang/Runnable;

    .line 140
    .line 141
    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 142
    .line 143
    .line 144
    iput-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeThread:Ljava/lang/Thread;

    .line 145
    .line 146
    const/4 p0, 0x1

    .line 147
    return p0

    .line 148
    :goto_3
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 152
    .line 153
    if-eqz p0, :cond_6

    .line 154
    .line 155
    const/4 p2, -0x1

    .line 156
    invoke-interface {p0, p2}, Lcom/immomo/mediabase/DecodeAudioFileListener;->onDecoderError(I)V

    .line 157
    .line 158
    .line 159
    :cond_6
    return p1
.end method

.method public setDecoderListener(Lcom/immomo/mediabase/DecodeAudioFileListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 2
    .line 3
    return-void
.end method

.method public setEnableResample(ZLcom/immomo/mediabase/AudioParameter;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mEnableResample:Z

    .line 2
    .line 3
    iget-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Lcom/immomo/mediabase/AudioParameter;

    .line 8
    .line 9
    invoke-direct {p1}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDstAudioParam:Lcom/immomo/mediabase/AudioParameter;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/immomo/mediabase/AudioParameter;->copyOf(Lcom/immomo/mediabase/AudioParameter;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public startDecode()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStopDecode:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeThread:Ljava/lang/Thread;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const-string p0, "HUOHL_DecodeAudioFile"

    .line 12
    .line 13
    const-string v0, "startDecode: "

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public stopDecode()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mStopDecode:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeThread:Ljava/lang/Thread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    :goto_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecodeThread:Ljava/lang/Thread;

    .line 18
    .line 19
    :cond_0
    const-string p0, "HUOHL_DecodeAudioFile"

    .line 20
    .line 21
    const-string v0, "stopDecode: "

    .line 22
    .line 23
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method
