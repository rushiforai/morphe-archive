.class public Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;
.super Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public S(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->getTeamViewList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_1
    const/4 v0, 0x0

    .line 29
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->i:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ge v0, v1, :cond_3

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->i:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 44
    .line 45
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->k0(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    return-object v1

    .line 52
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sfp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f0(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->getTeamViewList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v2, v3, :cond_2

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 61
    .line 62
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->e:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 63
    .line 64
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 75
    .line 76
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->e:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    if-eqz v3, :cond_1

    .line 89
    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->e:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->i:Landroid/widget/LinearLayout;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-ge v1, v0, :cond_4

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->i:Landroid/widget/LinearLayout;

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    if-eqz v2, :cond_3

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->getBindInfo()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-eqz v2, :cond_3

    .line 135
    .line 136
    return-object v0

    .line 137
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_4
    const/4 p0, 0x0

    .line 141
    return-object p0
.end method

.method public getLineView()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSingleView()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->i:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTeamViewList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->e:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 6
    .line 7
    filled-new-array {v0, v1, p0}, [Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getViewId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;

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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelOneOrThreePairView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
