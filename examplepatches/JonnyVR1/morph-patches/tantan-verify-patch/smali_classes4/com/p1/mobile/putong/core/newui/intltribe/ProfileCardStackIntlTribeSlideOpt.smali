.class public Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;
.super Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;
.source "SourceFile"

# interfaces
.implements Ll/f1g0;
.implements Ll/pn4;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;",
        "Ll/f1g0<",
        "Landroid/view/View;",
        "Ll/s740;",
        ">;",
        "Ll/pn4;"
    }
.end annotation


# instance fields
.field public f:Ll/dq90;

.field public g:Ll/px2;

.field public h:Ll/pl50;

.field public i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

.field public j:Ll/uxl0;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/xql;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/fqj0;

.field public m:Ll/pkp;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->k:Ll/y20;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->B()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->k:Ll/y20;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->B()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/uxl0;Ll/pkp;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->k:Ll/y20;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->j:Ll/uxl0;

    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->m:Ll/pkp;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->B()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private B()V
    .locals 2

    .line 1
    new-instance v0, Ll/vfp;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/vfp;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/ox2;->l0(Ll/pn4;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt$a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/ox2;->k0(Ll/dn4;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private C(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->l:Ll/fqj0;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->l:Ll/fqj0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p2, p0, p1}, Ll/fqj0;->j(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt$c;->c:[I

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    aget p1, v1, p1

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    if-eq p1, v1, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    if-eq p1, v1, :cond_2

    .line 40
    .line 41
    const/4 v1, 0x3

    .line 42
    if-eq p1, v1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 49
    .line 50
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 51
    .line 52
    invoke-virtual {p0, v0, p2}, Ll/px2;->A0(Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Z

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->C(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->a()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public c(Z)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ox2;->G()Ll/txl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, v0, Ll/txl0;->a:Landroid/view/View;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 17
    .line 18
    const-string v0, "get top "

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ox2;->Y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    neg-float p2, p1

    .line 8
    :goto_0
    const/high16 p1, -0x40800000    # -1.0f

    .line 9
    .line 10
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/high16 p2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    cmpl-float p2, p3, v0

    .line 25
    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_1
    if-nez p2, :cond_2

    .line 32
    .line 33
    move p3, p1

    .line 34
    :cond_2
    invoke-interface {p0, v0, p3, p4}, Lcom/p1/mobile/putong/core/card/VSwipeStack$c;->b(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    return-void
.end method

.method public e(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Ll/pl50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->h:Ll/pl50;

    .line 2
    .line 3
    return-void
.end method

.method public getMeasuredHeightProxy()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getMeasuredWidthProxy()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getRenderView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getUsHomeCardAnimHelper()Ll/fqj0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public i(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/xql;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->k:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public j()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ll/lql;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/lql;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/lql;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public k(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;FZ)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt$c;->c:[I

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    aget p2, v1, p2

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p2, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq p2, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq p2, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 25
    .line 26
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0, p3, p4}, Ll/mx2;->B0(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public l()Ll/ik4;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ox2;->w()Ll/txl0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/txl0;->a:Landroid/view/View;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object p0, v1

    .line 18
    :goto_0
    instance-of v0, p0, Ll/kql;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p0, Ll/kql;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kql;->getCardData()Ll/ik4;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    return-object v1
.end method

.method public m()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->getContentView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;->H0(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public o()Ll/ik4;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ll/kql;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/kql;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kql;->getCardData()Ll/ik4;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public p(Lcom/p1/mobile/putong/core/card/VSwipeStack$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->i:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

    .line 2
    .line 3
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->C(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public bridge synthetic setAdapter(Ljava/lang/Object;)V
    .locals 0

    .line 33
    check-cast p1, Ll/s740;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->setAdapter(Ll/s740;)V

    return-void
.end method

.method public setAdapter(Ll/s740;)V
    .locals 3

    .line 1
    new-instance v0, Ll/dq90;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->j:Ll/uxl0;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->m:Ll/pkp;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, v1, v2}, Ll/dq90;-><init>(Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;Ll/s740;Ll/uxl0;Ll/pkp;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->f:Ll/dq90;

    .line 11
    .line 12
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt$b;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/dq90;->z(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->f:Ll/dq90;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/ox2;->i0(Ll/nx2;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->g:Ll/px2;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->setRenderManager(Ll/px2;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setAllowUpSwipe(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic setSuperLikeBtnVisible(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/r2j0;->setSuperLikeBtnVisible(Z)V

    return-void
.end method

.method public setUsHomeCardAnimHelper(Ll/fqj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->l:Ll/fqj0;

    .line 2
    .line 3
    return-void
.end method

.method public setUsHomeExpandCardAnimHelper(Ll/hqj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->d()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->l:Ll/fqj0;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/ProfileCardStackIntlTribeSlideOpt;->l:Ll/fqj0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/fqj0;->k(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->w()V

    .line 32
    .line 33
    .line 34
    return-void
.end method
