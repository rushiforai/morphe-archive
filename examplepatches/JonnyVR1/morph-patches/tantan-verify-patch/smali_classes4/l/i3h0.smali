.class public Ll/i3h0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/j3h0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/z2h0;

.field public b:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Lcom/p1/mobile/putong/core/data/CardPattern;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/i3h0;->c:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p1, p0, Ll/i3h0;->d:Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Ll/i3h0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i3h0;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/i3h0;Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/i3h0;->l0(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/j3h0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/i3h0;->b:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/j3h0;->e(Lcom/p1/mobile/putong/core/data/ActionPageFormat;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 23
    .line 24
    iput-object v0, p0, Ll/i3h0;->b:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 25
    .line 26
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/f3h0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f3h0;-><init>(Ll/i3h0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final h0(ZZZLcom/p1/mobile/putong/core/newui/home/d;)V
    .locals 7

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
    sget-object v1, Ll/b240;->S0:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    const-string v0, "click"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, "swipe"

    .line 19
    .line 20
    :goto_0
    const-string v1, "actiontype"

    .line 21
    .line 22
    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p4, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    iget-object v0, p0, Ll/i3h0;->c:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    iput-object p3, v5, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 80
    .line 81
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v0, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 84
    .line 85
    iget-object v4, p0, Ll/i3h0;->c:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    const-string p3, "likers"

    .line 88
    .line 89
    invoke-static {p3}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    move v1, p1

    .line 94
    move v2, p2

    .line 95
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    new-instance p2, Ll/g3h0;

    .line 104
    .line 105
    invoke-direct {p2, p0, p4, v2}, Ll/g3h0;-><init>(Ll/i3h0;Lcom/p1/mobile/putong/core/newui/home/d;Z)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Ll/h3h0;

    .line 109
    .line 110
    invoke-direct {p0, p4}, Ll/h3h0;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public i0()Lcom/p1/mobile/putong/core/data/ActionPageFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i3h0;->b:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public j0()Landroidx/recyclerview/widget/k$e;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i3h0;->a:Ll/z2h0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/z2h0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/z2h0;-><init>(Ll/i3h0;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/i3h0;->a:Ll/z2h0;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/i3h0;->a:Ll/z2h0;

    .line 13
    .line 14
    return-object p0
.end method

.method public final k0(ZZZILjava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "p_suggest_users_home_view"

    .line 2
    .line 3
    iget-object v1, p0, Ll/i3h0;->c:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {v0, p3, p1, p2, v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->f(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-virtual {p4, p5}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/i3h0;->h0(ZZZLcom/p1/mobile/putong/core/newui/home/d;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    const-string v0, "matched"

    .line 9
    .line 10
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_4

    .line 15
    .line 16
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v0, 0x0

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 32
    .line 33
    const-string v1, "superLikedEach"

    .line 34
    .line 35
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const/16 v0, 0xd

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 59
    .line 60
    const-string v1, "superLiked"

    .line 61
    .line 62
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    if-eqz p2, :cond_1

    .line 69
    .line 70
    const/16 v0, 0xc

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    const/16 v0, 0xb

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    iget-object p1, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 91
    .line 92
    const-string p2, "secretcrush"

    .line 93
    .line 94
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    const/4 v0, 0x1

    .line 101
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget-object p2, p3, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 110
    .line 111
    filled-new-array {p2}, [Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    new-instance p3, Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-static {p0, p2, v0, p3}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 129
    .line 130
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 134
    .line 135
    .line 136
    :cond_4
    return-void
.end method

.method public n0(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/i3h0;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x0

    .line 17
    move-object v1, p0

    .line 18
    move v2, p1

    .line 19
    invoke-virtual/range {v1 .. v6}, Ll/i3h0;->k0(ZZZILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/core/data/CardPattern;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/j3h0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/j3h0;->c(Lcom/p1/mobile/putong/core/data/CardPattern;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/j3h0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/i3h0;->d:Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/j3h0;->d(Lcom/p1/mobile/putong/core/data/CardPattern;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 13
    .line 14
    iget-object p0, p0, Ll/i3h0;->d:Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CardPattern;->userId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i3h0;->d:Lcom/p1/mobile/putong/core/data/CardPattern;

    .line 2
    .line 3
    iput-object p2, p0, Ll/i3h0;->c:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    return-void
.end method
