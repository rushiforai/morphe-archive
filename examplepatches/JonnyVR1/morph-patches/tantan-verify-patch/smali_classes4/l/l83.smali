.class public Ll/l83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;

.field public c:Ljava/lang/Boolean;

.field public d:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object v0, p0, Ll/l83;->c:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object v0, p0, Ll/l83;->d:Ljava/lang/Boolean;

    .line 9
    .line 10
    iput-object p1, p0, Ll/l83;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 11
    .line 12
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
    sget p0, Ll/kec0;->X:I

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
    .locals 0

    .line 1
    iget-object p2, p0, Ll/l83;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/l83;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p2, p0, Ll/l83;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 24
    .line 25
    .line 26
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;

    .line 31
    .line 32
    iput-object p1, p0, Ll/l83;->b:Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;

    .line 33
    .line 34
    iget-object p2, p0, Ll/l83;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 35
    .line 36
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/boost/BoostGuideCardView;->f(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/l83;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eq p1, p2, :cond_1

    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 7
    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p1, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 14
    :goto_1
    if-eqz p1, :cond_3

    .line 15
    .line 16
    invoke-static {}, Ll/ric0;->m()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iget-object v1, p0, Ll/l83;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 21
    .line 22
    const-string v2, "p_home,accelerate_card"

    .line 23
    .line 24
    if-eqz p2, :cond_2

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2, v0, v2}, Ll/y9;->c(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p2, v0, v2}, Ll/v83;->f(Landroid/content/Context;ZLjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    :goto_2
    iget-object p0, p0, Ll/l83;->c:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_5

    .line 48
    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    const-string p0, "like"

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_4
    const-string p0, "dislike"

    .line 55
    .line 56
    :goto_3
    const-string p1, "direction"

    .line 57
    .line 58
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "e_boost_card"

    .line 67
    .line 68
    const-string p2, "p_suggest_users_home_view"

    .line 69
    .line 70
    invoke-static {p1, p2, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 74
    .line 75
    return-object p0
.end method
