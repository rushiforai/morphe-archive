.class public final Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# static fields
.field public static final synthetic p:I


# instance fields
.field public final c:Ll/g5l;

.field public d:Ll/h5l;

.field public e:Ll/n5l;

.field public f:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$a;

.field public g:Ll/et5;

.field public h:Ll/zb5$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/zde;

.field public j:Lcom/google/android/exoplayer2/upstream/c;

.field public k:Z

.field public l:I

.field public m:Z

.field public n:J

.field public o:J


# direct methods
.method public constructor <init>(Ll/g5l;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/g5l;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->c:Ll/g5l;

    .line 11
    .line 12
    new-instance p1, Lcom/google/android/exoplayer2/drm/a;

    .line 13
    .line 14
    invoke-direct {p1}, Lcom/google/android/exoplayer2/drm/a;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->i:Ll/zde;

    .line 18
    .line 19
    new-instance p1, Ll/gpd;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/gpd;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->e:Ll/n5l;

    .line 25
    .line 26
    sget-object p1, Lcom/google/android/exoplayer2/source/hls/playlist/a;->p:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$a;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->f:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$a;

    .line 29
    .line 30
    sget-object p1, Ll/h5l;->a:Ll/h5l;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->d:Ll/h5l;

    .line 33
    .line 34
    new-instance p1, Lcom/google/android/exoplayer2/upstream/b;

    .line 35
    .line 36
    invoke-direct {p1}, Lcom/google/android/exoplayer2/upstream/b;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->j:Lcom/google/android/exoplayer2/upstream/c;

    .line 40
    .line 41
    new-instance p1, Ll/snd;

    .line 42
    .line 43
    invoke-direct {p1}, Ll/snd;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->g:Ll/et5;

    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    iput p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->l:I

    .line 50
    .line 51
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    iput-wide v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->n:J

    .line 57
    .line 58
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->k:Z

    .line 59
    .line 60
    return-void
.end method

.method public constructor <init>(Ll/g6c$a;)V
    .locals 1

    .line 61
    new-instance v0, Ll/epd;

    invoke-direct {v0, p1}, Ll/epd;-><init>(Ll/g6c$a;)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;-><init>(Ll/g5l;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/zde;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->g(Ll/zde;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/i;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->e(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic d(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->f(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 6
    .line 7
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->e:Ll/n5l;

    .line 11
    .line 12
    iget-object v3, v1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 13
    .line 14
    iget-object v3, v3, Lcom/google/android/exoplayer2/n$h;->e:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-nez v4, :cond_0

    .line 21
    .line 22
    new-instance v4, Ll/mni;

    .line 23
    .line 24
    invoke-direct {v4, v2, v3}, Ll/mni;-><init>(Ll/n5l;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    move-object v2, v4

    .line 28
    :cond_0
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->h:Ll/zb5$a;

    .line 29
    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-interface {v3, v1}, Ll/zb5$a;->a(Lcom/google/android/exoplayer2/n;)Ll/zb5;

    .line 34
    .line 35
    .line 36
    :goto_0
    new-instance v3, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;

    .line 37
    .line 38
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->c:Ll/g5l;

    .line 39
    .line 40
    move-object v5, v3

    .line 41
    iget-object v3, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->d:Ll/h5l;

    .line 42
    .line 43
    move-object v6, v4

    .line 44
    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->g:Ll/et5;

    .line 45
    .line 46
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->i:Ll/zde;

    .line 47
    .line 48
    invoke-interface {v7, v1}, Ll/zde;->a(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/drm/c;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    move-object v8, v6

    .line 53
    move-object v6, v7

    .line 54
    iget-object v7, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->j:Lcom/google/android/exoplayer2/upstream/c;

    .line 55
    .line 56
    iget-object v9, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->f:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$a;

    .line 57
    .line 58
    iget-object v10, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->c:Ll/g5l;

    .line 59
    .line 60
    invoke-interface {v9, v10, v7, v2}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker$a;->a(Ll/g5l;Lcom/google/android/exoplayer2/upstream/c;Ll/n5l;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-wide v9, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->n:J

    .line 65
    .line 66
    iget-boolean v11, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->k:Z

    .line 67
    .line 68
    iget v12, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->l:I

    .line 69
    .line 70
    iget-boolean v13, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->m:Z

    .line 71
    .line 72
    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->o:J

    .line 73
    .line 74
    const/16 v16, 0x0

    .line 75
    .line 76
    move-object v0, v5

    .line 77
    const/4 v5, 0x0

    .line 78
    move-object/from16 v17, v8

    .line 79
    .line 80
    move-object v8, v2

    .line 81
    move-object/from16 v2, v17

    .line 82
    .line 83
    invoke-direct/range {v0 .. v16}, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource;-><init>(Lcom/google/android/exoplayer2/n;Ll/g5l;Ll/h5l;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;JZIZJLcom/google/android/exoplayer2/source/hls/HlsMediaSource$a;)V

    .line 84
    .line 85
    .line 86
    return-object v0
.end method

.method public f(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/zb5$a;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->h:Ll/zb5$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public g(Ll/zde;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;
    .locals 1

    .line 1
    const-string v0, "MediaSource.Factory#setDrmSessionManagerProvider no longer handles null by instantiating a new DefaultDrmSessionManagerProvider. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/zde;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->i:Ll/zde;

    .line 10
    .line 11
    return-object p0
.end method

.method public h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;
    .locals 1

    .line 1
    const-string v0, "MediaSource.Factory#setLoadErrorHandlingPolicy no longer handles null by instantiating a new DefaultLoadErrorHandlingPolicy. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/w11;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/google/android/exoplayer2/upstream/c;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsMediaSource$Factory;->j:Lcom/google/android/exoplayer2/upstream/c;

    .line 10
    .line 11
    return-object p0
.end method
