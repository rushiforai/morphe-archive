.class public final Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/dash/DashMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# static fields
.field public static final synthetic l:I


# instance fields
.field public final c:Lcom/google/android/exoplayer2/source/dash/a$a;

.field public final d:Ll/g6c$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/zb5$a;

.field public f:Ll/zde;

.field public g:Ll/et5;

.field public h:Lcom/google/android/exoplayer2/upstream/c;

.field public i:J

.field public j:J

.field public k:Lcom/google/android/exoplayer2/upstream/d$a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/d$a<",
            "+",
            "Ll/h4c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/dash/a$a;Ll/g6c$a;)V
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
    check-cast p1, Lcom/google/android/exoplayer2/source/dash/a$a;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->c:Lcom/google/android/exoplayer2/source/dash/a$a;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->d:Ll/g6c$a;

    .line 13
    .line 14
    new-instance p1, Lcom/google/android/exoplayer2/drm/a;

    .line 15
    .line 16
    invoke-direct {p1}, Lcom/google/android/exoplayer2/drm/a;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->f:Ll/zde;

    .line 20
    .line 21
    new-instance p1, Lcom/google/android/exoplayer2/upstream/b;

    .line 22
    .line 23
    invoke-direct {p1}, Lcom/google/android/exoplayer2/upstream/b;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 27
    .line 28
    const-wide/16 p1, 0x7530

    .line 29
    .line 30
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->i:J

    .line 31
    .line 32
    const-wide/32 p1, 0x4c4b40

    .line 33
    .line 34
    .line 35
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->j:J

    .line 36
    .line 37
    new-instance p1, Ll/snd;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/snd;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->g:Ll/et5;

    .line 43
    .line 44
    return-void
.end method

.method public constructor <init>(Ll/g6c$a;)V
    .locals 1

    .line 45
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/c$a;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/source/dash/c$a;-><init>(Ll/g6c$a;)V

    invoke-direct {p0, v0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;-><init>(Lcom/google/android/exoplayer2/source/dash/a$a;Ll/g6c$a;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/zde;)Lcom/google/android/exoplayer2/source/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->g(Ll/zde;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;

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
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;

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
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->e(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource;

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
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->f(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource;
    .locals 15

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    iget-object v0, v1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 4
    .line 5
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->k:Lcom/google/android/exoplayer2/upstream/d$a;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/i4c;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/i4c;-><init>()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v2, v1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/google/android/exoplayer2/n$h;->e:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    new-instance v3, Ll/nni;

    .line 28
    .line 29
    invoke-direct {v3, v0, v2}, Ll/nni;-><init>(Lcom/google/android/exoplayer2/upstream/d$a;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    move-object v4, v3

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    move-object v4, v0

    .line 35
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->e:Ll/zb5$a;

    .line 36
    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    invoke-interface {v0, v1}, Ll/zb5$a;->a(Lcom/google/android/exoplayer2/n;)Ll/zb5;

    .line 41
    .line 42
    .line 43
    :goto_1
    new-instance v0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->d:Ll/g6c$a;

    .line 46
    .line 47
    iget-object v5, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->c:Lcom/google/android/exoplayer2/source/dash/a$a;

    .line 48
    .line 49
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->g:Ll/et5;

    .line 50
    .line 51
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->f:Ll/zde;

    .line 52
    .line 53
    invoke-interface {v2, v1}, Ll/zde;->a(Lcom/google/android/exoplayer2/n;)Lcom/google/android/exoplayer2/drm/c;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 58
    .line 59
    iget-wide v10, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->i:J

    .line 60
    .line 61
    iget-wide v12, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->j:J

    .line 62
    .line 63
    const/4 v14, 0x0

    .line 64
    const/4 v2, 0x0

    .line 65
    const/4 v7, 0x0

    .line 66
    invoke-direct/range {v0 .. v14}, Lcom/google/android/exoplayer2/source/dash/DashMediaSource;-><init>(Lcom/google/android/exoplayer2/n;Ll/h4c;Ll/g6c$a;Lcom/google/android/exoplayer2/upstream/d$a;Lcom/google/android/exoplayer2/source/dash/a$a;Ll/et5;Ll/zb5;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;JJLcom/google/android/exoplayer2/source/dash/DashMediaSource$a;)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public f(Ll/zb5$a;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;
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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->e:Ll/zb5$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public g(Ll/zde;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;
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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->f:Ll/zde;

    .line 10
    .line 11
    return-object p0
.end method

.method public h(Lcom/google/android/exoplayer2/upstream/c;)Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;
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
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/dash/DashMediaSource$Factory;->h:Lcom/google/android/exoplayer2/upstream/c;

    .line 10
    .line 11
    return-object p0
.end method
