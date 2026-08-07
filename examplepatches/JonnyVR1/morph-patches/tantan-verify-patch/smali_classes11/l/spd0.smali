.class public final Ll/spd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aqd0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/ig60;

.field public final b:Ll/ig60;

.field public final c:Ll/zpd0;

.field public d:Ll/qfj0;

.field public e:I

.field public f:J

.field public g:I

.field public h:I

.field public i:J


# direct methods
.method public constructor <init>(Ll/zpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ig60;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ig60;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/spd0;->a:Ll/ig60;

    .line 10
    .line 11
    new-instance v0, Ll/ig60;

    .line 12
    .line 13
    sget-object v1, Ll/jb20;->a:[B

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/ig60;-><init>([B)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/spd0;->b:Ll/ig60;

    .line 19
    .line 20
    iput-object p1, p0, Ll/spd0;->c:Ll/zpd0;

    .line 21
    .line 22
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    iput-wide v0, p0, Ll/spd0;->f:J

    .line 28
    .line 29
    const/4 p1, -0x1

    .line 30
    iput p1, p0, Ll/spd0;->g:I

    .line 31
    .line 32
    return-void
.end method

.method private static e(I)I
    .locals 1

    .line 1
    const/16 v0, 0x13

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x14

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private f(Ll/ig60;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "trackOutput"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    const/4 v1, 0x3

    .line 7
    if-lt v0, v1, :cond_5

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x1

    .line 14
    aget-byte v0, v0, v2

    .line 15
    .line 16
    and-int/lit8 v0, v0, 0x7

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const/4 v4, 0x2

    .line 23
    aget-byte v3, v3, v4

    .line 24
    .line 25
    and-int/lit8 v5, v3, 0x3f

    .line 26
    .line 27
    and-int/lit16 v6, v3, 0x80

    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    if-lez v6, :cond_0

    .line 31
    .line 32
    move v6, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v6, v7

    .line 35
    :goto_0
    and-int/lit8 v3, v3, 0x40

    .line 36
    .line 37
    if-lez v3, :cond_1

    .line 38
    .line 39
    move v7, v2

    .line 40
    :cond_1
    if-eqz v6, :cond_2

    .line 41
    .line 42
    iget p2, p0, Ll/spd0;->h:I

    .line 43
    .line 44
    invoke-direct {p0}, Ll/spd0;->h()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/2addr p2, v1

    .line 49
    iput p2, p0, Ll/spd0;->h:I

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    shl-int/lit8 v1, v5, 0x1

    .line 56
    .line 57
    and-int/lit8 v1, v1, 0x7f

    .line 58
    .line 59
    int-to-byte v1, v1

    .line 60
    aput-byte v1, p2, v2

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    int-to-byte v0, v0

    .line 67
    aput-byte v0, p2, v4

    .line 68
    .line 69
    iget-object p2, p0, Ll/spd0;->a:Ll/ig60;

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p2, p1}, Ll/ig60;->R([B)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/spd0;->a:Ll/ig60;

    .line 79
    .line 80
    invoke-virtual {p1, v2}, Ll/ig60;->U(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    iget v0, p0, Ll/spd0;->g:I

    .line 85
    .line 86
    add-int/2addr v0, v2

    .line 87
    const v2, 0xffff

    .line 88
    .line 89
    .line 90
    rem-int/2addr v0, v2

    .line 91
    if-eq p2, v0, :cond_3

    .line 92
    .line 93
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const-string p1, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d. Dropping packet."

    .line 106
    .line 107
    invoke-static {p1, p0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p1, "RtpH265Reader"

    .line 112
    .line 113
    invoke-static {p1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_3
    iget-object p2, p0, Ll/spd0;->a:Ll/ig60;

    .line 118
    .line 119
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2, p1}, Ll/ig60;->R([B)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/spd0;->a:Ll/ig60;

    .line 127
    .line 128
    invoke-virtual {p1, v1}, Ll/ig60;->U(I)V

    .line 129
    .line 130
    .line 131
    :goto_1
    iget-object p1, p0, Ll/spd0;->a:Ll/ig60;

    .line 132
    .line 133
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    iget-object p2, p0, Ll/spd0;->d:Ll/qfj0;

    .line 138
    .line 139
    iget-object v0, p0, Ll/spd0;->a:Ll/ig60;

    .line 140
    .line 141
    invoke-interface {p2, v0, p1}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 142
    .line 143
    .line 144
    iget p2, p0, Ll/spd0;->h:I

    .line 145
    .line 146
    add-int/2addr p2, p1

    .line 147
    iput p2, p0, Ll/spd0;->h:I

    .line 148
    .line 149
    if-eqz v7, :cond_4

    .line 150
    .line 151
    invoke-static {v5}, Ll/spd0;->e(I)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    iput p1, p0, Ll/spd0;->e:I

    .line 156
    .line 157
    :cond_4
    return-void

    .line 158
    :cond_5
    const-string p0, "Malformed FU header."

    .line 159
    .line 160
    const/4 p1, 0x0

    .line 161
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    throw p0
.end method

.method private g(Ll/ig60;)V
    .locals 3
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "trackOutput"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/spd0;->h:I

    .line 6
    .line 7
    invoke-direct {p0}, Ll/spd0;->h()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/2addr v1, v2

    .line 12
    iput v1, p0, Ll/spd0;->h:I

    .line 13
    .line 14
    iget-object v1, p0, Ll/spd0;->d:Ll/qfj0;

    .line 15
    .line 16
    invoke-interface {v1, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Ll/spd0;->h:I

    .line 20
    .line 21
    add-int/2addr v1, v0

    .line 22
    iput v1, p0, Ll/spd0;->h:I

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x0

    .line 29
    aget-byte p1, p1, v0

    .line 30
    .line 31
    shr-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    and-int/lit8 p1, p1, 0x3f

    .line 34
    .line 35
    invoke-static {p1}, Ll/spd0;->e(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Ll/spd0;->e:I

    .line 40
    .line 41
    return-void
.end method

.method private h()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/spd0;->b:Ll/ig60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/spd0;->b:Ll/ig60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ig60;->a()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/spd0;->d:Ll/qfj0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/qfj0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/spd0;->b:Ll/ig60;

    .line 22
    .line 23
    invoke-interface {v1, p0, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 24
    .line 25
    .line 26
    return v0
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/spd0;->f:J

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/spd0;->h:I

    .line 5
    .line 6
    iput-wide p3, p0, Ll/spd0;->i:J

    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/ig60;JIZ)V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p4

    .line 4
    .line 5
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->e()[B

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    array-length v2, v2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_5

    .line 12
    .line 13
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->e()[B

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v4, 0x0

    .line 18
    aget-byte v2, v2, v4

    .line 19
    .line 20
    shr-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    and-int/lit8 v2, v2, 0x3f

    .line 23
    .line 24
    iget-object v5, v0, Ll/spd0;->d:Ll/qfj0;

    .line 25
    .line 26
    invoke-static {v5}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    const/16 v5, 0x30

    .line 30
    .line 31
    if-ltz v2, :cond_0

    .line 32
    .line 33
    if-ge v2, v5, :cond_0

    .line 34
    .line 35
    invoke-direct/range {p0 .. p1}, Ll/spd0;->g(Ll/ig60;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    if-eq v2, v5, :cond_4

    .line 40
    .line 41
    const/16 v5, 0x31

    .line 42
    .line 43
    if-ne v2, v5, :cond_3

    .line 44
    .line 45
    move-object/from16 v5, p1

    .line 46
    .line 47
    invoke-direct {v0, v5, v1}, Ll/spd0;->f(Ll/ig60;I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    if-eqz p5, :cond_2

    .line 51
    .line 52
    iget-wide v2, v0, Ll/spd0;->f:J

    .line 53
    .line 54
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    cmp-long v2, v2, v5

    .line 60
    .line 61
    move-wide/from16 v7, p2

    .line 62
    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    iput-wide v7, v0, Ll/spd0;->f:J

    .line 66
    .line 67
    :cond_1
    iget-wide v5, v0, Ll/spd0;->i:J

    .line 68
    .line 69
    iget-wide v9, v0, Ll/spd0;->f:J

    .line 70
    .line 71
    const v11, 0x15f90

    .line 72
    .line 73
    .line 74
    invoke-static/range {v5 .. v11}, Ll/cqd0;->a(JJJI)J

    .line 75
    .line 76
    .line 77
    move-result-wide v13

    .line 78
    iget-object v12, v0, Ll/spd0;->d:Ll/qfj0;

    .line 79
    .line 80
    iget v15, v0, Ll/spd0;->e:I

    .line 81
    .line 82
    iget v2, v0, Ll/spd0;->h:I

    .line 83
    .line 84
    const/16 v17, 0x0

    .line 85
    .line 86
    const/16 v18, 0x0

    .line 87
    .line 88
    move/from16 v16, v2

    .line 89
    .line 90
    invoke-interface/range {v12 .. v18}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 91
    .line 92
    .line 93
    iput v4, v0, Ll/spd0;->h:I

    .line 94
    .line 95
    :cond_2
    iput v1, v0, Ll/spd0;->g:I

    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "RTP H265 payload type [%d] not supported."

    .line 107
    .line 108
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    throw v0

    .line 117
    :cond_4
    const-string v0, "need to implement processAggregationPacket"

    .line 118
    .line 119
    invoke-static {v0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_5
    const-string v0, "Empty RTP data packet."

    .line 124
    .line 125
    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    throw v0
.end method

.method public c(JI)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Ll/bsf;I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-interface {p1, p2, v0}, Ll/bsf;->b(II)Ll/qfj0;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iput-object p1, p0, Ll/spd0;->d:Ll/qfj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/spd0;->c:Ll/zpd0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
