.class public final Ll/hd90;
.super Ll/y4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hd90$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 !2\u00020\u0001:\u0001\u000cB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J!\u0010\t\u001a\u0004\u0018\u00010\u00072\u000e\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0010J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0014R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0018\u0010 \u001a\u0004\u0018\u00010\u00078\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001f\u00a8\u0006\""
    }
    d2 = {
        "Ll/hd90;",
        "Ll/y4;",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;",
        "privilegeEntranceInfo",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;)V",
        "",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandises",
        "u",
        "(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;",
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
        "v",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;",
        "d",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;",
        "_top_view",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;",
        "e",
        "Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;",
        "_bottom_view",
        "f",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "lowPriceCallback3VIPMerchandise",
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
.field public static final Companion:Ll/hd90$a;
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
    new-instance v0, Ll/hd90$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/hd90$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/hd90;->Companion:Ll/hd90$a;

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

.method public static synthetic p(Ll/hd90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hd90;->w(Ll/hd90;Landroid/view/View;)V

    return-void
.end method

.method public static q(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 5
    .line 6
    const-string v0, "tttVip"

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic r(Ll/hd90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hd90;->x(Ll/hd90;Landroid/view/View;)V

    return-void
.end method

.method public static s(Lkotlin/jvm/functions/Function2;Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Number;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 10
    .line 11
    sub-int/2addr p0, p1

    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, -0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private final u(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/Merchandise;"
        }
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Ljava/util/Collection;

    .line 3
    .line 4
    if-eqz p0, :cond_2

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-ne p0, v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    new-instance p0, Ll/fd90;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/fd90;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/gd90;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/gd90;-><init>(Lkotlin/jvm/functions/Function2;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public static final w(Ll/hd90;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hd90;->h()Ljava/lang/String;

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

.method public static final x(Ll/hd90;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hd90;->v()Ljava/lang/String;

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
    const-string v1, "vip"

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
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y3()Ljava/lang/String;

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
    .locals 2

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/du80;->d(Z)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/util/Collection;

    .line 11
    .line 12
    new-instance v1, Ll/cd90;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/cd90;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-direct {p0, v0}, Ll/hd90;->u(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/hd90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
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
    iput-object v1, p0, Ll/hd90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

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
    iget-object v4, p0, Ll/hd90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

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
    iput-object v1, p0, Ll/hd90;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

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
    iget-object p0, p0, Ll/hd90;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

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
    const-string p0, "e_privilege_banner_viplowpricecallback"

    .line 2
    .line 3
    return-object p0
.end method

.method public m()V
    .locals 11

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
    iget-object v0, p0, Ll/hd90;->d:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceSingleTextView;

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
    new-instance v1, Ll/dd90;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/dd90;-><init>(Ll/hd90;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    :cond_0
    iget-object v0, p0, Ll/hd90;->e:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;

    .line 108
    .line 109
    if-eqz v0, :cond_4

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
    sget v3, Ll/jbc0;->Ka:I

    .line 129
    .line 130
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc()Lv/VText;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-string v3, "#FF9D5C36"

    .line 138
    .line 139
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc()Lv/VText;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    const v3, 0x3f666666    # 0.9f

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_desc()Lv/VText;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iget-object v3, p0, Ll/hd90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 161
    .line 162
    const/4 v4, 0x0

    .line 163
    if-eqz v3, :cond_1

    .line 164
    .line 165
    sget-object v5, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 166
    .line 167
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    invoke-virtual {p0}, Ll/y4;->g()Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView$a;->b()Ljava/text/NumberFormat;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    iget-object v7, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 180
    .line 181
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 182
    .line 183
    iget-wide v7, v7, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 184
    .line 185
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 186
    .line 187
    .line 188
    move-result-wide v9

    .line 189
    sub-double/2addr v7, v9

    .line 190
    invoke-virtual {v6, v7, v8}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    filled-new-array {v5, v3}, [Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    const/4 v5, 0x2

    .line 199
    invoke-static {v3, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    const-string v5, "%s\u5361\u7acb\u51cf%s\u5143"

    .line 204
    .line 205
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    goto :goto_0

    .line 210
    :cond_1
    move-object v3, v4

    .line 211
    :goto_0
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_promotion_tip()Lv/VText;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_buy_tip()Landroid/widget/TextView;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    const-string v2, "#E09D5C36"

    .line 226
    .line 227
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_buy_tip()Landroid/widget/TextView;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    sget-object v2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 239
    .line 240
    iget-object v2, p0, Ll/hd90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 241
    .line 242
    if-eqz v2, :cond_2

    .line 243
    .line 244
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 245
    .line 246
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    goto :goto_1

    .line 251
    :cond_2
    move-object v2, v4

    .line 252
    :goto_1
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    const/4 v3, 0x1

    .line 257
    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    const-string v3, "\u8d2d\u4e70%s\u4e2a\u6708\u4f1a\u5458"

    .line 262
    .line 263
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    sget v2, Ll/jbc0;->j3:I

    .line 275
    .line 276
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    const-string v2, "#9B4918"

    .line 284
    .line 285
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    const-string v2, "\u4f7f\u7528\u4f18\u60e0"

    .line 297
    .line 298
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntrancePromotionBottomView;->get_goto_buy()Lv/VText;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    new-instance v1, Ll/ed90;

    .line 306
    .line 307
    invoke-direct {v1, p0}, Ll/ed90;-><init>(Ll/hd90;)V

    .line 308
    .line 309
    .line 310
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 311
    .line 312
    .line 313
    iget-object p0, p0, Ll/hd90;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 314
    .line 315
    if-eqz p0, :cond_3

    .line 316
    .line 317
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 318
    .line 319
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    const-string v0, "m"

    .line 332
    .line 333
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    const-string v0, "duration"

    .line 341
    .line 342
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    const-string v0, "discount_type"

    .line 347
    .line 348
    const-string v1, "low_price_recall"

    .line 349
    .line 350
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    const-string v1, "productType"

    .line 355
    .line 356
    const-string v2, "vip"

    .line 357
    .line 358
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    filled-new-array {p0, v0, v1}, [Ll/pf60;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    const-string v0, "e_purchase_banner"

    .line 367
    .line 368
    const-string v1, "p_navigation_view"

    .line 369
    .line 370
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 371
    .line 372
    .line 373
    :cond_4
    return-void
.end method

.method public v()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "e_privilege_button_viplowpricecallback"

    .line 2
    .line 3
    return-object p0
.end method
