.class public Ll/t410;
.super Ll/fr2;
.source "SourceFile"

# interfaces
.implements Ll/zzl;


# instance fields
.field A:Z

.field private B:I

.field private C:Ljava/lang/String;

.field private D:I

.field private E:Ll/uow;

.field private F:I

.field private G:I

.field private H:I

.field private I:Ljava/lang/String;

.field y:Ll/dpl;

.field z:Ll/s410;


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

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/fr2;-><init>(Landroid/content/Context;Ll/c410;Ll/z5m;Ll/uow;Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/t410;->A:Z

    .line 6
    .line 7
    const/16 p2, 0xa

    .line 8
    .line 9
    iput p2, p0, Ll/t410;->B:I

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    iput-object p2, p0, Ll/t410;->C:Ljava/lang/String;

    .line 13
    .line 14
    const/4 p3, 0x2

    .line 15
    iput p3, p0, Ll/t410;->D:I

    .line 16
    .line 17
    iput-object p2, p0, Ll/t410;->E:Ll/uow;

    .line 18
    .line 19
    iput p1, p0, Ll/t410;->F:I

    .line 20
    .line 21
    iput p1, p0, Ll/t410;->G:I

    .line 22
    .line 23
    iput p1, p0, Ll/t410;->H:I

    .line 24
    .line 25
    const-string p1, ""

    .line 26
    .line 27
    iput-object p1, p0, Ll/t410;->I:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public B2(Ll/dpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t410;->y:Ll/dpl;

    .line 2
    .line 3
    return-void
.end method

.method public L1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/t410;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public O1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->O1(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public R0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t410;->z:Ll/s410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s410;->x4()V

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
    iget-object p0, p0, Ll/t410;->z:Ll/s410;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/s410;->A4(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public V0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/t410;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public a(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->a(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/t410;->z:Ll/s410;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/s410;->q4(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public b1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t410;->z:Ll/s410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s410;->C4(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f()V
    .locals 3

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
    const-string v2, "Pipeline_Flow_pip->MOMO"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fr2;->a:Ll/c410;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->d0(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/s410;->e4()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Ll/t410;->F:I

    .line 42
    .line 43
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/s410;->g4()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/t410;->G:I

    .line 50
    .line 51
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/s410;->f4()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Ll/t410;->H:I

    .line 58
    .line 59
    :cond_0
    const/4 v0, 0x0

    .line 60
    iput-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 61
    .line 62
    :cond_1
    invoke-super {p0}, Ll/fr2;->f()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public g2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t410;->z:Ll/s410;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/s410;->u4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/t410;->F:I

    .line 2
    .line 3
    return p0
.end method

.method public p0(ILjava/lang/String;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/t410;->B:I

    .line 2
    .line 3
    iput-object p2, p0, Ll/t410;->C:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public t0()I
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/fr2;->t2()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/fr2;->a:Ll/c410;

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v0, v1, v2}, Ll/f410;->d(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/q210$a;)Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 16
    .line 17
    check-cast v0, Ll/s410;

    .line 18
    .line 19
    iput-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 20
    .line 21
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 22
    .line 23
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 24
    .line 25
    iget v1, v1, Ll/tow;->R:I

    .line 26
    .line 27
    invoke-interface {v0, v1}, Lcom/momo/piplinemomoext/input/audio/a;->s1(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/fr2;->f:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 31
    .line 32
    iget-object v1, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->e1(Ll/l6m;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 38
    .line 39
    iget-boolean v1, p0, Ll/t410;->A:Z

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/grx;->O2(Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 45
    .line 46
    iget v1, p0, Ll/t410;->D:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/s410;->z4(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 52
    .line 53
    iget v1, p0, Ll/fr2;->i:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/s410;->A4(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 59
    .line 60
    iget v1, p0, Ll/t410;->B:I

    .line 61
    .line 62
    const/4 v2, 0x0

    .line 63
    iget-object v3, p0, Ll/t410;->C:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2, v3}, Ll/s410;->D4(ILjava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/fr2;->h:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_0

    .line 75
    .line 76
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 77
    .line 78
    iget-object v1, p0, Ll/fr2;->h:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ll/grx;->J(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    iget-object v0, p0, Ll/fr2;->e:Lcom/momo/piplinemomoext/input/audio/a;

    .line 84
    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 88
    .line 89
    iget-object v1, p0, Ll/fr2;->d:Ll/uow;

    .line 90
    .line 91
    iget v2, v1, Ll/tow;->P:I

    .line 92
    .line 93
    iget v1, v1, Ll/tow;->R:I

    .line 94
    .line 95
    const-string v3, "Momo"

    .line 96
    .line 97
    const/16 v4, 0x800

    .line 98
    .line 99
    invoke-virtual {v0, v4, v2, v1, v3}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    invoke-super {p0}, Ll/fr2;->t0()I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    return p0
.end method

.method public t1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/t410;->D:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/t410;->z:Ll/s410;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/s410;->z4(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public u(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t410;->z:Ll/s410;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/s410;->B4(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, " replace setReplaceStream:"

    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "Pipeline_Flow_pip->MOMO"

    .line 41
    .line 42
    invoke-virtual {v0, p1, p0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public u0(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/fr2;->u0(Z)V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/t410;->A:Z

    .line 5
    .line 6
    return-void
.end method
