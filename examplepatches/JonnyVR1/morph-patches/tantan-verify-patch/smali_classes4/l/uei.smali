.class public Ll/uei;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;

.field public c:Ljava/lang/Boolean;


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
    iput-object v0, p0, Ll/uei;->c:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object p1, p0, Ll/uei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/sxl0;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

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
    sget p0, Ll/kec0;->n3:I

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
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Ll/uei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

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
    iget-object p2, p0, Ll/uei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

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
    iget-object p2, p0, Ll/uei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 24
    .line 25
    .line 26
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;

    .line 31
    .line 32
    iput-object p1, p0, Ll/uei;->b:Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;

    .line 33
    .line 34
    iget-object p2, p0, Ll/uei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 35
    .line 36
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/core/newui/femalevip/FemaleVipGuideCardView;->f(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Ll/uei;)V

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
    .locals 4

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/xei;->c()Ll/xei;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/xei;->i()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    :cond_1
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_2
    const/4 v0, 0x0

    .line 22
    :goto_0
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v1, p0, Ll/uei;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "p_home,femalevip_card"

    .line 31
    .line 32
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/c;->V(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object v1, p0, Ll/uei;->c:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_6

    .line 44
    .line 45
    if-eqz v0, :cond_5

    .line 46
    .line 47
    if-ne p1, p2, :cond_4

    .line 48
    .line 49
    const-string p1, "right"

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_4
    const-string p1, "up"

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_5
    const-string p1, "left"

    .line 56
    .line 57
    :goto_1
    const-string p2, "swipe_directions"

    .line 58
    .line 59
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    filled-new-array {p1}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string p2, "e_card_femalevip"

    .line 68
    .line 69
    const-string v0, "p_suggest_users_home_view"

    .line 70
    .line 71
    invoke-static {p2, v0, p1}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    :cond_6
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    iput-object p1, p0, Ll/uei;->c:Ljava/lang/Boolean;

    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 79
    .line 80
    return-object p0
.end method
