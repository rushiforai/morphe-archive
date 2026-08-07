.class public final Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;
.super Lcom/google/android/exoplayer2/source/a;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/exoplayer2/source/a;",
        "Lcom/google/android/exoplayer2/upstream/Loader$b<",
        "Lcom/google/android/exoplayer2/upstream/d<",
        "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
        ">;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Z

.field public final b:Landroid/net/Uri;

.field public final c:Lcom/google/android/exoplayer2/n$h;

.field public final d:Lcom/google/android/exoplayer2/n;

.field public final e:Ll/g6c$a;

.field public final f:Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

.field public final g:Ll/et5;

.field public final h:Lcom/google/android/exoplayer2/drm/c;

.field public final i:Lcom/google/android/exoplayer2/upstream/c;

.field public final j:J

.field public final k:Lcom/google/android/exoplayer2/source/j$a;

.field public final l:Lcom/google/android/exoplayer2/upstream/d$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/c;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/g6c;

.field public o:Lcom/google/android/exoplayer2/upstream/Loader;

.field public p:Ll/vtv;

.field public q:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:J

.field public s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

.field public t:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "goog.exo.smoothstreaming"

    .line 2
    .line 3
    invoke-static {v0}, Ll/t9f;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;J)V
    .locals 3
    .param p2    # Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/g6c$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/google/android/exoplayer2/upstream/d$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/zb5;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/n;",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            "Ll/g6c$a;",
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            ">;",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;",
            "Ll/et5;",
            "Ll/zb5;",
            "Lcom/google/android/exoplayer2/drm/c;",
            "Lcom/google/android/exoplayer2/upstream/c;",
            "J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/a;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p7, 0x1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v0

    .line 14
    goto :goto_1

    .line 15
    :cond_1
    :goto_0
    move v1, p7

    .line 16
    :goto_1
    invoke-static {v1}, Ll/w11;->g(Z)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->d:Lcom/google/android/exoplayer2/n;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 22
    .line 23
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/google/android/exoplayer2/n$h;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->c:Lcom/google/android/exoplayer2/n$h;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 34
    .line 35
    sget-object v2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    move-object p1, v2

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    iget-object p1, p1, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 47
    .line 48
    invoke-static {p1}, Ll/bmk0;->C(Landroid/net/Uri;)Landroid/net/Uri;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :goto_2
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->b:Landroid/net/Uri;

    .line 53
    .line 54
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->e:Ll/g6c$a;

    .line 55
    .line 56
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->l:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 57
    .line 58
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

    .line 59
    .line 60
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->g:Ll/et5;

    .line 61
    .line 62
    iput-object p8, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h:Lcom/google/android/exoplayer2/drm/c;

    .line 63
    .line 64
    iput-object p9, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 65
    .line 66
    iput-wide p10, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->j:J

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/source/a;->createEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/j$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 73
    .line 74
    if-eqz p2, :cond_3

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_3
    move p7, v0

    .line 78
    :goto_3
    iput-boolean p7, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->a:Z

    .line 79
    .line 80
    new-instance p1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->m:Ljava/util/ArrayList;

    .line 86
    .line 87
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;JLcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$a;)V
    .locals 0

    .line 88
    invoke-direct/range {p0 .. p11}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;-><init>(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;J)V

    return-void
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h()V

    return-void
.end method


# virtual methods
.method public c(Lcom/google/android/exoplayer2/upstream/d;JJZ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            ">;JJZ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mtv;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 4
    .line 5
    iget-object v3, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 16
    .line 17
    .line 18
    move-result-wide v10

    .line 19
    move-wide v6, p2

    .line 20
    move-wide/from16 v8, p4

    .line 21
    .line 22
    invoke-direct/range {v0 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    .line 27
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 28
    .line 29
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 33
    .line 34
    iget p1, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/source/j$a;->j(Ll/mtv;I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;
    .locals 12

    .line 1
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/a;->createEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/j$a;

    .line 2
    .line 3
    .line 4
    move-result-object v9

    .line 5
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/a;->createDrmEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/drm/b$a;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    new-instance v0, Lcom/google/android/exoplayer2/source/smoothstreaming/c;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->f:Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

    .line 14
    .line 15
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->q:Ll/pgj0;

    .line 16
    .line 17
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->g:Ll/et5;

    .line 18
    .line 19
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h:Lcom/google/android/exoplayer2/drm/c;

    .line 20
    .line 21
    iget-object v8, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 22
    .line 23
    iget-object v10, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->p:Ll/vtv;

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    move-object v11, p2

    .line 27
    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer2/source/smoothstreaming/c;-><init>(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/pgj0;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;Ll/vtv;Ll/oj0;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->m:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public d(Lcom/google/android/exoplayer2/upstream/d;JJ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            ">;JJ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mtv;

    .line 2
    .line 3
    iget-wide v1, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 4
    .line 5
    iget-object v3, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 16
    .line 17
    .line 18
    move-result-wide v10

    .line 19
    move-wide v6, p2

    .line 20
    move-wide/from16 v8, p4

    .line 21
    .line 22
    invoke-direct/range {v0 .. v11}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 26
    .line 27
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 28
    .line 29
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 33
    .line 34
    iget v2, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 35
    .line 36
    invoke-virtual {v1, v0, v2}, Lcom/google/android/exoplayer2/source/j$a;->m(Ll/mtv;I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->e()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 46
    .line 47
    sub-long v0, p2, p4

    .line 48
    .line 49
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->r:J

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->f()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->g()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public e(Lcom/google/android/exoplayer2/upstream/d;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            ">;JJ",
            "Ljava/io/IOException;",
            "I)",
            "Lcom/google/android/exoplayer2/upstream/Loader$c;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p6

    .line 2
    .line 3
    new-instance v2, Ll/mtv;

    .line 4
    .line 5
    iget-wide v3, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 6
    .line 7
    iget-object v5, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v7

    .line 17
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 18
    .line 19
    .line 20
    move-result-wide v12

    .line 21
    move-wide/from16 v8, p2

    .line 22
    .line 23
    move-wide/from16 v10, p4

    .line 24
    .line 25
    invoke-direct/range {v2 .. v13}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Ll/ktx;

    .line 29
    .line 30
    iget v4, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 31
    .line 32
    invoke-direct {v3, v4}, Ll/ktx;-><init>(I)V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 36
    .line 37
    new-instance v5, Lcom/google/android/exoplayer2/upstream/c$c;

    .line 38
    .line 39
    move/from16 v6, p7

    .line 40
    .line 41
    invoke-direct {v5, v2, v3, v1, v6}, Lcom/google/android/exoplayer2/upstream/c$c;-><init>(Ll/mtv;Ll/ktx;Ljava/io/IOException;I)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v4, v5}, Lcom/google/android/exoplayer2/upstream/c;->a(Lcom/google/android/exoplayer2/upstream/c$c;)J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    cmp-long v5, v3, v5

    .line 54
    .line 55
    if-nez v5, :cond_0

    .line 56
    .line 57
    sget-object v3, Lcom/google/android/exoplayer2/upstream/Loader;->g:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const/4 v5, 0x0

    .line 61
    invoke-static {v5, v3, v4}, Lcom/google/android/exoplayer2/upstream/Loader;->h(ZJ)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    :goto_0
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/upstream/Loader$c;->c()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    xor-int/lit8 v5, v4, 0x1

    .line 70
    .line 71
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 72
    .line 73
    iget v7, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 74
    .line 75
    invoke-virtual {v6, v2, v7, v1, v5}, Lcom/google/android/exoplayer2/source/j$a;->q(Ll/mtv;ILjava/io/IOException;Z)V

    .line 76
    .line 77
    .line 78
    if-nez v4, :cond_1

    .line 79
    .line 80
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 81
    .line 82
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 83
    .line 84
    invoke-interface {p0, v0, v1}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-object v3
.end method

.method public final f()V
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->m:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->m:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/google/android/exoplayer2/source/smoothstreaming/c;

    .line 20
    .line 21
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/source/smoothstreaming/c;->v(Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->f:[Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;

    .line 32
    .line 33
    array-length v3, v2

    .line 34
    const-wide v4, 0x7fffffffffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    const-wide/high16 v6, -0x8000000000000000L

    .line 40
    .line 41
    move v8, v1

    .line 42
    move-wide v14, v4

    .line 43
    :goto_1
    if-ge v8, v3, :cond_2

    .line 44
    .line 45
    aget-object v9, v2, v8

    .line 46
    .line 47
    iget v10, v9, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 48
    .line 49
    if-lez v10, :cond_1

    .line 50
    .line 51
    invoke-virtual {v9, v1}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 52
    .line 53
    .line 54
    move-result-wide v10

    .line 55
    invoke-static {v14, v15, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 56
    .line 57
    .line 58
    move-result-wide v14

    .line 59
    iget v10, v9, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 60
    .line 61
    add-int/lit8 v10, v10, -0x1

    .line 62
    .line 63
    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->e(I)J

    .line 64
    .line 65
    .line 66
    move-result-wide v10

    .line 67
    iget v12, v9, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->k:I

    .line 68
    .line 69
    add-int/lit8 v12, v12, -0x1

    .line 70
    .line 71
    invoke-virtual {v9, v12}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a$b;->c(I)J

    .line 72
    .line 73
    .line 74
    move-result-wide v12

    .line 75
    add-long/2addr v10, v12

    .line 76
    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->max(JJ)J

    .line 77
    .line 78
    .line 79
    move-result-wide v6

    .line 80
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    cmp-long v1, v14, v4

    .line 84
    .line 85
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 86
    .line 87
    const-wide/16 v3, 0x0

    .line 88
    .line 89
    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    if-nez v1, :cond_4

    .line 95
    .line 96
    iget-boolean v1, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 97
    .line 98
    if-eqz v1, :cond_3

    .line 99
    .line 100
    move-wide v11, v8

    .line 101
    goto :goto_2

    .line 102
    :cond_3
    move-wide v11, v3

    .line 103
    :goto_2
    new-instance v10, Ll/lqf0;

    .line 104
    .line 105
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 106
    .line 107
    iget-boolean v2, v1, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 108
    .line 109
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->d:Lcom/google/android/exoplayer2/n;

    .line 110
    .line 111
    const-wide/16 v13, 0x0

    .line 112
    .line 113
    const-wide/16 v15, 0x0

    .line 114
    .line 115
    const-wide/16 v17, 0x0

    .line 116
    .line 117
    const/16 v19, 0x1

    .line 118
    .line 119
    move/from16 v21, v2

    .line 120
    .line 121
    move-object/from16 v22, v1

    .line 122
    .line 123
    move/from16 v20, v2

    .line 124
    .line 125
    move-object/from16 v23, v3

    .line 126
    .line 127
    invoke-direct/range {v10 .. v23}, Ll/lqf0;-><init>(JJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_5

    .line 131
    .line 132
    :cond_4
    iget-boolean v1, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 133
    .line 134
    if-eqz v1, :cond_7

    .line 135
    .line 136
    iget-wide v1, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->h:J

    .line 137
    .line 138
    cmp-long v5, v1, v8

    .line 139
    .line 140
    if-eqz v5, :cond_5

    .line 141
    .line 142
    cmp-long v3, v1, v3

    .line 143
    .line 144
    if-lez v3, :cond_5

    .line 145
    .line 146
    sub-long v1, v6, v1

    .line 147
    .line 148
    invoke-static {v14, v15, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 149
    .line 150
    .line 151
    move-result-wide v14

    .line 152
    :cond_5
    move-wide/from16 v21, v14

    .line 153
    .line 154
    sub-long v19, v6, v21

    .line 155
    .line 156
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->j:J

    .line 157
    .line 158
    invoke-static {v1, v2}, Ll/bmk0;->J0(J)J

    .line 159
    .line 160
    .line 161
    move-result-wide v1

    .line 162
    sub-long v1, v19, v1

    .line 163
    .line 164
    const-wide/32 v3, 0x4c4b40

    .line 165
    .line 166
    .line 167
    cmp-long v5, v1, v3

    .line 168
    .line 169
    if-gez v5, :cond_6

    .line 170
    .line 171
    const-wide/16 v1, 0x2

    .line 172
    .line 173
    div-long v1, v19, v1

    .line 174
    .line 175
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 176
    .line 177
    .line 178
    move-result-wide v1

    .line 179
    :cond_6
    move-wide/from16 v23, v1

    .line 180
    .line 181
    new-instance v16, Ll/lqf0;

    .line 182
    .line 183
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 184
    .line 185
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->d:Lcom/google/android/exoplayer2/n;

    .line 186
    .line 187
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    const/16 v25, 0x1

    .line 193
    .line 194
    const/16 v26, 0x1

    .line 195
    .line 196
    const/16 v27, 0x1

    .line 197
    .line 198
    move-object/from16 v28, v1

    .line 199
    .line 200
    move-object/from16 v29, v2

    .line 201
    .line 202
    invoke-direct/range {v16 .. v29}, Ll/lqf0;-><init>(JJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V

    .line 203
    .line 204
    .line 205
    move-object/from16 v10, v16

    .line 206
    .line 207
    goto :goto_5

    .line 208
    :cond_7
    iget-wide v1, v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->g:J

    .line 209
    .line 210
    cmp-long v3, v1, v8

    .line 211
    .line 212
    if-eqz v3, :cond_8

    .line 213
    .line 214
    :goto_3
    move-wide v12, v1

    .line 215
    goto :goto_4

    .line 216
    :cond_8
    sub-long v1, v6, v14

    .line 217
    .line 218
    goto :goto_3

    .line 219
    :goto_4
    new-instance v9, Ll/lqf0;

    .line 220
    .line 221
    add-long v10, v14, v12

    .line 222
    .line 223
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 224
    .line 225
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->d:Lcom/google/android/exoplayer2/n;

    .line 226
    .line 227
    const-wide/16 v16, 0x0

    .line 228
    .line 229
    const/16 v18, 0x1

    .line 230
    .line 231
    const/16 v19, 0x0

    .line 232
    .line 233
    const/16 v20, 0x0

    .line 234
    .line 235
    move-object/from16 v21, v1

    .line 236
    .line 237
    move-object/from16 v22, v2

    .line 238
    .line 239
    invoke-direct/range {v9 .. v22}, Ll/lqf0;-><init>(JJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V

    .line 240
    .line 241
    .line 242
    move-object v10, v9

    .line 243
    :goto_5
    invoke-virtual {v0, v10}, Lcom/google/android/exoplayer2/source/a;->refreshSourceInfo(Lcom/google/android/exoplayer2/c0;)V

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;->d:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->r:J

    .line 9
    .line 10
    const-wide/16 v2, 0x1388

    .line 11
    .line 12
    add-long/2addr v0, v2

    .line 13
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v0, v2

    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->t:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v3, Ll/u0g0;

    .line 27
    .line 28
    invoke-direct {v3, p0}, Ll/u0g0;-><init>(Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public getMediaItem()Lcom/google/android/exoplayer2/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->d:Lcom/google/android/exoplayer2/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->o:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/upstream/d;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->n:Ll/g6c;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->b:Landroid/net/Uri;

    .line 15
    .line 16
    const/4 v3, 0x4

    .line 17
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->l:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 18
    .line 19
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/upstream/d;-><init>(Ll/g6c;Landroid/net/Uri;ILcom/google/android/exoplayer2/upstream/d$a;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->o:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->i:Lcom/google/android/exoplayer2/upstream/c;

    .line 25
    .line 26
    iget v3, v0, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 27
    .line 28
    invoke-interface {v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->d(I)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1, v0, p0, v2}, Lcom/google/android/exoplayer2/upstream/Loader;->n(Lcom/google/android/exoplayer2/upstream/Loader$e;Lcom/google/android/exoplayer2/upstream/Loader$b;I)J

    .line 33
    .line 34
    .line 35
    move-result-wide v7

    .line 36
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->k:Lcom/google/android/exoplayer2/source/j$a;

    .line 37
    .line 38
    new-instance v3, Ll/mtv;

    .line 39
    .line 40
    iget-wide v4, v0, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 41
    .line 42
    iget-object v6, v0, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 43
    .line 44
    invoke-direct/range {v3 .. v8}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;J)V

    .line 45
    .line 46
    .line 47
    iget v0, v0, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 48
    .line 49
    invoke-virtual {p0, v3, v0}, Lcom/google/android/exoplayer2/source/j$a;->s(Ll/mtv;I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public maybeThrowSourceInfoRefreshError()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->p:Ll/vtv;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/vtv;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic n(Lcom/google/android/exoplayer2/upstream/Loader$e;JJZ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/upstream/d;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->c(Lcom/google/android/exoplayer2/upstream/d;JJZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic o(Lcom/google/android/exoplayer2/upstream/Loader$e;JJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/upstream/d;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->d(Lcom/google/android/exoplayer2/upstream/d;JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public prepareSourceInternal(Ll/pgj0;)V
    .locals 2
    .param p1    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->q:Ll/pgj0;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h:Lcom/google/android/exoplayer2/drm/c;

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/a;->getPlayerId()Ll/bf80;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {p1, v0, v1}, Lcom/google/android/exoplayer2/drm/c;->d(Landroid/os/Looper;Ll/bf80;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h:Lcom/google/android/exoplayer2/drm/c;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/google/android/exoplayer2/drm/c;->prepare()V

    .line 19
    .line 20
    .line 21
    iget-boolean p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->a:Z

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    new-instance p1, Ll/vtv$a;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/vtv$a;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->p:Ll/vtv;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->f()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->e:Ll/g6c$a;

    .line 37
    .line 38
    invoke-interface {p1}, Ll/g6c$a;->a()Ll/g6c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->n:Ll/g6c;

    .line 43
    .line 44
    new-instance p1, Lcom/google/android/exoplayer2/upstream/Loader;

    .line 45
    .line 46
    const-string v0, "SsMediaSource"

    .line 47
    .line 48
    invoke-direct {p1, v0}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->o:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->p:Ll/vtv;

    .line 54
    .line 55
    invoke-static {}, Ll/bmk0;->w()Landroid/os/Handler;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->t:Landroid/os/Handler;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public bridge synthetic q(Lcom/google/android/exoplayer2/upstream/Loader$e;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/upstream/d;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p7}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->e(Lcom/google/android/exoplayer2/upstream/d;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public releasePeriod(Lcom/google/android/exoplayer2/source/h;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/google/android/exoplayer2/source/smoothstreaming/c;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/smoothstreaming/c;->u()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->m:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public releaseSourceInternal()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object v0, v1

    .line 10
    :goto_0
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->s:Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->n:Ll/g6c;

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    iput-wide v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->r:J

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->o:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->l()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->o:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->t:Landroid/os/Handler;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->t:Landroid/os/Handler;

    .line 35
    .line 36
    :cond_2
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;->h:Lcom/google/android/exoplayer2/drm/c;

    .line 37
    .line 38
    invoke-interface {p0}, Lcom/google/android/exoplayer2/drm/c;->release()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
