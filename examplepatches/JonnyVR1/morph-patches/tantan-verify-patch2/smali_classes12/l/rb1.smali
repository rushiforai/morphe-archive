.class public Ll/rb1;
.super Ll/bc1;
.source "SourceFile"


# instance fields
.field private d:Ljava/lang/String;

.field private final e:I

.field private final f:I

.field private g:Z

.field private h:Ljava/nio/ByteBuffer;

.field private i:Lcom/momoap/pitchshift/PitchShift;

.field private j:Ljava/nio/ByteBuffer;

.field private k:Ljava/nio/ByteBuffer;

.field l:[B

.field m:[B

.field private n:Z

.field o:Ljava/lang/Object;

.field private p:Ljava/lang/String;

.field private q:Ll/spw;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bc1;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioPitchShiftProcessor"

    .line 5
    .line 6
    iput-object v0, p0, Ll/rb1;->d:Ljava/lang/String;

    .line 7
    .line 8
    const/16 v0, -0x64

    .line 9
    .line 10
    iput v0, p0, Ll/rb1;->e:I

    .line 11
    .line 12
    const/16 v0, -0x65

    .line 13
    .line 14
    iput v0, p0, Ll/rb1;->f:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Ll/rb1;->g:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/rb1;->n:Z

    .line 20
    .line 21
    new-instance v0, Ljava/lang/Object;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/rb1;->o:Ljava/lang/Object;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Ll/rb1;->p:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Ll/rb1;->q:Ll/spw;

    .line 32
    .line 33
    const/high16 v0, 0x580000

    .line 34
    .line 35
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/rb1;->h:Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    return-void
.end method

.method private e(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;
    .locals 7

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
    iget-object v0, p0, Ll/rb1;->l:[B

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
    iput-object v0, p0, Ll/rb1;->l:[B

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Ll/rb1;->m:[B

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
    iput-object v0, p0, Ll/rb1;->m:[B

    .line 28
    .line 29
    :cond_3
    iget-object v0, p0, Ll/rb1;->l:[B

    .line 30
    .line 31
    iget-object p0, p0, Ll/rb1;->m:[B

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {p1, v0, v1, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p0, v1, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    :goto_0
    div-int/lit8 p2, p3, 0x2

    .line 41
    .line 42
    if-ge v1, p2, :cond_4

    .line 43
    .line 44
    mul-int/lit8 p2, v1, 0x2

    .line 45
    .line 46
    add-int/lit8 v2, p2, 0x1

    .line 47
    .line 48
    aget-byte v3, v0, v2

    .line 49
    .line 50
    aget-byte v4, v0, p2

    .line 51
    .line 52
    shl-int/lit8 v3, v3, 0x8

    .line 53
    .line 54
    const v5, 0xff00

    .line 55
    .line 56
    .line 57
    and-int/2addr v3, v5

    .line 58
    and-int/lit16 v4, v4, 0xff

    .line 59
    .line 60
    or-int/2addr v3, v4

    .line 61
    int-to-short v3, v3

    .line 62
    int-to-float v3, v3

    .line 63
    const/4 v4, 0x0

    .line 64
    mul-float/2addr v3, v4

    .line 65
    float-to-int v3, v3

    .line 66
    int-to-short v3, v3

    .line 67
    aget-byte v4, p0, v2

    .line 68
    .line 69
    aget-byte v6, p0, p2

    .line 70
    .line 71
    shl-int/lit8 v4, v4, 0x8

    .line 72
    .line 73
    and-int/2addr v4, v5

    .line 74
    and-int/lit16 v5, v6, 0xff

    .line 75
    .line 76
    or-int/2addr v4, v5

    .line 77
    int-to-short v4, v4

    .line 78
    int-to-float v4, v4

    .line 79
    const/high16 v5, 0x3f800000    # 1.0f

    .line 80
    .line 81
    mul-float/2addr v4, v5

    .line 82
    float-to-int v4, v4

    .line 83
    int-to-short v4, v4

    .line 84
    add-int/2addr v3, v4

    .line 85
    int-to-float v3, v3

    .line 86
    float-to-int v3, v3

    .line 87
    int-to-short v3, v3

    .line 88
    shr-int/lit8 v4, v3, 0x8

    .line 89
    .line 90
    and-int/lit16 v4, v4, 0xff

    .line 91
    .line 92
    int-to-byte v4, v4

    .line 93
    aput-byte v4, v0, v2

    .line 94
    .line 95
    and-int/lit16 v2, v3, 0xff

    .line 96
    .line 97
    int-to-byte v2, v2

    .line 98
    aput-byte v2, v0, p2

    .line 99
    .line 100
    add-int/lit8 v1, v1, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    return-object p1

    .line 113
    :cond_5
    const/4 p0, 0x0

    .line 114
    return-object p0
.end method


# virtual methods
.method public b(Ll/ad60;IJ)Ll/ad60;
    .locals 1

    .line 1
    iget-object p3, p0, Ll/rb1;->j:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-le p2, p3, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iput-object p3, p0, Ll/rb1;->j:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    :cond_1
    iget-object p3, p0, Ll/rb1;->k:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    if-eqz p3, :cond_2

    .line 20
    .line 21
    invoke-virtual {p3}, Ljava/nio/Buffer;->capacity()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-le p2, p3, :cond_3

    .line 26
    .line 27
    :cond_2
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    iput-object p3, p0, Ll/rb1;->k:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    :cond_3
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const/4 p4, 0x0

    .line 38
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/rb1;->j:Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p3, v0, p4, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    iget-object p3, p0, Ll/rb1;->h:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    invoke-virtual {p3}, Ljava/nio/Buffer;->remaining()I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    iget-object v0, p0, Ll/rb1;->k:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    if-lez p3, :cond_4

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 61
    .line 62
    .line 63
    iget-object p3, p0, Ll/rb1;->h:Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    iget-object v0, p0, Ll/rb1;->k:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p3, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p3, p0, Ll/rb1;->k:Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 81
    .line 82
    .line 83
    iget-object p3, p0, Ll/rb1;->j:Ljava/nio/ByteBuffer;

    .line 84
    .line 85
    invoke-virtual {p3, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 86
    .line 87
    .line 88
    iget-object p3, p0, Ll/rb1;->j:Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    iget-object p4, p0, Ll/rb1;->k:Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    invoke-direct {p0, p3, p4, p2}, Ll/rb1;->e(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/rb1;->j:Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    invoke-virtual {p1, p0}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V

    .line 98
    .line 99
    .line 100
    return-object p1
.end method

.method public c()Z
    .locals 2

    .line 1
    const-string v0, "AuidoPitch"

    .line 2
    .line 3
    const-string v1, "Audio pitch reset !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rb1;->h:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-super {p0}, Ll/bc1;->c()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    const-string v0, "AuidoPitch"

    .line 2
    .line 3
    const-string v1, "Audio pitch release !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/rb1;->i:Lcom/momoap/pitchshift/PitchShift;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Ll/rb1;->n:Z

    .line 13
    .line 14
    iget-object v1, p0, Ll/rb1;->o:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v1

    .line 17
    :try_start_0
    invoke-static {}, Lcom/momoap/pitchshift/PitchShift;->pitchRelease()V

    .line 18
    .line 19
    .line 20
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    iget-object v1, p0, Ll/rb1;->q:Ll/spw;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iput-object v0, p0, Ll/rb1;->q:Ll/spw;

    .line 26
    .line 27
    :cond_0
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p0
.end method

.method public g(JJ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Audio pitch seek time = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " mTotalDuration = "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "AuidoPitch"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/rb1;->h:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget v1, p0, Ll/bc1;->a:I

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget v1, p0, Ll/bc1;->c:I

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    long-to-float p1, p1

    .line 41
    long-to-float p2, p3

    .line 42
    div-float/2addr p1, p2

    .line 43
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    array-length p2, p2

    .line 48
    int-to-float p2, p2

    .line 49
    mul-float/2addr p1, p2

    .line 50
    float-to-int p1, p1

    .line 51
    iget-object p2, p0, Ll/rb1;->h:Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    iget p0, p0, Ll/bc1;->a:I

    .line 54
    .line 55
    rem-int p0, p1, p0

    .line 56
    .line 57
    sub-int/2addr p1, p0

    .line 58
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method
