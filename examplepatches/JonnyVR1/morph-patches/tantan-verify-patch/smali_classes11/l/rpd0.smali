.class public final Ll/rpd0;
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
    sget-object v1, Ll/jb20;->a:[B

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ig60;-><init>([B)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/rpd0;->b:Ll/ig60;

    .line 12
    .line 13
    iput-object p1, p0, Ll/rpd0;->c:Ll/zpd0;

    .line 14
    .line 15
    new-instance p1, Ll/ig60;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/rpd0;->a:Ll/ig60;

    .line 21
    .line 22
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    iput-wide v0, p0, Ll/rpd0;->f:J

    .line 28
    .line 29
    const/4 p1, -0x1

    .line 30
    iput p1, p0, Ll/rpd0;->g:I

    .line 31
    .line 32
    return-void
.end method

.method public static e(I)I
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/rpd0;->f:J

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/rpd0;->h:I

    .line 5
    .line 6
    iput-wide p3, p0, Ll/rpd0;->i:J

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
    const/4 v2, 0x0

    .line 6
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ll/ig60;->e()[B

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    const/4 v4, 0x0

    .line 11
    aget-byte v3, v3, v4
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    and-int/lit8 v3, v3, 0x1f

    .line 14
    .line 15
    iget-object v5, v0, Ll/rpd0;->d:Ll/qfj0;

    .line 16
    .line 17
    invoke-static {v5}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const/16 v5, 0x18

    .line 21
    .line 22
    if-lez v3, :cond_0

    .line 23
    .line 24
    if-ge v3, v5, :cond_0

    .line 25
    .line 26
    invoke-virtual/range {p0 .. p1}, Ll/rpd0;->g(Ll/ig60;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    if-ne v3, v5, :cond_1

    .line 31
    .line 32
    invoke-virtual/range {p0 .. p1}, Ll/rpd0;->h(Ll/ig60;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/16 v5, 0x1c

    .line 37
    .line 38
    if-ne v3, v5, :cond_4

    .line 39
    .line 40
    move-object/from16 v5, p1

    .line 41
    .line 42
    invoke-virtual {v0, v5, v1}, Ll/rpd0;->f(Ll/ig60;I)V

    .line 43
    .line 44
    .line 45
    :goto_0
    if-eqz p5, :cond_3

    .line 46
    .line 47
    iget-wide v2, v0, Ll/rpd0;->f:J

    .line 48
    .line 49
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    cmp-long v2, v2, v5

    .line 55
    .line 56
    move-wide/from16 v7, p2

    .line 57
    .line 58
    if-nez v2, :cond_2

    .line 59
    .line 60
    iput-wide v7, v0, Ll/rpd0;->f:J

    .line 61
    .line 62
    :cond_2
    iget-wide v5, v0, Ll/rpd0;->i:J

    .line 63
    .line 64
    iget-wide v9, v0, Ll/rpd0;->f:J

    .line 65
    .line 66
    const v11, 0x15f90

    .line 67
    .line 68
    .line 69
    invoke-static/range {v5 .. v11}, Ll/cqd0;->a(JJJI)J

    .line 70
    .line 71
    .line 72
    move-result-wide v13

    .line 73
    iget-object v12, v0, Ll/rpd0;->d:Ll/qfj0;

    .line 74
    .line 75
    iget v15, v0, Ll/rpd0;->e:I

    .line 76
    .line 77
    iget v2, v0, Ll/rpd0;->h:I

    .line 78
    .line 79
    const/16 v17, 0x0

    .line 80
    .line 81
    const/16 v18, 0x0

    .line 82
    .line 83
    move/from16 v16, v2

    .line 84
    .line 85
    invoke-interface/range {v12 .. v18}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 86
    .line 87
    .line 88
    iput v4, v0, Ll/rpd0;->h:I

    .line 89
    .line 90
    :cond_3
    iput v1, v0, Ll/rpd0;->g:I

    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "RTP H264 packetization mode [%d] not supported."

    .line 102
    .line 103
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    throw v0

    .line 112
    :catch_0
    move-exception v0

    .line 113
    invoke-static {v2, v0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
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
    iput-object p1, p0, Ll/rpd0;->d:Ll/qfj0;

    .line 7
    .line 8
    invoke-static {p1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/qfj0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/rpd0;->c:Ll/zpd0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 17
    .line 18
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final f(Ll/ig60;I)V
    .locals 5
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
    const/4 v1, 0x0

    .line 6
    aget-byte v0, v0, v1

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/4 v3, 0x1

    .line 13
    aget-byte v2, v2, v3

    .line 14
    .line 15
    and-int/lit16 v0, v0, 0xe0

    .line 16
    .line 17
    and-int/lit8 v4, v2, 0x1f

    .line 18
    .line 19
    or-int/2addr v0, v4

    .line 20
    and-int/lit16 v4, v2, 0x80

    .line 21
    .line 22
    if-lez v4, :cond_0

    .line 23
    .line 24
    move v4, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v4, v1

    .line 27
    :goto_0
    and-int/lit8 v2, v2, 0x40

    .line 28
    .line 29
    if-lez v2, :cond_1

    .line 30
    .line 31
    move v1, v3

    .line 32
    :cond_1
    if-eqz v4, :cond_2

    .line 33
    .line 34
    iget p2, p0, Ll/rpd0;->h:I

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/rpd0;->i()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    add-int/2addr p2, v2

    .line 41
    iput p2, p0, Ll/rpd0;->h:I

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    int-to-byte v2, v0

    .line 48
    aput-byte v2, p2, v3

    .line 49
    .line 50
    iget-object p2, p0, Ll/rpd0;->a:Ll/ig60;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p2, p1}, Ll/ig60;->R([B)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/rpd0;->a:Ll/ig60;

    .line 60
    .line 61
    invoke-virtual {p1, v3}, Ll/ig60;->U(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget v2, p0, Ll/rpd0;->g:I

    .line 66
    .line 67
    invoke-static {v2}, Ll/wpd0;->b(I)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eq p2, v2, :cond_3

    .line 72
    .line 73
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string p1, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d. Dropping packet."

    .line 86
    .line 87
    invoke-static {p1, p0}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string p1, "RtpH264Reader"

    .line 92
    .line 93
    invoke-static {p1, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    iget-object p2, p0, Ll/rpd0;->a:Ll/ig60;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p2, p1}, Ll/ig60;->R([B)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/rpd0;->a:Ll/ig60;

    .line 107
    .line 108
    const/4 p2, 0x2

    .line 109
    invoke-virtual {p1, p2}, Ll/ig60;->U(I)V

    .line 110
    .line 111
    .line 112
    :goto_1
    iget-object p1, p0, Ll/rpd0;->a:Ll/ig60;

    .line 113
    .line 114
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget-object p2, p0, Ll/rpd0;->d:Ll/qfj0;

    .line 119
    .line 120
    iget-object v2, p0, Ll/rpd0;->a:Ll/ig60;

    .line 121
    .line 122
    invoke-interface {p2, v2, p1}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 123
    .line 124
    .line 125
    iget p2, p0, Ll/rpd0;->h:I

    .line 126
    .line 127
    add-int/2addr p2, p1

    .line 128
    iput p2, p0, Ll/rpd0;->h:I

    .line 129
    .line 130
    if-eqz v1, :cond_4

    .line 131
    .line 132
    and-int/lit8 p1, v0, 0x1f

    .line 133
    .line 134
    invoke-static {p1}, Ll/rpd0;->e(I)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iput p1, p0, Ll/rpd0;->e:I

    .line 139
    .line 140
    :cond_4
    return-void
.end method

.method public final g(Ll/ig60;)V
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
    iget v1, p0, Ll/rpd0;->h:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rpd0;->i()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/2addr v1, v2

    .line 12
    iput v1, p0, Ll/rpd0;->h:I

    .line 13
    .line 14
    iget-object v1, p0, Ll/rpd0;->d:Ll/qfj0;

    .line 15
    .line 16
    invoke-interface {v1, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Ll/rpd0;->h:I

    .line 20
    .line 21
    add-int/2addr v1, v0

    .line 22
    iput v1, p0, Ll/rpd0;->h:I

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
    and-int/lit8 p1, p1, 0x1f

    .line 32
    .line 33
    invoke-static {p1}, Ll/rpd0;->e(I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Ll/rpd0;->e:I

    .line 38
    .line 39
    return-void
.end method

.method public final h(Ll/ig60;)V
    .locals 3
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "trackOutput"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    :goto_0
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x4

    .line 9
    if-le v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/ig60;->N()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p0, Ll/rpd0;->h:I

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/rpd0;->i()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/2addr v1, v2

    .line 22
    iput v1, p0, Ll/rpd0;->h:I

    .line 23
    .line 24
    iget-object v1, p0, Ll/rpd0;->d:Ll/qfj0;

    .line 25
    .line 26
    invoke-interface {v1, p1, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 27
    .line 28
    .line 29
    iget v1, p0, Ll/rpd0;->h:I

    .line 30
    .line 31
    add-int/2addr v1, v0

    .line 32
    iput v1, p0, Ll/rpd0;->h:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    iput p1, p0, Ll/rpd0;->e:I

    .line 37
    .line 38
    return-void
.end method

.method public final i()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rpd0;->b:Ll/ig60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/rpd0;->b:Ll/ig60;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ig60;->a()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Ll/rpd0;->d:Ll/qfj0;

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
    iget-object p0, p0, Ll/rpd0;->b:Ll/ig60;

    .line 22
    .line 23
    invoke-interface {v1, p0, v0}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 24
    .line 25
    .line 26
    return v0
.end method
