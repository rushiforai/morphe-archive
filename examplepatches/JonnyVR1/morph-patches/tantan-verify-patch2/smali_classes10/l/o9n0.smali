.class public Ll/o9n0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/k9n0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:I

.field public final j:I

.field public k:Ll/g4s;

.field public l:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>(Ll/dum;Ll/k9n0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x43360000    # 182.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/o9n0;->i:I

    .line 11
    .line 12
    const/high16 p1, 0x42500000    # 52.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/o9n0;->j:I

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Li:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic K3(Ll/o9n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o9n0;->R3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L3(Ll/o9n0;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o9n0;->S3(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final M3(Landroid/view/View;)[I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public N3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o9n0;->k:Ll/g4s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/o9n0;->k:Ll/g4s;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final O3()Landroid/widget/FrameLayout;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o9n0;->l:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/widget/FrameLayout;

    .line 6
    .line 7
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 8
    .line 9
    iget-object v1, v1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/o9n0;->l:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    sget v2, Ll/bnl0;->e:I

    .line 19
    .line 20
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/o9n0;->l:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    new-instance v1, Ll/m9n0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/m9n0;-><init>(Ll/o9n0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Ll/o9n0;->l:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    return-object p0
.end method

.method public final P3()Ll/g4s;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o9n0;->k:Ll/g4s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/g4s;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/o9n0;->O3()Landroid/widget/FrameLayout;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, p0, v1}, Ll/g4s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/o9n0;->k:Ll/g4s;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/o9n0;->k:Ll/g4s;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic R3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9n0;->N3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S3(Landroid/view/View;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/o9n0;->M3(Landroid/view/View;)[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v1, 0x0

    .line 10
    aget v2, v0, v1

    .line 11
    .line 12
    div-int/lit8 p1, p1, 0x2

    .line 13
    .line 14
    add-int/2addr v2, p1

    .line 15
    iget v3, p0, Ll/o9n0;->i:I

    .line 16
    .line 17
    div-int/lit8 v3, v3, 0x2

    .line 18
    .line 19
    sub-int/2addr v2, v3

    .line 20
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    aget v1, v0, v1

    .line 25
    .line 26
    add-int/2addr v1, p1

    .line 27
    sub-int/2addr v1, v2

    .line 28
    const/high16 p1, 0x40c00000    # 6.0f

    .line 29
    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    sub-int/2addr v1, p1

    .line 35
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p1, Ll/k9n0;

    .line 38
    .line 39
    iget-object p1, p1, Ll/k9n0;->a:Landroid/widget/ImageView;

    .line 40
    .line 41
    invoke-static {p1, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/o9n0;->O3()Landroid/widget/FrameLayout;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/o9n0;->O3()Landroid/widget/FrameLayout;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    aget v0, v0, v1

    .line 66
    .line 67
    iget v1, p0, Ll/o9n0;->j:I

    .line 68
    .line 69
    sub-int/2addr v0, v1

    .line 70
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    sub-int/2addr v0, v1

    .line 79
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 80
    .line 81
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 82
    .line 83
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/o9n0;->P3()Ll/g4s;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public T3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/rwn0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->liveId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/rwn0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->roomId:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->seq:J

    .line 33
    .line 34
    const/16 v1, 0xc

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->type:I

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;->roomType:I

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Z6(Lcom/p1/mobile/putong/live/base/data/BLiveChatReport;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ll/n9n0;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/n9n0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/o9n0;->N3()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public U3(Ll/vv4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o9n0;->N3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public V3(Landroid/view/View;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/k9n0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1, p2}, Ll/k9n0;->k(Landroid/view/LayoutInflater;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    new-instance v1, Ll/l9n0;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, p2}, Ll/l9n0;-><init>(Ll/o9n0;Landroid/view/View;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/o9n0;->N3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
