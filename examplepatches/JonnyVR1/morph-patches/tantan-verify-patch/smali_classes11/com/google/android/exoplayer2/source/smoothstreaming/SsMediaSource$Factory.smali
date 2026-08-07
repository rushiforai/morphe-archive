.class public final Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# static fields
.field public static final synthetic k:I


# instance fields
.field public final c:Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

.field public final d:Ll/g6c$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/et5;

.field public f:Ll/zb5$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Ll/zde;

.field public h:Lcom/google/android/exoplayer2/upstream/c;

.field public i:J

.field public j:Lcom/google/android/exoplayer2/upstream/d$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+",
            "Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/g6c$a;)V
    .locals 0
    .param p2    # Ll/g6c$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

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
    check-cast p1, Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->c:Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->d:Ll/g6c$a;

    .line 13
    .line 14
    new-instance p1, Lcom/google/android/exoplayer2/drm/a;

    .line 15
    .line 16
    invoke-direct {p1}, Lcom/google/android/exoplayer2/drm/a;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->g:Ll/zde;

    .line 20
    .line 21
    new-instance p1, Lcom/google/android/exoplayer2/upstream/b;

    .line 22
    .line 23
    invoke-direct {p1}, Lcom/google/android/exoplayer2/upstream/b;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 27
    .line 28
    const-wide/16 p1, 0x7530

    .line 29
    .line 30
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->i:J

    .line 31
    .line 32
    new-instance p1, Ll/snd;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/snd;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->e:Ll/et5;

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Ll/g6c$a;)V
    .locals 1

    .line 40
    new-instance v0, Lcom/google/android/exoplayer2/source/smoothstreaming/a$a;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/a$a;-><init>(Ll/g6c$a;)V

    invoke-direct {p0, v0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;-><init>(Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/g6c$a;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/zde;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->g(Ll/zde;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;

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
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;

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
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->e(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;

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
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->f(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;
    .locals 13

    .line 1
    iget-object v2, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 2
    .line 3
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->j:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifestParser;

    .line 11
    .line 12
    invoke-direct {v2}, Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/SsManifestParser;-><init>()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v3, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 16
    .line 17
    iget-object v3, v3, Lcom/google/android/exoplayer2/n$h;->e:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-nez v4, :cond_1

    .line 24
    .line 25
    new-instance v4, Ll/nni;

    .line 26
    .line 27
    invoke-direct {v4, v2, v3}, Ll/nni;-><init>(Lcom/google/android/exoplayer2/upstream/d$a;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move-object v4, v2

    .line 32
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->f:Ll/zb5$a;

    .line 33
    .line 34
    if-nez v2, :cond_2

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    invoke-interface {v2, p1}, Ll/zb5$a;->a(Lcom/google/android/exoplayer2/n;)Ll/zb5;

    .line 38
    .line 39
    .line 40
    :goto_1
    new-instance v2, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->d:Ll/g6c$a;

    .line 43
    .line 44
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->c:Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;

    .line 45
    .line 46
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->e:Ll/et5;

    .line 47
    .line 48
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->g:Ll/zde;

    .line 49
    .line 50
    invoke-interface {v7, p1}, Ll/zde;->a(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/drm/c;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 55
    .line 56
    iget-wide v10, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->i:J

    .line 57
    .line 58
    const/4 v12, 0x0

    .line 59
    move-object v0, v2

    .line 60
    const/4 v2, 0x0

    .line 61
    const/4 v7, 0x0

    .line 62
    move-object v1, p1

    .line 63
    invoke-direct/range {v0 .. v12}, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource;-><init>(Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/source/smoothstreaming/manifest/a;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/smoothstreaming/b$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;JLcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$a;)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public f(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;
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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->f:Ll/zb5$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public g(Ll/zde;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;
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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->g:Ll/zde;

    .line 10
    .line 11
    return-object p0
.end method

.method public h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;
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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/smoothstreaming/SsMediaSource$Factory;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 10
    .line 11
    return-object p0
.end method
