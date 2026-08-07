.class public Ll/ob1;
.super Ll/bc1;
.source "SourceFile"


# instance fields
.field private d:Ljava/lang/String;

.field private e:Lcom/immomo/moment/mediautils/b;

.field private f:Z

.field private g:Ljava/nio/ByteBuffer;

.field private h:Ljava/nio/ByteBuffer;

.field private i:F

.field private j:F

.field private k:Ljava/lang/Object;

.field private l:J

.field private m:J

.field n:[B

.field o:[B

.field private p:Ljava/lang/String;

.field private q:Ll/spw;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/bc1;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioMixerProcessor"

    .line 5
    .line 6
    iput-object v0, p0, Ll/ob1;->d:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/ob1;->f:Z

    .line 10
    .line 11
    const v0, 0x3fe66666    # 1.8f

    .line 12
    .line 13
    .line 14
    iput v0, p0, Ll/ob1;->i:F

    .line 15
    .line 16
    const v0, 0x3ecccccd    # 0.4f

    .line 17
    .line 18
    .line 19
    iput v0, p0, Ll/ob1;->j:F

    .line 20
    .line 21
    new-instance v0, Ljava/lang/Object;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ob1;->k:Ljava/lang/Object;

    .line 27
    .line 28
    const-wide/16 v0, 0x0

    .line 29
    .line 30
    iput-wide v0, p0, Ll/ob1;->l:J

    .line 31
    .line 32
    iput-wide v0, p0, Ll/ob1;->m:J

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Ll/ob1;->q:Ll/spw;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic e(Ll/ob1;)Ll/spw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob1;->q:Ll/spw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/ob1;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ob1;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private g(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;
    .locals 8

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    if-eqz p2, :cond_5

    .line 4
    .line 5
    if-eqz p3, :cond_5

    .line 6
    .line 7
    iget-object v0, p0, Ll/ob1;->n:[B

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    if-ge v0, p3, :cond_1

    .line 13
    .line 14
    :cond_0
    new-array v0, p3, [B

    .line 15
    .line 16
    iput-object v0, p0, Ll/ob1;->n:[B

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Ll/ob1;->o:[B

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    array-length v0, v0

    .line 23
    if-ge v0, p3, :cond_3

    .line 24
    .line 25
    :cond_2
    new-array v0, p3, [B

    .line 26
    .line 27
    iput-object v0, p0, Ll/ob1;->o:[B

    .line 28
    .line 29
    :cond_3
    iget-object v0, p0, Ll/ob1;->n:[B

    .line 30
    .line 31
    iget-object v1, p0, Ll/ob1;->o:[B

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {p1, v0, v2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, v1, v2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    :goto_0
    div-int/lit8 p2, p3, 0x2

    .line 41
    .line 42
    if-ge v2, p2, :cond_4

    .line 43
    .line 44
    mul-int/lit8 p2, v2, 0x2

    .line 45
    .line 46
    add-int/lit8 v3, p2, 0x1

    .line 47
    .line 48
    aget-byte v4, v0, v3

    .line 49
    .line 50
    aget-byte v5, v0, p2

    .line 51
    .line 52
    shl-int/lit8 v4, v4, 0x8

    .line 53
    .line 54
    const v6, 0xff00

    .line 55
    .line 56
    .line 57
    and-int/2addr v4, v6

    .line 58
    and-int/lit16 v5, v5, 0xff

    .line 59
    .line 60
    or-int/2addr v4, v5

    .line 61
    int-to-short v4, v4

    .line 62
    int-to-float v4, v4

    .line 63
    iget v5, p0, Ll/ob1;->i:F

    .line 64
    .line 65
    mul-float/2addr v4, v5

    .line 66
    float-to-int v4, v4

    .line 67
    int-to-short v4, v4

    .line 68
    aget-byte v5, v1, v3

    .line 69
    .line 70
    aget-byte v7, v1, p2

    .line 71
    .line 72
    shl-int/lit8 v5, v5, 0x8

    .line 73
    .line 74
    and-int/2addr v5, v6

    .line 75
    and-int/lit16 v6, v7, 0xff

    .line 76
    .line 77
    or-int/2addr v5, v6

    .line 78
    int-to-short v5, v5

    .line 79
    int-to-float v5, v5

    .line 80
    iget v6, p0, Ll/ob1;->j:F

    .line 81
    .line 82
    mul-float/2addr v5, v6

    .line 83
    float-to-int v5, v5

    .line 84
    int-to-short v5, v5

    .line 85
    add-int/2addr v4, v5

    .line 86
    int-to-float v4, v4

    .line 87
    float-to-int v4, v4

    .line 88
    int-to-short v4, v4

    .line 89
    shr-int/lit8 v5, v4, 0x8

    .line 90
    .line 91
    and-int/lit16 v5, v5, 0xff

    .line 92
    .line 93
    int-to-byte v5, v5

    .line 94
    aput-byte v5, v0, v3

    .line 95
    .line 96
    and-int/lit16 v3, v4, 0xff

    .line 97
    .line 98
    int-to-byte v3, v3

    .line 99
    aput-byte v3, v0, p2

    .line 100
    .line 101
    add-int/lit8 v2, v2, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 111
    .line 112
    .line 113
    return-object p1

    .line 114
    :cond_5
    const/4 p0, 0x0

    .line 115
    return-object p0
.end method


# virtual methods
.method public declared-synchronized b(Ll/ad60;IJ)Ll/ad60;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object p3, p0, Ll/ob1;->g:Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    if-le p2, p3, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    iput-object p3, p0, Ll/ob1;->g:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    :cond_1
    iget-object p3, p0, Ll/ob1;->h:Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-le p2, p3, :cond_3

    .line 30
    .line 31
    :cond_2
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    iput-object p3, p0, Ll/ob1;->h:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    :cond_3
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    const/4 p4, 0x0

    .line 42
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ob1;->g:Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p3, v0, p4, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    iget-object p3, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 55
    .line 56
    if-eqz p3, :cond_4

    .line 57
    .line 58
    iget-object v0, p0, Ll/ob1;->h:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    invoke-virtual {p3, v0, p2}, Lcom/immomo/moment/mediautils/b;->b(Ljava/nio/ByteBuffer;I)Z

    .line 61
    .line 62
    .line 63
    :cond_4
    iget-object p3, p0, Ll/ob1;->h:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 66
    .line 67
    .line 68
    iget-object p3, p0, Ll/ob1;->g:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 71
    .line 72
    .line 73
    iget-object p3, p0, Ll/ob1;->g:Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    iget-object p4, p0, Ll/ob1;->h:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    invoke-direct {p0, p3, p4, p2}, Ll/ob1;->g(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Ll/ob1;->g:Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .line 84
    .line 85
    monitor-exit p0

    .line 86
    return-object p1

    .line 87
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    throw p1
.end method

.method public declared-synchronized c()Z
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/ob1;->j()V

    .line 3
    .line 4
    .line 5
    iget-object v2, p0, Ll/ob1;->p:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v3, p0, Ll/ob1;->l:J

    .line 8
    .line 9
    iget-wide v5, p0, Ll/ob1;->m:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    .line 11
    move-object v1, p0

    .line 12
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Ll/ob1;->h(Ljava/lang/String;JJ)Z

    .line 13
    .line 14
    .line 15
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    monitor-exit v1

    .line 17
    return p0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    :goto_0
    move-object p0, v0

    .line 20
    goto :goto_1

    .line 21
    :catchall_1
    move-exception v0

    .line 22
    move-object v1, p0

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    throw p0
.end method

.method public h(Ljava/lang/String;JJ)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ob1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/ob1;->p:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/ob1;->l:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/ob1;->m:J

    .line 9
    .line 10
    iget-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-boolean v1, p0, Ll/ob1;->f:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lcom/immomo/moment/mediautils/c;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/c;-><init>()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    new-instance v1, Lcom/immomo/moment/mediautils/a;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/a;-><init>()V

    .line 29
    .line 30
    .line 31
    :goto_0
    iput-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 32
    .line 33
    :cond_1
    iget-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 34
    .line 35
    new-instance v2, Ll/ob1$a;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/ob1$a;-><init>(Ll/ob1;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/immomo/moment/mediautils/b;->l(Ll/jpw;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 44
    .line 45
    sub-long/2addr p4, p2

    .line 46
    invoke-virtual {v1, p2, p3, p4, p5}, Lcom/immomo/moment/mediautils/b;->g(JJ)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 50
    .line 51
    const/4 p3, 0x1

    .line 52
    invoke-virtual {p2, p3}, Lcom/immomo/moment/mediautils/b;->f(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 56
    .line 57
    iget p3, p0, Ll/bc1;->a:I

    .line 58
    .line 59
    iget p4, p0, Ll/bc1;->c:I

    .line 60
    .line 61
    iget p5, p0, Ll/bc1;->b:I

    .line 62
    .line 63
    invoke-virtual {p2, p3, p4, p5}, Lcom/immomo/moment/mediautils/b;->k(III)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 67
    .line 68
    invoke-virtual {p2, p1}, Lcom/immomo/moment/mediautils/b;->e(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/b;->m()V

    .line 77
    .line 78
    .line 79
    monitor-exit v0

    .line 80
    return p1

    .line 81
    :cond_2
    monitor-exit v0

    .line 82
    return p1

    .line 83
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    throw p0
.end method

.method public i(Ljava/lang/String;JJJ)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ob1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/ob1;->p:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/ob1;->l:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/ob1;->m:J

    .line 9
    .line 10
    iget-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-boolean v1, p0, Ll/ob1;->f:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lcom/immomo/moment/mediautils/c;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/c;-><init>()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    new-instance v1, Lcom/immomo/moment/mediautils/a;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/a;-><init>()V

    .line 29
    .line 30
    .line 31
    :goto_0
    iput-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 32
    .line 33
    :cond_1
    iget-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 34
    .line 35
    sub-long/2addr p4, p2

    .line 36
    invoke-virtual {v1, p2, p3, p4, p5}, Lcom/immomo/moment/mediautils/b;->g(JJ)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 40
    .line 41
    const/4 p3, 0x1

    .line 42
    invoke-virtual {p2, p3}, Lcom/immomo/moment/mediautils/b;->f(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 46
    .line 47
    iget p3, p0, Ll/bc1;->a:I

    .line 48
    .line 49
    iget p4, p0, Ll/bc1;->c:I

    .line 50
    .line 51
    iget p5, p0, Ll/bc1;->b:I

    .line 52
    .line 53
    invoke-virtual {p2, p3, p4, p5}, Lcom/immomo/moment/mediautils/b;->k(III)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 57
    .line 58
    invoke-virtual {p2, p1}, Lcom/immomo/moment/mediautils/b;->e(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p2, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/immomo/moment/mediautils/b;->m()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 70
    .line 71
    const-wide/16 p2, 0x3e8

    .line 72
    .line 73
    mul-long/2addr p6, p2

    .line 74
    invoke-virtual {p0, p6, p7}, Lcom/immomo/moment/mediautils/b;->d(J)V

    .line 75
    .line 76
    .line 77
    monitor-exit v0

    .line 78
    return p1

    .line 79
    :cond_2
    monitor-exit v0

    .line 80
    return p1

    .line 81
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw p0
.end method

.method public declared-synchronized j()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ob1;->k:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/b;->c()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Ll/ob1;->e:Lcom/immomo/moment/mediautils/b;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 22
    :try_start_3
    throw v1

    .line 23
    :catchall_1
    move-exception v0

    .line 24
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 25
    throw v0
.end method

.method public declared-synchronized k(J)Z
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/ob1;->j()V

    .line 3
    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v0, p1, v0

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-wide v3, p0, Ll/ob1;->l:J

    .line 12
    .line 13
    iget-wide v5, p0, Ll/ob1;->m:J

    .line 14
    .line 15
    cmp-long v0, v3, v5

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    move-object v1, p0

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    sub-long v0, v5, v3

    .line 22
    .line 23
    rem-long/2addr p1, v0

    .line 24
    add-long v7, p1, v3

    .line 25
    .line 26
    iget-object v2, p0, Ll/ob1;->p:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 27
    .line 28
    move-object v1, p0

    .line 29
    :try_start_1
    invoke-virtual/range {v1 .. v8}, Ll/ob1;->i(Ljava/lang/String;JJJ)Z

    .line 30
    .line 31
    .line 32
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    monitor-exit v1

    .line 34
    return p0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    :goto_0
    move-object p0, v0

    .line 37
    goto :goto_2

    .line 38
    :catchall_1
    move-exception v0

    .line 39
    move-object v1, p0

    .line 40
    goto :goto_0

    .line 41
    :goto_1
    :try_start_2
    iget-object v2, v1, Ll/ob1;->p:Ljava/lang/String;

    .line 42
    .line 43
    iget-wide v3, v1, Ll/ob1;->l:J

    .line 44
    .line 45
    iget-wide v5, v1, Ll/ob1;->m:J

    .line 46
    .line 47
    invoke-virtual/range {v1 .. v6}, Ll/ob1;->h(Ljava/lang/String;JJ)Z

    .line 48
    .line 49
    .line 50
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    monitor-exit v1

    .line 52
    return p0

    .line 53
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 54
    throw p0
.end method

.method public l(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob1;->q:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public m(FF)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ob1;->i:F

    .line 2
    .line 3
    iput p2, p0, Ll/ob1;->j:F

    .line 4
    .line 5
    return-void
.end method

.method public n(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ob1;->j:F

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized o(Z)V
    .locals 3

    .line 1
    const-string v0, "AudioDecoderType:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ob1;->d:Ljava/lang/String;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string v2, "Soft"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const-string v2, "Hard"

    .line 14
    .line 15
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-boolean p1, p0, Ll/ob1;->f:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public p(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ob1;->i:F

    .line 2
    .line 3
    return-void
.end method
