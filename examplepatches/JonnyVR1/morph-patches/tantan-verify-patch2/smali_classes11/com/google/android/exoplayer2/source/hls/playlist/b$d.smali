.class public final Lcom/google/android/exoplayer2/source/hls/playlist/b$d;
.super Lcom/google/android/exoplayer2/source/hls/playlist/b$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/hls/playlist/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public final l:Ljava/lang/String;

.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;)V
    .locals 18
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/16 v16, 0x0

    .line 41
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v17

    const/4 v2, 0x0

    .line 42
    const-string v3, ""

    const-wide/16 v4, 0x0

    const/4 v6, -0x1

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v12, p2

    move-wide/from16 v14, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v0 .. v17}, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/source/hls/playlist/b$d;Ljava/lang/String;JIJLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/source/hls/playlist/b$d;Ljava/lang/String;JIJLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLjava/util/List;)V
    .locals 17
    .param p2    # Lcom/google/android/exoplayer2/source/hls/playlist/b$d;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$d;",
            "Ljava/lang/String;",
            "JIJ",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJZ",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v16, 0x0

    .line 2
    .line 3
    move-object/from16 v0, p0

    .line 4
    .line 5
    move-object/from16 v1, p1

    .line 6
    .line 7
    move-object/from16 v2, p2

    .line 8
    .line 9
    move-wide/from16 v3, p4

    .line 10
    .line 11
    move/from16 v5, p6

    .line 12
    .line 13
    move-wide/from16 v6, p7

    .line 14
    .line 15
    move-object/from16 v8, p9

    .line 16
    .line 17
    move-object/from16 v9, p10

    .line 18
    .line 19
    move-object/from16 v10, p11

    .line 20
    .line 21
    move-wide/from16 v11, p12

    .line 22
    .line 23
    move-wide/from16 v13, p14

    .line 24
    .line 25
    move/from16 v15, p16

    .line 26
    .line 27
    invoke-direct/range {v0 .. v16}, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/source/hls/playlist/b$d;JIJLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLcom/google/android/exoplayer2/source/hls/playlist/b$a;)V

    .line 28
    .line 29
    .line 30
    move-object/from16 v1, p3

    .line 31
    .line 32
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->l:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static/range {p17 .. p17}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public b(JI)Lcom/google/android/exoplayer2/source/hls/playlist/b$d;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    move-wide/from16 v3, p1

    .line 10
    .line 11
    :goto_0
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    if-ge v2, v5, :cond_0

    .line 18
    .line 19
    iget-object v5, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->m:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    check-cast v5, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 26
    .line 27
    move/from16 v6, p3

    .line 28
    .line 29
    invoke-virtual {v5, v3, v4, v6}, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;->b(JI)Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-wide v7, v5, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    .line 37
    .line 38
    add-long/2addr v3, v7

    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move/from16 v6, p3

    .line 43
    .line 44
    new-instance v2, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 45
    .line 46
    move-object/from16 v17, v1

    .line 47
    .line 48
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->a:Ljava/lang/String;

    .line 49
    .line 50
    move-object v3, v2

    .line 51
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->b:Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    .line 52
    .line 53
    move-object v4, v3

    .line 54
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;->l:Ljava/lang/String;

    .line 55
    .line 56
    move-object v7, v4

    .line 57
    iget-wide v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    .line 58
    .line 59
    iget-object v9, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->f:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 60
    .line 61
    iget-object v10, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->g:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v11, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->h:Ljava/lang/String;

    .line 64
    .line 65
    iget-wide v12, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->i:J

    .line 66
    .line 67
    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->j:J

    .line 68
    .line 69
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->k:Z

    .line 70
    .line 71
    move/from16 v16, v0

    .line 72
    .line 73
    move-object v0, v7

    .line 74
    move-wide/from16 v7, p1

    .line 75
    .line 76
    invoke-direct/range {v0 .. v17}, Lcom/google/android/exoplayer2/source/hls/playlist/b$d;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/source/hls/playlist/b$d;Ljava/lang/String;JIJLcom/google/android/exoplayer2/drm/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLjava/util/List;)V

    .line 77
    .line 78
    .line 79
    return-object v0
.end method
