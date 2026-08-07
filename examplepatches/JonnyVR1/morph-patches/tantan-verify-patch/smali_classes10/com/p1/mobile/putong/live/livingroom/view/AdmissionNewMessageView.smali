.class public Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public i:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

.field public k:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t90;->a(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_4

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 38
    .line 39
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_4

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lcom/immomo/velib/anim/model/Element;

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/immomo/velib/anim/model/Element;->getId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 70
    .line 71
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->typeIsImageUrl()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_3

    .line 84
    .line 85
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->value:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/immomo/velib/anim/model/Element;->setUrl(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->typeIsText()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->value:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Lcom/immomo/velib/anim/model/Element;->setText(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    :goto_2
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->k:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->a:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/udl0;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/udl0;->b()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->c(Ljava/util/List;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->E1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v0, "svga"

    .line 16
    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const-string v0, "video"

    .line 30
    .line 31
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public getUid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p1, "svga"

    .line 7
    .line 8
    invoke-static {p1}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x0

    .line 13
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    :try_start_1
    const-string v2, "templateUrl"

    .line 19
    .line 20
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {p1, v3}, Ll/l4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-object v1, v0

    .line 39
    :catch_1
    invoke-static {p2}, Ll/muj;->A(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->clearInsertData()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->h:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 48
    .line 49
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView$b;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x1

    .line 59
    invoke-virtual {p1, p2, p0, v0, v1}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hre;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Ll/s90;

    .line 9
    .line 10
    invoke-direct {p2, p0, p1}, Ll/s90;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ll/hre;->n(Ll/z20;)Ll/hre;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jfl0;->n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 1

    .line 1
    new-instance p2, Ll/hre;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p2, v0}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Ll/hre;->j(Ljava/util/List;)Ll/hre;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p2, p1}, Ll/hre;->k(Ljava/util/List;)Ll/hre;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->i:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "context_livingAct"

    .line 11
    .line 12
    invoke-static {p0, v0, p1, v1}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->a:Lv/VDraweeView;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "context_livingAct"

    .line 11
    .line 12
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->c:Lv/VDraweeView;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x1

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->c:Lv/VDraweeView;

    .line 33
    .line 34
    sget v5, Ll/i0k;->a:I

    .line 35
    .line 36
    invoke-static {v0, v1, v5}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->d:Lv/VDraweeView;

    .line 50
    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->d:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 64
    .line 65
    const/4 v1, 0x6

    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 74
    .line 75
    const/4 v1, 0x7

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 77
    .line 78
    .line 79
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 80
    .line 81
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {v0, v1, v2, v5}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->f:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getContentText(Landroid/content/Context;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->f:Lv/VText;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_3

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->b:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-static {p0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->b:Lv/VDraweeView;

    .line 136
    .line 137
    invoke-static {p0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p0, v0}, Lcom/immomo/velib/player/VideoEffectView;->setRenderMode(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setAnim(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->k:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method
