.class public Ll/q410;
.super Ll/eas;
.source "SourceFile"

# interfaces
.implements Ll/yzl;


# instance fields
.field public a:Ll/v6m;

.field public final b:Ll/v1f;


# direct methods
.method public constructor <init>(Ll/v1f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q410;->b:Ll/v1f;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->N(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    .locals 1

    .line 1
    :try_start_0
    const-class v0, Ll/q410;

    .line 2
    .line 3
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    :try_start_1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->R(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    goto :goto_2

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :goto_2
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public T0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q410;->b:Ll/v1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/v1f;->b:Ll/v6m;

    .line 4
    .line 5
    iput-object v0, p0, Ll/q410;->a:Ll/v6m;

    .line 6
    .line 7
    return-void
.end method

.method public U0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "videoChat"

    .line 6
    .line 7
    const-string v0, "mLiveEngine == null  "

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-interface {p0}, Ll/v6m;->T()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public V0()V
    .locals 0

    .line 1
    return-void
.end method

.method public W0()V
    .locals 1

    .line 1
    const-string p0, "videoChat"

    .line 2
    .line 3
    const-string v0, "onResume"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized X0()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Ll/q410;->a:Ll/v6m;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public Y0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->S(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->L(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->c0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->G(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c1(Ll/cgu;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->j0(Ll/cgu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLocalAudioMute:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/v6m;->n(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " push engine updateChannelKey:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/q410;->a:Ll/v6m;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/v6m;->o(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
