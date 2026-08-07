.class public final Ll/j5l;
.super Ll/crx;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final N:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field public final A:Z

.field public final B:Z

.field public final C:Ll/bf80;

.field public final D:J

.field public E:Ll/k5l;

.field public F:Ll/s5l;

.field public G:I

.field public H:Z

.field public volatile I:Z

.field public J:Z

.field public K:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public L:Z

.field public M:Z

.field public final k:I

.field public final l:I

.field public final m:Landroid/net/Uri;

.field public final n:Z

.field public final o:I

.field public final p:Ll/g6c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final q:Lcom/google/android/exoplayer2/upstream/a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final r:Ll/k5l;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final s:Z

.field public final t:Z

.field public final u:Ll/h0j0;

.field public final v:Ll/h5l;

.field public final w:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field

.field public final x:Lcom/google/android/exoplayer2/drm/DrmInitData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final y:Ll/kdm;

.field public final z:Ll/ig60;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j5l;->N:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/h5l;Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ZLl/g6c;Lcom/google/android/exoplayer2/upstream/a;ZLandroid/net/Uri;Ljava/util/List;ILjava/lang/Object;JJJIZIZZLl/h0j0;JLcom/google/android/exoplayer2/drm/DrmInitData;Ll/k5l;Ll/kdm;Ll/ig60;ZLl/bf80;)V
    .locals 13
    .param p6    # Ll/g6c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/google/android/exoplayer2/upstream/a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p27    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p28    # Ll/k5l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h5l;",
            "Ll/g6c;",
            "Lcom/google/android/exoplayer2/upstream/a;",
            "Lcom/google/android/exoplayer2/k;",
            "Z",
            "Ll/g6c;",
            "Lcom/google/android/exoplayer2/upstream/a;",
            "Z",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;I",
            "Ljava/lang/Object;",
            "JJJIZIZZ",
            "Ll/h0j0;",
            "J",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;",
            "Ll/k5l;",
            "Ll/kdm;",
            "Ll/ig60;",
            "Z",
            "Ll/bf80;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p7

    move-object v1, p0

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p11

    move-object/from16 v6, p12

    move-wide/from16 v7, p13

    move-wide/from16 v9, p15

    move-wide/from16 v11, p17

    .line 1
    invoke-direct/range {v1 .. v12}, Ll/crx;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ILjava/lang/Object;JJJ)V

    move/from16 p2, p5

    .line 2
    iput-boolean p2, p0, Ll/j5l;->A:Z

    move/from16 p2, p19

    .line 3
    iput p2, p0, Ll/j5l;->o:I

    move/from16 p2, p20

    .line 4
    iput-boolean p2, p0, Ll/j5l;->M:Z

    move/from16 p2, p21

    .line 5
    iput p2, p0, Ll/j5l;->l:I

    .line 6
    iput-object v0, p0, Ll/j5l;->q:Lcom/google/android/exoplayer2/upstream/a;

    move-object/from16 p2, p6

    .line 7
    iput-object p2, p0, Ll/j5l;->p:Ll/g6c;

    if-eqz v0, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 8
    :goto_0
    iput-boolean p2, p0, Ll/j5l;->H:Z

    move/from16 p2, p8

    .line 9
    iput-boolean p2, p0, Ll/j5l;->B:Z

    move-object/from16 p2, p9

    .line 10
    iput-object p2, p0, Ll/j5l;->m:Landroid/net/Uri;

    move/from16 p2, p23

    .line 11
    iput-boolean p2, p0, Ll/j5l;->s:Z

    move-object/from16 p2, p24

    .line 12
    iput-object p2, p0, Ll/j5l;->u:Ll/h0j0;

    move-wide/from16 v2, p25

    .line 13
    iput-wide v2, p0, Ll/j5l;->D:J

    move/from16 p2, p22

    .line 14
    iput-boolean p2, p0, Ll/j5l;->t:Z

    .line 15
    iput-object p1, p0, Ll/j5l;->v:Ll/h5l;

    move-object/from16 p1, p10

    .line 16
    iput-object p1, p0, Ll/j5l;->w:Ljava/util/List;

    move-object/from16 p1, p27

    .line 17
    iput-object p1, p0, Ll/j5l;->x:Lcom/google/android/exoplayer2/drm/DrmInitData;

    move-object/from16 p1, p28

    .line 18
    iput-object p1, p0, Ll/j5l;->r:Ll/k5l;

    move-object/from16 p1, p29

    .line 19
    iput-object p1, p0, Ll/j5l;->y:Ll/kdm;

    move-object/from16 p1, p30

    .line 20
    iput-object p1, p0, Ll/j5l;->z:Ll/ig60;

    move/from16 p1, p31

    .line 21
    iput-boolean p1, p0, Ll/j5l;->n:Z

    move-object/from16 p1, p32

    .line 22
    iput-object p1, p0, Ll/j5l;->C:Ll/bf80;

    .line 23
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Ll/j5l;->K:Lcom/google/common/collect/ImmutableList;

    .line 24
    sget-object p1, Ll/j5l;->N:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result p1

    iput p1, p0, Ll/j5l;->k:I

    return-void
.end method

.method public static i(Ll/g6c;[B[B)Ll/g6c;
    .locals 1
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/hb0;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1, p2}, Ll/hb0;-><init>(Ll/g6c;[B[B)V

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    return-object p0
.end method

.method public static j(Ll/h5l;Ll/g6c;Lcom/google/android/exoplayer2/k;JLcom/google/android/exoplayer2/source/hls/playlist/b;Ll/f5l$e;Landroid/net/Uri;Ljava/util/List;ILjava/lang/Object;ZLl/i0j0;JLl/j5l;[B[BZLl/bf80;Ll/ac5;)Ll/j5l;
    .locals 44
    .param p8    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ll/j5l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p16    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p20    # Ll/ac5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h5l;",
            "Ll/g6c;",
            "Lcom/google/android/exoplayer2/k;",
            "J",
            "Lcom/google/android/exoplayer2/source/hls/playlist/b;",
            "Ll/f5l$e;",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;I",
            "Ljava/lang/Object;",
            "Z",
            "Ll/i0j0;",
            "J",
            "Ll/j5l;",
            "[B[BZ",
            "Ll/bf80;",
            "Ll/ac5;",
            ")",
            "Ll/j5l;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    move-object/from16 v3, p15

    move-object/from16 v4, p16

    move-object/from16 v5, p17

    .line 1
    iget-object v6, v2, Ll/f5l$e;->a:Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 2
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v7

    .line 3
    new-instance v8, Lcom/google/android/exoplayer2/upstream/a$b;

    invoke-direct {v8}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    iget-object v9, v1, Ll/m5l;->a:Ljava/lang/String;

    iget-object v10, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->a:Ljava/lang/String;

    .line 4
    invoke-static {v9, v10}, Ll/h4k0;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v8

    iget-wide v9, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->i:J

    .line 5
    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer2/upstream/a$b;->h(J)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v8

    iget-wide v9, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->j:J

    .line 6
    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer2/upstream/a$b;->g(J)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v8

    .line 7
    iget-boolean v9, v2, Ll/f5l$e;->d:Z

    if-eqz v9, :cond_0

    const/16 v9, 0x8

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    :goto_0
    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer2/upstream/a$b;->b(I)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v8

    .line 8
    invoke-virtual {v8, v7}, Lcom/google/android/exoplayer2/upstream/a$b;->e(Ljava/util/Map;)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v7

    .line 9
    invoke-virtual {v7}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    move-result-object v14

    if-eqz v4, :cond_1

    const/16 v16, 0x1

    goto :goto_1

    :cond_1
    const/16 v16, 0x0

    :goto_1
    if-eqz v16, :cond_2

    .line 10
    iget-object v9, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->h:Ljava/lang/String;

    invoke-static {v9}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Ll/j5l;->l(Ljava/lang/String;)[B

    move-result-object v9

    goto :goto_2

    :cond_2
    const/4 v9, 0x0

    .line 11
    :goto_2
    invoke-static {v0, v4, v9}, Ll/j5l;->i(Ll/g6c;[B[B)Ll/g6c;

    move-result-object v13

    .line 12
    iget-object v4, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->b:Lcom/google/android/exoplayer2/source/hls/playlist/b$d;

    if-eqz v4, :cond_5

    if-eqz v5, :cond_3

    const/4 v9, 0x1

    goto :goto_3

    :cond_3
    const/4 v9, 0x0

    :goto_3
    if-eqz v9, :cond_4

    .line 13
    iget-object v11, v4, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->h:Ljava/lang/String;

    invoke-static {v11}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ll/j5l;->l(Ljava/lang/String;)[B

    move-result-object v11

    goto :goto_4

    :cond_4
    const/4 v11, 0x0

    .line 14
    :goto_4
    iget-object v12, v1, Ll/m5l;->a:Ljava/lang/String;

    iget-object v15, v4, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->a:Ljava/lang/String;

    invoke-static {v12, v15}, Ll/h4k0;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    .line 15
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v15

    const/16 p20, 0x1

    .line 16
    new-instance v7, Lcom/google/android/exoplayer2/upstream/a$b;

    invoke-direct {v7}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    .line 17
    invoke-virtual {v7, v12}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v7

    move/from16 p16, v9

    iget-wide v8, v4, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->i:J

    .line 18
    invoke-virtual {v7, v8, v9}, Lcom/google/android/exoplayer2/upstream/a$b;->h(J)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v7

    iget-wide v8, v4, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->j:J

    .line 19
    invoke-virtual {v7, v8, v9}, Lcom/google/android/exoplayer2/upstream/a$b;->g(J)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v4

    .line 20
    invoke-virtual {v4, v15}, Lcom/google/android/exoplayer2/upstream/a$b;->e(Ljava/util/Map;)Lcom/google/android/exoplayer2/upstream/a$b;

    move-result-object v4

    .line 21
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    move-result-object v4

    .line 22
    invoke-static {v0, v5, v11}, Ll/j5l;->i(Ll/g6c;[B[B)Ll/g6c;

    move-result-object v0

    move/from16 v19, p16

    move-object/from16 v17, v0

    goto :goto_5

    :cond_5
    const/16 p20, 0x1

    const/4 v4, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    .line 23
    :goto_5
    iget-wide v7, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    add-long v24, p3, v7

    .line 24
    iget-wide v7, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->c:J

    add-long v26, v24, v7

    .line 25
    iget v0, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->j:I

    iget v1, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->d:I

    add-int/2addr v0, v1

    if-eqz v3, :cond_a

    .line 26
    iget-object v1, v3, Ll/j5l;->q:Lcom/google/android/exoplayer2/upstream/a;

    if-eq v4, v1, :cond_7

    if-eqz v4, :cond_6

    if-eqz v1, :cond_6

    iget-object v5, v4, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    iget-object v1, v1, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 27
    invoke-virtual {v5, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-wide v7, v4, Lcom/google/android/exoplayer2/upstream/a;->g:J

    iget-object v1, v3, Ll/j5l;->q:Lcom/google/android/exoplayer2/upstream/a;

    iget-wide v10, v1, Lcom/google/android/exoplayer2/upstream/a;->g:J

    cmp-long v1, v7, v10

    if-nez v1, :cond_6

    goto :goto_6

    :cond_6
    const/4 v1, 0x0

    goto :goto_7

    :cond_7
    :goto_6
    move/from16 v1, p20

    .line 28
    :goto_7
    iget-object v7, v3, Ll/j5l;->m:Landroid/net/Uri;

    move-object/from16 v8, p7

    .line 29
    invoke-virtual {v8, v7}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    iget-boolean v7, v3, Ll/j5l;->J:Z

    if-eqz v7, :cond_8

    move/from16 v10, p20

    goto :goto_8

    :cond_8
    const/4 v10, 0x0

    .line 30
    :goto_8
    iget-object v5, v3, Ll/j5l;->y:Ll/kdm;

    .line 31
    iget-object v7, v3, Ll/j5l;->z:Ll/ig60;

    if-eqz v1, :cond_9

    if-eqz v10, :cond_9

    .line 32
    iget-boolean v1, v3, Ll/j5l;->L:Z

    if-nez v1, :cond_9

    iget v1, v3, Ll/j5l;->l:I

    if-ne v1, v0, :cond_9

    .line 33
    iget-object v1, v3, Ll/j5l;->E:Ll/k5l;

    move-object v12, v1

    goto :goto_9

    :cond_9
    const/4 v12, 0x0

    :goto_9
    move-object/from16 v39, v12

    :goto_a
    move-object/from16 v40, v5

    move-object/from16 v41, v7

    goto :goto_b

    :cond_a
    move-object/from16 v8, p7

    .line 34
    new-instance v5, Ll/kdm;

    invoke-direct {v5}, Ll/kdm;-><init>()V

    .line 35
    new-instance v7, Ll/ig60;

    const/16 v1, 0xa

    invoke-direct {v7, v1}, Ll/ig60;-><init>(I)V

    const/16 v39, 0x0

    goto :goto_a

    .line 36
    :goto_b
    new-instance v11, Ll/j5l;

    iget-wide v9, v2, Ll/f5l$e;->b:J

    iget v1, v2, Ll/f5l$e;->c:I

    iget-boolean v2, v2, Ll/f5l$e;->d:Z

    xor-int/lit8 v31, v2, 0x1

    iget-boolean v2, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->k:Z

    move-object/from16 v3, p12

    .line 37
    invoke-virtual {v3, v0}, Ll/i0j0;->a(I)Ll/h0j0;

    move-result-object v35

    iget-object v3, v6, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->f:Lcom/google/android/exoplayer2/drm/DrmInitData;

    move-object/from16 v12, p0

    move-object/from16 v15, p2

    move-object/from16 v21, p8

    move/from16 v22, p9

    move-object/from16 v23, p10

    move/from16 v34, p11

    move-wide/from16 v36, p13

    move/from16 v42, p18

    move-object/from16 v43, p19

    move/from16 v32, v0

    move/from16 v30, v1

    move/from16 v33, v2

    move-object/from16 v38, v3

    move-object/from16 v18, v4

    move-object/from16 v20, v8

    move-wide/from16 v28, v9

    invoke-direct/range {v11 .. v43}, Ll/j5l;-><init>(Ll/h5l;Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Lcom/google/android/exoplayer2/k;ZLl/g6c;Lcom/google/android/exoplayer2/upstream/a;ZLandroid/net/Uri;Ljava/util/List;ILjava/lang/Object;JJJIZIZZLl/h0j0;JLcom/google/android/exoplayer2/drm/DrmInitData;Ll/k5l;Ll/kdm;Ll/ig60;ZLl/bf80;)V

    return-object v11
.end method

.method public static l(Ljava/lang/String;)[B
    .locals 4

    .line 1
    invoke-static {p0}, Ll/i11;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "0x"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    new-instance v0, Ljava/math/BigInteger;

    .line 19
    .line 20
    const/16 v1, 0x10

    .line 21
    .line 22
    invoke-direct {v0, p0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-array v0, v1, [B

    .line 30
    .line 31
    array-length v2, p0

    .line 32
    if-le v2, v1, :cond_1

    .line 33
    .line 34
    array-length v2, p0

    .line 35
    sub-int/2addr v2, v1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v2, 0x0

    .line 38
    :goto_0
    array-length v3, p0

    .line 39
    sub-int/2addr v1, v3

    .line 40
    add-int/2addr v1, v2

    .line 41
    array-length v3, p0

    .line 42
    sub-int/2addr v3, v2

    .line 43
    invoke-static {p0, v2, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public static p(Ll/f5l$e;Lcom/google/android/exoplayer2/source/hls/playlist/b;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f5l$e;->a:Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 4
    .line 5
    if-eqz v1, :cond_2

    .line 6
    .line 7
    check-cast v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;->l:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Ll/f5l$e;->c:I

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-boolean p0, p1, Ll/m5l;->c:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_2
    iget-boolean p0, p1, Ll/m5l;->c:Z

    .line 27
    .line 28
    return p0
.end method

.method public static w(Ll/j5l;Landroid/net/Uri;Lcom/google/android/exoplayer2/source/hls/playlist/b;Ll/f5l$e;J)Z
    .locals 3
    .param p0    # Ll/j5l;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/j5l;->m:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-boolean p1, p0, Ll/j5l;->J:Z

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    iget-object p1, p3, Ll/f5l$e;->a:Lcom/google/android/exoplayer2/source/hls/playlist/b$e;

    .line 19
    .line 20
    iget-wide v1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b$e;->e:J

    .line 21
    .line 22
    add-long/2addr p4, v1

    .line 23
    invoke-static {p3, p2}, Ll/j5l;->p(Ll/f5l$e;Lcom/google/android/exoplayer2/source/hls/playlist/b;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    iget-wide p0, p0, Ll/o45;->h:J

    .line 30
    .line 31
    cmp-long p0, p4, p0

    .line 32
    .line 33
    if-gez p0, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return v0

    .line 37
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
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
    iget-object v0, p0, Ll/j5l;->F:Ll/s5l;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/j5l;->E:Ll/k5l;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/j5l;->r:Ll/k5l;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ll/k5l;->d()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/j5l;->r:Ll/k5l;

    .line 21
    .line 22
    iput-object v0, p0, Ll/j5l;->E:Ll/k5l;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/j5l;->H:Z

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/j5l;->s()V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Ll/j5l;->I:Z

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-boolean v0, p0, Ll/j5l;->t:Z

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/j5l;->r()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-boolean v0, p0, Ll/j5l;->I:Z

    .line 42
    .line 43
    xor-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    iput-boolean v0, p0, Ll/j5l;->J:Z

    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/j5l;->I:Z

    .line 3
    .line 4
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/j5l;->J:Z

    .line 2
    .line 3
    return p0
.end method

.method public final k(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ZZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/j5l;->G:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p3, :cond_1

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    :cond_0
    move-object p3, p2

    .line 10
    goto :goto_0

    .line 11
    :cond_1
    int-to-long v2, v0

    .line 12
    invoke-virtual {p2, v2, v3}, Lcom/google/android/exoplayer2/upstream/a;->e(J)Lcom/google/android/exoplayer2/upstream/a;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    :goto_0
    :try_start_0
    invoke-virtual {p0, p1, p3, p4}, Ll/j5l;->u(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Z)Ll/qod;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget p4, p0, Ll/j5l;->G:I

    .line 23
    .line 24
    invoke-interface {p3, p4}, Ll/asf;->o(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_6

    .line 30
    :cond_2
    :goto_1
    :try_start_1
    iget-boolean p4, p0, Ll/j5l;->I:Z

    .line 31
    .line 32
    if-nez p4, :cond_3

    .line 33
    .line 34
    iget-object p4, p0, Ll/j5l;->E:Ll/k5l;

    .line 35
    .line 36
    invoke-interface {p4, p3}, Ll/k5l;->a(Ll/asf;)Z

    .line 37
    .line 38
    .line 39
    move-result p4
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 40
    if-eqz p4, :cond_3

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catchall_1
    move-exception p4

    .line 44
    goto :goto_5

    .line 45
    :catch_0
    move-exception p4

    .line 46
    goto :goto_3

    .line 47
    :cond_3
    :try_start_2
    invoke-interface {p3}, Ll/asf;->getPosition()J

    .line 48
    .line 49
    .line 50
    move-result-wide p3

    .line 51
    :goto_2
    iget-wide v0, p2, Lcom/google/android/exoplayer2/upstream/a;->g:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    .line 53
    goto :goto_4

    .line 54
    :goto_3
    :try_start_3
    iget-object v0, p0, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 55
    .line 56
    iget v0, v0, Lcom/google/android/exoplayer2/k;->e:I

    .line 57
    .line 58
    and-int/lit16 v0, v0, 0x4000

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    iget-object p4, p0, Ll/j5l;->E:Ll/k5l;

    .line 63
    .line 64
    invoke-interface {p4}, Ll/k5l;->c()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 65
    .line 66
    .line 67
    :try_start_4
    invoke-interface {p3}, Ll/asf;->getPosition()J

    .line 68
    .line 69
    .line 70
    move-result-wide p3

    .line 71
    goto :goto_2

    .line 72
    :goto_4
    sub-long/2addr p3, v0

    .line 73
    long-to-int p2, p3

    .line 74
    iput p2, p0, Ll/j5l;->G:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 75
    .line 76
    invoke-static {p1}, Ll/m6c;->a(Ll/g6c;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    :try_start_5
    throw p4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 81
    :goto_5
    :try_start_6
    invoke-interface {p3}, Ll/asf;->getPosition()J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    iget-wide p2, p2, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 86
    .line 87
    sub-long/2addr v0, p2

    .line 88
    long-to-int p2, v0

    .line 89
    iput p2, p0, Ll/j5l;->G:I

    .line 90
    .line 91
    throw p4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 92
    :goto_6
    invoke-static {p1}, Ll/m6c;->a(Ll/g6c;)V

    .line 93
    .line 94
    .line 95
    throw p0
.end method

.method public m(I)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/j5l;->n:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/j5l;->K:Lcom/google/common/collect/ImmutableList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lt p1, v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/j5l;->K:Lcom/google/common/collect/ImmutableList;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public n(Ll/s5l;Lcom/google/common/collect/ImmutableList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/s5l;",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j5l;->F:Ll/s5l;

    .line 2
    .line 3
    iput-object p2, p0, Ll/j5l;->K:Lcom/google/common/collect/ImmutableList;

    .line 4
    .line 5
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/j5l;->L:Z

    .line 3
    .line 4
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/j5l;->M:Z

    .line 2
    .line 3
    return p0
.end method

.method public final r()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o45;->i:Ll/p4g0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/o45;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 4
    .line 5
    iget-boolean v2, p0, Ll/j5l;->A:Z

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/j5l;->k(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final s()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/j5l;->H:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/j5l;->p:Ll/g6c;

    .line 7
    .line 8
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/j5l;->q:Lcom/google/android/exoplayer2/upstream/a;

    .line 12
    .line 13
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/j5l;->p:Ll/g6c;

    .line 17
    .line 18
    iget-object v1, p0, Ll/j5l;->q:Lcom/google/android/exoplayer2/upstream/a;

    .line 19
    .line 20
    iget-boolean v2, p0, Ll/j5l;->B:Z

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/j5l;->k(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;ZZ)V

    .line 24
    .line 25
    .line 26
    iput v3, p0, Ll/j5l;->G:I

    .line 27
    .line 28
    iput-boolean v3, p0, Ll/j5l;->H:Z

    .line 29
    .line 30
    return-void
.end method

.method public final t(Ll/asf;)J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/asf;->h()V

    .line 2
    .line 3
    .line 4
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object v2, p0, Ll/j5l;->z:Ll/ig60;

    .line 10
    .line 11
    const/16 v3, 0xa

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Ll/ig60;->Q(I)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/j5l;->z:Ll/ig60;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/ig60;->e()[B

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-interface {p1, v2, v4, v3}, Ll/asf;->f([BII)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/j5l;->z:Ll/ig60;

    .line 27
    .line 28
    invoke-virtual {v2}, Ll/ig60;->K()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const v5, 0x494433

    .line 33
    .line 34
    .line 35
    if-eq v2, v5, :cond_0

    .line 36
    .line 37
    return-wide v0

    .line 38
    :cond_0
    iget-object v2, p0, Ll/j5l;->z:Ll/ig60;

    .line 39
    .line 40
    const/4 v5, 0x3

    .line 41
    invoke-virtual {v2, v5}, Ll/ig60;->V(I)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/j5l;->z:Ll/ig60;

    .line 45
    .line 46
    invoke-virtual {v2}, Ll/ig60;->G()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    add-int/lit8 v5, v2, 0xa

    .line 51
    .line 52
    iget-object v6, p0, Ll/j5l;->z:Ll/ig60;

    .line 53
    .line 54
    invoke-virtual {v6}, Ll/ig60;->b()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-le v5, v6, :cond_1

    .line 59
    .line 60
    iget-object v6, p0, Ll/j5l;->z:Ll/ig60;

    .line 61
    .line 62
    invoke-virtual {v6}, Ll/ig60;->e()[B

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iget-object v7, p0, Ll/j5l;->z:Ll/ig60;

    .line 67
    .line 68
    invoke-virtual {v7, v5}, Ll/ig60;->Q(I)V

    .line 69
    .line 70
    .line 71
    iget-object v5, p0, Ll/j5l;->z:Ll/ig60;

    .line 72
    .line 73
    invoke-virtual {v5}, Ll/ig60;->e()[B

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-static {v6, v4, v5, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object v5, p0, Ll/j5l;->z:Ll/ig60;

    .line 81
    .line 82
    invoke-virtual {v5}, Ll/ig60;->e()[B

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-interface {p1, v5, v3, v2}, Ll/asf;->f([BII)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/j5l;->y:Ll/kdm;

    .line 90
    .line 91
    iget-object v3, p0, Ll/j5l;->z:Ll/ig60;

    .line 92
    .line 93
    invoke-virtual {v3}, Ll/ig60;->e()[B

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {p1, v3, v2}, Ll/kdm;->e([BI)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    if-nez p1, :cond_2

    .line 102
    .line 103
    return-wide v0

    .line 104
    :cond_2
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/metadata/Metadata;->e()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    move v3, v4

    .line 109
    :goto_0
    if-ge v3, v2, :cond_4

    .line 110
    .line 111
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer2/metadata/Metadata;->d(I)Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    instance-of v6, v5, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    .line 116
    .line 117
    if-eqz v6, :cond_3

    .line 118
    .line 119
    check-cast v5, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;

    .line 120
    .line 121
    const-string v6, "com.apple.streaming.transportStreamTimestamp"

    .line 122
    .line 123
    iget-object v7, v5, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;->owner:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_3

    .line 130
    .line 131
    iget-object p1, v5, Lcom/google/android/exoplayer2/metadata/id3/PrivFrame;->privateData:[B

    .line 132
    .line 133
    iget-object v0, p0, Ll/j5l;->z:Ll/ig60;

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const/16 v1, 0x8

    .line 140
    .line 141
    invoke-static {p1, v4, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/j5l;->z:Ll/ig60;

    .line 145
    .line 146
    invoke-virtual {p1, v4}, Ll/ig60;->U(I)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ll/j5l;->z:Ll/ig60;

    .line 150
    .line 151
    invoke-virtual {p1, v1}, Ll/ig60;->T(I)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Ll/j5l;->z:Ll/ig60;

    .line 155
    .line 156
    invoke-virtual {p0}, Ll/ig60;->A()J

    .line 157
    .line 158
    .line 159
    move-result-wide p0

    .line 160
    const-wide v0, 0x1ffffffffL

    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    and-long/2addr p0, v0

    .line 166
    return-wide p0

    .line 167
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :catch_0
    :cond_4
    return-wide v0
.end method

.method public final u(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;Z)Ll/qod;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "extractor"
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p2}, Ll/g6c;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object v6, p0, Ll/j5l;->u:Ll/h0j0;

    .line 8
    .line 9
    iget-boolean v7, p0, Ll/j5l;->s:Z

    .line 10
    .line 11
    iget-wide v8, p0, Ll/o45;->g:J

    .line 12
    .line 13
    iget-wide v10, p0, Ll/j5l;->D:J

    .line 14
    .line 15
    invoke-virtual/range {v6 .. v11}, Ll/h0j0;->i(ZJJ)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception v0

    .line 20
    move-object p0, v0

    .line 21
    new-instance p1, Ljava/io/IOException;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    throw p1

    .line 27
    :catch_1
    new-instance p0, Ljava/io/InterruptedIOException;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_0
    :goto_0
    new-instance v0, Ll/qod;

    .line 34
    .line 35
    iget-wide v2, p2, Lcom/google/android/exoplayer2/upstream/a;->g:J

    .line 36
    .line 37
    move-object v1, p1

    .line 38
    invoke-direct/range {v0 .. v5}, Ll/qod;-><init>(Ll/e6c;JJ)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/j5l;->E:Ll/k5l;

    .line 42
    .line 43
    if-nez p1, :cond_4

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/j5l;->t(Ll/asf;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v8

    .line 49
    invoke-virtual {v0}, Ll/qod;->h()V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/j5l;->r:Ll/k5l;

    .line 53
    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-interface {p1}, Ll/k5l;->f()Ll/k5l;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move-object v6, v0

    .line 62
    iget-object v0, p0, Ll/j5l;->v:Ll/h5l;

    .line 63
    .line 64
    iget-object p1, p2, Lcom/google/android/exoplayer2/upstream/a;->a:Landroid/net/Uri;

    .line 65
    .line 66
    iget-object v2, p0, Ll/o45;->d:Lcom/google/android/exoplayer2/k;

    .line 67
    .line 68
    iget-object v3, p0, Ll/j5l;->w:Ljava/util/List;

    .line 69
    .line 70
    iget-object v4, p0, Ll/j5l;->u:Ll/h0j0;

    .line 71
    .line 72
    invoke-interface {v1}, Ll/g6c;->a()Ljava/util/Map;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    iget-object v7, p0, Ll/j5l;->C:Ll/bf80;

    .line 77
    .line 78
    move-object v1, p1

    .line 79
    invoke-interface/range {v0 .. v7}, Ll/h5l;->a(Landroid/net/Uri;Lcom/google/android/exoplayer2/k;Ljava/util/List;Ll/h0j0;Ljava/util/Map;Ll/asf;Ll/bf80;)Ll/k5l;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    move-object v0, v6

    .line 84
    :goto_1
    iput-object p1, p0, Ll/j5l;->E:Ll/k5l;

    .line 85
    .line 86
    invoke-interface {p1}, Ll/k5l;->e()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget-object p2, p0, Ll/j5l;->F:Ll/s5l;

    .line 91
    .line 92
    if-eqz p1, :cond_3

    .line 93
    .line 94
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    cmp-long p1, v8, v1

    .line 100
    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    iget-object p1, p0, Ll/j5l;->u:Ll/h0j0;

    .line 104
    .line 105
    invoke-virtual {p1, v8, v9}, Ll/h0j0;->b(J)J

    .line 106
    .line 107
    .line 108
    move-result-wide v1

    .line 109
    goto :goto_2

    .line 110
    :cond_2
    iget-wide v1, p0, Ll/o45;->g:J

    .line 111
    .line 112
    :goto_2
    invoke-virtual {p2, v1, v2}, Ll/s5l;->m0(J)V

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_3
    const-wide/16 v1, 0x0

    .line 117
    .line 118
    invoke-virtual {p2, v1, v2}, Ll/s5l;->m0(J)V

    .line 119
    .line 120
    .line 121
    :goto_3
    iget-object p1, p0, Ll/j5l;->F:Ll/s5l;

    .line 122
    .line 123
    invoke-virtual {p1}, Ll/s5l;->Y()V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/j5l;->E:Ll/k5l;

    .line 127
    .line 128
    iget-object p2, p0, Ll/j5l;->F:Ll/s5l;

    .line 129
    .line 130
    invoke-interface {p1, p2}, Ll/k5l;->b(Ll/bsf;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    iget-object p1, p0, Ll/j5l;->F:Ll/s5l;

    .line 134
    .line 135
    iget-object p0, p0, Ll/j5l;->x:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 136
    .line 137
    invoke-virtual {p1, p0}, Ll/s5l;->j0(Lcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 138
    .line 139
    .line 140
    return-object v0
.end method

.method public v()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/j5l;->M:Z

    .line 3
    .line 4
    return-void
.end method
