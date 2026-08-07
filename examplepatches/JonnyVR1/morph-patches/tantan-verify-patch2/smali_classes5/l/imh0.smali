.class public Ll/imh0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/d;ZLl/z20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

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
    if-eqz p0, :cond_5

    .line 15
    .line 16
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 v0, 0x0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 32
    .line 33
    const-string v1, "superLikedEach"

    .line 34
    .line 35
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/16 v0, 0xd

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 59
    .line 60
    const-string v1, "superLiked"

    .line 61
    .line 62
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_2

    .line 67
    .line 68
    if-eqz p1, :cond_1

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
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_3

    .line 83
    .line 84
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 91
    .line 92
    const-string p1, "secretcrush"

    .line 93
    .line 94
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_3

    .line 99
    .line 100
    const/4 v0, 0x1

    .line 101
    :cond_3
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-interface {p2, p4, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_4
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 116
    .line 117
    filled-new-array {p0}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    new-instance p1, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-static {p3, p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    new-instance p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 135
    .line 136
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p3, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 140
    .line 141
    .line 142
    :cond_5
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x1

    .line 6
    move-object v3, p0

    .line 7
    move v2, p1

    .line 8
    move-object v4, p2

    .line 9
    move-object v5, p3

    .line 10
    move-object v6, p4

    .line 11
    move-object v7, p5

    .line 12
    invoke-static/range {v0 .. v7}, Ll/imh0;->j(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u0:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-nez p3, :cond_0

    .line 24
    .line 25
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-eqz p3, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/rbb0;->t()Z

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    if-nez p3, :cond_0

    .line 42
    .line 43
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 46
    .line 47
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u0:Ll/jxd0;

    .line 48
    .line 49
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {p3, p4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 55
    .line 56
    new-instance p3, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v0, ""

    .line 77
    .line 78
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 86
    .line 87
    const-string p3, "male"

    .line 88
    .line 89
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    new-instance v5, Ll/gmh0;

    .line 94
    .line 95
    invoke-direct {v5, p2}, Ll/gmh0;-><init>(Ll/x20;)V

    .line 96
    .line 97
    .line 98
    new-instance v6, Ll/hmh0;

    .line 99
    .line 100
    invoke-direct {v6}, Ll/hmh0;-><init>()V

    .line 101
    .line 102
    .line 103
    const/4 v1, 0x1

    .line 104
    move-object v0, p0

    .line 105
    invoke-static/range {v0 .. v6}, Ll/hl3;->G(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 106
    .line 107
    .line 108
    return-object p4

    .line 109
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 110
    .line 111
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;)V
    .locals 6

    .line 1
    const/4 v4, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    move-object v0, p0

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->e2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v1, 0x312

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic g(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const-string p0, "click"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "swipe"

    .line 12
    .line 13
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-nez p4, :cond_1

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iget-object v1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/d;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p1, :cond_4

    .line 29
    .line 30
    if-eqz p3, :cond_2

    .line 31
    .line 32
    const-string p1, "e_superlikeButton"

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    if-eqz p2, :cond_3

    .line 36
    .line 37
    const-string p1, "e_likeButton"

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_3
    const-string p1, "e_dislikeButton"

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_4
    const-string p1, "e_card"

    .line 44
    .line 45
    :goto_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    if-eqz p3, :cond_5

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->SUPER_LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_5
    if-eqz p2, :cond_6

    .line 55
    .line 56
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->LIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;->DISLIKE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;

    .line 60
    .line 61
    :goto_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->q(Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionName;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 62
    .line 63
    .line 64
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_7

    .line 69
    .line 70
    iget-object p0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 82
    .line 83
    .line 84
    iget-object p0, p4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/d;->A(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/d;->z(I)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 94
    .line 95
    .line 96
    :cond_7
    return-object v0
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)Ll/rcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/x20;",
            ")",
            "Ll/rcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fmh0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/fmh0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static j(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ",
            "Lcom/p1/mobile/putong/core/newui/home/d;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v3, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "X-Testing-Variance"

    .line 7
    .line 8
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/d;->m()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    const-string v0, "sourcepage"

    .line 16
    .line 17
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/d;->j()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    const-string v0, "actiontype"

    .line 25
    .line 26
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/d;->g()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    iput-object p2, v5, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 86
    .line 87
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 90
    .line 91
    const-string p2, "likers"

    .line 92
    .line 93
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    move v1, p0

    .line 98
    move v2, p1

    .line 99
    move-object v4, p4

    .line 100
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p5, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance p1, Ll/dmh0;

    .line 109
    .line 110
    invoke-direct {p1, p3, v2, p6, p5}, Ll/dmh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLl/z20;Lcom/p1/mobile/android/app/Act;)V

    .line 111
    .line 112
    .line 113
    new-instance p2, Ll/emh0;

    .line 114
    .line 115
    invoke-direct {p2, p3}, Ll/emh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_0

    .line 130
    .line 131
    invoke-interface {p7}, Ll/x20;->call()V

    .line 132
    .line 133
    .line 134
    :cond_0
    return-void
.end method

.method public static k(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ",
            "Lcom/p1/mobile/putong/core/newui/home/d;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/x20;",
            ")Z"
        }
    .end annotation

    .line 1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    move-object v3, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 13
    .line 14
    :goto_0
    if-nez v1, :cond_1

    .line 15
    .line 16
    :goto_1
    move-object v7, v2

    .line 17
    goto :goto_2

    .line 18
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :goto_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    const/4 v8, 0x0

    .line 34
    if-eqz v4, :cond_2

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 41
    .line 42
    .line 43
    const-string p0, "failJailedUser"

    .line 44
    .line 45
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return v8

    .line 49
    :cond_2
    new-instance v4, Ll/bmh0;

    .line 50
    .line 51
    invoke-direct {v4, p5}, Ll/bmh0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p5, v4}, Ll/qtk;->F0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    const-string v5, "failFakeUser"

    .line 59
    .line 60
    if-eqz v4, :cond_3

    .line 61
    .line 62
    invoke-static {p3, v5}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return v8

    .line 66
    :cond_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_4

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eqz v4, :cond_4

    .line 77
    .line 78
    invoke-static {p3, v5}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p5}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 82
    .line 83
    .line 84
    return v8

    .line 85
    :cond_4
    if-nez p0, :cond_5

    .line 86
    .line 87
    if-eqz p1, :cond_6

    .line 88
    .line 89
    :cond_5
    if-nez v1, :cond_6

    .line 90
    .line 91
    const-string p0, "failDataError"

    .line 92
    .line 93
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return v8

    .line 97
    :cond_6
    if-eqz p0, :cond_7

    .line 98
    .line 99
    iget v1, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 100
    .line 101
    if-nez v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    const-wide/16 v5, 0x0

    .line 108
    .line 109
    cmp-long v1, v3, v5

    .line 110
    .line 111
    if-lez v1, :cond_7

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 114
    .line 115
    invoke-static {v2, v1}, Ll/qj90;->c(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_7

    .line 120
    .line 121
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 122
    .line 123
    const/4 v4, 0x0

    .line 124
    const/4 v5, 0x0

    .line 125
    const-string v1, "p_home,likelimit"

    .line 126
    .line 127
    const/4 v3, 0x0

    .line 128
    move-object v6, p4

    .line 129
    move-object v0, p5

    .line 130
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 131
    .line 132
    .line 133
    const-string p0, "failExhaustSwipe"

    .line 134
    .line 135
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return v8

    .line 139
    :cond_7
    if-eqz p1, :cond_8

    .line 140
    .line 141
    new-instance v0, Ll/cmh0;

    .line 142
    .line 143
    move v2, p2

    .line 144
    move-object v1, p3

    .line 145
    move-object v3, p4

    .line 146
    move-object v4, p5

    .line 147
    move-object v5, p6

    .line 148
    move-object/from16 v6, p7

    .line 149
    .line 150
    invoke-direct/range {v0 .. v6}, Ll/cmh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V

    .line 151
    .line 152
    .line 153
    move-object v1, v0

    .line 154
    invoke-static {p5, v1}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-eqz v1, :cond_8

    .line 159
    .line 160
    const-string p0, "tantanCoin"

    .line 161
    .line 162
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return v8

    .line 166
    :cond_8
    if-eqz p1, :cond_b

    .line 167
    .line 168
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-static {v1}, Ll/a5i0;->w0(I)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_b

    .line 177
    .line 178
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 179
    .line 180
    invoke-static {p0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_a

    .line 185
    .line 186
    invoke-static {}, Ll/d79;->b0()Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_9

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 194
    .line 195
    const/4 v4, 0x0

    .line 196
    const/4 v5, 0x0

    .line 197
    const-string v1, "p_see_who_likes_me_view,e_superlike,click"

    .line 198
    .line 199
    const/4 v3, 0x0

    .line 200
    move-object v6, p4

    .line 201
    move-object v0, p5

    .line 202
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 203
    .line 204
    .line 205
    const-string p0, "failLessVipSuperLike"

    .line 206
    .line 207
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_a
    :goto_3
    const-string p0, "p_see_who_likes_me_view,e_superlike,click"

    .line 212
    .line 213
    invoke-static {p5, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    const-string p0, "failExhaustSuperlike"

    .line 217
    .line 218
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    :goto_4
    return v8

    .line 222
    :cond_b
    invoke-static/range {p0 .. p7}, Ll/imh0;->j(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/z20;Ll/x20;)V

    .line 223
    .line 224
    .line 225
    const/4 p0, 0x1

    .line 226
    return p0
.end method
