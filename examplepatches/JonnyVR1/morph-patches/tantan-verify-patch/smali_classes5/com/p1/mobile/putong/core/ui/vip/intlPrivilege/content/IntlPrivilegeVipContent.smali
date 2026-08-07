.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;
.super Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/hzo;
.implements Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b$a;


# instance fields
.field public e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

.field public f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

.field public g:Ll/t5m;

.field public h:Ll/r3p;

.field public final i:Ll/x80;

.field public final j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/tzo;",
            ">;"
        }
    .end annotation
.end field

.field public k:[Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 10

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->init()V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    new-instance p1, Ll/x80;

    invoke-direct {p1}, Ll/x80;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 50
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->init()V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    new-instance p1, Ll/x80;

    invoke-direct {p1}, Ll/x80;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 55
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->k:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->init()V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->R(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->S()V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->Q(Ll/pf60;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->P(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic M(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
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
    const-string v0, "vip"

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
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->T(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, v0, Ll/r3p;->k:Z

    .line 12
    .line 13
    iput-boolean v1, v0, Ll/r3p;->l:Z

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
    const-string v0, "vip"

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    iput-boolean p1, p0, Ll/r3p;->k:Z

    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method private synthetic R(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->T(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

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
    new-instance v1, Ll/r3p;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    invoke-direct/range {v1 .. v6}, Ll/r3p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/r3p;->j()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p1, Ll/r3p;->g:Z

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->N(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, p1, Ll/r3p;->h:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Ll/z5p;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Ll/z5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 60
    .line 61
    iget-object p0, p0, Ll/r3p;->f:Lrx/subjects/b;

    .line 62
    .line 63
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->W()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a$a;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a$a;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1}, Ll/fzo;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeSubscriptionItem$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/d79;->a0()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-static {v1, v2, v3}, Ll/fzo;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->j:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;->G(Ljava/util/ArrayList;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private W()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->h:Ll/r3p;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
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
.method public final N(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;
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
    new-instance p0, Ll/b6p;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/b6p;-><init>()V

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

.method public O(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/r5p;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/r5p;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/t5p;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/t5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Ll/d79;->X()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Ll/yap;->n()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    new-instance v2, Ll/u2p;

    .line 69
    .line 70
    invoke-direct {v2}, Ll/u2p;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/v5p;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/v5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->G(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    new-instance v1, Ll/x5p;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/x5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->G(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final synthetic S()V
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

.method public V(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
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
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->g:Ll/t5m;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/t5m;Ll/hzo;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->U()V

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

.method public f(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
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

.method public z(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "form_sub"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2, v3}, Ll/wl40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->g:Ll/t5m;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->i:Ll/x80;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ll/t5m;->c(Ll/x80;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->V(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeVipContent;->O(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
