.class public Ll/pq50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

.field public c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ll/pq50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pq50;->p()V

    return-void
.end method

.method public static synthetic i(Ll/f1g0;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/f1g0;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/pq50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pq50;->r()V

    return-void
.end method

.method public static synthetic k(Ll/pq50;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pq50;->q(Ljava/lang/Boolean;Ljava/lang/String;)V

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

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
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
    invoke-static {}, Ll/spl0;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p3, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget p0, Ll/kec0;->zb:I

    .line 9
    .line 10
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    sget p0, Ll/kec0;->xb:I

    .line 16
    .line 17
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
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
    new-instance p3, Ll/jq50;

    .line 13
    .line 14
    invoke-direct {p3, p4}, Ll/jq50;-><init>(Landroid/view/View;)V

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
    iput-object p1, p0, Ll/pq50;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

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
    iput-object p1, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

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
    iput-object p1, p0, Ll/pq50;->d:Lcom/p1/mobile/putong/data/User;

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
    iget-object p1, p0, Ll/pq50;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

    .line 73
    .line 74
    iget-object p3, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 75
    .line 76
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 77
    .line 78
    new-instance p4, Ll/kq50;

    .line 79
    .line 80
    invoke-direct {p4, p0}, Ll/kq50;-><init>(Ll/pq50;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p3, p4}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    const/4 p1, 0x1

    .line 87
    sput-boolean p1, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 88
    .line 89
    if-nez p2, :cond_3

    .line 90
    .line 91
    iget-object p0, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 96
    .line 97
    .line 98
    :cond_3
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
    .locals 1

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
    if-ne p1, p2, :cond_3

    .line 21
    .line 22
    iget-object p1, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getInsertCard()Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isInitiateQuickChat()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 40
    .line 41
    iget-object p2, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getInsertCard()Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/v;->K4(Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 58
    .line 59
    iget-object p2, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 60
    .line 61
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/api/v;->L4(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    iget-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const/4 p2, 0x0

    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-virtual {p0, p1, p2, v0}, Ll/pq50;->s(Ll/f1g0;ZLjava/lang/String;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 86
    .line 87
    if-eq p1, p2, :cond_4

    .line 88
    .line 89
    return-object p1

    .line 90
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->markAsConsumed()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/pq50;->n()V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 101
    .line 102
    return-object p0
.end method

.method public final n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->e6()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_home,quickchat_card"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

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
    const-string v1, "online_card_adapter_render"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C8(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pq50;->n()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic q(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/f1g0;->d()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/pq50;->d:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "other_user_id"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "direction"

    .line 23
    .line 24
    const-string v2, "like"

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "is_emoji"

    .line 31
    .line 32
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    filled-new-array {v0, v1, p1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v0, "e_card_quickchat"

    .line 41
    .line 42
    const-string v1, "p_suggest_users_home_view"

    .line 43
    .line 44
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v0, 0x1

    .line 56
    invoke-virtual {p0, p1, v0, p2}, Ll/pq50;->s(Ll/f1g0;ZLjava/lang/String;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 61
    .line 62
    if-ne p1, p2, :cond_0

    .line 63
    .line 64
    iget-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 65
    .line 66
    new-instance p2, Ll/oq50;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/oq50;-><init>(Ll/pq50;)V

    .line 69
    .line 70
    .line 71
    const-wide/16 v0, 0xc8

    .line 72
    .line 73
    invoke-static {p1, p2, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 74
    .line 75
    .line 76
    :cond_0
    return-void
.end method

.method public final synthetic r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->B:Ll/b240;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/b240;->W8(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/a5i0;->W0()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final s(Ll/f1g0;ZLjava/lang/String;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->b0()I

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/a5i0;->E0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/a5i0;->K()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    move v5, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v5, v1

    .line 28
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v3, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 37
    .line 38
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    iget-object v3, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 53
    .line 54
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 59
    .line 60
    if-eqz v3, :cond_1

    .line 61
    .line 62
    invoke-static {}, Ll/gra;->c2()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_1

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    iget-object p0, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    const/4 v6, 0x0

    .line 95
    xor-int/lit8 v7, p2, 0x1

    .line 96
    .line 97
    move-object v8, p3

    .line 98
    invoke-static/range {v3 .. v8}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto/16 :goto_1

    .line 102
    .line 103
    :cond_1
    move-object v8, p3

    .line 104
    invoke-static {}, Ll/a5i0;->s0()I

    .line 105
    .line 106
    .line 107
    move-result p3

    .line 108
    if-gtz p3, :cond_2

    .line 109
    .line 110
    iget-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    new-instance p2, Ll/lq50;

    .line 117
    .line 118
    invoke-direct {p2}, Ll/lq50;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->p0()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    invoke-virtual {p0}, Ll/pq50;->o()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object p0, p0, Ll/pq50;->d:Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {p1, p2, p3, v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->p1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_2
    if-eqz v5, :cond_3

    .line 140
    .line 141
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 142
    .line 143
    .line 144
    move-result-object p3

    .line 145
    invoke-virtual {p3}, Ll/a5i0;->g1()Z

    .line 146
    .line 147
    .line 148
    move-result p3

    .line 149
    if-eqz p3, :cond_3

    .line 150
    .line 151
    iget-object p3, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 152
    .line 153
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->B:Ll/b240;

    .line 154
    .line 155
    invoke-virtual {p3}, Ll/b240;->o6()Z

    .line 156
    .line 157
    .line 158
    move-result p3

    .line 159
    if-nez p3, :cond_3

    .line 160
    .line 161
    iget-object p2, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 162
    .line 163
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    sget-object p3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS_EXTRA:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 168
    .line 169
    new-instance v0, Ll/mq50;

    .line 170
    .line 171
    invoke-direct {v0, p0}, Ll/mq50;-><init>(Ll/pq50;)V

    .line 172
    .line 173
    .line 174
    new-instance p0, Ll/nq50;

    .line 175
    .line 176
    invoke-direct {p0, p1}, Ll/nq50;-><init>(Ll/f1g0;)V

    .line 177
    .line 178
    .line 179
    invoke-static {p2, p3, v0, p0}, Ll/a5i0;->B1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 180
    .line 181
    .line 182
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->stay:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 183
    .line 184
    return-object p0

    .line 185
    :cond_3
    iget-object p1, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->B:Ll/b240;

    .line 188
    .line 189
    invoke-virtual {p1, v1}, Ll/b240;->W8(Z)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 193
    .line 194
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isInitiateQuickChat()Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    iget-object p3, p0, Ll/pq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 199
    .line 200
    if-eqz p1, :cond_4

    .line 201
    .line 202
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    iget-object p0, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 209
    .line 210
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getInsertCard()Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-static {p1, p0, v5, p2, v8}, Ll/a8d0;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;)V

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_4
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    iget-object p0, p0, Ll/pq50;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    const/4 v6, 0x0

    .line 231
    xor-int/lit8 v7, p2, 0x1

    .line 232
    .line 233
    invoke-static/range {v3 .. v8}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLl/x20;ZLjava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 237
    .line 238
    return-object p0
.end method
