.class public Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/w2m;


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;

.field public e:Landroidx/constraintlayout/widget/Guideline;

.field public f:Landroidx/constraintlayout/widget/Guideline;

.field public g:Landroidx/constraintlayout/widget/Guideline;

.field public h:Landroidx/constraintlayout/widget/Guideline;

.field public i:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

.field public o:Ll/ndp0;

.field public final p:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 21
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 24
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public S(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindPlayerInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindPlayerInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public W(Ll/ndp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->o:Ll/ndp0;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string p2, "renderVolumeWave illegal pos:"

    .line 28
    .line 29
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "lovePlanet"

    .line 42
    .line 43
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "prepare"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->stage:Lcom/p1/mobile/putong/live/base/data/LovePlanetStage;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "introduction"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->host:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->playerInfos:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->playerInfos:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->l0(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public f0(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_1
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public getViewId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hfp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->k0(Ljava/util/Set;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v1, Ll/gfp0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/gfp0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p2, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_3

    .line 36
    .line 37
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 44
    .line 45
    iget v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 46
    .line 47
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 56
    .line 57
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    iget v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 62
    .line 63
    if-eqz v4, :cond_2

    .line 64
    .line 65
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->o:Ll/ndp0;

    .line 73
    .line 74
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 75
    .line 76
    iget v6, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 77
    .line 78
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    check-cast v5, Ll/pf60;

    .line 87
    .line 88
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    iget-object v5, v5, Ll/pf60;->b:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v5, Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v3, v4, v2, v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->q0(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->o:Ll/ndp0;

    .line 99
    .line 100
    if-nez p1, :cond_1

    .line 101
    .line 102
    const-string v5, ""

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 106
    .line 107
    :goto_1
    invoke-virtual {v3, v4, v2, v5, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->p0(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v3, "renderChoiceStage illegal pos:"

    .line 114
    .line 115
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    const-string v3, "lovePlanet"

    .line 126
    .line 127
    invoke-static {v3, v2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->k0(Ljava/util/Set;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final k0(Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/util/Map$Entry;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Ll/pf60;

    .line 56
    .line 57
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v3, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->l0(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->o0(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v3, "renderEmptySeats illegal pos:"

    .line 84
    .line 85
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const-string v2, "lovePlanet"

    .line 100
    .line 101
    invoke-static {v2, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    return-void
.end method

.method public l0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 29
    .line 30
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 31
    .line 32
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 47
    .line 48
    if-eqz v3, :cond_0

    .line 49
    .line 50
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->o:Ll/ndp0;

    .line 58
    .line 59
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 60
    .line 61
    iget v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->position:I

    .line 62
    .line 63
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, Ll/pf60;

    .line 72
    .line 73
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object v4, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v4, Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v3, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->q0(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v2, "renderIntroStage illegal pos:"

    .line 87
    .line 88
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const-string v2, "lovePlanet"

    .line 99
    .line 100
    invoke-static {v2, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->k0(Ljava/util/Set;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public onFinishInflate()V
    .locals 9

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->i:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->j:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 27
    .line 28
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 32
    .line 33
    const/4 v3, 0x3

    .line 34
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->k:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 39
    .line 40
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->l:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 51
    .line 52
    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 56
    .line 57
    const/4 v5, 0x5

    .line 58
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->m:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 63
    .line 64
    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->p:Ljava/util/Map;

    .line 68
    .line 69
    const/4 v6, 0x6

    .line 70
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->n:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 75
    .line 76
    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 80
    .line 81
    const-string v7, "https://fe-static.tancdn.com/v1/raw/d4b1debe-1fe6-44b6-ac1e-2ad3569e7fb812.svga"

    .line 82
    .line 83
    const-string v8, "https://fe-static.tancdn.com/v1/raw/33d9d067-286e-4dde-b289-2c7a2b22c2d913.svga"

    .line 84
    .line 85
    invoke-static {v7, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    invoke-interface {v0, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 93
    .line 94
    const-string v1, "https://fe-static.tancdn.com/v1/raw/36c64564-b780-4711-8981-73d7b4f7ae7e13.svga"

    .line 95
    .line 96
    const-string v7, "https://fe-static.tancdn.com/v1/raw/2e81a695-04a4-4021-8708-0b64729bd30c12.svga"

    .line 97
    .line 98
    invoke-static {v1, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 106
    .line 107
    const-string v1, "https://fe-static.tancdn.com/v1/raw/f6631a76-8f8e-4270-80a9-35eda39fca4e13.svga"

    .line 108
    .line 109
    const-string v2, "https://fe-static.tancdn.com/v1/raw/5134824b-7680-4a51-be03-5200ffda457a12.svga"

    .line 110
    .line 111
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 119
    .line 120
    const-string v1, "https://fe-static.tancdn.com/v1/raw/13db024a-6f9c-4207-95fa-defd1ff8425113.svga"

    .line 121
    .line 122
    const-string v2, "https://fe-static.tancdn.com/v1/raw/153c6b47-5d6a-4ca6-8249-f6a4a8c214dd12.svga"

    .line 123
    .line 124
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 132
    .line 133
    const-string v1, "https://fe-static.tancdn.com/v1/raw/7e5db513-c108-4ad1-85ba-43faaae242c512.svga"

    .line 134
    .line 135
    const-string v2, "https://fe-static.tancdn.com/v1/raw/9f83c222-e639-42cb-baad-aa55114f2ada13.svga"

    .line 136
    .line 137
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/view/VoiceVirtualLovePlanetStepIntroAndChoiceWidgetView;->q:Ljava/util/Map;

    .line 145
    .line 146
    const-string v0, "https://fe-static.tancdn.com/v1/raw/4a66208f-14f1-4c34-bee7-1d157a232b3913.svga"

    .line 147
    .line 148
    const-string v1, "https://fe-static.tancdn.com/v1/raw/1e64f04a-db2d-4ab2-9bd8-6875451d6f6513.svga"

    .line 149
    .line 150
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-interface {p0, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    return-void
.end method
