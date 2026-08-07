.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ7\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
        "item",
        "Ll/osn0;",
        "listener",
        "",
        "name",
        "",
        "isGroupOrHourBoard",
        "showMvp",
        "j0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;Ljava/lang/String;ZZ)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static i0(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/osn0;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public final j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;Ljava/lang/String;ZZ)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/osn0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->i:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 20
    .line 21
    iget-boolean p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->onCall:Z

    .line 22
    .line 23
    if-eqz p4, :cond_0

    .line 24
    .line 25
    const-string p4, "onlive"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p4, "unknown_"

    .line 29
    .line 30
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->h:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->u()V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->h:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 36
    .line 37
    invoke-static {p4}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 38
    .line 39
    .line 40
    move-result-object p4

    .line 41
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p4}, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveState;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->h:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 49
    .line 50
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->i:Lv/VText;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->name:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    :goto_1
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->e:Lv/VText;

    .line 63
    .line 64
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/usn0;->e(J)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->e:Lv/VText;

    .line 74
    .line 75
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 76
    .line 77
    const-wide/16 v3, 0x63

    .line 78
    .line 79
    cmp-long v3, v1, v3

    .line 80
    .line 81
    if-gtz v3, :cond_3

    .line 82
    .line 83
    const-wide/16 v3, 0x0

    .line 84
    .line 85
    cmp-long v1, v1, v3

    .line 86
    .line 87
    if-gtz v1, :cond_2

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    const/high16 v1, 0x41900000    # 18.0f

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_3
    :goto_2
    const/high16 v1, 0x41400000    # 12.0f

    .line 94
    .line 95
    :goto_3
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 96
    .line 97
    .line 98
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->l:Lv/VText;

    .line 99
    .line 100
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 101
    .line 102
    invoke-static {v1, v2, p3}, Ll/usn0;->c(JLjava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 110
    .line 111
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    const/high16 p4, 0x42920000    # 73.0f

    .line 115
    .line 116
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result p4

    .line 120
    invoke-static {p3, p1, p4}, Ll/usn0;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;I)V

    .line 121
    .line 122
    .line 123
    new-instance p3, Ll/amn0;

    .line 124
    .line 125
    invoke-direct {p3, p2, p1}, Ll/amn0;-><init>(Ll/osn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->j:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;

    .line 132
    .line 133
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 134
    .line 135
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->gender:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 141
    .line 142
    iget-wide v1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->age:J

    .line 143
    .line 144
    long-to-int p4, v1

    .line 145
    const/4 v1, 0x1

    .line 146
    invoke-virtual {p2, p3, p4, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/LiveGenderMedalView;->Q(Ljava/lang/String;IZ)V

    .line 147
    .line 148
    .line 149
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 150
    .line 151
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    if-nez p2, :cond_4

    .line 158
    .line 159
    if-eqz p5, :cond_4

    .line 160
    .line 161
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->g:Lv/VDraweeView;

    .line 162
    .line 163
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->g:Lv/VDraweeView;

    .line 167
    .line 168
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 169
    .line 170
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->avatar:Ljava/lang/String;

    .line 171
    .line 172
    const-string p2, "context_single_room"

    .line 173
    .line 174
    invoke-static {p2, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->g:Lv/VDraweeView;

    .line 179
    .line 180
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourListItemMainlandBindings;->e:Lv/VText;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
