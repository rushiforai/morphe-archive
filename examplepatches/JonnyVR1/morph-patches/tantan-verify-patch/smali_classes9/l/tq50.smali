.class public Ll/tq50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/tq50;->d:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/tq50;->e:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/tq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic h(Ll/tq50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tq50;->l()V

    return-void
.end method

.method public static synthetic i(Landroid/view/View;)V
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

.method public static synthetic j(Ll/tq50;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/tq50;->m(Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method private k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->e6()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic l()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v1, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->B8(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Ll/u6c0;->I(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Ll/tq50;->k()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic m(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ll/f1g0;->d()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/tq50;->d:Z

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Ll/tq50;->d:Z

    .line 18
    .line 19
    iget-object p1, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1}, Ll/ar50;->i(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/tq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p2, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1, p2}, Ll/ar50;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/tq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 40
    .line 41
    new-instance p2, Ll/sq50;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Ll/sq50;-><init>(Ll/tq50;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v0, 0xc8

    .line 47
    .line 48
    invoke-static {p1, p2, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 49
    .line 50
    .line 51
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
    sget p0, Ll/kec0;->yb:I

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
    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Ll/tq50;->d:Z

    .line 3
    .line 4
    instance-of v0, p4, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p4

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 10
    .line 11
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->O0(Z)V

    .line 12
    .line 13
    .line 14
    new-instance p3, Ll/qq50;

    .line 15
    .line 16
    invoke-direct {p3, p4}, Ll/qq50;-><init>(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    const-wide/16 v0, 0x3e8

    .line 20
    .line 21
    invoke-virtual {p4, p3, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;

    .line 25
    .line 26
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 29
    .line 30
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 31
    .line 32
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    check-cast p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 37
    .line 38
    iget-object p4, p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result p4

    .line 44
    if-nez p4, :cond_1

    .line 45
    .line 46
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 53
    .line 54
    iput-object p2, p0, Ll/tq50;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 55
    .line 56
    :cond_1
    iget-object p2, p0, Ll/tq50;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 59
    .line 60
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iput-object p2, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    iget-object p2, p0, Ll/tq50;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 73
    .line 74
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 75
    .line 76
    new-instance p3, Ll/rq50;

    .line 77
    .line 78
    invoke-direct {p3, p0}, Ll/rq50;-><init>(Ll/tq50;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchBaseCardView;->f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-boolean p1, p0, Ll/tq50;->e:Z

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    const/4 p1, 0x1

    .line 89
    iput-boolean p1, p0, Ll/tq50;->e:Z

    .line 90
    .line 91
    iget-object p0, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p0}, Ll/ar50;->j(Ljava/lang/String;)V

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
    if-ne p1, p2, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Ll/ar50;->h(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    iget-boolean p1, p0, Ll/tq50;->d:Z

    .line 31
    .line 32
    if-nez p1, :cond_3

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Ll/tq50;->d:Z

    .line 36
    .line 37
    iget-object p1, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p1}, Ll/ar50;->i(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/tq50;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p2, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p1, p2}, Ll/ar50;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/tq50;->c:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Ll/u6c0;->I(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 65
    .line 66
    return-object p0
.end method
