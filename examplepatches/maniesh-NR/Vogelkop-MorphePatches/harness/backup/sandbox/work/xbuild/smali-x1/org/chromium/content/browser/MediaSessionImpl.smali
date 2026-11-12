.class public final Lorg/chromium/content/browser/MediaSessionImpl;
.super Lorg/chromium/content_public/browser/MediaSession;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Lh7f;

.field public final c:Lg7f;

.field public d:Z

.field public e:B

.field public f:Lorg/chromium/services/media_session/MediaMetadata;

.field public g:Ljava/util/List;

.field public h:Ljava/util/HashSet;

.field public i:Lorg/chromium/services/media_session/MediaPosition;


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->b:Lh7f;

    new-instance p2, Lg7f;

    invoke-direct {p2, p1}, Lg7f;-><init>(Lh7f;)V

    iput-object p2, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    return-void
.end method

.method public static create(J)Lorg/chromium/content/browser/MediaSessionImpl;
    .registers 3

    new-instance v0, Lorg/chromium/content/browser/MediaSessionImpl;

    invoke-direct {v0, p0, p1}, Lorg/chromium/content/browser/MediaSessionImpl;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public final a(Lzqd;)V
    .registers 6

    iget-object v0, p1, Lzqd;->c:Lard;

    iget-object v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->b:Lh7f;

    invoke-virtual {v1, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-byte v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->e:B

    if-eqz v1, :cond_16

    iget-boolean v2, p0, Lorg/chromium/content/browser/MediaSessionImpl;->d:Z

    const/4 v3, 0x2

    if-ne v1, v3, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    :goto_13
    invoke-virtual {p1, v2, v1}, Lzqd;->b(ZZ)V

    :cond_16
    iget-object v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->f:Lorg/chromium/services/media_session/MediaMetadata;

    if-eqz v1, :cond_1f

    iput-object v1, v0, Lard;->n:Lorg/chromium/services/media_session/MediaMetadata;

    invoke-virtual {v0}, Lard;->i()V

    :cond_1f
    iget-object v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->g:Ljava/util/List;

    if-eqz v1, :cond_26

    invoke-virtual {p1, v1}, Lzqd;->a(Ljava/util/List;)V

    :cond_26
    iget-object p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->i:Lorg/chromium/services/media_session/MediaPosition;

    if-eqz p1, :cond_3b

    iput-object p1, v0, Lard;->r:Lorg/chromium/services/media_session/MediaPosition;

    invoke-virtual {v0}, Lard;->e()Z

    move-result p1

    if-nez p1, :cond_3b

    iget-object p1, v0, Lard;->l:Likd;

    iget-object v1, v0, Lard;->r:Lorg/chromium/services/media_session/MediaPosition;

    iput-object v1, p1, Likd;->n:Lorg/chromium/services/media_session/MediaPosition;

    invoke-virtual {v0}, Lard;->g()V

    :cond_3b
    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->h:Ljava/util/HashSet;

    if-eqz p0, :cond_50

    iput-object p0, v0, Lard;->q:Ljava/util/HashSet;

    invoke-virtual {v0}, Lard;->e()Z

    move-result p0

    if-nez p0, :cond_50

    iget-object p0, v0, Lard;->l:Likd;

    iget-object p1, v0, Lard;->q:Ljava/util/HashSet;

    iput-object p1, p0, Likd;->m:Ljava/util/HashSet;

    invoke-virtual {v0}, Lard;->g()V

    :cond_50
    return-void
.end method

.method public final b(I)V
    .registers 4

    iget-wide v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MAqRqyJa(JI)V

    return-void
.end method

.method public final c(Lzqd;)V
    .registers 2

    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d()V
    .registers 4

    const/4 v0, 0x1

    iget-wide v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    invoke-static {v1, v2, v0}, LJ/N;->MlezJYnz(JI)V

    return-void
.end method

.method public final e(J)V
    .registers 5

    iget-wide v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    invoke-static {v0, v1, p1, p2}, LJ/N;->MK7btVfc(JJ)V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-wide v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    invoke-static {v0, v1}, LJ/N;->MW5s36cs(J)V

    return-void
.end method

.method public final g()V
    .registers 4

    const/4 v0, 0x1

    iget-wide v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    invoke-static {v1, v2, v0}, LJ/N;->M5LC9gX$(JI)V

    return-void
.end method

.method public final hasObservers()Z
    .registers 1

    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->b:Lh7f;

    invoke-virtual {p0}, Lh7f;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final mediaSessionActionsChanged([I)V
    .registers 6

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_15

    aget v3, p1, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_15
    iput-object v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->h:Ljava/util/HashSet;

    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    invoke-virtual {p0}, Lg7f;->b()V

    :cond_1c
    :goto_1c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzqd;

    iget-object p1, p1, Lzqd;->c:Lard;

    iput-object v0, p1, Lard;->q:Ljava/util/HashSet;

    invoke-virtual {p1}, Lard;->e()Z

    move-result v1

    if-nez v1, :cond_1c

    iget-object v1, p1, Lard;->l:Likd;

    iget-object v2, p1, Lard;->q:Ljava/util/HashSet;

    iput-object v2, v1, Likd;->m:Ljava/util/HashSet;

    invoke-virtual {p1}, Lard;->g()V

    goto :goto_1c

    :cond_3c
    return-void
.end method

.method public final mediaSessionArtworkChanged([Lorg/chromium/services/media_session/MediaImage;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->g:Ljava/util/List;

    iget-object p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    invoke-virtual {p1}, Lg7f;->b()V

    :goto_b
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzqd;

    iget-object v1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->g:Ljava/util/List;

    invoke-virtual {v0, v1}, Lzqd;->a(Ljava/util/List;)V

    goto :goto_b

    :cond_1d
    return-void
.end method

.method public final mediaSessionDestroyed()V
    .registers 9

    iget-object v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    invoke-virtual {v0}, Lg7f;->b()V

    :goto_5
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_41

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzqd;

    iget-object v4, v1, Lzqd;->c:Lard;

    iget-object v5, v4, Lard;->u:Lk03;

    iget-wide v6, v5, Lk03;->a:J

    cmp-long v2, v6, v2

    if-ltz v2, :cond_2d

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v6, v5, Lk03;->a:J

    sub-long v6, v2, v6

    iput-wide v6, v5, Lk03;->c:J

    iput-wide v2, v5, Lk03;->b:J

    const-wide/16 v2, -0x1

    iput-wide v2, v5, Lk03;->a:J

    :cond_2d
    iget-object v2, v4, Lard;->c:Lepd;

    iget-object v1, v1, Lzqd;->b:Lorg/chromium/content_public/browser/MediaSession;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v3}, Lepd;->a(Lorg/chromium/content_public/browser/MediaSession;ZZ)V

    iget-object v2, v4, Lard;->d:Levn;

    invoke-virtual {v2, v1}, Lsc;->n(Ljava/lang/Object;)V

    invoke-virtual {v4}, Lard;->c()V

    invoke-virtual {v4}, Lard;->a()V

    goto :goto_5

    :cond_41
    invoke-virtual {v0}, Lg7f;->b()V

    :cond_44
    :goto_44
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzqd;

    iget-object v4, v1, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    if-eqz v4, :cond_44

    invoke-virtual {v4, v1}, Lorg/chromium/content_public/browser/MediaSession;->c(Lzqd;)V

    const/4 v4, 0x0

    iput-object v4, v1, Lzqd;->a:Lorg/chromium/content_public/browser/MediaSession;

    goto :goto_44

    :cond_5b
    iget-object v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->b:Lh7f;

    invoke-virtual {v0}, Lh7f;->clear()V

    iput-wide v2, p0, Lorg/chromium/content/browser/MediaSessionImpl;->a:J

    return-void
.end method

.method public final mediaSessionMetadataChanged(Lorg/chromium/services/media_session/MediaMetadata;)V
    .registers 3

    iput-object p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->f:Lorg/chromium/services/media_session/MediaMetadata;

    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    invoke-virtual {p0}, Lg7f;->b()V

    :goto_7
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzqd;

    iget-object v0, v0, Lzqd;->c:Lard;

    iput-object p1, v0, Lard;->n:Lorg/chromium/services/media_session/MediaMetadata;

    invoke-virtual {v0}, Lard;->i()V

    goto :goto_7

    :cond_1b
    return-void
.end method

.method public final mediaSessionPositionChanged(Lorg/chromium/services/media_session/MediaPosition;)V
    .registers 5

    iput-object p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->i:Lorg/chromium/services/media_session/MediaPosition;

    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    invoke-virtual {p0}, Lg7f;->b()V

    :cond_7
    :goto_7
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzqd;

    iget-object v0, v0, Lzqd;->c:Lard;

    iput-object p1, v0, Lard;->r:Lorg/chromium/services/media_session/MediaPosition;

    invoke-virtual {v0}, Lard;->e()Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, v0, Lard;->l:Likd;

    iget-object v2, v0, Lard;->r:Lorg/chromium/services/media_session/MediaPosition;

    iput-object v2, v1, Likd;->n:Lorg/chromium/services/media_session/MediaPosition;

    invoke-virtual {v0}, Lard;->g()V

    goto :goto_7

    :cond_27
    return-void
.end method

.method public final mediaSessionStateChanged(ZZ)V
    .registers 4

    iput-boolean p1, p0, Lorg/chromium/content/browser/MediaSessionImpl;->d:Z

    if-eqz p2, :cond_6

    const/4 v0, 0x2

    goto :goto_7

    :cond_6
    const/4 v0, 0x1

    :goto_7
    iput-byte v0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->e:B

    iget-object p0, p0, Lorg/chromium/content/browser/MediaSessionImpl;->c:Lg7f;

    invoke-virtual {p0}, Lg7f;->b()V

    :goto_e
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzqd;

    invoke-virtual {v0, p1, p2}, Lzqd;->b(ZZ)V

    goto :goto_e

    :cond_1e
    return-void
.end method
