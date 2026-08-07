.class public Ll/pks;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

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

.method public static bridge synthetic a(Ll/pks;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/pks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pks;->h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/pks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 2
    .line 3
    iget-object p2, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p2, v0}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 17
    .line 18
    :cond_0
    iget-object p2, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

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
    iget-object p2, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 27
    .line 28
    sget v0, Ll/bnl0;->e:I

    .line 29
    .line 30
    invoke-virtual {p1, p2, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

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

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

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
    invoke-virtual {p0}, Ll/pks;->j()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pks;->c(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3, p4, p5}, Ll/pks;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pks;->c(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1, p3, p4}, Ll/pks;->g(Landroid/content/Context;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final g(Landroid/content/Context;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 2

    .line 1
    invoke-static {p2}, Ll/muj;->I(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->clearInsertData()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "HeadisHere"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->setKey(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {v0, v1}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->setType(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/immomo/svgaplayer/bean/InsertImgBean;->setImgUrl(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->insertBean(Lcom/immomo/svgaplayer/bean/BaseInsertBean;)Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 34
    .line 35
    sget-object v1, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;->ALIGN_PARENT_BOTTOM:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->setLayoutType(Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;)Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v0, "https://auto.tancdn.com/v1/raw/719775d5-33be-45b7-9d72-3eb7f6dffe9610.so"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/pks$b;

    .line 51
    .line 52
    invoke-direct {v0, p0, p2, p3}, Ll/pks$b;-><init>(Ll/pks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->downloadOnly()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    new-instance v1, Ll/pks$c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p3}, Ll/pks$c;-><init>(Ll/pks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {v0, p2, p0, p1, v1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnimWithJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1, p2}, Ll/muj;->M(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "svga"

    .line 10
    .line 11
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 17
    .line 18
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :try_start_1
    const-string v3, "templateUrl"

    .line 22
    .line 23
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v4, v5}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v0, v4}, Ll/l4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-object v2, v1

    .line 42
    :catch_1
    invoke-static {p1}, Ll/muj;->A(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Ll/pks;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 46
    .line 47
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    new-instance v3, Ll/pks$a;

    .line 52
    .line 53
    invoke-direct {v3, p0, p2, p3, p1}, Ll/pks$a;-><init>(Ll/pks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {v0, v2, p1, v1, v3}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/pks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method
