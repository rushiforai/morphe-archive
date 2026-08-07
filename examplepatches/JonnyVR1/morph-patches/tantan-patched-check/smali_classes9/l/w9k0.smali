.class public Ll/w9k0;
.super Ll/ms2;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ms2<",
        "Ll/w9k0<",
        "TD;>;TD;>;",
        "Ll/iam<",
        "Ll/w9k0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ms2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/w9k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j4(Ll/w9k0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w9k0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method


# virtual methods
.method public P3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->D2()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/w9k0;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w9k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w9k0;->k4(Ll/w9k0;)V

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

.method public k4(Ll/w9k0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/w9k0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public l4(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ms2;->c4()Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/e3t;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w9k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;->data:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/w9k0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    iget-object v0, p0, Ll/w9k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-virtual {p0}, Ll/ms2;->b4()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1, v0}, Ll/aiv;->K0(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/v9k0;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/v9k0;-><init>(Ll/w9k0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method
