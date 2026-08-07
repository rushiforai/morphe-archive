.class public final Ll/sb90;
.super Ll/y4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sb90$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u001d2\u00020\u0001:\u0001\u0007B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u000f\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u000fR\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u0018\u0010\u001c\u001a\u0004\u0018\u00010\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/sb90;",
        "Ll/y4;",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "privilegeEntranceInfo",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V",
        "",
        "a",
        "()Z",
        "",
        "b",
        "()V",
        "m",
        "",
        "h",
        "()Ljava/lang/String;",
        "r",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;",
        "d",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;",
        "_top_view",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;",
        "e",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;",
        "_bottom_view",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "f",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandise",
        "Companion",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/sb90$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/data/Merchandise;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/sb90$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/sb90$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/sb90;->Companion:Ll/sb90$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/y4;-><init>(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p(Ll/sb90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sb90;->s(Ll/sb90;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/sb90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/sb90;->t(Ll/sb90;Landroid/view/View;)V

    return-void
.end method

.method public static final s(Ll/sb90;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/sb90;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/y4;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/cs20;->a()Ll/cs20;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/cs20;->f()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ie()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/y4;->o(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y3()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/y4;->o(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static final t(Ll/sb90;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/sb90;->r()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/y4;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string p1, "purchaseShowFrom"

    .line 13
    .line 14
    const-string v0, "p_navigation,privilege_button"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "productType"

    .line 21
    .line 22
    const-string v1, "svip"

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "e_purchase_button"

    .line 33
    .line 34
    const-string v1, "p_navigation_view"

    .line 35
    .line 36
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ie()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/y4;->o(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/s7a;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Ll/dk90;->i()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->f4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 24
    .line 25
    const-string v2, "svip"

    .line 26
    .line 27
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 44
    .line 45
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_3

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 68
    .line 69
    const-string v3, "lowPriceCustomerSVIP"

    .line 70
    .line 71
    invoke-static {v2, v3}, Ll/v5b0;->l(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const/4 v4, 0x1

    .line 76
    if-eqz v3, :cond_2

    .line 77
    .line 78
    iput-object v2, p0, Ll/sb90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 79
    .line 80
    return v4

    .line 81
    :cond_2
    const-string v3, "lowPriceCustomerUpliftSVIP"

    .line 82
    .line 83
    invoke-static {v2, v3}, Ll/v5b0;->l(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_1

    .line 88
    .line 89
    iput-object v2, p0, Ll/sb90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 90
    .line 91
    return v4

    .line 92
    :cond_3
    return v1
.end method

.method public b()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->b()Ljava/text/NumberFormat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x5

    .line 14
    invoke-static {v0}, Ll/txq;->c(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object v3, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;->SINGLE_TEXT_VIEW:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;

    .line 35
    .line 36
    invoke-virtual {p0, v1, v2, v3}, Ll/y4;->i(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;)Ll/n3m;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

    .line 41
    .line 42
    iput-object v1, p0, Ll/sb90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

    .line 43
    .line 44
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 45
    .line 46
    const/16 v2, 0x2f

    .line 47
    .line 48
    invoke-static {v2}, Ll/txq;->c(I)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const/4 v3, -0x1

    .line 53
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 54
    .line 55
    .line 56
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 57
    .line 58
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 59
    .line 60
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 61
    .line 62
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v4, p0, Ll/sb90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

    .line 73
    .line 74
    invoke-virtual {v2, v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget-object v4, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;->PROMOTION_BOTTOM_VIEW:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;

    .line 94
    .line 95
    invoke-virtual {p0, v1, v2, v4}, Ll/y4;->i(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeViewType;)Ll/n3m;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

    .line 100
    .line 101
    iput-object v1, p0, Ll/sb90;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

    .line 102
    .line 103
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 104
    .line 105
    const/16 v2, 0x4c

    .line 106
    .line 107
    invoke-static {v2}, Ll/txq;->c(I)I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 112
    .line 113
    .line 114
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 115
    .line 116
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 117
    .line 118
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object p0, p0, Ll/sb90;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

    .line 129
    .line 130
    invoke-virtual {v0, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public h()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "e_privilege_banner_sviplowpricecustomer"

    .line 2
    .line 3
    return-object p0
.end method

.method public m()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/y4;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->c()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/jbc0;->Ca:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/sb90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget v1, Ll/jbc0;->l3:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;->get_texture()Lv/VImage;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v2, Ll/jbc0;->i6:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;->get_title()Lv/VText;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget v3, Ll/h9c0;->r:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;->get_title()Lv/VText;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v2, "\u6211\u7684\u7279\u6743"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;->get_title()Lv/VText;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/4 v2, 0x3

    .line 70
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;->get_go()Lv/VImage;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "#7C4708"

    .line 82
    .line 83
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;->get_go()Lv/VImage;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/jbc0;->va:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 97
    .line 98
    .line 99
    new-instance v1, Ll/qb90;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/qb90;-><init>(Ll/sb90;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    :cond_0
    iget-object v0, p0, Ll/sb90;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

    .line 108
    .line 109
    if-eqz v0, :cond_5

    .line 110
    .line 111
    sget v1, Ll/jbc0;->Ea:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc_left()Lv/VText;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const/4 v2, 0x0

    .line 121
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_icon()Lv/VImage;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    sget v2, Ll/jbc0;->Ia:I

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc()Lv/VText;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-string v2, "#FF9D5C36"

    .line 138
    .line 139
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc()Lv/VText;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    const v2, 0x3f666666    # 0.9f

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc()Lv/VText;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iget-object v2, p0, Ll/sb90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 161
    .line 162
    const/4 v3, 0x0

    .line 163
    if-eqz v2, :cond_2

    .line 164
    .line 165
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    const/4 v5, 0x2

    .line 170
    if-eqz v4, :cond_1

    .line 171
    .line 172
    sget-object v4, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 173
    .line 174
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->b()Ljava/text/NumberFormat;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 187
    .line 188
    .line 189
    move-result-wide v7

    .line 190
    invoke-virtual {v6, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    filled-new-array {v4, v2}, [Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-static {v2, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    const-string v4, "%s%s\u5143"

    .line 203
    .line 204
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    goto :goto_0

    .line 209
    :cond_1
    sget-object v4, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 210
    .line 211
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 216
    .line 217
    .line 218
    move-result-object v6

    .line 219
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->b()Ljava/text/NumberFormat;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 224
    .line 225
    .line 226
    move-result-wide v7

    .line 227
    invoke-virtual {v6, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    filled-new-array {v4, v2}, [Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-static {v2, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    const-string v4, "\u9996%s%s\u5143"

    .line 240
    .line 241
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    goto :goto_0

    .line 246
    :cond_2
    move-object v2, v3

    .line 247
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_tip()Lv/VText;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    sget v2, Ll/jbc0;->Fa:I

    .line 255
    .line 256
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_tip()Lv/VText;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    const-string v2, "\u65b0\u5ba2\u4f18\u60e0"

    .line 264
    .line 265
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_tip()Lv/VText;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    const/4 v2, 0x1

    .line 273
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_buy_tip()Landroid/widget/TextView;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    const-string v4, "#E09D5C36"

    .line 281
    .line 282
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    move-result v4

    .line 286
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_buy_tip()Landroid/widget/TextView;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    sget-object v4, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 294
    .line 295
    iget-object v4, p0, Ll/sb90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 296
    .line 297
    if-eqz v4, :cond_3

    .line 298
    .line 299
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 300
    .line 301
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    goto :goto_1

    .line 306
    :cond_3
    move-object v4, v3

    .line 307
    :goto_1
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    invoke-static {v4, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    const-string v4, "\u8d2d\u4e70%s\u4e2a\u6708\u4f1a\u5458"

    .line 316
    .line 317
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    sget v2, Ll/jbc0;->j3:I

    .line 329
    .line 330
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    const-string v2, "#9B4918"

    .line 338
    .line 339
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 340
    .line 341
    .line 342
    move-result v2

    .line 343
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    const-string v2, "\u7acb\u5373\u89e3\u9501"

    .line 351
    .line 352
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    .line 354
    .line 355
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    new-instance v1, Ll/rb90;

    .line 360
    .line 361
    invoke-direct {v1, p0}, Ll/rb90;-><init>(Ll/sb90;)V

    .line 362
    .line 363
    .line 364
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 365
    .line 366
    .line 367
    iget-object p0, p0, Ll/sb90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 368
    .line 369
    if-eqz p0, :cond_4

    .line 370
    .line 371
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 372
    .line 373
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 378
    .line 379
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 380
    .line 381
    .line 382
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    const-string v0, "m"

    .line 386
    .line 387
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    const-string v0, "duration"

    .line 395
    .line 396
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 397
    .line 398
    .line 399
    move-result-object p0

    .line 400
    const-string v0, "discount_type"

    .line 401
    .line 402
    const-string v1, "new_customer"

    .line 403
    .line 404
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    const-string v1, "productType"

    .line 409
    .line 410
    const-string v2, "svip"

    .line 411
    .line 412
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    filled-new-array {p0, v0, v1}, [Ll/pf60;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    const-string v0, "e_purchase_banner"

    .line 421
    .line 422
    const-string v1, "p_navigation_view"

    .line 423
    .line 424
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 425
    .line 426
    .line 427
    :cond_5
    return-void
.end method

.method public r()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "e_privilege_button_sviplowpricecustomer"

    .line 2
    .line 3
    return-object p0
.end method
