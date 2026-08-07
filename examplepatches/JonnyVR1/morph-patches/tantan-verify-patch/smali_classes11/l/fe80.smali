.class public final Ll/fe80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final t:Lcom/google/android/exoplayer2/source/i$b;


# instance fields
.field public final a:Lcom/google/android/exoplayer2/c0;

.field public final b:Lcom/google/android/exoplayer2/source/i$b;

.field public final c:J

.field public final d:J

.field public final e:I

.field public final f:Lcom/google/android/exoplayer2/ExoPlaybackException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Z

.field public final h:Ll/ffj0;

.field public final i:Ll/dgj0;

.field public final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/metadata/Metadata;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Lcom/google/android/exoplayer2/source/i$b;

.field public final l:Z

.field public final m:I

.field public final n:Lcom/google/android/exoplayer2/s;

.field public final o:Z

.field public volatile p:J

.field public volatile q:J

.field public volatile r:J

.field public volatile s:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/source/i$b;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/fe80;->t:Lcom/google/android/exoplayer2/source/i$b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V
    .locals 0
    .param p8    # Lcom/google/android/exoplayer2/ExoPlaybackException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/c0;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "JJI",
            "Lcom/google/android/exoplayer2/ExoPlaybackException;",
            "Z",
            "Ll/ffj0;",
            "Ll/dgj0;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/metadata/Metadata;",
            ">;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "ZI",
            "Lcom/google/android/exoplayer2/s;",
            "JJJJZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/fe80;->c:J

    .line 9
    .line 10
    iput-wide p5, p0, Ll/fe80;->d:J

    .line 11
    .line 12
    iput p7, p0, Ll/fe80;->e:I

    .line 13
    .line 14
    iput-object p8, p0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 15
    .line 16
    iput-boolean p9, p0, Ll/fe80;->g:Z

    .line 17
    .line 18
    iput-object p10, p0, Ll/fe80;->h:Ll/ffj0;

    .line 19
    .line 20
    iput-object p11, p0, Ll/fe80;->i:Ll/dgj0;

    .line 21
    .line 22
    iput-object p12, p0, Ll/fe80;->j:Ljava/util/List;

    .line 23
    .line 24
    iput-object p13, p0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 25
    .line 26
    iput-boolean p14, p0, Ll/fe80;->l:Z

    .line 27
    .line 28
    iput p15, p0, Ll/fe80;->m:I

    .line 29
    .line 30
    move-object/from16 p1, p16

    .line 31
    .line 32
    iput-object p1, p0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 33
    .line 34
    move-wide/from16 p1, p17

    .line 35
    .line 36
    iput-wide p1, p0, Ll/fe80;->p:J

    .line 37
    .line 38
    move-wide/from16 p1, p19

    .line 39
    .line 40
    iput-wide p1, p0, Ll/fe80;->q:J

    .line 41
    .line 42
    move-wide/from16 p1, p21

    .line 43
    .line 44
    iput-wide p1, p0, Ll/fe80;->r:J

    .line 45
    .line 46
    move-wide/from16 p1, p23

    .line 47
    .line 48
    iput-wide p1, p0, Ll/fe80;->s:J

    .line 49
    .line 50
    move/from16 p1, p25

    .line 51
    .line 52
    iput-boolean p1, p0, Ll/fe80;->o:Z

    .line 53
    .line 54
    return-void
.end method

.method public static k(Ll/dgj0;)Ll/fe80;
    .locals 26

    .line 1
    new-instance v0, Ll/fe80;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 4
    .line 5
    sget-object v2, Ll/fe80;->t:Lcom/google/android/exoplayer2/source/i$b;

    .line 6
    .line 7
    sget-object v10, Ll/ffj0;->d:Ll/ffj0;

    .line 8
    .line 9
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 10
    .line 11
    .line 12
    move-result-object v12

    .line 13
    sget-object v16, Lcom/google/android/exoplayer2/s;->d:Lcom/google/android/exoplayer2/s;

    .line 14
    .line 15
    const-wide/16 v23, 0x0

    .line 16
    .line 17
    const/16 v25, 0x0

    .line 18
    .line 19
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    const-wide/16 v5, 0x0

    .line 25
    .line 26
    const/4 v7, 0x1

    .line 27
    const/4 v8, 0x0

    .line 28
    const/4 v9, 0x0

    .line 29
    const/4 v14, 0x0

    .line 30
    const/4 v15, 0x0

    .line 31
    const-wide/16 v17, 0x0

    .line 32
    .line 33
    const-wide/16 v19, 0x0

    .line 34
    .line 35
    const-wide/16 v21, 0x0

    .line 36
    .line 37
    move-object v13, v2

    .line 38
    move-object/from16 v11, p0

    .line 39
    .line 40
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 41
    .line 42
    .line 43
    return-object v0
.end method

.method public static l()Lcom/google/android/exoplayer2/source/i$b;
    .locals 1

    .line 1
    sget-object v0, Ll/fe80;->t:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    move-object v9, v8

    .line 21
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 22
    .line 23
    move-object v10, v9

    .line 24
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 25
    .line 26
    move-object v11, v10

    .line 27
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 28
    .line 29
    move-object v12, v11

    .line 30
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 31
    .line 32
    move-object v13, v12

    .line 33
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 34
    .line 35
    move-object v14, v13

    .line 36
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 37
    .line 38
    move-object v15, v14

    .line 39
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 40
    .line 41
    move-object/from16 v16, v15

    .line 42
    .line 43
    iget v15, v0, Ll/fe80;->m:I

    .line 44
    .line 45
    move-object/from16 v17, v1

    .line 46
    .line 47
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 48
    .line 49
    move-object/from16 v19, v1

    .line 50
    .line 51
    move-object/from16 v18, v2

    .line 52
    .line 53
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 54
    .line 55
    move-wide/from16 v20, v1

    .line 56
    .line 57
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 58
    .line 59
    move-object/from16 v23, v16

    .line 60
    .line 61
    move-object/from16 v16, v19

    .line 62
    .line 63
    move-wide/from16 v26, v1

    .line 64
    .line 65
    move-object/from16 v1, v17

    .line 66
    .line 67
    move-object/from16 v2, v18

    .line 68
    .line 69
    move-wide/from16 v17, v20

    .line 70
    .line 71
    move-wide/from16 v19, v26

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/fe80;->m()J

    .line 74
    .line 75
    .line 76
    move-result-wide v21

    .line 77
    move-object/from16 v25, v23

    .line 78
    .line 79
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 80
    .line 81
    .line 82
    move-result-wide v23

    .line 83
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 84
    .line 85
    move-object/from16 v26, v25

    .line 86
    .line 87
    move/from16 v25, v0

    .line 88
    .line 89
    move-object/from16 v0, v26

    .line 90
    .line 91
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method public b(Z)Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    move-object v9, v8

    .line 21
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 22
    .line 23
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 24
    .line 25
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 26
    .line 27
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 28
    .line 29
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 30
    .line 31
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 32
    .line 33
    iget v15, v0, Ll/fe80;->m:I

    .line 34
    .line 35
    move-object/from16 v16, v1

    .line 36
    .line 37
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 38
    .line 39
    move-object/from16 v18, v1

    .line 40
    .line 41
    move-object/from16 v17, v2

    .line 42
    .line 43
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 44
    .line 45
    move-wide/from16 v19, v1

    .line 46
    .line 47
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 48
    .line 49
    move-wide/from16 v21, v1

    .line 50
    .line 51
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 52
    .line 53
    move-wide/from16 v23, v1

    .line 54
    .line 55
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 56
    .line 57
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 58
    .line 59
    move/from16 v25, v0

    .line 60
    .line 61
    move-object v0, v9

    .line 62
    move/from16 v9, p1

    .line 63
    .line 64
    move-wide/from16 v26, v1

    .line 65
    .line 66
    move-object/from16 v1, v16

    .line 67
    .line 68
    move-object/from16 v2, v17

    .line 69
    .line 70
    move-object/from16 v16, v18

    .line 71
    .line 72
    move-wide/from16 v17, v19

    .line 73
    .line 74
    move-wide/from16 v19, v21

    .line 75
    .line 76
    move-wide/from16 v21, v23

    .line 77
    .line 78
    move-wide/from16 v23, v26

    .line 79
    .line 80
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 81
    .line 82
    .line 83
    return-object v0
.end method

.method public c(Lcom/google/android/exoplayer2/source/i$b;)Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    move-object v9, v8

    .line 21
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 22
    .line 23
    move-object v10, v9

    .line 24
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 25
    .line 26
    move-object v11, v10

    .line 27
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 28
    .line 29
    move-object v12, v11

    .line 30
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 31
    .line 32
    move-object v13, v12

    .line 33
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 34
    .line 35
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 36
    .line 37
    iget v15, v0, Ll/fe80;->m:I

    .line 38
    .line 39
    move-object/from16 v16, v1

    .line 40
    .line 41
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 42
    .line 43
    move-object/from16 v18, v1

    .line 44
    .line 45
    move-object/from16 v17, v2

    .line 46
    .line 47
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 48
    .line 49
    move-wide/from16 v19, v1

    .line 50
    .line 51
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 52
    .line 53
    move-wide/from16 v21, v1

    .line 54
    .line 55
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 56
    .line 57
    move-wide/from16 v23, v1

    .line 58
    .line 59
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 60
    .line 61
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 62
    .line 63
    move/from16 v25, v0

    .line 64
    .line 65
    move-object v0, v13

    .line 66
    move-object/from16 v13, p1

    .line 67
    .line 68
    move-wide/from16 v26, v1

    .line 69
    .line 70
    move-object/from16 v1, v16

    .line 71
    .line 72
    move-object/from16 v2, v17

    .line 73
    .line 74
    move-object/from16 v16, v18

    .line 75
    .line 76
    move-wide/from16 v17, v19

    .line 77
    .line 78
    move-wide/from16 v19, v21

    .line 79
    .line 80
    move-wide/from16 v21, v23

    .line 81
    .line 82
    move-wide/from16 v23, v26

    .line 83
    .line 84
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 85
    .line 86
    .line 87
    return-object v0
.end method

.method public d(Lcom/google/android/exoplayer2/source/i$b;JJJJLl/ffj0;Ll/dgj0;Ljava/util/List;)Ll/fe80;
    .locals 26
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/i$b;",
            "JJJJ",
            "Ll/ffj0;",
            "Ll/dgj0;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/metadata/Metadata;",
            ">;)",
            "Ll/fe80;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    iget v7, v0, Ll/fe80;->e:I

    .line 9
    .line 10
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 11
    .line 12
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 13
    .line 14
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 15
    .line 16
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 17
    .line 18
    iget v15, v0, Ll/fe80;->m:I

    .line 19
    .line 20
    iget-object v3, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 21
    .line 22
    iget-wide v4, v0, Ll/fe80;->p:J

    .line 23
    .line 24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v23

    .line 28
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 29
    .line 30
    move-wide/from16 v21, p2

    .line 31
    .line 32
    move-wide/from16 v19, p8

    .line 33
    .line 34
    move-object/from16 v10, p10

    .line 35
    .line 36
    move-object/from16 v11, p11

    .line 37
    .line 38
    move-object/from16 v12, p12

    .line 39
    .line 40
    move/from16 v25, v0

    .line 41
    .line 42
    move-object v0, v2

    .line 43
    move-object/from16 v16, v3

    .line 44
    .line 45
    move-wide/from16 v17, v4

    .line 46
    .line 47
    move-object/from16 v2, p1

    .line 48
    .line 49
    move-wide/from16 v3, p4

    .line 50
    .line 51
    move-wide/from16 v5, p6

    .line 52
    .line 53
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 54
    .line 55
    .line 56
    return-object v0
.end method

.method public e(ZI)Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    move-object v9, v8

    .line 21
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 22
    .line 23
    move-object v10, v9

    .line 24
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 25
    .line 26
    move-object v11, v10

    .line 27
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 28
    .line 29
    move-object v12, v11

    .line 30
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 31
    .line 32
    move-object v13, v12

    .line 33
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 34
    .line 35
    move-object v14, v13

    .line 36
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 37
    .line 38
    iget-object v15, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 39
    .line 40
    move-object/from16 v16, v1

    .line 41
    .line 42
    move-object/from16 v17, v2

    .line 43
    .line 44
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 45
    .line 46
    move-wide/from16 v18, v1

    .line 47
    .line 48
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 49
    .line 50
    move-wide/from16 v20, v1

    .line 51
    .line 52
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 53
    .line 54
    move-wide/from16 v22, v1

    .line 55
    .line 56
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 57
    .line 58
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 59
    .line 60
    move-wide/from16 v26, v1

    .line 61
    .line 62
    move-object/from16 v2, v17

    .line 63
    .line 64
    move-wide/from16 v17, v18

    .line 65
    .line 66
    move-wide/from16 v19, v20

    .line 67
    .line 68
    move-wide/from16 v21, v22

    .line 69
    .line 70
    move-wide/from16 v23, v26

    .line 71
    .line 72
    move/from16 v25, v0

    .line 73
    .line 74
    move-object v0, v14

    .line 75
    move-object/from16 v1, v16

    .line 76
    .line 77
    move/from16 v14, p1

    .line 78
    .line 79
    move-object/from16 v16, v15

    .line 80
    .line 81
    move/from16 v15, p2

    .line 82
    .line 83
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 84
    .line 85
    .line 86
    move-object v13, v0

    .line 87
    return-object v13
.end method

.method public f(Lcom/google/android/exoplayer2/ExoPlaybackException;)Ll/fe80;
    .locals 28
    .param p1    # Lcom/google/android/exoplayer2/ExoPlaybackException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 21
    .line 22
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 23
    .line 24
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 25
    .line 26
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 27
    .line 28
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 29
    .line 30
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 31
    .line 32
    iget v15, v0, Ll/fe80;->m:I

    .line 33
    .line 34
    move-object/from16 v16, v1

    .line 35
    .line 36
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 37
    .line 38
    move-object/from16 v18, v1

    .line 39
    .line 40
    move-object/from16 v17, v2

    .line 41
    .line 42
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 43
    .line 44
    move-wide/from16 v19, v1

    .line 45
    .line 46
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 47
    .line 48
    move-wide/from16 v21, v1

    .line 49
    .line 50
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 51
    .line 52
    move-wide/from16 v23, v1

    .line 53
    .line 54
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 55
    .line 56
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 57
    .line 58
    move/from16 v25, v0

    .line 59
    .line 60
    move-object v0, v8

    .line 61
    move-object/from16 v8, p1

    .line 62
    .line 63
    move-wide/from16 v26, v1

    .line 64
    .line 65
    move-object/from16 v1, v16

    .line 66
    .line 67
    move-object/from16 v2, v17

    .line 68
    .line 69
    move-object/from16 v16, v18

    .line 70
    .line 71
    move-wide/from16 v17, v19

    .line 72
    .line 73
    move-wide/from16 v19, v21

    .line 74
    .line 75
    move-wide/from16 v21, v23

    .line 76
    .line 77
    move-wide/from16 v23, v26

    .line 78
    .line 79
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 80
    .line 81
    .line 82
    return-object v0
.end method

.method public g(Lcom/google/android/exoplayer2/s;)Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    move-object v9, v8

    .line 21
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 22
    .line 23
    move-object v10, v9

    .line 24
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 25
    .line 26
    move-object v11, v10

    .line 27
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 28
    .line 29
    move-object v12, v11

    .line 30
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 31
    .line 32
    move-object v13, v12

    .line 33
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 34
    .line 35
    move-object v14, v13

    .line 36
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 37
    .line 38
    move-object v15, v14

    .line 39
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 40
    .line 41
    move-object/from16 v16, v15

    .line 42
    .line 43
    iget v15, v0, Ll/fe80;->m:I

    .line 44
    .line 45
    move-object/from16 v17, v1

    .line 46
    .line 47
    move-object/from16 v18, v2

    .line 48
    .line 49
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 50
    .line 51
    move-wide/from16 v19, v1

    .line 52
    .line 53
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 54
    .line 55
    move-wide/from16 v21, v1

    .line 56
    .line 57
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 58
    .line 59
    move-wide/from16 v23, v1

    .line 60
    .line 61
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 62
    .line 63
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 64
    .line 65
    move/from16 v25, v0

    .line 66
    .line 67
    move-object/from16 v0, v16

    .line 68
    .line 69
    move-object/from16 v16, p1

    .line 70
    .line 71
    move-wide/from16 v26, v1

    .line 72
    .line 73
    move-object/from16 v1, v17

    .line 74
    .line 75
    move-object/from16 v2, v18

    .line 76
    .line 77
    move-wide/from16 v17, v19

    .line 78
    .line 79
    move-wide/from16 v19, v21

    .line 80
    .line 81
    move-wide/from16 v21, v23

    .line 82
    .line 83
    move-wide/from16 v23, v26

    .line 84
    .line 85
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 86
    .line 87
    .line 88
    return-object v0
.end method

.method public h(I)Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 18
    .line 19
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 20
    .line 21
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 22
    .line 23
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 24
    .line 25
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 26
    .line 27
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 28
    .line 29
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 30
    .line 31
    iget v15, v0, Ll/fe80;->m:I

    .line 32
    .line 33
    move-object/from16 v16, v1

    .line 34
    .line 35
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 36
    .line 37
    move-object/from16 v18, v1

    .line 38
    .line 39
    move-object/from16 v17, v2

    .line 40
    .line 41
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 42
    .line 43
    move-wide/from16 v19, v1

    .line 44
    .line 45
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 46
    .line 47
    move-wide/from16 v21, v1

    .line 48
    .line 49
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 50
    .line 51
    move-wide/from16 v23, v1

    .line 52
    .line 53
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 54
    .line 55
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 56
    .line 57
    move/from16 v25, v0

    .line 58
    .line 59
    move-object v0, v7

    .line 60
    move/from16 v7, p1

    .line 61
    .line 62
    move-wide/from16 v26, v1

    .line 63
    .line 64
    move-object/from16 v1, v16

    .line 65
    .line 66
    move-object/from16 v2, v17

    .line 67
    .line 68
    move-object/from16 v16, v18

    .line 69
    .line 70
    move-wide/from16 v17, v19

    .line 71
    .line 72
    move-wide/from16 v19, v21

    .line 73
    .line 74
    move-wide/from16 v21, v23

    .line 75
    .line 76
    move-wide/from16 v23, v26

    .line 77
    .line 78
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 79
    .line 80
    .line 81
    return-object v0
.end method

.method public i(Z)Ll/fe80;
    .locals 30
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/fe80;->a:Lcom/google/android/exoplayer2/c0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 16
    .line 17
    move-object v8, v7

    .line 18
    iget v7, v0, Ll/fe80;->e:I

    .line 19
    .line 20
    move-object v9, v8

    .line 21
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 22
    .line 23
    move-object v10, v9

    .line 24
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 25
    .line 26
    move-object v11, v10

    .line 27
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 28
    .line 29
    move-object v12, v11

    .line 30
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 31
    .line 32
    move-object v13, v12

    .line 33
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 34
    .line 35
    move-object v14, v13

    .line 36
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 37
    .line 38
    move-object v15, v14

    .line 39
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 40
    .line 41
    move-object/from16 v16, v15

    .line 42
    .line 43
    iget v15, v0, Ll/fe80;->m:I

    .line 44
    .line 45
    move-object/from16 v17, v1

    .line 46
    .line 47
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 48
    .line 49
    move-object/from16 v19, v1

    .line 50
    .line 51
    move-object/from16 v18, v2

    .line 52
    .line 53
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 54
    .line 55
    move-wide/from16 v20, v1

    .line 56
    .line 57
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 58
    .line 59
    move-wide/from16 v22, v1

    .line 60
    .line 61
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 62
    .line 63
    move-wide/from16 v24, v1

    .line 64
    .line 65
    iget-wide v0, v0, Ll/fe80;->s:J

    .line 66
    .line 67
    move-object/from16 v2, v18

    .line 68
    .line 69
    move-wide/from16 v26, v24

    .line 70
    .line 71
    move/from16 v25, p1

    .line 72
    .line 73
    move-wide/from16 v28, v0

    .line 74
    .line 75
    move-object/from16 v0, v16

    .line 76
    .line 77
    move-object/from16 v1, v17

    .line 78
    .line 79
    move-object/from16 v16, v19

    .line 80
    .line 81
    move-wide/from16 v17, v20

    .line 82
    .line 83
    move-wide/from16 v19, v22

    .line 84
    .line 85
    move-wide/from16 v21, v26

    .line 86
    .line 87
    move-wide/from16 v23, v28

    .line 88
    .line 89
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method

.method public j(Lcom/google/android/exoplayer2/c0;)Ll/fe80;
    .locals 28
    .annotation build Landroidx/annotation/CheckResult;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/fe80;

    .line 4
    .line 5
    iget-object v2, v0, Ll/fe80;->b:Lcom/google/android/exoplayer2/source/i$b;

    .line 6
    .line 7
    iget-wide v3, v0, Ll/fe80;->c:J

    .line 8
    .line 9
    iget-wide v5, v0, Ll/fe80;->d:J

    .line 10
    .line 11
    iget v7, v0, Ll/fe80;->e:I

    .line 12
    .line 13
    iget-object v8, v0, Ll/fe80;->f:Lcom/google/android/exoplayer2/ExoPlaybackException;

    .line 14
    .line 15
    iget-boolean v9, v0, Ll/fe80;->g:Z

    .line 16
    .line 17
    iget-object v10, v0, Ll/fe80;->h:Ll/ffj0;

    .line 18
    .line 19
    iget-object v11, v0, Ll/fe80;->i:Ll/dgj0;

    .line 20
    .line 21
    iget-object v12, v0, Ll/fe80;->j:Ljava/util/List;

    .line 22
    .line 23
    iget-object v13, v0, Ll/fe80;->k:Lcom/google/android/exoplayer2/source/i$b;

    .line 24
    .line 25
    iget-boolean v14, v0, Ll/fe80;->l:Z

    .line 26
    .line 27
    iget v15, v0, Ll/fe80;->m:I

    .line 28
    .line 29
    move-object/from16 v16, v1

    .line 30
    .line 31
    iget-object v1, v0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 32
    .line 33
    move-object/from16 v18, v1

    .line 34
    .line 35
    move-object/from16 v17, v2

    .line 36
    .line 37
    iget-wide v1, v0, Ll/fe80;->p:J

    .line 38
    .line 39
    move-wide/from16 v19, v1

    .line 40
    .line 41
    iget-wide v1, v0, Ll/fe80;->q:J

    .line 42
    .line 43
    move-wide/from16 v21, v1

    .line 44
    .line 45
    iget-wide v1, v0, Ll/fe80;->r:J

    .line 46
    .line 47
    move-wide/from16 v23, v1

    .line 48
    .line 49
    iget-wide v1, v0, Ll/fe80;->s:J

    .line 50
    .line 51
    iget-boolean v0, v0, Ll/fe80;->o:Z

    .line 52
    .line 53
    move/from16 v25, v0

    .line 54
    .line 55
    move-object/from16 v0, v16

    .line 56
    .line 57
    move-object/from16 v16, v18

    .line 58
    .line 59
    move-wide/from16 v26, v1

    .line 60
    .line 61
    move-object/from16 v1, p1

    .line 62
    .line 63
    move-object/from16 v2, v17

    .line 64
    .line 65
    move-wide/from16 v17, v19

    .line 66
    .line 67
    move-wide/from16 v19, v21

    .line 68
    .line 69
    move-wide/from16 v21, v23

    .line 70
    .line 71
    move-wide/from16 v23, v26

    .line 72
    .line 73
    invoke-direct/range {v0 .. v25}, Ll/fe80;-><init>(Lcom/google/android/exoplayer2/c0;Lcom/google/android/exoplayer2/source/i$b;JJILcom/google/android/exoplayer2/ExoPlaybackException;ZLl/ffj0;Ll/dgj0;Ljava/util/List;Lcom/google/android/exoplayer2/source/i$b;ZILcom/google/android/exoplayer2/s;JJJJZ)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method public m()J
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/fe80;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Ll/fe80;->r:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-wide v0, p0, Ll/fe80;->s:J

    .line 11
    .line 12
    iget-wide v2, p0, Ll/fe80;->r:J

    .line 13
    .line 14
    iget-wide v4, p0, Ll/fe80;->s:J

    .line 15
    .line 16
    cmp-long v4, v0, v4

    .line 17
    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    sub-long/2addr v4, v0

    .line 25
    invoke-static {v2, v3}, Ll/bmk0;->l1(J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    long-to-float v2, v4

    .line 30
    iget-object p0, p0, Ll/fe80;->n:Lcom/google/android/exoplayer2/s;

    .line 31
    .line 32
    iget p0, p0, Lcom/google/android/exoplayer2/s;->a:F

    .line 33
    .line 34
    mul-float/2addr v2, p0

    .line 35
    float-to-long v2, v2

    .line 36
    add-long/2addr v0, v2

    .line 37
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    return-wide v0
.end method

.method public n()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/fe80;->e:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/fe80;->l:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget p0, p0, Ll/fe80;->m:I

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public o(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fe80;->r:J

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    iput-wide p1, p0, Ll/fe80;->s:J

    .line 8
    .line 9
    return-void
.end method
