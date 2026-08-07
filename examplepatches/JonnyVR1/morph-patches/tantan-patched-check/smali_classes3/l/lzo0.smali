.class public Ll/lzo0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/k1p0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;

.field public n:Lv/VImage;

.field public o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

.field public p:Ll/z0p0;

.field public q:Ll/k1p0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/k1p0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->sa:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v1}, Ll/qag0;->e(Z)Ll/rq2;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic F(Ll/lzo0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lzo0;->K()V

    return-void
.end method

.method public static synthetic G(Ll/lzo0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lzo0;->L(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic H(Ll/lzo0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lzo0;->M(Landroid/view/View;)V

    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/lzo0;->p:Ll/z0p0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p1, p0, Ll/lzo0;->p:Ll/z0p0;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Ll/lzo0;->p:Ll/z0p0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/lzo0;->n:Lv/VImage;

    .line 20
    .line 21
    iget-object v2, p0, Ll/lzo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 22
    .line 23
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 30
    .line 31
    check-cast p0, Ll/k1p0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/k1p0;->s4()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v0, 0x0

    .line 41
    :goto_0
    invoke-virtual {p1, v1, v0}, Ll/z0p0;->g(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lzo0;->q:Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mzo0;->a(Ll/lzo0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/k1p0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lzo0;->q:Ll/k1p0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic K()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lzo0;->q:Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/k1p0;->g4()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/lzo0;->q:Ll/k1p0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k1p0;->e4()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic L(Ljava/lang/Integer;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/lzo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    move v1, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/lzo0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ne v1, v3, :cond_1

    .line 24
    .line 25
    move v2, v3

    .line 26
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/lzo0;->q:Ll/k1p0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Ll/k1p0;->p4(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final N()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lzo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/lzo0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->f(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public O(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lzo0;->N()V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/lzo0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpView;->A()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/lzo0;->p:Ll/z0p0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/lzo0;->p:Ll/z0p0;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lzo0;->J(Ll/k1p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Ll/lzo0;->I(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/lzo0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->fi:I

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->vj:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->g(II)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/lzo0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->setMargin(Z)V

    .line 17
    .line 18
    .line 19
    const/16 p1, 0x50

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->VOICE_SWEET_CP:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/fzo0;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/fzo0;-><init>(Ll/lzo0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->y(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a$c;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/lzo0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;

    .line 38
    .line 39
    new-instance v0, Ll/gzo0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/gzo0;-><init>(Ll/lzo0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetTabView;->setOnTabSelectedListener(Ll/y20;)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/z0p0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/lzo0;->C0()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 54
    .line 55
    check-cast v1, Ll/k1p0;

    .line 56
    .line 57
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    new-instance v2, Ll/hzo0;

    .line 61
    .line 62
    invoke-direct {v2, v1}, Ll/hzo0;-><init>(Ll/k1p0;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 66
    .line 67
    check-cast v1, Ll/k1p0;

    .line 68
    .line 69
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    new-instance v3, Ll/izo0;

    .line 73
    .line 74
    invoke-direct {v3, v1}, Ll/izo0;-><init>(Ll/k1p0;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 78
    .line 79
    check-cast v1, Ll/k1p0;

    .line 80
    .line 81
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    new-instance v4, Ll/jzo0;

    .line 85
    .line 86
    invoke-direct {v4, v1}, Ll/jzo0;-><init>(Ll/k1p0;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p1, v0, v2, v3, v4}, Ll/z0p0;-><init>(Landroid/content/Context;Ll/x20;Ll/x20;Ll/x20;)V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ll/lzo0;->p:Ll/z0p0;

    .line 93
    .line 94
    iget-object p1, p0, Ll/lzo0;->n:Lv/VImage;

    .line 95
    .line 96
    new-instance v0, Ll/kzo0;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/kzo0;-><init>(Ll/lzo0;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k1p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lzo0;->J(Ll/k1p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
