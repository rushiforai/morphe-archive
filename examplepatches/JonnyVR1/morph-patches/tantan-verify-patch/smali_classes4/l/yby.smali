.class public Ll/yby;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fzl;


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yby;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    const-string v0, "matched"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    const/4 p2, 0x2

    .line 19
    const/4 p3, 0x0

    .line 20
    invoke-static {p1, p0, p3, p3, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    if-eqz p3, :cond_2

    .line 29
    .line 30
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 39
    .line 40
    const-string p3, "seeUpgraded"

    .line 41
    .line 42
    invoke-static {p3}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-interface {p0, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 55
    .line 56
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance p3, Ll/xby;

    .line 67
    .line 68
    invoke-direct {p3, p1, p2}, Ll/xby;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 69
    .line 70
    .line 71
    new-instance p1, Ll/fjf0;

    .line 72
    .line 73
    invoke-direct {p1}, Ll/fjf0;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {p3, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->v4:I

    .line 85
    .line 86
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-static {p0, p1, p2, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yby;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yby;->from()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->A1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(ZZZLjava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yby;->a()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PickInfo;)V
    .locals 7

    .line 1
    new-instance v3, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p0, "X-Testing-Variance"

    .line 7
    .line 8
    const-string p7, "relationshipUI:seeWhoLikedMe"

    .line 9
    .line 10
    invoke-interface {v3, p0, p7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string p0, "sourcepage"

    .line 14
    .line 15
    const-string p7, "seewholikeme"

    .line 16
    .line 17
    invoke-interface {v3, p0, p7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    if-eqz p5, :cond_0

    .line 21
    .line 22
    const-string p0, "click"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "swipe"

    .line 26
    .line 27
    :goto_0
    const-string p7, "actiontype"

    .line 28
    .line 29
    invoke-interface {v3, p7, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p6, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    new-instance p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p6}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 45
    .line 46
    .line 47
    move-result-object p7

    .line 48
    invoke-virtual {p7}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p7

    .line 52
    invoke-virtual {p0, p7}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p6}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p5

    .line 76
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iput-object p0, v5, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 89
    .line 90
    const-string p0, "likers"

    .line 91
    .line 92
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    move-object v4, p2

    .line 97
    move v1, p3

    .line 98
    move v2, p4

    .line 99
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    new-instance p2, Ll/wby;

    .line 108
    .line 109
    invoke-direct {p2, p6, p1, v4, v1}, Ll/wby;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 110
    .line 111
    .line 112
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 122
    .line 123
    iget-object p1, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/s;->H5(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public from()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_meet_view,e_meet_see_card,like_swipe"

    .line 2
    .line 3
    return-object p0
.end method
