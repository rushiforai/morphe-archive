.class Lcom/ss/bytertc/engine/RtcAudioFileDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final MAX_DECODER_RETRY_COUNT:I = 0x64

.field private static final TAG:Ljava/lang/String; = "RtcAudioFileDecoder"


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
    iput v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

    .line 8
    .line 9
    const-string p0, "RtcAudioFileDecoder"

    .line 10
    .line 11
    const-string v0, "AudioMix RtcAudioFileDecoder"

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
    iget-object v1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

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
    iget v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 21
    .line 22
    if-ne v3, v2, :cond_1

    .line 23
    .line 24
    iget v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

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
    iput v2, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 35
    .line 36
    iput v1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I
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
    const-string p0, "RtcAudioFileDecoder"

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
    const-string p0, "RtcAudioFileDecoder"

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
    const-string p0, "RtcAudioFileDecoder"

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
    const-string v3, "RtcAudioFileDecoder"

    .line 8
    .line 9
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-object v2, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iput-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iget-object v1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    const-string v0, "RtcAudioFileDecoder"

    .line 2
    .line 3
    const-string v1, "disConnectURL"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->oc:Ljava/net/HttpURLConnection;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

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
    iget p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    const-string p0, "RtcAudioFileDecoder"

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getFileLength()J
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mFileLength:J

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
    iget p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getUsedTrackIdx()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackIdx:I

    .line 2
    .line 3
    return p0
.end method

.method public init(Ljava/lang/String;I)Z
    .locals 9
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v1, "RtcAudioFileDecoder"

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
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

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
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->checkUrlEncoded(Ljava/lang/String;)Z

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
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->encodeUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->isAvailableOnlineURL(Ljava/lang/String;)Z

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
    iput v2, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mRetryCount:I

    .line 60
    .line 61
    new-instance v0, Landroid/media/MediaExtractor;

    .line 62
    .line 63
    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iget-object v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 143
    .line 144
    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_4
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 149
    .line 150
    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :goto_2
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iget-object v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iput v2, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

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
    iget-object v4, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iget-object v6, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iput-object v5, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 218
    .line 219
    const/4 v6, 0x0

    .line 220
    invoke-virtual {v5, v4, v6, v6, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 221
    .line 222
    .line 223
    iput-object v4, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 224
    .line 225
    iput v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackIdx:I

    .line 226
    .line 227
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 228
    .line 229
    iget-object v5, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

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
    iget v5, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

    .line 246
    .line 247
    if-le v4, v5, :cond_8

    .line 248
    .line 249
    iput v4, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

    .line 250
    .line 251
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_9
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 255
    .line 256
    if-eqz p1, :cond_a

    .line 257
    .line 258
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackFormat:Landroid/media/MediaFormat;

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
    iput p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 270
    .line 271
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackFormat:Landroid/media/MediaFormat;

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
    iput-wide p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mFileLength:J

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
    iget-object v4, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 10
    .line 11
    if-eqz v4, :cond_d

    .line 12
    .line 13
    iget-object v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 14
    .line 15
    if-nez v5, :cond_0

    .line 16
    .line 17
    goto/16 :goto_4

    .line 18
    .line 19
    :cond_0
    iget-boolean v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoInputStream:Z

    .line 20
    .line 21
    const-wide/16 v6, 0x0

    .line 22
    .line 23
    const/4 v8, 0x1

    .line 24
    const/4 v9, 0x0

    .line 25
    if-nez v5, :cond_4

    .line 26
    .line 27
    invoke-virtual {v4, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 28
    .line 29
    .line 30
    move-result v11

    .line 31
    if-ltz v11, :cond_4

    .line 32
    .line 33
    iget-object v4, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 34
    .line 35
    invoke-virtual {v4, v11}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    if-eqz v4, :cond_1

    .line 40
    .line 41
    iget-object v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 42
    .line 43
    invoke-virtual {v5, v4, v9}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    goto/16 :goto_5

    .line 50
    .line 51
    :cond_1
    move v4, v9

    .line 52
    :goto_0
    if-gtz v4, :cond_2

    .line 53
    .line 54
    iput-boolean v8, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoInputStream:Z

    .line 55
    .line 56
    move v13, v9

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v13, v4

    .line 59
    :goto_1
    iget-object v4, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 60
    .line 61
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 62
    .line 63
    .line 64
    move-result-wide v14

    .line 65
    iget-object v4, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    iget-boolean v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoInputStream:Z

    .line 72
    .line 73
    if-eqz v5, :cond_3

    .line 74
    .line 75
    or-int/lit8 v4, v4, 0x4

    .line 76
    .line 77
    :cond_3
    move/from16 v16, v4

    .line 78
    .line 79
    iget-object v10, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 80
    .line 81
    const/4 v12, 0x0

    .line 82
    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 83
    .line 84
    .line 85
    iget-object v4, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 86
    .line 87
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->advance()Z

    .line 88
    .line 89
    .line 90
    :cond_4
    iget-boolean v4, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z

    .line 91
    .line 92
    if-nez v4, :cond_e

    .line 93
    .line 94
    new-instance v4, Landroid/media/MediaCodec$BufferInfo;

    .line 95
    .line 96
    invoke-direct {v4}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 100
    .line 101
    invoke-virtual {v5, v4, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    const/4 v6, 0x0

    .line 106
    iput-object v6, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 107
    .line 108
    const/4 v6, -0x3

    .line 109
    if-eq v5, v6, :cond_c

    .line 110
    .line 111
    const/4 v6, -0x2

    .line 112
    if-eq v5, v6, :cond_c

    .line 113
    .line 114
    const/4 v6, -0x1

    .line 115
    if-eq v5, v6, :cond_9

    .line 116
    .line 117
    iput v9, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mRetryCount:I

    .line 118
    .line 119
    if-ltz v5, :cond_e

    .line 120
    .line 121
    iget v0, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 122
    .line 123
    const/4 v2, 0x4

    .line 124
    and-int/2addr v0, v2

    .line 125
    if-ne v0, v2, :cond_5

    .line 126
    .line 127
    iput-boolean v8, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z

    .line 128
    .line 129
    :cond_5
    iget-object v0, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 130
    .line 131
    invoke-virtual {v0, v5}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v2, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 136
    .line 137
    const-string v3, "channel-count"

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    iget v3, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mChannels:I

    .line 144
    .line 145
    if-eq v2, v3, :cond_7

    .line 146
    .line 147
    const/4 v6, 0x2

    .line 148
    if-ne v3, v6, :cond_7

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    mul-int/2addr v2, v6

    .line 155
    new-array v2, v2, [B

    .line 156
    .line 157
    iput-object v2, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 158
    .line 159
    move v2, v9

    .line 160
    :goto_2
    iget v3, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 161
    .line 162
    div-int/2addr v3, v6

    .line 163
    if-ge v2, v3, :cond_6

    .line 164
    .line 165
    iget-object v3, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 166
    .line 167
    mul-int/lit8 v7, v2, 0x4

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 170
    .line 171
    .line 172
    move-result v8

    .line 173
    aput-byte v8, v3, v7

    .line 174
    .line 175
    iget-object v3, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 176
    .line 177
    add-int/lit8 v8, v7, 0x2

    .line 178
    .line 179
    aget-byte v10, v3, v7

    .line 180
    .line 181
    aput-byte v10, v3, v8

    .line 182
    .line 183
    add-int/lit8 v8, v7, 0x1

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 186
    .line 187
    .line 188
    move-result v10

    .line 189
    aput-byte v10, v3, v8

    .line 190
    .line 191
    iget-object v3, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 192
    .line 193
    add-int/lit8 v7, v7, 0x3

    .line 194
    .line 195
    aget-byte v8, v3, v8

    .line 196
    .line 197
    aput-byte v8, v3, v7

    .line 198
    .line 199
    add-int/lit8 v2, v2, 0x1

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_6
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_7
    if-ne v2, v3, :cond_8

    .line 207
    .line 208
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    new-array v2, v2, [B

    .line 213
    .line 214
    iput-object v2, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 215
    .line 216
    iget v3, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 217
    .line 218
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 219
    .line 220
    invoke-virtual {v0, v2, v3, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 224
    .line 225
    .line 226
    :cond_8
    :goto_3
    iget-object v0, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 227
    .line 228
    invoke-virtual {v0, v5, v9}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 229
    .line 230
    .line 231
    goto/16 :goto_6

    .line 232
    .line 233
    :cond_9
    iget v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mRetryCount:I

    .line 234
    .line 235
    add-int/2addr v5, v8

    .line 236
    iput v5, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mRetryCount:I

    .line 237
    .line 238
    const/16 v6, 0x64

    .line 239
    .line 240
    if-lt v5, v6, :cond_b

    .line 241
    .line 242
    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v6

    .line 248
    invoke-virtual {v6, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 249
    .line 250
    .line 251
    move-result v6

    .line 252
    if-nez v6, :cond_a

    .line 253
    .line 254
    sget-object v6, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v7

    .line 260
    invoke-virtual {v7, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    if-nez v2, :cond_a

    .line 265
    .line 266
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    if-nez v2, :cond_a

    .line 275
    .line 276
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-eqz v0, :cond_b

    .line 285
    .line 286
    :cond_a
    const-string v0, "RtcAudioFileDecoder"

    .line 287
    .line 288
    new-instance v2, Ljava/lang/StringBuilder;

    .line 289
    .line 290
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    iget v3, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mRetryCount:I

    .line 294
    .line 295
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    const-string v3, " presentationTimeUs="

    .line 299
    .line 300
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    iget-wide v3, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 304
    .line 305
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string v3, " totalUs="

    .line 309
    .line 310
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    iget-wide v3, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mFileLength:J

    .line 314
    .line 315
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    const-string v3, " Force EOS"

    .line 319
    .line 320
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    iput-boolean v8, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z

    .line 331
    .line 332
    iput v9, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mRetryCount:I

    .line 333
    .line 334
    :cond_b
    new-array v0, v9, [B

    .line 335
    .line 336
    iput-object v0, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 337
    .line 338
    const-wide/16 v2, 0x3

    .line 339
    .line 340
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 341
    .line 342
    .line 343
    goto :goto_6

    .line 344
    :cond_c
    new-array v0, v9, [B

    .line 345
    .line 346
    iput-object v0, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mDecodedData:[B

    .line 347
    .line 348
    goto :goto_6

    .line 349
    :cond_d
    :goto_4
    iget-boolean v0, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoInputStream:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    .line 351
    return v0

    .line 352
    :goto_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 353
    .line 354
    .line 355
    :cond_e
    :goto_6
    iget-boolean v0, v1, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z

    .line 356
    .line 357
    return v0
.end method

.method public selectTrack(I)Z
    .locals 8
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "sample-rate"

    .line 2
    .line 3
    const-string v1, "RtcAudioFileDecoder"

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
    const/4 v5, 0x0

    .line 12
    :try_start_0
    iget-object v6, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

    .line 13
    .line 14
    if-nez v6, :cond_0

    .line 15
    .line 16
    return v5

    .line 17
    :cond_0
    add-int/lit8 v7, p1, 0x1

    .line 18
    .line 19
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    .line 20
    .line 21
    .line 22
    move-result v6

    .line 23
    if-le v7, v6, :cond_1

    .line 24
    .line 25
    return v5

    .line 26
    :cond_1
    iget v6, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackIdx:I

    .line 27
    .line 28
    if-ne v6, p1, :cond_2

    .line 29
    .line 30
    return v5

    .line 31
    :cond_2
    iget-object v6, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 32
    .line 33
    if-eqz v6, :cond_5

    .line 34
    .line 35
    iget-object v7, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 36
    .line 37
    if-nez v7, :cond_3

    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_3
    iget-object v2, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

    .line 42
    .line 43
    invoke-virtual {v2, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v6, v2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget v6, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 58
    .line 59
    invoke-virtual {v2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eq v6, v7, :cond_4

    .line 64
    .line 65
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mSampleRate:I

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p0, ", used_SampleRate = "

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return v5

    .line 95
    :catch_0
    move-exception p0

    .line 96
    goto :goto_1

    .line 97
    :cond_4
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 100
    .line 101
    .line 102
    move-result-wide v6

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 119
    .line 120
    iget-object v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

    .line 121
    .line 122
    iget v4, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackIdx:I

    .line 123
    .line 124
    invoke-virtual {v3, v4}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    invoke-virtual {v0, v3}, Landroid/media/MediaExtractor;->unselectTrack(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 138
    .line 139
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 140
    .line 141
    .line 142
    const-string v0, "mime"

    .line 143
    .line 144
    invoke-virtual {v2, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 148
    .line 149
    iget-object v3, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mTrackIds:Ljava/util/Vector;

    .line 150
    .line 151
    invoke-virtual {v3, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Ljava/lang/Integer;

    .line 156
    .line 157
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    invoke-virtual {v0, v3}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 165
    .line 166
    const/4 v3, 0x2

    .line 167
    invoke-virtual {v0, v6, v7, v3}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 171
    .line 172
    const/4 v3, 0x0

    .line 173
    invoke-virtual {v0, v2, v3, v3, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 177
    .line 178
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 179
    .line 180
    .line 181
    iput-object v2, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackFormat:Landroid/media/MediaFormat;

    .line 182
    .line 183
    iput p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mUsedTrackIdx:I

    .line 184
    .line 185
    const/4 p0, 0x1

    .line 186
    return p0

    .line 187
    :cond_5
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 193
    .line 194
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v0, ", mMediaCodec = "

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 203
    .line 204
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .line 213
    .line 214
    return v5

    .line 215
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 216
    .line 217
    .line 218
    const-string p0, "Error when selectTrack"

    .line 219
    .line 220
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    return v5
.end method

.method public setCurrentFilePosition(J)V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z

    .line 2
    .line 3
    const-string v1, "RtcAudioFileDecoder"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

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
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

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
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoInputStream:Z

    .line 33
    .line 34
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z
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
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

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
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mMediaCodec:Landroid/media/MediaCodec;

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
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->mExtractor:Landroid/media/MediaExtractor;
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
    const-string v1, "RtcAudioFileDecoder"

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
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoOutputStream:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/RtcAudioFileDecoder;->eoInputStream:Z

    .line 59
    .line 60
    return-void
.end method
