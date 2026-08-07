.class public abstract Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/w2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/ndp0;",
        ">;",
        "Ll/w2m;"
    }
.end annotation


# instance fields
.field public a:Ll/ndp0;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;",
            ">;"
        }
    .end annotation
.end field


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
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

    .line 17
    .line 18
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

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 21
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

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

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 24
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

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

    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 26
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 27
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
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

.method public W(Ll/ndp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->a:Ll/ndp0;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->l:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, ""

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_2

    .line 83
    .line 84
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Z)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->teamInfos:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    move v1, v0

    .line 17
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->teamInfos:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->teamInfos:Ljava/util/List;

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    if-ge v1, v2, :cond_1

    .line 27
    .line 28
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetTeamInfo;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 41
    .line 42
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->a:Ll/ndp0;

    .line 43
    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    move v6, v4

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    move v6, v0

    .line 49
    :goto_1
    invoke-virtual {v3, v5, p1, v2, v6}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;->e(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetTeamInfo;Z)V

    .line 50
    .line 51
    .line 52
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-ge v1, v2, :cond_2

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;

    .line 77
    .line 78
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->getSingleView()Landroid/widget/LinearLayout;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 94
    .line 95
    .line 96
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->singleUserIds:Ljava/util/List;

    .line 97
    .line 98
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_3

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->getLineView()Landroid/widget/LinearLayout;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->getLineView()Landroid/widget/LinearLayout;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    :goto_3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->singleUserIds:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-ge v0, v1, :cond_4

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    sget v2, Ll/yec0;->Qa:I

    .line 136
    .line 137
    const/4 v3, 0x0

    .line 138
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;

    .line 143
    .line 144
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->f:Landroid/widget/ImageView;

    .line 145
    .line 146
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 150
    .line 151
    sget v3, Ll/bnl0;->f:I

    .line 152
    .line 153
    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 154
    .line 155
    .line 156
    sget v3, Ll/qa00;->h:I

    .line 157
    .line 158
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 159
    .line 160
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->getSingleView()Landroid/widget/LinearLayout;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v3, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    .line 168
    .line 169
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

    .line 170
    .line 171
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->singleUserIds:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    check-cast v2, Ljava/lang/String;

    .line 181
    .line 182
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->playerInfos:Ljava/util/List;

    .line 183
    .line 184
    new-instance v5, Ll/rfp0;

    .line 185
    .line 186
    invoke-direct {v5, v2}, Ll/rfp0;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-static {v3, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;

    .line 194
    .line 195
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->a:Ll/ndp0;

    .line 196
    .line 197
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveItemInfoView;->r0(Ll/ndp0;Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanetPlayerInfo;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    add-int/lit8 v0, v0, 0x1

    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_4
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public abstract getLineView()Landroid/widget/LinearLayout;
.end method

.method public abstract getSingleView()Landroid/widget/LinearLayout;
.end method

.method public abstract getTeamViewList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTeamInfoView;",
            ">;"
        }
    .end annotation
.end method

.method public getViewId()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ndp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->W(Ll/ndp0;)V

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

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->getTeamViewList()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->getSingleView()Landroid/widget/LinearLayout;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/loveplanet/travel/VoiceVirtualLoveTravelBaseView;->c:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
