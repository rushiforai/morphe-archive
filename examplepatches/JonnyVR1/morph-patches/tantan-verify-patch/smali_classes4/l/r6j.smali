.class public Ll/r6j;
.super Ll/em2;
.source "SourceFile"


# static fields
.field public static final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x429a0000    # 77.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/r6j;->c:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r6j;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;

    .line 5
    .line 6
    if-eqz p3, :cond_1

    .line 7
    .line 8
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;

    .line 9
    .line 10
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 11
    .line 12
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p3, 0x0

    .line 33
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->f()Ll/t7m;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    new-instance p5, Ll/q6j;

    .line 38
    .line 39
    invoke-direct {p5, p1}, Ll/q6j;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2, p0, p3, p4, p5}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;->R(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;Ll/t7m;Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    const/high16 p0, 0x41800000    # 16.0f

    .line 5
    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget p0, Ll/r6j;->c:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    :goto_0
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 26
    .line 27
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    const/high16 p0, 0x42f00000    # 120.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    const/high16 p0, 0x42f00000    # 120.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/em2;->j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/qk4;->c()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlComplimentReceivedLayout;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string p1, "swipe"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/gp5;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->g()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_5

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    if-eqz p2, :cond_5

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 50
    .line 51
    if-eqz p2, :cond_5

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 58
    .line 59
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->type:Ljava/lang/String;

    .line 60
    .line 61
    const-string p3, "paid"

    .line 62
    .line 63
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_3

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    sget-object p2, Ll/qap;->Companion:Ll/qap$a;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p2, p1}, Ll/qap$a;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_4

    .line 81
    .line 82
    return p0

    .line 83
    :cond_4
    const/4 p0, 0x1

    .line 84
    :cond_5
    :goto_0
    return p0
.end method
