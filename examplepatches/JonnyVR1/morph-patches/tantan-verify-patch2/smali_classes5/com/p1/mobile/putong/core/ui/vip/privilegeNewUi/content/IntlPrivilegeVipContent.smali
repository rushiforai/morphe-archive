.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;
.super Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/gzo;
.implements Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;


# instance fields
.field public e:Ll/izo;

.field public f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

.field public g:Ll/t5m;

.field public h:Ll/q3p;

.field public final i:Ll/x80;

.field public final j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/szo;",
            ">;"
        }
    .end annotation
.end field

.field public k:[Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 10

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/x80;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/x80;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 27
    .line 28
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 31
    .line 32
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 35
    .line 36
    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 37
    .line 38
    filled-new-array/range {v0 .. v9}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->init()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 10
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    new-instance p1, Ll/x80;

    invoke-direct {p1}, Ll/x80;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 50
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    filled-new-array/range {v0 .. v9}, [Lcom/p1/mobile/putong/core/data/Privilege;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 10
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 53
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    new-instance p1, Ll/x80;

    invoke-direct {p1}, Ll/x80;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 55
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    filled-new-array/range {v0 .. v9}, [Lcom/p1/mobile/putong/core/data/Privilege;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->init()V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->P(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->R(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/v5b0;->y(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "lowPriceCustomerVIP"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    const-string v0, "tttVip"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "lowPrice3Month"

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->S()V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->Q(Ll/pf60;)V

    return-void
.end method

.method public static synthetic M(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private N(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/Merchandise;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/a6p;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/a6p;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    return-object p0
.end method

.method private synthetic P(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic Q(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->T(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, v0, Ll/q3p;->k:Z

    .line 12
    .line 13
    iput-boolean v1, v0, Ll/q3p;->l:Z

    .line 14
    .line 15
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/yap;->m()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v0, "tttVip"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ll/yap;->h(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    iput-boolean p1, p0, Ll/q3p;->k:Z

    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method private synthetic R(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->T(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic S()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private T(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Ll/q3p;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const/4 v6, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    move-object v3, p1

    .line 20
    invoke-direct/range {v1 .. v6}, Ll/q3p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/q3p;->j()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p1, Ll/q3p;->g:Z

    .line 32
    .line 33
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->N(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, p1, Ll/q3p;->h:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->e:Ll/izo;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Ll/y5p;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Ll/y5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 60
    .line 61
    iget-object p0, p0, Ll/q3p;->f:Lrx/subjects/b;

    .line 62
    .line 63
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method private U()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->W()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Lcom/p1/mobile/putong/core/R$string;->lt:I

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, ""

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListTitle$a$a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 44
    .line 45
    array-length v1, v0

    .line 46
    :goto_0
    if-ge v4, v1, :cond_3

    .line 47
    .line 48
    aget-object v2, v0, v4

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->o()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_1

    .line 55
    .line 56
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    if-ne v2, v3, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    if-ne v2, v3, :cond_2

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-static {v2, v3}, Ll/ezo;->a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;)V

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v1}, Ll/ezo;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/mcg0;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-static {v1, v2, v5}, Ll/ezo;->b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->e:Ll/izo;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {v0, p0}, Ll/izo;->G(Ljava/util/ArrayList;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private W()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->h:Ll/q3p;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private init()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public O(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/q5p;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/q5p;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/s5p;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/s5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {}, Ll/d79;->X()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/yap;->n()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ll/u2p;

    .line 62
    .line 63
    invoke-direct {v2}, Ll/u2p;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/u5p;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/u5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;->G(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    new-instance v1, Ll/w5p;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/w5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;->G(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/izo;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->g:Ll/t5m;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1, p0}, Ll/izo;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ll/t5m;Ll/gzo;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->e:Ll/izo;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->U()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    sget-object p0, Ll/wl40;->E:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()V
    .locals 0

    .line 1
    return-void
.end method

.method public y(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V
    .locals 3

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 2
    .line 3
    new-instance v0, Ll/wl40;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v0, v1, v2}, Ll/wl40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->g:Ll/t5m;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ll/t5m;->c(Ll/x80;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->V(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeVipContent;->O(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
