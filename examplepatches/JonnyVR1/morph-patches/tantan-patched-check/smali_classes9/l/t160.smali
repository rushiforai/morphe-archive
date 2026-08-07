.class public Ll/t160;
.super Ll/cz50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cz50<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;",
        ">;"
    }
.end annotation


# instance fields
.field public final k:I

.field public final l:I

.field public final m:I

.field public n:Landroid/animation/ValueAnimator;

.field public o:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cz50;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42280000    # 42.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/t160;->k:I

    .line 11
    .line 12
    const/high16 p1, 0x43140000    # 148.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/t160;->l:I

    .line 19
    .line 20
    const/16 p1, 0x96

    .line 21
    .line 22
    iput p1, p0, Ll/t160;->m:I

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic W3(Ll/t160;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t160;->q4(Ll/q260;)V

    return-void
.end method

.method public static synthetic X3(Ll/t160;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t160;->o4()V

    return-void
.end method

.method public static synthetic Y3(Ll/jk20;Ll/x20;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p0, p2}, Ll/jk20;->e(Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/bri0;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic a4(Ll/t160;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t160;->h4()V

    return-void
.end method

.method public static synthetic b4(Ll/t160;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t160;->m4(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c4(Ll/t160;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t160;->k4(Ll/q260;)V

    return-void
.end method

.method public static synthetic d4(Ll/t160;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t160;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic e4(Ll/t160;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t160;->l4(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f4(Ll/x20;Ll/jk20;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jk20;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/jk20;->c()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/j160;

    .line 17
    .line 18
    invoke-direct {v1, p1, p0}, Ll/j160;-><init>(Ll/jk20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "context_livingAct"

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/izs;->g(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic g4(Ll/t160;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t160;->n4()V

    return-void
.end method


# virtual methods
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->messageOpen()Ll/v3f$d;

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
    new-instance v1, Ll/k160;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/k160;-><init>(Ll/t160;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public T3(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/cz50;->T3(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final h4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationMessageViewBindings;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/turbocard/HorizontalMarqueeView;->b()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Landroid/view/View;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Ll/t160;->v4(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Ll/z160;

    .line 31
    .line 32
    const/16 v2, 0x1fa4

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ll/z160;-><init>(I)V

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 38
    .line 39
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ll/z160;->f(Ljava/lang/String;)Ll/z160;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/util/Pair;

    .line 50
    .line 51
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v0, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->messageIconTrans()Ll/v3f$d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v3, Ll/q260$a;

    .line 72
    .line 73
    invoke-direct {v3, v2}, Ll/q260$a;-><init>(I)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 77
    .line 78
    invoke-virtual {v3, v2}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 83
    .line 84
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->getOperationIconPos()Ll/bnl0$g;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v2, p0}, Ll/q260$a;->g(Ll/bnl0$g;)Ll/q260$a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v1}, Ll/q260$a;->b(Z)Ll/q260$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Ll/q260$a;->a()Ll/q260;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->refreshOperationMessage()Ll/v3f$d;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance v0, Ll/q260$a;

    .line 117
    .line 118
    invoke-direct {v0, v2}, Ll/q260$a;-><init>(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ll/q260$a;->a()Ll/q260;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    return-void
.end method

.method public i4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 42
    .line 43
    const-string v3, "TextDrawer"

    .line 44
    .line 45
    invoke-static {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v0, v1, v2, v3}, Ll/s260;->c(ZLl/oo2;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->actionAfterClick:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterClick;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const v2, -0x5e5d9be2

    .line 69
    .line 70
    .line 71
    if-eq v1, v2, :cond_2

    .line 72
    .line 73
    const v2, -0x49b98db2

    .line 74
    .line 75
    .line 76
    if-eq v1, v2, :cond_1

    .line 77
    .line 78
    const p0, -0xe5022ab

    .line 79
    .line 80
    .line 81
    if-eq v1, p0, :cond_0

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const-string p0, "unknown_"

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    const-string v1, "jumpToScheme"

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->jumpScheme:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/bae0$a;

    .line 123
    .line 124
    const/16 v2, 0xc8

    .line 125
    .line 126
    invoke-direct {v1, v2}, Ll/bae0$a;-><init>(I)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->jumpScheme:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v1, p0}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Ll/bae0$a;->c()Ll/bae0;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_2
    const-string v1, "h5Drawer"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-eqz v0, :cond_4

    .line 156
    .line 157
    iget-object v0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 158
    .line 159
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_3

    .line 164
    .line 165
    iget-object v0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 166
    .line 167
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 171
    .line 172
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->e()V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 178
    .line 179
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 180
    .line 181
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    const/4 v1, 0x0

    .line 186
    invoke-virtual {p0, v1, v0}, Ll/t160;->j4(II)Landroid/animation/ValueAnimator;

    .line 187
    .line 188
    .line 189
    :cond_3
    const-string v0, "H5Drawer"

    .line 190
    .line 191
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p0, v0}, Ll/cz50;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 196
    .line 197
    .line 198
    :cond_4
    :goto_0
    return-void
.end method

.method public j4(II)Landroid/animation/ValueAnimator;
    .locals 2

    .line 1
    iget v0, p0, Ll/t160;->k:I

    .line 2
    .line 3
    filled-new-array {p2, v0}, [I

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    new-instance v0, Ll/l160;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/l160;-><init>(Ll/t160;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 19
    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    if-le p1, p2, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    const-wide/16 v0, 0x4b0

    .line 27
    .line 28
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p2, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    int-to-long v0, p1

    .line 34
    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance p2, Ll/m160;

    .line 40
    .line 41
    invoke-direct {p2, p0}, Ll/m160;-><init>(Ll/t160;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    return-object p0
.end method

.method public final synthetic k4(Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t160;->r4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l4(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic m4(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/t160;->n:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->p()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iget v1, p0, Ll/t160;->l:I

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Ll/t160;->j4(II)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Landroid/view/View;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic n4()V
    .locals 2

    .line 1
    const/16 v0, 0x96

    .line 2
    .line 3
    iget v1, p0, Ll/t160;->l:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/t160;->j4(II)Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 4
    .line 5
    new-instance v1, Ll/r160;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/r160;-><init>(Ll/t160;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->f(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q4(Ll/q260;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/q260;->d()Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/t160;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public r4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, "TextDrawer"

    .line 22
    .line 23
    invoke-static {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v0, v1, v2, v3}, Ll/s260;->d(ZLl/oo2;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v0, Landroid/view/View;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Ll/t160;->v4(Z)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Ll/t160;->k:I

    .line 43
    .line 44
    iget v1, p0, Ll/t160;->l:I

    .line 45
    .line 46
    filled-new-array {v0, v1}, [I

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    new-instance v1, Ll/p160;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/p160;-><init>(Ll/t160;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    new-instance v1, Ll/q160;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/q160;-><init>(Ll/t160;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    const-wide/16 v1, 0x96

    .line 77
    .line 78
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/t160;->o:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public s4(Landroid/text/SpannableStringBuilder;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-class v0, Ll/jk20;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v1, p0, v0}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ll/jk20;

    .line 13
    .line 14
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/s160;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ll/s160;-><init>(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->openOperationMessage()Ll/v3f$d;

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
    new-instance v1, Ll/i160;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/i160;-><init>(Ll/t160;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public t4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cz50;->i:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    return-void
.end method

.method public u4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 25
    .line 26
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->k(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Ll/z160;

    .line 30
    .line 31
    const/16 v0, 0x1fa4

    .line 32
    .line 33
    invoke-direct {p2, v0}, Ll/z160;-><init>(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ll/z160;->f(Ljava/lang/String;)Ll/z160;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Landroid/util/Pair;

    .line 47
    .line 48
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 49
    .line 50
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/hiv;

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 58
    .line 59
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast p2, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    check-cast v0, Landroid/view/View;

    .line 72
    .line 73
    invoke-static {v0}, Ll/bnl0;->K(Landroid/view/View;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    new-instance v0, Ll/n160;

    .line 86
    .line 87
    invoke-direct {v0}, Ll/n160;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Lrx/c;->first()Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    new-instance v0, Ll/o160;

    .line 99
    .line 100
    invoke-direct {v0, p0, p1}, Ll/o160;-><init>(Ll/t160;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 112
    .line 113
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 114
    .line 115
    .line 116
    :cond_2
    :goto_0
    return-void
.end method

.method public v4(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsRoot()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/q260$a;

    .line 12
    .line 13
    const/16 v1, 0x1fa4

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/q260$a;->i(Z)Ll/q260$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
