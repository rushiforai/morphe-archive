.class public Ll/g2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/k2k;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

.field public b:Ll/k2k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/k2k<",
            "Ll/rwn0;",
            "Ll/g2k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;->d0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/k2k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g2k;->b:Ll/k2k;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;->c0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallListDetail;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;->setListDate(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k2k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g2k;->a(Ll/k2k;)V

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

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g2k;->b:Ll/k2k;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;->f0(Ll/k2k;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
