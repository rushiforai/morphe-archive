.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;
.super Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView<",
        "Ll/qz50;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;

.field public g:Lv/VDraweeView;

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->v0()V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->h:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k0(Ll/bnl0$g;)V
    .locals 11

    .line 1
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 2
    .line 3
    sget-object v6, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    const/4 v8, 0x2

    .line 6
    new-array v7, v8, [F

    .line 7
    .line 8
    fill-array-data v7, :array_0

    .line 9
    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    const-wide/16 v4, 0xc8

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v9

    .line 20
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 21
    .line 22
    new-array v7, v8, [F

    .line 23
    .line 24
    fill-array-data v7, :array_1

    .line 25
    .line 26
    .line 27
    const-wide/16 v4, 0x71

    .line 28
    .line 29
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    new-array v7, v8, [F

    .line 34
    .line 35
    fill-array-data v7, :array_2

    .line 36
    .line 37
    .line 38
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    filled-new-array {v10, v1}, [Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    filled-new-array {v9, v1}, [Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ll/nz50;

    .line 62
    .line 63
    invoke-direct {v2, p0}, Ll/nz50;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->h:Landroid/animation/Animator;

    .line 71
    .line 72
    const-wide/16 v2, 0x190

    .line 73
    .line 74
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->h:Landroid/animation/Animator;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 4
        0x3f8ccccd    # 1.1f
        0x3f19999a    # 0.6f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public m0()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->d:Ll/i6t;

    .line 5
    .line 6
    check-cast v0, Ll/qz50;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/qz50;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic n0(Ll/dum;)Ll/i6t;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->w0(Ll/dum;)Ll/qz50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o0(Ll/q260;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->o0(Ll/q260;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->g:Lv/VDraweeView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->e:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;->enter:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;->imageUrl:Ljava/lang/String;

    .line 13
    .line 14
    const/high16 v0, 0x42940000    # 74.0f

    .line 15
    .line 16
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-string v1, "context_livingAct"

    .line 21
    .line 22
    invoke-static {v1, p1, p0, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->t0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;

    .line 14
    .line 15
    const/16 v1, 0x30

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;->c(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    neg-int v1, v1

    .line 27
    int-to-float v1, v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->getTargetPos()Ll/bnl0$g;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget p0, p0, Ll/bnl0$g;->b:I

    .line 38
    .line 39
    const/high16 v1, 0x41f00000    # 30.0f

    .line 40
    .line 41
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    add-int/2addr p0, v1

    .line 46
    int-to-float p0, p0

    .line 47
    invoke-virtual {v0, p0}, Landroid/view/View;->setY(F)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public q0(Ll/bnl0$g;)V
    .locals 10

    .line 1
    sget-object p1, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/hiv;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p1, Ll/hiv;->i:Z

    .line 11
    .line 12
    sget-object v7, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    neg-int p1, p1

    .line 19
    int-to-float p1, p1

    .line 20
    const/high16 v1, 0x40a00000    # 5.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    const/4 v9, 0x2

    .line 28
    new-array v8, v9, [F

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    aput p1, v8, v2

    .line 32
    .line 33
    aput v1, v8, v0

    .line 34
    .line 35
    sget-object v2, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 36
    .line 37
    const-wide/16 v3, 0x0

    .line 38
    .line 39
    const-wide/16 v5, 0x190

    .line 40
    .line 41
    move-object v1, p0

    .line 42
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    move-object v0, v1

    .line 47
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 48
    .line 49
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 50
    .line 51
    .line 52
    new-array v7, v9, [F

    .line 53
    .line 54
    fill-array-data v7, :array_0

    .line 55
    .line 56
    .line 57
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 58
    .line 59
    const-wide/16 v2, 0x0

    .line 60
    .line 61
    const-wide/16 v4, 0x10e

    .line 62
    .line 63
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance p1, Ll/mz50;

    .line 76
    .line 77
    invoke-direct {p1, v0}, Ll/mz50;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->i:Landroid/animation/Animator;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    nop

    .line 91
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final t0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oz50;->a(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oz50;->b(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic v0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntranceAnimView;->k0(Ll/bnl0$g;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public w0(Ll/dum;)Ll/qz50;
    .locals 0

    .line 1
    new-instance p0, Ll/qz50;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/qz50;-><init>(Ll/dum;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
