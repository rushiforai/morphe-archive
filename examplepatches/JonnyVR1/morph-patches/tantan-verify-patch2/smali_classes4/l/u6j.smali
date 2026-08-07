.class public Ll/u6j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;Landroid/content/Context;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->g:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_0

    .line 22
    .line 23
    sget p3, Lcom/p1/mobile/putong/core/R$string;->th:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget p3, Lcom/p1/mobile/putong/core/R$string;->uh:I

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {p3, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    const-string v0, "suggest-card"

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-interface {p1, p2, p3, v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p1, "p_suggest_users_home_view"

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p1, p2}, Ll/tvn;->a(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 62
    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->d8(Ljava/lang/String;)Lrx/c;

    .line 75
    .line 76
    .line 77
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->g2:Lrx/subjects/b;

    .line 82
    .line 83
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/u6j;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 2

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a(Z)V

    .line 12
    .line 13
    .line 14
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;

    .line 15
    .line 16
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 17
    .line 18
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->e:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 22
    .line 23
    new-instance p3, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;

    .line 24
    .line 25
    invoke-direct {p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string p4, "core_intl_living_card_entrance.svga"

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    invoke-virtual {p0, p4, v1, p3, v0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->f:Lv/VLinear;

    .line 35
    .line 36
    new-instance p3, Ll/t6j;

    .line 37
    .line 38
    invoke-direct {p3, p1, p2, p5}, Ll/t6j;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/d79;->m0()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_0

    .line 49
    .line 50
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->d:Lv/VFrame;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 57
    .line 58
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 65
    .line 66
    const/4 p3, 0x3

    .line 67
    invoke-virtual {p1, p3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 68
    .line 69
    .line 70
    iget-object p4, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 71
    .line 72
    invoke-virtual {p4}, Landroid/view/View;->getId()I

    .line 73
    .line 74
    .line 75
    move-result p4

    .line 76
    invoke-virtual {p0, p3, p4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 77
    .line 78
    .line 79
    sget p3, Ll/qa00;->q:I

    .line 80
    .line 81
    iput p3, p0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 82
    .line 83
    sget p3, Ll/qa00;->m:I

    .line 84
    .line 85
    iput p3, p1, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 86
    .line 87
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->d:Lv/VFrame;

    .line 88
    .line 89
    invoke-virtual {p3, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 6
    .line 7
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 8
    .line 9
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p2, 0x0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    return p2

    .line 35
    :cond_0
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return p2
.end method
