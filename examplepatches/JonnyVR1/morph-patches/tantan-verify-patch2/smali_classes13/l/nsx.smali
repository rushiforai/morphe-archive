.class public Ll/nsx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static k:I = 0x0

.field public static l:I = 0x1


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field protected d:Ll/zrx;

.field protected e:Ll/zrx;

.field protected f:Ll/g220;

.field protected g:Landroid/media/MediaFormat;

.field protected h:Landroid/media/MediaFormat;

.field protected i:Ljava/lang/Object;

.field protected j:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MediaEncoderWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Ll/nsx;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "video/avc"

    .line 9
    .line 10
    iput-object v0, p0, Ll/nsx;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "audio/mp4a-latm"

    .line 13
    .line 14
    iput-object v0, p0, Ll/nsx;->c:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/nsx;->d:Ll/zrx;

    .line 18
    .line 19
    iput-object v0, p0, Ll/nsx;->e:Ll/zrx;

    .line 20
    .line 21
    iput-object v0, p0, Ll/nsx;->f:Ll/g220;

    .line 22
    .line 23
    iput-object v0, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 24
    .line 25
    iput-object v0, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/Object;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput v0, p0, Ll/nsx;->j:I

    .line 36
    .line 37
    return-void
.end method

.method private c(Ljava/lang/String;I)Z
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    move v1, p0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_3

    .line 10
    .line 11
    invoke-static {v1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_2

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    move v4, p0

    .line 31
    :goto_1
    array-length v5, v3

    .line 32
    if-ge v4, v5, :cond_2

    .line 33
    .line 34
    aget-object v5, v3, v4

    .line 35
    .line 36
    invoke-virtual {v5, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz v5, :cond_1

    .line 41
    .line 42
    invoke-virtual {v2, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    if-eqz v5, :cond_1

    .line 51
    .line 52
    invoke-virtual {v5, p2}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0

    .line 57
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    return p0
.end method


# virtual methods
.method public a(Ll/oxd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/nsx;->e:Ll/zrx;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/zrx;->f(Ll/oxd0;)V

    .line 9
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

.method public b()Landroid/view/Surface;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/nsx;->d:Ll/zrx;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/zrx;->g()Landroid/view/Surface;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    monitor-exit v0

    .line 13
    return-object p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    monitor-exit v0

    .line 18
    return-object p0

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public d(IIIIII)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const-string v0, "Invalid parameter!  sampleRate="

    .line 2
    .line 3
    iget-object v1, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    if-eqz p3, :cond_3

    .line 9
    .line 10
    if-eqz p4, :cond_3

    .line 11
    .line 12
    if-eqz p5, :cond_3

    .line 13
    .line 14
    :try_start_0
    iget-object p2, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 15
    .line 16
    if-nez p2, :cond_2

    .line 17
    .line 18
    new-instance p2, Landroid/media/MediaFormat;

    .line 19
    .line 20
    invoke-direct {p2}, Landroid/media/MediaFormat;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 24
    .line 25
    const-string v0, "mime"

    .line 26
    .line 27
    const-string v2, "audio/mp4a-latm"

    .line 28
    .line 29
    invoke-virtual {p2, v0, v2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 33
    .line 34
    const-string v0, "bitrate"

    .line 35
    .line 36
    invoke-virtual {p2, v0, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 40
    .line 41
    const-string p4, "channel-count"

    .line 42
    .line 43
    invoke-virtual {p2, p4, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 47
    .line 48
    const-string p3, "sample-rate"

    .line 49
    .line 50
    invoke-virtual {p2, p3, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 54
    .line 55
    const-string p2, "max-input-size"

    .line 56
    .line 57
    invoke-virtual {p1, p2, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    iget p1, p0, Ll/nsx;->j:I

    .line 61
    .line 62
    const/4 p2, 0x1

    .line 63
    or-int/2addr p1, p2

    .line 64
    iput p1, p0, Ll/nsx;->j:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    if-eq p6, p2, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 69
    .line 70
    const/4 p1, 0x2

    .line 71
    if-eq p6, p1, :cond_0

    .line 72
    .line 73
    :try_start_1
    const-string p2, "aac-profile"

    .line 74
    .line 75
    invoke-virtual {p0, p2, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    goto :goto_1

    .line 81
    :cond_0
    const-string p1, "aac-profile"

    .line 82
    .line 83
    const/16 p2, 0x1d

    .line 84
    .line 85
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object p0, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 90
    .line 91
    const-string p1, "aac-profile"

    .line 92
    .line 93
    const/4 p2, 0x5

    .line 94
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_0
    monitor-exit v1

    .line 98
    return-void

    .line 99
    :cond_3
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 100
    .line 101
    new-instance p6, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p1, " bits="

    .line 110
    .line 111
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string p1, " channels="

    .line 118
    .line 119
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p1, " bitrate="

    .line 126
    .line 127
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string p1, " maxInputBufsize="

    .line 134
    .line 135
    invoke-virtual {p6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p6, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    throw p0

    .line 149
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 150
    throw p0
.end method

.method public e(I)Z
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "bitRate:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "setVideoEncodeingBitRate"

    .line 20
    .line 21
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/nsx;->d:Ll/zrx;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/zrx;->j(I)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public f(Ljava/lang/String;IIIIII)V
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const-string v0, "Parameter is invalid ! width="

    .line 2
    .line 3
    const-string v1, "EVMode="

    .line 4
    .line 5
    iget-object v2, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    if-nez p4, :cond_0

    .line 9
    .line 10
    const/16 p4, 0xf

    .line 11
    .line 12
    :cond_0
    if-nez p5, :cond_1

    .line 13
    .line 14
    const p5, 0x7a120

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 v3, 0x1

    .line 18
    if-nez p6, :cond_2

    .line 19
    .line 20
    move p6, v3

    .line 21
    :cond_2
    if-eqz p2, :cond_a

    .line 22
    .line 23
    if-eqz p3, :cond_a

    .line 24
    .line 25
    if-eqz p4, :cond_a

    .line 26
    .line 27
    if-eqz p5, :cond_a

    .line 28
    .line 29
    if-eqz p6, :cond_a

    .line 30
    .line 31
    :try_start_0
    sget v4, Ll/nsx;->k:I

    .line 32
    .line 33
    if-lt p7, v4, :cond_a

    .line 34
    .line 35
    sget v4, Ll/nsx;->l:I

    .line 36
    .line 37
    if-gt p7, v4, :cond_a

    .line 38
    .line 39
    iget-object v0, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 40
    .line 41
    if-nez v0, :cond_9

    .line 42
    .line 43
    invoke-static {p1, p2, p3}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iput-object p2, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 48
    .line 49
    const-string p3, "bitrate"

    .line 50
    .line 51
    invoke-virtual {p2, p3, p5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 55
    .line 56
    const-string p3, "frame-rate"

    .line 57
    .line 58
    invoke-virtual {p2, p3, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 62
    .line 63
    const-string p3, "i-frame-interval"

    .line 64
    .line 65
    invoke-virtual {p2, p3, p6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 69
    .line 70
    const/16 p3, 0x1d

    .line 71
    .line 72
    if-lt p2, p3, :cond_3

    .line 73
    .line 74
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Ll/csx;->L()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-ne p2, v3, :cond_3

    .line 83
    .line 84
    iget-object p2, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 85
    .line 86
    const-string p3, "max-bframes"

    .line 87
    .line 88
    invoke-virtual {p2, p3, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto/16 :goto_3

    .line 94
    .line 95
    :cond_3
    :goto_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p2}, Ll/csx;->I()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    const/4 p3, 0x2

    .line 104
    if-eqz p2, :cond_6

    .line 105
    .line 106
    invoke-direct {p0, p1, v3}, Ll/nsx;->c(Ljava/lang/String;I)Z

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    if-eqz p2, :cond_4

    .line 111
    .line 112
    const-string p2, "zhengjijian"

    .line 113
    .line 114
    const-string p4, "MediaFormat BITRATE_MODE_VBR"

    .line 115
    .line 116
    invoke-static {p2, p4}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    const-string p4, "EVMode=1"

    .line 124
    .line 125
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p4

    .line 129
    invoke-virtual {p2, p4}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    iget-object p2, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 133
    .line 134
    const-string p4, "bitrate-mode"

    .line 135
    .line 136
    invoke-virtual {p2, p4, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 137
    .line 138
    .line 139
    :cond_4
    invoke-direct {p0, p1, p3}, Ll/nsx;->c(Ljava/lang/String;I)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_5

    .line 144
    .line 145
    const-string p1, "2"

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_5
    const-string p1, "-1"

    .line 149
    .line 150
    :goto_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p2, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    :cond_6
    sget p1, Ll/nsx;->k:I

    .line 166
    .line 167
    if-ne p7, p1, :cond_7

    .line 168
    .line 169
    iget-object p1, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 170
    .line 171
    const-string p2, "color-format"

    .line 172
    .line 173
    const p4, 0x7f000789

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, p2, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 177
    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_7
    sget p1, Ll/nsx;->l:I

    .line 181
    .line 182
    if-ne p7, p1, :cond_8

    .line 183
    .line 184
    iget-object p1, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 185
    .line 186
    const-string p2, "color-format"

    .line 187
    .line 188
    const/16 p4, 0x13

    .line 189
    .line 190
    invoke-virtual {p1, p2, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 191
    .line 192
    .line 193
    :cond_8
    :goto_2
    iget p1, p0, Ll/nsx;->j:I

    .line 194
    .line 195
    or-int/2addr p1, p3

    .line 196
    iput p1, p0, Ll/nsx;->j:I

    .line 197
    .line 198
    :cond_9
    monitor-exit v2

    .line 199
    return-void

    .line 200
    :cond_a
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 201
    .line 202
    new-instance p1, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string p2, " height="

    .line 211
    .line 212
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string p2, " fps="

    .line 219
    .line 220
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string p2, " bitrate="

    .line 227
    .line 228
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string p2, " gopSize="

    .line 235
    .line 236
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    const-string p2, " srcType="

    .line 243
    .line 244
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {p1, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    throw p0

    .line 258
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    throw p0
.end method

.method public g(Ll/g220;)I
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    const-string v0, "init mVideoCodec"

    .line 2
    .line 3
    const-string v1, "init mAudioCodec"

    .line 4
    .line 5
    iget-object v2, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, p0, Ll/nsx;->f:Ll/g220;

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    iput-object p1, p0, Ll/nsx;->f:Ll/g220;

    .line 13
    .line 14
    iget v3, p0, Ll/nsx;->j:I

    .line 15
    .line 16
    invoke-interface {p1, v3}, Ll/g220;->H1(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto/16 :goto_3

    .line 22
    .line 23
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    new-instance p1, Ll/zrx;

    .line 33
    .line 34
    iget-object v4, p0, Ll/nsx;->f:Ll/g220;

    .line 35
    .line 36
    invoke-direct {p1, v4}, Ll/zrx;-><init>(Ll/g220;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 40
    .line 41
    const-string p1, "Mp4MuxerWrapper"

    .line 42
    .line 43
    new-instance v4, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/nsx;->e:Ll/zrx;

    .line 49
    .line 50
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 61
    .line 62
    iget-object v1, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 63
    .line 64
    invoke-virtual {p1, v1}, Ll/zrx;->e(Landroid/media/MediaFormat;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/zrx;->k()V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    iput-object v3, p0, Ll/nsx;->e:Ll/zrx;

    .line 77
    .line 78
    const/4 p0, 0x5

    .line 79
    monitor-exit v2

    .line 80
    return p0

    .line 81
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 82
    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    iget-object p1, p0, Ll/nsx;->d:Ll/zrx;

    .line 86
    .line 87
    if-nez p1, :cond_4

    .line 88
    .line 89
    new-instance p1, Ll/zrx;

    .line 90
    .line 91
    iget-object v1, p0, Ll/nsx;->f:Ll/g220;

    .line 92
    .line 93
    invoke-direct {p1, v1}, Ll/zrx;-><init>(Ll/g220;)V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Ll/nsx;->d:Ll/zrx;

    .line 97
    .line 98
    const-string p1, "Mp4MuxerWrapper"

    .line 99
    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/nsx;->d:Ll/zrx;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {p1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/nsx;->d:Ll/zrx;

    .line 118
    .line 119
    iget-object v0, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ll/zrx;->e(Landroid/media/MediaFormat;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_3

    .line 126
    .line 127
    iget-object p1, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 128
    .line 129
    const-string v0, "color-format"

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    const/16 v0, 0x13

    .line 136
    .line 137
    if-ne p1, v0, :cond_4

    .line 138
    .line 139
    iget-object p0, p0, Ll/nsx;->d:Ll/zrx;

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/zrx;->k()V

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_3
    iput-object v3, p0, Ll/nsx;->d:Ll/zrx;

    .line 146
    .line 147
    const/4 p0, 0x4

    .line 148
    monitor-exit v2

    .line 149
    return p0

    .line 150
    :cond_4
    :goto_2
    monitor-exit v2

    .line 151
    const/4 p0, 0x0

    .line 152
    return p0

    .line 153
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    throw p0
.end method

.method public h()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/nsx;->d:Ll/zrx;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "MediaEncoderWrapper"

    .line 10
    .line 11
    const-string v3, "mVideoCodec stop ##############"

    .line 12
    .line 13
    invoke-static {v1, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/nsx;->d:Ll/zrx;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/zrx;->l()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/nsx;->d:Ll/zrx;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/zrx;->h()V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Ll/nsx;->d:Ll/zrx;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/nsx;->e:Ll/zrx;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    const-string v1, "MediaEncoderWrapper"

    .line 36
    .line 37
    const-string v3, "mAudioCodec stop ##############"

    .line 38
    .line 39
    invoke-static {v1, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/nsx;->e:Ll/zrx;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/zrx;->l()V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/nsx;->e:Ll/zrx;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/zrx;->h()V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Ll/nsx;->e:Ll/zrx;

    .line 53
    .line 54
    :cond_1
    iget-object v1, p0, Ll/nsx;->f:Ll/g220;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    const-string v1, "MediaEncoderWrapper"

    .line 59
    .line 60
    const-string v3, "mMuxerWrapper stop ##############"

    .line 61
    .line 62
    invoke-static {v1, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/nsx;->f:Ll/g220;

    .line 66
    .line 67
    invoke-interface {v1}, Ll/g220;->k1()V

    .line 68
    .line 69
    .line 70
    iput-object v2, p0, Ll/nsx;->f:Ll/g220;

    .line 71
    .line 72
    :cond_2
    iput-object v2, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 73
    .line 74
    iput-object v2, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 75
    .line 76
    monitor-exit v0

    .line 77
    return-void

    .line 78
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method
