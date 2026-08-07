.class public Ll/wvb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Ll/x0m;

.field public b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

.field public c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wvb0;->a:Ll/x0m;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u5bf9\u65b9\u7528\u6237\u6b63\u5728\u901a\u8bdd\u4e2d\uff0c\u53ef\u4ee5\u53bb\u53d1\u8d77\u8bed\u97f3\u95ea\u804a\u54e6"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Ll/wvb0;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/wvb0;->o(Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/wvb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wvb0;->n()V

    return-void
.end method

.method public static synthetic k(Ll/wvb0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wvb0;->p(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->O0(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ri(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/wvb0;->a:Ll/x0m;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x0m;->I()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->markAsConsumed()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 11
    .line 12
    const-string v1, "quick_audio_card_adapter"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C8(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/wvb0;->m()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic o(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wvb0;->a:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/x0m;->V1()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wvb0;->q()Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 14
    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/wvb0;->a:Ll/x0m;

    .line 18
    .line 19
    invoke-interface {p1}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/vvb0;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/vvb0;-><init>(Ll/wvb0;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v0, 0xc8

    .line 29
    .line 30
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gg()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget-object p0, p0, Ll/wvb0;->d:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    const-string p2, "other_user_id"

    .line 50
    .line 51
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p2, "remainingtimes"

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "e_match_card_quickchat_voice"

    .line 70
    .line 71
    const-string p2, "p_suggest_users_home_view"

    .line 72
    .line 73
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/nec0;->s:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 2

    .line 1
    instance-of p3, p4, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    move-object p3, p4

    .line 6
    check-cast p3, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->O0(Z)V

    .line 10
    .line 11
    .line 12
    new-instance p3, Ll/tvb0;

    .line 13
    .line 14
    invoke-direct {p3, p4}, Ll/tvb0;-><init>(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v0, 0x3e8

    .line 18
    .line 19
    invoke-virtual {p4, p3, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

    .line 23
    .line 24
    iput-object p1, p0, Ll/wvb0;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

    .line 25
    .line 26
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 31
    .line 32
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 37
    .line 38
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    if-nez p3, :cond_1

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    iput-object p1, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Ll/wvb0;->d:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    iget-object p1, p0, Ll/wvb0;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

    .line 73
    .line 74
    iget-object p2, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 75
    .line 76
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 77
    .line 78
    new-instance p3, Ll/uvb0;

    .line 79
    .line 80
    invoke-direct {p3, p0}, Ll/uvb0;-><init>(Ll/wvb0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gg()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iget-object p2, p0, Ll/wvb0;->d:Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 101
    .line 102
    const-string p3, "other_user_id"

    .line 103
    .line 104
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    const-string p3, "remainingtimes"

    .line 109
    .line 110
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-static {p3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string p2, "e_match_card_quickchat_voice"

    .line 123
    .line 124
    const-string p3, "p_suggest_users_home_view"

    .line 125
    .line 126
    invoke-static {p2, p3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const/4 p2, 0x1

    .line 138
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ri(Z)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Ll/wvb0;->a:Ll/x0m;

    .line 142
    .line 143
    invoke-interface {p0}, Ll/x0m;->O3()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-eq p1, p2, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O5()V

    .line 18
    .line 19
    .line 20
    if-ne p1, p2, :cond_2

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->p1:Lcom/p1/mobile/putong/core/api/CoreAudioMatch;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->u3()Lrx/c;

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    invoke-virtual {p0}, Ll/wvb0;->q()Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 35
    .line 36
    if-eq v0, v1, :cond_3

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->markAsConsumed()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Ll/wvb0;->m()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gg()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget-object p0, p0, Ll/wvb0;->d:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    const-string v1, "other_user_id"

    .line 66
    .line 67
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string v1, "remainingtimes"

    .line 72
    .line 73
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    if-ne p1, p2, :cond_4

    .line 82
    .line 83
    const-string p1, "left"

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_4
    const-string p1, "right"

    .line 87
    .line 88
    :goto_2
    const-string p2, "direction"

    .line 89
    .line 90
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    filled-new-array {p0, v0, p1}, [Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const-string p1, "e_match_card_quickchat_voice"

    .line 99
    .line 100
    const-string p2, "p_suggest_users_home_view"

    .line 101
    .line 102
    invoke-static {p1, p2, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 106
    .line 107
    return-object p0
.end method

.method public final synthetic p(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/wvb0;->a:Ll/x0m;

    .line 10
    .line 11
    iget-object p0, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ef(Ll/x0m;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final q()Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->kp(Z)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gg()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v2, p0, Ll/wvb0;->a:Ll/x0m;

    .line 39
    .line 40
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->p1:Lcom/p1/mobile/putong/core/api/CoreAudioMatch;

    .line 43
    .line 44
    iget-object v4, p0, Ll/wvb0;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 45
    .line 46
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 47
    .line 48
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-object v4, v4, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 53
    .line 54
    if-gtz v0, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/4 v1, 0x0

    .line 58
    :goto_0
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->o3(Z)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v3, v4, v0}, Lcom/p1/mobile/putong/core/api/CoreAudioMatch;->p3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v2, v0}, Ll/x0m;->z1(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/rvb0;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/rvb0;-><init>(Ll/wvb0;)V

    .line 73
    .line 74
    .line 75
    new-instance p0, Ll/svb0;

    .line 76
    .line 77
    invoke-direct {p0}, Ll/svb0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 88
    .line 89
    return-object p0
.end method
