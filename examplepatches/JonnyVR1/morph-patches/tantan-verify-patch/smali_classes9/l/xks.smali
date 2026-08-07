.class public Ll/xks;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/xks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xks;->d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    return-void
.end method

.method public static synthetic b(Ll/xks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xks;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/xks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 2
    .line 3
    iget-object p2, p0, Ll/xks;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/xks;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 17
    .line 18
    :cond_0
    iget-object p2, p0, Ll/xks;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    iget-object p2, p0, Ll/xks;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 27
    .line 28
    sget v0, Ll/bnl0;->e:I

    .line 29
    .line 30
    invoke-virtual {p1, p2, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/xks;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/muj;->N(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-static {p2, p0, p3}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p1, p0, p2}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xks;->c(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3, p4, p5}, Ll/xks;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 2

    .line 1
    invoke-static {p1, p2}, Ll/muj;->R(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hre;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hre;->k(Ljava/util/List;)Ll/hre;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/vks;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1, p2, p3}, Ll/vks;-><init>(Ll/xks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/hre;->i(Ll/x20;)Ll/hre;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/wks;

    .line 27
    .line 28
    invoke-direct {v0, p0, p2, p3}, Ll/wks;-><init>(Ll/xks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/hre;->l(Ll/x20;)Ll/hre;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p3, p0, Ll/xks;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 36
    .line 37
    invoke-static {p3, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/xks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
