.class public Ll/xmj0;
.super Ll/fr2;
.source "SourceFile"

# interfaces
.implements Ll/hwl;


# instance fields
.field private A:Ll/gkl0;

.field private B:Ll/gbl0;

.field private C:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private D:Z

.field private E:Z

.field private F:I

.field private G:I

.field private H:I

.field private I:Z

.field private y:Ll/ebl0;

.field private z:Ll/fbl0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/c410;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/z5m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/momo/piplinemomoext/input/audio/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 33
    invoke-direct/range {p0 .. p5}, Ll/fr2;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Ll/xmj0;->D:Z

    .line 35
    iput-boolean p1, p0, Ll/xmj0;->E:Z

    const/4 p2, 0x2

    .line 36
    iput p2, p0, Ll/xmj0;->F:I

    const/4 p2, -0x1

    .line 37
    iput p2, p0, Ll/xmj0;->G:I

    .line 38
    iput p2, p0, Ll/xmj0;->H:I

    .line 39
    iput-boolean p1, p0, Ll/xmj0;->I:Z

    .line 40
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    move-result-object p0

    const-string p1, "createTxPusherPipeline"

    const-string p2, "tx"

    const-string p3, "TxPusherPipeline"

    invoke-virtual {p0, p3, p1, p2}, Ll/b7y;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/c410;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/z5m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/momo/piplinemomoext/input/audio/a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/fr2;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/xmj0;->D:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/xmj0;->E:Z

    .line 8
    .line 9
    const/4 p2, 0x2

    .line 10
    iput p2, p0, Ll/xmj0;->F:I

    .line 11
    .line 12
    const/4 p2, -0x1

    .line 13
    iput p2, p0, Ll/xmj0;->G:I

    .line 14
    .line 15
    iput p2, p0, Ll/xmj0;->H:I

    .line 16
    .line 17
    iput-boolean p1, p0, Ll/xmj0;->I:Z

    .line 18
    .line 19
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "createTxPusherPipeline"

    .line 24
    .line 25
    const-string p2, "tx"

    .line 26
    .line 27
    const-string p3, "TxPusherPipeline"

    .line 28
    .line 29
    invoke-virtual {p0, p3, p1, p2}, Ll/b7y;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public A0(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public A1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public B0(Ll/vpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public B1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public C0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public D(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public D0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public D1(Ll/zpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E0(I)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public E1(ZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public F(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/fr2;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public F0()V
    .locals 0

    .line 1
    return-void
.end method

.method public F1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public G(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public H0(Ll/wpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H1(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public I0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public J0(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public K(IIII)V
    .locals 0

    .line 1
    return-void
.end method

.method public K0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public K1(ILjava/lang/String;IDDZD)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public L(JF)V
    .locals 0

    .line 1
    return-void
.end method

.method public L0([B)V
    .locals 0

    .line 1
    return-void
.end method

.method public M(ID)V
    .locals 0

    .line 1
    return-void
.end method

.method public M0(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public M1(Ll/hwl$a;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/xmj0;->z:Ll/fbl0;

    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public N0(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public N1()V
    .locals 0

    .line 1
    return-void
.end method

.method public O0(Ll/upw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public P0(Ll/gbl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmj0;->B:Ll/gbl0;

    .line 2
    .line 3
    return-void
.end method

.method public P1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public Q0(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public Q1(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public R(Ll/fb1;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-super {p0, p1}, Ll/fr2;->R(Ll/fb1;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public T0(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->T0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public U(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W(ZLjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W0(ILl/hnw;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public W1(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->W1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X1(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmj0;->C:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    return-void
.end method

.method public Y0(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public Y1(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fr2;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->a(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0(Ll/ypw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public a2(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    invoke-super {p0}, Ll/fr2;->c()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public c0(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c1(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xmj0;->H:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/xmj0;->I:Z

    .line 4
    .line 5
    return-void
.end method

.method public c2(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fr2;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fr2;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public f2(I)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->f2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g0(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->g0(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getMusicDuration()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public h(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h1(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i0(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i2(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fr2;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j1(ZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public j2(Ll/kod0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public k2(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public l1(Z)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l2(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Ll/ebl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmj0;->y:Ll/ebl0;

    .line 2
    .line 3
    return-void
.end method

.method public m1(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m2()Ll/dpl;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public n0(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()V
    .locals 0

    .line 1
    return-void
.end method

.method public o1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public p1()V
    .locals 0

    .line 1
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fr2;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q0(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public q1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    invoke-super {p0}, Ll/fr2;->r()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public r0(Ljava/lang/String;ZZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public r1(Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmj0;->A:Ll/gkl0;

    .line 2
    .line 3
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    return-void
.end method

.method public s0(Lcom/immomo/mediacore/coninf/MRtcSurroundMusicHander;)V
    .locals 0

    .line 1
    return-void
.end method

.method public selectAudioTrack(I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public setEffectsVolume(D)V
    .locals 0

    .line 1
    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public setMusicPitch(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public setMusicVolume(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public stopAllEffects()V
    .locals 0

    .line 1
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fr2;->stopSurroundMusic()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t0()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fr2;->t0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public t1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xmj0;->F:I

    .line 2
    .line 3
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public u0(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->u0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public v0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public v1(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public w()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public w0(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/fr2;->w0(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w1()V
    .locals 0

    .line 1
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public x1(Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public y1()F
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fr2;->y1()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public z(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->z(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z0(JZ)V
    .locals 0

    .line 1
    return-void
.end method
