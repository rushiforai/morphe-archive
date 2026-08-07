.class Lcom/bytedance/bae/webrtc/WebRtcAudioFile;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final MAX_DECODER_RETRY_COUNT:I = 0x64

.field private static final TAG:Ljava/lang/String; = "WebRtcAudioRecordFile"


# instance fields
.field private eoInputStream:Z

.field private eoOutputStream:Z

.field private mChannels:I

.field private mDecodedData:[B
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mExtractor:Landroid/media/MediaExtractor;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mFileLength:J

.field private mInputBuffers:[Ljava/nio/ByteBuffer;

.field private mMediaCodec:Landroid/media/MediaCodec;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mOutputBuffers:[Ljava/nio/ByteBuffer;

.field private mRetryCount:I

.field private mSampleRate:I

.field private mTrackIds:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mUsedTrackFormat:Landroid/media/MediaFormat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mUsedTrackIdx:I

.field private oc:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 6
    .line 7
    iput v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 8
    .line 9
    const-string p0, "WebRtcAudioRecordFile"

    .line 10
    .line 11
    const-string v0, "AudioMix WebRtcAudioFile"

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private checkInfoChange()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "sample-rate"

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const-string v3, "channel-count"

    .line 15
    .line 16
    invoke-virtual {v1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 21
    .line 22
    if-ne v3, v2, :cond_1

    .line 23
    .line 24
    iget v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 25
    .line 26
    if-eq v3, v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v3, v0

    .line 30
    goto :goto_1

    .line 31
    :catch_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_0
    const/4 v3, 0x1

    .line 34
    :goto_1
    iput v2, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 35
    .line 36
    iput v1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    return v3

    .line 39
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    const-string p0, "WebRtcAudioRecordFile"

    .line 43
    .line 44
    const-string v1, "Error when checking file\'s new format"

    .line 45
    .line 46
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return v0
.end method

.method private checkUrlEncoded(Ljava/lang/String;)Z
    .locals 0

    .line 1
    :try_start_0
    const-string p0, "UTF-8"

    .line 2
    .line 3
    invoke-static {p1, p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    const-string p0, "WebRtcAudioRecordFile"

    .line 19
    .line 20
    const-string p1, "Error when releasing audio file stream"

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private encodeUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 1
    const-string p0, "WebRtcAudioRecordFile"

    .line 2
    .line 3
    const-string v0, "encodedUrl"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance p0, Ljava/net/URL;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ljava/net/URI;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {p0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {p0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-direct/range {v0 .. v7}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return-object p0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    move-object p0, v0

    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method private isAvailableOnlineURL(Ljava/lang/String;)Z
    .locals 5

    .line 1
    const-string v0, "++Error when test online url: "

    .line 2
    .line 3
    const-string v1, "url is not available, error:"

    .line 4
    .line 5
    const-string v2, "isAvailableOnlineURL"

    .line 6
    .line 7
    const-string v3, "WebRtcAudioRecordFile"

    .line 8
    .line 9
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-object v2, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    :try_start_0
    new-instance v4, Ljava/net/URL;

    .line 17
    .line 18
    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ljava/net/HttpURLConnection;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 33
    .line 34
    const/16 v4, 0xfa0

    .line 35
    .line 36
    invoke-virtual {p1, v4}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 37
    .line 38
    .line 39
    const-string p1, "connect done...."

    .line 40
    .line 41
    invoke-static {v3, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const/16 v4, 0xc8

    .line 51
    .line 52
    if-ne v4, p1, :cond_0

    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {v3, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    move p1, v2

    .line 72
    :goto_0
    iget-object v1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :catchall_0
    move-exception p1

    .line 85
    goto :goto_3

    .line 86
    :catch_0
    move-exception p1

    .line 87
    goto :goto_2

    .line 88
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 89
    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 93
    .line 94
    .line 95
    :cond_2
    return p1

    .line 96
    :goto_2
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 97
    .line 98
    .line 99
    new-instance v1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {v3, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 119
    .line 120
    if-eqz p0, :cond_3

    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 123
    .line 124
    .line 125
    :cond_3
    return v2

    .line 126
    :goto_3
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 127
    .line 128
    if-eqz p0, :cond_4

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 131
    .line 132
    .line 133
    :cond_4
    throw p1
.end method


# virtual methods
.method public disConnectURL()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "WebRtcAudioRecordFile"

    .line 2
    .line 3
    const-string v1, "disConnectURL"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->oc:Ljava/net/HttpURLConnection;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public getAudioTrackCount()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getChannelCount()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 2
    .line 3
    return p0
.end method

.method public getCurrentFilePosition()J
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x3e8

    .line 8
    .line 9
    div-long/2addr v0, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    return-wide v0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    const-string p0, "WebRtcAudioRecordFile"

    .line 16
    .line 17
    const-string v0, "Error when getCurrentFilePosition"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    return-wide v0
.end method

.method public getDecodedData()[B
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getFileLength()J
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mFileLength:J

    .line 2
    .line 3
    const-wide/16 v2, 0x3e8

    .line 4
    .line 5
    div-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public getSampleRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getUsedTrackIdx()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackIdx:I

    .line 2
    .line 3
    return p0
.end method

.method public init(Ljava/lang/String;I)Z
    .locals 9
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v1, "WebRtcAudioRecordFile"

    .line 2
    .line 3
    const-string v0, "Try to decode audio file : "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/util/Vector;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 27
    .line 28
    invoke-static {p1}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->checkUrlEncoded(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-direct {p0, p1}, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->isAvailableOnlineURL(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    move-object p0, v0

    .line 56
    goto/16 :goto_5

    .line 57
    .line 58
    :cond_1
    :goto_1
    return v2

    .line 59
    :cond_2
    iput v2, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mRetryCount:I

    .line 60
    .line 61
    new-instance v0, Landroid/media/MediaExtractor;

    .line 62
    .line 63
    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 67
    .line 68
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v3, "/assets/"

    .line 73
    .line 74
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_3

    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/16 v3, 0x8

    .line 87
    .line 88
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-object v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 107
    .line 108
    .line 109
    move-result-wide v7

    .line 110
    invoke-virtual/range {v3 .. v8}, Landroid/media/MediaExtractor;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    const-string v3, "content://"

    .line 115
    .line 116
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_4

    .line 121
    .line 122
    if-eqz v0, :cond_4

    .line 123
    .line 124
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v3, "r"

    .line 133
    .line 134
    invoke-virtual {v0, p1, v3}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 143
    .line 144
    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_4
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 149
    .line 150
    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :goto_2
    iget-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    move v0, v2

    .line 160
    :goto_3
    if-ge v0, p1, :cond_5

    .line 161
    .line 162
    iget-object v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 163
    .line 164
    invoke-virtual {v3, v0}, Landroid/media/MediaExtractor;->unselectTrack(I)V

    .line 165
    .line 166
    .line 167
    add-int/lit8 v0, v0, 0x1

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :cond_5
    add-int/lit8 v0, p2, 0x1

    .line 171
    .line 172
    if-le v0, p1, :cond_6

    .line 173
    .line 174
    const-string p0, "useTrack > trackCount"

    .line 175
    .line 176
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    return v2

    .line 180
    :cond_6
    iput v2, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 181
    .line 182
    move v0, v2

    .line 183
    move v3, v0

    .line 184
    :goto_4
    if-ge v0, p1, :cond_9

    .line 185
    .line 186
    iget-object v4, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 187
    .line 188
    invoke-virtual {v4, v0}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    const-string v5, "mime"

    .line 193
    .line 194
    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    const-string v6, "audio/"

    .line 199
    .line 200
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result v6

    .line 204
    if-eqz v6, :cond_8

    .line 205
    .line 206
    if-ne p2, v3, :cond_7

    .line 207
    .line 208
    iget-object v6, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 209
    .line 210
    invoke-virtual {v6, v0}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 211
    .line 212
    .line 213
    invoke-static {v5}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    iput-object v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 218
    .line 219
    const/4 v6, 0x0

    .line 220
    invoke-virtual {v5, v4, v6, v6, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 221
    .line 222
    .line 223
    iput-object v4, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 224
    .line 225
    iput v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackIdx:I

    .line 226
    .line 227
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 228
    .line 229
    iget-object v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 230
    .line 231
    new-instance v6, Ljava/lang/Integer;

    .line 232
    .line 233
    invoke-direct {v6, v0}, Ljava/lang/Integer;-><init>(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v5, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    const-string v5, "channel-count"

    .line 240
    .line 241
    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    iget v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 246
    .line 247
    if-le v4, v5, :cond_8

    .line 248
    .line 249
    iput v4, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 250
    .line 251
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_9
    iget-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 255
    .line 256
    if-eqz p1, :cond_a

    .line 257
    .line 258
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 262
    .line 263
    const-string p2, "sample-rate"

    .line 264
    .line 265
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    iput p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 270
    .line 271
    iget-object p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 272
    .line 273
    const-string p2, "durationUs"

    .line 274
    .line 275
    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 276
    .line 277
    .line 278
    move-result-wide p1

    .line 279
    iput-wide p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mFileLength:J

    .line 280
    .line 281
    const/4 p0, 0x1

    .line 282
    return p0

    .line 283
    :cond_a
    const-string p0, "mMediaCodec is null"

    .line 284
    .line 285
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .line 287
    .line 288
    return v2

    .line 289
    :goto_5
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 290
    .line 291
    .line 292
    new-instance p1, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const-string p2, "Error when creating audio file decode, error:"

    .line 295
    .line 296
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p2

    .line 303
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    new-instance p1, Ljava/lang/StringBuilder;

    .line 314
    .line 315
    const-string p2, "stack track: "

    .line 316
    .line 317
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    return v2
.end method

.method public readAudioData()Z
    .locals 17
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "vivo"

    .line 4
    .line 5
    const-string v2, "meizu"

    .line 6
    .line 7
    const-string v3, "EAGAIN count="

    .line 8
    .line 9
    :try_start_0
    iget-object v4, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 10
    .line 11
    if-eqz v4, :cond_c

    .line 12
    .line 13
    iget-object v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 14
    .line 15
    if-nez v5, :cond_0

    .line 16
    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_0
    iget-boolean v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoInputStream:Z

    .line 20
    .line 21
    const-wide/16 v6, 0x0

    .line 22
    .line 23
    const/4 v8, 0x1

    .line 24
    const/4 v9, 0x0

    .line 25
    if-nez v5, :cond_3

    .line 26
    .line 27
    invoke-virtual {v4, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 28
    .line 29
    .line 30
    move-result v11

    .line 31
    if-ltz v11, :cond_3

    .line 32
    .line 33
    iget-object v4, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 34
    .line 35
    invoke-virtual {v4, v11}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-object v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 40
    .line 41
    invoke-virtual {v5, v4, v9}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-gtz v4, :cond_1

    .line 46
    .line 47
    iput-boolean v8, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoInputStream:Z

    .line 48
    .line 49
    move v13, v9

    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto/16 :goto_4

    .line 53
    .line 54
    :cond_1
    move v13, v4

    .line 55
    :goto_0
    iget-object v4, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 56
    .line 57
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 58
    .line 59
    .line 60
    move-result-wide v14

    .line 61
    iget-object v4, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    iget-boolean v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoInputStream:Z

    .line 68
    .line 69
    if-eqz v5, :cond_2

    .line 70
    .line 71
    or-int/lit8 v4, v4, 0x4

    .line 72
    .line 73
    :cond_2
    move/from16 v16, v4

    .line 74
    .line 75
    iget-object v10, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 76
    .line 77
    const/4 v12, 0x0

    .line 78
    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 79
    .line 80
    .line 81
    iget-object v4, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 82
    .line 83
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->advance()Z

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-boolean v4, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z

    .line 87
    .line 88
    if-nez v4, :cond_d

    .line 89
    .line 90
    new-instance v4, Landroid/media/MediaCodec$BufferInfo;

    .line 91
    .line 92
    invoke-direct {v4}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 93
    .line 94
    .line 95
    iget-object v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 96
    .line 97
    invoke-virtual {v5, v4, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    const/4 v6, 0x0

    .line 102
    iput-object v6, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 103
    .line 104
    const/4 v6, -0x3

    .line 105
    if-eq v5, v6, :cond_b

    .line 106
    .line 107
    const/4 v6, -0x2

    .line 108
    if-eq v5, v6, :cond_b

    .line 109
    .line 110
    const/4 v6, -0x1

    .line 111
    if-eq v5, v6, :cond_8

    .line 112
    .line 113
    iput v9, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mRetryCount:I

    .line 114
    .line 115
    if-ltz v5, :cond_d

    .line 116
    .line 117
    iget v0, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 118
    .line 119
    const/4 v2, 0x4

    .line 120
    and-int/2addr v0, v2

    .line 121
    if-ne v0, v2, :cond_4

    .line 122
    .line 123
    iput-boolean v8, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z

    .line 124
    .line 125
    :cond_4
    iget-object v0, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 126
    .line 127
    invoke-virtual {v0, v5}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v2, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 132
    .line 133
    const-string v3, "channel-count"

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    iget v3, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mChannels:I

    .line 140
    .line 141
    if-eq v2, v3, :cond_6

    .line 142
    .line 143
    const/4 v6, 0x2

    .line 144
    if-ne v3, v6, :cond_6

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    mul-int/2addr v2, v6

    .line 151
    new-array v2, v2, [B

    .line 152
    .line 153
    iput-object v2, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 154
    .line 155
    move v2, v9

    .line 156
    :goto_1
    iget v3, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 157
    .line 158
    div-int/2addr v3, v6

    .line 159
    if-ge v2, v3, :cond_5

    .line 160
    .line 161
    iget-object v3, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 162
    .line 163
    mul-int/lit8 v7, v2, 0x4

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 166
    .line 167
    .line 168
    move-result v8

    .line 169
    aput-byte v8, v3, v7

    .line 170
    .line 171
    iget-object v3, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 172
    .line 173
    add-int/lit8 v8, v7, 0x2

    .line 174
    .line 175
    aget-byte v10, v3, v7

    .line 176
    .line 177
    aput-byte v10, v3, v8

    .line 178
    .line 179
    add-int/lit8 v8, v7, 0x1

    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 182
    .line 183
    .line 184
    move-result v10

    .line 185
    aput-byte v10, v3, v8

    .line 186
    .line 187
    iget-object v3, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 188
    .line 189
    add-int/lit8 v7, v7, 0x3

    .line 190
    .line 191
    aget-byte v8, v3, v8

    .line 192
    .line 193
    aput-byte v8, v3, v7

    .line 194
    .line 195
    add-int/lit8 v2, v2, 0x1

    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_5
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 199
    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_6
    if-ne v2, v3, :cond_7

    .line 203
    .line 204
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    new-array v2, v2, [B

    .line 209
    .line 210
    iput-object v2, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 211
    .line 212
    iget v3, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 213
    .line 214
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 215
    .line 216
    invoke-virtual {v0, v2, v3, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 220
    .line 221
    .line 222
    :cond_7
    :goto_2
    iget-object v0, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 223
    .line 224
    invoke-virtual {v0, v5, v9}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 225
    .line 226
    .line 227
    goto/16 :goto_5

    .line 228
    .line 229
    :cond_8
    iget v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mRetryCount:I

    .line 230
    .line 231
    add-int/2addr v5, v8

    .line 232
    iput v5, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mRetryCount:I

    .line 233
    .line 234
    const/16 v6, 0x64

    .line 235
    .line 236
    if-lt v5, v6, :cond_a

    .line 237
    .line 238
    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v6

    .line 244
    invoke-virtual {v6, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result v6

    .line 248
    if-nez v6, :cond_9

    .line 249
    .line 250
    sget-object v6, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    invoke-virtual {v7, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    if-nez v2, :cond_9

    .line 261
    .line 262
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-nez v2, :cond_9

    .line 271
    .line 272
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-eqz v0, :cond_a

    .line 281
    .line 282
    :cond_9
    const-string v0, "WebRtcAudioRecordFile"

    .line 283
    .line 284
    new-instance v2, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    iget v3, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mRetryCount:I

    .line 290
    .line 291
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string v3, " presentationTimeUs="

    .line 295
    .line 296
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    iget-wide v3, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 300
    .line 301
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    const-string v3, " totalUs="

    .line 305
    .line 306
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    iget-wide v3, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mFileLength:J

    .line 310
    .line 311
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    const-string v3, " Force EOS"

    .line 315
    .line 316
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    iput-boolean v8, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z

    .line 327
    .line 328
    iput v9, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mRetryCount:I

    .line 329
    .line 330
    :cond_a
    new-array v0, v9, [B

    .line 331
    .line 332
    iput-object v0, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 333
    .line 334
    const-wide/16 v2, 0x3

    .line 335
    .line 336
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 337
    .line 338
    .line 339
    goto :goto_5

    .line 340
    :cond_b
    new-array v0, v9, [B

    .line 341
    .line 342
    iput-object v0, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mDecodedData:[B

    .line 343
    .line 344
    goto :goto_5

    .line 345
    :cond_c
    :goto_3
    iget-boolean v0, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoInputStream:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 346
    .line 347
    return v0

    .line 348
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 349
    .line 350
    .line 351
    :cond_d
    :goto_5
    iget-boolean v0, v1, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z

    .line 352
    .line 353
    return v0
.end method

.method public selectTrack(I)V
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "sample-rate"

    .line 2
    .line 3
    const-string v1, "WebRtcAudioRecordFile"

    .line 4
    .line 5
    const-string v2, "mExtractor or mMediaCodec is null, mExtractor = "

    .line 6
    .line 7
    const-string v3, "++current_postion = "

    .line 8
    .line 9
    const-string v4, "mSampleRate = "

    .line 10
    .line 11
    :try_start_0
    iget-object v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 12
    .line 13
    if-nez v5, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    add-int/lit8 v6, p1, 0x1

    .line 17
    .line 18
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    if-le v6, v5, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackIdx:I

    .line 26
    .line 27
    if-ne v5, p1, :cond_2

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_2
    iget-object v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 31
    .line 32
    if-eqz v5, :cond_5

    .line 33
    .line 34
    iget-object v6, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 35
    .line 36
    if-nez v6, :cond_3

    .line 37
    .line 38
    goto/16 :goto_1

    .line 39
    .line 40
    :cond_3
    iget-object v2, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ljava/lang/Integer;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v5, v2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget v5, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-eq v5, v6, :cond_4

    .line 63
    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mSampleRate:I

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p0, ", used_SampleRate = "

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :catch_0
    move-exception p0

    .line 95
    goto :goto_2

    .line 96
    :cond_4
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 99
    .line 100
    .line 101
    move-result-wide v4

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 118
    .line 119
    iget-object v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 120
    .line 121
    iget v6, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackIdx:I

    .line 122
    .line 123
    invoke-virtual {v3, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Ljava/lang/Integer;

    .line 128
    .line 129
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    invoke-virtual {v0, v3}, Landroid/media/MediaExtractor;->unselectTrack(I)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 137
    .line 138
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 139
    .line 140
    .line 141
    const-string v0, "mime"

    .line 142
    .line 143
    invoke-virtual {v2, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 147
    .line 148
    iget-object v3, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mTrackIds:Ljava/util/Vector;

    .line 149
    .line 150
    invoke-virtual {v3, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    check-cast v3, Ljava/lang/Integer;

    .line 155
    .line 156
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    invoke-virtual {v0, v3}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 164
    .line 165
    const/4 v3, 0x2

    .line 166
    invoke-virtual {v0, v4, v5, v3}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 170
    .line 171
    const/4 v3, 0x0

    .line 172
    const/4 v4, 0x0

    .line 173
    invoke-virtual {v0, v2, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 177
    .line 178
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 179
    .line 180
    .line 181
    iput-object v2, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 182
    .line 183
    iput p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mUsedTrackIdx:I

    .line 184
    .line 185
    return-void

    .line 186
    :cond_5
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 192
    .line 193
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string v0, ", mMediaCodec = "

    .line 197
    .line 198
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 202
    .line 203
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .line 212
    .line 213
    return-void

    .line 214
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 215
    .line 216
    .line 217
    const-string p0, "Error when selectTrack"

    .line 218
    .line 219
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    return-void
.end method

.method public setCurrentFilePosition(J)V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z

    .line 2
    .line 3
    const-string v1, "WebRtcAudioRecordFile"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    const-string v0, "Error when setCurrentFilePosition, mMediaCodec.flush"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 23
    .line 24
    const-wide/16 v2, 0x3e8

    .line 25
    .line 26
    mul-long/2addr p1, v2

    .line 27
    const/4 v2, 0x2

    .line 28
    invoke-virtual {v0, p1, p2, v2}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoInputStream:Z

    .line 33
    .line 34
    iput-boolean p1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catch_1
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    const-string p0, "Error when setCurrentFilePosition, mExtractor.seekTo"

    .line 42
    .line 43
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :goto_1
    return-void
.end method

.method public uninit()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mMediaCodec:Landroid/media/MediaCodec;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->mExtractor:Landroid/media/MediaExtractor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "Error when releasing audio file stream"

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "WebRtcAudioRecordFile"

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_2
    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoOutputStream:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/bytedance/bae/webrtc/WebRtcAudioFile;->eoInputStream:Z

    .line 59
    .line 60
    return-void
.end method
