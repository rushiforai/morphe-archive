.class public Ll/p410;
.super Ll/eas;
.source "SourceFile"

# interfaces
.implements Ll/xzl;


# instance fields
.field public a:Ll/v6m;

.field public final b:Ll/u1f;

.field public c:Ll/x20;

.field public d:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z


# direct methods
.method public constructor <init>(Ll/u1f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p410;->b:Ll/u1f;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->N(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->P(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/p410;->d:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public S0(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/v6m;->b0(Ljava/lang/String;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/v6m;->y(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    .locals 3

    .line 1
    :try_start_0
    const-class v0, Ll/p410;

    .line 2
    .line 3
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    :try_start_1
    iget-object v1, p0, Ll/p410;->a:Ll/v6m;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    iput-boolean v2, p0, Ll/p410;->e:Z

    .line 10
    .line 11
    invoke-interface {v1, p1, p2, p3}, Ll/v6m;->R(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit v0

    .line 18
    goto :goto_2

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_2
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public V0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p410;->b:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->b:Ll/v6m;

    .line 4
    .line 5
    iput-object v0, p0, Ll/p410;->a:Ll/v6m;

    .line 6
    .line 7
    return-void
.end method

.method public W0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p410;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public X0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/p410;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/p410;->a:Ll/v6m;

    .line 5
    .line 6
    const-string v1, "[live][motion]"

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p0, "mLiveEngine == null  "

    .line 11
    .line 12
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {v0}, Ll/v6m;->T()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/p410;->c:Ll/x20;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-string v0, " \u6267\u884cleaveRoom \u540e\u7684\u56de\u8c03 "

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/p410;->c:Ll/x20;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Ll/p410;->c:Ll/x20;

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const-string p0, " leaveRoom \u540e\u7684\u56de\u8c03 \u4e3anull  "

    .line 38
    .line 39
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public Y(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->P(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ll/v6m;->d0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public Z0()V
    .locals 2

    .line 1
    const-string v0, "[live]sdk_engine"

    .line 2
    .line 3
    const-string v1, "onResume"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-interface {p0, v0}, Ll/v6m;->d0(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public declared-synchronized a1()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Ll/p410;->a:Ll/v6m;

    .line 4
    .line 5
    iput-object v0, p0, Ll/p410;->d:Ll/qcj;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public b1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p410;->c:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public c1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->J(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d1(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->Y(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->S(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->L(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

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

.method public h1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->G(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p410;->d:Ll/qcj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-interface {p0, p1}, Ll/v6m;->A(F)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    if-eqz p1, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    :goto_0
    invoke-interface {p0, p1}, Ll/v6m;->A(F)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public i1(Ll/cgu;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->j0(Ll/cgu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->U(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->B(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->f0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->I(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
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
    const-string v1, "[live]sdk_engine"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/v6m;->n(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public n1()V
    .locals 2

    .line 1
    const-string v0, "[live]sdk_engine"

    .line 2
    .line 3
    const-string v1, "stopPush"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/v6m;->X()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateChannelKey:"

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
    const-string v1, "[live]sdk_engine"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/v6m;->o(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public o1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->W(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p410;->a:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->p(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
