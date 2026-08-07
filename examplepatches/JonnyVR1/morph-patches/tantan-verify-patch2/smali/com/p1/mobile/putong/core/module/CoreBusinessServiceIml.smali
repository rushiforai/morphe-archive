.class public Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;
.implements Ll/z97;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "CoreBusinessService"
    path = "/core_business/service"
.end annotation


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

.method public static synthetic Et(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic Ft(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Gt(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Ht(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;ZLcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p10}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->eu(ZLcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic It(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    new-instance p1, Ll/ra7;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/ra7;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x3e8

    .line 7
    .line 8
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Jt(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Kt(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    const-string v0, "success"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

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
    if-eqz p0, :cond_4

    .line 15
    .line 16
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 102
    .line 103
    filled-new-array {p0}, [Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance p1, Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {p2, p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 121
    .line 122
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_4
    if-eqz p1, :cond_5

    .line 130
    .line 131
    invoke-static {p2}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 132
    .line 133
    .line 134
    :cond_5
    return-void
.end method

.method public static synthetic Lt(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Mt(Lcom/p1/mobile/android/app/Act;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "e_avatarVerification_explain_click"

    .line 4
    .line 5
    const-string v2, "p_avatarVerification_icon_explain_guide_Unverified"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->s4()Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "pending"

    .line 19
    .line 20
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    const-string v1, "dialog"

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->fs:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Lcom/p1/mobile/putong/core/R$string;->es:I

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Ll/dbc0;->jk:I

    .line 45
    .line 46
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    const/4 v14, 0x0

    .line 53
    const/4 v15, 0x0

    .line 54
    const/4 v5, 0x0

    .line 55
    const/4 v6, 0x0

    .line 56
    const/4 v7, 0x0

    .line 57
    const/4 v8, 0x0

    .line 58
    const/4 v9, 0x0

    .line 59
    const/4 v10, 0x0

    .line 60
    const/4 v11, 0x1

    .line 61
    const/4 v12, 0x0

    .line 62
    const/4 v13, 0x0

    .line 63
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic Nt(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ela;->r3()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic Ot(Ll/y20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic Pt(Ll/x20;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Qt(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a5i0;->S0()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p0, v0}, Ll/ma3;->d(Lcom/p1/mobile/android/app/Act;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic Rt(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PicksUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicksUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic St()V
    .locals 2

    .line 1
    const-string v0, "e_avatarVerification_explain_cancle_click"

    .line 2
    .line 3
    const-string v1, "p_avatarVerification_icon_explain_guide_Unverified"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic Tt(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Ut(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Vt(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const-string v0, "setting"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Q5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic Wt(Ll/y20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic Xt()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ela;->A3()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic Yt(Ll/ugy;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Zt(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const-string v0, "setting"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Q5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic au(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Lcom/p1/mobile/putong/core/newui/home/d;ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->du(Lcom/p1/mobile/putong/core/newui/home/d;ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic bu(ZLcom/p1/mobile/android/app/Act;ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ela;->A3()Lrx/c;

    .line 6
    .line 7
    .line 8
    iget-object v0, p5, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 9
    .line 10
    const-string v1, "matched"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_4

    .line 19
    .line 20
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string p4, "superLikedEach"

    .line 35
    .line 36
    invoke-static {p4}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    if-ne p2, p4, :cond_0

    .line 41
    .line 42
    const/16 v1, 0xd

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    iget-object p2, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string p4, "superLiked"

    .line 60
    .line 61
    invoke-static {p4}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    if-ne p2, p4, :cond_2

    .line 66
    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    const/16 p0, 0xc

    .line 70
    .line 71
    :goto_0
    move v1, p0

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    const/16 p0, 0xb

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p2, "secretcrush"

    .line 91
    .line 92
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    if-ne p0, p2, :cond_3

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    move v1, v2

    .line 100
    :goto_1
    iget-object p0, p5, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 101
    .line 102
    filled-new-array {p0}, [Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    new-instance p2, Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {p1, p0, v1, p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    new-instance p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 120
    .line 121
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    if-eqz p2, :cond_7

    .line 129
    .line 130
    if-eqz p0, :cond_6

    .line 131
    .line 132
    if-eqz p3, :cond_5

    .line 133
    .line 134
    invoke-static {p1, p4, v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 140
    .line 141
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_5
    invoke-static {p1}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_6
    if-eqz p3, :cond_7

    .line 150
    .line 151
    invoke-static {p1, p4, v2}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 152
    .line 153
    .line 154
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 159
    .line 160
    .line 161
    :cond_7
    :goto_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t()Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_8

    .line 174
    .line 175
    if-eqz p3, :cond_8

    .line 176
    .line 177
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 180
    .line 181
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d9()V

    .line 182
    .line 183
    .line 184
    :cond_8
    return-void
.end method


# virtual methods
.method public A4(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/eu9;->A4(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public A7(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 0

    .line 1
    const-string p0, "cards"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public A9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/eu4;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Ab(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/ej1;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ad(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "from_intl_meet"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, p2, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance p2, Ll/pn90;

    .line 9
    .line 10
    invoke-direct {p2, p3, p4}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    const/16 p3, 0x12

    .line 14
    .line 15
    invoke-virtual {p1, p0, p3, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public Ak(Ljava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OmsTagUserCounts;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->R(Ljava/util/List;)Ll/gj40$h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-boolean p0, p0, Ll/gj40$h;->a:Z

    .line 10
    .line 11
    return p0
.end method

.method public Al(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Ao(ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 12

    .line 1
    const-string v0, "p_vas_paid_recovery_pop"

    .line 2
    .line 3
    move-object/from16 v11, p4

    .line 4
    .line 5
    invoke-static {v0, p3, p1, p2, v11}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->e(Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 6
    .line 7
    .line 8
    move-result-object v9

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->INTL_RECOVERY_POP:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 25
    .line 26
    iput-object v1, v9, Lcom/p1/mobile/putong/core/newui/home/d;->h:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v4, v1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 47
    .line 48
    .line 49
    const-string p0, "failJailedUser"

    .line 50
    .line 51
    invoke-static {v9, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    const-string p0, "failFakeUser"

    .line 62
    .line 63
    invoke-static {v9, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static/range {p5 .. p5}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/ka7;

    .line 79
    .line 80
    invoke-direct {v1}, Ll/ka7;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    move-object/from16 v5, p5

    .line 88
    .line 89
    invoke-virtual {v5, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/ma7;

    .line 94
    .line 95
    move-object v2, p0

    .line 96
    move v3, p1

    .line 97
    move v8, p2

    .line 98
    move v10, p3

    .line 99
    move-object/from16 v6, p6

    .line 100
    .line 101
    move/from16 v7, p7

    .line 102
    .line 103
    invoke-direct/range {v1 .. v11}, Ll/ma7;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;ZLcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public B7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->z3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public B9()F
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;->C:F

    .line 2
    .line 3
    return p0
.end method

.method public Bb(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/b83;->g(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Bc(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;[I)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/tje0;->c(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;[I)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Be()V
    .locals 1

    .line 1
    sget-object p0, Ll/u1z;->g:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Bn()J
    .locals 2

    .line 1
    invoke-static {}, Ll/rbb0;->g()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public Bp(Lcom/p1/mobile/putong/app/PutongFrag;I)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-ne p2, p0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->S4()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public C7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CityCBanner;)V
    .locals 1

    .line 1
    new-instance p0, Ll/n55;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Ll/n55;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Ll/n55;->K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C9(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;->PICKS:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 4
    .line 5
    if-ne p2, p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->n()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->EXPAND:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;->HIDE:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;

    .line 23
    .line 24
    :goto_0
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;->b(Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$HeaderType;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public Cc(Landroid/view/View;Ll/y20;)Lcom/p1/mobile/android/app/Act$w;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/p1/mobile/android/app/Act$w;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/pn90;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public Cj()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "https://auto.tancdn.com/v1/raw/bd957249-2f80-4f31-adcd-a3eefc6afbad12.svga"

    .line 2
    .line 3
    return-object p0
.end method

.method public Ck()I
    .locals 0

    .line 1
    const/16 p0, 0x12

    return p0
.end method

.method public Cm()I
    .locals 0

    .line 1
    invoke-static {}, Ll/r3c0;->k()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Cs(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/b8d0;->d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public D6()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Dc(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u2n;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x4

    .line 14
    invoke-virtual {p0, v0}, Ll/u2n;->j(I)Ll/o2n;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, p1, p2}, Ll/z60;->a(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public De()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->t1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Dl(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/match/b;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Dn(Lcom/p1/mobile/putong/data/QualificationType;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->J(Lcom/p1/mobile/putong/data/QualificationType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public E5(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u2n;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x6

    .line 18
    invoke-virtual {p0, v0}, Ll/u2n;->j(I)Ll/o2n;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, p1}, Ll/z60;->c(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public E9()V
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Eb(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gs50;->O()Ll/gs50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "use_up"

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/gs50;->H(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Ef(Ll/x0m;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/wyb0;->M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public En()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Eo(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLl/x20;Ll/x20;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hso;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;

    .line 7
    .line 8
    invoke-direct {p2, p0, p4, p5}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x20;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ll/hso;->t(Ll/bn50;)V

    .line 12
    .line 13
    .line 14
    instance-of p0, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    move-object p0, p1

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    :goto_0
    invoke-static {p1, p0}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0, p3, p6}, Ll/hso;->p(Ll/aso;ZLjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public Eq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    move-object p0, p1

    .line 2
    move-object p1, p2

    .line 3
    move-object p2, p4

    .line 4
    const/4 p4, 0x0

    .line 5
    invoke-static/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Es()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public F0()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "diamond"

    .line 2
    .line 3
    return-object p0
.end method

.method public F2()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "platinum"

    .line 2
    .line 3
    return-object p0
.end method

.method public F4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public F9(Ljava/util/List;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-boolean p0, p0, Ll/gj40$h;->a:Z

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public Fe(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string p0, "vip"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "svip"

    .line 12
    .line 13
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "navigation_to_vip_page_index"

    .line 18
    .line 19
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public Fi()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bubble_superlike_push_id"

    .line 2
    .line 3
    return-object p0
.end method

.method public G7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public G8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/n6d0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Gd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;ILl/x20;Ll/x20;Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;I",
            "Ll/x20;",
            "Ll/x20;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p11}, Lcom/p1/mobile/putong/core/ui/purchase/c;->B0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;ILl/x20;Ll/x20;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Gf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Gg()I
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->i0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Gl()I
    .locals 0

    .line 1
    const p0, -0x4cdededf

    return p0
.end method

.method public Go(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/b83;->n(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Gq(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "from_meet"

    .line 3
    .line 4
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public H8(Ljava/util/Date;)Z
    .locals 0
    .param p1    # Ljava/util/Date;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBase;->e(Ljava/util/Date;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public H9()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ultraPremium"

    .line 2
    .line 3
    return-object p0
.end method

.method public Hc(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/b83;->p(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Hd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->P2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Hi()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Hk(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/svip/SVIPRefundAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Hl(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p1}, Ll/z5h0;->r(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ho()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->u2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Hr()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public I9(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "supreme_partner_nearby"

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {p0, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Ie()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "svip"

    .line 2
    .line 3
    return-object p0
.end method

.method public If()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Il()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/qs50;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Im(ILandroid/widget/ImageView;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/xu90;->j(ILandroid/widget/ImageView;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Iq()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "currentUserId"

    .line 2
    .line 3
    return-object p0
.end method

.method public J6(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    const-string v2, "profile_frag_menu"

    .line 12
    .line 13
    invoke-static {p1, p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public J7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->o0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ja()Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->h1()Lcom/p1/mobile/putong/core/data/SwitchConvNextConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Jj()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/qs50;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Jl(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Ll/a0g;->E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/fake/b;->C(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public K4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public K6(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->b2(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Kc(Lcom/p1/mobile/android/app/Act;ILl/x20;)V
    .locals 0

    .line 1
    new-instance p0, Ll/g3k0;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-direct {p0, p1, p2}, Ll/g3k0;-><init>(Landroid/content/Context;I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p3}, Ll/g3k0;->F(Ll/x20;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/g3k0;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Kf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->M()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Kj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Kp()I
    .locals 0

    .line 1
    invoke-static {}, Ll/o6d0;->j0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ks(Lcom/p1/mobile/putong/core/data/Privilege;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/a5i0;->x(Lcom/p1/mobile/putong/core/data/Privilege;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public L6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    move-object v0, p1

    .line 5
    move-object v1, p2

    .line 6
    move-object v2, p3

    .line 7
    move-object v6, p4

    .line 8
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public L8()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "heart_confession_content"

    .line 2
    .line 3
    return-object p0
.end method

.method public L9(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/tje0;->g(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public La(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->P(Ljava/util/List;)Ll/gj40$h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Lb()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/tmp;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Ld(Lcom/p1/mobile/putong/data/Counter;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Counter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/rbb0;->r(Lcom/p1/mobile/putong/data/Counter;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    return-void

    return-void

    .line 1
    new-instance v6, Ll/la7;

    .line 2
    .line 3
    invoke-direct {v6, p5}, Ll/la7;-><init>(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    new-instance v7, Ll/qa7;

    .line 7
    .line 8
    invoke-direct {v7, p5}, Ll/qa7;-><init>(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v5, -0x1

    .line 13
    move-object v0, p1

    .line 14
    move-object v1, p2

    .line 15
    move-object v2, p3

    .line 16
    move-object v4, p4

    .line 17
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/purchase/c;->A0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;ILl/x20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Lg()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->D3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Lm(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->g2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Lp(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 0

    .line 1
    invoke-static/range {p1 .. p7}, Ll/yie0;->s(Landroid/text/SpannableString;Ljava/lang/String;Ljava/lang/String;IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Mb()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Mc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ll/aa7;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/aa7;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Me(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/match/a;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Mf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->Z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Mi()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Mj(Landroid/widget/FrameLayout;Ljava/lang/String;Landroidx/recyclerview/widget/RecyclerView$t;)Ll/v7m;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/asneedloadscroll/AsNeedLoadScrollView;->b(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 14
    .line 15
    .line 16
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 p3, -0x1

    .line 19
    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public Mp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/bdr;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Mr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->b1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N7()I
    .locals 0

    .line 1
    const/16 p0, 0x30

    return p0
.end method

.method public N8()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "female"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public Nf()I
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Nm()I
    .locals 0

    .line 1
    invoke-static {}, Ll/c8d0;->d0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Nn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Z)V
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x51

    .line 6
    .line 7
    const/16 v1, 0x52

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const-string v3, "from_new_meet_likers"

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-static {p1, p2, v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    move v0, v1

    .line 21
    :cond_0
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    new-instance p0, Ll/pn90;

    .line 26
    .line 27
    new-instance v4, Ll/ea7;

    .line 28
    .line 29
    invoke-direct {v4}, Ll/ea7;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p3, v4}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p2, v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    if-eqz p4, :cond_2

    .line 40
    .line 41
    move v0, v1

    .line 42
    :cond_2
    invoke-virtual {p1, p2, v0, p0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public No()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/fcp;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Np()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public O()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public O1()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "partner"

    .line 2
    .line 3
    return-object p0
.end method

.method public O7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->O()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public O8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->F1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public O9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->b2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Ob(ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->C(ILjava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Oo()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Op()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->L1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public P7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/bhe0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public P8()I
    .locals 0

    .line 1
    const/16 p0, 0x32

    return p0
.end method

.method public Ph()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o6d0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Pl(ZLandroid/view/View;)V
    .locals 0

    .line 1
    instance-of p0, p2, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p2, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->L0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Po(Lcom/p1/mobile/android/app/Act;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-static {}, Ll/hxf;->n()V

    .line 4
    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "p_avatarVerification_icon_explain_guide_Unverified"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 19
    .line 20
    .line 21
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ur:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Lcom/p1/mobile/putong/core/R$string;->ps:I

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    move-object v4, v2

    .line 34
    move-object v2, v3

    .line 35
    sget v3, Ll/dbc0;->v8:I

    .line 36
    .line 37
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ns:I

    .line 38
    .line 39
    invoke-virtual {v0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    move-object v6, v4

    .line 44
    move-object v4, v5

    .line 45
    new-instance v5, Ll/wa7;

    .line 46
    .line 47
    invoke-direct {v5, v0}, Ll/wa7;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 48
    .line 49
    .line 50
    sget v7, Lcom/p1/mobile/putong/core/R$string;->ms:I

    .line 51
    .line 52
    invoke-virtual {v0, v7}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    new-instance v8, Ll/xa7;

    .line 57
    .line 58
    invoke-direct {v8}, Ll/xa7;-><init>()V

    .line 59
    .line 60
    .line 61
    new-instance v9, Ll/ba7;

    .line 62
    .line 63
    invoke-direct {v9, v1}, Ll/ba7;-><init>(Ll/l4g0;)V

    .line 64
    .line 65
    .line 66
    const/4 v14, 0x0

    .line 67
    const/4 v15, 0x0

    .line 68
    move-object v1, v6

    .line 69
    const/4 v6, 0x1

    .line 70
    const/4 v10, 0x0

    .line 71
    const/4 v11, 0x1

    .line 72
    const/4 v12, 0x0

    .line 73
    const/4 v13, 0x0

    .line 74
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public Q8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 1

    .line 1
    const-string p0, "p_select_location_view,e_manyou,click"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, v0}, Ll/psl0;->n(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/xxv;->f()Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->data:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 p2, 0x5

    .line 21
    if-lt p0, p2, :cond_1

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;->B:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 p2, 0x3

    .line 30
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p0, 0x1

    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;->B:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/map/IntlMapAct;->g2(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 p2, 0x2

    .line 42
    invoke-virtual {p1, p0, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public Qb()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Qp(Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->Vf()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/NewMyLikedUsersAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance p0, Landroid/content/Intent;

    .line 13
    .line 14
    const-class v0, Lcom/p1/mobile/putong/core/ui/likedusers/LikedUsersAct;

    .line 15
    .line 16
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Qr()I
    .locals 0

    .line 1
    const/16 p0, 0x31

    return p0
.end method

.method public R6()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/fcp;->x()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R7(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/gp5;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ri(Z)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    sput-boolean p0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public Rj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p0, "from_meet_feed"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, p2, p0, v0, p3}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->p2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/LikedUser;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public Rl(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/yie0;->f(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Rn()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Rr(J)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/aw90;->z(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Sc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Sh()V
    .locals 0

    .line 1
    invoke-static {}, Ll/och0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Sk()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->E2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Sl(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ljava/lang/Object;)V
    .locals 0

    return-void

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->D1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Sm(Landroid/content/Context;Ljava/util/ArrayList;ZJ)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;ZJ)",
            "Lrx/c<",
            "Lcom/google/common/base/Optional<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/GPSkuDetails;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/cjj;->O(Landroid/content/Context;Ljava/util/ArrayList;ZJ)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Sn(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->i2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public So(Ll/x0m;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$d;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$d;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x0m;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$e;

    .line 11
    .line 12
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$e;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x0m;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SPOTLIGHT:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-static {v0, v1, v2, p0, p1}, Ll/b83;->o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Sp()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o6d0;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Sq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p0, "from_new_meet_see_feed"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, p2, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public T9(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/o5h0;->v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Ta(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Ll/i25;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public Tb(Z)I
    .locals 0

    .line 1
    invoke-static {p1}, Ll/c8d0;->e0(Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Td(I)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/b8d0;->j(I)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Th(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/aw90;->m0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Tj(ZLcom/p1/mobile/putong/data/User;Lv/VFrame;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Tl(Lcom/p1/mobile/putong/data/User;)I
    .locals 0

    .line 1
    invoke-static {}, Ll/xu90;->d()Ll/xu90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/xu90;->f(Lcom/p1/mobile/putong/data/User;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Tm()I
    .locals 0

    .line 1
    invoke-static {}, Ll/lrj0;->b()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Tn()I
    .locals 0

    .line 1
    invoke-static {}, Ll/ktl0;->q0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Tq()J
    .locals 2

    .line 1
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/wtd0;->l()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public Tr()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/n3x;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Ts(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->V(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public U()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public U7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/z5h0;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Ll/x20;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Ub(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/nwb;->h(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public Ue(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/qtk;->S0(Lcom/p1/mobile/android/app/Act;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Uh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Un(Lcom/p1/mobile/putong/core/data/VirtualCardType;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/y6d0;->g(Lcom/p1/mobile/putong/core/data/VirtualCardType;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Up()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->A()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;->Heartbeat:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public V7(D)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->r(D)Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->third:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 10
    .line 11
    if-lt p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public Vf()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->A()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/spl0;->B()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public Vl()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->p0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public W9()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public We()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->y2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->A2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public Wf(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/data/NavigationCardIntent;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const-string p0, "cards"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->O5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public Ws(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/User;)V
    .locals 11

    .line 1
    move-object/from16 v4, p5

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {p1}, Ll/qtk;->T0(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    new-instance p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->MEET:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 p2, 0x1

    .line 47
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object v2, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iput-object p0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 71
    .line 72
    invoke-static {}, Ll/joa;->H3()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_2

    .line 77
    .line 78
    invoke-static {}, Ll/ela;->r3()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-lez p0, :cond_2

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    move p2, v0

    .line 86
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ela;->F3()Ll/vg60;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 95
    .line 96
    new-instance v0, Ll/sa7;

    .line 97
    .line 98
    invoke-direct {v0, v4}, Ll/sa7;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    check-cast p0, Lcom/p1/mobile/putong/core/data/PicksUser;

    .line 106
    .line 107
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicksUser;->picksTracker:Ljava/lang/String;

    .line 114
    .line 115
    :goto_1
    move-object v10, p0

    .line 116
    goto :goto_2

    .line 117
    :cond_3
    const/4 p0, 0x0

    .line 118
    goto :goto_1

    .line 119
    :goto_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 122
    .line 123
    const-string p0, "mymeet"

    .line 124
    .line 125
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    const/4 v7, 0x1

    .line 130
    const/4 v9, 0x0

    .line 131
    const/4 v1, 0x1

    .line 132
    const/4 v3, 0x0

    .line 133
    const-string v5, ""

    .line 134
    .line 135
    move v2, p4

    .line 136
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    new-instance v0, Ll/ta7;

    .line 145
    .line 146
    move-object v2, p1

    .line 147
    move v4, p2

    .line 148
    move v3, p3

    .line 149
    move v1, p4

    .line 150
    move-object/from16 v5, p5

    .line 151
    .line 152
    invoke-direct/range {v0 .. v5}, Ll/ta7;-><init>(ZLcom/p1/mobile/android/app/Act;ZZLcom/p1/mobile/putong/data/User;)V

    .line 153
    .line 154
    .line 155
    new-instance p1, Ll/ua7;

    .line 156
    .line 157
    invoke-direct {p1}, Ll/ua7;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public X5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->X2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public X6()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/m27;->I3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xc(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Landroid/view/View;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x12

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const-string v2, "liked_users"

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance p2, Ll/pn90;

    .line 33
    .line 34
    invoke-direct {p2, p3, p4}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p0, v0, p2}, Lcom/p1/mobile/android/app/Frag;->v4(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public Xi()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->T()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xn()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Xo(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/kec0;->H8:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public Xq()I
    .locals 0

    .line 1
    invoke-static {}, Ll/tmp;->i()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Xr(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public Y3()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vip"

    .line 2
    .line 3
    return-object p0
.end method

.method public Y4()I
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->l()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Y9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Yd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->I()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Yf(II)Ll/smd0$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/tje0;->b(II)Ll/smd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Yj(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;Landroid/widget/LinearLayout;)V
    .locals 1

    .line 1
    iget-object p0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string p2, "likers"

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/gra;->L3()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    new-instance p2, Ll/ojr;

    .line 21
    .line 22
    invoke-direct {p2, p3, p4}, Ll/ojr;-><init>(Lv/VDraweeView;Landroid/widget/LinearLayout;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p2, 0x0

    .line 27
    :goto_0
    const/16 p3, 0x12

    .line 28
    .line 29
    invoke-virtual {p1, p0, p3, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public Yo(Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-boolean p1, p0, Ll/p6d0;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public Yp()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public Z9()I
    .locals 0

    .line 1
    const/16 p0, 0x18

    return p0
.end method

.method public Za(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 2
    .line 3
    const-string v0, "meet"

    .line 4
    .line 5
    invoke-direct {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/d$a;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->m(Ljava/lang/Object;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->j(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/d;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/greet/d$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Zd()V
    .locals 0

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6d0;->h0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Zh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/a$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/android/app/a$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p2, Ll/kn5;

    .line 6
    .line 7
    invoke-direct {p2}, Ll/kn5;-><init>()V

    .line 8
    .line 9
    .line 10
    const/16 p3, 0x64

    .line 11
    .line 12
    invoke-virtual {p1, p0, p3, p2, p4}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;Lcom/p1/mobile/android/app/a$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Zi()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/yie0;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public Zp()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzc0;->y()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ad()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->L()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public ah(Ll/x0m;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const-string v2, "feedBoostCard"

    .line 17
    .line 18
    invoke-interface {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public ai(Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OmsTagUserCounts;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/gj40;->R(Ljava/util/List;)Ll/gj40$h;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/gj40$h;->b()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public aj(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public al()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/qs50;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public an(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "supreme_partner_customize"

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {p0, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public ap(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CityCData;)V
    .locals 1

    .line 1
    new-instance p0, Ll/n55;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Ll/n55;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, p2, v0}, Ll/n55;->K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public b3()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b9()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public bc()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->en:I

    .line 2
    .line 3
    return p0
.end method

.method public bd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/qtk;->U0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)Ll/pej0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bi(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "lowPriceFirstTime12MSVIP"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public bk()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/qs50;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c6()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->dq:I

    .line 2
    .line 3
    return p0
.end method

.method public c7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/bg40;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ca(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Ll/tje0;->h(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/widget/TextView;II)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public cl(Landroid/app/Activity;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct_CustomTransition;

    .line 2
    .line 3
    return p0
.end method

.method public cm(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->o0(Lcom/p1/mobile/android/app/Act;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public cn()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public cr()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->O1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final cu(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 12

    .line 1
    move-object/from16 p0, p4

    .line 2
    .line 3
    move-object/from16 v0, p6

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 6
    .line 7
    .line 8
    move-result-object v9

    .line 9
    new-instance v1, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->f()Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    move-object/from16 v5, p5

    .line 39
    .line 40
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/d;->h()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v9, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 61
    .line 62
    const-string v2, "picks"

    .line 63
    .line 64
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    const/4 v10, 0x0

    .line 69
    const/4 v11, 0x0

    .line 70
    const/4 v4, 0x0

    .line 71
    const/4 v6, 0x0

    .line 72
    const/4 v8, 0x1

    .line 73
    move v2, p1

    .line 74
    move v3, p2

    .line 75
    invoke-virtual/range {v1 .. v11}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v1, Ll/oa7;

    .line 84
    .line 85
    invoke-direct {v1, p0, p2, v0}, Ll/oa7;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;)V

    .line 86
    .line 87
    .line 88
    new-instance p2, Ll/pa7;

    .line 89
    .line 90
    invoke-direct {p2, p0}, Ll/pa7;-><init>(Lcom/p1/mobile/putong/core/newui/home/d;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public dc(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->x(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->G()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public de()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->b0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public dj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public dm(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/a$a;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 9
    .line 10
    invoke-static {p1, p0, v0, p2}, Ll/ljf;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;Lcom/p1/mobile/android/app/a$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public dn(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public dp(J)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ds()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic du(Lcom/p1/mobile/putong/core/newui/home/d;ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/d;->p()V

    .line 2
    .line 3
    .line 4
    move v0, p4

    .line 5
    move-object p4, p1

    .line 6
    move p1, p2

    .line 7
    move p2, p3

    .line 8
    move p3, v0

    .line 9
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->cu(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e2()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ea(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/wyb0;->y0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public eg()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "male"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public eh(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct;->Companion:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsAct$a;->a(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public ei(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/y6d0;->a(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public en()V
    .locals 0

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6d0;->k0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public eo(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->t1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic eu(ZLcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 14

    if-eqz p1, :cond_0

    move-object/from16 v0, p2

    .line 1
    iget v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    if-nez v1, :cond_0

    .line 2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_LIKENOLIMIT_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 3
    invoke-static {v0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    const/4 v5, 0x0

    move-object v1, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->fu(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Z)V

    return-void

    :cond_0
    if-eqz p6, :cond_2

    .line 5
    invoke-static {}, Ll/a5i0;->x0()I

    move-result v0

    if-gtz v0, :cond_2

    .line 6
    invoke-static {}, Ll/joa;->M3()Z

    move-result p1

    if-nez p1, :cond_1

    .line 7
    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    const/4 v10, 0x0

    move-object v6, p0

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move/from16 v11, p5

    invoke-virtual/range {v6 .. v11}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->fu(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Z)V

    return-void

    .line 8
    :cond_1
    invoke-static/range {p3 .. p4}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 9
    const-string p0, "failExhaustSuperlike"

    move-object/from16 v8, p7

    invoke-static {v8, p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    return-void

    :cond_2
    move-object/from16 v8, p7

    if-eqz p6, :cond_4

    .line 10
    new-instance v6, Ll/na7;

    move-object v7, p0

    move v9, p1

    move-object/from16 v13, p3

    move/from16 v10, p6

    move/from16 v11, p8

    move-object/from16 v12, p9

    invoke-direct/range {v6 .. v13}, Ll/na7;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Lcom/p1/mobile/putong/core/newui/home/d;ZZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    move-object v7, v13

    .line 11
    invoke-static {v7, v6}, Ll/a5i0;->G1(Lcom/p1/mobile/android/app/Act;Ll/x20;)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    move-object v12, v7

    move-object v6, p0

    move/from16 v8, p6

    move-object/from16 v10, p7

    move/from16 v9, p8

    move-object/from16 v11, p9

    move v7, p1

    goto :goto_0

    :cond_4
    move-object/from16 v12, p3

    move-object v6, p0

    move v7, p1

    move/from16 v8, p6

    move-object/from16 v10, p7

    move/from16 v9, p8

    move-object/from16 v11, p9

    .line 12
    :goto_0
    invoke-virtual/range {v6 .. v12}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->cu(ZZZLcom/p1/mobile/putong/core/newui/home/d;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public fb(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xhj;->d(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ff(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "from_picks"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "from_meet_picks_feed"

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "from_meet_picks_card"

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-string p0, "from_new_meet_picks_feed"

    .line 26
    .line 27
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public fg(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Fm:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Em:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Cm:I

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/fa7;

    .line 20
    .line 21
    invoke-direct {v2, p1}, Ll/fa7;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p0, v0, v1, v2}, Ll/ebn;->C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public fh(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u2n;->t()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x5

    .line 14
    invoke-virtual {p0, v0}, Ll/u2n;->j(I)Ll/o2n;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, p1}, Ll/z60;->c(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public fl()V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    return-void
.end method

.method public fm()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/fcp;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public fo()I
    .locals 0

    .line 1
    invoke-static {}, Ll/tmp;->f()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public fr(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/bdr;->g(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final fu(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    const/4 p5, 0x0

    .line 4
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v5, 0x0

    .line 9
    move-object v0, p0

    .line 10
    move-object v1, p1

    .line 11
    move-object v2, p2

    .line 12
    move-object v3, p3

    .line 13
    move-object v4, p4

    .line 14
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g5(Landroid/content/Context;Ljava/util/List;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public gd()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/o6d0;->c0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public gl()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "heart_confession_uid"

    .line 2
    .line 3
    return-object p0
.end method

.method public h5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public h7()I
    .locals 0

    .line 1
    const/16 p0, 0x28

    return p0
.end method

.method public ha(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CityCData;)V
    .locals 1

    .line 1
    new-instance p0, Ll/n55;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Ll/n55;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x3

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, p2, v0}, Ll/n55;->K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public hc(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/e1b;->D0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public he(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    return p0
.end method

.method public hg(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Act$w;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/p1/mobile/android/app/Act;",
            ">(TT;)",
            "Lcom/p1/mobile/android/app/Act$w;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public hl()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HEIGHT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "from_explore_card_height"

    .line 12
    .line 13
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->J(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    return p0
.end method

.method public hm()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public hn()I
    .locals 0

    .line 1
    invoke-static {}, Ll/lrj0;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ho(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/fp5;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public hp()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "e_card_add_tag"

    .line 2
    .line 3
    return-object p0
.end method

.method public hq(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksHeaderView;

    .line 2
    .line 3
    return p0
.end method

.method public ht()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public i0(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u2n;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x7

    .line 18
    invoke-virtual {p0, v0}, Ll/u2n;->j(I)Ll/o2n;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, p1}, Ll/z60;->c(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public ij()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public in(F)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u17;->R(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public j3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public jh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public jj()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->N()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public jl(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/OOFMkWebViewAct;->o2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public jr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public k4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public kb()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->B1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public kh(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->m(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public kp(Z)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/wyb0;->O()Ll/wyb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/wyb0;->U(Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->A1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l6()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->w2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public lc()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public lh()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->Q2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public lq()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->J0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public lr(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u2n;->t()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/u2n;->j(I)Ll/o2n;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1}, Ll/z60;->c(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public ls()D
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->e()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public m2()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public m3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public m7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public m9()I
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->s0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public mb()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/fcp;->i()Ll/fcp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fcp;->h()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public me(Lcom/p1/mobile/android/app/Act;)Ll/dzl;
    .locals 0

    .line 1
    new-instance p0, Ll/oby;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/oby;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public mh(Ll/x0m;Lcom/p1/mobile/putong/core/data/Active;)V
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$c;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x0m;)V

    .line 4
    .line 5
    .line 6
    new-instance v6, Ll/pow;

    .line 7
    .line 8
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-direct {v6, p0, v2, v0}, Ll/pow;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y3m;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Active;->skuId:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-static/range {v1 .. v6}, Ll/rk60;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/lang/String;Ljava/lang/String;Ll/bn50;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public mi(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xhj;->b(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public mo()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public mt(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p0, "from_new_meet_picks_feed"

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, p2, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public n8(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public nk(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->g2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public nr()I
    .locals 0

    .line 1
    const/16 p0, 0x29

    return p0
.end method

.method public o6()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->V()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public oc()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/spl0;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public og()V
    .locals 0

    .line 1
    invoke-static {}, Ll/rv4;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public oi(I)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/yie0;->g(I)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public op(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->c(I)Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/da7;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Ll/da7;-><init>(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->h(Ll/a30;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "picks"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->l(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->p()Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public p0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->y2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public pf(Landroid/content/Context;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    .line 2
    .line 3
    return p0
.end method

.method public pg(Lcom/p1/mobile/android/app/Act;Ll/a30;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/o5h0;->x(Lcom/p1/mobile/android/app/Act;Ll/a30;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pi(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xhj;->c(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pl(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Z)V
    .locals 1

    .line 1
    new-instance p0, Ll/pn90;

    .line 2
    .line 3
    new-instance v0, Ll/va7;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/va7;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p3, v0}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    const-string p3, "from_intl_meet_likers"

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    const/16 p3, 0x52

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/16 p3, 0x51

    .line 24
    .line 25
    :goto_0
    invoke-virtual {p1, p2, p3, p0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public pp(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->r1(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->J3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public q6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->u1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public qb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x19

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const-string v2, "from_new_meet_likers"

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {p1, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p0, Ll/pn90;

    .line 21
    .line 22
    new-instance v3, Ll/ca7;

    .line 23
    .line 24
    invoke-direct {v3}, Ll/ca7;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, p3, v3}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2, v0, p0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public qd(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->g2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public qj(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->H(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 8
    .line 9
    invoke-static {p1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "%1$s \u00b7 %2$s"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public qk(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->l0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p1, p2, p3, p0, p4}, Lcom/p1/mobile/putong/core/ui/purchase/c;->y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public qt()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    move-object p1, p2

    .line 3
    move-object p2, p4

    .line 4
    const/4 p4, 0x0

    .line 5
    move-object v0, p5

    .line 6
    move-object p5, p3

    .line 7
    move-object p3, v0

    .line 8
    invoke-static/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public rc()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->A2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public rd(Ll/x0m;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/v83;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/core/R$string;->rt:I

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/x0m;->Y1(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/a5i0;->l0()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$a;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$a;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x0m;)V

    .line 30
    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    invoke-static {v0, v1, p0}, Ll/u73;->z(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    new-instance v0, Ll/fe5$e;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {v0, v1}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "e_intl_boost_trial_card"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/fe5$e;->i(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/fe5$e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-virtual {v0, v1}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;

    .line 71
    .line 72
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;-><init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x0m;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/fe5$e;->g(Ll/a30;)Ll/fe5$e;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public re()I
    .locals 0

    .line 1
    const/16 p0, 0x19

    return p0
.end method

.method public ri()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6d0;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public rj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public rl(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/efh0;->h(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public rn(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "likers"

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/16 p1, 0x12

    .line 15
    .line 16
    invoke-virtual {p2, p0, p1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public s()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->h3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public s3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public s6()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public s7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x12

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const-string v2, "liked_users"

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {p1, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p1, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p2, Ll/pn90;

    .line 25
    .line 26
    invoke-direct {p2, p3, p4}, Ll/pn90;-><init>(Landroid/view/View;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p0, v0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public s8()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public sf()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {p1, p3, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public si()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public sk(Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p1}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public sl()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->t0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public sp(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/a5i0;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/a5i0;->c1()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    new-instance v0, Ll/ga7;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ll/ga7;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p1, p0, v0, v1}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    invoke-static {p1, p0}, Ll/ma3;->d(Lcom/p1/mobile/android/app/Act;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public ss(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;Landroid/widget/LinearLayout;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string p1, "likers"

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p4, p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    instance-of p1, p4, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/gra;->L3()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    new-instance p1, Ll/ojr;

    .line 21
    .line 22
    invoke-direct {p1, p2, p3}, Ll/ojr;-><init>(Lv/VDraweeView;Landroid/widget/LinearLayout;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    :goto_0
    const/16 p2, 0x12

    .line 28
    .line 29
    invoke-virtual {p4, p0, p2, p1}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public st(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;IIIZLandroid/view/ViewOutlineProvider;Ll/l4g0;Ll/x20;Landroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .locals 0

    .line 1
    new-instance p0, Ll/ugy$a;

    invoke-direct {p0, p1}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    invoke-virtual {p0, p2}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    move-result-object p0

    .line 3
    invoke-virtual {p0, p3}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    move-result-object p0

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    move-result-object p0

    new-instance p1, Ll/ia7;

    invoke-direct {p1, p12}, Ll/ia7;-><init>(Ll/x20;)V

    .line 5
    invoke-virtual {p0, p4, p1}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    move-result-object p0

    new-instance p1, Ll/ja7;

    invoke-direct {p1}, Ll/ja7;-><init>()V

    .line 6
    invoke-virtual {p0, p5, p1}, Ll/ugy$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    move-result-object p0

    .line 7
    invoke-virtual {p0, p9}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    move-result-object p0

    .line 8
    invoke-virtual {p0, p6, p13}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/ugy$a;->t()Ll/ugy;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 10
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->a:Landroid/widget/RelativeLayout;

    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 12
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->a:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, p10}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 13
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->a:Landroid/widget/RelativeLayout;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setClipToOutline(Z)V

    .line 14
    :cond_1
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    invoke-virtual {p1, p7}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->F(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 15
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    invoke-virtual {p1, p8}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->R(I)V

    .line 16
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->c:Lv/VDraweeView;

    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 17
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->c:Lv/VDraweeView;

    const/high16 p2, 0x437a0000    # 250.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 18
    :cond_2
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->j0()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 19
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    move-result-object p1

    sget p2, Ll/c9c0;->v0:I

    invoke-static {p2}, Ll/k3d0;->a(I)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->f0(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 20
    invoke-virtual {p0, p11}, Ll/ugy;->m(Ll/l4g0;)V

    .line 21
    invoke-virtual {p0}, Ll/ugy;->n()V

    :cond_3
    :goto_0
    return-void
.end method

.method public ta()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public tc()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "https://auto.tancdn.com/v1/raw/bd3b6c84-2d79-4eb5-928f-4dc06d19cdf513.pdf"

    .line 2
    .line 3
    return-object p0
.end method

.method public tk(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->N5:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Lcom/p1/mobile/putong/core/R$string;->M5:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Cm:I

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/ha7;

    .line 20
    .line 21
    invoke-direct {v2, p1}, Ll/ha7;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, p0, v0, v1, v2}, Ll/ebn;->C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public tn()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/n3x;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ts(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/v83;->c(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public tt()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public u5()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/wcl0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public ug(Landroid/app/Activity;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public uh()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public um()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->D()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public un()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public uo(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xck;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public v7(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Ll/pci;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public vb(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public vc()I
    .locals 0

    .line 1
    invoke-static {}, Ll/o6d0;->m0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public vh(Lcom/p1/mobile/android/app/Act;)V
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ur:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ps:I

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget v3, Ll/dbc0;->v8:I

    .line 16
    .line 17
    sget v4, Lcom/p1/mobile/putong/core/R$string;->os:I

    .line 18
    .line 19
    invoke-virtual {v0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    const/4 v14, 0x0

    .line 24
    const/4 v15, 0x0

    .line 25
    const/4 v5, 0x0

    .line 26
    const/4 v6, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    const/4 v8, 0x0

    .line 29
    const/4 v9, 0x0

    .line 30
    const/4 v10, 0x0

    .line 31
    const/4 v11, 0x1

    .line 32
    const/4 v12, 0x0

    .line 33
    const/4 v13, 0x0

    .line 34
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public vl(Lcom/p1/mobile/putong/core/PutongCoreAct;)Ll/ux0;
    .locals 0

    .line 1
    new-instance p0, Ll/pqb;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/pqb;-><init>(Lcom/p1/mobile/putong/core/PutongCoreAct;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public vo(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "from_meet_picks_feed"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_3

    .line 8
    .line 9
    const-string p0, "from_new_meet_picks_feed"

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_3

    .line 16
    .line 17
    const-string p0, "from_meet_picks_card"

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const-string p0, "from_meet_feed"

    .line 27
    .line 28
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    const-string p0, "from_meet_profile"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p0, "p_meet_view,e_meet_card_sayhi,click"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    :goto_0
    const-string p0, "p_meet_view,e_whoiliked_card,sayhi_superlike"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    :goto_1
    const-string p0, "p_meet_view,e_picks_feed_card,like_swipe"

    .line 50
    .line 51
    return-object p0
.end method

.method public vs(Ll/x0m;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;)V
    .locals 1

    .line 1
    const-string p0, "success"

    .line 2
    .line 3
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->operateResult:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p1}, Ll/x0m;->u0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p2, p1}, Ll/y6d0;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Q5()V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->R5()V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 48
    .line 49
    .line 50
    const-string p0, "realUser"

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    const/4 p1, 0x1

    .line 57
    if-eqz p0, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0, p1}, Ll/x6d0;->q0(Z)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, p1}, Ll/x6d0;->p0(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    const-string p0, "online"

    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_2

    .line 81
    .line 82
    invoke-static {}, Ll/x6d0;->l0()Ll/x6d0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, p1}, Ll/x6d0;->n0(Z)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->msg:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_2

    .line 97
    .line 98
    iget-object p0, p3, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->msg:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public w6()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/vnb;->p1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public wa(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/aw90;->w(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public we()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/HometownSuggest;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gw90;->g()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public wh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public wi(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/ma3;->d(Lcom/p1/mobile/android/app/Act;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public wk(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/rbb0;->x(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public wp()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/qs50;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->B1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public ws()J
    .locals 2

    .line 1
    invoke-static {}, Ll/rbb0;->i()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public wt(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/android/app/Act$w;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x18

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const-string v2, "from_picks"

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {p1, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p1, p2, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0, v0, p3}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public x8(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/u2n;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {}, Ll/u2n;->l()Ll/u2n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/16 v0, 0x9

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/u2n;->j(I)Ll/o2n;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1, p2}, Ll/z60;->a(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public xb()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/n6d0;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public xg(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const-string v0, "visitor"

    .line 4
    .line 5
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/IntlMeetAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public xo()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->p()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public ye(Lcom/p1/mobile/android/app/Act;Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/fe5$e;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/16 p1, 0x11

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "p_knowmyself_purchase,e_knowmyself_test,click"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0, p2}, Ll/fe5$e;->g(Ll/a30;)Ll/fe5$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public yl(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/tje0;->d(Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public z1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public z6()I
    .locals 0

    .line 1
    invoke-static {}, Ll/tmp;->e()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public z7()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/pa3;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public z9()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public za(II)Ll/smd0$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/tje0;->j(II)Ll/smd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public zc(Lcom/p1/mobile/putong/data/Relationship;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 17
    .line 18
    const-string v1, "superLikedEach"

    .line 19
    .line 20
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/16 p0, 0xd

    .line 27
    .line 28
    return p0

    .line 29
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 44
    .line 45
    const-string v1, "superLiked"

    .line 46
    .line 47
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    const/16 p0, 0xb

    .line 54
    .line 55
    return p0

    .line 56
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 71
    .line 72
    const-string p1, "secretcrush"

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_2

    .line 79
    .line 80
    const/4 p0, 0x1

    .line 81
    return p0

    .line 82
    :cond_2
    return v0
.end method

.method public zg()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/rm50;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public zi(Lcom/p1/mobile/android/app/Act;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public zj(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p1, Ll/qa00;->O:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method

.method public zq(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/zki0;->O(Lcom/p1/mobile/android/app/Act;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
