.class public Ll/s210;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v6m;


# instance fields
.field public a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/momomediaext/MMLiveEngine;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;-><init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->v(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->u0(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->A0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->A()Ll/zmw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1, p2}, Ll/zmw;->M(II)Ll/zmw;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->O0(Ll/zmw;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public D([B)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->Z([B)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const/4 p2, -0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p2, 0x1

    .line 11
    :goto_0
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->repeatCount:I

    .line 12
    .line 13
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->musicUrl:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->R(Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public F(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public G(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->w0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H(Ll/wxh0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/wxh0;->b()Lcom/momo/mcamera/mask/MaskModel;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->t(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public I(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->D0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public J(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->b0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K(Ll/w6m;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/MMLiveEngine;->t0(Ll/enw;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/s210$a;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/s210$a;-><init>(Ll/s210;Ll/w6m;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/MMLiveEngine;->t0(Ll/enw;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public L(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->n0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i0(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->p0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->e0(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;->v0(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(Ll/wxh0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/wxh0;->b()Lcom/momo/mcamera/mask/MaskModel;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->V(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public R(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveEngine;->w(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->l0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized T()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->L()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
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

.method public U(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->F()Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->z0(Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V(Ljava/lang/String;Ll/wxh0;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/wxh0;->b()Lcom/momo/mcamera/mask/MaskModel;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;->s(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->M0(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->f0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(Ljava/lang/Boolean;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;->MMLiveAudioMixingDualMonoR:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object p1, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;->MMLiveAudioMixingDualMonoL:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->d0(Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioMixingDualMonoMode;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->G0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->k0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->T(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveEngine;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->O()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public c0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->B()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->g0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->A()Ll/zmw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->A()Ll/zmw;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/zmw;->d()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-ne p0, v1, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public e0(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveEngine;->N0(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->K0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->B0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()Ll/mob0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->C()Ll/mob0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->W()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->fromValue(I)Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->c0(Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h0(ILl/wxh0;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 4
    .line 5
    invoke-virtual {p2, p1}, Ll/wxh0;->c(I)Lcom/momo/mcamera/mask/MaskModel;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->t(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public i()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->E()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->z()Ll/kpl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->z()Ll/kpl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Ll/htl;->l(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->P()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j0(Ll/cgu;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-static {p1}, Ll/r1j;->b(Ll/cgu;)Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->y0(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->y()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/cnw;->i(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->q0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->o0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->P0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->a0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->X()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->N()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->S()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
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

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;->U(Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public selectAudioTrack(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->Y(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setMusicVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->r0(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopAllEffect()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->F0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->H0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->I0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/cnw;->h(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(ILjava/lang/String;ZZ)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    .line 4
    .line 5
    const/4 v8, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 8
    .line 9
    move v1, p1

    .line 10
    move-object v2, p2

    .line 11
    invoke-virtual/range {v0 .. v8}, Lcom/immomo/momomediaext/MMLiveEngine;->Q(ILjava/lang/String;IDDZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/MMLiveEngine;->Q0(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->s0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Ll/zmw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->C0(Ll/zmw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->m0(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->interval:I

    .line 7
    .line 8
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->smooth:I

    .line 9
    .line 10
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->h0(Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s210;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->i0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
