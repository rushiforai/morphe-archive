.class public Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecEncoder"

.field private static mDumpEnable:Z


# instance fields
.field private mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mAudioAACEncoder:Landroid/media/MediaCodec;

.field private mAudioFormat:Landroid/media/MediaFormat;

.field private mBitrate:I

.field private mChannels:I

.field private mContext:Landroid/content/Context;

.field private mEncInBuffer:Ljava/nio/ByteBuffer;

.field private mEncOutBuffer:Ljava/nio/ByteBuffer;

.field private mFormatChangeFlag:Z

.field private mInputBuffer:Ljava/nio/ByteBuffer;

.field private mMediaInputBuffers:[Ljava/nio/ByteBuffer;

.field private mMediaOutputBuffers:[Ljava/nio/ByteBuffer;

.field private mOutputBuffer:Ljava/nio/ByteBuffer;

.field private mRecFileDump:Ljava/io/File;

.field private mRecFileOut:Ljava/io/FileOutputStream;

.field private mSampleRate:I

.field private mTempBufEncIn:[B

.field private mTempBufEncOut:[B

.field private nMaxBitRate:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    const v1, 0xbb80

    .line 16
    .line 17
    .line 18
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mSampleRate:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mChannels:I

    .line 22
    .line 23
    const/16 v1, 0x7d00

    .line 24
    .line 25
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mBitrate:I

    .line 26
    .line 27
    const v1, 0x3e800

    .line 28
    .line 29
    .line 30
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->nMaxBitRate:I

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iput-boolean v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mFormatChangeFlag:Z

    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileDump:Ljava/io/File;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileOut:Ljava/io/FileOutputStream;

    .line 38
    .line 39
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getAppContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mContext:Landroid/content/Context;

    .line 44
    .line 45
    const/16 v0, 0x1e00

    .line 46
    .line 47
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncInBuffer:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    new-array v0, v0, [B

    .line 54
    .line 55
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncIn:[B

    .line 56
    .line 57
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->nMaxBitRate:I

    .line 58
    .line 59
    mul-int/lit8 v0, v0, 0x2

    .line 60
    .line 61
    div-int/lit8 v0, v0, 0x8

    .line 62
    .line 63
    div-int/lit8 v0, v0, 0x32

    .line 64
    .line 65
    add-int/lit8 v0, v0, 0x64

    .line 66
    .line 67
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncOutBuffer:Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->nMaxBitRate:I

    .line 74
    .line 75
    mul-int/lit8 v0, v0, 0x2

    .line 76
    .line 77
    div-int/lit8 v0, v0, 0x8

    .line 78
    .line 79
    div-int/lit8 v0, v0, 0x32

    .line 80
    .line 81
    add-int/lit8 v0, v0, 0x64

    .line 82
    .line 83
    new-array v0, v0, [B

    .line 84
    .line 85
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncOut:[B

    .line 86
    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 89
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 90
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 91
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 92
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 93
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    const v1, 0xbb80

    .line 94
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mSampleRate:I

    const/4 v1, 0x1

    .line 95
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mChannels:I

    const/16 v1, 0x7d00

    .line 96
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mBitrate:I

    const v1, 0x3e800

    .line 97
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->nMaxBitRate:I

    const/4 v1, 0x0

    .line 98
    iput-boolean v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mFormatChangeFlag:Z

    .line 99
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileDump:Ljava/io/File;

    .line 100
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileOut:Ljava/io/FileOutputStream;

    .line 101
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mContext:Landroid/content/Context;

    const/16 p1, 0x1e00

    .line 102
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncInBuffer:Ljava/nio/ByteBuffer;

    .line 103
    new-array p1, p1, [B

    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncIn:[B

    .line 104
    iget p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->nMaxBitRate:I

    mul-int/lit8 p1, p1, 0x2

    div-int/lit8 p1, p1, 0x8

    div-int/lit8 p1, p1, 0x32

    add-int/lit8 p1, p1, 0x64

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncOutBuffer:Ljava/nio/ByteBuffer;

    .line 105
    iget p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->nMaxBitRate:I

    mul-int/lit8 p1, p1, 0x2

    div-int/lit8 p1, p1, 0x8

    div-int/lit8 p1, p1, 0x32

    add-int/lit8 p1, p1, 0x64

    new-array p1, p1, [B

    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncOut:[B

    return-void
.end method

.method private addADTStoPacket([BI)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mSampleRate:I

    .line 2
    .line 3
    const v1, 0xbb80

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x4

    .line 7
    const/4 v3, 0x6

    .line 8
    const/4 v4, 0x5

    .line 9
    const/4 v5, 0x3

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    :cond_0
    move v0, v5

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const v1, 0xac44

    .line 15
    .line 16
    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    move v0, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_2
    const/16 v1, 0x7d00

    .line 22
    .line 23
    if-ne v0, v1, :cond_3

    .line 24
    .line 25
    move v0, v4

    .line 26
    goto :goto_0

    .line 27
    :cond_3
    const/16 v1, 0x5dc0

    .line 28
    .line 29
    if-ne v0, v1, :cond_4

    .line 30
    .line 31
    move v0, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_4
    const/16 v1, 0x3e80

    .line 34
    .line 35
    if-ne v0, v1, :cond_0

    .line 36
    .line 37
    const/16 v0, 0x8

    .line 38
    .line 39
    :goto_0
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mChannels:I

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    const/4 v6, -0x1

    .line 43
    aput-byte v6, p1, v1

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    const/4 v6, -0x7

    .line 47
    aput-byte v6, p1, v1

    .line 48
    .line 49
    const/16 v1, 0x40

    .line 50
    .line 51
    const/4 v6, 0x2

    .line 52
    shl-int/2addr v0, v6

    .line 53
    add-int/2addr v1, v0

    .line 54
    shr-int/lit8 v0, p0, 0x2

    .line 55
    .line 56
    add-int/2addr v1, v0

    .line 57
    int-to-byte v0, v1

    .line 58
    aput-byte v0, p1, v6

    .line 59
    .line 60
    and-int/2addr p0, v5

    .line 61
    shl-int/2addr p0, v3

    .line 62
    shr-int/lit8 v0, p2, 0xb

    .line 63
    .line 64
    add-int/2addr p0, v0

    .line 65
    int-to-byte p0, p0

    .line 66
    aput-byte p0, p1, v5

    .line 67
    .line 68
    and-int/lit16 p0, p2, 0x7ff

    .line 69
    .line 70
    shr-int/2addr p0, v5

    .line 71
    int-to-byte p0, p0

    .line 72
    aput-byte p0, p1, v2

    .line 73
    .line 74
    and-int/lit8 p0, p2, 0x7

    .line 75
    .line 76
    shl-int/2addr p0, v4

    .line 77
    add-int/lit8 p0, p0, 0x1f

    .line 78
    .line 79
    int-to-byte p0, p0

    .line 80
    aput-byte p0, p1, v4

    .line 81
    .line 82
    const/4 p0, -0x4

    .line 83
    aput-byte p0, p1, v3

    .line 84
    .line 85
    return-void
.end method

.method private getDumpFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    const-string v2, "TRAE"

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v3, "manufacture:"

    .line 13
    .line 14
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v3, "MODEL:"

    .line 38
    .line 39
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mContext:Landroid/content/Context;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_2
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p0, "/MF-"

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    sget-object p0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p0, "-M-"

    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p0, "-"

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance p1, Ljava/io/File;

    .line 112
    .line 113
    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 131
    .line 132
    .line 133
    :cond_4
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_5

    .line 138
    .line 139
    const-string p1, "dump:"

    .line 140
    .line 141
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {v2, v1, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_5
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    const-string v0, "_"

    .line 153
    .line 154
    const-string v3, " "

    .line 155
    .line 156
    if-eqz p1, :cond_6

    .line 157
    .line 158
    new-instance p1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v4, "dump replace:"

    .line 161
    .line 162
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {v2, v1, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :cond_6
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    return-object p0
.end method


# virtual methods
.method public createAACEncoder(III)I
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const-string v0, ")"

    .line 2
    .line 3
    const-string v1, "audio/mp4a-latm"

    .line 4
    .line 5
    const-string v2, ", "

    .line 6
    .line 7
    const-string v3, "MediaCodecEncoder"

    .line 8
    .line 9
    const-string v4, "createAACEncoder succeed!!! : ("

    .line 10
    .line 11
    const/4 v5, 0x2

    .line 12
    :try_start_0
    invoke-static {v1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 13
    .line 14
    .line 15
    move-result-object v6

    .line 16
    iput-object v6, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 17
    .line 18
    invoke-static {v1, p1, p2}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 23
    .line 24
    const-string v6, "aac-profile"

    .line 25
    .line 26
    invoke-virtual {v1, v6, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 30
    .line 31
    const-string v6, "sample-rate"

    .line 32
    .line 33
    invoke-virtual {v1, v6, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 37
    .line 38
    const-string v6, "channel-count"

    .line 39
    .line 40
    invoke-virtual {v1, v6, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 44
    .line 45
    const-string v6, "bitrate"

    .line 46
    .line 47
    invoke-virtual {v1, v6, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 51
    .line 52
    iget-object v6, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 53
    .line 54
    const/4 v7, 0x1

    .line 55
    const/4 v8, 0x0

    .line 56
    invoke-virtual {v1, v6, v8, v8, v7}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 60
    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/media/MediaCodec;->start()V

    .line 64
    .line 65
    .line 66
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 67
    .line 68
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 72
    .line 73
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mSampleRate:I

    .line 74
    .line 75
    iput p2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mChannels:I

    .line 76
    .line 77
    iput p3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mBitrate:I

    .line 78
    .line 79
    :cond_0
    sget-boolean v1, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mDumpEnable:Z

    .line 80
    .line 81
    if-eqz v1, :cond_1

    .line 82
    .line 83
    new-instance v1, Ljava/io/File;

    .line 84
    .line 85
    const-string v6, "jnirecord.aac"

    .line 86
    .line 87
    invoke-direct {p0, v6}, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->getDumpFilePath(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileDump:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 95
    .line 96
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    .line 97
    .line 98
    iget-object v6, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileDump:Ljava/io/File;

    .line 99
    .line 100
    invoke-direct {v1, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 101
    .line 102
    .line 103
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileOut:Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catch_0
    :try_start_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-eqz p0, :cond_1

    .line 111
    .line 112
    const-string p0, "open jnirecord.aac file failed."

    .line 113
    .line 114
    invoke-static {v3, v5, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    :goto_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_2

    .line 122
    .line 123
    new-instance p0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {p0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {v3, v5, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 151
    .line 152
    .line 153
    :cond_2
    const/4 p0, 0x0

    .line 154
    return p0

    .line 155
    :catch_1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-eqz p0, :cond_3

    .line 160
    .line 161
    const-string p0, "create AAC Encoder failed."

    .line 162
    .line 163
    invoke-static {v3, v5, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_3
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    if-eqz p0, :cond_4

    .line 171
    .line 172
    new-instance p0, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v1, "[ERROR] creating aac encode stream failed!!! : ("

    .line 175
    .line 176
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {v3, v5, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_4
    const/4 p0, -0x1

    .line 205
    return p0
.end method

.method public encodeAACFrame(I)I
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mFormatChangeFlag:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mFormatChangeFlag:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 14
    .line 15
    const-string v2, "bitrate"

    .line 16
    .line 17
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mBitrate:I

    .line 18
    .line 19
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioFormat:Landroid/media/MediaFormat;

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v0, v2, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncInBuffer:Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncIn:[B

    .line 39
    .line 40
    invoke-virtual {v0, v2, v1, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->encodeInternalAACFrame(I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncOutBuffer:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    if-lez p1, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncOutBuffer:Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncOut:[B

    .line 57
    .line 58
    invoke-virtual {v0, v2, v1, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mDumpEnable:Z

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileOut:Ljava/io/FileOutputStream;

    .line 66
    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    add-int/lit8 v0, p1, 0x7

    .line 70
    .line 71
    :try_start_0
    new-array v2, v0, [B

    .line 72
    .line 73
    invoke-direct {p0, v2, v0}, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->addADTStoPacket([BI)V

    .line 74
    .line 75
    .line 76
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncOut:[B

    .line 77
    .line 78
    const/4 v4, 0x7

    .line 79
    invoke-static {v3, v1, v2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mRecFileOut:Ljava/io/FileOutputStream;

    .line 83
    .line 84
    invoke-virtual {p0, v2, v1, v0}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :catch_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_1

    .line 93
    .line 94
    const/4 p0, 0x2

    .line 95
    const-string v0, "write file failed."

    .line 96
    .line 97
    const-string v1, "MediaCodecEncoder"

    .line 98
    .line 99
    invoke-static {v1, p0, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    :goto_0
    return p1

    .line 103
    :cond_2
    return v1
.end method

.method public encodeInternalAACFrame(I)I
    .locals 13
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const-string v1, "MediaCodecEncoder"

    .line 2
    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 6
    .line 7
    const-wide/16 v4, 0x7d0

    .line 8
    .line 9
    invoke-virtual {v0, v4, v5}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    const/4 v0, -0x1

    .line 14
    if-eq v7, v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 17
    .line 18
    invoke-virtual {v0, v7}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncIn:[B

    .line 30
    .line 31
    invoke-virtual {v0, v4, v3, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    iget-object v6, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 35
    .line 36
    const-wide/16 v10, 0x0

    .line 37
    .line 38
    const/4 v12, 0x0

    .line 39
    const/4 v8, 0x0

    .line 40
    move v9, p1

    .line 41
    invoke-virtual/range {v6 .. v12}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mEncInBuffer:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    goto :goto_2

    .line 53
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 56
    .line 57
    const-wide/16 v4, 0x0

    .line 58
    .line 59
    invoke-virtual {p1, v0, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-gez p1, :cond_1

    .line 64
    .line 65
    return v3

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 67
    .line 68
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 69
    .line 70
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 71
    .line 72
    invoke-virtual {v4, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    iput-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 79
    .line 80
    iget v6, v5, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 81
    .line 82
    and-int/2addr v6, v2

    .line 83
    if-ne v6, v2, :cond_2

    .line 84
    .line 85
    move v6, v3

    .line 86
    goto :goto_1

    .line 87
    :cond_2
    iget v6, v5, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    :goto_1
    :try_start_1
    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 90
    .line 91
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAACEncBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 97
    .line 98
    iget v5, v5, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 99
    .line 100
    add-int/2addr v5, v0

    .line 101
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mTempBufEncOut:[B

    .line 107
    .line 108
    invoke-virtual {v0, v4, v3, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mOutputBuffer:Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 117
    .line 118
    invoke-virtual {p0, p1, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 119
    .line 120
    .line 121
    return v6

    .line 122
    :catch_1
    :try_start_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_3

    .line 127
    .line 128
    const-string p0, "[ERROR] encoding aac stream failed!!!"

    .line 129
    .line 130
    invoke-static {v1, v2, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 131
    .line 132
    .line 133
    :cond_3
    move v3, v6

    .line 134
    goto :goto_3

    .line 135
    :goto_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_4

    .line 140
    .line 141
    new-instance p1, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v0, "encode failed."

    .line 144
    .line 145
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {v1, v2, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_4
    :goto_3
    return v3
.end method

.method public releaseAACEncoder()I
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    const-string v0, "MediaCodecEncoder"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 5
    .line 6
    if-eqz v2, :cond_1

    .line 7
    .line 8
    invoke-virtual {v2}, Landroid/media/MediaCodec;->stop()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-object v2, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 18
    .line 19
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const-string p0, "releaseAACEncoder, release aac encode stream succeed!!"

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :goto_1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "release aac encoder failed."

    .line 44
    .line 45
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {v0, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_2

    .line 67
    .line 68
    const-string p0, "[ERROR] releaseAACEncoder, release aac encode stream failed!!!"

    .line 69
    .line 70
    invoke-static {v0, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    const/4 p0, -0x1

    .line 74
    return p0
.end method

.method public setAACEncodeBitrate(I)I
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mAudioAACEncoder:Landroid/media/MediaCodec;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mBitrate:I

    .line 6
    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mFormatChangeFlag:Z

    .line 11
    .line 12
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/MediaCodecEncoder;->mBitrate:I

    .line 13
    .line 14
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v0, "Set AAC bitrate = "

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "MediaCodecEncoder"

    .line 35
    .line 36
    const/4 v0, 0x2

    .line 37
    invoke-static {p1, v0, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method
