.class public Ll/wuj;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/knu;",
        ">",
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    iput-object p3, p0, Ll/wuj;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic R2(Ll/wuj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wuj;->Y2(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic S2(Ll/wuj;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wuj;->W2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic T2(Ll/wuj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wuj;->X2(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic U2(Ll/wuj;Ll/kne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wuj;->Z2(Ll/kne0;)V

    return-void
.end method

.method private synthetic W2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic X2(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Y2(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->v()V

    .line 6
    .line 7
    .line 8
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
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->b()Ll/v3f$d;

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
    new-instance v1, Ll/ouj;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ouj;-><init>(Ll/wuj;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->d()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/quj;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/quj;-><init>(Ll/wuj;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->c()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/suj;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/suj;-><init>(Ll/wuj;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public V2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wuj;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;->c(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z2(Ll/kne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->e()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a3(Ll/jb0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;

    .line 4
    .line 5
    new-instance v1, Ll/uuj;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/uuj;-><init>(Ll/wuj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftOperationView;->u(Ll/jb0;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wuj;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
