.class public final Lcom/google/android/exoplayer2/source/hls/playlist/a$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/Loader$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/hls/playlist/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer2/upstream/Loader$b<",
        "Lcom/google/android/exoplayer2/upstream/d<",
        "Ll/m5l;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Lcom/google/android/exoplayer2/upstream/Loader;

.field public final c:Ll/g6c;

.field public d:Lcom/google/android/exoplayer2/source/hls/playlist/b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:Z

.field public j:Ljava/io/IOException;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final synthetic k:Lcom/google/android/exoplayer2/source/hls/playlist/a;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/hls/playlist/a;Landroid/net/Uri;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 7
    .line 8
    new-instance p2, Lcom/google/android/exoplayer2/upstream/Loader;

    .line 9
    .line 10
    const-string v0, "DefaultHlsPlaylistTracker:MediaPlaylist"

    .line 11
    .line 12
    invoke-direct {p2, v0}, Lcom/google/android/exoplayer2/upstream/Loader;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->b:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->B(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Ll/g5l;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 p2, 0x4

    .line 22
    invoke-interface {p1, p2}, Ll/g5l;->a(I)Ll/g6c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->c:Ll/g6c;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;Landroid/net/Uri;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->m(Landroid/net/Uri;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;J)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->h(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;Lcom/google/android/exoplayer2/source/hls/playlist/b;Ll/mtv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->v(Lcom/google/android/exoplayer2/source/hls/playlist/b;Ll/mtv;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic e(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;)Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->p(Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;)Lcom/google/android/exoplayer2/source/hls/playlist/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final h(J)Z
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    add-long/2addr v0, p1

    .line 6
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->h:J

    .line 7
    .line 8
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 11
    .line 12
    invoke-static {p2}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->w(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Landroid/net/Uri;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->x(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final i()Landroid/net/Uri;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    .line 6
    .line 7
    iget-wide v1, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$f;->a:J

    .line 8
    .line 9
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    cmp-long v1, v1, v3

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b$f;->e:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 30
    .line 31
    iget-object v2, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    .line 32
    .line 33
    iget-boolean v2, v2, Lcom/google/android/exoplayer2/source/hls/playlist/b$f;->e:Z

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    iget-wide v5, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 38
    .line 39
    iget-object v1, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    int-to-long v1, v1

    .line 46
    add-long/2addr v5, v1

    .line 47
    const-string v1, "_HLS_msn"

    .line 48
    .line 49
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 57
    .line 58
    iget-wide v5, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->n:J

    .line 59
    .line 60
    cmp-long v2, v5, v3

    .line 61
    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    iget-object v1, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->s:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-nez v5, :cond_1

    .line 75
    .line 76
    invoke-static {v1}, Ll/akq;->g(Ljava/lang/Iterable;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;

    .line 81
    .line 82
    iget-boolean v1, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b$b;->m:Z

    .line 83
    .line 84
    if-eqz v1, :cond_1

    .line 85
    .line 86
    add-int/lit8 v2, v2, -0x1

    .line 87
    .line 88
    :cond_1
    const-string v1, "_HLS_part"

    .line 89
    .line 90
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    .line 100
    .line 101
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$f;->a:J

    .line 102
    .line 103
    cmp-long v1, v1, v3

    .line 104
    .line 105
    if-eqz v1, :cond_4

    .line 106
    .line 107
    iget-boolean p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/b$f;->b:Z

    .line 108
    .line 109
    if-eqz p0, :cond_3

    .line 110
    .line 111
    const-string p0, "v2"

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    const-string p0, "YES"

    .line 115
    .line 116
    :goto_0
    const-string v1, "_HLS_skip"

    .line 117
    .line 118
    invoke-virtual {v0, v1, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 119
    .line 120
    .line 121
    :cond_4
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 127
    .line 128
    return-object p0
.end method

.method public j()Lcom/google/android/exoplayer2/source/hls/playlist/b;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Z
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 12
    .line 13
    iget-wide v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->u:J

    .line 14
    .line 15
    invoke-static {v4, v5}, Ll/bmk0;->l1(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v4

    .line 19
    const-wide/16 v6, 0x7530

    .line 20
    .line 21
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 26
    .line 27
    iget-boolean v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 28
    .line 29
    const/4 v7, 0x1

    .line 30
    if-nez v6, :cond_2

    .line 31
    .line 32
    iget v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/b;->d:I

    .line 33
    .line 34
    const/4 v6, 0x2

    .line 35
    if-eq v0, v6, :cond_2

    .line 36
    .line 37
    if-eq v0, v7, :cond_2

    .line 38
    .line 39
    iget-wide v8, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->e:J

    .line 40
    .line 41
    add-long/2addr v8, v4

    .line 42
    cmp-long p0, v8, v2

    .line 43
    .line 44
    if-lez p0, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return v1

    .line 48
    :cond_2
    :goto_0
    return v7
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->p(Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m(Landroid/net/Uri;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->s(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Ll/n5l;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->r(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/hls/playlist/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 14
    .line 15
    invoke-interface {v0, v1, v2}, Ll/n5l;->a(Lcom/google/android/exoplayer2/source/hls/playlist/c;Lcom/google/android/exoplayer2/source/hls/playlist/b;)Lcom/google/android/exoplayer2/upstream/d$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/google/android/exoplayer2/upstream/d;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->c:Ll/g6c;

    .line 22
    .line 23
    const/4 v3, 0x4

    .line 24
    invoke-direct {v1, v2, p1, v3, v0}, Lcom/google/android/exoplayer2/upstream/d;-><init>(Ll/g6c;Landroid/net/Uri;ILcom/google/android/exoplayer2/upstream/d$a;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->b:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->D(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/upstream/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget v2, v1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 36
    .line 37
    invoke-interface {v0, v2}, Lcom/google/android/exoplayer2/upstream/c;->d(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1, v1, p0, v0}, Lcom/google/android/exoplayer2/upstream/Loader;->n(Lcom/google/android/exoplayer2/upstream/Loader$e;Lcom/google/android/exoplayer2/upstream/Loader$b;I)J

    .line 42
    .line 43
    .line 44
    move-result-wide v6

    .line 45
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->C(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/j$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance v2, Ll/mtv;

    .line 52
    .line 53
    iget-wide v3, v1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 54
    .line 55
    iget-object v5, v1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 56
    .line 57
    invoke-direct/range {v2 .. v7}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;J)V

    .line 58
    .line 59
    .line 60
    iget p1, v1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 61
    .line 62
    invoke-virtual {p0, v2, p1}, Lcom/google/android/exoplayer2/source/j$a;->s(Ll/mtv;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public bridge synthetic n(Lcom/google/android/exoplayer2/upstream/Loader$e;JJZ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/upstream/d;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->s(Lcom/google/android/exoplayer2/upstream/d;JJZ)V

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
    invoke-virtual/range {p0 .. p5}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->t(Lcom/google/android/exoplayer2/upstream/d;JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p(Landroid/net/Uri;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->h:J

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->i:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->b:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->j()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->b:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->i()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-wide v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->g:J

    .line 31
    .line 32
    cmp-long v2, v0, v2

    .line 33
    .line 34
    if-gez v2, :cond_1

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    iput-boolean v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->i:Z

    .line 38
    .line 39
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 40
    .line 41
    invoke-static {v2}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->p(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Landroid/os/Handler;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ll/ipd;

    .line 46
    .line 47
    invoke-direct {v3, p0, p1}, Ll/ipd;-><init>(Lcom/google/android/exoplayer2/source/hls/playlist/a$c;Landroid/net/Uri;)V

    .line 48
    .line 49
    .line 50
    iget-wide p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->g:J

    .line 51
    .line 52
    sub-long/2addr p0, v0

    .line 53
    invoke-virtual {v2, v3, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->m(Landroid/net/Uri;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    return-void
.end method

.method public bridge synthetic q(Lcom/google/android/exoplayer2/upstream/Loader$e;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/upstream/d;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p7}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->u(Lcom/google/android/exoplayer2/upstream/d;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->b:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/upstream/Loader;->a()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->j:Ljava/io/IOException;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    throw p0
.end method

.method public s(Lcom/google/android/exoplayer2/upstream/d;JJZ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ll/m5l;",
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
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->D(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/upstream/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-wide v2, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 32
    .line 33
    invoke-interface {v1, v2, v3}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->C(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/j$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const/4 p1, 0x4

    .line 43
    invoke-virtual {p0, v0, p1}, Lcom/google/android/exoplayer2/source/j$a;->j(Ll/mtv;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public t(Lcom/google/android/exoplayer2/upstream/d;JJ)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ll/m5l;",
            ">;JJ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    check-cast v1, Ll/m5l;

    .line 6
    .line 7
    new-instance v2, Ll/mtv;

    .line 8
    .line 9
    iget-wide v3, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 10
    .line 11
    iget-object v5, p1, Lcom/google/android/exoplayer2/upstream/d;->b:Lcom/google/android/exoplayer2/upstream/a;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->d()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->b()J

    .line 22
    .line 23
    .line 24
    move-result-wide v12

    .line 25
    move-wide/from16 v8, p2

    .line 26
    .line 27
    move-wide/from16 v10, p4

    .line 28
    .line 29
    invoke-direct/range {v2 .. v13}, Ll/mtv;-><init>(JLcom/google/android/exoplayer2/upstream/a;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 30
    .line 31
    .line 32
    instance-of v3, v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 33
    .line 34
    const/4 v4, 0x4

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    check-cast v1, Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 38
    .line 39
    invoke-virtual {p0, v1, v2}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->v(Lcom/google/android/exoplayer2/source/hls/playlist/b;Ll/mtv;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->C(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/j$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v2, v4}, Lcom/google/android/exoplayer2/source/j$a;->m(Ll/mtv;I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const-string v1, "Loaded playlist has unexpected type."

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-static {v1, v3}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->j:Ljava/io/IOException;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 62
    .line 63
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->C(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/j$a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->j:Ljava/io/IOException;

    .line 68
    .line 69
    const/4 v5, 0x1

    .line 70
    invoke-virtual {v1, v2, v4, v3, v5}, Lcom/google/android/exoplayer2/source/j$a;->q(Ll/mtv;ILjava/io/IOException;Z)V

    .line 71
    .line 72
    .line 73
    :goto_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 74
    .line 75
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->D(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/upstream/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 80
    .line 81
    invoke-interface {p0, v0, v1}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public u(Lcom/google/android/exoplayer2/upstream/d;JJLjava/io/IOException;I)Lcom/google/android/exoplayer2/upstream/Loader$c;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/upstream/d<",
            "Ll/m5l;",
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
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/d;->f()Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string v4, "_HLS_msn"

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x1

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    move v3, v5

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move v3, v4

    .line 45
    :goto_0
    instance-of v6, v1, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistParser$DeltaUpdateException;

    .line 46
    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    if-eqz v6, :cond_3

    .line 50
    .line 51
    :cond_1
    instance-of v3, v1, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 52
    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    move-object v3, v1

    .line 56
    check-cast v3, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 57
    .line 58
    iget v3, v3, Lcom/google/android/exoplayer2/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const v3, 0x7fffffff

    .line 62
    .line 63
    .line 64
    :goto_1
    if-nez v6, :cond_7

    .line 65
    .line 66
    const/16 v6, 0x190

    .line 67
    .line 68
    if-eq v3, v6, :cond_7

    .line 69
    .line 70
    const/16 v6, 0x1f7

    .line 71
    .line 72
    if-ne v3, v6, :cond_3

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_3
    new-instance v3, Ll/ktx;

    .line 76
    .line 77
    iget v5, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 78
    .line 79
    invoke-direct {v3, v5}, Ll/ktx;-><init>(I)V

    .line 80
    .line 81
    .line 82
    new-instance v5, Lcom/google/android/exoplayer2/upstream/c$c;

    .line 83
    .line 84
    move/from16 v6, p7

    .line 85
    .line 86
    invoke-direct {v5, v2, v3, v1, v6}, Lcom/google/android/exoplayer2/upstream/c$c;-><init>(Ll/mtv;Ll/ktx;Ljava/io/IOException;I)V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 90
    .line 91
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 92
    .line 93
    invoke-static {v3, v6, v5, v4}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->m(Lcom/google/android/exoplayer2/source/hls/playlist/a;Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/c$c;Z)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_5

    .line 98
    .line 99
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 100
    .line 101
    invoke-static {v3}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->D(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/upstream/c;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-interface {v3, v5}, Lcom/google/android/exoplayer2/upstream/c;->a(Lcom/google/android/exoplayer2/upstream/c$c;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v5

    .line 109
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    cmp-long v3, v5, v7

    .line 115
    .line 116
    if-eqz v3, :cond_4

    .line 117
    .line 118
    invoke-static {v4, v5, v6}, Lcom/google/android/exoplayer2/upstream/Loader;->h(ZJ)Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    goto :goto_2

    .line 123
    :cond_4
    sget-object v3, Lcom/google/android/exoplayer2/upstream/Loader;->g:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_5
    sget-object v3, Lcom/google/android/exoplayer2/upstream/Loader;->f:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 127
    .line 128
    :goto_2
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/upstream/Loader$c;->c()Z

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    xor-int/lit8 v5, v4, 0x1

    .line 133
    .line 134
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 135
    .line 136
    invoke-static {v6}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->C(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/j$a;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    iget v7, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 141
    .line 142
    invoke-virtual {v6, v2, v7, v1, v5}, Lcom/google/android/exoplayer2/source/j$a;->q(Ll/mtv;ILjava/io/IOException;Z)V

    .line 143
    .line 144
    .line 145
    if-nez v4, :cond_6

    .line 146
    .line 147
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 148
    .line 149
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->D(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/upstream/c;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    iget-wide v0, p1, Lcom/google/android/exoplayer2/upstream/d;->a:J

    .line 154
    .line 155
    invoke-interface {p0, v0, v1}, Lcom/google/android/exoplayer2/upstream/c;->c(J)V

    .line 156
    .line 157
    .line 158
    :cond_6
    return-object v3

    .line 159
    :cond_7
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 160
    .line 161
    .line 162
    move-result-wide v3

    .line 163
    iput-wide v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->g:J

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->l()V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 169
    .line 170
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->C(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Lcom/google/android/exoplayer2/source/j$a;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-static {p0}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    check-cast p0, Lcom/google/android/exoplayer2/source/j$a;

    .line 179
    .line 180
    iget v0, p1, Lcom/google/android/exoplayer2/upstream/d;->c:I

    .line 181
    .line 182
    invoke-virtual {p0, v2, v0, v1, v5}, Lcom/google/android/exoplayer2/source/j$a;->q(Ll/mtv;ILjava/io/IOException;Z)V

    .line 183
    .line 184
    .line 185
    sget-object p0, Lcom/google/android/exoplayer2/upstream/Loader;->f:Lcom/google/android/exoplayer2/upstream/Loader$c;

    .line 186
    .line 187
    return-object p0
.end method

.method public final v(Lcom/google/android/exoplayer2/source/hls/playlist/b;Ll/mtv;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->e:J

    .line 8
    .line 9
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 10
    .line 11
    invoke-static {v3, v0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->t(Lcom/google/android/exoplayer2/source/hls/playlist/a;Lcom/google/android/exoplayer2/source/hls/playlist/b;Lcom/google/android/exoplayer2/source/hls/playlist/b;)Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iput-object v3, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-eq v3, v0, :cond_0

    .line 19
    .line 20
    iput-object v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->j:Ljava/io/IOException;

    .line 21
    .line 22
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->f:J

    .line 23
    .line 24
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 27
    .line 28
    invoke-static {p1, p2, v3}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->u(Lcom/google/android/exoplayer2/source/hls/playlist/a;Landroid/net/Uri;Lcom/google/android/exoplayer2/source/hls/playlist/b;)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-boolean v3, v3, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 33
    .line 34
    if-nez v3, :cond_3

    .line 35
    .line 36
    iget-wide v5, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 37
    .line 38
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->r:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    int-to-long v7, p1

    .line 45
    add-long/2addr v5, v7

    .line 46
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 47
    .line 48
    iget-wide v7, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->k:J

    .line 49
    .line 50
    cmp-long v3, v5, v7

    .line 51
    .line 52
    const/4 v5, 0x1

    .line 53
    if-gez v3, :cond_1

    .line 54
    .line 55
    new-instance v4, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$PlaylistResetException;

    .line 56
    .line 57
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 58
    .line 59
    invoke-direct {v4, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$PlaylistResetException;-><init>(Landroid/net/Uri;)V

    .line 60
    .line 61
    .line 62
    move v3, v5

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-wide v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->f:J

    .line 65
    .line 66
    sub-long v6, v1, v6

    .line 67
    .line 68
    long-to-double v6, v6

    .line 69
    iget-wide v8, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->m:J

    .line 70
    .line 71
    invoke-static {v8, v9}, Ll/bmk0;->l1(J)J

    .line 72
    .line 73
    .line 74
    move-result-wide v8

    .line 75
    long-to-double v8, v8

    .line 76
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->v(Lcom/google/android/exoplayer2/source/hls/playlist/a;)D

    .line 79
    .line 80
    .line 81
    move-result-wide v10

    .line 82
    mul-double/2addr v8, v10

    .line 83
    cmpl-double p1, v6, v8

    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    if-lez p1, :cond_2

    .line 87
    .line 88
    new-instance v4, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$PlaylistStuckException;

    .line 89
    .line 90
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 91
    .line 92
    invoke-direct {v4, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$PlaylistStuckException;-><init>(Landroid/net/Uri;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_0
    if-eqz v4, :cond_3

    .line 96
    .line 97
    iput-object v4, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->j:Ljava/io/IOException;

    .line 98
    .line 99
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 100
    .line 101
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 102
    .line 103
    new-instance v7, Lcom/google/android/exoplayer2/upstream/c$c;

    .line 104
    .line 105
    new-instance v8, Ll/ktx;

    .line 106
    .line 107
    const/4 v9, 0x4

    .line 108
    invoke-direct {v8, v9}, Ll/ktx;-><init>(I)V

    .line 109
    .line 110
    .line 111
    invoke-direct {v7, p2, v8, v4, v5}, Lcom/google/android/exoplayer2/upstream/c$c;-><init>(Ll/mtv;Ll/ktx;Ljava/io/IOException;I)V

    .line 112
    .line 113
    .line 114
    invoke-static {p1, v6, v7, v3}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->m(Lcom/google/android/exoplayer2/source/hls/playlist/a;Landroid/net/Uri;Lcom/google/android/exoplayer2/upstream/c$c;Z)Z

    .line 115
    .line 116
    .line 117
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 118
    .line 119
    iget-object p2, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->v:Lcom/google/android/exoplayer2/source/hls/playlist/b$f;

    .line 120
    .line 121
    iget-boolean p2, p2, Lcom/google/android/exoplayer2/source/hls/playlist/b$f;->e:Z

    .line 122
    .line 123
    if-nez p2, :cond_5

    .line 124
    .line 125
    if-eq p1, v0, :cond_4

    .line 126
    .line 127
    iget-wide p1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->m:J

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_4
    iget-wide p1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->m:J

    .line 131
    .line 132
    const-wide/16 v3, 0x2

    .line 133
    .line 134
    div-long/2addr p1, v3

    .line 135
    goto :goto_2

    .line 136
    :cond_5
    const-wide/16 p1, 0x0

    .line 137
    .line 138
    :goto_2
    invoke-static {p1, p2}, Ll/bmk0;->l1(J)J

    .line 139
    .line 140
    .line 141
    move-result-wide p1

    .line 142
    add-long/2addr v1, p1

    .line 143
    iput-wide v1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->g:J

    .line 144
    .line 145
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 146
    .line 147
    iget-wide p1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->n:J

    .line 148
    .line 149
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    cmp-long p1, p1, v0

    .line 155
    .line 156
    if-nez p1, :cond_7

    .line 157
    .line 158
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->a:Landroid/net/Uri;

    .line 159
    .line 160
    iget-object p2, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->k:Lcom/google/android/exoplayer2/source/hls/playlist/a;

    .line 161
    .line 162
    invoke-static {p2}, Lcom/google/android/exoplayer2/source/hls/playlist/a;->w(Lcom/google/android/exoplayer2/source/hls/playlist/a;)Landroid/net/Uri;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-virtual {p1, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-eqz p1, :cond_6

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_6
    return-void

    .line 174
    :cond_7
    :goto_3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->d:Lcom/google/android/exoplayer2/source/hls/playlist/b;

    .line 175
    .line 176
    iget-boolean p1, p1, Lcom/google/android/exoplayer2/source/hls/playlist/b;->o:Z

    .line 177
    .line 178
    if-nez p1, :cond_8

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->i()Landroid/net/Uri;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->p(Landroid/net/Uri;)V

    .line 185
    .line 186
    .line 187
    :cond_8
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/hls/playlist/a$c;->b:Lcom/google/android/exoplayer2/upstream/Loader;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/upstream/Loader;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
