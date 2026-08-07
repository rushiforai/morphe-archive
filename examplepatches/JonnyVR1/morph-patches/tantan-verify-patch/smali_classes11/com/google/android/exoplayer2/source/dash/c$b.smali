.class public final Lcom/google/android/exoplayer2/source/dash/c$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/dash/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/p45;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Ll/t1d0;

.field public final c:Ll/fs2;

.field public final d:Ll/l4c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:J

.field public final f:J


# direct methods
.method public constructor <init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V
    .locals 0
    .param p5    # Ll/p45;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/l4c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 5
    .line 6
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 7
    .line 8
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 9
    .line 10
    iput-wide p6, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 11
    .line 12
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 13
    .line 14
    iput-object p8, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/source/dash/c$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public b(JLl/t1d0;)Lcom/google/android/exoplayer2/source/dash/c$b;
    .locals 19
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/source/BehindLiveWindowException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/t1d0;->b()Ll/l4c;

    .line 6
    .line 7
    .line 8
    move-result-object v8

    .line 9
    move-object v1, v8

    .line 10
    invoke-virtual/range {p3 .. p3}, Ll/t1d0;->b()Ll/l4c;

    .line 11
    .line 12
    .line 13
    move-result-object v8

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v2, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 17
    .line 18
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 19
    .line 20
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 21
    .line 22
    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 23
    .line 24
    move-object/from16 v3, p3

    .line 25
    .line 26
    move-object v8, v1

    .line 27
    move-object v0, v2

    .line 28
    move-wide/from16 v1, p1

    .line 29
    .line 30
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_0
    invoke-interface {v1}, Ll/l4c;->k()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    new-instance v1, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 41
    .line 42
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 43
    .line 44
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 45
    .line 46
    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 47
    .line 48
    move-object/from16 v3, p3

    .line 49
    .line 50
    move-object v0, v1

    .line 51
    move-wide/from16 v1, p1

    .line 52
    .line 53
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 54
    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_1
    move-wide/from16 v2, p1

    .line 58
    .line 59
    invoke-interface {v1, v2, v3}, Ll/l4c;->h(J)J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    const-wide/16 v6, 0x0

    .line 64
    .line 65
    cmp-long v6, v4, v6

    .line 66
    .line 67
    if-nez v6, :cond_2

    .line 68
    .line 69
    new-instance v1, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 70
    .line 71
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 72
    .line 73
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 74
    .line 75
    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 76
    .line 77
    move-object v0, v1

    .line 78
    move-wide v1, v2

    .line 79
    move-object/from16 v3, p3

    .line 80
    .line 81
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 82
    .line 83
    .line 84
    return-object v0

    .line 85
    :cond_2
    invoke-interface {v1}, Ll/l4c;->i()J

    .line 86
    .line 87
    .line 88
    move-result-wide v6

    .line 89
    invoke-interface {v1, v6, v7}, Ll/l4c;->c(J)J

    .line 90
    .line 91
    .line 92
    move-result-wide v9

    .line 93
    add-long/2addr v4, v6

    .line 94
    const-wide/16 v11, 0x1

    .line 95
    .line 96
    sub-long v11, v4, v11

    .line 97
    .line 98
    invoke-interface {v1, v11, v12}, Ll/l4c;->c(J)J

    .line 99
    .line 100
    .line 101
    move-result-wide v13

    .line 102
    invoke-interface {v1, v11, v12, v2, v3}, Ll/l4c;->d(JJ)J

    .line 103
    .line 104
    .line 105
    move-result-wide v11

    .line 106
    add-long/2addr v13, v11

    .line 107
    invoke-interface {v8}, Ll/l4c;->i()J

    .line 108
    .line 109
    .line 110
    move-result-wide v11

    .line 111
    move-wide v15, v4

    .line 112
    invoke-interface {v8, v11, v12}, Ll/l4c;->c(J)J

    .line 113
    .line 114
    .line 115
    move-result-wide v4

    .line 116
    move-wide/from16 v17, v6

    .line 117
    .line 118
    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 119
    .line 120
    cmp-long v13, v13, v4

    .line 121
    .line 122
    if-nez v13, :cond_3

    .line 123
    .line 124
    sub-long v4, v15, v11

    .line 125
    .line 126
    :goto_0
    add-long/2addr v6, v4

    .line 127
    goto :goto_1

    .line 128
    :cond_3
    if-ltz v13, :cond_5

    .line 129
    .line 130
    cmp-long v13, v4, v9

    .line 131
    .line 132
    if-gez v13, :cond_4

    .line 133
    .line 134
    invoke-interface {v8, v9, v10, v2, v3}, Ll/l4c;->g(JJ)J

    .line 135
    .line 136
    .line 137
    move-result-wide v4

    .line 138
    sub-long v4, v4, v17

    .line 139
    .line 140
    sub-long/2addr v6, v4

    .line 141
    goto :goto_1

    .line 142
    :cond_4
    invoke-interface {v1, v4, v5, v2, v3}, Ll/l4c;->g(JJ)J

    .line 143
    .line 144
    .line 145
    move-result-wide v4

    .line 146
    sub-long/2addr v4, v11

    .line 147
    goto :goto_0

    .line 148
    :goto_1
    new-instance v1, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 149
    .line 150
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 151
    .line 152
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 153
    .line 154
    move-object v0, v1

    .line 155
    move-wide v1, v2

    .line 156
    move-object/from16 v3, p3

    .line 157
    .line 158
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 159
    .line 160
    .line 161
    return-object v0

    .line 162
    :cond_5
    new-instance v0, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;

    .line 163
    .line 164
    invoke-direct {v0}, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;-><init>()V

    .line 165
    .line 166
    .line 167
    throw v0
.end method

.method public c(Ll/l4c;)Lcom/google/android/exoplayer2/source/dash/c$b;
    .locals 9
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 4
    .line 5
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 6
    .line 7
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 8
    .line 9
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 10
    .line 11
    iget-wide v6, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 12
    .line 13
    move-object v8, p1

    .line 14
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public d(Ll/fs2;)Lcom/google/android/exoplayer2/source/dash/c$b;
    .locals 9
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 4
    .line 5
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 6
    .line 7
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 8
    .line 9
    iget-wide v6, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 10
    .line 11
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 12
    .line 13
    move-object v4, p1

    .line 14
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public e(J)J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 4
    .line 5
    invoke-interface {v0, v1, v2, p1, p2}, Ll/l4c;->e(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 10
    .line 11
    add-long/2addr p1, v0

    .line 12
    return-wide p1
.end method

.method public f()J
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l4c;->i()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 8
    .line 9
    add-long/2addr v0, v2

    .line 10
    return-wide v0
.end method

.method public g(J)J
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->e(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 8
    .line 9
    invoke-interface {v2, v3, v4, p1, p2}, Ll/l4c;->l(JJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    add-long/2addr v0, p0

    .line 14
    const-wide/16 p0, 0x1

    .line 15
    .line 16
    sub-long/2addr v0, p0

    .line 17
    return-wide v0
.end method

.method public h()J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 4
    .line 5
    invoke-interface {v0, v1, v2}, Ll/l4c;->h(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public i(J)J
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 8
    .line 9
    sub-long/2addr p1, v3

    .line 10
    iget-wide v3, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 11
    .line 12
    invoke-interface {v2, p1, p2, v3, v4}, Ll/l4c;->d(JJ)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    add-long/2addr v0, p0

    .line 17
    return-wide v0
.end method

.method public j(J)J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->e:J

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, v1, v2}, Ll/l4c;->g(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 10
    .line 11
    add-long/2addr p1, v0

    .line 12
    return-wide p1
.end method

.method public k(J)J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 4
    .line 5
    sub-long/2addr p1, v1

    .line 6
    invoke-interface {v0, p1, p2}, Ll/l4c;->c(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public l(J)Ll/mkc0;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->f:J

    .line 4
    .line 5
    sub-long/2addr p1, v1

    .line 6
    invoke-interface {v0, p1, p2}, Ll/l4c;->j(J)Ll/mkc0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public m(JJ)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l4c;->k()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long v0, p3, v2

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->i(J)J

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    cmp-long p0, p0, p3

    .line 25
    .line 26
    if-gtz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_2
    :goto_0
    return v1
.end method
