.class public Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/mvk0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

.field public b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public e:Ll/mvk0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ILjava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->m(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLl/udl0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->n(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLl/udl0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/muj;->P(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->l(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;)Ll/mvk0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tmu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mvk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->k(Ll/mvk0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final j(Ljava/util/List;Ljava/util/List;)V
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

.method public k(Ll/mvk0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Ll/muj;->N(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 15
    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-static {p2, p1, p0}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ILjava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p2, p3, p1}, Ll/muj;->O(ILjava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    return p3

    .line 10
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 16
    .line 17
    const/16 v0, 0x8

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p1, p3, p0}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 29
    .line 30
    .line 31
    return p3
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLl/udl0;)V
    .locals 1

    .line 1
    if-eqz p4, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    if-eqz p3, :cond_1

    .line 10
    .line 11
    invoke-virtual {p4}, Ll/udl0;->b()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_1

    .line 20
    .line 21
    iget-object p3, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->F:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 22
    .line 23
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iget-object p3, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->F:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 30
    .line 31
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_1

    .line 38
    .line 39
    iget-object p3, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->F:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 40
    .line 41
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {p4}, Ll/udl0;->b()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, p3, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->j(Ljava/util/List;Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, p2}, Ll/muj;->c(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-boolean p3, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->K:Z

    .line 55
    .line 56
    if-eqz p3, :cond_2

    .line 57
    .line 58
    invoke-virtual {p4}, Ll/udl0;->b()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    if-nez p3, :cond_2

    .line 67
    .line 68
    iget-object p3, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 69
    .line 70
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    if-nez p3, :cond_2

    .line 75
    .line 76
    iget-object p3, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 77
    .line 78
    invoke-virtual {p4}, Ll/udl0;->b()Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, p3, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->j(Ljava/util/List;Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    invoke-static {p1, p2}, Ll/muj;->c(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 89
    .line 90
    const/4 v0, 0x1

    .line 91
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    new-instance p3, Ll/sdl0$a;

    .line 95
    .line 96
    invoke-direct {p3}, Ll/sdl0$a;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p3, p4}, Ll/sdl0$a;->c(Ll/udl0;)Ll/sdl0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    sget p4, Ll/sdl0;->j:I

    .line 104
    .line 105
    invoke-virtual {p3, p4}, Ll/sdl0$a;->d(I)Ll/sdl0$a;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    const/4 p4, 0x0

    .line 110
    invoke-virtual {p3, p4}, Ll/sdl0$a;->b(Ljava/util/List;)Ll/sdl0$a;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    new-instance p4, Ll/gmw;

    .line 115
    .line 116
    invoke-direct {p4}, Ll/gmw;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p3, p4}, Ll/sdl0$a;->e(Ll/txl;)Ll/sdl0$a;

    .line 120
    .line 121
    .line 122
    move-result-object p3

    .line 123
    invoke-virtual {p3}, Ll/sdl0$a;->a()Ll/sdl0;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 128
    .line 129
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setVideoEffectConfig(Ll/sdl0;)V

    .line 130
    .line 131
    .line 132
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 133
    .line 134
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->prepare()V

    .line 135
    .line 136
    .line 137
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 138
    .line 139
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->start()V

    .line 140
    .line 141
    .line 142
    invoke-static {p1, p2}, Ll/muj;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 143
    .line 144
    .line 145
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 146
    .line 147
    new-instance p4, Ll/qmu;

    .line 148
    .line 149
    invoke-direct {p4, p1, p2}, Ll/qmu;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setOnPrepareListener(Lcom/immomo/velib/player/d$d;)V

    .line 153
    .line 154
    .line 155
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 156
    .line 157
    new-instance p4, Ll/rmu;

    .line 158
    .line 159
    invoke-direct {p4, p0, p1, p2}, Ll/rmu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setCompletionListener(Ll/y9m;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 166
    .line 167
    new-instance p3, Ll/smu;

    .line 168
    .line 169
    invoke-direct {p3, p0, p2}, Ll/smu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setOnErrorListener(Ll/z9m;)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_3
    :goto_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 177
    .line 178
    invoke-static {p1, p4, p3, p2}, Ll/muj;->E(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Ll/udl0;Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 179
    .line 180
    .line 181
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 182
    .line 183
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    const/4 p1, 0x0

    .line 188
    invoke-static {p2, p1, p0}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

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

.method public final p(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 6

    .line 1
    invoke-static {p1}, Ll/muj;->G(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/jfv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/jfv;->f()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {p1}, Ll/muj;->v(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {p1, p0}, Ll/rre;->r(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->G:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->p(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->F:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->F:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 52
    .line 53
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 54
    .line 55
    const-wide/16 v2, 0x1

    .line 56
    .line 57
    cmp-long v0, v0, v2

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const/4 v0, 0x0

    .line 64
    :goto_0
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->O:Ljava/lang/String;

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 74
    .line 75
    :goto_1
    invoke-virtual {v1, v2}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 80
    .line 81
    new-instance v3, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;

    .line 82
    .line 83
    invoke-direct {v3, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v1, v3}, Ll/mvk0;->W2(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Ll/w8e;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->e:Ll/mvk0;

    .line 91
    .line 92
    invoke-virtual {v3}, Ll/ahu;->N2()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v0, :cond_4

    .line 97
    .line 98
    iget-object v4, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->O:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    iget-object v4, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 102
    .line 103
    :goto_2
    xor-int/lit8 v5, v2, 0x1

    .line 104
    .line 105
    invoke-static {v3, v4, v5}, Ll/rre;->E(ZLjava/lang/String;Z)V

    .line 106
    .line 107
    .line 108
    if-eqz v2, :cond_9

    .line 109
    .line 110
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v2}, Ll/p6s;->E1()Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    const-string v3, "video"

    .line 119
    .line 120
    const-string v4, "svga"

    .line 121
    .line 122
    if-eqz v2, :cond_6

    .line 123
    .line 124
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-nez v2, :cond_5

    .line 131
    .line 132
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_6

    .line 139
    .line 140
    :cond_5
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->x(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_6
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    if-eqz v2, :cond_7

    .line 151
    .line 152
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->v(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_7
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_8

    .line 163
    .line 164
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->w(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_8
    const-string p0, "game"

    .line 169
    .line 170
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->s(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/muj;->I(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/immomo/svgaplayer/bean/InsertImgBean;->setImgUrl(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->insertBean(Lcom/immomo/svgaplayer/bean/BaseInsertBean;)Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 34
    .line 35
    sget-object v1, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;->ALIGN_PARENT_BOTTOM:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->setLayoutType(Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView$LayoutType;)Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "https://auto.tancdn.com/v1/raw/719775d5-33be-45b7-9d72-3eb7f6dffe9610.so"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;

    .line 55
    .line 56
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$c;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->downloadOnly()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$d;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

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

.method public final v(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 46
    .line 47
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    new-instance v3, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$b;

    .line 52
    .line 53
    invoke-direct {v3, p0, p2, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer$b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    invoke-virtual {v0, v2, p0, v1, v3}, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;->startSVGAAnimWithLayJson(Ljava/lang/String;ILcom/immomo/svgaplayer/listener/SVGAClickAreaListener;Lcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 7

    .line 1
    invoke-static {p1, p2}, Ll/muj;->R(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 7
    .line 8
    .line 9
    const-string v0, "video"

    .line 10
    .line 11
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    move-object v1, v0

    .line 16
    check-cast v1, Ll/jfl0;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v6, Ll/pmu;

    .line 27
    .line 28
    invoke-direct {v6, p0, p1, p2, p3}, Ll/pmu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/jfl0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/jfl0$a;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Ll/muj;->R(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hre;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/hre;->k(Ljava/util/List;)Ll/hre;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v2}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->b:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->j()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->d:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 35
    .line 36
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public z()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
