.class public final Ll/gum;
.super Ll/o45;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final j:Ll/p45;

.field public k:Ll/p45$b;

.field public l:J

.field public volatile m:Z


# direct methods
.method public constructor <init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;Ll/p45;)V
    .locals 11
    .param p5    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    move-object v0, p0

    .line 13
    move-object v1, p1

    .line 14
    move-object v2, p2

    .line 15
    move-object v4, p3

    .line 16
    move v5, p4

    .line 17
    move-object/from16 v6, p5

    .line 18
    .line 19
    invoke-direct/range {v0 .. v10}, Ll/o45;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ILcom/google/android/exoplayer2/k;ILjava/lang/Object;JJ)V

    .line 20
    .line 21
    .line 22
    move-object/from16 p1, p6

    .line 23
    .line 24
    iput-object p1, p0, Ll/gum;->j:Ll/p45;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/gum;->l:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/gum;->j:Ll/p45;

    .line 10
    .line 11
    iget-object v2, p0, Ll/gum;->k:Ll/p45$b;

    .line 12
    .line 13
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    invoke-interface/range {v1 .. v6}, Ll/p45;->c(Ll/p45$b;JJ)V

    .line 24
    .line 25
    .line 26
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 27
    .line 28
    iget-wide v1, p0, Ll/gum;->l:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/upstream/a;->e(J)Lcom/google/android/exoplayer2/upstream/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/qod;

    .line 35
    .line 36
    iget-object v2, p0, Ll/o45;->i:Ll/p4g0;

    .line 37
    .line 38
    iget-wide v3, v0, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ll/p4g0;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v5

    .line 44
    invoke-direct/range {v1 .. v6}, Ll/qod;-><init>(Ll/e6c;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 45
    .line 46
    .line 47
    :goto_0
    :try_start_1
    iget-boolean v0, p0, Ll/gum;->m:Z

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Ll/gum;->j:Ll/p45;

    .line 52
    .line 53
    invoke-interface {v0, v1}, Ll/p45;->a(Ll/asf;)Z

    .line 54
    .line 55
    .line 56
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    :try_start_2
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    iget-object v2, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 67
    .line 68
    iget-wide v2, v2, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 69
    .line 70
    sub-long/2addr v0, v2

    .line 71
    iput-wide v0, p0, Ll/gum;->l:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 72
    .line 73
    iget-object p0, p0, Ll/o45;->i:Ll/p4g0;

    .line 74
    .line 75
    invoke-static {p0}, Ll/m6c;->a(Ll/g6c;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catchall_1
    move-exception v0

    .line 80
    goto :goto_2

    .line 81
    :goto_1
    :try_start_3
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    iget-object v3, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 86
    .line 87
    iget-wide v3, v3, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 88
    .line 89
    sub-long/2addr v1, v3

    .line 90
    iput-wide v1, p0, Ll/gum;->l:J

    .line 91
    .line 92
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 93
    :goto_2
    iget-object p0, p0, Ll/o45;->i:Ll/p4g0;

    .line 94
    .line 95
    invoke-static {p0}, Ll/m6c;->a(Ll/g6c;)V

    .line 96
    .line 97
    .line 98
    throw v0
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gum;->m:Z

    .line 3
    .line 4
    return-void
.end method

.method public g(Ll/p45$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gum;->k:Ll/p45$b;

    .line 2
    .line 3
    return-void
.end method
