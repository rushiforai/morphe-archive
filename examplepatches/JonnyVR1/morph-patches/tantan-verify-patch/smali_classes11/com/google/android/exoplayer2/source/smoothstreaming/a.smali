.class public Lcom/google/android/exoplayer2/source/smoothstreaming/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/smoothstreaming/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/smoothstreaming/a$b;,
        Lcom/google/android/exoplayer2/source/smoothstreaming/a$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/vtv;

.field public final b:I

.field public final c:[Ll/p45;

.field public final d:Ll/g6c;

.field public e:Ll/u9f;

.field public f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

.field public g:I

.field public h:Ljava/io/IOException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/vtv;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;ILl/u9f;Ll/g6c;Ll/zb5;)V
    .locals 23
    .param p6    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    move-object/from16 v4, p1

    .line 13
    .line 14
    iput-object v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->a:Ll/vtv;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 17
    .line 18
    iput v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->b:I

    .line 19
    .line 20
    iput-object v3, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 21
    .line 22
    move-object/from16 v4, p5

    .line 23
    .line 24
    iput-object v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->d:Ll/g6c;

    .line 25
    .line 26
    iget-object v4, v1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 27
    .line 28
    aget-object v2, v4, v2

    .line 29
    .line 30
    invoke-interface {v3}, Ll/vfj0;->length()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    new-array v4, v4, [Ll/p45;

    .line 35
    .line 36
    iput-object v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->c:[Ll/p45;

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    move v5, v4

    .line 40
    :goto_0
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->c:[Ll/p45;

    .line 41
    .line 42
    array-length v6, v6

    .line 43
    if-ge v5, v6, :cond_2

    .line 44
    .line 45
    invoke-interface {v3, v5}, Ll/vfj0;->c(I)I

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    iget-object v6, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->j:[Lcom/google/android/exoplayer2/k;

    .line 50
    .line 51
    aget-object v6, v6, v8

    .line 52
    .line 53
    iget-object v7, v6, Lcom/google/android/exoplayer2/k;->o:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 54
    .line 55
    const/4 v9, 0x0

    .line 56
    if-eqz v7, :cond_0

    .line 57
    .line 58
    iget-object v7, v1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->e:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$a;

    .line 59
    .line 60
    invoke-static {v7}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    check-cast v7, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$a;

    .line 65
    .line 66
    iget-object v7, v7, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$a;->c:[Ll/zej0;

    .line 67
    .line 68
    move-object/from16 v18, v7

    .line 69
    .line 70
    move-object v7, v9

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    move-object v7, v9

    .line 73
    move-object/from16 v18, v7

    .line 74
    .line 75
    :goto_1
    iget v9, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->a:I

    .line 76
    .line 77
    const/4 v10, 0x2

    .line 78
    if-ne v9, v10, :cond_1

    .line 79
    .line 80
    const/4 v10, 0x4

    .line 81
    move/from16 v19, v10

    .line 82
    .line 83
    :goto_2
    move-object v10, v7

    .line 84
    goto :goto_3

    .line 85
    :cond_1
    move/from16 v19, v4

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :goto_3
    new-instance v7, Ll/yej0;

    .line 89
    .line 90
    move-object v12, v10

    .line 91
    iget-wide v10, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->c:J

    .line 92
    .line 93
    iget-wide v14, v1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->g:J

    .line 94
    .line 95
    const/16 v20, 0x0

    .line 96
    .line 97
    const/16 v21, 0x0

    .line 98
    .line 99
    move-object/from16 v16, v12

    .line 100
    .line 101
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    const/16 v17, 0x0

    .line 107
    .line 108
    move-object/from16 v22, v16

    .line 109
    .line 110
    move-object/from16 v16, v6

    .line 111
    .line 112
    move-object/from16 v6, v22

    .line 113
    .line 114
    invoke-direct/range {v7 .. v21}, Ll/yej0;-><init>(IIJJJLcom/google/android/exoplayer2/k;I[Ll/zej0;I[J[J)V

    .line 115
    .line 116
    .line 117
    move-object v8, v7

    .line 118
    move-object/from16 v7, v16

    .line 119
    .line 120
    new-instance v9, Ll/d6j;

    .line 121
    .line 122
    const/4 v10, 0x3

    .line 123
    invoke-direct {v9, v10, v6, v8}, Ll/d6j;-><init>(ILl/h0j0;Ll/yej0;)V

    .line 124
    .line 125
    .line 126
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->c:[Ll/p45;

    .line 127
    .line 128
    new-instance v8, Ll/ej3;

    .line 129
    .line 130
    iget v10, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->a:I

    .line 131
    .line 132
    invoke-direct {v8, v9, v10, v7}, Ll/ej3;-><init>(Ll/zrf;ILcom/google/android/exoplayer2/k;)V

    .line 133
    .line 134
    .line 135
    aput-object v8, v6, v5

    .line 136
    .line 137
    add-int/lit8 v5, v5, 0x1

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_2
    return-void
.end method

.method public static k(Lcom/google/android/exoplayer2/k;Ll/g6c;Landroid/net/Uri;IJJJILjava/lang/Object;Ll/p45;Ll/ac5;)Ll/crx;
    .locals 21
    .param p11    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Ll/ac5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/google/android/exoplayer2/upstream/a$b;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    .line 8
    .line 9
    .line 10
    move-object/from16 v2, p2

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/upstream/a$b;->e(Ljava/util/Map;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    new-instance v1, Ll/v16;

    .line 25
    .line 26
    move/from16 v0, p3

    .line 27
    .line 28
    int-to-long v4, v0

    .line 29
    const/16 v17, 0x1

    .line 30
    .line 31
    const-wide v13, -0x7fffffffffffffffL    # -4.9E-324

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    move-wide/from16 v18, p4

    .line 37
    .line 38
    move-object/from16 v2, p1

    .line 39
    .line 40
    move-wide/from16 v7, p4

    .line 41
    .line 42
    move-wide/from16 v9, p6

    .line 43
    .line 44
    move-wide/from16 v11, p8

    .line 45
    .line 46
    move-object/from16 v6, p11

    .line 47
    .line 48
    move-object/from16 v20, p12

    .line 49
    .line 50
    move-wide v15, v4

    .line 51
    move-object/from16 v4, p0

    .line 52
    .line 53
    move/from16 v5, p10

    .line 54
    .line 55
    invoke-direct/range {v1 .. v20}, Ll/v16;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJJJIJLl/p45;)V

    .line 56
    .line 57
    .line 58
    return-object v1
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
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->h:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->a:Ll/vtv;

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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

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
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->h:Ljava/io/IOException;

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
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

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
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->h:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

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
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bgj0;->c(Ll/u9f;)Lcom/google/android/exoplayer2/upstream/c$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p4, v0, p3}, Lcom/google/android/exoplayer2/upstream/c;->b(Lcom/google/android/exoplayer2/upstream/c$a;Lcom/google/android/exoplayer2/upstream/c$c;)Lcom/google/android/exoplayer2/upstream/c$b;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget p2, p3, Lcom/google/android/exoplayer2/upstream/c$b;->a:I

    .line 16
    .line 17
    const/4 p4, 0x2

    .line 18
    if-ne p2, p4, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 21
    .line 22
    iget-object p1, p1, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/vfj0;->r(Lcom/google/android/exoplayer2/k;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-wide p2, p3, Lcom/google/android/exoplayer2/upstream/c$b;->b:J

    .line 29
    .line 30
    invoke-interface {p0, p1, p2, p3}, Ll/u9f;->d(IJ)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public f(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 4
    .line 5
    iget v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->b:I

    .line 6
    .line 7
    aget-object v0, v0, v1

    .line 8
    .line 9
    iget v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 10
    .line 11
    iget-object v3, p1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 12
    .line 13
    aget-object v1, v3, v1

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    iget v3, v1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 18
    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    add-int/lit8 v3, v2, -0x1

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->c(I)J

    .line 29
    .line 30
    .line 31
    move-result-wide v6

    .line 32
    add-long/2addr v4, v6

    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v1, v3}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 35
    .line 36
    .line 37
    move-result-wide v6

    .line 38
    cmp-long v1, v4, v6

    .line 39
    .line 40
    iget v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 41
    .line 42
    if-gtz v1, :cond_1

    .line 43
    .line 44
    add-int/2addr v3, v2

    .line 45
    iput v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {v0, v6, v7}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->d(J)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/2addr v3, v0

    .line 53
    iput v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 57
    .line 58
    add-int/2addr v0, v2

    .line 59
    iput v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 60
    .line 61
    :goto_1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 62
    .line 63
    return-void
.end method

.method public g(JLl/nke0;)J
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 4
    .line 5
    iget p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->b:I

    .line 6
    .line 7
    aget-object p0, v0, p0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->d(J)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    cmp-long v1, v4, p1

    .line 18
    .line 19
    if-gez v1, :cond_0

    .line 20
    .line 21
    iget v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 22
    .line 23
    add-int/lit8 v1, v1, -0x1

    .line 24
    .line 25
    if-ge v0, v1, :cond_0

    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    move-wide v6, v0

    .line 34
    :goto_0
    move-wide v2, p1

    .line 35
    move-object v1, p3

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    move-wide v6, v4

    .line 38
    goto :goto_0

    .line 39
    :goto_1
    invoke-virtual/range {v1 .. v7}, Ll/nke0;->a(JJJ)J

    .line 40
    .line 41
    .line 42
    move-result-wide p0

    .line 43
    return-wide p0
.end method

.method public final h(JJLjava/util/List;Ll/q45;)V
    .locals 20
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
    move-wide/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v3, p6

    .line 6
    .line 7
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->h:Ljava/io/IOException;

    .line 8
    .line 9
    if-eqz v4, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 13
    .line 14
    iget-object v5, v4, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 15
    .line 16
    iget v6, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->b:I

    .line 17
    .line 18
    aget-object v5, v5, v6

    .line 19
    .line 20
    iget v6, v5, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 21
    .line 22
    if-nez v6, :cond_1

    .line 23
    .line 24
    iget-boolean v0, v4, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 25
    .line 26
    xor-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    iput-boolean v0, v3, Ll/q45;->b:Z

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_2

    .line 36
    .line 37
    invoke-virtual {v5, v1, v2}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->d(J)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    move-object/from16 v13, p5

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    add-int/lit8 v4, v4, -0x1

    .line 49
    .line 50
    move-object/from16 v13, p5

    .line 51
    .line 52
    invoke-interface {v13, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Ll/crx;

    .line 57
    .line 58
    invoke-virtual {v4}, Ll/crx;->g()J

    .line 59
    .line 60
    .line 61
    move-result-wide v6

    .line 62
    iget v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 63
    .line 64
    int-to-long v8, v4

    .line 65
    sub-long/2addr v6, v8

    .line 66
    long-to-int v4, v6

    .line 67
    if-gez v4, :cond_3

    .line 68
    .line 69
    new-instance v1, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;

    .line 70
    .line 71
    invoke-direct {v1}, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->h:Ljava/io/IOException;

    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    :goto_0
    iget v6, v5, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 78
    .line 79
    if-lt v4, v6, :cond_4

    .line 80
    .line 81
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 82
    .line 83
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 84
    .line 85
    xor-int/lit8 v0, v0, 0x1

    .line 86
    .line 87
    iput-boolean v0, v3, Ll/q45;->b:Z

    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    sub-long v9, v1, p1

    .line 91
    .line 92
    invoke-virtual/range {p0 .. p2}, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->l(J)J

    .line 93
    .line 94
    .line 95
    move-result-wide v11

    .line 96
    iget-object v6, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 97
    .line 98
    invoke-interface {v6}, Ll/vfj0;->length()I

    .line 99
    .line 100
    .line 101
    move-result v15

    .line 102
    new-array v14, v15, [Ll/drx;

    .line 103
    .line 104
    const/4 v6, 0x0

    .line 105
    :goto_1
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 106
    .line 107
    if-ge v6, v15, :cond_5

    .line 108
    .line 109
    invoke-interface {v7, v6}, Ll/vfj0;->c(I)I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    new-instance v8, Lcom/google/android/exoplayer2/source/smoothstreaming/a$b;

    .line 114
    .line 115
    invoke-direct {v8, v5, v7, v4}, Lcom/google/android/exoplayer2/source/smoothstreaming/a$b;-><init>(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;II)V

    .line 116
    .line 117
    .line 118
    aput-object v8, v14, v6

    .line 119
    .line 120
    add-int/lit8 v6, v6, 0x1

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_5
    move-object v6, v7

    .line 124
    move-wide/from16 v7, p1

    .line 125
    .line 126
    invoke-interface/range {v6 .. v14}, Ll/u9f;->g(JJJLjava/util/List;[Ll/drx;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v4}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 130
    .line 131
    .line 132
    move-result-wide v10

    .line 133
    invoke-virtual {v5, v4}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->c(I)J

    .line 134
    .line 135
    .line 136
    move-result-wide v6

    .line 137
    add-long v12, v10, v6

    .line 138
    .line 139
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->isEmpty()Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-eqz v6, :cond_6

    .line 144
    .line 145
    :goto_2
    move-wide v14, v1

    .line 146
    goto :goto_3

    .line 147
    :cond_6
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :goto_3
    iget v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->g:I

    .line 154
    .line 155
    add-int v9, v4, v1

    .line 156
    .line 157
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 158
    .line 159
    invoke-interface {v1}, Ll/u9f;->b()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->c:[Ll/p45;

    .line 164
    .line 165
    aget-object v18, v2, v1

    .line 166
    .line 167
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 168
    .line 169
    invoke-interface {v2, v1}, Ll/vfj0;->c(I)I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-virtual {v5, v1, v4}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->a(II)Landroid/net/Uri;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 178
    .line 179
    invoke-interface {v1}, Ll/u9f;->k()Lcom/google/android/exoplayer2/k;

    .line 180
    .line 181
    .line 182
    move-result-object v6

    .line 183
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->d:Ll/g6c;

    .line 184
    .line 185
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 186
    .line 187
    invoke-interface {v1}, Ll/u9f;->s()I

    .line 188
    .line 189
    .line 190
    move-result v16

    .line 191
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->e:Ll/u9f;

    .line 192
    .line 193
    invoke-interface {v0}, Ll/u9f;->o()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v17

    .line 197
    const/16 v19, 0x0

    .line 198
    .line 199
    invoke-static/range {v6 .. v19}, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->k(Lcom/google/android/exoplayer2/k;Ll/g6c;Landroid/net/Uri;IJJJILjava/lang/Object;Ll/p45;Ll/ac5;)Ll/crx;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    iput-object v0, v3, Ll/q45;->a:Ll/o45;

    .line 204
    .line 205
    return-void
.end method

.method public j(Ll/o45;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final l(J)J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-wide p0, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    return-wide p0

    .line 13
    :cond_0
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 14
    .line 15
    iget p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->b:I

    .line 16
    .line 17
    aget-object p0, v0, p0

    .line 18
    .line 19
    iget v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->c(I)J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    add-long/2addr v1, v3

    .line 32
    sub-long/2addr v1, p1

    .line 33
    return-wide v1
.end method

.method public release()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/a;->c:[Ll/p45;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-interface {v2}, Ll/p45;->release()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method
