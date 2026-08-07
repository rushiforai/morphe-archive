.class public Ll/jc00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fb1;


# instance fields
.field private a:Ljava/lang/Object;

.field protected b:I

.field private c:I

.field public d:I

.field public e:I

.field public f:I

.field protected g:Ljava/nio/ByteBuffer;

.field protected h:Lcom/immomo/mediacore/audio/AudioProcess;

.field private i:Ll/dc1;

.field public j:Ll/fb1;

.field protected k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(IIIZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jc00;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/jc00;->c:I

    .line 13
    .line 14
    const/16 v1, 0x10

    .line 15
    .line 16
    iput v1, p0, Ll/jc00;->e:I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Ll/jc00;->j:Ll/fb1;

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/jc00;->k:Z

    .line 22
    .line 23
    iput p1, p0, Ll/jc00;->b:I

    .line 24
    .line 25
    iput p2, p0, Ll/jc00;->d:I

    .line 26
    .line 27
    iput p3, p0, Ll/jc00;->f:I

    .line 28
    .line 29
    if-eqz p4, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 32
    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    new-instance p1, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 36
    .line 37
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 41
    .line 42
    iget p4, p0, Ll/jc00;->b:I

    .line 43
    .line 44
    div-int/lit8 p4, p4, 0x2

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3, p4}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEf(III)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 50
    .line 51
    const/high16 p2, 0x3f800000    # 1.0f

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioGain(F)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->setMasterAudioLevel(F)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    new-instance p1, Ll/dc1;

    .line 68
    .line 69
    invoke-direct {p1}, Ll/dc1;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ll/jc00;->i:Ll/dc1;

    .line 73
    .line 74
    :cond_1
    :goto_0
    iget p1, p0, Ll/jc00;->b:I

    .line 75
    .line 76
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    return-void
.end method

.method private n2(Ll/oxd0;Ll/oxd0;)Ljava/nio/ByteBuffer;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object v1, v0

    .line 10
    :goto_0
    if-eqz v1, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/oxd0;->c()[B

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget v2, p2, Ll/oxd0;->e:I

    .line 21
    .line 22
    iget p1, p1, Ll/oxd0;->e:I

    .line 23
    .line 24
    if-ne v2, p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 27
    .line 28
    invoke-virtual {p2}, Ll/oxd0;->c()[B

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget p2, p2, Ll/oxd0;->e:I

    .line 33
    .line 34
    invoke-virtual {p0, p1, v1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->normalize_mix([B[BI)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    return-object v0
.end method

.method public static o2([BI)[B
    .locals 6

    .line 1
    mul-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v1, p1, :cond_0

    .line 8
    .line 9
    mul-int/lit8 v3, v2, 0x4

    .line 10
    .line 11
    add-int/lit8 v4, v3, 0x2

    .line 12
    .line 13
    aget-byte v5, p0, v1

    .line 14
    .line 15
    aput-byte v5, v0, v4

    .line 16
    .line 17
    aput-byte v5, v0, v3

    .line 18
    .line 19
    add-int/lit8 v4, v3, 0x1

    .line 20
    .line 21
    add-int/lit8 v3, v3, 0x3

    .line 22
    .line 23
    add-int/lit8 v5, v1, 0x1

    .line 24
    .line 25
    aget-byte v5, p0, v5

    .line 26
    .line 27
    aput-byte v5, v0, v3

    .line 28
    .line 29
    aput-byte v5, v0, v4

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x2

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    return-object v0
.end method

.method public static q2([BI)[B
    .locals 5

    .line 1
    div-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    div-int/lit8 v2, p1, 0x4

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    mul-int/lit8 v2, v1, 0x2

    .line 11
    .line 12
    mul-int/lit8 v3, v1, 0x4

    .line 13
    .line 14
    aget-byte v4, p0, v3

    .line 15
    .line 16
    aput-byte v4, v0, v2

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    aget-byte v3, p0, v3

    .line 23
    .line 24
    aput-byte v3, v0, v2

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object v0
.end method


# virtual methods
.method public C(Ll/oxd0;)Ll/oxd0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->getSurroundData()Ll/oxd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0, p1}, Ll/jc00;->n2(Ll/oxd0;Ll/oxd0;)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iget-object v1, p0, Ll/jc00;->i:Ll/dc1;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dc1;->g()Ll/oxd0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, v0, p1}, Ll/jc00;->n2(Ll/oxd0;Ll/oxd0;)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_1
    iget-object v1, p0, Ll/jc00;->a:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v1

    .line 30
    :try_start_0
    iget-object v2, p0, Ll/jc00;->j:Ll/fb1;

    .line 31
    .line 32
    if-eqz v2, :cond_5

    .line 33
    .line 34
    iget v3, p0, Ll/jc00;->f:I

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    if-ne v3, v4, :cond_3

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    array-length v3, v3

    .line 50
    invoke-static {v2, v3}, Ll/jc00;->o2([BI)[B

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_3

    .line 57
    :cond_2
    invoke-virtual {p1}, Ll/oxd0;->c()[B

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {p1}, Ll/oxd0;->e()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-static {v2, v3}, Ll/jc00;->o2([BI)[B

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    :goto_1
    if-eqz v2, :cond_5

    .line 70
    .line 71
    iget-object v3, p0, Ll/jc00;->j:Ll/fb1;

    .line 72
    .line 73
    new-instance v4, Ll/oxd0;

    .line 74
    .line 75
    array-length v5, v2

    .line 76
    int-to-long v5, v5

    .line 77
    iget v7, p0, Ll/jc00;->f:I

    .line 78
    .line 79
    invoke-direct {v4, v2, v5, v6, v7}, Ll/oxd0;-><init>([BJI)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v3, v4}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    if-eqz v0, :cond_4

    .line 87
    .line 88
    new-instance v3, Ll/oxd0;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    array-length v5, v5

    .line 99
    int-to-long v5, v5

    .line 100
    iget v7, p0, Ll/jc00;->f:I

    .line 101
    .line 102
    invoke-direct {v3, v4, v5, v6, v7}, Ll/oxd0;-><init>([BJI)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v2, v3}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    invoke-interface {v2, p1}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 110
    .line 111
    .line 112
    :cond_5
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    if-eqz v0, :cond_6

    .line 114
    .line 115
    new-instance v1, Ll/oxd0;

    .line 116
    .line 117
    invoke-virtual {p1}, Ll/oxd0;->d()J

    .line 118
    .line 119
    .line 120
    move-result-wide v2

    .line 121
    iget p0, p0, Ll/jc00;->f:I

    .line 122
    .line 123
    invoke-direct {v1, v0, v2, v3, p0}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 124
    .line 125
    .line 126
    return-object v1

    .line 127
    :cond_6
    return-object p1

    .line 128
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    throw p0
.end method

.method public G0([BIILjava/lang/Object;I)V
    .locals 7

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string p4, "onPcmDateCallback:"

    .line 8
    .line 9
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    array-length p4, p1

    .line 13
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p4, ";recording: mRemainAudioIndex="

    .line 17
    .line 18
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget p4, p0, Ll/jc00;->c:I

    .line 22
    .line 23
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p4, ";"

    .line 27
    .line 28
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget p4, p0, Ll/jc00;->b:I

    .line 32
    .line 33
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    const-string p4, "ExtAudioWrapper"

    .line 41
    .line 42
    invoke-virtual {p2, p4, p3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    if-eqz p5, :cond_1

    .line 46
    .line 47
    iget p2, p0, Ll/jc00;->f:I

    .line 48
    .line 49
    if-eq p5, p2, :cond_1

    .line 50
    .line 51
    const/4 p3, 0x2

    .line 52
    if-ne p2, p3, :cond_0

    .line 53
    .line 54
    array-length p2, p1

    .line 55
    invoke-static {p1, p2}, Ll/jc00;->o2([BI)[B

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    array-length p2, p1

    .line 61
    invoke-static {p1, p2}, Ll/jc00;->q2([BI)[B

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    :cond_1
    :goto_0
    array-length p2, p1

    .line 66
    iget p3, p0, Ll/jc00;->c:I

    .line 67
    .line 68
    add-int/2addr p2, p3

    .line 69
    const/4 p3, 0x0

    .line 70
    move p5, p3

    .line 71
    :goto_1
    :try_start_0
    iget v0, p0, Ll/jc00;->b:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    const-string v1, ";lens:"

    .line 74
    .line 75
    if-lt p2, v0, :cond_7

    .line 76
    .line 77
    :try_start_1
    iget v2, p0, Ll/jc00;->c:I

    .line 78
    .line 79
    const-wide/16 v3, 0x3e8

    .line 80
    .line 81
    if-lez v2, :cond_4

    .line 82
    .line 83
    new-array v0, v0, [B

    .line 84
    .line 85
    iget-object v2, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    iget v5, p0, Ll/jc00;->c:I

    .line 93
    .line 94
    invoke-virtual {v2, v0, p3, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 100
    .line 101
    .line 102
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    new-instance v5, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v6, "mRemainAudioIndex > 0 arraycopy :"

    .line 112
    .line 113
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v6, ";mRemainAudioIndex:"

    .line 120
    .line 121
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget v6, p0, Ll/jc00;->c:I

    .line 125
    .line 126
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-virtual {v2, p4, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget v2, p0, Ll/jc00;->c:I

    .line 137
    .line 138
    iget v5, p0, Ll/jc00;->b:I

    .line 139
    .line 140
    sub-int/2addr v5, v2

    .line 141
    invoke-static {p1, p5, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    .line 143
    .line 144
    iget v2, p0, Ll/jc00;->b:I

    .line 145
    .line 146
    iget v5, p0, Ll/jc00;->c:I

    .line 147
    .line 148
    sub-int v5, v2, v5

    .line 149
    .line 150
    add-int/2addr p5, v5

    .line 151
    sub-int/2addr p2, v2

    .line 152
    iget-object v2, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 153
    .line 154
    if-eqz v2, :cond_2

    .line 155
    .line 156
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    new-instance v5, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    .line 164
    .line 165
    const-string v6, "mRemainAudioIndex > 0 putSurroundData :"

    .line 166
    .line 167
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v5, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v2, p4, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 187
    .line 188
    new-instance v2, Ll/oxd0;

    .line 189
    .line 190
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 191
    .line 192
    .line 193
    move-result-wide v5

    .line 194
    div-long/2addr v5, v3

    .line 195
    iget v3, p0, Ll/jc00;->f:I

    .line 196
    .line 197
    invoke-direct {v2, v0, v5, v6, v3}, Ll/oxd0;-><init>([BJI)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :catch_0
    move-exception p1

    .line 205
    goto/16 :goto_4

    .line 206
    .line 207
    :cond_2
    iget-object v1, p0, Ll/jc00;->i:Ll/dc1;

    .line 208
    .line 209
    if-eqz v1, :cond_3

    .line 210
    .line 211
    new-instance v2, Ll/oxd0;

    .line 212
    .line 213
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 214
    .line 215
    .line 216
    move-result-wide v5

    .line 217
    div-long/2addr v5, v3

    .line 218
    iget v3, p0, Ll/jc00;->f:I

    .line 219
    .line 220
    invoke-direct {v2, v0, v5, v6, v3}, Ll/oxd0;-><init>([BJI)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1, v2}, Ll/dc1;->i(Ll/oxd0;)V

    .line 224
    .line 225
    .line 226
    :cond_3
    :goto_2
    iput p3, p0, Ll/jc00;->c:I

    .line 227
    .line 228
    goto/16 :goto_1

    .line 229
    .line 230
    :cond_4
    new-array v2, v0, [B

    .line 231
    .line 232
    invoke-static {p1, p5, v2, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 236
    .line 237
    if-eqz v0, :cond_5

    .line 238
    .line 239
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    new-instance v5, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    .line 247
    .line 248
    const-string v6, "mRemainAudioIndex == 0 putSurroundData pos :"

    .line 249
    .line 250
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v5, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0, p4, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 270
    .line 271
    new-instance v1, Ll/oxd0;

    .line 272
    .line 273
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 274
    .line 275
    .line 276
    move-result-wide v5

    .line 277
    div-long/2addr v5, v3

    .line 278
    iget v3, p0, Ll/jc00;->f:I

    .line 279
    .line 280
    invoke-direct {v1, v2, v5, v6, v3}, Ll/oxd0;-><init>([BJI)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 284
    .line 285
    .line 286
    goto :goto_3

    .line 287
    :cond_5
    iget-object v0, p0, Ll/jc00;->i:Ll/dc1;

    .line 288
    .line 289
    if-eqz v0, :cond_6

    .line 290
    .line 291
    new-instance v1, Ll/oxd0;

    .line 292
    .line 293
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 294
    .line 295
    .line 296
    move-result-wide v5

    .line 297
    div-long/2addr v5, v3

    .line 298
    iget v3, p0, Ll/jc00;->f:I

    .line 299
    .line 300
    invoke-direct {v1, v2, v5, v6, v3}, Ll/oxd0;-><init>([BJI)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v0, v1}, Ll/dc1;->i(Ll/oxd0;)V

    .line 304
    .line 305
    .line 306
    :cond_6
    :goto_3
    iget v0, p0, Ll/jc00;->b:I

    .line 307
    .line 308
    sub-int/2addr p2, v0

    .line 309
    add-int/2addr p5, v0

    .line 310
    goto/16 :goto_1

    .line 311
    .line 312
    :cond_7
    array-length v0, p1

    .line 313
    if-lt p2, v0, :cond_8

    .line 314
    .line 315
    if-nez p5, :cond_8

    .line 316
    .line 317
    iget-object p2, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 318
    .line 319
    array-length v0, p1

    .line 320
    invoke-virtual {p2, p1, p3, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 321
    .line 322
    .line 323
    iget p2, p0, Ll/jc00;->c:I

    .line 324
    .line 325
    array-length p1, p1

    .line 326
    add-int/2addr p2, p1

    .line 327
    iput p2, p0, Ll/jc00;->c:I

    .line 328
    .line 329
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    new-instance p2, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 336
    .line 337
    .line 338
    const-string v0, "mRemainAudio.put: pos:"

    .line 339
    .line 340
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    iget p5, p0, Ll/jc00;->c:I

    .line 350
    .line 351
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object p2

    .line 358
    invoke-virtual {p1, p4, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    goto :goto_5

    .line 362
    :cond_8
    if-lez p2, :cond_9

    .line 363
    .line 364
    iget-object v0, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 365
    .line 366
    invoke-virtual {v0, p1, p5, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 367
    .line 368
    .line 369
    iget p1, p0, Ll/jc00;->c:I

    .line 370
    .line 371
    add-int/2addr p1, p2

    .line 372
    iput p1, p0, Ll/jc00;->c:I

    .line 373
    .line 374
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    new-instance p2, Ljava/lang/StringBuilder;

    .line 379
    .line 380
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 381
    .line 382
    .line 383
    const-string v0, "mRemainAudio.put:pos:"

    .line 384
    .line 385
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    iget p5, p0, Ll/jc00;->c:I

    .line 395
    .line 396
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object p2

    .line 403
    invoke-virtual {p1, p4, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 404
    .line 405
    .line 406
    goto :goto_5

    .line 407
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 408
    .line 409
    .line 410
    iput p3, p0, Ll/jc00;->c:I

    .line 411
    .line 412
    iget-object p0, p0, Ll/jc00;->g:Ljava/nio/ByteBuffer;

    .line 413
    .line 414
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 415
    .line 416
    .line 417
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 418
    .line 419
    .line 420
    move-result-object p0

    .line 421
    new-instance p1, Ljava/lang/StringBuilder;

    .line 422
    .line 423
    const-string p2, "onMediaDateCallback:exception;"

    .line 424
    .line 425
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    invoke-static {}, Ll/jq70;->d()Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object p2

    .line 432
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    invoke-virtual {p0, p4, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    :cond_9
    :goto_5
    return-void
.end method

.method public R(Ll/fb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jc00;->j:Ll/fb1;

    .line 2
    .line 3
    return-void
.end method

.method public W1(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/jc00;->i:Ll/dc1;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dc1;->f()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public g0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setMasterAudioLevel(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jc00;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-object v1, p0, Ll/jc00;->j:Ll/fb1;

    .line 6
    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundFrames()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->release()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/jc00;->i:Ll/dc1;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/dc1;->f()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p0
.end method

.method public r2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jc00;->h:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundFrames()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/jc00;->i:Ll/dc1;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/dc1;->f()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
