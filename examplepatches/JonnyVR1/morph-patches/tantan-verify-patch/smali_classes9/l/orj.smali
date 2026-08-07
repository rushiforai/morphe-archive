.class public Ll/orj;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/lang/String;

.field public j:Ll/kpj;

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;",
            "Lv/VDraweeView;",
            "Lv/VDraweeView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/orj;->k:I

    .line 6
    .line 7
    iput p1, p0, Ll/orj;->l:I

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->k(Lv/VDraweeView;Lv/VDraweeView;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic J3(Ll/orj;Ll/y20;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/orj;->R3(Ll/y20;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic K3(Ll/orj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/orj;->P3(Ll/vxj0;)V

    return-void
.end method

.method private synthetic P3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/orj;->L3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public L3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public M3(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/orj;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/orj;->i:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/vxr;->a()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/nrj;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/nrj;-><init>(Ll/orj;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public N3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->getTopSkinHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public O3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->u()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic R3(Ll/y20;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/orj;->i:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/orj;->j:Ll/kpj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->L(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget v1, p0, Ll/orj;->k:I

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/kpj;->h(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->L(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget v1, p0, Ll/orj;->l:I

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/kpj;->g(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->L(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void

    .line 48
    :cond_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/kpj;->f()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->L(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)V

    .line 57
    .line 58
    .line 59
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->closeH5Skin()Ll/v3f$c;

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
    new-instance v1, Ll/mrj;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/mrj;-><init>(Ll/orj;)V

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

.method public T3(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/orj;->l:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Ll/orj;->l:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/orj;->k:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/orj;->S3()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public U3(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/orj;->k:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Ll/orj;->k:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/orj;->l:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/orj;->S3()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V3(Ll/kpj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/orj;->j:Ll/kpj;

    .line 2
    .line 3
    return-void
.end method

.method public p3(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Ll/qzj;->l(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
