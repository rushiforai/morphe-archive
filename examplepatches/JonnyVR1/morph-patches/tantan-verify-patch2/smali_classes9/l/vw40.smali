.class public final Ll/vw40;
.super Ll/nn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/nn2<",
        "TD;",
        "Ll/yw40;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000*\u0008\u0008\u0000\u0010\u0002*\u00020\u00012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00040\u0003B\u001d\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\r\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001f\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0016\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0010J\u001f\u0010\u001c\u001a\u00020\u000e2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u00192\u0006\u0010\u001b\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0017\u0010!\u001a\u0004\u0018\u00010 2\u0006\u0010\u001f\u001a\u00020\u001e\u00a2\u0006\u0004\u0008!\u0010\"J\u000f\u0010#\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008#\u0010\u0010R\"\u0010\u001b\u001a\u00020\u000b8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008$\u0010%\u001a\u0004\u0008&\u0010\r\"\u0004\u0008\'\u0010\u0017\u00a8\u0006("
    }
    d2 = {
        "Ll/vw40;",
        "Ll/oo2;",
        "D",
        "Ll/nn2;",
        "Ll/yw40;",
        "Ll/dum;",
        "info",
        "Landroid/widget/LinearLayout;",
        "tips",
        "<init>",
        "(Ll/dum;Landroid/widget/LinearLayout;)V",
        "",
        "k4",
        "()Z",
        "",
        "m4",
        "()V",
        "show",
        "",
        "progress",
        "Z3",
        "(ZI)V",
        "Y3",
        "(Z)V",
        "T",
        "Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;",
        "bLiveChatTip",
        "sendDanmuStyle",
        "l4",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;Z)V",
        "",
        "type",
        "Landroid/view/View;",
        "j4",
        "(Ljava/lang/String;)Landroid/view/View;",
        "P3",
        "j",
        "Z",
        "getSendDanmuStyle",
        "setSendDanmuStyle",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/LinearLayout;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/widget/LinearLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Landroid/widget/LinearLayout;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/nn2;-><init>(Ll/dum;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/yw40;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Ll/yw40;-><init>(Landroid/widget/LinearLayout;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static d4(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static e4(Ll/vw40;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/yw40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yw40;->w()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static f4(Ll/vw40;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yw40;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yw40;->x(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static g4(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static h4(Ll/vw40;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static i4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/yw40;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yw40;->p()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "vipServiceBubble"

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "-2"

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 26
    .line 27
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ze:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 40
    .line 41
    const-string v1, "FF8817"

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v1, 0x3

    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showExtraBubble()Ll/v3f$d;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/wrv;->D()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/sw40;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/sw40;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v2, Ll/tw40;

    .line 79
    .line 80
    invoke-direct {v2, v1}, Ll/tw40;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/uw40;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/uw40;-><init>(Ll/vw40;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->B()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/pw40;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/pw40;-><init>(Ll/vw40;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/qw40;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ll/qw40;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/rw40;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/rw40;-><init>(Ll/vw40;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public Y3(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/nn2;->Y3(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/yw40;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Ll/yw40;->v(FZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Z3(ZI)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/nn2;->Z3(ZI)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/yw40;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/yw40;->i()Ll/e35;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/e35;->C()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/yw40;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/yw40;->k()Landroid/widget/LinearLayout;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    check-cast v0, Ll/yw40;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/yw40;->k()Landroid/widget/LinearLayout;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    int-to-float p1, p2

    .line 49
    const/high16 p2, 0x43700000    # 240.0f

    .line 50
    .line 51
    cmpg-float v0, p1, p2

    .line 52
    .line 53
    if-gtz v0, :cond_2

    .line 54
    .line 55
    sub-float p1, p2, p1

    .line 56
    .line 57
    div-float/2addr p1, p2

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const/4 p1, 0x0

    .line 60
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast p0, Ll/yw40;

    .line 63
    .line 64
    invoke-virtual {p0, p1, v1}, Ll/yw40;->v(FZ)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    int-to-float p0, p2

    .line 69
    const/high16 p1, 0x43340000    # 180.0f

    .line 70
    .line 71
    div-float/2addr p0, p1

    .line 72
    check-cast v0, Ll/yw40;

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ll/yw40;->e(F)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final j4(Ljava/lang/String;)Landroid/view/View;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/yw40;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/yw40;->f(Ljava/lang/String;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final k4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/yw40;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yw40;->i()Ll/e35;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/e35;->C()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final l4(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;Z)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-boolean p2, p0, Ll/vw40;->j:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/yw40;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/yw40;->q(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final m4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "-11000"

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-virtual {v1, v2, v3, v4, v4}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/nn2;->X3()V

    .line 22
    .line 23
    .line 24
    const-string v0, "e_live_vip_customer_service"

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
