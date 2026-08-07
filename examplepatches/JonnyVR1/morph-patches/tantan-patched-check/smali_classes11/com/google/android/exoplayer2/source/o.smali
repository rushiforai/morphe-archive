.class public final Lcom/google/android/exoplayer2/source/o;
.super Lcom/google/android/exoplayer2/source/a;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/n$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/o$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/n;

.field public final b:Lcom/google/android/exoplayer2/n$h;

.field public final c:Ll/g6c$a;

.field public final d:Lcom/google/android/exoplayer2/source/m$a;

.field public final e:Lcom/google/android/exoplayer2/drm/c;

.field public final f:Lcom/google/android/exoplayer2/upstream/c;

.field public final g:I

.field public h:Z

.field public i:J

.field public j:Z

.field public k:Z

.field public l:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/n;Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/a;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/exoplayer2/n;->b:Lcom/google/android/exoplayer2/n$h;

    .line 5
    .line 6
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/google/android/exoplayer2/n$h;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/o;->b:Lcom/google/android/exoplayer2/n$h;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/o;->a:Lcom/google/android/exoplayer2/n;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/o;->c:Ll/g6c$a;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/o;->d:Lcom/google/android/exoplayer2/source/m$a;

    .line 19
    .line 20
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/o;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 21
    .line 22
    iput-object p5, p0, Lcom/google/android/exoplayer2/source/o;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 23
    .line 24
    iput p6, p0, Lcom/google/android/exoplayer2/source/o;->g:I

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/o;->h:Z

    .line 28
    .line 29
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/o;->i:J

    .line 35
    .line 36
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n;Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;ILcom/google/android/exoplayer2/source/o$a;)V
    .locals 0

    .line 37
    invoke-direct/range {p0 .. p6}, Lcom/google/android/exoplayer2/source/o;-><init>(Lcom/google/android/exoplayer2/n;Ll/g6c$a;Lcom/google/android/exoplayer2/source/m$a;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/upstream/c;I)V

    return-void
.end method


# virtual methods
.method public a(JZZ)V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-wide p1, p0, Lcom/google/android/exoplayer2/source/o;->i:J

    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/o;->h:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/o;->i:J

    .line 17
    .line 18
    cmp-long v0, v0, p1

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/o;->j:Z

    .line 23
    .line 24
    if-ne v0, p3, :cond_1

    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/source/o;->k:Z

    .line 27
    .line 28
    if-ne v0, p4, :cond_1

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/o;->i:J

    .line 32
    .line 33
    iput-boolean p3, p0, Lcom/google/android/exoplayer2/source/o;->j:Z

    .line 34
    .line 35
    iput-boolean p4, p0, Lcom/google/android/exoplayer2/source/o;->k:Z

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/o;->h:Z

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/o;->b()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final b()V
    .locals 8

    .line 1
    new-instance v0, Ll/lqf0;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/o;->i:J

    .line 4
    .line 5
    iget-boolean v3, p0, Lcom/google/android/exoplayer2/source/o;->j:Z

    .line 6
    .line 7
    iget-boolean v5, p0, Lcom/google/android/exoplayer2/source/o;->k:Z

    .line 8
    .line 9
    const/4 v6, 0x0

    .line 10
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/o;->a:Lcom/google/android/exoplayer2/n;

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-direct/range {v0 .. v7}, Ll/lqf0;-><init>(JZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/google/android/exoplayer2/source/o;->h:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Lcom/google/android/exoplayer2/source/o$a;

    .line 21
    .line 22
    invoke-direct {v1, p0, v0}, Lcom/google/android/exoplayer2/source/o$a;-><init>(Lcom/google/android/exoplayer2/source/o;Lcom/google/android/exoplayer2/c0;)V

    .line 23
    .line 24
    .line 25
    move-object v0, v1

    .line 26
    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/a;->refreshSourceInfo(Lcom/google/android/exoplayer2/c0;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/o;->c:Ll/g6c$a;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/g6c$a;->a()Ll/g6c;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/o;->l:Ll/pgj0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v2, v0}, Ll/g6c;->e(Ll/pgj0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/source/n;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/o;->b:Lcom/google/android/exoplayer2/n$h;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/google/android/exoplayer2/n$h;->a:Landroid/net/Uri;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/o;->d:Lcom/google/android/exoplayer2/source/m$a;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/a;->getPlayerId()Ll/bf80;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-interface {v3, v4}, Lcom/google/android/exoplayer2/source/m$a;->a(Ll/bf80;)Lcom/google/android/exoplayer2/source/m;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/o;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 31
    .line 32
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/a;->createDrmEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/drm/b$a;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v6, p0, Lcom/google/android/exoplayer2/source/o;->f:Lcom/google/android/exoplayer2/upstream/c;

    .line 37
    .line 38
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer2/source/a;->createEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/j$a;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    iget-object v9, p0, Lcom/google/android/exoplayer2/source/o;->b:Lcom/google/android/exoplayer2/n$h;

    .line 43
    .line 44
    iget-object v10, v9, Lcom/google/android/exoplayer2/n$h;->f:Ljava/lang/String;

    .line 45
    .line 46
    iget v11, p0, Lcom/google/android/exoplayer2/source/o;->g:I

    .line 47
    .line 48
    move-object v8, p0

    .line 49
    move-object v9, p2

    .line 50
    invoke-direct/range {v0 .. v11}, Lcom/google/android/exoplayer2/source/n;-><init>(Landroid/net/Uri;Ll/g6c;Lcom/google/android/exoplayer2/source/m;Lcom/google/android/exoplayer2/drm/c;Lcom/google/android/exoplayer2/drm/b$a;Lcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;Lcom/google/android/exoplayer2/source/n$b;Ll/oj0;Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    return-object v0
.end method

.method public getMediaItem()Lcom/google/android/exoplayer2/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/o;->a:Lcom/google/android/exoplayer2/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public maybeThrowSourceInfoRefreshError()V
    .locals 0

    return-void
.end method

.method public prepareSourceInternal(Ll/pgj0;)V
    .locals 2
    .param p1    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/o;->l:Ll/pgj0;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/o;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/os/Looper;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/a;->getPlayerId()Ll/bf80;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {p1, v0, v1}, Lcom/google/android/exoplayer2/drm/c;->d(Landroid/os/Looper;Ll/bf80;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/o;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 23
    .line 24
    invoke-interface {p1}, Lcom/google/android/exoplayer2/drm/c;->prepare()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/o;->b()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public releasePeriod(Lcom/google/android/exoplayer2/source/h;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/n;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/n;->b0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public releaseSourceInternal()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/o;->e:Lcom/google/android/exoplayer2/drm/c;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/google/android/exoplayer2/drm/c;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
