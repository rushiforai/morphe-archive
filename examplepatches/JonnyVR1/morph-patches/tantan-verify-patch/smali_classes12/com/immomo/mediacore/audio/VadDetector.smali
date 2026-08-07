.class public Lcom/immomo/mediacore/audio/VadDetector;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "VadDetector"

.field private static volatile mIsLibLoaded:Z

.field private static sLocalLibLoader:Ll/wfm;


# instance fields
.field public final DETECT_LEN:I

.field private activecount:I

.field private denoiseLevel:I

.field private detectDuration:I

.field private hasMuteLevel:I

.field private isVad:Z

.field private mNativeVad:J

.field private preVadMuteCount:I

.field private preVadProcessCount:I

.field public remainBuf:[B

.field private remainBuffer:Ljava/nio/ByteBuffer;

.field private remainLen:I

.field private resampleUtils:Lcom/immomo/mediabase/AudioResampleUtils;

.field private vadMuteCount:I

.field private vadProcessCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/VadDetector$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/VadDetector$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/mediacore/audio/VadDetector;->sLocalLibLoader:Ll/wfm;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->mNativeVad:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainLen:I

    .line 10
    .line 11
    const/16 v1, 0xa

    .line 12
    .line 13
    iput v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->detectDuration:I

    .line 14
    .line 15
    mul-int/lit8 v1, v1, 0x30

    .line 16
    .line 17
    mul-int/lit8 v1, v1, 0x2

    .line 18
    .line 19
    iput v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->DETECT_LEN:I

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuf:[B

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    iput-boolean v2, p0, Lcom/immomo/mediacore/audio/VadDetector;->isVad:Z

    .line 26
    .line 27
    iput-object v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->resampleUtils:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadProcessCount:I

    .line 32
    .line 33
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->preVadProcessCount:I

    .line 34
    .line 35
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadMuteCount:I

    .line 36
    .line 37
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->preVadMuteCount:I

    .line 38
    .line 39
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->activecount:I

    .line 40
    .line 41
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 42
    .line 43
    iput v2, p0, Lcom/immomo/mediacore/audio/VadDetector;->denoiseLevel:I

    .line 44
    .line 45
    invoke-static {v1}, Lcom/immomo/mediacore/audio/VadDetector;->loadLibrariesOnce(Ll/wfm;)V

    .line 46
    .line 47
    .line 48
    sget-boolean v0, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0, v0}, Lcom/immomo/mediacore/audio/VadDetector;->native_setup(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method private native initVad(I)V
.end method

.method private static loadLibrariesOnce(Ll/wfm;)V
    .locals 3

    .line 1
    const-class v0, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/immomo/mediacore/audio/VadDetector;->sLocalLibLoader:Ll/wfm;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 16
    :try_start_1
    const-string v2, "ijkaudioprocess"

    .line 17
    .line 18
    invoke-interface {p0, v2}, Ll/wfm;->loadLibrary(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    sput-boolean p0, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 23
    .line 24
    const-string p0, "VadDetector"

    .line 25
    .line 26
    const-string v2, "load so success"

    .line 27
    .line 28
    invoke-static {p0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    .line 31
    :try_start_2
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :catch_0
    sput-boolean v1, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :catch_1
    sput-boolean v1, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 37
    .line 38
    :goto_1
    const-string p0, "VadDetector"

    .line 39
    .line 40
    const-string v1, "load so failed"

    .line 41
    .line 42
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :cond_1
    const-string p0, "VadDetector"

    .line 48
    .line 49
    const-string v1, "load so already"

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    monitor-exit v0

    .line 55
    return-void

    .line 56
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 57
    throw p0
.end method

.method private native native_setup(Ljava/lang/Object;)V
.end method

.method private native release()V
.end method

.method private native vadProcess(Ljava/nio/ByteBuffer;I)I
.end method

.method private native vadProcesstmp([BI)I
.end method


# virtual methods
.method public adjustSabinLevel(I)Z
    .locals 5

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadProcessCount:I

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    add-int/2addr v0, v2

    .line 14
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadProcessCount:I

    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadMuteCount:I

    .line 19
    .line 20
    add-int/2addr p1, v2

    .line 21
    iput p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadMuteCount:I

    .line 22
    .line 23
    :cond_1
    if-lez v0, :cond_8

    .line 24
    .line 25
    rem-int/lit16 p1, v0, 0x1f4

    .line 26
    .line 27
    if-nez p1, :cond_8

    .line 28
    .line 29
    iget p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->vadMuteCount:I

    .line 30
    .line 31
    iget v3, p0, Lcom/immomo/mediacore/audio/VadDetector;->preVadMuteCount:I

    .line 32
    .line 33
    sub-int v3, p1, v3

    .line 34
    .line 35
    int-to-float v3, v3

    .line 36
    const/high16 v4, 0x3f800000    # 1.0f

    .line 37
    .line 38
    mul-float/2addr v3, v4

    .line 39
    iget v4, p0, Lcom/immomo/mediacore/audio/VadDetector;->preVadProcessCount:I

    .line 40
    .line 41
    sub-int v4, v0, v4

    .line 42
    .line 43
    int-to-float v4, v4

    .line 44
    div-float/2addr v3, v4

    .line 45
    iput p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->preVadMuteCount:I

    .line 46
    .line 47
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->preVadProcessCount:I

    .line 48
    .line 49
    const/high16 p1, 0x3f000000    # 0.5f

    .line 50
    .line 51
    cmpl-float p1, v3, p1

    .line 52
    .line 53
    const/4 v0, 0x2

    .line 54
    if-lez p1, :cond_2

    .line 55
    .line 56
    iget p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 57
    .line 58
    add-int/2addr p1, v2

    .line 59
    iput p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 60
    .line 61
    iput v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->activecount:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->activecount:I

    .line 65
    .line 66
    add-int/2addr p1, v2

    .line 67
    iput p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->activecount:I

    .line 68
    .line 69
    if-lt p1, v0, :cond_3

    .line 70
    .line 71
    iput v1, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    iget p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 75
    .line 76
    if-lez p1, :cond_4

    .line 77
    .line 78
    sub-int/2addr p1, v2

    .line 79
    iput p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 80
    .line 81
    :cond_4
    :goto_0
    iget p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->hasMuteLevel:I

    .line 82
    .line 83
    if-lez p1, :cond_6

    .line 84
    .line 85
    const/4 v1, 0x4

    .line 86
    if-lt p1, v0, :cond_5

    .line 87
    .line 88
    if-gt p1, v1, :cond_5

    .line 89
    .line 90
    iput v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->denoiseLevel:I

    .line 91
    .line 92
    :cond_5
    if-le p1, v1, :cond_7

    .line 93
    .line 94
    const/4 p1, 0x3

    .line 95
    iput p1, p0, Lcom/immomo/mediacore/audio/VadDetector;->denoiseLevel:I

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_6
    iput v2, p0, Lcom/immomo/mediacore/audio/VadDetector;->denoiseLevel:I

    .line 99
    .line 100
    :cond_7
    :goto_1
    return v2

    .line 101
    :cond_8
    :goto_2
    return v1
.end method

.method public getDenoiseLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/VadDetector;->denoiseLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public initVadDector(I)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/audio/VadDetector;->initVad(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public releaseVad()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/VadDetector;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public vadDetect([BIII)I
    .locals 10

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/VadDetector;->mIsLibLoaded:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lcom/immomo/mediacore/audio/VadDetector;->DETECT_LEN:I

    .line 8
    .line 9
    if-ge p2, v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    iget-object p2, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    if-nez p2, :cond_2

    .line 16
    .line 17
    mul-int/2addr v0, v2

    .line 18
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iput-object p2, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    :cond_2
    const/4 p2, 0x0

    .line 25
    if-ne p3, v2, :cond_5

    .line 26
    .line 27
    array-length p3, p1

    .line 28
    div-int/2addr p3, v2

    .line 29
    new-array v0, p3, [B

    .line 30
    .line 31
    move v3, p2

    .line 32
    :goto_0
    if-ge v3, p3, :cond_4

    .line 33
    .line 34
    rem-int/lit8 v4, v3, 0x2

    .line 35
    .line 36
    if-nez v4, :cond_3

    .line 37
    .line 38
    mul-int/lit8 v4, v3, 0x2

    .line 39
    .line 40
    invoke-static {p1, v4, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_4
    move-object p1, v0

    .line 47
    :cond_5
    const p3, 0xbb80

    .line 48
    .line 49
    .line 50
    if-eq p4, p3, :cond_7

    .line 51
    .line 52
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->resampleUtils:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 53
    .line 54
    if-nez p3, :cond_6

    .line 55
    .line 56
    new-instance v3, Lcom/immomo/mediabase/AudioResampleUtils;

    .line 57
    .line 58
    invoke-direct {v3}, Lcom/immomo/mediabase/AudioResampleUtils;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v3, p0, Lcom/immomo/mediacore/audio/VadDetector;->resampleUtils:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 62
    .line 63
    const/4 v8, 0x1

    .line 64
    const/16 v9, 0x10

    .line 65
    .line 66
    const/4 v5, 0x1

    .line 67
    const/16 v6, 0x10

    .line 68
    .line 69
    const v7, 0xbb80

    .line 70
    .line 71
    .line 72
    move v4, p4

    .line 73
    invoke-virtual/range {v3 .. v9}, Lcom/immomo/mediabase/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 74
    .line 75
    .line 76
    :cond_6
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->resampleUtils:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 77
    .line 78
    array-length p4, p1

    .line 79
    div-int/2addr p4, v2

    .line 80
    invoke-virtual {p3, p1, p4}, Lcom/immomo/mediabase/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    new-array p3, p3, [B

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 91
    .line 92
    .line 93
    move-result p4

    .line 94
    invoke-virtual {p1, p3, p2, p4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    move-object p1, p3

    .line 98
    :cond_7
    :try_start_0
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 99
    .line 100
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    array-length p4, p1

    .line 105
    if-ge p3, p4, :cond_8

    .line 106
    .line 107
    return v1

    .line 108
    :cond_8
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    invoke-virtual {p3}, Ljava/nio/Buffer;->remaining()I

    .line 111
    .line 112
    .line 113
    move-result p3

    .line 114
    array-length p4, p1

    .line 115
    if-ge p3, p4, :cond_9

    .line 116
    .line 117
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 120
    .line 121
    .line 122
    :cond_9
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    invoke-virtual {p3, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    iget-object p3, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 133
    .line 134
    iget p4, p0, Lcom/immomo/mediacore/audio/VadDetector;->DETECT_LEN:I

    .line 135
    .line 136
    invoke-virtual {p3, p1, p2, p4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 137
    .line 138
    .line 139
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iget p2, p0, Lcom/immomo/mediacore/audio/VadDetector;->DETECT_LEN:I

    .line 144
    .line 145
    div-int/2addr p2, v2

    .line 146
    invoke-direct {p0, p1, p2}, Lcom/immomo/mediacore/audio/VadDetector;->vadProcess(Ljava/nio/ByteBuffer;I)I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    iget-object p0, p0, Lcom/immomo/mediacore/audio/VadDetector;->remainBuffer:Ljava/nio/ByteBuffer;

    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .line 154
    .line 155
    :catch_0
    return v1
.end method
