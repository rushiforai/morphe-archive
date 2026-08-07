.class public final Lcom/google/android/exoplayer2/source/ClippingMediaSource;
.super Lcom/google/android/exoplayer2/source/u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;,
        Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final f:J

.field public final g:J

.field public final h:Z

.field public final i:Z

.field public final j:Z

.field public final k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/source/b;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Lcom/google/android/exoplayer2/c0$d;

.field public m:Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:J

.field public p:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/i;JJZZZ)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/google/android/exoplayer2/source/i;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/source/u;-><init>(Lcom/google/android/exoplayer2/source/i;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    cmp-long p1, p2, v0

    .line 13
    .line 14
    if-ltz p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    invoke-static {p1}, Ll/w11;->a(Z)V

    .line 20
    .line 21
    .line 22
    iput-wide p2, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->f:J

    .line 23
    .line 24
    iput-wide p4, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->g:J

    .line 25
    .line 26
    iput-boolean p6, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->h:Z

    .line 27
    .line 28
    iput-boolean p7, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->i:Z

    .line 29
    .line 30
    iput-boolean p8, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->j:Z

    .line 31
    .line 32
    new-instance p1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 38
    .line 39
    new-instance p1, Lcom/google/android/exoplayer2/c0$d;

    .line 40
    .line 41
    invoke-direct {p1}, Lcom/google/android/exoplayer2/c0$d;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->l:Lcom/google/android/exoplayer2/c0$d;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;
    .locals 7

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/u;->d:Lcom/google/android/exoplayer2/source/i;

    .line 4
    .line 5
    invoke-interface {v1, p1, p2, p3, p4}, Lcom/google/android/exoplayer2/source/i;->createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->h:Z

    .line 10
    .line 11
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->o:J

    .line 12
    .line 13
    iget-wide v5, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->p:J

    .line 14
    .line 15
    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/b;-><init>(Lcom/google/android/exoplayer2/source/h;ZJJ)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public maybeThrowSourceInfoRefreshError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->n:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Lcom/google/android/exoplayer2/source/c;->maybeThrowSourceInfoRefreshError()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    throw v0
.end method

.method public p(Lcom/google/android/exoplayer2/c0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->n:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->u(Lcom/google/android/exoplayer2/c0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public releasePeriod(Lcom/google/android/exoplayer2/source/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/u;->d:Lcom/google/android/exoplayer2/source/i;

    .line 11
    .line 12
    check-cast p1, Lcom/google/android/exoplayer2/source/b;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/b;->a:Lcom/google/android/exoplayer2/source/h;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Lcom/google/android/exoplayer2/source/i;->releasePeriod(Lcom/google/android/exoplayer2/source/h;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->i:Z

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->m:Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;

    .line 32
    .line 33
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;

    .line 38
    .line 39
    iget-object p1, p1, Ll/c3j;->f:Lcom/google/android/exoplayer2/c0;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->u(Lcom/google/android/exoplayer2/c0;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public releaseSourceInternal()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/google/android/exoplayer2/source/c;->releaseSourceInternal()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->n:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->m:Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;

    .line 8
    .line 9
    return-void
.end method

.method public final u(Lcom/google/android/exoplayer2/c0;)V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->l:Lcom/google/android/exoplayer2/c0$d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move-object v3, p1

    .line 5
    invoke-virtual {p1, v1, v0}, Lcom/google/android/exoplayer2/c0;->r(ILcom/google/android/exoplayer2/c0$d;)Lcom/google/android/exoplayer2/c0$d;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->l:Lcom/google/android/exoplayer2/c0$d;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0$d;->g()J

    .line 11
    .line 12
    .line 13
    move-result-wide v4

    .line 14
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->m:Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;

    .line 15
    .line 16
    const-wide/high16 v6, -0x8000000000000000L

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->i:Z

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-wide v8, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->o:J

    .line 34
    .line 35
    sub-long/2addr v8, v4

    .line 36
    iget-wide v10, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->g:J

    .line 37
    .line 38
    cmp-long v0, v10, v6

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-wide v6, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->p:J

    .line 44
    .line 45
    sub-long/2addr v6, v4

    .line 46
    :goto_0
    move-wide v4, v8

    .line 47
    goto :goto_4

    .line 48
    :cond_2
    :goto_1
    iget-wide v8, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->f:J

    .line 49
    .line 50
    iget-wide v10, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->g:J

    .line 51
    .line 52
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->j:Z

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->l:Lcom/google/android/exoplayer2/c0$d;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/c0$d;->e()J

    .line 59
    .line 60
    .line 61
    move-result-wide v12

    .line 62
    add-long/2addr v8, v12

    .line 63
    add-long/2addr v10, v12

    .line 64
    :cond_3
    add-long v12, v4, v8

    .line 65
    .line 66
    iput-wide v12, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->o:J

    .line 67
    .line 68
    iget-wide v12, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->g:J

    .line 69
    .line 70
    cmp-long v0, v12, v6

    .line 71
    .line 72
    if-nez v0, :cond_4

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_4
    add-long v6, v4, v10

    .line 76
    .line 77
    :goto_2
    iput-wide v6, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->p:J

    .line 78
    .line 79
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    move v2, v1

    .line 86
    :goto_3
    if-ge v2, v0, :cond_5

    .line 87
    .line 88
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    check-cast v4, Lcom/google/android/exoplayer2/source/b;

    .line 95
    .line 96
    iget-wide v5, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->o:J

    .line 97
    .line 98
    iget-wide v12, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->p:J

    .line 99
    .line 100
    invoke-virtual {v4, v5, v6, v12, v13}, Lcom/google/android/exoplayer2/source/b;->v(JJ)V

    .line 101
    .line 102
    .line 103
    add-int/lit8 v2, v2, 0x1

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    move-wide v6, v10

    .line 107
    goto :goto_0

    .line 108
    :goto_4
    :try_start_0
    new-instance v2, Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;

    .line 109
    .line 110
    invoke-direct/range {v2 .. v7}, Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;-><init>(Lcom/google/android/exoplayer2/c0;JJ)V

    .line 111
    .line 112
    .line 113
    iput-object v2, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->m:Lcom/google/android/exoplayer2/source/ClippingMediaSource$a;
    :try_end_0
    .catch Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/source/a;->refreshSourceInfo(Lcom/google/android/exoplayer2/c0;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :catch_0
    move-exception v0

    .line 120
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->n:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 121
    .line 122
    :goto_5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-ge v1, v0, :cond_6

    .line 129
    .line 130
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->k:Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lcom/google/android/exoplayer2/source/b;

    .line 137
    .line 138
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/ClippingMediaSource;->n:Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;

    .line 139
    .line 140
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/source/b;->q(Lcom/google/android/exoplayer2/source/ClippingMediaSource$IllegalClippingException;)V

    .line 141
    .line 142
    .line 143
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_6
    return-void
.end method
