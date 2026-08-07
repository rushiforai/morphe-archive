.class public Ll/oby;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dzl;


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Z

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Ll/fzl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/oby;->d:Ll/fzl;

    .line 6
    .line 7
    iput-object p1, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Ll/oby;Lcom/p1/mobile/putong/core/newui/home/d;ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/oby;->k(Lcom/p1/mobile/putong/core/newui/home/d;ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    return-void
.end method

.method public static synthetic f(Ll/oby;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/oby;->j(ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    return-void
.end method

.method public static synthetic g(ZLcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Ll/cey;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic h(ZLcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Ll/cey;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oby;->d:Ll/fzl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/oby;->i(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)Ll/fzl;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/oby;->d:Ll/fzl;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/oby;->d:Ll/fzl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/fzl;->from()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZLjava/lang/String;)V
    .locals 11

    .line 1
    new-instance v3, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "sourcepage"

    .line 7
    .line 8
    const-string v1, "mymeet"

    .line 9
    .line 10
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 26
    .line 27
    iget-object v4, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 36
    .line 37
    iget-object v10, v1, Lcom/p1/mobile/putong/core/data/PickInfo;->picksTracker:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v7, 0x1

    .line 40
    const/4 v8, 0x0

    .line 41
    const/4 v9, 0x0

    .line 42
    move v1, p2

    .line 43
    move v2, p3

    .line 44
    move-object v5, p4

    .line 45
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    move p3, v1

    .line 50
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance p2, Ll/mby;

    .line 55
    .line 56
    invoke-direct {p2, p3, p1}, Ll/mby;-><init>(ZLcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    move v2, p3

    .line 68
    move-object v5, p4

    .line 69
    move p3, p2

    .line 70
    instance-of p2, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 71
    .line 72
    if-eqz p2, :cond_1

    .line 73
    .line 74
    move-object p2, p1

    .line 75
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;

    .line 76
    .line 77
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 82
    .line 83
    :goto_0
    move-object v10, p2

    .line 84
    goto :goto_1

    .line 85
    :cond_1
    const/4 p2, 0x0

    .line 86
    goto :goto_0

    .line 87
    :goto_1
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 92
    .line 93
    iget-object v4, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    const/4 v8, 0x0

    .line 100
    const/4 v9, 0x0

    .line 101
    const/4 v7, 0x1

    .line 102
    move v1, p3

    .line 103
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance p2, Ll/nby;

    .line 112
    .line 113
    invoke-direct {p2, v1, p1}, Ll/nby;-><init>(ZLcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/oby;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Ll/oby;->i(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)Ll/fzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/oby;->d:Ll/fzl;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iput-object v1, p0, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 12
    .line 13
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    move v1, p2

    .line 17
    move v2, p3

    .line 18
    move-object v4, p5

    .line 19
    invoke-interface/range {v0 .. v5}, Ll/fzl;->b(ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    move v3, v1

    .line 24
    move-object v6, v4

    .line 25
    move v4, v2

    .line 26
    const/4 p3, 0x0

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    return p3

    .line 30
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object p5, p2, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 39
    .line 40
    iget-object v0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    invoke-static {v0, p4, v3, v4, v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 71
    .line 72
    .line 73
    const-string p0, "failJailedUser"

    .line 74
    .line 75
    invoke-static {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return p3

    .line 79
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    const-string p1, "failFakeUser"

    .line 86
    .line 87
    invoke-static {v2, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    invoke-static {p0}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 93
    .line 94
    .line 95
    return p3

    .line 96
    :cond_2
    if-eqz v4, :cond_5

    .line 97
    .line 98
    invoke-static {}, Ll/joa;->f4()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_5

    .line 103
    .line 104
    invoke-static {}, Ll/a5i0;->x0()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-gtz v1, :cond_5

    .line 109
    .line 110
    iget-object p1, p0, Ll/oby;->d:Ll/fzl;

    .line 111
    .line 112
    instance-of p1, p1, Ll/pey;

    .line 113
    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    invoke-static {}, Ll/joa;->H3()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_3

    .line 121
    .line 122
    invoke-static {}, Ll/ela;->r3()I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-lez p1, :cond_4

    .line 127
    .line 128
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 129
    .line 130
    invoke-static {v0, p1}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_4

    .line 135
    .line 136
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    const-string p1, ""

    .line 139
    .line 140
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return p3

    .line 144
    :cond_4
    iget-object p0, p0, Ll/oby;->d:Ll/fzl;

    .line 145
    .line 146
    invoke-interface {p0}, Ll/fzl;->a()V

    .line 147
    .line 148
    .line 149
    return p3

    .line 150
    :cond_5
    if-eqz v4, :cond_6

    .line 151
    .line 152
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-nez v1, :cond_6

    .line 157
    .line 158
    invoke-static {}, Ll/joa;->E3()Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-nez v1, :cond_6

    .line 163
    .line 164
    invoke-static {}, Ll/a5i0;->G()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_6

    .line 169
    .line 170
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v1}, Ll/a5i0;->e1()Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-eqz v1, :cond_6

    .line 179
    .line 180
    iget-object p2, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    sget-object p5, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LETTER:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 183
    .line 184
    new-instance v0, Ll/kby;

    .line 185
    .line 186
    move-object v1, p0

    .line 187
    move-object v7, p1

    .line 188
    move-object v5, v2

    .line 189
    move v2, v3

    .line 190
    move v3, v4

    .line 191
    move v4, p4

    .line 192
    invoke-direct/range {v0 .. v7}, Ll/kby;-><init>(Ll/oby;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    .line 193
    .line 194
    .line 195
    const/4 p0, 0x0

    .line 196
    invoke-static {p2, p5, v0, p0}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 197
    .line 198
    .line 199
    return p3

    .line 200
    :cond_6
    move-object v1, p0

    .line 201
    move-object v7, p1

    .line 202
    move v5, p4

    .line 203
    if-eqz v3, :cond_7

    .line 204
    .line 205
    iget p0, p5, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 206
    .line 207
    if-nez p0, :cond_7

    .line 208
    .line 209
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 210
    .line 211
    .line 212
    move-result-wide p0

    .line 213
    const-wide/16 p4, 0x0

    .line 214
    .line 215
    cmp-long p0, p0, p4

    .line 216
    .line 217
    if-lez p0, :cond_7

    .line 218
    .line 219
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 220
    .line 221
    invoke-static {v0, p0}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-nez p0, :cond_7

    .line 226
    .line 227
    iget-object v3, v1, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 230
    .line 231
    const/4 v8, 0x0

    .line 232
    iget-object v9, v1, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 233
    .line 234
    const-string v4, "p_home,likelimit"

    .line 235
    .line 236
    const/4 v6, 0x0

    .line 237
    const/4 v7, 0x0

    .line 238
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 239
    .line 240
    .line 241
    const-string p0, "failExhaustSwipe"

    .line 242
    .line 243
    invoke-static {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    return p3

    .line 247
    :cond_7
    if-eqz v4, :cond_9

    .line 248
    .line 249
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    if-eqz p0, :cond_9

    .line 254
    .line 255
    iget-object p0, v7, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 256
    .line 257
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 258
    .line 259
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 260
    .line 261
    const-string p1, "lettered"

    .line 262
    .line 263
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    if-eqz p0, :cond_9

    .line 268
    .line 269
    iget-object p0, v1, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 270
    .line 271
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    if-eqz p0, :cond_8

    .line 276
    .line 277
    sget p0, Lcom/p1/mobile/putong/core/R$string;->k2:I

    .line 278
    .line 279
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 280
    .line 281
    .line 282
    goto :goto_0

    .line 283
    :cond_8
    sget p0, Lcom/p1/mobile/putong/core/R$string;->l2:I

    .line 284
    .line 285
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 286
    .line 287
    .line 288
    :goto_0
    return p3

    .line 289
    :cond_9
    if-eqz v4, :cond_a

    .line 290
    .line 291
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    if-eqz p0, :cond_a

    .line 296
    .line 297
    iget-object p0, v1, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 298
    .line 299
    new-instance v0, Ll/lby;

    .line 300
    .line 301
    invoke-direct/range {v0 .. v7}, Ll/lby;-><init>(Ll/oby;Lcom/p1/mobile/putong/core/newui/home/d;ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    .line 302
    .line 303
    .line 304
    invoke-static {p0, v0}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    .line 305
    .line 306
    .line 307
    move-result p0

    .line 308
    if-eqz p0, :cond_a

    .line 309
    .line 310
    return p3

    .line 311
    :cond_a
    if-eqz v4, :cond_b

    .line 312
    .line 313
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 314
    .line 315
    .line 316
    move-result p0

    .line 317
    if-eqz p0, :cond_b

    .line 318
    .line 319
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    invoke-static {p0}, Ll/a5i0;->w0(I)I

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    if-nez p0, :cond_b

    .line 328
    .line 329
    iget-object p0, v1, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 330
    .line 331
    iget-object p1, v1, Ll/oby;->d:Ll/fzl;

    .line 332
    .line 333
    invoke-interface {p1}, Ll/fzl;->from()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    const-string p0, "failExhaustSuperlike"

    .line 341
    .line 342
    invoke-static {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    return p3

    .line 346
    :cond_b
    iget-object v0, v1, Ll/oby;->d:Ll/fzl;

    .line 347
    .line 348
    move-object p0, v1

    .line 349
    iget-object v1, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 350
    .line 351
    iget-object p0, p0, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 352
    .line 353
    iget-object p1, v7, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 354
    .line 355
    iget-object v8, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 356
    .line 357
    move-object v7, v6

    .line 358
    move-object v6, v2

    .line 359
    move-object v2, p0

    .line 360
    invoke-interface/range {v0 .. v8}, Ll/fzl;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)V

    .line 361
    .line 362
    .line 363
    const/4 p0, 0x1

    .line 364
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)Ll/fzl;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLocalLikersUser()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/oby;->b:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/r620;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/r620;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_0
    new-instance p1, Ll/yby;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/yby;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    return-object p1

    .line 25
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_5

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLikedUser()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    new-instance p1, Ll/pey;

    .line 58
    .line 59
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-direct {p1, p0}, Ll/pey;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    return-object p1

    .line 65
    :cond_4
    :goto_0
    new-instance p1, Ll/qby;

    .line 66
    .line 67
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Ll/qby;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 70
    .line 71
    .line 72
    return-object p1

    .line 73
    :cond_5
    :goto_1
    new-instance p1, Ll/pfy;

    .line 74
    .line 75
    iget-object p0, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    invoke-direct {p1, p0}, Ll/pfy;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 78
    .line 79
    .line 80
    return-object p1
.end method

.method public final synthetic j(ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V
    .locals 10

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->U0()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/oby;->d:Ll/fzl;

    .line 9
    .line 10
    iget-object v2, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v3, p0, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    move-object/from16 p0, p6

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 17
    .line 18
    iget-object v9, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 19
    .line 20
    move v4, p1

    .line 21
    move v5, p2

    .line 22
    move v6, p3

    .line 23
    move-object v7, p4

    .line 24
    move-object v8, p5

    .line 25
    invoke-interface/range {v1 .. v9}, Ll/fzl;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/newui/home/d;ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/oby;->d:Ll/fzl;

    .line 5
    .line 6
    iget-object v1, p0, Ll/oby;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v2, p0, Ll/oby;->c:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object p0, p6, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 11
    .line 12
    iget-object v8, p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 13
    .line 14
    move-object v6, p1

    .line 15
    move v3, p2

    .line 16
    move v4, p3

    .line 17
    move v5, p4

    .line 18
    move-object v7, p5

    .line 19
    invoke-interface/range {v0 .. v8}, Ll/fzl;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/oby;->b:Z

    .line 2
    .line 3
    return-void
.end method
