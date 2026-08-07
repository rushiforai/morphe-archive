.class public Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VIcon;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

.field public h:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-wide/16 p1, 0x0

    .line 5
    .line 6
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->h:J

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic P(Ll/y20;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wfy;->a(Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;Ll/y20;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isAnonymous()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    move-object v2, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const/4 v0, 0x0

    .line 70
    goto :goto_0

    .line 71
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isFollowed()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    sget v0, Ll/gbc0;->R0:I

    .line 78
    .line 79
    :goto_2
    move v3, v0

    .line 80
    goto :goto_3

    .line 81
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isMatched()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    sget v0, Ll/gbc0;->U0:I

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isSuperLikedMe()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    sget v0, Ll/gbc0;->W0:I

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isLikedUser()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    sget v0, Ll/gbc0;->S0:I

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isPicksUser()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_6

    .line 113
    .line 114
    sget v0, Ll/gbc0;->V0:I

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isSeeUser()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_7

    .line 122
    .line 123
    sget v0, Ll/gbc0;->T0:I

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_7
    const/4 v0, -0x1

    .line 127
    goto :goto_2

    .line 128
    :goto_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 133
    .line 134
    const-string v1, "live"

    .line 135
    .line 136
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    if-ne v0, v1, :cond_8

    .line 141
    .line 142
    const-string v0, "\u76f4\u64ad\u4e2d"

    .line 143
    .line 144
    :goto_4
    move-object v5, v0

    .line 145
    goto :goto_5

    .line 146
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 151
    .line 152
    const-string v1, "liveVoice"

    .line 153
    .line 154
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    if-ne v0, v1, :cond_9

    .line 159
    .line 160
    const-string v0, "\u8bed\u804a\u4e2d"

    .line 161
    .line 162
    goto :goto_4

    .line 163
    :cond_9
    const-string v0, "\u65e0\u72b6\u6001"

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :goto_5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 167
    .line 168
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 169
    .line 170
    move-object v1, p0

    .line 171
    move-object v6, p2

    .line 172
    move-object v7, p3

    .line 173
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->S(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public final S(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->c:Lv/VDraweeView;

    .line 10
    .line 11
    sget v2, Ll/qa00;->D:I

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1, v2, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->e:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->f:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/ufy;

    .line 30
    .line 31
    invoke-direct {p1, p5}, Ll/ufy;-><init>(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Ll/vfy;

    .line 38
    .line 39
    invoke-direct {p1, p6}, Ll/vfy;-><init>(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->d:Lv/VIcon;

    .line 46
    .line 47
    if-lez p2, :cond_1

    .line 48
    .line 49
    const/4 p3, 0x1

    .line 50
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->d:Lv/VIcon;

    .line 54
    .line 55
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final T()V
    .locals 9

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->h:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 9
    .line 10
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const-string v3, "meet_photo"

    .line 15
    .line 16
    const-string v4, "meet_realtime_relationship"

    .line 17
    .line 18
    const-string v5, "p_meet"

    .line 19
    .line 20
    const-wide/16 v6, 0x1f4

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 31
    .line 32
    const-string v8, "live"

    .line 33
    .line 34
    invoke-static {v2, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    cmp-long v2, v0, v6

    .line 51
    .line 52
    if-ltz v2, :cond_0

    .line 53
    .line 54
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->h:J

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 61
    .line 62
    invoke-static {v0}, Ll/dby;->c(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "module"

    .line 71
    .line 72
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    const-string v2, "other_user_id"

    .line 83
    .line 84
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v2, "live_enter_source"

    .line 89
    .line 90
    const-string v3, "realtime_meet"

    .line 91
    .line 92
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    filled-new-array {v0, v1, p0, v2}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "e_live_room_enter"

    .line 101
    .line 102
    invoke-static {v0, v5, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 107
    .line 108
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_1

    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 115
    .line 116
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 121
    .line 122
    const-string v8, "liveVoice"

    .line 123
    .line 124
    invoke-static {v2, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_1

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 131
    .line 132
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_1

    .line 139
    .line 140
    cmp-long v0, v0, v6

    .line 141
    .line 142
    if-ltz v0, :cond_1

    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->g:Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 145
    .line 146
    invoke-static {p0}, Ll/dby;->c(Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    const-string v0, "audio_card_type"

    .line 155
    .line 156
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    const-string v0, "e_live_audio_room_enter"

    .line 165
    .line 166
    invoke-static {v0, v5, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 167
    .line 168
    .line 169
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->T()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderItem;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
