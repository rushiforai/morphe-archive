.class public Ll/oks;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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


# virtual methods
.method public final a(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/oks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 2
    .line 3
    iget-object p2, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 17
    .line 18
    :cond_0
    iget-object p2, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    iget-object p2, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    sget v0, Ll/bnl0;->e:I

    .line 29
    .line 30
    invoke-virtual {p1, p2, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/oks;->f()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final c(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "http://"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const-string p0, "https://"

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public d(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/oks;->a(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3, p4, p5}, Ll/oks;->e(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final e(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 3

    .line 1
    invoke-static {p2}, Ll/muj;->I(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Ll/oks;->c(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "HeadisHere"

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/oks$b;

    .line 48
    .line 49
    invoke-direct {v0, p0, p2, p3}, Ll/oks$b;-><init>(Ll/oks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ll/oks$a;

    .line 61
    .line 62
    invoke-direct {v0, p0, p2, p3}, Ll/oks$a;-><init>(Ll/oks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object p0, p0, Ll/oks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method
