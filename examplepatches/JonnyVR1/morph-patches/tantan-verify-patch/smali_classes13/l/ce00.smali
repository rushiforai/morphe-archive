.class public Ll/ce00;
.super Ll/fr2;
.source "SourceFile"

# interfaces
.implements Ll/hwl;


# instance fields
.field A:Ll/fbl0;

.field B:Ll/gkl0;

.field C:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field D:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/uti0;",
            ">;"
        }
    .end annotation
.end field

.field E:Z

.field private F:Z

.field private G:I

.field private H:I

.field private I:I

.field private J:Z

.field private K:Ljava/lang/String;

.field y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

.field z:Ll/ebl0;


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

    .line 72
    invoke-direct/range {p0 .. p5}, Ll/fr2;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 73
    new-instance p1, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {p1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object p1, p0, Ll/ce00;->D:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    const/4 p1, 0x0

    .line 74
    iput-boolean p1, p0, Ll/ce00;->E:Z

    .line 75
    iput-boolean p1, p0, Ll/ce00;->F:Z

    const/4 p2, 0x2

    .line 76
    iput p2, p0, Ll/ce00;->G:I

    const/4 p2, -0x1

    .line 77
    iput p2, p0, Ll/ce00;->H:I

    .line 78
    iput p2, p0, Ll/ce00;->I:I

    .line 79
    iput-boolean p1, p0, Ll/ce00;->J:Z

    .line 80
    const-string p1, ""

    iput-object p1, p0, Ll/ce00;->K:Ljava/lang/String;

    .line 81
    invoke-virtual {p0}, Ll/fr2;->t2()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Ll/fr2;->a:Ll/c410;

    invoke-interface {p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    move-result-object p3

    iget-object p5, p0, Ll/fr2;->a:Ll/c410;

    invoke-interface {p5}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    move-result-object p5

    invoke-static {p1, p2, p3, p5, p4}, Ll/d410;->k(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;)Lcom/momo/pipline/MomoInterface/MomoCodec;

    move-result-object p1

    iput-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 82
    instance-of p2, p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    if-eqz p2, :cond_0

    .line 83
    check-cast p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    iput-object p1, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    return-void

    .line 84
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    const-string p1, "createmomortcPushFilter create must instanceof momortcPushFilter"

    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public constructor <init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;Ljava/lang/String;)V
    .locals 1
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
    new-instance p1, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ce00;->D:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/ce00;->E:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/ce00;->F:Z

    .line 15
    .line 16
    const/4 p2, 0x2

    .line 17
    iput p2, p0, Ll/ce00;->G:I

    .line 18
    .line 19
    const/4 p2, -0x1

    .line 20
    iput p2, p0, Ll/ce00;->H:I

    .line 21
    .line 22
    iput p2, p0, Ll/ce00;->I:I

    .line 23
    .line 24
    iput-boolean p1, p0, Ll/ce00;->J:Z

    .line 25
    .line 26
    const-string p1, ""

    .line 27
    .line 28
    iput-object p1, p0, Ll/ce00;->K:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/fr2;->t2()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p0, Ll/fr2;->a:Ll/c410;

    .line 35
    .line 36
    invoke-interface {p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    iget-object p5, p0, Ll/fr2;->a:Ll/c410;

    .line 41
    .line 42
    invoke-interface {p5}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 43
    .line 44
    .line 45
    move-result-object p5

    .line 46
    move-object v0, p5

    .line 47
    move-object p5, p4

    .line 48
    move-object p4, v0

    .line 49
    invoke-static/range {p1 .. p6}, Ll/d410;->l(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 54
    .line 55
    instance-of p2, p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 56
    .line 57
    if-eqz p2, :cond_0

    .line 58
    .line 59
    check-cast p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 60
    .line 61
    iput-object p1, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 65
    .line 66
    const-string p1, "createmomortcPushFilter create must instanceof momortcPushFilter"

    .line 67
    .line 68
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0
.end method


# virtual methods
.method public A0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z5(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public A1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i6(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B0(Ll/vpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O4(Ll/vpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public D(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B6(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public D0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T4(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public E0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a5(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public E1(ZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v6(ZZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public F(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ce00;->K:Ljava/lang/String;

    .line 2
    .line 3
    invoke-super {p0, p1, p2}, Ll/fr2;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-interface {v0, v1}, Lcom/momo/piplinemomoext/input/audio/a;->l(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 15
    .line 16
    invoke-interface {p0, p1, p2}, Ll/l6m;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public F0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public F1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y4(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public H0(Ll/wpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R4(Ll/wpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public H1(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L5(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U4(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K(IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N6(IIII)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p10}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U5(ILjava/lang/String;IDDZD)Z

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public L(JF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z4(JF)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q6(ID)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k6(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M1(Ll/hwl$a;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/ce00;->A:Ll/fbl0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L6(Ll/fbl0;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ll/ce00$a;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/ce00$a;-><init>(Ll/ce00;Ll/hwl$a;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ce00;->A:Ll/fbl0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L6(Ll/fbl0;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public N0(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public N1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Ll/l6m;->N1()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public O0(Ll/upw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L4(Ll/upw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public P0(Ll/gbl0;)V
    .locals 0

    .line 1
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J5(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R(Ll/fb1;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "Screen recording setOnFrameAvailabelCallback >>>>>>>>>>>>>>"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y5(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 36
    .line 37
    new-instance v2, Ll/ce00$b;

    .line 38
    .line 39
    invoke-direct {v2, p0, p1}, Ll/ce00$b;-><init>(Ll/ce00;Ll/fb1;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v0, v2}, Ll/c410;->L(Ll/dpl$a;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p1, p0, Ll/fr2;->a:Ll/c410;

    .line 47
    .line 48
    invoke-interface {p1, v1}, Ll/c410;->L(Ll/dpl$a;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    invoke-super {p0, v1}, Ll/fr2;->R(Ll/fb1;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public T0(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->T0(I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/fr2;->i:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n6(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public T1(Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "setStreamReplaceMode:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 34
    .line 35
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G6(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public U(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X4(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U0(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K5(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h5(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F6(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Ll/fr2;->W1(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public X(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X1(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ce00;->C:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K4(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Y()V
    .locals 0

    .line 1
    return-void
.end method

.method public Y1(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V4(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fr2;->Z1(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M4(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->a(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y6(F)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y6(F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G5(Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public a0(Ll/ypw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W4(Ll/ypw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a2(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q4(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z5()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    invoke-super {p0}, Ll/fr2;->c()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public c0(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S4(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c1(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ce00;->I:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ce00;->J:Z

    .line 4
    .line 5
    return-void
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->d()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    return p0
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, " stopRecord"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->d0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-super {p0}, Ll/fr2;->f()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 41
    .line 42
    iget-boolean v1, v1, Ll/tow;->d0:Z

    .line 43
    .line 44
    invoke-interface {v0, v1}, Lcom/momo/piplinemomoext/input/audio/a;->z1(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 48
    .line 49
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 50
    .line 51
    iget-object p0, p0, Ll/fr2;->d:Ll/uow;

    .line 52
    .line 53
    iget v1, p0, Ll/tow;->P:I

    .line 54
    .line 55
    iget p0, p0, Ll/tow;->R:I

    .line 56
    .line 57
    const-string v2, "Momo"

    .line 58
    .line 59
    const/16 v3, 0x800

    .line 60
    .line 61
    invoke-virtual {v0, v3, v1, p0, v2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public f1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
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

.method public g()Ll/mob0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public g0(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y6(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Ll/fr2;->g0(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getEffectsVolume()D
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q5()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getMusicDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->getMusicDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P4(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T5()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Ll/fr2;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public j1(ZI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z6(ZI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j2(Ll/kod0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E6(Ll/kod0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X6(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m0(Ll/ebl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ce00;->z:Ll/ebl0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K6(Ll/ebl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m1(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A6(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m2()Ll/dpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N4(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->o0()V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->p1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q5()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R5(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Ll/fr2;->q()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public q0(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/l6m;->q0(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A5()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public r0(Ljava/lang/String;ZZI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T6(Ljava/lang/String;ZZI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r1(Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ce00;->B:Ll/gkl0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O6(Ll/gkl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public resumeAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b6(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S5()V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q6(D)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r6(Z)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public setMusicPitch(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->setMusicPitch(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setMusicVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/l6m;->setMusicVolume(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V6(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->stopSurroundMusic()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Ll/fr2;->stopSurroundMusic()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t0()I
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, " startRecord"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget v1, p0, Ll/ce00;->G:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m6(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 34
    .line 35
    iget v1, p0, Ll/ce00;->H:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D6(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 41
    .line 42
    iget v1, p0, Ll/fr2;->i:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n6(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 48
    .line 49
    iget-object v1, p0, Ll/ce00;->z:Ll/ebl0;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K6(Ll/ebl0;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 55
    .line 56
    iget-object v1, p0, Ll/ce00;->A:Ll/fbl0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L6(Ll/fbl0;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 62
    .line 63
    iget-object v1, p0, Ll/ce00;->B:Ll/gkl0;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O6(Ll/gkl0;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 69
    .line 70
    iget-object v1, p0, Ll/ce00;->C:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K4(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 76
    .line 77
    iget-boolean v1, p0, Ll/ce00;->E:Z

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g6(Z)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget v0, p0, Ll/ce00;->I:I

    .line 83
    .line 84
    const/4 v1, -0x1

    .line 85
    if-eq v0, v1, :cond_1

    .line 86
    .line 87
    iget-object v1, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 88
    .line 89
    iget-boolean v2, p0, Ll/ce00;->J:Z

    .line 90
    .line 91
    invoke-virtual {v1, v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C6(IZ)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 95
    .line 96
    iget-object v1, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 97
    .line 98
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 102
    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    const/4 p0, -0x5

    .line 106
    return p0

    .line 107
    :cond_2
    iget-object v1, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 108
    .line 109
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->e1(Ll/l6m;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 113
    .line 114
    if-eqz v0, :cond_3

    .line 115
    .line 116
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 117
    .line 118
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 119
    .line 120
    iget v1, v1, Ll/tow;->P:I

    .line 121
    .line 122
    const/4 v2, 0x1

    .line 123
    const-string v3, "MomoRtc"

    .line 124
    .line 125
    const/16 v4, 0x800

    .line 126
    .line 127
    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_3
    invoke-super {p0}, Ll/fr2;->t0()I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    return p0
.end method

.method public t1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ce00;->G:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m6(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
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
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j6(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public u1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u6(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public v0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public v1(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ll/l6m;->v1(J)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public w()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->w()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public w0(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    long-to-int v1, p1

    .line 6
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H6(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-super {p0, p1, p2}, Ll/fr2;->w0(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public w1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/l6m;->w1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E5(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x1(Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public y1()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y5()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-super {p0}, Ll/fr2;->y1()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public z(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->z(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P6(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public z0(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ce00;->y:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n5(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
