.class public Ll/e410;
.super Ll/g410;
.source "SourceFile"

# interfaces
.implements Ll/c410;


# instance fields
.field private B:Lcom/immomo/mediacore/audio/audio_Indicator;

.field C:Ll/dpl$a;

.field private D:Ll/dpl$a;


# direct methods
.method public constructor <init>(Ll/uow;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/g410;-><init>(Ll/uow;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/audio_Indicator;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 10
    .line 11
    iget p0, p1, Ll/uow;->B0:I

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/immomo/mediacore/audio/audio_Indicator;->setUserID(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E0(Ll/e410;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F0(Ll/e410;)Ll/rsy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410;->g:Ll/rsy;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G0(Ll/e410;)Ll/rsy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410;->g:Ll/rsy;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H0(Ll/e410;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q(Ll/e410;)Lcom/immomo/mediacore/audio/audio_Indicator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Ll/e410;)Ll/dpl$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e410;->D:Ll/dpl$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S(Ll/e410;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T(Ll/e410;)Ll/o410;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410;->b:Ll/o410;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public declared-synchronized C0(Ll/dpl;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    iput-object v0, p0, Ll/g410;->d:Ll/dpl;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_2

    .line 10
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/g410;->d:Ll/dpl;

    .line 11
    .line 12
    if-eq p1, v0, :cond_2

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ll/dpl;->F()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Ll/g410;->d:Ll/dpl;

    .line 21
    .line 22
    invoke-interface {v1}, Ll/dpl;->X()V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_1
    iput-object p1, p0, Ll/g410;->d:Ll/dpl;

    .line 28
    .line 29
    new-instance v1, Ll/e410$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/e410$a;-><init>(Ll/e410;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v1}, Ll/dpl;->L(Ll/dpl$a;)V

    .line 35
    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Ll/g410;->d:Ll/dpl;

    .line 40
    .line 41
    invoke-interface {p1}, Ll/dpl;->I1()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    :cond_2
    monitor-exit p0

    .line 45
    return-void

    .line 46
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw p1
.end method

.method public E(Ljava/lang/String;)Ll/wzl;
    .locals 1

    .line 1
    new-instance v0, Ll/k410;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/k410;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/g410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/AbstractMap;->size()I

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/g410;->g0(Ll/q210$b;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/g410;->B0(Ll/q210$d;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/g410;->h0(Ll/q210$c;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public declared-synchronized L(Ll/dpl$a;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/e410;->D:Ll/dpl$a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public V(Ll/z5m;)V
    .locals 2
    .param p1    # Ll/z5m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    iget-object v1, p0, Ll/g410;->h:Ll/uow;

    .line 4
    .line 5
    iget v1, v1, Ll/uow;->B0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/audio/audio_Indicator;->setUserID(I)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Ll/g410;->V(Ll/z5m;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->muteAudio(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Ll/uow;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410;->b:Ll/o410;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g410;->j0()Ll/g510;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/g410;->b:Ll/o410;

    .line 13
    .line 14
    new-instance v1, Ll/e410$c;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/e410$c;-><init>(Ll/e410;Ll/uow;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/g410;->j0()Ll/g510;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/g510;->m()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, p0}, Ll/o410;->W(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public c(Ll/uow;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410;->b:Ll/o410;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g410;->j0()Ll/g510;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/g410;->b:Ll/o410;

    .line 13
    .line 14
    new-instance v1, Ll/e410$b;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/e410$b;-><init>(Ll/e410;Ll/uow;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/g410;->j0()Ll/g510;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/g510;->m()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, p0}, Ll/o410;->W(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public d(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410;->b:Ll/o410;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g410;->j0()Ll/g510;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/g410;->b:Ll/o410;

    .line 13
    .line 14
    new-instance v1, Ll/e410$d;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/e410$d;-><init>(Ll/e410;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/g410;->j0()Ll/g510;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/g510;->m()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, p0}, Ll/o410;->W(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public n0(Ll/z5m;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    iget-object v1, p0, Ll/g410;->h:Ll/uow;

    .line 4
    .line 5
    iget v1, v1, Ll/uow;->B0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/audio/audio_Indicator;->setUserID(I)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Ll/g410;->n0(Ll/z5m;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/g410;->p(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/g410;->release()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/audio_Indicator;->release()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public y(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e410;->B:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/audio_Indicator;->enableAudioVolumeIndication(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
