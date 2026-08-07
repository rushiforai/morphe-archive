.class public Ll/hfd0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lv/VFrame;

.field public final j:Lv/VRelative;

.field public k:Z

.field public l:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;


# direct methods
.method public constructor <init>(Ll/dum;Lv/VFrame;Lv/VRelative;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Lv/VFrame;",
            "Lv/VRelative;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/hfd0;->k:Z

    .line 6
    .line 7
    new-instance p1, Ll/hfd0$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/hfd0$a;-><init>(Ll/hfd0;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/hfd0;->l:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 13
    .line 14
    iput-object p2, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 15
    .line 16
    iput-object p3, p0, Ll/hfd0;->j:Lv/VRelative;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/hfd0;Ll/fyb;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hfd0;->O3(Ll/fyb;)V

    return-void
.end method

.method public static bridge synthetic K3(Ll/hfd0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hfd0;->k:Z

    return p0
.end method

.method public static bridge synthetic L3(Ll/hfd0;)Lv/VFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hfd0;->i:Lv/VFrame;

    return-object p0
.end method

.method public static bridge synthetic M3(Ll/hfd0;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hfd0;->P3(Ljava/lang/Float;)V

    return-void
.end method

.method public static bridge synthetic N3(Ll/hfd0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hfd0;->R3(Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public final O3(Ll/fyb;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget p1, p1, Ll/fyb;->a:I

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/hfd0;->k:Z

    .line 12
    .line 13
    iget-object p1, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/hfd0;->j:Lv/VRelative;

    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/hfd0;->S3(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iput-boolean v1, p0, Ll/hfd0;->k:Z

    .line 30
    .line 31
    return-void
.end method

.method public final P3(Ljava/lang/Float;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/hfd0;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    int-to-float v1, v1

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v1, v2

    .line 20
    cmpl-float v0, v0, v1

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    cmpl-float v0, v0, v1

    .line 30
    .line 31
    if-gez v0, :cond_2

    .line 32
    .line 33
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/high16 v3, 0x43480000    # 200.0f

    .line 38
    .line 39
    cmpl-float v0, v0, v3

    .line 40
    .line 41
    if-lez v0, :cond_3

    .line 42
    .line 43
    :cond_2
    iget-object p1, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 44
    .line 45
    invoke-static {}, Ll/bnl0;->y0()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    int-to-float v0, v0

    .line 50
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/hfd0;->j:Lv/VRelative;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/hfd0;->S3(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {}, Ll/bnl0;->y0()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    int-to-float v3, v3

    .line 74
    div-float/2addr v3, v2

    .line 75
    cmpg-float v0, v0, v3

    .line 76
    .line 77
    if-ltz v0, :cond_5

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    const/high16 v0, -0x3cb80000    # -200.0f

    .line 84
    .line 85
    cmpg-float p1, p1, v0

    .line 86
    .line 87
    if-gez p1, :cond_4

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    :goto_0
    return-void

    .line 91
    :cond_5
    :goto_1
    iget-object p1, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/hfd0;->j:Lv/VRelative;

    .line 97
    .line 98
    const/4 v0, 0x4

    .line 99
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    const/4 p1, 0x1

    .line 103
    invoke-virtual {p0, p1}, Ll/hfd0;->S3(Z)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final R3(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/hfd0;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    int-to-float p1, p1

    .line 17
    add-float/2addr v0, p1

    .line 18
    const/4 p1, 0x0

    .line 19
    cmpg-float p1, v0, p1

    .line 20
    .line 21
    if-gez p1, :cond_1

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_1
    iget-object p1, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 25
    .line 26
    const/high16 v1, 0x3f800000    # 1.0f

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final S3(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    const-wide/16 v1, 0x12c

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {p0, v1, v2, v0}, Ll/gt0;->c(Landroid/view/View;JLandroid/animation/Animator$AnimatorListener;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {p0, v1, v2, v0}, Ll/gt0;->d(Landroid/view/View;JLandroid/animation/Animator$AnimatorListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/gfd0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/gfd0;-><init>(Ll/hfd0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ClearScreenEvent:Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;->removeClearScreenCallBack()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Ll/hfd0;->l:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ClearScreenEvent:Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ClearScreenEvent;->addClearScreenCallBack()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/hfd0;->l:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 26
    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/hfd0;->i:Lv/VFrame;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/gyb;

    .line 39
    .line 40
    const/16 v1, 0x1770

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ll/gyb;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/fyb;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/hfd0;->O3(Ll/fyb;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
