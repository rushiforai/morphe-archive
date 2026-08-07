.class public Ll/ymp0;
.super Ll/fr2;
.source "SourceFile"

# interfaces
.implements Ll/hwl;


# instance fields
.field A:Ll/fbl0;

.field B:Ll/gkl0;

.field C:Ll/gbl0;

.field D:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/uti0;",
            ">;"
        }
    .end annotation
.end field

.field F:Z

.field private G:Z

.field private H:I

.field private I:I

.field private J:I

.field private K:Z

.field private L:Ljava/lang/String;

.field y:Ll/xmp0;

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

    .line 79
    invoke-direct/range {p0 .. p5}, Ll/fr2;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 80
    new-instance p1, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {p1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object p1, p0, Ll/ymp0;->E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    const/4 p1, 0x0

    .line 81
    iput-boolean p1, p0, Ll/ymp0;->F:Z

    .line 82
    iput-boolean p1, p0, Ll/ymp0;->G:Z

    const/4 p2, 0x2

    .line 83
    iput p2, p0, Ll/ymp0;->H:I

    const/4 p2, -0x1

    .line 84
    iput p2, p0, Ll/ymp0;->I:I

    .line 85
    iput p2, p0, Ll/ymp0;->J:I

    .line 86
    iput-boolean p1, p0, Ll/ymp0;->K:Z

    .line 87
    const-string p1, ""

    iput-object p1, p0, Ll/ymp0;->L:Ljava/lang/String;

    .line 88
    invoke-virtual {p0}, Ll/fr2;->t2()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Ll/fr2;->a:Ll/c410;

    invoke-interface {p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->j0()Ll/g510;

    move-result-object p3

    iget-object p5, p0, Ll/fr2;->a:Ll/c410;

    invoke-interface {p5}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    move-result-object p5

    invoke-static {p1, p2, p3, p5, p4}, Ll/d410;->p(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;)Lcom/momo/pipline/MomoInterface/MomoCodec;

    move-result-object p1

    iput-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 89
    instance-of p1, p1, Ll/xmp0;

    if-nez p1, :cond_0

    .line 90
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    move-result-object p1

    const-string p2, "createAgoraPushFilter create must instanceof VolcPushFilter"

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 91
    :cond_0
    iget-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    check-cast p1, Ll/xmp0;

    iput-object p1, p0, Ll/ymp0;->y:Ll/xmp0;

    return-void
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
    iput-object p1, p0, Ll/ymp0;->E:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/ymp0;->F:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/ymp0;->G:Z

    .line 15
    .line 16
    const/4 p2, 0x2

    .line 17
    iput p2, p0, Ll/ymp0;->H:I

    .line 18
    .line 19
    const/4 p2, -0x1

    .line 20
    iput p2, p0, Ll/ymp0;->I:I

    .line 21
    .line 22
    iput p2, p0, Ll/ymp0;->J:I

    .line 23
    .line 24
    iput-boolean p1, p0, Ll/ymp0;->K:Z

    .line 25
    .line 26
    const-string p1, ""

    .line 27
    .line 28
    iput-object p1, p0, Ll/ymp0;->L:Ljava/lang/String;

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
    invoke-static/range {p1 .. p6}, Ll/d410;->q(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 54
    .line 55
    instance-of p1, p1, Ll/xmp0;

    .line 56
    .line 57
    if-nez p1, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string p2, "createAgoraPushFilter create must instanceof VolcPushFilter"

    .line 64
    .line 65
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p1, p2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object p1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 73
    .line 74
    check-cast p1, Ll/xmp0;

    .line 75
    .line 76
    iput-object p1, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 77
    .line 78
    return-void
.end method


# virtual methods
.method public A()V
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
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->e0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-super {p0}, Ll/fr2;->A()V

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

.method public A0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xmp0;->Y6(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public A1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->h7(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->T7(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B0(Ll/vpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->M5(Ll/vpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->I6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->j6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public D(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->D7(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public D0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->q7(Z)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->R5(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public E0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->Y5(I)I

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xmp0;->x7(ZZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public F(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ymp0;->L:Ljava/lang/String;

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->b7()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public F1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->W5(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->H6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public H0(Ll/wpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->P5(Ll/wpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public H1(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xmp0;->K6(JZ)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->S5(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K(IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xmp0;->U7(IIII)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->i7(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K1(ILjava/lang/String;IDDZD)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p10}, Ll/xmp0;->T6(ILjava/lang/String;IDDZD)Z

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xmp0;->X5(JF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public L0([B)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/xmp0;->e7(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public M(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xmp0;->a8(ID)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xmp0;->l7(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M1(Ll/hwl$a;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Ll/ymp0;->A:Ll/fbl0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ll/xmp0;->R7(Ll/fbl0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    new-instance v0, Ll/ymp0$a;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/ymp0$a;-><init>(Ll/ymp0;Ll/hwl$a;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ymp0;->A:Ll/fbl0;

    .line 19
    .line 20
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/xmp0;->R7(Ll/fbl0;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->h6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public N0(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->I5(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public N1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->h8()V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->J5(Ll/upw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->d8(Ljava/lang/String;)V

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
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ymp0;->C:Ll/gbl0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/fr2;->d:Ll/uow;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Ll/uow;->Z0:Z

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, p0, Ll/uow;->Z0:Z

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p1}, Ll/xmp0;->P7(Ll/gbl0;)V

    .line 19
    .line 20
    .line 21
    :cond_1
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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xmp0;->J6(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->e7(Ljava/lang/String;)I

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
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

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
    invoke-virtual {v0, v2}, Ll/xmp0;->W6(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 36
    .line 37
    new-instance v2, Ll/ymp0$b;

    .line 38
    .line 39
    invoke-direct {v2, p0, p1}, Ll/ymp0$b;-><init>(Ll/ymp0;Ll/fb1;)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->e6(Z)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/xmp0;->o7(I)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/xmp0;->K7(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public U(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->V5(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xmp0;->g6(ZLjava/lang/String;)V

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
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/xmp0;->J7(F)V

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

.method public X1(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ymp0;->D:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xmp0;->H5(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

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

.method public Y0(JZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->c8()V

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
    invoke-interface {p0, p1, p2, p3}, Ll/l6m;->Y0(JZ)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public Y1(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->T5(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->v7(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->i6(Z)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/xmp0;->K5(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->a(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/xmp0;->G6(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public a0(Ll/ypw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->U5(Ll/ypw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a2(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->O5(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->L6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->v6()J

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->Q5(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c1(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ymp0;->J:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ymp0;->K:Z

    .line 4
    .line 5
    return-void
.end method

.method public c2(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/fr2;->c2(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;III)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/xmp0;->K5(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 9
    .line 10
    .line 11
    :cond_0
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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->n8(Ljava/lang/String;)V

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
    const-string v2, "Pipeline_Normal_pip->PIPLINE->VOLC"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v1, ""

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string v0, "null"

    .line 50
    .line 51
    :goto_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v3, "VolcPusherPipline stopRecord this.code:"

    .line 58
    .line 59
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, ",codec hashcode:"

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 89
    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object v1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 93
    .line 94
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->d0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    invoke-super {p0}, Ll/fr2;->f()V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 101
    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 105
    .line 106
    iget-boolean v1, v1, Ll/tow;->d0:Z

    .line 107
    .line 108
    invoke-interface {v0, v1}, Lcom/momo/piplinemomoext/input/audio/a;->z1(Z)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 112
    .line 113
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 114
    .line 115
    iget-object p0, p0, Ll/fr2;->d:Ll/uow;

    .line 116
    .line 117
    iget v1, p0, Ll/tow;->P:I

    .line 118
    .line 119
    iget p0, p0, Ll/tow;->R:I

    .line 120
    .line 121
    const-string v2, "Momo"

    .line 122
    .line 123
    const/16 v3, 0x800

    .line 124
    .line 125
    invoke-virtual {v0, v3, v1, p0, v2}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    return-void
.end method

.method public f1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->F6(Z)V

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

.method public g0(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/xmp0;->A7(F)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->q6()D

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->Y7(I)I

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

.method public h0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->p7(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->u7(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xmp0;->j8(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x3

    .line 11
    return p0
.end method

.method public i0(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->N5(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

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
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->S6()V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xmp0;->B7(ZI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j2(Ll/kod0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->I7(Ll/kod0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->o6()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public k0()V
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
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget v1, p0, Ll/ymp0;->H:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/xmp0;->n7(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 34
    .line 35
    iget v1, p0, Ll/ymp0;->I:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/xmp0;->G7(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 41
    .line 42
    iget v1, p0, Ll/fr2;->i:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/xmp0;->o7(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/ymp0;->z:Ll/ebl0;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/xmp0;->Q7(Ll/ebl0;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 55
    .line 56
    iget-object v1, p0, Ll/ymp0;->A:Ll/fbl0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/xmp0;->R7(Ll/fbl0;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 62
    .line 63
    iget-object v1, p0, Ll/ymp0;->B:Ll/gkl0;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/xmp0;->X7(Ll/gkl0;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 69
    .line 70
    iget-object v1, p0, Ll/ymp0;->D:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/xmp0;->H5(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 76
    .line 77
    iget-boolean v1, p0, Ll/ymp0;->F:Z

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/xmp0;->f7(Z)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget v0, p0, Ll/ymp0;->J:I

    .line 83
    .line 84
    const/4 v1, -0x1

    .line 85
    if-eq v0, v1, :cond_1

    .line 86
    .line 87
    iget-object v1, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 88
    .line 89
    iget-boolean v2, p0, Ll/ymp0;->K:Z

    .line 90
    .line 91
    invoke-virtual {v1, v0, v2}, Ll/xmp0;->F7(IZ)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 95
    .line 96
    iget-object v1, p0, Ll/ymp0;->y:Ll/xmp0;

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
    return-void

    .line 106
    :cond_2
    iget-object v1, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 107
    .line 108
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->e1(Ll/l6m;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 116
    .line 117
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 118
    .line 119
    iget v2, v1, Ll/tow;->P:I

    .line 120
    .line 121
    iget v1, v1, Ll/tow;->R:I

    .line 122
    .line 123
    const-string v3, "Volc"

    .line 124
    .line 125
    const/16 v4, 0x800

    .line 126
    .line 127
    invoke-virtual {v0, v4, v2, v1, v3}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_3
    invoke-super {p0}, Ll/fr2;->k0()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public k2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->f6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l1(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->Z7(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public l2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->l8(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Ll/ebl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ymp0;->z:Ll/ebl0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xmp0;->Q7(Ll/ebl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m1(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->C7(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m2()Ll/dpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->L5(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fr2;->a:Ll/c410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->s7(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/fr2;->p(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->P6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pauseEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->Q6(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->c7()V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->E7(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->w6()J

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xmp0;->e8(Ljava/lang/String;ZZI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r1(Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ymp0;->B:Ll/gkl0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xmp0;->X7(Ll/gkl0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public resumeAllEffects()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->Z6()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resumeEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->a7(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->R6()V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->d7(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public setEffectsVolume(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xmp0;->r7(D)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->t7(Z)I

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xmp0;->f8()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->g8(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->stopSurroundMusic()V

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
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget v1, p0, Ll/ymp0;->H:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/xmp0;->n7(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 34
    .line 35
    iget v1, p0, Ll/ymp0;->I:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/xmp0;->G7(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 41
    .line 42
    iget v1, p0, Ll/fr2;->i:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/xmp0;->o7(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/ymp0;->z:Ll/ebl0;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/xmp0;->Q7(Ll/ebl0;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 55
    .line 56
    iget-object v1, p0, Ll/ymp0;->A:Ll/fbl0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/xmp0;->R7(Ll/fbl0;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 62
    .line 63
    iget-object v1, p0, Ll/ymp0;->B:Ll/gkl0;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/xmp0;->X7(Ll/gkl0;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 69
    .line 70
    iget-object v1, p0, Ll/ymp0;->D:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/xmp0;->H5(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 76
    .line 77
    iget-boolean v1, p0, Ll/ymp0;->F:Z

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ll/xmp0;->f7(Z)V

    .line 80
    .line 81
    .line 82
    :cond_0
    iget v0, p0, Ll/ymp0;->J:I

    .line 83
    .line 84
    const/4 v1, -0x1

    .line 85
    if-eq v0, v1, :cond_1

    .line 86
    .line 87
    iget-object v1, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 88
    .line 89
    iget-boolean v2, p0, Ll/ymp0;->K:Z

    .line 90
    .line 91
    invoke-virtual {v1, v0, v2}, Ll/xmp0;->F7(IZ)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 95
    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    iget-object v1, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 99
    .line 100
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C0(Ll/dpl;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 104
    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    const/4 p0, -0x5

    .line 108
    return p0

    .line 109
    :cond_3
    iget-object v1, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 110
    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->e1(Ll/l6m;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 117
    .line 118
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 119
    .line 120
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 121
    .line 122
    iget v2, v1, Ll/tow;->P:I

    .line 123
    .line 124
    iget v1, v1, Ll/tow;->R:I

    .line 125
    .line 126
    const-string v3, "Volc"

    .line 127
    .line 128
    const/16 v4, 0x800

    .line 129
    .line 130
    invoke-virtual {v0, v4, v2, v1, v3}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    invoke-super {p0}, Ll/fr2;->t0()I

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    return p0
.end method

.method public t1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ymp0;->H:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xmp0;->n7(I)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/xmp0;->k7(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public u1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->d6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/xmp0;->w7(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public v0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->k6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v1(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->c8()V

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
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    long-to-int v1, p1

    .line 6
    invoke-virtual {v0, v1}, Ll/xmp0;->L7(I)V

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
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->E6(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public x1(Ljava/lang/String;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xmp0;->k8(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x3

    .line 11
    return p0
.end method

.method public y1()F
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xmp0;->u6()F

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
    return-void
.end method

.method public z0(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymp0;->y:Ll/xmp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xmp0;->l6(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
