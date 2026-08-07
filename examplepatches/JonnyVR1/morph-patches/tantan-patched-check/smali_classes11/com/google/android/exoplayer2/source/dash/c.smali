.class public Lcom/google/android/exoplayer2/source/dash/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/dash/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/dash/c$b;,
        Lcom/google/android/exoplayer2/source/dash/c$c;,
        Lcom/google/android/exoplayer2/source/dash/c$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/vtv;

.field public final b:Ll/hs2;

.field public final c:[I

.field public final d:I

.field public final e:Ll/g6c;

.field public final f:J

.field public final g:I

.field public final h:Lcom/google/android/exoplayer2/source/dash/d$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final i:[Lcom/google/android/exoplayer2/source/dash/c$b;

.field public j:Ll/u9f;

.field public k:Ll/h4c;

.field public l:I

.field public m:Ljava/io/IOException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:Z


# direct methods
.method public constructor <init>(Ll/p45$a;Ll/vtv;Ll/h4c;Ll/hs2;I[ILl/u9f;ILl/g6c;JIZLjava/util/List;Lcom/google/android/exoplayer2/source/dash/d$c;Ll/bf80;Ll/zb5;)V
    .locals 19
    .param p15    # Lcom/google/android/exoplayer2/source/dash/d$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p45$a;",
            "Ll/vtv;",
            "Ll/h4c;",
            "Ll/hs2;",
            "I[I",
            "Ll/u9f;",
            "I",
            "Ll/g6c;",
            "JIZ",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Lcom/google/android/exoplayer2/source/dash/d$c;",
            "Ll/bf80;",
            "Ll/zb5;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    move/from16 v3, p5

    .line 8
    .line 9
    move-object/from16 v4, p7

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    move-object/from16 v5, p2

    .line 15
    .line 16
    iput-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c;->a:Ll/vtv;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 19
    .line 20
    iput-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c;->b:Ll/hs2;

    .line 21
    .line 22
    move-object/from16 v5, p6

    .line 23
    .line 24
    iput-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c;->c:[I

    .line 25
    .line 26
    iput-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 27
    .line 28
    move/from16 v6, p8

    .line 29
    .line 30
    iput v6, v0, Lcom/google/android/exoplayer2/source/dash/c;->d:I

    .line 31
    .line 32
    move-object/from16 v5, p9

    .line 33
    .line 34
    iput-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c;->e:Ll/g6c;

    .line 35
    .line 36
    iput v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->l:I

    .line 37
    .line 38
    move-wide/from16 v7, p10

    .line 39
    .line 40
    iput-wide v7, v0, Lcom/google/android/exoplayer2/source/dash/c;->f:J

    .line 41
    .line 42
    move/from16 v5, p12

    .line 43
    .line 44
    iput v5, v0, Lcom/google/android/exoplayer2/source/dash/c;->g:I

    .line 45
    .line 46
    move-object/from16 v10, p15

    .line 47
    .line 48
    iput-object v10, v0, Lcom/google/android/exoplayer2/source/dash/c;->h:Lcom/google/android/exoplayer2/source/dash/d$c;

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ll/h4c;->g(I)J

    .line 51
    .line 52
    .line 53
    move-result-wide v12

    .line 54
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/dash/c;->n()Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v4}, Ll/vfj0;->length()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    new-array v3, v3, [Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 63
    .line 64
    iput-object v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    move v14, v3

    .line 68
    :goto_0
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 69
    .line 70
    array-length v5, v5

    .line 71
    if-ge v14, v5, :cond_1

    .line 72
    .line 73
    invoke-interface {v4, v14}, Ll/vfj0;->c(I)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    move-object v15, v5

    .line 82
    check-cast v15, Ll/t1d0;

    .line 83
    .line 84
    iget-object v5, v15, Ll/t1d0;->c:Lcom/google/common/collect/ImmutableList;

    .line 85
    .line 86
    invoke-virtual {v2, v5}, Ll/hs2;->j(Ljava/util/List;)Ll/fs2;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 91
    .line 92
    new-instance v16, Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 93
    .line 94
    if-eqz v5, :cond_0

    .line 95
    .line 96
    :goto_1
    move-object/from16 v17, v5

    .line 97
    .line 98
    move-object v5, v7

    .line 99
    goto :goto_2

    .line 100
    :cond_0
    iget-object v5, v15, Ll/t1d0;->c:Lcom/google/common/collect/ImmutableList;

    .line 101
    .line 102
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    check-cast v5, Ll/fs2;

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :goto_2
    iget-object v7, v15, Ll/t1d0;->b:Lcom/google/android/exoplayer2/k;

    .line 110
    .line 111
    move/from16 v8, p13

    .line 112
    .line 113
    move-object/from16 v9, p14

    .line 114
    .line 115
    move-object/from16 v11, p16

    .line 116
    .line 117
    move-object/from16 v18, v5

    .line 118
    .line 119
    move-object/from16 v5, p1

    .line 120
    .line 121
    invoke-interface/range {v5 .. v11}, Ll/p45$a;->a(ILcom/google/android/exoplayer2/k;ZLjava/util/List;Ll/qfj0;Ll/bf80;)Ll/p45;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    move-object v10, v7

    .line 126
    move-wide v6, v12

    .line 127
    const-wide/16 v11, 0x0

    .line 128
    .line 129
    invoke-virtual {v15}, Ll/t1d0;->b()Ll/l4c;

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    move-object v8, v15

    .line 134
    move-object/from16 v5, v16

    .line 135
    .line 136
    move-object/from16 v9, v17

    .line 137
    .line 138
    invoke-direct/range {v5 .. v13}, Lcom/google/android/exoplayer2/source/dash/c$b;-><init>(JLl/t1d0;Ll/fs2;Ll/p45;JLl/l4c;)V

    .line 139
    .line 140
    .line 141
    aput-object v5, v18, v14

    .line 142
    .line 143
    add-int/lit8 v14, v14, 0x1

    .line 144
    .line 145
    move-object/from16 v10, p15

    .line 146
    .line 147
    move-wide v12, v6

    .line 148
    move/from16 v6, p8

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->m:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->a:Ll/vtv;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/vtv;->a()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    throw v0
.end method

.method public b(Ll/u9f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 2
    .line 3
    return-void
.end method

.method public c(JLl/o45;Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/o45;",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->m:Ljava/io/IOException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Ll/u9f;->p(JLl/o45;Ljava/util/List;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public d(JLjava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->m:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/vfj0;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 16
    .line 17
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->i(JLjava/util/List;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public e(Ll/o45;ZLcom/google/android/exoplayer2/upstream/c$c;Lcom/google/android/exoplayer2/upstream/c;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/dash/c;->h:Lcom/google/android/exoplayer2/source/dash/d$c;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/source/dash/d$c;->j(Ll/o45;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 18
    .line 19
    iget-boolean p2, p2, Ll/h4c;->d:Z

    .line 20
    .line 21
    if-nez p2, :cond_2

    .line 22
    .line 23
    instance-of p2, p1, Ll/crx;

    .line 24
    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    iget-object p2, p3, Lcom/google/android/exoplayer2/upstream/c$c;->c:Ljava/io/IOException;

    .line 28
    .line 29
    instance-of v2, p2, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    check-cast p2, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 34
    .line 35
    iget p2, p2, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    .line 36
    .line 37
    const/16 v2, 0x194

    .line 38
    .line 39
    if-ne p2, v2, :cond_2

    .line 40
    .line 41
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 44
    .line 45
    iget-object v3, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 46
    .line 47
    invoke-interface {v2, v3}, Ll/vfj0;->r(Lcom/google/android/exoplayer2/k;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    aget-object p2, p2, v2

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->h()J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    const-wide/16 v4, -0x1

    .line 58
    .line 59
    cmp-long v4, v2, v4

    .line 60
    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    const-wide/16 v4, 0x0

    .line 64
    .line 65
    cmp-long v4, v2, v4

    .line 66
    .line 67
    if-eqz v4, :cond_2

    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->f()J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    add-long/2addr v4, v2

    .line 74
    const-wide/16 v2, 0x1

    .line 75
    .line 76
    sub-long/2addr v4, v2

    .line 77
    move-object p2, p1

    .line 78
    check-cast p2, Ll/crx;

    .line 79
    .line 80
    invoke-virtual {p2}, Ll/crx;->g()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    cmp-long p2, v2, v4

    .line 85
    .line 86
    if-lez p2, :cond_2

    .line 87
    .line 88
    iput-boolean v1, p0, Lcom/google/android/exoplayer2/source/dash/c;->n:Z

    .line 89
    .line 90
    return v1

    .line 91
    :cond_2
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 92
    .line 93
    iget-object v2, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 94
    .line 95
    invoke-interface {p2, v2}, Ll/vfj0;->r(Lcom/google/android/exoplayer2/k;)I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 100
    .line 101
    aget-object p2, v2, p2

    .line 102
    .line 103
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c;->b:Ll/hs2;

    .line 104
    .line 105
    iget-object v3, p2, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 106
    .line 107
    iget-object v3, v3, Ll/t1d0;->c:Lcom/google/common/collect/ImmutableList;

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ll/hs2;->j(Ljava/util/List;)Ll/fs2;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    if-eqz v2, :cond_3

    .line 114
    .line 115
    iget-object v3, p2, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 116
    .line 117
    invoke-virtual {v3, v2}, Ll/fs2;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-nez v2, :cond_3

    .line 122
    .line 123
    return v1

    .line 124
    :cond_3
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 125
    .line 126
    iget-object v3, p2, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 127
    .line 128
    iget-object v3, v3, Ll/t1d0;->c:Lcom/google/common/collect/ImmutableList;

    .line 129
    .line 130
    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer2/source/dash/c;->k(Ll/u9f;Ljava/util/List;)Lcom/google/android/exoplayer2/upstream/c$a;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const/4 v3, 0x2

    .line 135
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/upstream/c$a;->a(I)Z

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    if-nez v4, :cond_4

    .line 140
    .line 141
    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/upstream/c$a;->a(I)Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-nez v4, :cond_4

    .line 146
    .line 147
    return v0

    .line 148
    :cond_4
    invoke-interface {p4, v2, p3}, Lcom/google/android/exoplayer2/upstream/c;->b(Lcom/google/android/exoplayer2/upstream/c$a;Lcom/google/android/exoplayer2/upstream/c$c;)Lcom/google/android/exoplayer2/upstream/c$b;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    if-eqz p3, :cond_7

    .line 153
    .line 154
    iget p4, p3, Lcom/google/android/exoplayer2/upstream/c$b;->a:I

    .line 155
    .line 156
    invoke-virtual {v2, p4}, Lcom/google/android/exoplayer2/upstream/c$a;->a(I)Z

    .line 157
    .line 158
    .line 159
    move-result p4

    .line 160
    if-nez p4, :cond_5

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_5
    iget p4, p3, Lcom/google/android/exoplayer2/upstream/c$b;->a:I

    .line 164
    .line 165
    if-ne p4, v3, :cond_6

    .line 166
    .line 167
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 168
    .line 169
    iget-object p1, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 170
    .line 171
    invoke-interface {p0, p1}, Ll/vfj0;->r(Lcom/google/android/exoplayer2/k;)I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iget-wide p2, p3, Lcom/google/android/exoplayer2/upstream/c$b;->b:J

    .line 176
    .line 177
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->d(IJ)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    return p0

    .line 182
    :cond_6
    if-ne p4, v1, :cond_7

    .line 183
    .line 184
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->b:Ll/hs2;

    .line 185
    .line 186
    iget-object p1, p2, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 187
    .line 188
    iget-wide p2, p3, Lcom/google/android/exoplayer2/upstream/c$b;->b:J

    .line 189
    .line 190
    invoke-virtual {p0, p1, p2, p3}, Ll/hs2;->e(Ll/fs2;J)V

    .line 191
    .line 192
    .line 193
    return v1

    .line 194
    :cond_7
    :goto_0
    return v0
.end method

.method public g(JLl/nke0;)J
    .locals 12

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_4

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    iget-object v3, v2, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/dash/c$b;->h()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    const-wide/16 v5, 0x0

    .line 18
    .line 19
    cmp-long v5, v3, v5

    .line 20
    .line 21
    if-nez v5, :cond_1

    .line 22
    .line 23
    :cond_0
    move-wide v6, p1

    .line 24
    move-object v5, p3

    .line 25
    goto :goto_3

    .line 26
    :cond_1
    invoke-virtual {v2, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->j(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    invoke-virtual {v2, v0, v1}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 31
    .line 32
    .line 33
    move-result-wide v8

    .line 34
    cmp-long p0, v8, p1

    .line 35
    .line 36
    if-gez p0, :cond_3

    .line 37
    .line 38
    const-wide/16 v5, -0x1

    .line 39
    .line 40
    cmp-long p0, v3, v5

    .line 41
    .line 42
    const-wide/16 v5, 0x1

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/source/dash/c$b;->f()J

    .line 47
    .line 48
    .line 49
    move-result-wide v10

    .line 50
    add-long/2addr v10, v3

    .line 51
    sub-long/2addr v10, v5

    .line 52
    cmp-long p0, v0, v10

    .line 53
    .line 54
    if-gez p0, :cond_3

    .line 55
    .line 56
    :cond_2
    add-long/2addr v0, v5

    .line 57
    invoke-virtual {v2, v0, v1}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    move-wide v10, v0

    .line 62
    :goto_1
    move-wide v6, p1

    .line 63
    move-object v5, p3

    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move-wide v10, v8

    .line 66
    goto :goto_1

    .line 67
    :goto_2
    invoke-virtual/range {v5 .. v11}, Ll/nke0;->a(JJJ)J

    .line 68
    .line 69
    .line 70
    move-result-wide p0

    .line 71
    return-wide p0

    .line 72
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    move-object p3, v5

    .line 75
    move-wide p1, v6

    .line 76
    goto :goto_0

    .line 77
    :cond_4
    move-wide v6, p1

    .line 78
    return-wide v6
.end method

.method public h(JJLjava/util/List;Ll/q45;)V
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/List<",
            "+",
            "Ll/crx;",
            ">;",
            "Ll/q45;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v9, p1

    .line 4
    .line 5
    move-object/from16 v15, p6

    .line 6
    .line 7
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/c;->m:Ljava/io/IOException;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sub-long v11, p3, v9

    .line 13
    .line 14
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 15
    .line 16
    iget-wide v1, v1, Ll/h4c;->a:J

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 23
    .line 24
    iget v4, v0, Lcom/google/android/exoplayer2/source/dash/c;->l:I

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ll/h4c;->d(I)Ll/mr60;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-wide v3, v3, Ll/mr60;->b:J

    .line 31
    .line 32
    invoke-static {v3, v4}, Ll/bmk0;->J0(J)J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    add-long/2addr v1, v3

    .line 37
    add-long v1, v1, p3

    .line 38
    .line 39
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->h:Lcom/google/android/exoplayer2/source/dash/d$c;

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-virtual {v3, v1, v2}, Lcom/google/android/exoplayer2/source/dash/d$c;->h(J)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    :goto_0
    return-void

    .line 50
    :cond_1
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/dash/c;->f:J

    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/bmk0;->e0(J)J

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 57
    .line 58
    .line 59
    move-result-wide v13

    .line 60
    invoke-virtual {v0, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c;->m(J)J

    .line 61
    .line 62
    .line 63
    move-result-wide v16

    .line 64
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/16 v18, 0x0

    .line 69
    .line 70
    const/4 v2, 0x1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    move-object/from16 v3, p5

    .line 74
    .line 75
    move-object/from16 v1, v18

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    sub-int/2addr v1, v2

    .line 83
    move-object/from16 v3, p5

    .line 84
    .line 85
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Ll/crx;

    .line 90
    .line 91
    :goto_1
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 92
    .line 93
    invoke-interface {v4}, Ll/vfj0;->length()I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    new-array v5, v4, [Ll/drx;

    .line 98
    .line 99
    const/16 v19, 0x0

    .line 100
    .line 101
    move/from16 v6, v19

    .line 102
    .line 103
    :goto_2
    if-ge v6, v4, :cond_5

    .line 104
    .line 105
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 106
    .line 107
    aget-object v7, v7, v6

    .line 108
    .line 109
    iget-object v8, v7, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 110
    .line 111
    if-nez v8, :cond_3

    .line 112
    .line 113
    sget-object v7, Ll/drx;->a:Ll/drx;

    .line 114
    .line 115
    aput-object v7, v5, v6

    .line 116
    .line 117
    move-object v8, v0

    .line 118
    move-object/from16 v20, v1

    .line 119
    .line 120
    move/from16 v22, v2

    .line 121
    .line 122
    move-object/from16 v21, v5

    .line 123
    .line 124
    move-wide/from16 v23, v11

    .line 125
    .line 126
    move v12, v4

    .line 127
    move v11, v6

    .line 128
    goto :goto_3

    .line 129
    :cond_3
    move-object v8, v5

    .line 130
    move/from16 v20, v6

    .line 131
    .line 132
    invoke-virtual {v7, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c$b;->e(J)J

    .line 133
    .line 134
    .line 135
    move-result-wide v5

    .line 136
    move/from16 v22, v2

    .line 137
    .line 138
    move-object/from16 v21, v8

    .line 139
    .line 140
    move-object v2, v1

    .line 141
    move-object v1, v7

    .line 142
    invoke-virtual {v1, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c$b;->g(J)J

    .line 143
    .line 144
    .line 145
    move-result-wide v7

    .line 146
    move-wide/from16 v23, v11

    .line 147
    .line 148
    move/from16 v11, v20

    .line 149
    .line 150
    move v12, v4

    .line 151
    move-wide/from16 v3, p3

    .line 152
    .line 153
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c;->o(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/crx;JJJ)J

    .line 154
    .line 155
    .line 156
    move-result-wide v25

    .line 157
    move-wide/from16 v27, v7

    .line 158
    .line 159
    move-object v8, v0

    .line 160
    move-wide/from16 v0, v27

    .line 161
    .line 162
    move-object/from16 v20, v2

    .line 163
    .line 164
    cmp-long v2, v25, v5

    .line 165
    .line 166
    if-gez v2, :cond_4

    .line 167
    .line 168
    sget-object v0, Ll/drx;->a:Ll/drx;

    .line 169
    .line 170
    aput-object v0, v21, v11

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_4
    move-wide v4, v0

    .line 174
    invoke-virtual {v8, v11}, Lcom/google/android/exoplayer2/source/dash/c;->r(I)Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/c$c;

    .line 179
    .line 180
    move-wide/from16 v6, v16

    .line 181
    .line 182
    move-wide/from16 v2, v25

    .line 183
    .line 184
    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/source/dash/c$c;-><init>(Lcom/google/android/exoplayer2/source/dash/c$b;JJJ)V

    .line 185
    .line 186
    .line 187
    aput-object v0, v21, v11

    .line 188
    .line 189
    :goto_3
    add-int/lit8 v6, v11, 0x1

    .line 190
    .line 191
    move-object/from16 v3, p5

    .line 192
    .line 193
    move-object v0, v8

    .line 194
    move v4, v12

    .line 195
    move-object/from16 v1, v20

    .line 196
    .line 197
    move-object/from16 v5, v21

    .line 198
    .line 199
    move/from16 v2, v22

    .line 200
    .line 201
    move-wide/from16 v11, v23

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_5
    move-object v8, v0

    .line 205
    move-object/from16 v20, v1

    .line 206
    .line 207
    move/from16 v22, v2

    .line 208
    .line 209
    move-object/from16 v21, v5

    .line 210
    .line 211
    move-wide/from16 v23, v11

    .line 212
    .line 213
    invoke-virtual {v8, v13, v14, v9, v10}, Lcom/google/android/exoplayer2/source/dash/c;->l(JJ)J

    .line 214
    .line 215
    .line 216
    move-result-wide v5

    .line 217
    iget-object v0, v8, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 218
    .line 219
    move-object/from16 v7, p5

    .line 220
    .line 221
    move-wide v1, v9

    .line 222
    move-wide/from16 v3, v23

    .line 223
    .line 224
    move-object v9, v8

    .line 225
    move-object/from16 v8, v21

    .line 226
    .line 227
    invoke-interface/range {v0 .. v8}, Ll/u9f;->g(JJJLjava/util/List;[Ll/drx;)V

    .line 228
    .line 229
    .line 230
    iget-object v0, v9, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 231
    .line 232
    invoke-interface {v0}, Ll/u9f;->b()I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    invoke-virtual {v9, v0}, Lcom/google/android/exoplayer2/source/dash/c;->r(I)Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    iget-object v0, v1, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 241
    .line 242
    const/4 v8, 0x0

    .line 243
    if-eqz v0, :cond_8

    .line 244
    .line 245
    iget-object v2, v1, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 246
    .line 247
    invoke-interface {v0}, Ll/p45;->e()[Lcom/google/android/exoplayer2/k;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    if-nez v0, :cond_6

    .line 252
    .line 253
    invoke-virtual {v2}, Ll/t1d0;->n()Ll/mkc0;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    move-object v6, v0

    .line 258
    goto :goto_4

    .line 259
    :cond_6
    move-object/from16 v6, v18

    .line 260
    .line 261
    :goto_4
    iget-object v0, v1, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 262
    .line 263
    if-nez v0, :cond_7

    .line 264
    .line 265
    invoke-virtual {v2}, Ll/t1d0;->m()Ll/mkc0;

    .line 266
    .line 267
    .line 268
    move-result-object v18

    .line 269
    :cond_7
    move-object/from16 v7, v18

    .line 270
    .line 271
    if-nez v6, :cond_9

    .line 272
    .line 273
    if-eqz v7, :cond_8

    .line 274
    .line 275
    goto :goto_5

    .line 276
    :cond_8
    move-object v0, v9

    .line 277
    move-object v9, v8

    .line 278
    goto :goto_6

    .line 279
    :cond_9
    :goto_5
    iget-object v2, v9, Lcom/google/android/exoplayer2/source/dash/c;->e:Ll/g6c;

    .line 280
    .line 281
    iget-object v0, v9, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 282
    .line 283
    invoke-interface {v0}, Ll/u9f;->k()Lcom/google/android/exoplayer2/k;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    iget-object v0, v9, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 288
    .line 289
    invoke-interface {v0}, Ll/u9f;->s()I

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    iget-object v0, v9, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 294
    .line 295
    invoke-interface {v0}, Ll/u9f;->o()Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v5

    .line 299
    move-object v0, v9

    .line 300
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c;->p(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/g6c;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;Ll/mkc0;Ll/mkc0;Ll/ac5;)Ll/o45;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iput-object v0, v15, Ll/q45;->a:Ll/o45;

    .line 305
    .line 306
    return-void

    .line 307
    :goto_6
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/dash/c$b;->a(Lcom/google/android/exoplayer2/source/dash/c$b;)J

    .line 308
    .line 309
    .line 310
    move-result-wide v10

    .line 311
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 312
    .line 313
    iget-boolean v3, v2, Ll/h4c;->d:Z

    .line 314
    .line 315
    if-eqz v3, :cond_a

    .line 316
    .line 317
    iget v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->l:I

    .line 318
    .line 319
    invoke-virtual {v2}, Ll/h4c;->e()I

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    add-int/lit8 v2, v2, -0x1

    .line 324
    .line 325
    if-ne v3, v2, :cond_a

    .line 326
    .line 327
    move/from16 v2, v22

    .line 328
    .line 329
    goto :goto_7

    .line 330
    :cond_a
    move/from16 v2, v19

    .line 331
    .line 332
    :goto_7
    const-wide v23, -0x7fffffffffffffffL    # -4.9E-324

    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    if-eqz v2, :cond_c

    .line 338
    .line 339
    cmp-long v3, v10, v23

    .line 340
    .line 341
    if-eqz v3, :cond_b

    .line 342
    .line 343
    goto :goto_8

    .line 344
    :cond_b
    move/from16 v3, v19

    .line 345
    .line 346
    goto :goto_9

    .line 347
    :cond_c
    :goto_8
    move/from16 v3, v22

    .line 348
    .line 349
    :goto_9
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/source/dash/c$b;->h()J

    .line 350
    .line 351
    .line 352
    move-result-wide v4

    .line 353
    const-wide/16 v6, 0x0

    .line 354
    .line 355
    cmp-long v4, v4, v6

    .line 356
    .line 357
    if-nez v4, :cond_d

    .line 358
    .line 359
    iput-boolean v3, v15, Ll/q45;->b:Z

    .line 360
    .line 361
    return-void

    .line 362
    :cond_d
    invoke-virtual {v1, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c$b;->e(J)J

    .line 363
    .line 364
    .line 365
    move-result-wide v5

    .line 366
    invoke-virtual {v1, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c$b;->g(J)J

    .line 367
    .line 368
    .line 369
    move-result-wide v7

    .line 370
    if-eqz v2, :cond_f

    .line 371
    .line 372
    invoke-virtual {v1, v7, v8}, Lcom/google/android/exoplayer2/source/dash/c$b;->i(J)J

    .line 373
    .line 374
    .line 375
    move-result-wide v12

    .line 376
    invoke-virtual {v1, v7, v8}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 377
    .line 378
    .line 379
    move-result-wide v25

    .line 380
    sub-long v25, v12, v25

    .line 381
    .line 382
    add-long v12, v12, v25

    .line 383
    .line 384
    cmp-long v2, v12, v10

    .line 385
    .line 386
    if-ltz v2, :cond_e

    .line 387
    .line 388
    move/from16 v2, v22

    .line 389
    .line 390
    goto :goto_a

    .line 391
    :cond_e
    move/from16 v2, v19

    .line 392
    .line 393
    :goto_a
    and-int/2addr v3, v2

    .line 394
    :cond_f
    move v12, v3

    .line 395
    move-object/from16 v2, v20

    .line 396
    .line 397
    move-wide/from16 v3, p3

    .line 398
    .line 399
    invoke-virtual/range {v0 .. v8}, Lcom/google/android/exoplayer2/source/dash/c;->o(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/crx;JJJ)J

    .line 400
    .line 401
    .line 402
    move-result-wide v13

    .line 403
    cmp-long v2, v13, v5

    .line 404
    .line 405
    if-gez v2, :cond_10

    .line 406
    .line 407
    new-instance v1, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;

    .line 408
    .line 409
    invoke-direct {v1}, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;-><init>()V

    .line 410
    .line 411
    .line 412
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/dash/c;->m:Ljava/io/IOException;

    .line 413
    .line 414
    return-void

    .line 415
    :cond_10
    cmp-long v2, v13, v7

    .line 416
    .line 417
    if-gtz v2, :cond_15

    .line 418
    .line 419
    iget-boolean v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->n:Z

    .line 420
    .line 421
    if-eqz v3, :cond_11

    .line 422
    .line 423
    if-ltz v2, :cond_11

    .line 424
    .line 425
    goto :goto_e

    .line 426
    :cond_11
    if-eqz v12, :cond_12

    .line 427
    .line 428
    invoke-virtual {v1, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 429
    .line 430
    .line 431
    move-result-wide v2

    .line 432
    cmp-long v2, v2, v10

    .line 433
    .line 434
    if-ltz v2, :cond_12

    .line 435
    .line 436
    move/from16 v2, v22

    .line 437
    .line 438
    iput-boolean v2, v15, Ll/q45;->b:Z

    .line 439
    .line 440
    return-void

    .line 441
    :cond_12
    iget v2, v0, Lcom/google/android/exoplayer2/source/dash/c;->g:I

    .line 442
    .line 443
    int-to-long v2, v2

    .line 444
    sub-long/2addr v7, v13

    .line 445
    const-wide/16 v4, 0x1

    .line 446
    .line 447
    add-long/2addr v7, v4

    .line 448
    invoke-static {v2, v3, v7, v8}, Ljava/lang/Math;->min(JJ)J

    .line 449
    .line 450
    .line 451
    move-result-wide v2

    .line 452
    long-to-int v2, v2

    .line 453
    cmp-long v3, v10, v23

    .line 454
    .line 455
    if-eqz v3, :cond_13

    .line 456
    .line 457
    const/4 v3, 0x1

    .line 458
    :goto_b
    if-le v2, v3, :cond_13

    .line 459
    .line 460
    int-to-long v6, v2

    .line 461
    add-long/2addr v6, v13

    .line 462
    sub-long/2addr v6, v4

    .line 463
    invoke-virtual {v1, v6, v7}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 464
    .line 465
    .line 466
    move-result-wide v6

    .line 467
    cmp-long v6, v6, v10

    .line 468
    .line 469
    if-ltz v6, :cond_13

    .line 470
    .line 471
    add-int/lit8 v2, v2, -0x1

    .line 472
    .line 473
    goto :goto_b

    .line 474
    :cond_13
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->isEmpty()Z

    .line 475
    .line 476
    .line 477
    move-result v3

    .line 478
    if-eqz v3, :cond_14

    .line 479
    .line 480
    move-wide/from16 v10, p3

    .line 481
    .line 482
    :goto_c
    move-object v8, v9

    .line 483
    move v9, v2

    .line 484
    goto :goto_d

    .line 485
    :cond_14
    move-wide/from16 v10, v23

    .line 486
    .line 487
    goto :goto_c

    .line 488
    :goto_d
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c;->e:Ll/g6c;

    .line 489
    .line 490
    iget v3, v0, Lcom/google/android/exoplayer2/source/dash/c;->d:I

    .line 491
    .line 492
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 493
    .line 494
    invoke-interface {v4}, Ll/u9f;->k()Lcom/google/android/exoplayer2/k;

    .line 495
    .line 496
    .line 497
    move-result-object v4

    .line 498
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 499
    .line 500
    invoke-interface {v5}, Ll/u9f;->s()I

    .line 501
    .line 502
    .line 503
    move-result v5

    .line 504
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 505
    .line 506
    invoke-interface {v6}, Ll/u9f;->o()Ljava/lang/Object;

    .line 507
    .line 508
    .line 509
    move-result-object v6

    .line 510
    move-wide/from16 v27, v13

    .line 511
    .line 512
    move-object v14, v8

    .line 513
    move-wide/from16 v7, v27

    .line 514
    .line 515
    move-wide/from16 v12, v16

    .line 516
    .line 517
    invoke-virtual/range {v0 .. v14}, Lcom/google/android/exoplayer2/source/dash/c;->q(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/g6c;ILcom/google/android/exoplayer2/k;ILjava/lang/Object;JIJJLl/ac5;)Ll/o45;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    iput-object v0, v15, Ll/q45;->a:Ll/o45;

    .line 522
    .line 523
    return-void

    .line 524
    :cond_15
    :goto_e
    iput-boolean v12, v15, Ll/q45;->b:Z

    .line 525
    .line 526
    return-void
.end method

.method public i(Ll/h4c;I)V
    .locals 5

    .line 1
    :try_start_0
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 2
    .line 3
    iput p2, p0, Lcom/google/android/exoplayer2/source/dash/c;->l:I

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Ll/h4c;->g(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/dash/c;->n()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 15
    .line 16
    array-length v2, v2

    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 20
    .line 21
    invoke-interface {v2, v1}, Ll/vfj0;->c(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/t1d0;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 32
    .line 33
    aget-object v4, v3, v1

    .line 34
    .line 35
    invoke-virtual {v4, p1, p2, v2}, Lcom/google/android/exoplayer2/source/dash/c$b;->b(JLl/t1d0;)Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    aput-object v2, v3, v1
    :try_end_0
    .catch Lcom/google/android/exoplayer2/source/BehindLiveWindowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    return-void

    .line 47
    :goto_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/c;->m:Ljava/io/IOException;

    .line 48
    .line 49
    return-void
.end method

.method public j(Ll/o45;)V
    .locals 7

    .line 1
    instance-of v0, p1, Ll/gum;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/gum;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/c;->j:Ll/u9f;

    .line 9
    .line 10
    iget-object v0, v0, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ll/vfj0;->r(Lcom/google/android/exoplayer2/k;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 17
    .line 18
    aget-object v1, v1, v0

    .line 19
    .line 20
    iget-object v2, v1, Lcom/google/android/exoplayer2/source/dash/c$b;->d:Ll/l4c;

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    iget-object v2, v1, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 25
    .line 26
    invoke-interface {v2}, Ll/p45;->d()Ll/r45;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 33
    .line 34
    new-instance v4, Ll/n4c;

    .line 35
    .line 36
    iget-object v5, v1, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 37
    .line 38
    iget-wide v5, v5, Ll/t1d0;->d:J

    .line 39
    .line 40
    invoke-direct {v4, v2, v5, v6}, Ll/n4c;-><init>(Ll/r45;J)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/source/dash/c$b;->c(Ll/l4c;)Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    aput-object v1, v3, v0

    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->h:Lcom/google/android/exoplayer2/source/dash/d$c;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/d$c;->i(Ll/o45;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final k(Ll/u9f;Ljava/util/List;)Lcom/google/android/exoplayer2/upstream/c$a;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u9f;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;)",
            "Lcom/google/android/exoplayer2/upstream/c$a;"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p1}, Ll/vfj0;->length()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    :goto_0
    if-ge v3, v2, :cond_1

    .line 12
    .line 13
    invoke-interface {p1, v3, v0, v1}, Ll/u9f;->a(IJ)Z

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    if-eqz v5, :cond_0

    .line 18
    .line 19
    add-int/lit8 v4, v4, 0x1

    .line 20
    .line 21
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-static {p2}, Ll/hs2;->f(Ljava/util/List;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    new-instance v0, Lcom/google/android/exoplayer2/upstream/c$a;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->b:Ll/hs2;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/hs2;->g(Ljava/util/List;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    sub-int p0, p1, p0

    .line 37
    .line 38
    invoke-direct {v0, p1, p0, v2, v4}, Lcom/google/android/exoplayer2/upstream/c$a;-><init>(IIII)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method public final l(JJ)J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/h4c;->d:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget-object v0, v0, v1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/dash/c$b;->h()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    cmp-long v0, v2, v4

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 24
    .line 25
    aget-object v0, v0, v1

    .line 26
    .line 27
    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c$b;->g(J)J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 32
    .line 33
    aget-object v0, v0, v1

    .line 34
    .line 35
    invoke-virtual {v0, v2, v3}, Lcom/google/android/exoplayer2/source/dash/c$b;->i(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/dash/c;->m(J)J

    .line 40
    .line 41
    .line 42
    move-result-wide p0

    .line 43
    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 44
    .line 45
    .line 46
    move-result-wide p0

    .line 47
    sub-long/2addr p0, p3

    .line 48
    invoke-static {v4, v5, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 49
    .line 50
    .line 51
    move-result-wide p0

    .line 52
    return-wide p0

    .line 53
    :cond_1
    :goto_0
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    return-wide p0
.end method

.method public final m(J)J
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 2
    .line 3
    iget-wide v1, v0, Ll/h4c;->a:J

    .line 4
    .line 5
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long v5, v1, v3

    .line 11
    .line 12
    if-nez v5, :cond_0

    .line 13
    .line 14
    return-wide v3

    .line 15
    :cond_0
    iget p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->l:I

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/h4c;->d(I)Ll/mr60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-wide v3, p0, Ll/mr60;->b:J

    .line 22
    .line 23
    add-long/2addr v1, v3

    .line 24
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    sub-long/2addr p1, v0

    .line 29
    return-wide p1
.end method

.method public final n()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/t1d0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->k:Ll/h4c;

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/exoplayer2/source/dash/c;->l:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/h4c;->d(I)Ll/mr60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/mr60;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->c:[I

    .line 17
    .line 18
    array-length v2, p0

    .line 19
    const/4 v3, 0x0

    .line 20
    :goto_0
    if-ge v3, v2, :cond_0

    .line 21
    .line 22
    aget v4, p0, v3

    .line 23
    .line 24
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    check-cast v4, Ll/y70;

    .line 29
    .line 30
    iget-object v4, v4, Ll/y70;->c:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    add-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-object v1
.end method

.method public final o(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/crx;JJJ)J
    .locals 0
    .param p2    # Ll/crx;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/crx;->g()J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0

    .line 8
    :cond_0
    invoke-virtual {p1, p3, p4}, Lcom/google/android/exoplayer2/source/dash/c$b;->j(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide p2

    .line 12
    move-wide p4, p5

    .line 13
    move-wide p6, p7

    .line 14
    invoke-static/range {p2 .. p7}, Ll/bmk0;->r(JJJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide p0

    .line 18
    return-wide p0
.end method

.method public p(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/g6c;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;Ll/mkc0;Ll/mkc0;Ll/ac5;)Ll/o45;
    .locals 11
    .param p5    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/mkc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/mkc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/ac5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 p0, p6

    .line 2
    .line 3
    iget-object v0, p1, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object v1, p1, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 8
    .line 9
    iget-object v1, v1, Ll/fs2;->a:Ljava/lang/String;

    .line 10
    .line 11
    move-object/from16 v2, p7

    .line 12
    .line 13
    invoke-virtual {p0, v2, v1}, Ll/mkc0;->a(Ll/mkc0;Ljava/lang/String;)Ll/mkc0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object p0, v1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move-object/from16 v2, p7

    .line 23
    .line 24
    move-object p0, v2

    .line 25
    :goto_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v2, p1, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 30
    .line 31
    iget-object v2, v2, Ll/fs2;->a:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-static {v0, v2, p0, v3, v1}, Ll/m4c;->a(Ll/t1d0;Ljava/lang/String;Ll/mkc0;ILjava/util/Map;)Lcom/google/android/exoplayer2/upstream/a;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    new-instance v4, Ll/gum;

    .line 39
    .line 40
    iget-object v10, p1, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 41
    .line 42
    move-object v5, p2

    .line 43
    move-object v7, p3

    .line 44
    move v8, p4

    .line 45
    move-object/from16 v9, p5

    .line 46
    .line 47
    invoke-direct/range {v4 .. v10}, Ll/gum;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;Ll/p45;)V

    .line 48
    .line 49
    .line 50
    return-object v4
.end method

.method public q(Lcom/google/android/exoplayer2/source/dash/c$b;Ll/g6c;ILcom/google/android/exoplayer2/k;ILjava/lang/Object;JIJJLl/ac5;)Ll/o45;
    .locals 20
    .param p14    # Ll/ac5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-wide/from16 v10, p7

    .line 4
    .line 5
    move-wide/from16 v1, p12

    .line 6
    .line 7
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 8
    .line 9
    invoke-virtual {v0, v10, v11}, Lcom/google/android/exoplayer2/source/dash/c$b;->k(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v6

    .line 13
    invoke-virtual {v0, v10, v11}, Lcom/google/android/exoplayer2/source/dash/c$b;->l(J)Ll/mkc0;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 18
    .line 19
    const/16 v8, 0x8

    .line 20
    .line 21
    const/4 v9, 0x0

    .line 22
    if-nez v5, :cond_1

    .line 23
    .line 24
    move v5, v8

    .line 25
    move v12, v9

    .line 26
    invoke-virtual {v0, v10, v11}, Lcom/google/android/exoplayer2/source/dash/c$b;->i(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    invoke-virtual {v0, v10, v11, v1, v2}, Lcom/google/android/exoplayer2/source/dash/c$b;->m(JJ)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    move v5, v12

    .line 37
    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 42
    .line 43
    iget-object v0, v0, Ll/fs2;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v3, v0, v4, v5, v1}, Ll/m4c;->a(Ll/t1d0;Ljava/lang/String;Ll/mkc0;ILjava/util/Map;)Lcom/google/android/exoplayer2/upstream/a;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    new-instance v0, Ll/mqf0;

    .line 50
    .line 51
    move-object/from16 v13, p4

    .line 52
    .line 53
    move-object/from16 v1, p2

    .line 54
    .line 55
    move/from16 v12, p3

    .line 56
    .line 57
    move-object/from16 v3, p4

    .line 58
    .line 59
    move/from16 v4, p5

    .line 60
    .line 61
    move-object/from16 v5, p6

    .line 62
    .line 63
    invoke-direct/range {v0 .. v13}, Ll/mqf0;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJILcom/google/android/exoplayer2/k;)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :cond_1
    move v5, v8

    .line 68
    move v12, v9

    .line 69
    const/4 v8, 0x1

    .line 70
    move/from16 v10, p9

    .line 71
    .line 72
    move v9, v8

    .line 73
    :goto_0
    if-ge v8, v10, :cond_3

    .line 74
    .line 75
    int-to-long v13, v8

    .line 76
    add-long v13, p7, v13

    .line 77
    .line 78
    invoke-virtual {v0, v13, v14}, Lcom/google/android/exoplayer2/source/dash/c$b;->l(J)Ll/mkc0;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    iget-object v13, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 83
    .line 84
    iget-object v13, v13, Ll/fs2;->a:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v4, v11, v13}, Ll/mkc0;->a(Ll/mkc0;Ljava/lang/String;)Ll/mkc0;

    .line 87
    .line 88
    .line 89
    move-result-object v11

    .line 90
    if-nez v11, :cond_2

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    add-int/lit8 v9, v9, 0x1

    .line 94
    .line 95
    add-int/lit8 v8, v8, 0x1

    .line 96
    .line 97
    move-object v4, v11

    .line 98
    goto :goto_0

    .line 99
    :cond_3
    :goto_1
    int-to-long v10, v9

    .line 100
    add-long v10, p7, v10

    .line 101
    .line 102
    const-wide/16 v13, 0x1

    .line 103
    .line 104
    sub-long/2addr v10, v13

    .line 105
    move/from16 v16, v9

    .line 106
    .line 107
    invoke-virtual {v0, v10, v11}, Lcom/google/android/exoplayer2/source/dash/c$b;->i(J)J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/dash/c$b;->a(Lcom/google/android/exoplayer2/source/dash/c$b;)J

    .line 112
    .line 113
    .line 114
    move-result-wide v13

    .line 115
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    cmp-long v15, v13, v17

    .line 121
    .line 122
    if-eqz v15, :cond_4

    .line 123
    .line 124
    cmp-long v15, v13, v8

    .line 125
    .line 126
    if-gtz v15, :cond_4

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_4
    move-wide/from16 v13, v17

    .line 130
    .line 131
    :goto_2
    invoke-virtual {v0, v10, v11, v1, v2}, Lcom/google/android/exoplayer2/source/dash/c$b;->m(JJ)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_5

    .line 136
    .line 137
    move v5, v12

    .line 138
    :cond_5
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 143
    .line 144
    iget-object v2, v2, Ll/fs2;->a:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v3, v2, v4, v5, v1}, Ll/m4c;->a(Ll/t1d0;Ljava/lang/String;Ll/mkc0;ILjava/util/Map;)Lcom/google/android/exoplayer2/upstream/a;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    iget-wide v3, v3, Ll/t1d0;->d:J

    .line 151
    .line 152
    neg-long v3, v3

    .line 153
    new-instance v1, Ll/v16;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 156
    .line 157
    move-object/from16 v5, p6

    .line 158
    .line 159
    move-wide/from16 v10, p10

    .line 160
    .line 161
    move-object/from16 v19, v0

    .line 162
    .line 163
    move-object v0, v1

    .line 164
    move-wide/from16 v17, v3

    .line 165
    .line 166
    move-wide v12, v13

    .line 167
    move-object/from16 v1, p2

    .line 168
    .line 169
    move-object/from16 v3, p4

    .line 170
    .line 171
    move/from16 v4, p5

    .line 172
    .line 173
    move-wide/from16 v14, p7

    .line 174
    .line 175
    invoke-direct/range {v0 .. v19}, Ll/v16;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJJJIJLl/p45;)V

    .line 176
    .line 177
    .line 178
    return-object v0
.end method

.method public final r(I)Lcom/google/android/exoplayer2/source/dash/c$b;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/dash/c;->b:Ll/hs2;

    .line 6
    .line 7
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->b:Ll/t1d0;

    .line 8
    .line 9
    iget-object v2, v2, Ll/t1d0;->c:Lcom/google/common/collect/ImmutableList;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/hs2;->j(Ljava/util/List;)Ll/fs2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/dash/c$b;->c:Ll/fs2;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ll/fs2;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/dash/c$b;->d(Ll/fs2;)Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 30
    .line 31
    aput-object v0, p0, p1

    .line 32
    .line 33
    :cond_0
    return-object v0
.end method

.method public release()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/dash/c;->i:[Lcom/google/android/exoplayer2/source/dash/c$b;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    iget-object v2, v2, Lcom/google/android/exoplayer2/source/dash/c$b;->a:Ll/p45;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-interface {v2}, Ll/p45;->release()V

    .line 14
    .line 15
    .line 16
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return-void
.end method
