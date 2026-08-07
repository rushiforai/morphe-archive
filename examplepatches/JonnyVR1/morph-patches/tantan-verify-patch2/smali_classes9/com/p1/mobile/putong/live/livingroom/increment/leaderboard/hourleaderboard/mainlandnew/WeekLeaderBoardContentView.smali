.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RadioGroup;

.field public b:Landroid/widget/RadioButton;

.field public c:Landroid/widget/RadioButton;

.field public d:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekBoardMainlandItemView;

.field public h:Ll/uhl;

.field public i:Ll/awp0;

.field public j:Ll/qhl;


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
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->h:Ll/uhl;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 8
    .line 9
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

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->h:Ll/uhl;

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

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

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->h:Ll/uhl;

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    return-void
.end method

.method public static c(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;
    .locals 3

    .line 1
    sget v0, Ll/yec0;->vb:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gwp0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 28
    .line 29
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/kfd0$a;->m(Ljava/lang/String;)Ll/kfd0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_hoursboard"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {p1}, Ll/icr;->e(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 56
    .line 57
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v0, v1}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 71
    .line 72
    const-string v2, "onlive"

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 83
    .line 84
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->L0:I

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_3

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_3

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 131
    .line 132
    new-instance v1, Ll/v24;

    .line 133
    .line 134
    const/16 v2, 0x1004

    .line 135
    .line 136
    const/4 v3, 0x1

    .line 137
    invoke-direct {v1, v2, v3}, Ll/v24;-><init>(II)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Ljava/lang/Boolean;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_2

    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/y8s;->O3()V

    .line 156
    .line 157
    .line 158
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 159
    .line 160
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 164
    .line 165
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 178
    .line 179
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 192
    .line 193
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 202
    .line 203
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 210
    .line 211
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    const-string v0, "hour-leader-boards"

    .line 238
    .line 239
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 244
    .line 245
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 254
    .line 255
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 260
    .line 261
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 270
    .line 271
    .line 272
    return-void
.end method

.method public e(Ll/qhl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->a:Landroid/widget/RadioGroup;

    .line 2
    .line 3
    sget v1, Ll/mdc0;->N4:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->check(I)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView$a;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;Ll/qhl;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->h:Ll/uhl;

    .line 16
    .line 17
    new-instance p1, Ll/awp0;

    .line 18
    .line 19
    invoke-direct {p1, v0}, Ll/awp0;-><init>(Ll/uhl;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/awp0;->R()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/awp0;->S(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/awp0;->U(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i(Ljava/util/List;Z)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/awp0;->T(Ljava/util/List;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->isOwn:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekBoardMainlandItemView;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekBoardMainlandItemView;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekBoardMainlandItemView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Ll/uhl;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    sget v1, Ll/mdc0;->B3:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardHeaderView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardHeaderView;->t0()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->i:Ll/awp0;

    .line 25
    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/awp0;->I()V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/16 v1, 0x1004

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "live"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 32
    .line 33
    invoke-virtual {v4}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v5}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v4, v5, v6, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->j:Ll/qhl;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p0, v4, p1, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p1, "giftBanner"

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->showShadow()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
