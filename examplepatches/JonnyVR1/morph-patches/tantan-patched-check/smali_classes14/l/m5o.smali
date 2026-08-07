.class public final Ll/m5o;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J%\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\'\u0010\r\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\'\u0010\u000e\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000c\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/m5o;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
        "liveSquareTab",
        "",
        "isDefaultTab",
        "Lcom/tantan/live/home/eventbus/LiveHomeEventBus;",
        "eventBus",
        "Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;",
        "e",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;",
        "c",
        "d",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/m5o;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/m5o;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/m5o;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/m5o;->INSTANCE:Ll/m5o;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static b(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public final c(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sparse-switch v0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :sswitch_0
    const-string v0, "square-nearby"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;-><init>()V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :sswitch_1
    const-string v0, "square-intlFollowing"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;-><init>()V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :sswitch_2
    const-string v0, "square-intlGame"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;-><init>()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :sswitch_3
    const-string v0, "square-suggested"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 66
    .line 67
    check-cast p0, Ljava/util/Collection;

    .line 68
    .line 69
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;-><init>()V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 82
    .line 83
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;-><init>()V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :sswitch_4
    const-string v0, "voice-live"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_5

    .line 94
    .line 95
    :goto_0
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;-><init>()V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_5
    new-instance p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;

    .line 102
    .line 103
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;-><init>()V

    .line 104
    .line 105
    .line 106
    :goto_1
    new-instance v0, Landroid/os/Bundle;

    .line 107
    .line 108
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v1, "live_square_tab_info"

    .line 112
    .line 113
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 114
    .line 115
    .line 116
    const-string v1, "live_square_is_default_tab"

    .line 117
    .line 118
    invoke-virtual {v0, v1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    new-instance p2, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 122
    .line 123
    invoke-direct {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;-><init>()V

    .line 124
    .line 125
    .line 126
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setTabId(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setPageId(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 137
    .line 138
    iput-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setName(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 146
    .line 147
    const-string p1, "TAB_INFO_BEAN"

    .line 148
    .line 149
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 153
    .line 154
    .line 155
    new-instance p1, Ll/l5o;

    .line 156
    .line 157
    invoke-direct {p1, p3}, Ll/l5o;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->i5(Ll/pcj;)V

    .line 161
    .line 162
    .line 163
    return-object p0

    .line 164
    nop

    .line 165
    :sswitch_data_0
    .sparse-switch
        -0x5d0f1f59 -> :sswitch_4
        -0x388c198d -> :sswitch_3
        -0x22303561 -> :sswitch_2
        0x253c9804 -> :sswitch_1
        0x36da312f -> :sswitch_0
    .end sparse-switch
.end method

.method public final d(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sparse-switch v0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :sswitch_0
    const-string v0, "square-nearby"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;-><init>()V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :sswitch_1
    const-string v0, "square-intlFollowing"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;-><init>()V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :sswitch_2
    const-string v0, "square-intlGame"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/game/IntlGameTabFrag;-><init>()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :sswitch_3
    const-string v0, "square-suggested"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 66
    .line 67
    check-cast p0, Ljava/util/Collection;

    .line 68
    .line 69
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;

    .line 76
    .line 77
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/mainSubTab/IntlLiveSquareMainSubFrag;-><init>()V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 82
    .line 83
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;-><init>()V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :sswitch_4
    const-string v0, "voice-live"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_5

    .line 94
    .line 95
    :goto_0
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;-><init>()V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_5
    new-instance p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;

    .line 102
    .line 103
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;-><init>()V

    .line 104
    .line 105
    .line 106
    :goto_1
    new-instance v0, Landroid/os/Bundle;

    .line 107
    .line 108
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v1, "live_square_tab_info"

    .line 112
    .line 113
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 114
    .line 115
    .line 116
    const-string p1, "live_square_is_default_tab"

    .line 117
    .line 118
    invoke-virtual {v0, p1, p2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Ll/k5o;

    .line 125
    .line 126
    invoke-direct {p1, p3}, Ll/k5o;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->i5(Ll/pcj;)V

    .line 130
    .line 131
    .line 132
    return-object p0

    .line 133
    :sswitch_data_0
    .sparse-switch
        -0x5d0f1f59 -> :sswitch_4
        -0x388c198d -> :sswitch_3
        -0x22303561 -> :sswitch_2
        0x253c9804 -> :sswitch_1
        0x36da312f -> :sswitch_0
    .end sparse-switch
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/p6s;->t0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/m5o;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Ll/m5o;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;ZLcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
