.class public Ll/jje0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:I

.field public b:Ll/x0m;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/x0m;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/jje0;->a:I

    .line 6
    .line 7
    new-instance v0, Ll/ije0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ije0;-><init>(Ll/jje0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/jje0;->c:Ll/y20;

    .line 13
    .line 14
    iput-object p1, p0, Ll/jje0;->b:Ll/x0m;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic h(Ll/jje0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jje0;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/jje0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jje0;->n(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method

.method public static synthetic j(Ll/jje0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jje0;->m(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jje0;->c:Ll/y20;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jje0;->b:Ll/x0m;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll/x0m;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
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
    sget-object p0, Ll/jje0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    aget p0, p0, p3

    .line 8
    .line 9
    const/4 p3, 0x1

    .line 10
    if-eq p0, p3, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget p0, Ll/nec0;->u:I

    .line 15
    .line 16
    const/4 p3, 0x0

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
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput p2, p0, Ll/jje0;->a:I

    .line 3
    .line 4
    sget-object p2, Ll/jje0$a;->a:[I

    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    aget p2, p2, p3

    .line 11
    .line 12
    const/4 p3, 0x1

    .line 13
    if-eq p2, p3, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/core/ui/svip/opads/BoostIntroCardView;

    .line 17
    .line 18
    new-instance p2, Ll/gje0;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/gje0;-><init>(Ll/jje0;)V

    .line 21
    .line 22
    .line 23
    new-instance p3, Ll/hje0;

    .line 24
    .line 25
    invoke-direct {p3, p0}, Ll/hje0;-><init>(Ll/jje0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/svip/opads/BoostIntroCardView;->s(Ll/y20;Ll/y20;)V

    .line 29
    .line 30
    .line 31
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
    .locals 2

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-interface {p2}, Ll/jam;->getIVirtualCardUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->BoostIntroCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 10
    .line 11
    if-ne p2, v0, :cond_2

    .line 12
    .line 13
    const-string p2, "swipe_type"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/jje0;->k(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    filled-new-array {p2}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "e_boost_lead_svip_card"

    .line 28
    .line 29
    const-string v1, "p_suggest_users_home_view"

    .line 30
    .line 31
    invoke-static {v0, v1, p2}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 35
    .line 36
    if-eq p1, p2, :cond_0

    .line 37
    .line 38
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 39
    .line 40
    if-ne p1, p2, :cond_1

    .line 41
    .line 42
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p2, p0, Ll/jje0;->b:Ll/x0m;

    .line 51
    .line 52
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ah(Ll/x0m;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O5()V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/jje0;->b:Ll/x0m;

    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    invoke-interface {p0, p1}, Ll/x0m;->K(Z)V

    .line 66
    .line 67
    .line 68
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 69
    .line 70
    return-object p0
.end method

.method public final k(Lcom/p1/mobile/putong/core/data/SwipeDirection;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/jje0$a;->b:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p0, p1, :cond_2

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    if-eq p0, p1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq p0, p1, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    const-string p0, "left"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    const-string p0, "up"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    const-string p0, "right"

    .line 28
    .line 29
    return-object p0
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 2

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
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qt()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    new-instance v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    xor-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v1, "is_privileged"

    .line 25
    .line 26
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    const-string p1, "e_use_boost_button"

    .line 30
    .line 31
    const-string v1, "p_suggest_users_home_view"

    .line 32
    .line 33
    invoke-static {p1, v1, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/jje0;->c:Ll/y20;

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 39
    .line 40
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
