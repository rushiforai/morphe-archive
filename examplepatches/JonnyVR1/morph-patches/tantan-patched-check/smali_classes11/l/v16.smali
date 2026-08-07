.class public Ll/v16;
.super Ll/cq2;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final o:I

.field public final p:J

.field public final q:Ll/p45;

.field public r:J

.field public volatile s:Z

.field public t:Z


# direct methods
.method public constructor <init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJJJIJLl/p45;)V
    .locals 0
    .param p5    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct/range {p0 .. p15}, Ll/cq2;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJJJ)V

    .line 2
    .line 3
    .line 4
    move/from16 p1, p16

    .line 5
    .line 6
    iput p1, p0, Ll/v16;->o:I

    .line 7
    .line 8
    move-wide/from16 p1, p17

    .line 9
    .line 10
    iput-wide p1, p0, Ll/v16;->p:J

    .line 11
    .line 12
    move-object/from16 p1, p19

    .line 13
    .line 14
    iput-object p1, p0, Ll/v16;->q:Ll/p45;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/v16;->r:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cq2;->j()Ll/eq2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-wide v1, p0, Ll/v16;->p:J

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/eq2;->c(J)V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/v16;->q:Ll/p45;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v16;->l(Ll/eq2;)Ll/p45$b;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    iget-wide v0, p0, Ll/cq2;->k:J

    .line 25
    .line 26
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    cmp-long v2, v0, v5

    .line 32
    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    move-wide v0, v5

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-wide v7, p0, Ll/v16;->p:J

    .line 38
    .line 39
    sub-long/2addr v0, v7

    .line 40
    :goto_0
    iget-wide v7, p0, Ll/cq2;->l:J

    .line 41
    .line 42
    cmp-long v2, v7, v5

    .line 43
    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    :goto_1
    move-wide v7, v5

    .line 47
    move-wide v5, v0

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    iget-wide v5, p0, Ll/v16;->p:J

    .line 50
    .line 51
    sub-long v5, v7, v5

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :goto_2
    invoke-interface/range {v3 .. v8}, Ll/p45;->c(Ll/p45$b;JJ)V

    .line 55
    .line 56
    .line 57
    :cond_2
    :try_start_0
    iget-object v0, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 58
    .line 59
    iget-wide v1, p0, Ll/v16;->r:J

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/upstream/a;->e(J)Lcom/google/android/exoplayer2/upstream/a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/qod;

    .line 66
    .line 67
    iget-object v2, p0, Ll/o45;->i:Ll/p4g0;

    .line 68
    .line 69
    iget-wide v3, v0, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 70
    .line 71
    invoke-virtual {v2, v0}, Ll/p4g0;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 72
    .line 73
    .line 74
    move-result-wide v5

    .line 75
    invoke-direct/range {v1 .. v6}, Ll/qod;-><init>(Ll/e6c;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 76
    .line 77
    .line 78
    :goto_3
    :try_start_1
    iget-boolean v0, p0, Ll/v16;->s:Z

    .line 79
    .line 80
    if-nez v0, :cond_3

    .line 81
    .line 82
    iget-object v0, p0, Ll/v16;->q:Ll/p45;

    .line 83
    .line 84
    invoke-interface {v0, v1}, Ll/p45;->a(Ll/asf;)Z

    .line 85
    .line 86
    .line 87
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    if-eqz v0, :cond_3

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :catchall_0
    move-exception v0

    .line 92
    goto :goto_4

    .line 93
    :cond_3
    :try_start_2
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    iget-object v2, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 98
    .line 99
    iget-wide v2, v2, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 100
    .line 101
    sub-long/2addr v0, v2

    .line 102
    iput-wide v0, p0, Ll/v16;->r:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 103
    .line 104
    iget-object v0, p0, Ll/o45;->i:Ll/p4g0;

    .line 105
    .line 106
    invoke-static {v0}, Ll/m6c;->a(Ll/g6c;)V

    .line 107
    .line 108
    .line 109
    iget-boolean v0, p0, Ll/v16;->s:Z

    .line 110
    .line 111
    xor-int/lit8 v0, v0, 0x1

    .line 112
    .line 113
    iput-boolean v0, p0, Ll/v16;->t:Z

    .line 114
    .line 115
    return-void

    .line 116
    :catchall_1
    move-exception v0

    .line 117
    goto :goto_5

    .line 118
    :goto_4
    :try_start_3
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 119
    .line 120
    .line 121
    move-result-wide v1

    .line 122
    iget-object v3, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 123
    .line 124
    iget-wide v3, v3, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 125
    .line 126
    sub-long/2addr v1, v3

    .line 127
    iput-wide v1, p0, Ll/v16;->r:J

    .line 128
    .line 129
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 130
    :goto_5
    iget-object p0, p0, Ll/o45;->i:Ll/p4g0;

    .line 131
    .line 132
    invoke-static {p0}, Ll/m6c;->a(Ll/g6c;)V

    .line 133
    .line 134
    .line 135
    throw v0
.end method

.method public final c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/v16;->s:Z

    .line 3
    .line 4
    return-void
.end method

.method public g()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/crx;->j:J

    .line 2
    .line 3
    iget p0, p0, Ll/v16;->o:I

    .line 4
    .line 5
    int-to-long v2, p0

    .line 6
    add-long/2addr v0, v2

    .line 7
    return-wide v0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v16;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public l(Ll/eq2;)Ll/p45$b;
    .locals 0

    .line 1
    return-object p1
.end method
