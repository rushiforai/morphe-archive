.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VIcon;

.field public c:Lv/VText_AutoFit;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

.field public f:Lcom/p1/mobile/putong/core/data/Coupon;

.field public g:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/x490;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/x490;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g:Ljava/lang/Runnable;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/x490;

    invoke-direct {p1, p0}, Ll/x490;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/x490;

    invoke-direct {p1, p0}, Ll/x490;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jn60;->e()Ljava/lang/Integer;

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
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jn60;->e()Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x4

    .line 20
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x2

    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, p1, p2, v0}, Ll/lib0;->t(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, p1, p2}, Ll/lib0;->x(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/s7a;->t()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/jn60;->d()Ll/gq60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/jn60;->d()Ll/gq60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/gq60;->d()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, p1, p2}, Ll/lib0;->y(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0, p1, p2}, Ll/lib0;->s(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/ndb0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->M()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/lib0;->C(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ndb0;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    if-ne p3, p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->M()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/lib0;->C(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->j(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->k()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/d590;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getAct()Lcom/p1/mobile/android/app/Act;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final h()V
    .locals 3

    .line 1
    invoke-static {}, Ll/s7a;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "lowPriceCustomerSVIP"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getCouponForPromotionNew(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Coupon;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "lowPriceCustomerVIP"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getCouponForPromotionNew(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Coupon;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 61
    .line 62
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->n()V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void

    .line 74
    :cond_3
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 75
    .line 76
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/hib0;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p2, p3, p4}, Ll/hib0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance v0, Ll/eib0;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1, p2, p3, p4}, Ll/eib0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->d:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-interface {v0, p3}, Ll/w3m;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ll/w3m;->register()V

    .line 40
    .line 41
    .line 42
    new-instance p3, Ll/y490;

    .line 43
    .line 44
    invoke-direct {p3, p0}, Ll/y490;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->I(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/z490;

    .line 51
    .line 52
    invoke-direct {p0, p1}, Ll/z490;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->G(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ll/a590;

    .line 59
    .line 60
    invoke-direct {p0, p1, p2, p4}, Ll/a590;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ndb0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->J(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->w()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->C:Lrx/subjects/a;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance p3, Ll/b590;

    .line 76
    .line 77
    invoke-direct {p3, p2}, Ll/b590;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p2, Ll/c590;

    .line 85
    .line 86
    invoke-direct {p2, p1, p4}, Ll/c590;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/ndb0;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Ll/lib0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0, p4}, Ll/lib0;->B(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Ll/lib0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Ll/lib0;->B(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final synthetic k()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->a:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->h()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->d:Ll/ndb0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ndb0;->b0()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    sget v1, Ll/dbc0;->bs:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->b:Lv/VIcon;

    .line 15
    .line 16
    sget v1, Ll/dbc0;->cs:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c:Lv/VText_AutoFit;

    .line 22
    .line 23
    const-string v1, "#6AA631"

    .line 24
    .line 25
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p1}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->a:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    sget v1, Ll/dbc0;->R7:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->b:Lv/VIcon;

    .line 47
    .line 48
    sget v1, Ll/dbc0;->S7:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c:Lv/VText_AutoFit;

    .line 54
    .line 55
    const-string v1, "#EA74C5"

    .line 56
    .line 57
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->a:Landroid/widget/LinearLayout;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    sget v0, Ll/dbc0;->Rl:I

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->b:Lv/VIcon;

    .line 79
    .line 80
    sget v1, Ll/dbc0;->Hr:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c:Lv/VText_AutoFit;

    .line 86
    .line 87
    const-string v1, "#E0DE9551"

    .line 88
    .line 89
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    sget v0, Ll/dbc0;->Cq:I

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->b:Lv/VIcon;

    .line 103
    .line 104
    sget v1, Ll/dbc0;->Dq:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c:Lv/VText_AutoFit;

    .line 110
    .line 111
    const-string v1, "#E0F27310"

    .line 112
    .line 113
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    .line 119
    .line 120
    :goto_0
    invoke-static {p1}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    const-string v1, "\u9650\u65f6\u7279\u60e0\uff0c\u652f\u4ed8\u7acb\u4eab\u4f18\u60e0"

    .line 125
    .line 126
    const-string v2, "\u9650\u65f6\u7279\u60e0\uff0c\u652f\u4ed8%.0f\u5143\u7acb\u4eab\u4f18\u60e0"

    .line 127
    .line 128
    if-eqz v0, :cond_4

    .line 129
    .line 130
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_6

    .line 135
    .line 136
    const-string p1, "lowPriceCustomerFemaleVIP"

    .line 137
    .line 138
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_3

    .line 143
    .line 144
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget v0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 149
    .line 150
    invoke-virtual {p1, p2, v0}, Ll/tab0;->l(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    goto :goto_1

    .line 155
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 156
    .line 157
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 158
    .line 159
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 160
    .line 161
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-static {v0, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    goto :goto_1

    .line 178
    :cond_4
    invoke-static {p1}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-eqz p1, :cond_5

    .line 183
    .line 184
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_6

    .line 189
    .line 190
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 191
    .line 192
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 193
    .line 194
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 195
    .line 196
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-static {v0, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    goto :goto_1

    .line 213
    :cond_5
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iget v0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 218
    .line 219
    invoke-virtual {p1, p2, v0}, Ll/tab0;->l(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    :cond_6
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c:Lv/VText_AutoFit;

    .line 224
    .line 225
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public final n()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-static {v1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->f:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 20
    .line 21
    invoke-static {v1}, Ll/g2f;->c(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 31
    .line 32
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    if-ne v3, v4, :cond_2

    .line 40
    .line 41
    const-string v3, "\u9996\u6708\u4f4e\u4ef7\uff0c\u4e13\u5c5e\u4f18\u60e0\uff0c"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 54
    .line 55
    const/4 v4, 0x6

    .line 56
    if-ne v3, v4, :cond_3

    .line 57
    .line 58
    const-string v3, "\u99966\u4e2a\u6708\u4f4e\u4ef7\uff0c\u4e13\u5c5e\u4f18\u60e0\uff0c"

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 65
    .line 66
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 71
    .line 72
    const/16 v4, 0xc

    .line 73
    .line 74
    if-ne v3, v4, :cond_4

    .line 75
    .line 76
    const-string v3, "\u9996\u5e74\u4f4e\u4ef7\uff0c\u4e13\u5c5e\u4f18\u60e0\uff0c"

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    const-string v3, "\u65b0\u5ba2\u4f18\u60e0\uff0c"

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v3, Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v3, "\u5230\u671f"

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->c:Lv/VText_AutoFit;

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v1, Ljava/lang/Boolean;

    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-eqz v1, :cond_5

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g:Ljava/lang/Runnable;

    .line 119
    .line 120
    const-wide/16 v1, 0x3e8

    .line 121
    .line 122
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 123
    .line 124
    .line 125
    :cond_5
    :goto_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/s7a;->t()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
