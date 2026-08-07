.class public final Lcom/google/android/exoplayer2/source/hls/playlist/b;
.super Ll/m5l;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/hls/playlist/b$b;,
        Lcom/google/android/exoplayer2/source/hls/playlist/b$d;,
        Lcom/google/android/exoplayer2/source/hls/playlist/b$f;,
        Lcom/google/android/exoplayer2/source/hls/playlist/b$c;,
        Lcom/google/android/exoplayer2/source/hls/playlist/b$e;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final d:I

.field public final e:J

.field public final f:Z

.field public final g:Z

.field public final h:J

.field public final i:Z

.field public final j:I

.field public final k:J

.field public final l:I

.field public final m:J

.field public final n:J

.field public final o:Z

.field public final p:Z

.field public final q:Lcom/google/android/exoplayer2/drm/DrmInitData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$d;",
            ">;"
        }
    .end annotation
.end field

.field public final s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$b;",
            ">;"
        }
    .end annotation
.end field

.field public final t:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$c;",
            ">;"
        }
    .end annotation
.end field

.field public final u:J

.field public final v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/util/List;JZJZIJIJJZZZLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/util/List;Ljava/util/List;Lcom/google/android/exoplayer2/source/hls/playlist/b$f;Ljava/util/Map;)V
    .locals 4
    .param p21    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;JZJZIJIJJZZZ",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$d;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$b;",
            ">;",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$f;",
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$c;",
            ">;)V"
        }
    .end annotation

    move/from16 v0, p18

    .line 1
    invoke-direct {p0, p2, p3, v0}, Ll/m5l;-><init>(Ljava/lang/String;Ljava/util/List;Z)V

    .line 2
    iput p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->d:I

    .line 3
    iput-wide p7, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 4
    iput-boolean p6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->g:Z

    .line 5
    iput-boolean p9, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->i:Z

    .line 6
    iput p10, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->j:I

    move-wide p1, p11

    .line 7
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    move/from16 p1, p13

    .line 8
    iput p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->l:I

    move-wide/from16 p1, p14

    .line 9
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->m:J

    move-wide/from16 p1, p16

    .line 10
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->n:J

    move/from16 p1, p19

    .line 11
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    move/from16 p1, p20

    .line 12
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->p:Z

    move-object/from16 p1, p21

    .line 13
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->q:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 14
    invoke-static/range {p22 .. p22}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 15
    invoke-static/range {p23 .. p23}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 16
    invoke-static/range {p25 .. p25}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->t:Ljava/util/Map;

    .line 17
    invoke-interface/range {p23 .. p23}, Ljava/util/List;->isEmpty()Z

    move-result p1

    const-wide/16 p2, 0x0

    if-nez p1, :cond_0

    .line 18
    invoke-static/range {p23 .. p23}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 19
    iget-wide v0, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    iget-wide v2, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    goto :goto_0

    .line 20
    :cond_0
    invoke-interface/range {p22 .. p22}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    .line 21
    invoke-static/range {p22 .. p22}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 22
    iget-wide v0, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    iget-wide v2, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    goto :goto_0

    .line 23
    :cond_1
    iput-wide p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    :goto_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long p1, p4, v0

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    cmp-long p1, p4, p2

    .line 24
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    if-ltz p1, :cond_3

    .line 25
    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    goto :goto_1

    :cond_3
    add-long/2addr v0, p4

    .line 26
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :goto_1
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->e:J

    cmp-long p1, p4, p2

    if-ltz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    .line 27
    :goto_2
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->f:Z

    move-object/from16 p1, p24

    .line 28
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/b;->b(Ljava/util/List;)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ljava/util/List;)Lcom/google/android/exoplayer2/source/hls/playlist/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/offline/StreamKey;",
            ">;)",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b;"
        }
    .end annotation

    .line 1
    return-object p0
.end method

.method public c(JI)Lcom/google/android/exoplayer2/source/hls/playlist/b;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->d:I

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/m5l;->a:Ljava/lang/String;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, v0, Ll/m5l;->b:Ljava/util/List;

    .line 13
    .line 14
    move-object v6, v4

    .line 15
    iget-wide v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->e:J

    .line 16
    .line 17
    move-object v7, v6

    .line 18
    iget-boolean v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->g:Z

    .line 19
    .line 20
    iget-wide v11, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 21
    .line 22
    iget v13, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->l:I

    .line 23
    .line 24
    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->m:J

    .line 25
    .line 26
    iget-wide v8, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->n:J

    .line 27
    .line 28
    iget-boolean v10, v0, Ll/m5l;->c:Z

    .line 29
    .line 30
    move/from16 v16, v1

    .line 31
    .line 32
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 33
    .line 34
    move/from16 v19, v1

    .line 35
    .line 36
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->p:Z

    .line 37
    .line 38
    move/from16 v20, v1

    .line 39
    .line 40
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->q:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 41
    .line 42
    move-object/from16 v21, v1

    .line 43
    .line 44
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 45
    .line 46
    move-object/from16 v22, v1

    .line 47
    .line 48
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 49
    .line 50
    move-object/from16 v23, v1

    .line 51
    .line 52
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->t:Ljava/util/Map;

    .line 55
    .line 56
    move-object/from16 v24, v1

    .line 57
    .line 58
    move/from16 v1, v16

    .line 59
    .line 60
    move-wide/from16 v16, v8

    .line 61
    .line 62
    const/4 v9, 0x1

    .line 63
    move-object/from16 v25, v0

    .line 64
    .line 65
    move-object v0, v7

    .line 66
    move/from16 v18, v10

    .line 67
    .line 68
    move-wide/from16 v7, p1

    .line 69
    .line 70
    move/from16 v10, p3

    .line 71
    .line 72
    invoke-direct/range {v0 .. v25}, Lcom/google/android/exoplayer2/source/hls/playlist/b;-><init>(ILjava/lang/String;Ljava/util/List;JZJZIJIJJZZZLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/util/List;Ljava/util/List;Lcom/google/android/exoplayer2/source/hls/playlist/b$f;Ljava/util/Map;)V

    .line 73
    .line 74
    .line 75
    return-object v0
.end method

.method public d()Lcom/google/android/exoplayer2/source/hls/playlist/b;
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    new-instance v2, Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 9
    .line 10
    iget v3, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->d:I

    .line 11
    .line 12
    iget-object v4, v0, Ll/m5l;->a:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v5, v0, Ll/m5l;->b:Ljava/util/List;

    .line 15
    .line 16
    iget-wide v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->e:J

    .line 17
    .line 18
    iget-boolean v8, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->g:Z

    .line 19
    .line 20
    iget-wide v9, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 21
    .line 22
    iget-boolean v11, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->i:Z

    .line 23
    .line 24
    iget v12, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->j:I

    .line 25
    .line 26
    iget-wide v13, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 27
    .line 28
    iget v15, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->l:I

    .line 29
    .line 30
    move-object/from16 v16, v2

    .line 31
    .line 32
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->m:J

    .line 33
    .line 34
    move-wide/from16 v17, v1

    .line 35
    .line 36
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->n:J

    .line 37
    .line 38
    move-wide/from16 v19, v1

    .line 39
    .line 40
    iget-boolean v1, v0, Ll/m5l;->c:Z

    .line 41
    .line 42
    iget-boolean v2, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->p:Z

    .line 43
    .line 44
    move/from16 v21, v1

    .line 45
    .line 46
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->q:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 47
    .line 48
    move-object/from16 v23, v1

    .line 49
    .line 50
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 51
    .line 52
    move-object/from16 v24, v1

    .line 53
    .line 54
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 55
    .line 56
    move-object/from16 v25, v1

    .line 57
    .line 58
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->t:Ljava/util/Map;

    .line 61
    .line 62
    move/from16 v22, v2

    .line 63
    .line 64
    move-object/from16 v2, v16

    .line 65
    .line 66
    move-wide/from16 v16, v17

    .line 67
    .line 68
    move-wide/from16 v18, v19

    .line 69
    .line 70
    move/from16 v20, v21

    .line 71
    .line 72
    const/16 v21, 0x1

    .line 73
    .line 74
    move-object/from16 v27, v0

    .line 75
    .line 76
    move-object/from16 v26, v1

    .line 77
    .line 78
    invoke-direct/range {v2 .. v27}, Lcom/google/android/exoplayer2/source/hls/playlist/b;-><init>(ILjava/lang/String;Ljava/util/List;JZJZIJIJJZZZLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/util/List;Ljava/util/List;Lcom/google/android/exoplayer2/source/hls/playlist/b$f;Ljava/util/Map;)V

    .line 79
    .line 80
    .line 81
    return-object v2
.end method

.method public e()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->h:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public f(Lcom/google/android/exoplayer2/source/hls/playlist/b;)Z
    .locals 6
    .param p1    # Lcom/google/android/exoplayer2/source/hls/playlist/b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 5
    .line 6
    iget-wide v3, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 7
    .line 8
    cmp-long v5, v1, v3

    .line 9
    .line 10
    if-lez v5, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    cmp-long v1, v1, v3

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-gez v1, :cond_1

    .line 17
    .line 18
    return v2

    .line 19
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v3, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    sub-int/2addr v1, v3

    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    if-lez v1, :cond_2

    .line 35
    .line 36
    return v0

    .line 37
    :cond_2
    return v2

    .line 38
    :cond_3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v3, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-gt v1, v3, :cond_5

    .line 51
    .line 52
    if-ne v1, v3, :cond_4

    .line 53
    .line 54
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 55
    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    iget-boolean p0, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 59
    .line 60
    if-nez p0, :cond_4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    return v2

    .line 64
    :cond_5
    :goto_0
    return v0
.end method
